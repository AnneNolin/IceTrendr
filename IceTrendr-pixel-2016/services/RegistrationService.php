<?php

require_once "BaseService.php";

/**
 *  Plot related service
 */
class RegistrationService extends BaseService {
	
	/**
	 * Constructor
	 */
	public function __construct() {
		$this->tablename = "registration";
	}
	
	/**
	 * add new user
	 * 
	 * @param stdClass $user
	 * @return int
	 */
	public function register($user) {
		$sql = <<<DOQ
			INSERT INTO registration (first_name, last_name, email)
			VALUES (?,?,?)
DOQ;

		$this->connect();
		
		$stmt = mysqli_prepare($this->connection, $sql);
		$this->throwExceptionOnError();
		
		mysqli_stmt_bind_param($stmt, 'sss',
						$user->first_name,
						$user->last_name,
						$user->email);
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		$autoid = mysqli_stmt_insert_id($stmt);
		
		mysqli_stmt_free_result($stmt);
		mysqli_close($this->connection);	
		
		return $autoid;
	}
}

?>
