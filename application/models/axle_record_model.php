<?php if (!defined("BASEPATH")) exit("No direct script access allowed");

/**
 * Class name : Axle_record
 * 
 * Description :
 * This class contains functions to deal with the axle record table (Add , Edit , Delete)
 * 
 * Created date ; 14-2-2014
 * Modification date : ---
 * Modfication reason : ---
 * Author : Ahmad Mulhem Barakat
 * contact : molham225@gmail.com
 */    

class Axle_record_model extends CI_Model{
	/** Axle record class variables **/
	
	//The id field of the axle record
	var $id;
	
	//The count of cars of the specified FHWA class
	//in the specified lane.
	var $count = "";
	
	//The FHWA class category depending on number of axles in a vehicle.
	var $FHWA_class = "";
	
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
	 * function name : addAxleRecord
	 * 
	 * Description : 
	 * add new axle record to the database.
	 * 
	 * parameters:
	 * 	
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function addAxleRecord(){
		$query = "INSERT INTO axle_record(
							count,
							FHWA_class,
							classification_record_id,
							lane_id
						) 
						VALUES (
							'{$this->count}',
							'{$this->FHWA_class}',
							'{$this->classification_record_id}',
							'{$this->lane_id}'
						);
					";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : deleteAxleRecord
	 * 
	 * Description : 
	 * delete the axle record of the given id from the database.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function deleteAxleRecord(){
		$query = "delete from axle_record
	 			  where id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : modifyAxleRecord
	 * 
	 * Description : 
	 * modify the data of the axle record of the given id.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function modifyAxleRecord(){
		$query = "UPDATE axle_record
				  SET
					count = '{$this->count}',
					FHWA_class = '{$this->FHWA_class}',
					classification_record_id = '{$this->classification_record_id}',
					lane_id = '{$this->lane_id}'			
	 			  WHERE id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : getAxleReocrdById
	 * 
	 * Description : 
	 * Returns the data of the axle record specified by the given id.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getAxleRecordById(){
		$query = "SELECT * 
				  FROM axle_record
	 			  WHERE id = {$this->id}";
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	
	/**
	 * function name : getAllAxleRecords
	 * 
	 * Description : 
	 * Returns the data of all of the axle records in the database.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getAllAxleRecords(){
		$query = "SELECT * 
				  FROM axle_record";
				  
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
}
