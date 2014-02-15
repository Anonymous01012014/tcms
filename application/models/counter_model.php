<?php if (!defined("BASEPATH")) exit("No direct script access allowed");

/**
 * Class name : Counter
 * 
 * Description :
 * This class contains functions to deal with the counter table (Add , Edit , Delete)
 * 
 * Created date ; 12-2-2014
 * Modification date : ---
 * Modfication reason : ---
 * Author : Ahmad Mulhem Barakat
 * contact : molham225@gmail.com
 */    

class Counter_model extends CI_Model{
	/** Counter class variables **/
	
	//The id field of the counter
	var $id;
	
	//The serial number of this counter.
	var $serial = "";
	
	//10-alpha-numeric value that represents the type of the Counter. 
	var $unit_type = "";
	
	//10-alpha-numeric value that represents the version of the Counter.
	var $unit_version = "";
	
	//The id of the site of this counter.
	var $site_id = "";
	
	
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
	 * function name : addCounter
	 * 
	 * Description : 
	 * add new counter to the database.
	 * 
	 * parameters:
	 * 	
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function addCounter(){
		$query = "INSERT INTO counter(
							serial,
							unit_type,
							unit_version,
							site_id
						) 
						VALUES (
							'{$this->serial}',
							'{$this->unit_type}',
							'{$this->unit_version}',
							'{$this->site_id}'
						);
					";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : deleteCounter
	 * 
	 * Description : 
	 * delete the counter of the given id from the database.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function deleteCounter(){
		$query = "delete from counter
	 			  where id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : modifyCounter
	 * 
	 * Description : 
	 * modify the data of the counter of the given id.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function modifyCounter(){
		$query = "UPDATE counter
				  SET
					serial = '{$this->serial}',
					unit_type =  = '{$this->unit_type}',
					unit_version = '{$this->unit_version}',
					site_id = '{$this->site_id}'							
	 			  WHERE id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : getCounterById
	 * 
	 * Description : 
	 * Returns the data of the counter specified by the given id.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getCounterById(){
		$query = "SELECT * 
				  FROM counter
	 			  WHERE id = {$this->id}";
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	
	/**
	 * function name : getAllCounters
	 * 
	 * Description : 
	 * Returns the data of all of the counters in the database.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getAllCounters(){
		$query = "SELECT * 
				  FROM counter";
				  
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
	 /**
	 * function name : getCounterBySiteId
	 * 
	 * Description : 
	 * Gets the counter of the given site.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getCounterBySiteId(){
		$query = "SELECT * 
				  FROM counter
				  WHERE site_id = {$this->site_id}";
				  
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
	 /**
	 * function name : getCounterBySerial
	 * 
	 * Description : 
	 * Gets the counter of the given serial.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getCounterBySerial(){
		$query = "SELECT * 
				  FROM counter
				  WHERE serial = {$this->serial}";
				  
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
}
