<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Count_record extends CI_Model{
	/**
	 * Filename: count_record.php
	 * Description: 
	 * This file is represents a count record of a TSDP file.
	 * 
	 * Flag: 0
	 * 
	 * created date: 18-2-2014
	 * created by: Eng. Ahmad Mulhem Barkat
	 * contact: molham225@gmail.com
	 */
	
	
	/** Count Record class variables **/
	//Date (8 - MM/DD/YY)
	var $date = "";
	//Time (8 – HH:MM:SS) 24hr clock
	var $time = "";
	//Interval Length (1-4 Numeric) 1,2,5,10,15,30,60,1440
	var $interval_length = "";
	//lane_total = Array(Lane_number => Lane_total)
	//Lane # (2 – Numeric (1-64))
	//Lane Total (1-6 Numeric)
	var $lane_total = array();
	
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
		
		//Date
		$this->date = $line[1];
		//Time
		$this->time = $line[2];
		//The length of the interval
		$this->interval_length = $line[3];
		
		for($i=4;$i<count($line);$i += 2){
			//lane_total = Array(Lane_number => Lane_total)
			$this->lane_total[$line[$i]] = $line[$i + 1];
		}
	}
}
