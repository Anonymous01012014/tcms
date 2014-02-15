<?php if (!defined("BASEPATH")) exit("No direct script access allowed");

/**
 * Class name : Lane Record
 * 
 * Description :
 * This class contains functions to deal with the lane_record table (Add , Edit , Delete)
 * 
 * Created date ; 12-2-2014
 * Modification date : ---
 * Modfication reason : ---
 * Author : Ahmad Mulhem Barakat
 * contact : molham225@gmail.com
 */    

class Lane_record_model extends CI_Model{
	/** Counter class variables **/
	
	//The id field of the lane record
	var $id;
	
	//Represents the type of the sensor on the given lane.
	var $lane_sensor = "";
	
	//Represents the count mode. 
	var $count_mode = "";
	
	//Represents the mode of the given lane.
	var $lane_mode = "";
	
	//The id of the statistics record of this lane record.
	var $statistics_record_id = "";
	
	//the id of the lane this record is for.
	var $lane_id = "";
	
	
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
	 * function name : addLaneRecord
	 * 
	 * Description : 
	 * add new lane record to the database.
	 * 
	 * parameters:
	 * 	
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function addLaneRecord(){
		$query = "INSERT INTO lane_record(
							lane_sensor,
							count_method,
							lane_mode,
							statistics_record_id,
							lane_id
						) 
						VALUES (
							'{$this->lane_sensor}',
							'{$this->count_method}',
							'{$this->lane_mode}',
							'{$this->statistics_record_id}',
							'{$this->lane_id}'
						);
					";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : deleteLaneRecord
	 * 
	 * Description : 
	 * delete the lane record of the given id from the database.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function deleteLaneRecord(){
		$query = "delete from lane_record
	 			  where id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : modifyLaneRecord
	 * 
	 * Description : 
	 * modify the data of the lane record of the given id.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function modifyLaneRecord(){
		$query = "UPDATE lane_record
				  SET
					lane_sensor = '{$this->lane_sensor}',
					count_method = '{$this->count_method}',
					lane_mode = '{$this->lane_mode}',
					statistics_record_id = '{$this->statistics_record_id}',
					lane_id = '{$this->lane_id}'					
	 			  WHERE id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : getLaneRecordById
	 * 
	 * Description : 
	 * Returns the data of the lane record specified by the given id.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getLaneRecordById(){
		$query = "SELECT * 
				  FROM lane_record
	 			  WHERE id = {$this->id}";
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	
	/**
	 * function name : getAllLaneRecords
	 * 
	 * Description : 
	 * Returns the data of all of the lane records in the database.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getAllCounters(){
		$query = "SELECT * 
				  FROM lane_record";
				  
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
	 /**
	 * function name : getLaneRecordByLaneId
	 * 
	 * Description : 
	 * Returns the data of the lane records of the given lane.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getLaneRecordByLaneId(){
		$query = "SELECT * 
				  FROM lane_record
	 			  WHERE lane_id = {$this->lane_id}";
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
}
