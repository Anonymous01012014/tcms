<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Count{
	/**
	 * Filename: count.php
	 * Description: 
	 * This file is represents the count of a TSDP file.
	 * 
	 * Flag: 0
	 * 
	 * created date: 18-2-2014
	 * created by: Eng. Ahmad Mulhem Barkat
	 * contact: molham225@gmail.com
	 */
	
	
	/** Lane Header class variables **/
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
}
