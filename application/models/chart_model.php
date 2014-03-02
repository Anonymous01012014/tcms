<?php if (!defined("BASEPATH")) exit("No direct script access allowed");

/**
 * Class name : Chart_model
 * 
 * Description :
 * This class contains functions to deal with charts {count - per vehicle - axle - speed}
 * 
 * Created date ; 28-2-2014
 * Modification date : ---
 * Modfication reason : ---
 * Author : Ahmad Mulhem Barakat
 * contact : molham225@gmail.com
 */    

class Chart_model extends CI_Model{
	/** Site class variables **/
	
	//The id field of the site
	var $site_id;
	
	//The id field of the case
	var $case_id;
	
	//The date field of count
	var $date;
	
	//The field of the count
	var $count;
	
	/**
     * Constructor
	 **/	
	function __construct()
    {
        parent::__construct();
    }
    
    
	
	/**
	 * function name : getCountsBySite
	 * 
	 * Description : 
	 * This function will get the counts by range of date for a specific site
	 * 
	 * Created date : 28-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Mohanad Kaleia
	 * contact : ms.kaleia@gmail.com
	 */
	 public function getCountsBySite($start_date , $end_date){
		$query = "SELECT * 
				  FROM accepted_case_counts
				  where 
				  site_id = {$this->site_id}
				  and 
				  date >= '{$start_date}'
				  and
				  date < '{$end_date}'
				  ;
				  ";
				  
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
	 
	 /**
	 * function name : getCounts
	 * 
	 * Description : 
	 * This function will get the counts by range of date for a specific site
	 * 
	 * Created date : 28-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Mohanad Kaleia
	 * contact : ms.kaleia@gmail.com
	 */
	 public function getCounts(){
		$query = "SELECT * 
				  FROM accepted_case_counts				  
				  ;
				  ";
				  
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
}
