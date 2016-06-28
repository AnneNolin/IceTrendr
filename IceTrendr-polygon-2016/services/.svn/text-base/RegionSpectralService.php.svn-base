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
			       cloud_cover, spectral_scaler
			FROM region_spectrals join image_list
			ON region_spectrals.project_id = image_list.project_id
			AND region_spectrals.tsa = image_list.tsa
			AND region_spectrals.image_year = image_list.imgyear
			AND region_spectrals.image_julday = image_list.imgday
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
								$row->tcb, $row->tcg, $row->tcw, $row->cloud_cover, $row->spectral_scaler);

	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
				mysqli_stmt_bind_result($stmt, $row->project_id, $row->tsa, $row->plotid,
								$row->sensor, $row->image_year, $row->image_julday,
								$row->b1, $row->b2, $row->b3, $row->b4, $row->b5, $row->b7,
								$row->tcb, $row->tcg, $row->tcw, $row->cloud_cover, $row->spectral_scaler);
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
		$where = "region_spectrals.project_id=$project_id AND region_spectrals.tsa=$tsa AND region_spectrals.plotid = $plotid";
		return $this->getAllRegionSpectrals($where);
	}
}


