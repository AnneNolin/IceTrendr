<?PHP

$mysqli = new mysqli('localhost', 'LTRobot', 'JuvzF6jzQl', 'landtrendr2');


#Read Projects and build <option/> list
$cs = $mysqli->query("SELECT * FROM projects");
while($c = $cs->fetch_assoc()) {
    $selected = ($c['project_id'] == $proj_id) ? 'selected' : '';
    $projects .= "<option value=\"$c[project_id]\" $selected>$c[project_code] ($c[project_id]): $c[project_name]</option>\n";
}


?>

<style>
    body {text-align:center;}
    #frame {display:inline-block;  margin:auto}
    td.on, td.off {padding:2px 5px; border:1px dotted #ccc; cursor:pointer}
    td.on {background-color:#9f9}
    td.off {color:#999}

</style>


<div id="frame">

<form>
<select id="projects" name="projects" onchange="getUsers()">
<option value="-999">Select a Project</option>
<?=$projects?>
</select>
</form>

<div id="users">
</div>

</div>


<script>
function getUsers() {
    var p = document.getElementById('projects');
    var pid = p.options[p.selectedIndex].value;
    
    if (pid > 0) {
        var page = "projects_interpreters.php?project_id=" + pid;
        var target = document.getElementById("users");
        loadXMLDoc(page, target);
    }
}

function toggle_user_tsa(pid, user, tsa, status) {
    page = 'toggle_project_interpreter.php?project_id=' + pid + '&user=' + user + '&tsa=' + tsa + '&status=' + status;

    var target = document.getElementById('user_'+user);
    loadXMLDoc(page, target);
}



function loadXMLDoc(page, target) {
    var xmlhttp;
    if (window.XMLHttpRequest) {
        // code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
    } else {
        // code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    
    xmlhttp.onreadystatechange=function() {
        if (xmlhttp.readyState==4 && xmlhttp.status==200) {
            target.innerHTML=xmlhttp.responseText;
            }
        }
    xmlhttp.open("GET", page,true);
    xmlhttp.send();
}
</script>