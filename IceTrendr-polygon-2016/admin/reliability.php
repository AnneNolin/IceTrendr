<?PHP

if ($_GET['user_id']){
    $user_id = intval($_GET['user_id']);
}

$mysqli = new mysqli('localhost', 'LTRobot', 'JuvzF6jzQl', 'landtrendr2');

$interpreters = is_array($_GET['users']) ?  $_GET['users'] : array($_GET['users']);
$interpreters = array_map("intval", $interpreters);
$user_list = implode($interpreters, ',');

$rs = $mysqli->query("SELECT DISTINCT interpreter, user_name FROM change_process as c, interpreter as i WHERE c.interpreter = i.user_id AND interpreter in ($user_list)")
    or die($mysqli->error);
while($r=$rs->fetch_assoc()) $users[] = $r;

$projects = is_array($_GET['projects']) ?  $_GET['projects'] : array($_GET['projects']);
$projects = array_map("intval", $projects);
$projects_list = implode($projects, ',');


for($i=0; $i<count($users); $i++) {
    list($confusion, $p, $tot, $confidence) = get_interpreter_data($users[$i]['interpreter'], $projects_list, $mysqli);
  
    foreach($confusion as $k=>$v){
        $v[$k]++;
        $gd_confusion[$k][$i] .= $v[$k]/array_sum($v);
    }   
    
    foreach($confidence as $k=>$v){
        $gd_confidence[$k][$i] .= $v[0]/$v[1];
    }
    
    $user_name =  $users[$i]['user_name'];
    $overall_stats .= sprintf('<tr><td>%s</td><td>%0.1f%%</td><td>%d</td></tr>', $user_name,100*$p, $tot);
    $graph_cols .= "data.addColumn('number', '$user_name');\n";
  
}

if(count($gd_confusion) > 0) {
    ksort($gd_confusion);
    foreach($gd_confusion as $k=>$v){
        if($k) {
            $series = '';
            for($i=0; $i<count($interpreters); $i++) {
                $series .= sprintf(",%0.2f", 100*$v[$i]);
            }
            $confusion_data .= "['$k' $series],\n";
        }
    } $confusion_data= substr($confusion_data, 0,-2);
      
    ksort($gd_confidence);
    $confidence_text = array(1=>'Very Low', 2=>'Low', 3=>'Med. Low',  4=>'Medium', 5=>'Med. High', 6=>'High', 7=>'Very High');
    for($j=1;$j<8;$j++){
        $v = $gd_confidence[$j];
        $series = '';
        for($i=0; $i<count($interpreters); $i++) {
            $s = $v[$i] ? sprintf("%0.2f", 100*$v[$i]) : 'null';
            $series .= ",$s";
        }
        $confidence_data .= "['{$confidence_text[$j]}' $series],\n";
    }
    $confidence_data= substr($confidence_data, 0,-2);
  
}
    
# Read Data from MySQL
function get_interpreter_data($user_id, $projects_list, $mysqli) {

    $projects_SQL = ($projects_list) ? " AND project_id IN ($projects_list)" : '';
    $rs = $mysqli->query("
            SELECT concat(tsa,plotid) as id, change_process.* FROM change_process
            WHERE plotid IN (SELECT plotid FROM change_process WHERE interpreter = $user_id $projects_SQL)
            ORDER BY tsa, plotid, process 
        ")
        or die($mysqli->error);
        
        
    $cval = array('Low'=>1, 'Medium'=>2, 'High'=>3, 'N/A'=>2, 'null'=>2, ''=>2);
    $r = $rs->fetch_assoc();

    $P = array();
    $C = array();
    $votes = array();
    while($r){
    
        $certainty = $cval[$r['shape']] + $cval[$r['context']] + $cval[$r['trajectory']];
            
        $certainty = ($certainty+1)/10;
        if($user_id == $r['interpreter']) {
            $resp = $r['process'];
            $conf = $certainty;
        } else {
            $votes[$r['process']] += $certainty;
        }
        
        $last_id = $r['id'];
        $r = $rs->fetch_assoc();
    
        if($last_id != $r['id']) {
            $s = array_sum($votes);
            #if (is_infinite($s))
            
            if($resp && $s>0) {
                $total+=$conf;
                
                foreach($votes as $k=>$v){
                   $P[$resp][$k] += $v/$s *$conf;
                    $C[$conf*10-3][0] += $v;
                    $C[$conf*10-3][1] += $s;
                    #$C["$r[shape]$r[context]$r[trajectory]"][$k] += $v/$s;
                }
                $votes = array();
            }
        }
    }
    
    
    foreach($P as $k=>$v) {
        $correct += $v[$k];
    }
    
    return array($P, $correct/($total+1e-8), $total, $C);
}
   
?>

<!DOCTYPE html>

<link rel="stylesheet" type="text/css" href="reports.css" />
<style>
.chart {width:1000px; margin:10px auto; }
</style>


<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
    // Load the Visualization API library and the piechart library.
    google.load('visualization', '1.0', {'packages':['corechart']});
    google.setOnLoadCallback(drawConfusionChart);
    google.setOnLoadCallback(drawConfidenceChart);
    function drawConfusionChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Process');
        <?=$graph_cols?>
        data.addRows([
            <?=$confusion_data?>
        ]);

        var options = {'title':'Percent Agree with Others by Process',
                        width:1000,
                        height:400};
        
        var chart = new google.visualization.ColumnChart(document.getElementById("confusion_chart"));
        chart.draw(data, options);
    }
    
    function drawConfidenceChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Process');
        <?=$graph_cols?>
        data.addRows([
            <?=$confidence_data?>
        ]);

        var options = {'title':'Percent Agree with Others by Confidence',
                        width:1000,
                        height:500};
        
        var chart = new google.visualization.LineChart(document.getElementById("confidence_chart"));
        chart.draw(data, options);
    }
    
    
</script>


<div id="frame">
<form >
<fieldset class="col"><legend>Select Projects</legend>
<? include('projects_fieldset.php'); ?>
</fieldset>

<fieldset class="col"><legend>Select Interpreters</legend>
<? include('users_fieldset.php'); ?>
</fieldset>

<br style="clear:both"/>

<input type="submit" value="Get Data"/>
</form>

<br>

<table style="width:400px; text-align:center;">
<tr><th>Interpreter</th><th>Overall Aggreement</th><th>Total</th></tr>
<?=$overall_stats?>
</table>
</div>

<div id="confusion_chart" class="chart"></div>
<div id="confidence_chart" class="chart"></div>