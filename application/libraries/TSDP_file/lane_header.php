<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Lane_header{
	/**
	 * Filename: lane_header.php
	 * Description: 
	 * This file is represents the file header of a TSDP file.
	 * 
	 * Flag: -1
	 * 
	 * created date: 18-2-2014
	 * created by: Eng. Ahmad Mulhem Barkat
	 * contact: molham225@gmail.com
	 */
	
	
	/** Lane Header class variables **/
	//Lane Number (2 – Numeric (1-64))
	var $lane_number = "";
	//Lane 1 Info (30 - Alpha-Numeric)
	var $lane_1_info = "";
	//Lane 1 Spacing (10 – Numeric CM)
	var $lane_1_spacing = "";
	//Lane Sensor Type (10 – Alpha-Numeric)
	//A = Single Axle sensor (one road tube)
	//A-A = Axle-Axle sensors (two road tubes)
	//U = User Keypress (Titan II Data)
	var $lane_sensor = "";
	//Count Method (2 – Alpha Numeric)
	///2 = Divide By two (by axles)
	//PV = One count per vehicle record
	//Blank = Don’t divide by Two
	var $count_method = "";
	//Lane Mode (10 – Alpha-Numeric)
	//Normal, Subtract, Directional
	var $count_method = "";
}
