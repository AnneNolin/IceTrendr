<?PHP
$mysqli = new mysqli('localhost', 'LTRobot', 'JuvzF6jzQl', 'landtrendr2');

$proj_id = intval($_GET['project_id']);
if ($proj_id == 0) $proj_id = 1;
$interpreters = $_GET['users'];
if($interpreters == 0) $interpreters = array(); 
if(!is_array($interpreters)) $interpreters = array($interpreters);
$interpreters = array_map("intval", $interpreters);


#Read Projects and build <option/> list
$cs = $mysqli->query("SELECT * FROM projects");
while($c = $cs->fetch_assoc()) {
    $selected = ($c['project_id'] == $proj_id) ? 'selected' : '';
    $projects .= "<option value=\"$c[project_id]\" $selected>$c[project_code] ($c[project_id]): $c[project_name]</option>\n";
}

#Read Interpreters and build <option/> list
$is = $mysqli->query("SELECT DISTINCT user_id, interpreter, user_name, first_name, last_name
        FROM change_process as c, interpreter as i
        WHERE c.interpreter = i.user_id
        ORDER BY user_name")
    or die($mysqli->error);

while($i = $is->fetch_assoc()) {
    $selected = in_array($i['user_id'], $interpreters) ? 'checked' : '';
    $users .= "<label><input type=\"checkbox\" name=\"users[]\" value=\"$i[user_id]\" $selected /> 
            $i[user_name] - $i[first_name] $i[last_name]</label>\n";
}


#Get Plots in Project
$proj_SQL = ($proj_id > 0) ? "AND project_id = $proj_id" : '';
$user_list = implode(',',$interpreters);
if ($interpreters) {
    if($_GET['show_all']=='on')
        $user_SQL = "AND plotid IN (SELECT DISTINCT plotid FROM change_process WHERE interpreter IN ($user_list) $proj_SQL)";    
    else
        $user_SQL = "AND interpreter IN($user_list)";
} else {
    $user_SQL = '';
}

$rs = $mysqli->query("SELECT change_process.*, user_name
        FROM change_process, interpreter
        WHERE change_process.interpreter = interpreter.user_id 
            AND iscomplete $proj_SQL $user_SQL
        ORDER BY tsa, plotid")
    or die($mysqli->error);

$agree_cnt=0;
$dis_cnt = 0;
$out = '';
$processes = array();
$last_plot = '';

$r = $rs->fetch_assoc();
while($r) {
    $processes[] = $r['process'];

    if($out=='') {
        $out = "<tr><td>$r[tsa]-$r[plotid]</td>";
    } else {
        $out .= "<tr><td></td>";
    }
    $out .= "<td>$r[user_name]</td>
        <td class=\"confidence\"><span class=$r[shape]>S</span>
                                <span class=$r[context]>C</span>
                                <span class=$r[trajectory]>T</span></td>
        <td>$r[process]</td><td>$r[comments]</td></tr>";
        
    $last_plot = $r['plotid'];
    $r = $rs->fetch_assoc();
    
    if($r['plotid'] != $last_plot) {    
        $uprocess = array_unique($processes);
        if(count($uprocess) == 1) {
            $agree_cnt++;
            $agree .= "<tbody class=\"agree\">$out</tbody>\n";
        }else {
            $dis_cnt++;
            $disag .= "<tbody class=\"disagree\">$out</tbody>\n";
        }    
        $out = '';
        $processes = array();        
    }
}

?>

<link rel="stylesheet" type="text/css" href="reports.css" />

<div id="frame">

<form>
    <fieldset>
    <legend>Select Project</legend>
    <select name="project_id">
        <option value="-1">All Projects</option>
        <?=$projects?>
    </select>
    <input type="submit" value="Get Data" />
    </fieldset>
    
    <fieldset id="users">
    <legend>Restrict Users 
       (or <a href="#" onclick="javascipt:deselect('users[]');return false;">select none</a> for All)</legend>
    <?=$users?>
    </fieldset>
    
    <fieldset id="users">
    <legend>
        <label><input type="checkbox" name="show_all" <?=$_GET['show_all']?'checked':''?> />Show all interpretations for every plot rated by these users</label></legend>
     </fieldset>
    
</form>

<script>
function deselect(field_name) {
    var x = document.getElementsByTagName('input');
    for(var i=0;i<x.length;i++) {
        if(x[i].name==field_name) x[i].checked=0;
    }
}
</script>

<h3>Disagreements (<?=$dis_cnt?> of <?=$dis_cnt+$agree_cnt?>):</h3>
<table>
<tr><th>TSA-ID</th><th>user</th><th>Confidence</th><th>Process</th><th>Comments</th></tr>
<?=$disag?>
</table>

<h3>All Agree (<?=$agree_cnt?> of <?=$dis_cnt+$agree_cnt?>):</h3>
<table>
<tr><th>TSA-ID</th><th>user</th><th>Confidence</th><th>Process</th><th>Comments</th></tr>
    <?=$agree?>
</table>
</div>