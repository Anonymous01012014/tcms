<?php if (!defined("BASEPATH")) exit("No direct script access allowed");

/**
 * Class name : Statistics Record
 * 
 * Description :
 * This class contains functions to deal with the statistics_record table (Add , Edit , Delete)
 * 
 * Created date ; 12-2-2014
 * Modification date : ---
 * Modfication reason : ---
 * Author : Ahmad Mulhem Barakat
 * contact : molham225@gmail.com
 */    

class Statistics_record_model extends CI_Model{
	/** Statistics record class variables **/
	
	//The id field of the statistics record
	var $id;
	
	//The name of the user who logged into 
	//the counter and collected the data.
	var $operator_name = "";
	
	//The weather condition at the site
	//during the data collecting process.
	var $weather = "";
	
	//Represents the type of the Statistics record.
	var $storage_mode = "";
	
	//10 Numeric, Tenths of a KPH
	var $posted_speed_limit = "";
	
	//The start date of the file’s data.
	var $start_date = "";
	
	//The start time of the file’s data.
	var $start_time = "";
	
	//The end date of the file’s data.
	var $stop_date = "";
	
	//The end time of the file’s data.
	var $stop_time = "";
	
	//The length of the interval.
	var $interval_length = "";
	
	//The id of the case of this output file.
	var $case_id = "";
	
	/**
     * Constructor
     **/	
	function __construct()
    {
        parent::__construct();
    }
    
    
    /**
     * Class functions
	 **/
    
    /**
	 * function name : addStatisticsRecord
	 * 
	 * Description : 
	 * add new statistics record to the database.
	 * 
	 * parameters:
	 * 	
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function addStatisticsRecord(){
		$query = "INSERT INTO statistics_record(
							operator_name,
							weather,
							storage_mode,
							posted_speed_limit,
							start_date,
							start_time,
							stop_date,
							stop_time,
							interval_length,
							case_id
						) 
						VALUES (
							'{$this->operator_name}',
							'{$this->weather}',
							'{$this->storage_mode}',
							'{$this->posted_speed_limit}',
							'{$this->start_date}',
							'{$this->start_time}',
							'{$this->stop_date}',
							'{$this->stop_time}',
							'{$this->interval_length}',
							'{$this->case_id}'
						);
					";
		$this->db->query($query);
		//return the latest added statistics record's id
		$query = "select max(id) as statistics_record_id from statistics_record;";
									
		$query = $this->db->query($query);
		
		return $query->result_array();
	 }
	 
	 /**
	 * function name : deleteStatisticsRecord
	 * 
	 * Description : 
	 * delete the statistics record of the given id from the database.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function deleteStatisticsRecord(){
		$query = "delete from statistics_record
	 			  where id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : modifyStatisticsRecord
	 * 
	 * Description : 
	 * modify the data of the statistics record of the given id.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function modifyStatisticsRecord(){
		$query = "UPDATE statistics_record
				  SET
					operator_name = '{$this->operator_name}',
					weather = '{$this->weather}',
					storage_mode = '{$this->storage_mode}',
					posted_speed_limit = '{$this->posted_speed_limit}',
					start_date = '{$this->start_date}',
					start_time = '{$this->start_time}',
					stop_date = '{$this->stop_date}',
					stop_time = '{$this->stop_time}',
					interval_length = '{$this->interval_length}',
					case_id = '{$this->case_id}'														
	 			  WHERE id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : getStatisticsRecordById
	 * 
	 * Description : 
	 * Returns the data of the statistics record specified by the given id.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getStatisticsRecordById(){
		$query = "SELECT * 
				  FROM statistics_record
	 			  WHERE id = {$this->id}";
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	
	/**
	 * function name : getAllStatisticsRecords
	 * 
	 * Description : 
	 * Returns the data of all of the statistics records in the database.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getAllStatisticsRecords(){
		$query = "SELECT * 
				  FROM statistics_record";
				  
		$query = $this->db->query($query);
		return $query->result_array();
	 }
}
