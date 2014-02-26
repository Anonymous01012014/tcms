<?php if (!defined("BASEPATH")) exit("No direct script access allowed");

/**
 * Class name : Count_lane_record
 * 
 * Description :
 * This class contains functions to deal with the count lane record table (Add , Edit , Delete)
 * 
 * Created date ; 14-2-2014
 * Modification date : ---
 * Modfication reason : ---
 * Author : Ahmad Mulhem Barakat
 * contact : molham225@gmail.com
 */    

class Count_lane_record_model extends CI_Model{
	/** Count lane record class variables **/
	
	//The id field of the count lane record
	var $id;
	
	//The count of the cars passed in the specified lane.
	var $count = "";
	
	//The id of the lane of this record.
	var $lane_id = "";
	
	//The id of the count record of this record.
	var $count_record_id = "";
	
	
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
	 * function name : addCountLaneRecord
	 * 
	 * Description : 
	 * add new count lane record to the database.
	 * 
	 * parameters:
	 * 	
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function addCountLaneRecord(){
		$query = "INSERT INTO count_lane_record(
							count,
							lane_id,
							count_record_id
						) 
						VALUES (
							'{$this->count}',
							'{$this->lane_id}',
							'{$this->count_record_id}'
						);
					";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : addMultiRecords
	 * 
	 * Description : 
	 * add an array of count lane records and inserts them in the data base 
	 * 
	 * parameters:
	 * count lane record array: the array of count records to be added to database.
	 * 	
	 * Created date : 26-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function addMultiRecords($count_lane_record_array){
		
		$this->db->insert_batch('count_lane_record',$count_lane_record_array);
	 }
	 
	 /**
	 * function name : deleteCountLaneRecord
	 * 
	 * Description : 
	 * delete the count lane record of the given id from the database.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function deleteCountLaneRecord(){
		$query = "delete from count_lane_record
	 			  where id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : modifyCountLaneRecord
	 * 
	 * Description : 
	 * modify the data of the count lane record of the given id.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function modifyCountLaneRecord(){
		$query = "UPDATE count_lane_record
				  SET
					count = '{$this->count}',
					lane_id = '{$this->lane_id}',
					count_record_id = '{$this->count_record_id}'					
	 			  WHERE id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : getCountLaneReocrdById
	 * 
	 * Description : 
	 * Returns the data of the count lane record specified by the given id.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getCountLaneRecordById(){
		$query = "SELECT * 
				  FROM count_lane_record
	 			  WHERE id = {$this->id}";
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	
	/**
	 * function name : getAllCountLaneRecords
	 * 
	 * Description : 
	 * Returns the data of all of the count lane records in the database.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getAllCountLaneRecords(){
		$query = "SELECT * 
				  FROM count_lane_record";
				  
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
	 
	 /**
	 * function name : getCountLaneReocrdsBylaneId
	 * 
	 * Description : 
	 * Returns the data of the count lane records specified by the given lane.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getCountLaneRecordsByLaneId(){
		$query = "SELECT * 
				  FROM count_lane_record
	 			  WHERE lane_id = {$this->lane_id}";
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
	 
	 /**
	 * function name : getCountLaneReocrdsByCountRecordId
	 * 
	 * Description : 
	 * Returns the data of the count lane record specified by the given count record.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getCountLaneRecordByCountRecordId(){
		$query = "SELECT * 
				  FROM count_lane_record
	 			  WHERE count_record_id = {$this->count_reord_id}";
		$query = $this->db->query($query);
		return $query->result_array();
	 }
}
