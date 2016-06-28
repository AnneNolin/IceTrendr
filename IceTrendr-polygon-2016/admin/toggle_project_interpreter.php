<?PHP
function update_status() {
    $mysqli = new mysqli('localhost', 'LTRobot', 'JuvzF6jzQl', 'landtrendr2');

    $pid = intval($_GET['project_id']);
    $user = intval($_GET['user']);
    $tsa = $mysqli->real_escape_string($_GET['tsa']);
    $status = intval($_GET['status']);

    $rs = $mysqli->query("REPLACE INTO project_interpreter (project_id, interpreter, tsa, status) VALUES ($pid, $user, '$tsa', $status)") or die($mysqli->error);

}

update_status();
include('projects_interpreters.php');

?>