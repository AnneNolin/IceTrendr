<?php

$mysqli = mysqli_connect('localhost', 'IceTrendr_admin', 'fr05ty!@#', 'IceTrendr');

		$interpreter = 1;
		$role = 1;

		$sql = <<<DOQ
			SELECT projects.project_id, project_code, project_name, 
						 description, contact, tsa, user_id, plot_size
			FROM projects, interpreter, project_interpreter
			WHERE projects.project_id = project_interpreter.project_id
			AND project_interpreter.interpreter = interpreter.user_id
			AND interpreter.user_id = ?
			AND role = ?
DOQ;

		$sqlread = <<<DOQ
			SELECT distinct projects.project_id, project_code, project_name, 
				 description, contact, tsa, 9999 as user_id, plot_size
			FROM projects, project_interpreter
			WHERE projects.project_id = project_interpreter.project_id
			ORDER BY project_code
DOQ;

		if ($interpreter==9999) {
			$sql = $sqlread;
		}
		
		$stmt = mysqli_prepare($mysqli, $sql);

		if ($interpreter!=9999) {		
			mysqli_stmt_bind_param($stmt, 'ii', $interpreter, $role);		
		}

		mysqli_stmt_execute($stmt);
		
		$rows = array();
		mysqli_stmt_bind_result($stmt, 
					$row->project_id, 
					$row->project_code,
					$row->project_name,
					$row->description,
					$row->contact,
					$row->tsa,
					$row->user_id,
					$row->plot_size
					);
		
	  while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
				mysqli_stmt_bind_result($stmt, 
							$row->project_id, 
							$row->project_code,
							$row->project_name,
							$row->description,
							$row->contact,
							$row->tsa,
							$row->user_id,
							$row->plot_size
							);
	  }
		
		mysqli_stmt_free_result($stmt);
	  mysqli_close($mysqli);

	echo $row[0];
?>
