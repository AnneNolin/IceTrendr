<?PHP

$mysqli = new mysqli('localhost', 'LTRobot', 'JuvzF6jzQl', 'landtrendr2');

$pid = intval($_GET['project_id']);
$user = intval($_GET['user']);
$user_sql = $user ? "WHERE user_id = $user" : '';

$rs = $mysqli->query("SELECT DISTINCT tsa FROM plots WHERE project_id = $pid ORDER BY tsa") or die($mysqli->error);
$tsa = array();
while($r = $rs->fetch_assoc()) { $tsa[] = $r['tsa']; }

$rs = $mysqli->query("SELECT user_id, user_name, tsas
    FROM interpreter as i
        LEFT JOIN (SELECT project_id, interpreter, GROUP_CONCAT(tsa ORDER BY tsa SEPARATOR ',') as tsas
                    FROM project_interpreter
                    WHERE project_id = $pid AND status = 1
                    GROUP BY interpreter
                    ) as pi
        ON  pi.interpreter = i.user_id 
        $user_sql
    ORDER BY user_id ") or die($mysqli->error);
    

while ($r = $rs->fetch_assoc()) {
    $out .= "<tr id=\"user_$r[user_id]\"><td>$r[user_name]:</td>";
    
    $it = explode(',' , $r['tsas']);
    foreach($tsa as $t) {
        $pr = substr($t, 0,2) . '/' . substr($t, -2);
        if(FALSE === array_search($t, $it, true)) {
            $out .="<td class=\"off\" onclick=\"toggle_user_tsa($pid, $r[user_id], '$t', 1)\">$pr</td>";
        }else {
            $out .="<td class=\"on\" onclick=\"toggle_user_tsa($pid, $r[user_id], '$t', 0)\">$pr</td>";
        }    
    }
    $out .="</tr>\n";
}


?>

<table><?=$out?></table>

