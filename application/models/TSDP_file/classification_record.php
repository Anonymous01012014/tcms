<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Classification_records extends CI_Model{
	/**
	 * Filename: classification_records.php
	 * Description: 
	 * This file is represents the Classification records of a TSDP file.
	 * 
	 * 
	 * created date: 18-2-2014
	 * created by: Eng. Ahmad Mulhem Barkat
	 * contact: molham225@gmail.com
	 */
	
	
	/** classification records class variables **/
	//Lane Number ( 1 or 2 )
	var $lane = "";
	//Date (8 - MM/DD/YY)
	var $date = "";
	//Time (8 – HH:MM:SS) 24hr clock
	var $time = "";
	//Interval Length (1-4 Numeric) 1,2,5,10,15,30,60,1440
	var $interval_length = "";
	//Type of classification data:
	//1-Axle, 2-Speed, 3-Length, 4-Gap, 5-Headway
	var $type = "";
	//Bin totals = Array(Bin total 1 , Bin total 1)
	var $bin_totals = array();
	
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
		//The length of the interval
		$this->interval_length = $line[3];
		//classification type
		$this->type = classification_type_enum($line[4]);
		//Bin totals = Array(Bin total 1 , Bin total 1)
		for($i=5;$i<count($line);;$i++){
			$this->bin_totals[$i - 5] = $line[$i];
		}
	}
}
