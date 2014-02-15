<?php if (!defined("BASEPATH")) exit("No direct script access allowed");

/**
 * Class name : Lane
 * 
 * Description :
 * This class contains functions to deal with the lane table (Add , Edit , Delete)
 * 
 * Created date ; 12-2-2014
 * Modification date : ---
 * Modfication reason : ---
 * Author : Ahmad Mulhem Barakat
 * contact : molham225@gmail.com
 */    

class Lane_model extends CI_Model{
	/** Lane class variables **/
	
	//The id field of the lane
	var $id;
	
	//The number of this lane in its site.
	var $lane_number = "";
	
	//Represents the direction of the car movement in this lane.
	var $lane_direction = "";
	
	//The last name of the user
	var $lane_spacing = "";
	
	//The lane spacing in cm.
	var $username = "";
	
	//The login password of the user encrypted with MD5 hash.
	var $password = "";
	
	//The start date of this lane.
	var $start_date = "";
	
	//The end date of this lane.
	var $end_date = "";
	
	//The id of the site of this lane.
	var $site_id = "";
	
	//The id of the counter of this lane.
	var $counter_id = "";
	
	
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
	 * function name : addLane
	 * 
	 * Description : 
	 * add new lane to the database.
	 * 
	 * parameters:
	 * 	
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function addUser(){
		$query = "INSERT INTO lane(
							lane_number,
							lane_direction,
							lane_spacing,
							start_date,
							end_date,
							site_id,
							counter_id
						) 
						VALUES (
							'{$this->lane_number}',
							'{$this->lane_direction}',
							'{$this->lane_spacing}',
							'{$this->start_date}',
							'{$this->end_date}',
							'{$this->site_id}',
							'{$this->counter_id}'
						);
					";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : deleteLane
	 * 
	 * Description : 
	 * delete the lane of the given id from the database.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function deleteLane(){
		$query = "delete from lane
	 			  where id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : modifyLane
	 * 
	 * Description : 
	 * modify the data of the lane of the given id.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function modifyLane(){
		$query = "UPDATE lane
				  SET
					lane_number = '{$this->lane_number}',
					lane_direction = '{$this->lane_direction}',
					lane_spacing = '{$this->lane_spacing}',
					start_date = '{$this->start_date}',
					end_date = '{$this->end_date}',
					site_id = '{$this->site_id}',
					counter_id = '{$this->counter_id}'
	 			  WHERE id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : getLaneById
	 * 
	 * Description : 
	 * Returns the data of the lane specified by the given id.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getLaneById(){
		$query = "SELECT * 
				  FROM lane
	 			  WHERE id = {$this->id}";
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	
	/**
	 * function name : getAllLanes
	 * 
	 * Description : 
	 * Returns the data of all of the lanes in the database.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getAllUsers(){
		$query = "SELECT * 
				  FROM lane";
				  
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
	 /**
	 * function name : getLanesBySiteId
	 * 
	 * Description : 
	 * Gets the lanes of the given site.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getLaneBySiteId(){
		$query = "SELECT * 
				  FROM lane
				  WHERE site_id = {$this->site_id}";
				  
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
}
