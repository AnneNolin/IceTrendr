<style>
body {font:normal 10pt Arial; }
form {margin:3em auto; width:520px; padding:1em; border-top:1px solid #999}
label {display:block; margin:5px 0}
label span{font-weight:bold; display:inline-block; vertical-align:top; width:150px; text-align:right; padding:2px 5px;}
label input[type=text] {position:relative; top:2px; width:350px;}
</style>
<?PHP
#Make page time out only after 5 minutes
set_time_limit(300);

### If a project id is passed, then add the project.  Otherwise, just present the form
if($_GET['pid']) {

    ## pid (project id) is passed as in address http://.../addproject.php?pid=###
    $pid = intval($_GET['pid']);

    ## Create database connection
    $mysqli = new mysqli('localhost', 'LTRobot', 'JuvzF6jzQl', 'landtrendr2');

    ## Check to make sure the project data is on the server
    if(!file_exists("//data/prj_$pid")) {
        echo "<p>Data for project #$pid is not found on the server. The project was not added.</p>\n";
    } else {
        echo "<p>Adding Project....</p>";
    }

   
    ## Get project names and description
    $desc = $mysqli->real_escape_string($_GET['desc']);
    $pcode = $mysqli->real_escape_string($_GET['pcode']);
    $pname = $mysqli->real_escape_string($_GET['pname']);

    ## If the KML file was brought over by the new process, rename and move it
    $kml_fn = "//data/prj_$pid/plots.kml";
    if(file_exists($kml_fn)) {
        copy($kml_fn, "//var/www/html/ltattribution/kml/{$pcode}_GE.kml");
    }
    
    # Insert into the Project table: the project_code must be the same as is given in the KML file, minus _GE.kml
    $mysqli->query("REPLACE INTO projects (project_id, project_code, project_name, description, contact) VALUES ($pid, '$pcode', '$pname', '$desc', 'REK: kennedyr@bu.edu')")
        or die($mysqli-error);

    
    ## Add interpreters to the project for all of the TSAs
    if($_GET['users']) {
        # Get TSAs associated with the project from the ts_{TSA}_spectral.csv files in the /data/prj_$pid directory.
        foreach(glob("/data/prj_$pid/ts_*_spectral.csv") as $fn) {
            preg_match("/ts_(\d+)_spectral\.csv/", $fn, $m);
            $tsa[] = $m[1];        
        }
        
        # Get users and add each user-tsa combination
        $users = explode(',' , $_GET['users']);
        foreach($users as $u) {
            $u = $mysqli->real_escape_string(trim($u));
            $rs = $mysqli->query("SELECT user_id FROM interpreter WHERE user_name = '$u'");
            $r = $rs->fetch_assoc();
            $v = array();
            if($r['user_id']) {
                foreach($tsa as $t) {
                    $v[] = "($pid, $t, $r[user_id], '', 1)";
                }
                $v = implode(',' , $v);
                $mysqli->query("INSERT IGNORE INTO project_interpreter (project_id, tsa, interpreter, start_date, status) VALUES $v") or die($mysqli->error);
            }
        }
    }
        
    ## Now, load csv files into the database.
    #  The flush() are there in case there are big files, so it will print on the webpage as they're added. 
    #Start with the plots files
    if (file_exists("/data/prj_$pid/plots.csv")) {
        $plots_files = array("/data/prj_$pid/plots.csv");
    } else {
        $plots_files = glob("/data/prj_$pid/LT_*_patchinfo_proj*.csv");
    }
    foreach($plots_files as $fn) {
        $t = microtime(1);
        echo " : $fn"; flush();
        $mysqli->query("LOAD DATA INFILE '$fn' REPLACE INTO TABLE plots
            FIELDS TERMINATED BY ',' LINES TERMINATED BY '\\n' IGNORE 1 LINES
            (project_id,tsa,plotid,x,y,lat,lng,dist_year,sequence_order )
            ") or die($mysqli->error);
        echo ".... Added. " . sprintf("(%0.2f s). <br/>", (microtime(1)-$t)); flush();
    }
    
    #image list files, which I don't think are used
    if (file_exists("/data/prj_$pid/image_list.csv")) {
        $image_list_files = array("/data/prj_$pid/image_list.csv");
    } else {
        $image_list_files = glob("/data/prj_$pid/LT_*_patchinfo_image_list_proj*.csv");
    }
    foreach($image_list_files as $fn) {
        $t = microtime(1);
        echo " : $fn"; flush();
        $mysqli->query("LOAD DATA INFILE '$fn' REPLACE INTO TABLE image_list
            FIELDS TERMINATED BY ',' LINES TERMINATED BY '\\n' IGNORE 1 LINES
            (project_id,tsa,imgtype,imgyear,imgday,reflfile,tcfile,cloudfile)
            ") or die($mysqli->error);
        echo ".... Added. " . sprintf("(%0.2f s). <br/>", (microtime(1)-$t)); flush();
    }
    
    #finally, all of the spectral data
    foreach(glob("/data/prj_$pid/ts*spectral.csv") as $fn) {
        $t = microtime(1);
        echo " : $fn"; flush();
        $mysqli->query("LOAD DATA INFILE '$fn' REPLACE INTO TABLE region_spectrals
            FIELDS TERMINATED BY ',' LINES TERMINATED BY '\\n' IGNORE 1 LINES
            (project_id, plotid, tsa, sensor, image_year, image_julday, b1,b2,b3,b4,b5,b7,tcb,tcg,tcw,cloud,cloud_cover,spectral_scaler )
            ") or die($mysqli->error);
        echo ".... Added. " . sprintf("(%0.2f s). <br/>", (microtime(1)-$t)); flush();
    }
    
}
?>

<form>
<label><span>Project Id:</span> <input type="text" name="pid"/></label>
<label><span>Project Code:<small><br>(same as KML)</small></span> <input type="text" name="pcode"/></label>
<label><span>Project Name:</span> <input type="text" name="pname"/></label>
<label><span>Project Description:</span> <input type="text" name="desc"/></label>
<label><span>User Names:<small><br>(separate with commas) </small></span> <input type="text" name="users"/><label>
<label><span></span> <input type="submit" value="Add Project" /></label>
</form>
