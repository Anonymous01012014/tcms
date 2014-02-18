<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Classification_records{
	/**
	 * Filename: classification_records.php
	 * Description: 
	 * This file is represents the Classification records of a TSDP file.
	 * 
	 * Flag: 0
	 * 
	 * created date: 18-2-2014
	 * created by: Eng. Ahmad Mulhem Barkat
	 * contact: molham225@gmail.com
	 */
	
	
	/** classification records class variables **/
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
	var $bin_totas = array();
}
