<?php if (!defined("BASEPATH")) exit("No direct script access allowed");

/**
 * Class name : Count_record
 * 
 * Description :
 * This class contains functions to deal with the count record table (Add , Edit , Delete)
 * 
 * Created date ; 14-2-2014
 * Modification date : ---
 * Modfication reason : ---
 * Author : Ahmad Mulhem Barakat
 * contact : molham225@gmail.com
 */    

class Count_record_model extends CI_Model{
	/** Count record class variables **/
	
	//The id field of the count record
	var $id;
	
	//The date of the current record’s info.
	var $date = "";
	
	//The time of the current record’s info.
	var $time = "";
	
	//The length of the interval.
	//(1-4 Numeric) 1,2,5,10,15,30,60,1440.
	var $interval_length = "";
	
	//The id of the statistics record of this count record.
	var $statistics_record_id = "";
	
	//Array of count lane records.
	//Each field of it is a Count_lane_record object.
	var $count_lane_record = array();
	
	
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
	 * function name : addCountRecord
	 * 
	 * Description : 
	 * add new count record to the database.
	 * 
	 * parameters:
	 * 	
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function addCountRecord(){
		$query = "INSERT INTO count_record(
							date,
							time,
							interval_length,
							statistics_record_id
						) 
						VALUES (
							'{$this->date}',
							'{$this->time}',
							'{$this->interval_length}',
							'{$this->statistics_record_id}'
						);
					";
		$this->db->query($query);
		//return the latest added count record's id
		$query = "select max(id) as count_record_id from count_record;";
									
		$query = $this->db->query($query);
		
		return $query->result_array();
	 }
	 
	 /**
	 * function name : deleteCountRecord
	 * 
	 * Description : 
	 * delete the count record of the given id from the database.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function deleteCountRecord(){
		$query = "delete from count_record
	 			  where id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : modifyCountRecord
	 * 
	 * Description : 
	 * modify the data of the count record of the given id.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function modifyCountRecord(){
		$query = "UPDATE count_record
				  SET
					date = '{$this->date}',
					time = '{$this->time}',
					interval_length = '{$this->interval_length}',
					statistics_record_id = '{$this->statistics_record_id}'						
	 			  WHERE id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : getCountReocrdById
	 * 
	 * Description : 
	 * Returns the data of the count record specified by the given id.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getCountRecordById(){
		$query = "SELECT * 
				  FROM count_record
	 			  WHERE id = {$this->id}";
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	
	/**
	 * function name : getAllCountRecords
	 * 
	 * Description : 
	 * Returns the data of all of the count records in the database.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getAllCountRecords(){
		$query = "SELECT * 
				  FROM count_record";
				  
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
	 
	 /**
	 * function name : getCountReocrdsBetweenDates
	 * 
	 * Description : 
	 * Returns the data of the count records whose dates are 
	 * between the given start and end dates.
	 * 
	 * Parameters:
	 * start_date(Type: date)
	 * end_date(Type: date)
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getCountReocrdsBetweenDates($start_date,$end_date){
		$query = "SELECT * 
				  FROM count_record
	 			  WHERE date >= {$start_date} 
					AND date <= {$end_date}   ";
		$query = $this->db->query($query);
		return $query->result_array();
	 }
}
