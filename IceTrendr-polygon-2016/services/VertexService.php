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
    	$this->connect();
	}

  	public function __destruct() {
    	$this->close();
  	}

	/**
	 * Returns all the rows from the table.
	 *
	 * @param int $project_id
	 * @param int $tsa
	 * @param int $plotid
   	* @param int $interpreter
	 * @return array
	 */
	public function getVertexForPlot($project_id, $tsa, $plotid, $interpreter) {
		$sql =<<<DOQ
      SELECT project_id, tsa, plotid,
             category, image_year, image_julday,
             dominant_landuse, dominant_landuse_lt50, other_landuse,
             landuse_confidence,
             dominant_landcover, dominant_landcover_lt50, other_landcover,
             landcover_confidence,
             interpreter, groups, 
             end_dominantLandcover, end_otherLandcover
      FROM vertex
      WHERE project_id = $project_id
        AND tsa = $tsa
        AND plotid = $plotid
        AND interpreter = $interpreter
DOQ;

		$result = $this->connection->query($sql);
		$this->throwExceptionOnError();

		$rows = array();

	    while($row = $result->fetch_array(MYSQLI_ASSOC)) {
	    	$row['project_id'] = $row['project_id']+0;
	    	$row['tsa'] = $row['tsa'] + 0;
	    	$row['plotid'] = $row['plotid'] + 0;
	    	$row['image_year'] = $row['image_year'] + 0;
	    	$row['image_julday'] = $row['image_julday'] + 0;
	    	$row['dominant_landuse_lt50'] = $row['dominant_landuse_lt50'] + 0;
	    	$row['dominant_landcover_lt50'] = $row['dominant_landcover_lt50'] + 0;
	    	$row['interpreter'] = $row['interpreter'] + 0;
	    	$row['groups'] = $row['groups'] + 0;

	    	$rows[] = $row;
	    }
	
	    $result->close();

	  return $rows;
	}

  /**
	 * Add vertex interpretation to the database.
   * sicne it is unknow whether vertex exists on existing plot,
   * the sequence of operation is to first delete all existing vertex
   * for the given plot interpretation and then add all the new information.
   * To maintaine database consistencey, a transaction is being used.
	 *
	 * @param int $project_id
	 * @param int $tsa
	 * @param int $plotid
   * @param int $interpreter
   * @param string $sqlstr
	 * @return int
	 */
  public function updatePlotVertex($project_id, $tsa, $plotid, $interpreter, $sqlstr) {
    $sql = <<<DOQ
      INSERT INTO vertex (project_id, tsa, plotid,
             category, image_year, image_julday,
             dominant_landuse, dominant_landuse_lt50, other_landuse,
             landuse_confidence,
             dominant_landcover, dominant_landcover_lt50, other_landcover,
             landcover_confidence,
             interpreter, groups, 
             end_dominantLandcover, end_otherLandcover)
      VALUES
DOQ;

    $del = <<<DOQ
      DELETE FROM vertex
      WHERE project_id = $project_id
        AND tsa = $tsa
        AND plotid = $plotid
        AND interpreter = $interpreter
DOQ;

    //rough check on the format
    if (strlen($sqlstr)<34) {
      return 1;
    }

    try {
      $this->connection->autocommit(false);

      //remove existing ones
      $this->connection->query($del);
      $this->throwExceptionOnError();

      //add new ones
      $insql = $sql . ' ' . $sqlstr;

//return $insql;

      $this->connection->query($insql);
      $this->throwExceptionOnError();

      $this->connection->commit();

      return 0;
    }
    catch (Exception $e) {
      $this->connection->rollback();
      throw $e;
    }
  }

}


