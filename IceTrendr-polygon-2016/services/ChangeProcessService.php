<?php

require_once "BaseService.php";

/**
 *  Plot related service
 */
class ChangeProcessService extends BaseService {

	/**
	 * Constructor
	 */
	public function __construct() {
		$this->tablename = "change_process";
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
	public function getProcessForPlot($project_id, $tsa, $plotid, $interpreter) {
		$sql =<<<DOQ
      SELECT project_id, tsa, plotid, groups,
             process, shape, context, trajectory,
             comments, interpreter, iscomplete,
             issnow, isphenology, iscloud,
             ismisregistration, ispartialpatch, iswrongyear
      FROM change_process
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
	    $row['groups'] = $row['groups'] + 0;
	    $row['interpreter'] = $row['interpreter'] + 0;
	    $row['iscomplete'] = $row['iscomplete'] + 0;
	    $row['issnow'] = $row['issnow'] + 0;
	    $row['isphenology'] = $row['isphenology'] + 0;
	    $row['iscloud'] = $row['iscloud'] + 0;
	    $row['ismisregistration'] = $row['ismisregistration'] + 0;
	    $row['ispartialpatch'] = $row['ispartialpatch'] + 0;
	    $row['iswrongyear'] = $row['iswrongyear'] + 0;
	    $rows[] = $row;
    }

    $result->close();

	  return $rows;
	}

  /**
	 * Add change process interpretation to the database.
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
  public function updatePlotProcess($project_id, $tsa, $plotid, $interpreter, $sqlstr) {
    $sql = <<<DOQ
      INSERT INTO change_process (project_id, tsa, plotid, groups,
             process, shape, context, trajectory,
             comments, interpreter, iscomplete,
             issnow, isphenology, iscloud,
             ismisregistration, ispartialpatch, iswrongyear)
      VALUES
DOQ;

    $del = <<<DOQ
      DELETE FROM change_process
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

