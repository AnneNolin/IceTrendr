-- Note: not all the referential integrity defintions are 
-- defined in this script. 
-- please make changes as you need to enforce the referential integrity.

--
-- Table structure for table `image_list`
--

DROP TABLE IF EXISTS `image_list`;
CREATE TABLE `image_list` (
  `project_id` int(11) DEFAULT NULL,
  `tsa` int(11) DEFAULT NULL,
  `imgtype` varchar(255) NOT NULL,
  `imgyear` int(11) NOT NULL,
  `imgday` int(11) NOT NULL,
  `reflfile` varchar(255) NOT NULL,
  `tcfile` varchar(255) NOT NULL,
  `cloudfile` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `interpreter`
--

DROP TABLE IF EXISTS `interpreter`;
CREATE TABLE `interpreter` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(80) DEFAULT NULL,
  `first_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(40) DEFAULT NULL,
  `password` char(40) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=latin1;

--
-- Table structure for table `neighborhood`
--

DROP TABLE IF EXISTS `neighborhood`;
CREATE TABLE `neighborhood` (
  `neighbor_id` int(11) NOT NULL AUTO_INCREMENT,
  `plotid` int(11) DEFAULT NULL,
  `image_year` int(11) DEFAULT NULL,
  `image_julday` int(11) DEFAULT NULL,
  `change_process` varchar(30) DEFAULT NULL,
  `patch_size` varchar(15) DEFAULT NULL,
  `relative_magnitude` varchar(10) DEFAULT NULL,
  `centroid_direction` int(11) DEFAULT NULL,
  `plot_included` bit(1) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `interpreter` int(80) DEFAULT NULL,
  `tsa` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`neighbor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

--
-- Table structure for table `plot_comments`
--

DROP TABLE IF EXISTS `plot_comments`;
CREATE TABLE `plot_comments` (
  `project_id` int(11) NOT NULL,
  `tsa` int(11) NOT NULL,
  `plotid` int(11) NOT NULL,
  `interpreter` int(80) NOT NULL,
  `comment` mediumtext,
  `is_example` tinyint(1) DEFAULT NULL,
  `is_complete` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`project_id`,`tsa`,`plotid`,`interpreter`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `plots`
--

DROP TABLE IF EXISTS `plots`;
CREATE TABLE `plots` (
  `project_id` int(11) DEFAULT NULL,
  `tsa` int(11) DEFAULT NULL,
  `plotid` int(11) DEFAULT NULL,
  `x` double DEFAULT NULL,
  `y` double DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `is_forest` bit(1) DEFAULT NULL,
  `is_tiger_urban` bit(1) DEFAULT NULL,
  KEY `ptp` (`project_id`,`tsa`,`plotid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `project_interpreter`
--

DROP TABLE IF EXISTS `project_interpreter`;
CREATE TABLE `project_interpreter` (
  `project_id` int(11) DEFAULT NULL,
  `tsa` int(11) DEFAULT NULL,
  `interpreter` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `isactive` int(11) DEFAULT NULL,
  `role` int(11) DEFAULT '1' COMMENT '1: interpreter; 2: arbitrator',
  `complete_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `project_tsa`
--

DROP TABLE IF EXISTS `project_tsa`;
CREATE TABLE `project_tsa` (
  `project_id` int(11) DEFAULT NULL,
  `tsa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_code` varchar(32) DEFAULT NULL,
  `project_name` varchar(250) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `contact` varchar(250) DEFAULT NULL,
  `plot_size` int(11) NOT NULL DEFAULT '1',
  `target_day` int(11) NOT NULL DEFAULT '215',
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

--
-- Table structure for table `region_spectrals`
--

DROP TABLE IF EXISTS `region_spectrals`;
CREATE TABLE `region_spectrals` (
  `project_id` int(11) DEFAULT NULL,
  `tsa` int(11) DEFAULT NULL,
  `plotid` int(11) NOT NULL,
  `sensor` varchar(255) NOT NULL,
  `image_year` int(11) NOT NULL,
  `image_julday` int(11) NOT NULL,
  `b1` varchar(255) NOT NULL,
  `b2` varchar(255) NOT NULL,
  `b3` varchar(255) NOT NULL,
  `b4` varchar(255) NOT NULL,
  `b5` varchar(255) NOT NULL,
  `b7` varchar(255) NOT NULL,
  `tcb` varchar(255) NOT NULL,
  `tcg` varchar(255) NOT NULL,
  `tcw` varchar(255) NOT NULL,
  `cloud` varchar(255) DEFAULT NULL,
  `cloud_cover` int(11) DEFAULT NULL,
  `spectral_scaler` int(11) DEFAULT NULL,
  KEY `ptp` (`project_id`,`tsa`,`plotid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
CREATE TABLE `registration` (
  `registration_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `registration_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`registration_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

--
-- Table structure for table `spectral_properties`
--

DROP TABLE IF EXISTS `spectral_properties`;
CREATE TABLE `spectral_properties` (
  `spectral_id` int(11) NOT NULL,
  `spectral_name` varchar(255) NOT NULL,
  `spectral_min` float NOT NULL,
  `spectral_mean` float NOT NULL,
  `spectral_max` float NOT NULL,
  `spectral_std` float NOT NULL,
  PRIMARY KEY (`spectral_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `vertex`
--

DROP TABLE IF EXISTS `vertex`;
CREATE TABLE `vertex` (
  `vertex_id` int(11) NOT NULL AUTO_INCREMENT,
  `plotid` int(11) DEFAULT NULL COMMENT 'plot identifier',
  `image_year` int(11) DEFAULT NULL COMMENT 'vertex year',
  `image_julday` int(11) DEFAULT NULL COMMENT 'vertex image julian day',
  `dominant_landuse` varchar(50) DEFAULT NULL COMMENT 'dominant land use',
  `dominant_landuse_over50` bit(1) DEFAULT NULL COMMENT 'is dominant landuse over 50%',
  `other_landuse` text COMMENT 'other land use',
  `landuse_confidence` varchar(10) DEFAULT NULL COMMENT 'confidence level for land use: high, medium, low',
  `dominant_landcover` varchar(50) DEFAULT NULL COMMENT 'dominant land cover',
  `dominant_landcover_over50` bit(1) DEFAULT NULL COMMENT 'is dominant land cover over 50%',
  `other_landcover` text COMMENT 'other land cover',
  `landcover_confidence` varchar(10) DEFAULT NULL COMMENT 'land cover confidence',
  `landcover_ephemeral` bit(1) DEFAULT NULL COMMENT 'is landcover ephemeral',
  `date_confidence` varchar(10) DEFAULT NULL COMMENT 'confidence level for this image date as a vertex',
  `change_process` varchar(30) DEFAULT NULL COMMENT 'change process leading to this vertex',
  `change_process_confidence` varchar(10) DEFAULT NULL COMMENT 'change process confidence level',
  `comments` varchar(255) DEFAULT NULL COMMENT 'any other comments regarding this vertex',
  `interpreter` int(80) DEFAULT NULL,
  `tsa` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `julday` int(11) DEFAULT NULL,
  PRIMARY KEY (`vertex_id`),
  KEY `ptp` (`plotid`,`tsa`,`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
