<?php if (!defined("BASEPATH")) exit("No direct script access allowed");

/**
 * Class name : Case
 * 
 * Description :
 * This class contains functions to deal with the case table (Add , Edit , Delete)
 * 
 * Created date ; 12-2-2014
 * Modification date : ---
 * Modfication reason : ---
 * Author : Ahmad Mulhem Barakat
 * contact : molham225@gmail.com
 */    

class Case_model extends CI_Model{
	/** Case class variables **/
	
	//The id field of the case
	var $id;
	
	//The date of opening this case.
	var $open_date = "";
	
	//The time of opening this case.
	var $open_time = "";
	
	//The date of closing this case.
	var $close_date = "";
	
	//The time of closing this case.
	var $close_time = "";
	
	//The date of accepting/rejecting this case.
	var $accept_reject_date = "";
	
	//The time of accepting/rejecting this case.
	var $accept_reject_time = "";
	
	//Current status of this case.
	var $status = "";
	
	//Reason for manually closing this case. 
	var $manual_closing_reason = "";
	
	//Reason for rejecting this case. 
	var $rejecting_reason = "";
	
	//The id of the collector for this case.
	var $collector_id = "";
	
	//The id of the operator for this case.
	var $operator_id = "";
	
	
	/**
     * Constructor
     **/	
	function __construct()
    {
        parent::__construct();
        $this->load->helper('enumeration');
    }
    
    /**
     * Class functions
	 **/
    
    /**
	 * function name : openCase
	 * 
	 * Description : 
	 * add new case to the database and set its status to open.
	 * 
	 * open = 0
	 * 
	 * parameters:
	 * 	
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function openCase(){		 
		$query = "INSERT INTO case(
							open_date,
							open_time,
							close_date,
							close_time,
							accept_reject_date,
							accept_reject_time,
							status,
							manual_closing_reason,
							rejecting_reason,
							collector_id,
							operator_id
						) 
						VALUES (
							'{$this->open_date}',
							'{$this->open_time}',
							'{$this->close_date}',
							'{$this->close_time}',
							'{$this->accept_reject_date}',
							'{$this->accept_reject_time}',
							'".OPENED."',
							'{$this->manual_closing_reason}',
							'{$this->rejecting_reason}',
							'{$this->collector_id}',
							'{$this->operator_id}'
						);
					";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : deleteCase
	 * 
	 * Description : 
	 * delete the case of the given id from the database.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function deleteCase(){
		$query = "delete from case
	 			  where id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : modifyCase
	 * 
	 * Description : 
	 * modify the data of the case of the given id.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function modifyCase(){
		$query = "UPDATE case
				  SET
					open_date = '{$this->open_date}',
					open_time = '{$this->open_time}',
					close_date = '{$this->close_date}',
					close_time = '{$this->close_time}',
					accept_reject_date = '{$this->accept_reject_date}',
					accept_reject_time = '{$this->accept_reject_time}',
					status = '{$this->status}',
					manual_closing_reason = '{$this->manual_closing_reason}',
					rejecting_reason = '{$this->rejecting_reason}',
					collector_id = '{$this->collector_id}',
					operator_id = '{$this->operator_id}'					
	 			  WHERE id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : closeNormally
	 * 
	 * Description : 
	 * Set the status of the case to closedNormally and 
	 * set the close date and time to the current date and time and 
	 * set the collector id to the user uploaded the file.
	 * 
	 * 1 = closedNormally
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function closeNormally(){
		$query = "UPDATE case
				  SET
					close_date = '{$this->close_date}',
					close_time = '{$this->close_time}',
					status = '".CLOSED_NORMALLY."',
					collector_id = '{$this->collector_id}',					
	 			  WHERE id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : closeManually
	 * 
	 * Description : 
	 * Set the status of the case to closedNormally and 
	 * set the close date and time to the current date and time and 
	 * set the reason for manually closing to the given one and
	 * set the collector id to the user uploaded the file.
	 * 
	 * 2 = closedManually
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function closeManually(){
		$query = "UPDATE case
				  SET
					close_date = '{$this->close_date}',
					close_time = '{$this->close_time}',
					status = '".CLOSED_MANUALLY."',
					manual_closing_reason = '{$this->manual_closing_reason}',
					collector_id = '{$this->collector_id}',					
	 			  WHERE id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : acceptCase
	 * 
	 * Description : 
	 * Set the status of the case to closedAccepted and 
	 * set the accept/reject date and time to the current date and time.
	 * 
	 * 3 = closedAccepted
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function acceptCase(){
		$query = "UPDATE case
				  SET
					accept_reject_date = '{$this->accept_reject_date}',
					accept_reject_time = '{$this->accept_reject_time}',
					status = '".ACCEPTED_CLOSED."',					
	 			  WHERE id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : rejectCase
	 * 
	 * Description : 
	 * Set the status of the case to closedRejected and 
	 * set the accept/reject date and time to the current date and time.
	 * 
	 * 4 = closedRejected
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function rejectCase(){
		$query = "UPDATE case
				  SET
					accept_reject_date = '{$this->accept_reject_date}',
					accept_reject_time = '{$this->accept_reject_time}',
					rejecting_reason = '{$this->rejecting_reason}',
					status = '".REJECTED_CLOSED."',					
	 			  WHERE id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : getCaseById
	 * 
	 * Description : 
	 * Returns the data of the case specified by the given id.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getCaseById(){
		$query = "SELECT * 
				  FROM case
	 			  WHERE id = {$this->id}";
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	
	/**
	 * function name : getAllCases
	 * 
	 * Description : 
	 * Returns the data of all of the cases in the database.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getAllCases(){
		$query = "SELECT * 
				  FROM case";
				  
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
	 /**
	 * function name : getCasesBySiteId
	 * 
	 * Description : 
	 * Gets the cases of the given site.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getCasesBySiteId(){
		$query = "SELECT * 
				  FROM case
				  WHERE site_id = {$this->site_id}";
				  
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
	 /**
	 * function name : getOpenCases
	 * 
	 * Description : 
	 * Gets all of the open cases from  the database.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getOpenCases(){
		$query = "SELECT * 
				  FROM case
				  WHERE status = '".OPENED."'";
				  
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
	 /**
	 * function name : getNormallyClosedCases
	 * 
	 * Description : 
	 * Gets all of the normally closed cases from  the database.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getNormallyClosedCases(){
		$query = "SELECT * 
				  FROM case
				  WHERE status = '".CLOSED_NORMALLY."'";
				  
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
}
