<?PHP
function make_users_list() {

    $interpreters = is_array($_GET['users']) ?  $_GET['users'] : array($_GET['users']);
    $interpreters = array_map("intval", $interpreters);

    $mysqli = new mysqli('localhost', 'LTRobot', 'JuvzF6jzQl', 'landtrendr2');

    #Read Interpreters and build <option/> list
    $rs = $mysqli->query("SELECT DISTINCT user_id, interpreter, user_name, first_name, last_name
            FROM change_process as c, interpreter as i
            WHERE c.interpreter = i.user_id
            ORDER BY user_name")
        or die($mysqli->error);

    while($r = $rs->fetch_assoc()) {
        $selected = in_array($r['user_id'], $interpreters) ? 'checked' : '';
        echo "<label><input type=\"checkbox\" name=\"users[]\" value=\"$r[user_id]\" $selected /> 
                $r[user_name] - $r[first_name] $r[last_name]</label>\n";
    }
    
}
?>

<?=make_users_list()?>

