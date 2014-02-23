<?php if (!defined("BASEPATH")) exit("No direct script access allowed");

	/**
	 * This takes a string as a parameter splits it into an array of
	 * strings by commathen it trims each string and strips it fro quotes
	 **/
	function separate_line($line){
		$this->load->helper('string');
		$line = explode(',',$line);
		for($i=0 ;$i<count($line);$i++){
			$line[$i] = strip_quotes(trim($line[$i]));
		}
		return $line;
	}
