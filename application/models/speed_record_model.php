<?php if (!defined("BASEPATH")) exit("No direct script access allowed");

/**
 * Class name : Speed_record
 * 
 * Description :
 * This class contains functions to deal with the speed record table (Add , Edit , Delete)
 * 
 * Created date ; 14-2-2014
 * Modification date : ---
 * Modfication reason : ---
 * Author : Ahmad Mulhem Barakat
 * contact : molham225@gmail.com
 */    

class Speed_record_model extends CI_Model{
	/** Speed record class variables **/
	
	//The id field of the speed record
	var $id;
	
	//The count of cars of the specified FHWA speed
	//in the specified lane.
	var $count = "";
	
	//The FHWA speed category.
	var $FHWA_speed = "";
	
	//The id of the classification record of this record.
	var $classification_record_id = "";
	
	//The id of the lane of this record.
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
	 * function name : addSpeedRecord
	 * 
	 * Description : 
	 * add new speed record to the database.
	 * 
	 * parameters:
	 * 	
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function addSpeedRecord(){
		$query = "INSERT INTO speed_record(
							count,
							FHWA_speed,
							classification_record_id,
							lane_id
						) 
						VALUES (
							'{$this->count}',
							'{$this->FHWA_speed}',
							'{$this->classification_record_id}',
							'{$this->lane_id}'
						);
					";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : deleteSpeedRecord
	 * 
	 * Description : 
	 * Delete the speed record of the given id from the database.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function deleteSpeedRecord(){
		$query = "delete from speed_record
	 			  where id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : modifySpeedRecord
	 * 
	 * Description : 
	 * modify the data of the speed record of the given id.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function modifySpeedRecord(){
		$query = "UPDATE speed_record
				  SET
					count = '{$this->count}',
					FHWA_speed = '{$this->FHWA_speed}',
					classification_record_id = '{$this->classification_record_id}',
					lane_id = '{$this->lane_id}'			
	 			  WHERE id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : getSpeedReocrdById
	 * 
	 * Description : 
	 * Returns the data of the speed record specified by the given id.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getSpeedRecordById(){
		$query = "SELECT * 
				  FROM speed_record
	 			  WHERE id = {$this->id}";
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	
	/**
	 * function name : getAllSpeedRecords
	 * 
	 * Description : 
	 * Returns the data of all of the speed records in the database.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getAllSpeedRecords(){
		$query = "SELECT * 
				  FROM speed_record";
				  
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
	 
	 /**
	 * function name : getSpeedReocrdsByClassificationRecordId
	 * 
	 * Description : 
	 * Returns the data of the speed record specified by the
	 * given classification record.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getSpeedReocrdsByClassificationRecordId(){
		$query = "SELECT * 
				  FROM speed_record
	 			  WHERE classification_record_id = {$this->classification_record_id}";
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
	 
	 /**
	 * function name : getSpeedReocrdsByLaneId
	 * 
	 * Description : 
	 * Returns the data of the speed record specified by the
	 * given lane.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getSpeedReocrdsByLaneId(){
		$query = "SELECT * 
				  FROM speed_record
	 			  WHERE lane_id = {$this->lane_id}";
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
}
