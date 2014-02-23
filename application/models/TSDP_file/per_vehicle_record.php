<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Per_vehicle_records extends CI_Model{
	/**
	 * Filename: per_vehicle_records.php
	 * Description: 
	 * This file is represents the per vehicle records of a TSDP file.
	 * 
	 * Flag: 1-32 (Based on Lane Number)
	 * 
	 * created date: 18-2-2014
	 * created by: Eng. Ahmad Mulhem Barkat
	 * contact: molham225@gmail.com
	 */
	
	
	/** Per Vehicle Record class variables **/
	//Lane Number ( 1 or 2 )
	var $lane = "";
	//Date (8 - MM/DD/YY)
	var $date = "";
	//Time (8 – HH:MM:SS) 24hr clock
	var $time = "";
	//Speed (4 – XXXX (tenths of a KPH))
	var $speed = "";
	//Axles (2 – Numeric)
	var $axles = "";
	//Total Length (5 – Numeric (CM)) = Sum of all axle spacings
	// if sensors are A-A.
	var $total_length = "";
	//Axle Spacings = Array(Axle Spacing 1-2 (5 Numeric (CM)),
	//Axle Spacing 2-3 (5 Numeric (CM)),...)
	var $axle_spacings = array();
	
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
		//load enumeration helper
		$this->load->helper('enumeration');
		
		//lane number
		$this->lane = $line[0];
		//Date
		$this->date = $line[1];
		//Time
		$this->time = $line[2];
		//speed
		$this->speed = $line[3] / 10;
		//axle count
		$this->axles = $line[4];
		//total vehicle length(sum of axle spacings)
		$this->total_length = $line[5];
		
		for($i=6;$i<count($line);$i++){
			$this->axle_spacings[$i-6] = $line[$i];
		}
	}
}
