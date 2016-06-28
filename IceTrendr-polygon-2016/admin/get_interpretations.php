<?PHP
$mysqli = new mysqli('localhost', 'LTRobot', 'JuvzF6jzQl', 'landtrendr2');

$projects = $mysqli->real_escape_string($_GET['projects']);
$users = $mysqli->real_escape_string($_GET['users']);

if ($users != 0) {
    $userSQL = " AND user_id IN($users)";
}

$rs = $mysqli->query("SELECT DISTINCT tsa, plotid, process, interpreter, shape, context, trajectory
                    FROM change_process 
                    WHERE project_id IN ($projects)
                        $userSQL
                ") or die($mysqli->error);
          
$out = '';          
while($r = $rs->fetch_assoc()) {
    $r['tsa'] = substr($r['tsa'],0,2) . '0' . substr($r['tsa'], -2);
    $out .= implode(',', $r) . "\n";
}


$out = str_replace(array("Low", "Medium", "High",'null','N/A'), array(1,2,3,2,2), $out);
echo "TSA, PLOTID, CHANGE_PROCESS, INTERPRETER, SHAPE, CONTEXT, TRAJECTORY\n";
echo $out;

?>