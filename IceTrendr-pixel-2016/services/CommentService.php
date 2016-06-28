<?php

require_once "BaseService.php";

/**
 *  Plot related service
 */
class CommentService extends BaseService {
	/**
	 * Constructor
	 */
	public function __construct() {
		$this->tablename = "plot_comments";
	}
	
	/**
	 * create vertices for specified plot
	 * 
	 * @param int $project_id project identifier
	 * @param int $tsa scene
	 * @param int $plotid plot identifier
	 * @param int $interpreter
	 * @param string $comment value string for insertion
	 * @param int $is_example
	 * @param int $is_complete
	 * @return int
	 */
	public function createComments($project_id, $tsa, $plotid, $interpreter, $comment, $is_example, $is_complete) {
		$update_sql = <<<DOQ
			INSERT INTO $this->tablename
			 (project_id, tsa, plotid, interpreter, comment, is_example, is_complete)
			 VALUES ($project_id, $tsa, $plotid, $interpreter, '$comment', $is_example, $is_complete)
			 ON DUPLICATE KEY UPDATE comment = '$comment', is_example=$is_example, is_complete=$is_complete
DOQ;

		try {
			$this->connect(FALSE);
			
			mysqli_query($this->connection, $update_sql);
			$this->throwExceptionOnError();
			
			mysqli_commit($this->connection);
			mysqli_close($this->connection);
			return 0;
		}
		catch (Exception $e) {
			mysqli_rollback($this->connection);
			mysqli_close($this->connection);
			throw $e;
		}
	}

	/**
	 * Return all vertices for a given plot
	 * 
	 * @param int $project_id project identifier
	 * @param int $tsa scene
	 * @param int $plotid plot identifier
	 * @param int $interpreter
	 * @return stdClass
	 */
	 public function getComment($project_id, $tsa, $plotid, $interpreter) {
	 	if ($interpreter==9999)
	 		$interpreter = 2;

		$this->connect();
		
		$sql = <<<DOQ
			SELECT project_id, tsa, plotid, interpreter, comment, is_example, is_complete 
			FROM plot_comments
			WHERE project_id=$project_id 
			AND tsa=$tsa 
			AND plotid = $plotid 
			AND interpreter=$interpreter
			LIMIT 1
DOQ;

		$stmt = mysqli_prepare($this->connection, $sql);		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		mysqli_stmt_bind_result($stmt, 
		                        $row->project_id, 
		                        $row->tsa,
		                        $row->plotid,
		                        $row->interpreter,
		                        $row->comment,
														$row->is_example,
														$row->is_complete);
														
		mysqli_stmt_fetch($stmt);
	  return $row;
	}

}

?>
