<?php

require_once "BaseService.php";

/**
 *  Lookup service
 */
class LookupService extends BaseService {

	/**
	 * Constructor
	 */
	public function __construct() {
		$this->tablename = "";
	    $this->connect();
	}

  	function __destruct() {
    	$this->close();
  	}
  	
	/**
	 * Returns all the image list.
	 *
	 * @param int $project_id
	 * @param string $category
	 * @return array
	 */
	public function getLookup($project_id, $category) {

		$this->tablename = "lookup_$category";
		
		$sql = <<<DOQ
			SELECT project_id, name, description
			FROM $this->tablename
			WHERE project_id=$project_id
			ORDER BY sequence_order
DOQ;

		//
		$result = $this->connection->query($sql);
		$this->throwExceptionOnError();

		$rows = array();

    	while($row = $result->fetch_array(MYSQLI_ASSOC)) {
      		$rows[] = $row;
    	}

    	$result->close();
	  return $rows;
	}
}
