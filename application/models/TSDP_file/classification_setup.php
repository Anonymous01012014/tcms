<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Classification_setup extends CI_Model{
	/**
	 * Filename: classification_setup.php
	 * Description: 
	 * This file is represents the classification setup of a TSDP file.
	 * 
	 * Flag: -4
	 * 
	 * created date: 18-2-2014
	 * created by: Eng. Ahmad Mulhem Barkat
	 * contact: molham225@gmail.com
	 */
	
	
	/** Lane Header class variables **/
	//Number of Axle Classifications (0 if not used, numeric 1-60)
	var $num_of_axle_classes = "";
	//Axle Class Scheme Name (30 - Alpha-Numeric)
	var $axle_class_scheme = "";
	//Number of Speed Classifications (0 if not used, numeric 1-60)
	var $num_of_speed_classes = "";
	//Speed Class Scheme Name (30 - Alpha-Numeric)
	var $speed_class_scheme = "";
	//Number of Length Classifications (0 if not used, numeric 1-60)
	var $num_of_length_classes = "";
	//Length Class Scheme Name (30 - Alpha-Numeric)
	var $length_class_scheme = "";
	//Number of Gap Classifications (0 if not used, numeric 1-60)
	var $num_of_gap_classes = "";
	//Gap Class Scheme Name (30 - Alpha-Numeric)
	var $gap_class_scheme = "";
	//Number of Headway Classifications (0 if not used, numeric 1-60)
	var $num_of_headway_classes = "";
	//Length Class Scheme Name (30 - Alpha-Numeric)
	var $headway_class_scheme = "";
	
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
		
		/** Axle Classification **/
		//number of axle classifications
		$this->num_of_axle_classes = $line[1];
		//Axle classification scheme name
		$this->axle_class_scheme = $line[2];
		
		/** Speed Classification **/
		//number of speed classifications
		$this->num_of_speed_classes = $line[3];
		//speed classification scheme name
		$this->speed_class_scheme = $line[4];
		
		/** Length Classification **/
		//number of length classifications
		$this->num_of_length_classes = $line[5];
		//Length classification scheme name
		$this->length_class_scheme = $line[6];
		
		/** Gap Classification **/
		//number of gap classifications
		$this->num_of_gap_classes = $line[7];
		//Gap classification scheme name
		$this->gap_class_scheme = $line[8];
		
		/** Headway Classification **/
		//number of headway classifications
		$this->num_of_headway_classes = $line[9];
		//Headway classification scheme name
		$this->headway_class_scheme = $line[10];
		
	}
}
