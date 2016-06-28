<?PHP

if ($_GET['user_id']){
    $user_id = intval($_GET['user_id']);
}


$mysqli = new mysqli('localhost', 'LTRobot', 'JuvzF6jzQl');
$mysqli->select_db('landtrendr2') or die($mysqli->error);



#Read Interpreters and build <option/> list
$rs = $mysqli->query("SELECT DISTINCT user_id, interpreter, user_name, first_name, last_name
        FROM change_process as c, interpreter as i
        WHERE c.interpreter = i.user_id
        ORDER BY user_name")
    or die($mysqli->error);
    
list($data, $m) = get_interpreter_data(0, $mysqli);
$alpha_all = krippendorff($data, $m);

while($r = $rs->fetch_assoc()) {
    $user_id = $r['user_id'];
    list($data, $m) = get_interpreter_data($user_id, $mysqli);

    if(count($data) > 1){
        $alpha = krippendorff($data, $m);
            
        for($i=0; $i<3; $i++)
            $alpha_boot[$i] = krippendorff($data, $m, true);
        $s = stdev($alpha_boot);
        $out .= sprintf("<tr><td>%s</td><td>%0.3f</td><td>%0.3f</td><td>(%0.3f, %0.3f)</td></tr>\n", $r['user_name'], $alpha_all-$alpha, $alpha, $alpha-2*$s, $alpha+2*$s);

    }
}    
    
    
# Read Data from MySQL
function get_interpreter_data($user_id, $mysqli) {

    $rs = $mysqli->query("SELECT plotid, count(interpreter) as m FROM change_process GROUP BY plotid") or die($mysqli->error);
    while($r = $rs->fetch_assoc())
        $m[$r['plotid']] = $r['m']-1;

    $user_SQL = ($user_id) ? "AND a.interpreter <> $user_id AND b.interpreter <> $user_id" : '';
    $rs = $mysqli->query("SELECT a.plotid, a.process as C1, b.process as C2, count(a.interpreter) as cnt
            FROM change_process as a, change_process as b
            WHERE a.plotid = b.plotid
                AND a.process_id <> b.process_id
                $user_SQL
            GROUP BY plotid, a.process, b.process")
        or die($mysqli->error);
        
    while($r = $rs->fetch_assoc())
        if($m[$r['plotid']]) $data[] = $r;
   
   
    $out[0] = $data;
    $out[1] = $m;
    return $out;
}
   
   
   
    
function stdev($x) {
    $m = array_sum($x)/count($x);
    $v = 0;
    foreach($x as $i) $v += ($i-$m)*($i-$m);
    return sqrt($v)/(count($x)-1);
}
    
    
function krippendorff($data, $counts, $bootstrap=false) {
    
    $len_data = count($data);
    for($i=0; $i<$len_data; $i++){
        $r = $bootstrap ? $data[rand(0, $len_data-1)] : $data[$i];
        $o[$r['C1']][$r['C2']] += $r['cnt'] / $counts[$r['plotid']];
    }

    $N=0;
    foreach($o as $k1=>$v) {
        $n[$k1] = 0;
        foreach($v as $k2=>$c)
            $n[$k1] += $c;
        $N += $n[$k1];
    }

    $Do = 0; $De = 0;
    foreach($o as $k1=>$v)
        foreach($v as $k2=>$c)
            if($k1 != $k2){
                $Do += $o[$k1][$k2];
                $De += $n[$k1]*$n[$k2] / ($N-1);
            }
    $alpha = 1-$Do/$De;
    return $alpha;
}
    
?>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
  // Load the Visualization API library and the piechart library.
  google.load('visualization', '1.0', {'packages':['corechart']});
  google.setOnLoadCallback(drawChart);

function drawChart() {

}
</script>

<style>
#frame {width:400px; margin:0 auto;}
td {text-align:center;}
</style>

<div id="frame">
<p>Overall Agreement: alpha=<?=sprintf("%0.3f", $alpha_all)?></p>
<table>
<tr><th>Interpreter</th><th>Contribution</th><th>K-Alpha</th><th>Range Est.</th></tr>
<?=$out?>
</table>
</div>