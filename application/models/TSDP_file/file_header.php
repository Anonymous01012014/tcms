<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class File_header extends CI_Model{
	/**
	 * Filename: file_header.php
	 * Description: 
	 * This file is represents the file header of a TSDP file.
	 * 
	 * Flag: -2
	 * created date: 18-2-2014
	 * created by: Eng. Ahmad Mulhem Barkat
	 * contact: molham225@gmail.com
	 */
	 
	/** File Header class variables **/
	//Site ID (30 - Alpha-Numeric)
	var $site_ID = "";
	//Info Line 1 (30 - Alpha-Numeric) //this will have county in it 
	var $info_line_1 = "";
	//Info Line 2 (30 - Alpha-Numeric) //this will have GPS location in it
	var $info_line_2 = "";
	//Operator (30 - Alpha-Numeric)
	var $operator = "";
	//Weather (30 - Alpha-Numeric)
	var $weather = "";
	//GPS Lat (30 - Alpha-Numeric)
	var $GPS_lat = "";
	//GPS Long (30 - Alpha-Numeric)
	var $GPS_long = "";
	//Counter Serial Number (30 - Alpha-Numeric)
	var $counter_serial = "";
	//Unit Type (10 - Alpha-Numeric)
	var $unit_type = "";
	//Unit Version (10 - Alpha-Numeric)
	var $unit_ver = "";
	//Storage Mode (“COUNT”, “PER VEHICLE”, “CLASSIFICATION”)
	var $storage_mode = "";
	//Posted Speed Limit (10 Numeric, Tenths of a KPH, i.e. 100 = 10.0KPH)
	var $posted_speed_limit = "";
	//Start Date (8 – Numeric) MM/DD/YY (always this format regardless of system
	//selected date format)
	var $start_date = "";
	//Start Time (8 – Numeric) HH:MM:SS (24hr clock)
	var $start_time = "";
	//Stop Date (8– Numeric) MM/DD/YY (always this format regardless of system
	//selected date format)
	var $stop_date = "";
	//Stop Time (8 – Numeric) HH:MM:SS (24hr clock)
	var $stop_time = "";
	//Number of Lanes (1 or 2)
	var $num_of_lanes = "";
	//Record Interval Length (when mode is Count or 
	//Classification, this is the interval used)
	var $interval_length = "";
	//The id of the case for this file
	var $case_id = "";
	
	/**
	 * Function name: insert
	 * Description: 
	 * This function takes the inserted line and
	 *  store it in this file fields.
	 * 
	 * Parameters:
	 * $line: array of strings.
	 * 
	 * created date: 23-2-2014
	 * created by: Eng. Ahmad Mulhem Barkat
	 * contact: molham225@gmail.com
	 */
	 public function insert($line){
		//load helpers
		$this->load->helper('enumeration');
		//Site name
		$this->site_ID = $line[1];
		//info line 1 
		$this->info_line_1 = $line[2];
		//info line 2
		$this->info_line_2 = $line[3];
		//Operator name
		$this->operator = $line[4];
		//Weather condition
		$this->weather = $line[5];
		
		//GSP latitude and longitude
		if($line[6] !== ""){
			$this->GPS_lat = $line[6];
		}
		if($line[7] !== ""){
			$this->GPS_long = $line[7];
		}
		
		/** Counter information **/
		//counter serial number
		$this->counter_serial = $line[8];
		//counter unit type
		$this->unit_type = $line[9];
		//counter unit version
		$this->unit_ver = $line[10];
		
		//storage mode
		$this->storage_mode = storage_mode_enum($line[11]);
		//posted speed limit
		$this->posted_speed_limit = $line[12];
		//start date/time
		$this->start_date = $line[13];
		$this->start_time = $line[14];
		//stop date/time
		$this->stop_date = $line[15];
		$this->stop_time = $line[16];
	 }
	
}
