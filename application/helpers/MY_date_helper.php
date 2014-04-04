<?php if (!defined("BASEPATH")) exit("No direct script access allowed");

	/**
	 * This function transfroms the gicen date from MM/DD/YYYY to acceptable
	 * mysql date format (YYYY-MM-DD)
	 **/
	function date_to_sql($date){
		$date_values = explode("/",$date);
		$sql_date = "";
		if(count($date_values) == 3)
		$sql_date = $date_values[2]."-".$date_values[0]."-".$date_values[1];
		return $sql_date;
	}
