<?php

require_once "BaseService.php";

/**
 *  Plot related service
 */
class VertexService extends BaseService {
	/**
	 * Constructor
	 */
	public function __construct() {
		$this->tablename = "vertex";
	}
	
	/**
	 * create vertices for specified plot
	 * 
	 * @param int $project_id project identifier
	 * @param int $tsa scene
	 * @param int $plotid plot identifier
	 * @param int $interpreter
	 * @param string $sqlstr sql value string for insertion
	 * @return int
	 */
	public function createVertices($project_id, $tsa, $plotid, $interpreter, $sqlstr) {
		$update_sql = <<<DOQ
			INSERT INTO $this->tablename
			 (plotid, image_year, image_julday, 
			  dominant_landuse, dominant_landuse_over50, 
			  other_landuse, landuse_confidence,
			  dominant_landcover, dominant_landcover_over50, 
			  other_landcover, landcover_confidence,
			  landcover_ephemeral,
			  date_confidence,
			  change_process, change_process_confidence,
			  comments, interpreter, tsa, project_id,
			  patch_size, relative_magnitude
			 )
			 VALUES $sqlstr
DOQ;

		$delete_sql = <<<DOQ
			DELETE FROM $this->tablename
			WHERE project_id = $project_id
			AND tsa = $tsa
			AND plotid = $plotid
			AND interpreter = $interpreter
DOQ;

		//The sql string need to be at least
		//(1,1111,1,'',1,'','','',1,'','',1,'','','','')
		if (strlen($sqlstr)<46) {
			return 1;
		}

		try {
			$this->connect(FALSE);
			
			mysqli_query($this->connection, $delete_sql);
			$this->throwExceptionOnError();
			
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
	 * Delete all vertices for a given plot
	 * 
	 * @param int $project_id project identifier
	 * @param int $tsa scene
	 * @param int $plotid plot identifier
	 * @param int $interpreter
	 * @return int
	 */
	public function removeAllVerticesForPlot($project_id, $tsa, $plotid, $interpreter) {
		$sql = <<<DOQ
			DELETE from vertex 
			WHERE project_id = $project_id 
			AND tsa = $tsa 
			AND plotid = $plotid
			AND interpreter = $interpreter
DOQ;

		$this->connect();
		
		mysqli_query($this->connection, $sql);
		$this->throwExceptionOnError();
		mysqli_close($this->connection);
		
		return 0;
	}
	
	/**
	 * Return all vertices for a given plot
	 * 
	 * @param int $project_id project identifier
	 * @param int $tsa scene
	 * @param int $plotid plot identifier
	 * @param int $interpreter
	 * @return array
	 */
	public function getVerticesForPlot($project_id, $tsa, $plotid, $interpreter) {
		if ($interpreter==9999)
			$interpreter = 2;
		
		$where = " project_id=$project_id AND tsa=$tsa AND plotid = $plotid AND interpreter=$interpreter";
		return $this->getAllVertices($where);
	}
	
	/**
	 * Returns all vertices
	 *
	 * @return array
	 */
	public function getAllVertices($where="") {
		$this->connect();
		
		$sql = <<<DOQ
			SELECT vertex.vertex_id, 
							vertex.plotid, 
							vertex.image_year, 
							vertex.image_julday, 
							vertex.dominant_landuse, 
							vertex.dominant_landuse_over50, 
							vertex.other_landuse, 
							vertex.landuse_confidence, 
							vertex.dominant_landcover, 
							vertex.dominant_landcover_over50, 
							vertex.other_landcover, 
							vertex.landcover_confidence, 
							vertex.landcover_ephemeral, 
							vertex.date_confidence, 
							vertex.change_process, 
							vertex.change_process_confidence, 
							vertex.comments,
							vertex.interpreter,
							vertex.tsa,
							vertex.project_id,
							vertex.patch_size,
							vertex.relative_magnitude
						FROM vertex
						WHERE 1 > 0 
DOQ;

		if (strlen($where)>3) 
			$sql .= " AND $where";
			
		$sql .= " ORDER BY plotid, image_year, image_julday";

		$stmt = mysqli_prepare($this->connection, $sql);		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		$rows = array();
		
		mysqli_stmt_bind_result($stmt, $row->vertex_id,
														$row->plotid, 
														$row->image_year,
														$row->image_julday,
														$row->dominant_landuse,
														$row->dominant_landuse_over50,
														$row->other_landuse,
														$row->landuse_confidence,
														$row->dominant_landcover,
														$row->dominant_landcover_over50,
														$row->other_landcover,
														$row->landcover_confidence,
														$row->landcover_ephemeral,
														$row->date_confidence,
														$row->change_process,
														$row->change_process_confidence,
														$row->comments,
														$row->interpreter,
														$row->tsa,
														$row->project_id,
														$row->patch_size,
														$row->relative_magnitude);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
				mysqli_stmt_bind_result($stmt, $row->vertex_id,
														$row->plotid, 
														$row->image_year,
														$row->image_julday,
														$row->dominant_landuse,
														$row->dominant_landuse_over50,
														$row->other_landuse,
														$row->landuse_confidence,
														$row->dominant_landcover,
														$row->dominant_landcover_over50,
														$row->other_landcover,
														$row->landcover_confidence,
														$row->landcover_ephemeral,
														$row->date_confidence,
														$row->change_process,
														$row->change_process_confidence,
														$row->comments,
														$row->interpreter,
														$row->tsa,
														$row->project_id,
														$row->patch_size,
														$row->relative_magnitude);
		}
		
		mysqli_stmt_free_result($stmt);
	  mysqli_close($this->connection);
	  return $rows;
	}


}

?>
