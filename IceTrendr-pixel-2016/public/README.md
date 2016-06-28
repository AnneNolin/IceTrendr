timesync
========

visualization and interpretation of image time series


flex: client application to interact with timesync database
	Please update the following two lines in timesyncv2.mxml to match your local settings.

			private var gateway:String = "gateway21.php";
			private var server:String = "localhost";


php: business logic for communication with timesync database
	Please update the following lines in baseservice.php to match your local settings. 

	protected $username = "User Name Here";
	protected $password = "Password HERE";
	protected $server = "Database Server";
	protected $port = "Database Port";
	protected $databasename = "Default Database";


sql: DDL for timesync database

