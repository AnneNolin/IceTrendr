
<!-- 20121228 donj -->

<!DOCTYPE html>
<html>
<head><title>Test Page</title></head>
        <body>
                <?php
                error_reporting(E_ALL);
                require_once 'login.php';
                echo "<h1>Test Connection to MySQL Using PHP</h1><br \>";
                $mysqli = mysqli_init();
                if (!$mysqli) {
                        die('mysqli_init failed');
                }

                // Transaction must be manually committed with the COMMIT command
                if (!$mysqli->options(MYSQLI_INIT_COMMAND, 'SET AUTOCOMMIT = 0')
) {
                        die('Setting MYSQLI_INIT_COMMAND failed');
                }
                if (!$mysqli->options(MYSQLI_OPT_CONNECT_TIMEOUT, 5)) {
                        die('Setting MYSQLI_OPT_CONNECT_TIMEOUT failed');
                }

                if (!$mysqli->real_connect($DatabaseServer, $DatabaseUsername, $DatabasePassword, NULL, $DatabasePort)) {
                        die('Connect Error (' . mysqli_connect_errno() . ')');
                }
                else {
                        echo 'Success connecting to mysql server ' . $mysqli->host_info . '<br />';
                }

                //$DatabaseName = 'mysql';
                $DatabaseName = 'IceTrendr';
                if (!$mysqli->select_db($DatabaseName)) {
                        die('Failure selecting database &quot' . $DatabaseName . '&quot with error number: ' . $mysqli->errno);
                }
                else {
                        echo 'Success selecting database &quot' . $DatabaseName . '&quot<br />';
                }

		$host = "wilk123-unix1.science.oregonstate.edu";
		$username = "IceTrendr_admin";
		$password = "fr05ty!@#";
		$database = $DatabaseName;
		$sql = "SHOW TABLES FROM $DatabaseName";
		$mysqli = new mysqli($host,$username,$password,$database);
		$result = $mysqli->query($sql);
		//$result = mysql_query($sql);

		if (!$result) {
    		    echo "DB Error, could not list tables\n";
    		    echo 'MySQL Error: ' . mysql_error();
    		    exit;
		}
		else {
    		    echo "Success in selecting MySQL Tables . <BR>" ;
		}

		//while ($row = mysql_fetch_row($result)) {
		while ($row = $result->fetch_row()) {
    		    echo "Table: {$row[0]}. <BR>";
		}

    		echo "<BR>";
    		echo "<BR>";

		$query = "SELECT * FROM interpreter";
		$result = $mysqli->query($query);

    		echo "Success in selecting Interpreter Table:<BR>";
		$tab = "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp";
		//foreach (array_keys($result->fetch_assoc()) as $key) {
    		    //echo "$tab$key";
		//}
    		echo "<PRE>";

		while ($row = $result->fetch_assoc()) {
		    foreach (array_keys($row) as $key) {
    		    	echo "\t$row[$key]";
		    }
		    echo "<BR>";
		}
    		echo "</PRE>";

		echo "<BR>";
    		echo "<BR>";

		$query = "SELECT * FROM project_interpreter";
		$result = $mysqli->query($query);

    		echo "Success in selecting project_interpreter Table:<BR>";
		$tab = "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp";
		//foreach (array_keys($result->fetch_assoc()) as $key) {
    		    //echo "$tab$key";
		//}
    		echo "<PRE>";

		while ($row = $result->fetch_assoc()) {
		    foreach (array_keys($row) as $key) {
    		    	echo "\t$row[$key]";
		    }
		    echo "<BR>";
		}
    		echo "</PRE>";
                $mysqli->close();

        ?>
        </body>
</html>
