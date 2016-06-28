<?php

require_once "BaseService.php";

/**
 *  Plot related service
 */
class RegionSpectralService extends BaseService {
	
	/**
	 * Constructor
	 */
	public function __construct() {
		$this->tablename = "region_spectrals";
	}
	
	/**
	 * Returns all the rows from the table.
	 *
	 * @return array
	 */
	private function getAllRegionSpectrals($where="") {
		$this->connect();
		
		$sql = <<<DOQ
			SELECT region_spectrals.project_id, region_spectrals.tsa, region_spectrals.plotid, 
						 sensor, image_year, image_julday, 
			       b1, b2, b3, b4, b5, b7, tcb, tcg, tcw, 
			       cloud, cloud_cover, spectral_scaler, selected
			FROM region_spectrals join image_list 
			ON region_spectrals.project_id = image_list.project_id
			AND region_spectrals.tsa = image_list.tsa
			AND region_spectrals.image_year = image_list.year
			AND region_spectrals.image_julday = image_list.julday
			WHERE 1 > 0
DOQ;

		if (strlen($where) > 0)
			$sql .= (" AND " . $where);

		$sql .= " ORDER by region_spectrals.plotid, region_spectrals.image_year, region_spectrals.image_julday";
				
		$stmt = mysqli_prepare($this->connection, $sql);		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		$rows = array();
		
		mysqli_stmt_bind_result($stmt, $row->project_id, $row->tsa, $row->plotid, 
								$row->sensor, $row->image_year, $row->image_julday,
								$row->b1, $row->b2, $row->b3, $row->b4, $row->b5, $row->b7,
								$row->tcb, $row->tcg, $row->tcw, $row->cloud, $row->cloud_cover, $row->spectral_scaler, $row->selected);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
				mysqli_stmt_bind_result($stmt, $row->project_id, $row->tsa, $row->plotid, 
								$row->sensor, $row->image_year, $row->image_julday,
								$row->b1, $row->b2, $row->b3, $row->b4, $row->b5, $row->b7,
								$row->tcb, $row->tcg, $row->tcw, $row->cloud, $row->cloud_cover, $row->spectral_scaler, $row->selected);
		}
		
		mysqli_stmt_free_result($stmt);
	  mysqli_close($this->connection);
	
	  return $rows;
	}

	/**
	 * Returns the all regional spectral for a given plot
	 *
	 * @param int $project_id
	 * @param int $tsa
	 * @param int $plotid
	 * @return stdClass
	 */
	public function getRegionSpectralByPlot($project_id, $tsa, $plotid) {
		$sql = <<<DOQ
			SELECT rs.project_id, rs.tsa, rs.plotid, 
				 sensor, rs.image_year, image_julday, 
			      b1, b2, b3, b4, b5, b7, tcb, tcg, tcw, 
			      cloud, cloud_cover, spectral_scaler, selected
			FROM region_spectrals as rs inner join (
			SELECT project_id, tsa, plotid, image_year, min((1-selected)*1000000000 + cloud_cover*1000000 + abs(image_julday-215)*1000 + abs(image_julday-214)) as prio
			FROM region_spectrals
			where region_spectrals.project_id = $project_id and region_spectrals.tsa=$tsa and region_spectrals.plotid=$plotid
			group by project_id, tsa, plotid, image_year) as rsm
			on rs.project_id = $project_id and rs.tsa=$tsa and rs.plotid=$plotid
			and rs.project_id = rsm.project_id 
			and rs.tsa = rsm.tsa
			and rs.plotid = rsm.plotid
			and rs.image_year = rsm.image_year
			and (1-rs.selected)*1000000000 + rs.cloud_cover*1000000 + abs(rs.image_julday-215)*1000 + abs(rs.image_julday-214) = rsm.prio
			order by image_year, image_julday
DOQ;
				
		$this->connect();
		$stmt = mysqli_prepare($this->connection, $sql);		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		$rows = array();
		
		mysqli_stmt_bind_result($stmt, $row->project_id, $row->tsa, $row->plotid, 
								$row->sensor, $row->image_year, $row->image_julday,
								$row->b1, $row->b2, $row->b3, $row->b4, $row->b5, $row->b7,
								$row->tcb, $row->tcg, $row->tcw, $row->cloud, $row->cloud_cover, $row->spectral_scaler, $row->selected);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
				mysqli_stmt_bind_result($stmt, $row->project_id, $row->tsa, $row->plotid, 
								$row->sensor, $row->image_year, $row->image_julday,
								$row->b1, $row->b2, $row->b3, $row->b4, $row->b5, $row->b7,
								$row->tcb, $row->tcg, $row->tcw, $row->cloud, $row->cloud_cover, $row->spectral_scaler, $row->selected);
		}
		
		mysqli_stmt_free_result($stmt);
		mysqli_close($this->connection);
	
		return $rows;		

	}

	/**
	 * Returns the all regional spectral for a given plot and year
	 *
	 * @param int $project_id
	 * @param int $tsa
	 * @param int $plotid
	 * @param int $year
	 * @return stdClass
	 */
	public function getRegionSpectralForYear($project_id, $tsa, $plotid, $year) {
		$sql = <<<DOQ
			SELECT project_id, tsa, plotid, 
			      sensor, image_year, image_julday, 
			      b1, b2, b3, b4, b5, b7, tcb, tcg, tcw, 
			      cloud, cloud_cover, spectral_scaler, selected
			FROM region_spectrals
			where region_spectrals.project_id = $project_id and region_spectrals.tsa=$tsa and region_spectrals.plotid=$plotid and region_spectrals.image_year=$year
			order by image_julday
DOQ;
				
		$this->connect();
		$stmt = mysqli_prepare($this->connection, $sql);		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		$rows = array();
		
		mysqli_stmt_bind_result($stmt, $row->project_id, $row->tsa, $row->plotid, 
								$row->sensor, $row->image_year, $row->image_julday,
								$row->b1, $row->b2, $row->b3, $row->b4, $row->b5, $row->b7,
								$row->tcb, $row->tcg, $row->tcw, $row->cloud, $row->cloud_cover, $row->spectral_scaler, $row->selected);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
				mysqli_stmt_bind_result($stmt, $row->project_id, $row->tsa, $row->plotid, 
								$row->sensor, $row->image_year, $row->image_julday,
								$row->b1, $row->b2, $row->b3, $row->b4, $row->b5, $row->b7,
								$row->tcb, $row->tcg, $row->tcw, $row->cloud, $row->cloud_cover, $row->spectral_scaler, $row->selected);
		}
		
		mysqli_stmt_free_result($stmt);
		mysqli_close($this->connection);
	
		return $rows;		

	}

	/**
	 * Returns the int for selected override
	 *
	 * @param int $project_id
	 * @param int $tsa
	 * @param int $plotid
	 * @param int $year
	 * @param int $day
	 * @param int $oldYear
	 * @param int $oldDay
	 * @return stdClass
	 */
	public function overrideImagePriority($project_id, $tsa, $plotid, $year, $day, $oldYear, $oldDay) {
		$this->connect();
		$stmt = mysqli_prepare($this->connection, "UPDATE $this->tablename SET selected=(CASE WHEN project_id=$project_id AND tsa=$tsa AND plotid=$plotid AND image_year=$year AND image_julday=$day THEN 1 WHEN project_id=$project_id AND tsa=$tsa AND plotid=$plotid AND image_year=$year AND image_julday!=$day THEN 0 ELSE selected END)");
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();

	  	mysqli_close($this->connection);
		return 1;
	}

	/**
	 * Returns the all regional spectral for a given plot
	 *
	 * @param int $project_id
	 * @param int $tsa
	 * @param int $plotid
	 * @return stdClass
	 */
	private function getRegionSpectralByPlot_original($project_id, $tsa, $plotid) {
		$where = "region_spectrals.project_id=$project_id AND region_spectrals.tsa=$tsa AND region_spectrals.plotid = $plotid";
		return $this->getAllRegionSpectrals($where);
	}


}

?>
