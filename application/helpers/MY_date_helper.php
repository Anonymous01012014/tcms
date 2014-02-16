<?php if (!defined("BASEPATH")) exit("No direct script access allowed");

	/**
	 * This function transfroms the gicen date from DD/MM/YYYY to acceptable
	 * mysql date format (YYYY/MM/DD)
	 **/
	function date_to_sql($date){
		$date_values = array();
		$date_values = explode("/",$date);
		$sql_date = "";
		for($i= count($date_values) - 1 ; $i > 0 ; $i--){
			echo $date_values[$i] . '<br />';
			$sql_date .= $date_values[$i] . '/';
		}
		return $sql_date . $date_values[0];
	}
