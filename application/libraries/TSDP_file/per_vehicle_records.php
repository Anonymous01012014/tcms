<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Per_vehicle_records{
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
	
	
	/** Lane Header class variables **/
	//Date (8 - MM/DD/YY)
	var $date = "";
	//Time (8 – HH:MM:SS) 24hr clock
	var $time = "";
	//Speed (4 – XXXX (tenths of a KPH))
	var $speed = "";
	//Axles (2 – Numeric)
	var $axles = array();
	//Total Length (5 – Numeric (CM)) = Sum of all axle spacings
	// if sensors are A-A.
	var $total_length = array();
	//Axle Spacings = Array(Axle Spacing 1-2 (5 Numeric (CM)),
	//Axle Spacing 2-3 (5 Numeric (CM)),...)
	var $axle_spacings = array();
}
