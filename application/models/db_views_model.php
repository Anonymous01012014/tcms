<?php if (!defined("BASEPATH")) exit("No direct script access allowed");

/**
 * Class name : Db_views
 * 
 * Description :
 * This class contains functions to get data from the views tables in the database 
 * 
 * Created date ; 24-2-2014
 * Modification date : ---
 * Modfication reason : ---
 * Author : Ahmad Mulhem Barakat
 * contact : molham225@gmail.com
 */    

class Db_views_model extends CI_Model{
	/**
     * Class functions
	 **/
    
    /**
	 * function name : getSiteCountersByCaseId
	 * 
	 * Description : 
	 * Gets the counters of the site of the given case.
	 * 
	 * parameters:
	 * 	
	 * Created date : 24-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getSiteCountersByCaseId($case_id){	
		$query = "SELECT * 
				  FROM case_site_counters
				  WHERE case_id = {$case_id} ";
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
	 
	 /**
	 * function name : getSiteCountersByCaseId
	 * 
	 * Description : 
	 * Gets the last two days case activities from the data base
	 * 
	 * parameters:
	 * 	
	 * Created date : 2-3-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getCaseActivities(){	
		$query = "SELECT * 
				  FROM case_activities ";
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
	 
	 /**
	 * function name : getCaseCount
	 * 
	 * Description : 
	 * get case count from views by case id
	 * 
	 * parameters:
	 * case_id: case id	
	 * Created date : 25-5-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Mohanad Kaleia
	 * contact : molham225@gmail.com
	 */
	 public function getCaseCount(){	
		$query = "SELECT * 
				  FROM case_activities ";
		$query = $this->db->query($query);
		return $query->result_array();
	 }

}
