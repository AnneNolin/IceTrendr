<?PHP
function make_projects_list() {
        
    $projects = is_array($_GET['projects']) ?  $_GET['projects'] : array($_GET['projects']);
    $projects = array_map("intval", $projects);

    $mysqli = new mysqli('localhost', 'LTRobot', 'JuvzF6jzQl', 'landtrendr2');
    
    #Read Projects and build <option/> list
    $rs = $mysqli->query("SELECT DISTINCT a.project_id, project_name, description
            FROM change_process as a, projects as b
            WHERE a.project_id = b.project_id
            ORDER BY project_id")
        or die($mysqli->error);

    while($r = $rs->fetch_assoc()) {
        $selected = in_array($r['project_id'], $projects) ? 'checked' : '';
        echo "<label title=\"$r[description]\"><input type=\"checkbox\" name=\"projects[]\" value=\"$r[project_id]\" $selected /> 
                $r[project_id] - $r[project_name]</label>\n";
    }
    
}
?>

<?=make_projects_list()?>

