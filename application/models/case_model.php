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
	
	//The id of the admin for this case.
	var $admin_id = "";
	
	//The id of the site for this case.
	var $site_id = "";
	
	
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
		$query = "INSERT INTO `case`(
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
							admin_id,
							site_id
						) 
						VALUES (
							CURDATE(),
							CURTIME(),
							'{$this->close_date}',
							'{$this->close_time}',
							'{$this->accept_reject_date}',
							'{$this->accept_reject_time}',
							'".OPENED."',
							'{$this->manual_closing_reason}',
							'{$this->rejecting_reason}',
							'{$this->collector_id}',
							'{$this->admin_id}',
							'{$this->site_id}'
						);
					";
		$this->db->query($query);
		
		return $this->db->insert_id();
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
		$query = "delete from `case`
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
		$query = "UPDATE `case`
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
					admin_id = '{$this->admin_id}',
					site_id = '{$this->site_id}'					
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
		$query = "UPDATE `case`
				  SET
					close_date = CURDATE(),
					close_time = CURTIME(),
					status = '".CLOSED_NORMALLY."',
					collector_id = '{$this->collector_id}'				
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
		$query = "UPDATE `case`
				  SET
					close_date = CURDATE(),
					close_time = CURTIME(),
					status = '".CLOSED_MANUALLY."',
					manual_closing_reason = '{$this->manual_closing_reason}',
					collector_id = '{$this->collector_id}' 				
	 			  WHERE id = '{$this->id}' ";
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
		$query = "UPDATE `case`
				  SET
					accept_reject_date = CURDATE(),
					accept_reject_time = CURTIME(),
					admin_id = '{$this->admin_id}',
					status = '".ACCEPTED_CLOSED."'				
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
		$query = "UPDATE `case`
				  SET
					accept_reject_date = CURDATE(),
					accept_reject_time = CURTIME(),
					rejecting_reason = '{$this->rejecting_reason}',
					admin_id = '{$this->admin_id}',
					status = '".REJECTED_CLOSED."'				
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
				  FROM `case`
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
				  FROM `case`";
				  
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
				  FROM `case`
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
				  FROM `case`
				  WHERE status = '".OPENED."'";
				  
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
	 
	 /**
	 * function name : getOpenCasesForView
	 * 
	 * Description : 
	 * Gets all of the open cases from  the database 
	 * and render them for grid view.
	 * 
	 * Created date : 21-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getOpenCasesForView(){
		$query = "SELECT *
				  FROM `case`
				  WHERE status = '".OPENED."'
				  ORDER BY id DESC";
		//load site and user models.
		$this->load->model('site_model');
		$this->load->model('user_model');
		
		$query = $this->db->query($query);
		$cases = $query->result_array();
		//formatting the returned data for each case.
		for($i=0;$i<count($cases);$i++){
			//get the name of the site for the grid view
			$this->site_model->id = $cases[$i]['site_id'];
			$sites = $this->site_model->getSiteById();
			if(isset($sites[0])){
				$cases[$i]['site'] = $sites[0]['name'];
			}
			//get the name of the admin for the grid view
			$this->user_model->id = $cases[$i]['admin_id'];
			$users = $this->user_model->getUserById();
			if(isset($users[0])){
				$cases[$i]['admin'] = $users[0]['first_name'].' '.$users[0]['middle_name'].' '.$users[0]['last_name'];
			}
			//put open date & time in the right format for the grdi view
			$cases[$i]['open_date_time'] = $cases[$i]['open_date'].' '.$cases[$i]['open_time'];
		}
		return $cases;
	 }
	 
	 
	 /**
	 * function name : getClosedCasesForView
	 * 
	 * Description : 
	 * Gets all of the closed cases from  the database 
	 * and render them for grid view.
	 * 
	 * Created date : 21-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getClosedCasesForView(){
		$query = "SELECT c.id as id, 
						c.open_date as open_date,
						c.open_time as open_time,
						c.close_date as close_date,
						c.close_time as close_time,
						c.accept_reject_date as accept_reject_date,
						c.accept_reject_time as accept_reject_time,
						c.status as status,
						c.manual_closing_reason as manual_closing_reason,
						c.rejecting_reason as rejecting_reason,
						c.collector_id as collector_id,
						c.admin_id as admin_id,
						c.site_id  as site_id
				  FROM `case` as c 
				  WHERE status = '".CLOSED_NORMALLY ."' 
				  ORDER BY id DESC;";
					
										
		//load site and user models.
		$this->load->model('site_model');
		$this->load->model('user_model');
		
		$query = $this->db->query($query);
		$cases = $query->result_array();
		//formatting the returned data for each case.
		for($i=0;$i<count($cases);$i++){
			//get the name of the site for the grid view
			$this->site_model->id = $cases[$i]['site_id'];
			$sites = $this->site_model->getSiteById();
			if(isset($sites[0])){
				$cases[$i]['site'] = $sites[0]['name'];
			}
			//get the name of the admin for the grid view
			$this->user_model->id = $cases[$i]['admin_id'];
			$users = $this->user_model->getUserById();
			if(isset($users[0])){
				$cases[$i]['admin'] = $users[0]['first_name'].' '.$users[0]['middle_name'].' '.$users[0]['last_name'];
			}
			//get the name of the collector for the grid view
			$this->user_model->id = $cases[$i]['collector_id'];
			$users = $this->user_model->getUserById();
			if(isset($users[0])){
				$cases[$i]['collector'] = $users[0]['first_name'].' '.$users[0]['middle_name'].' '.$users[0]['last_name'];
			}
			//put open/close date & time in the right format for the grdi view
			$cases[$i]['open_date_time'] = $cases[$i]['open_date'].' '.$cases[$i]['open_time'];
			$cases[$i]['close_date_time'] = $cases[$i]['close_date'].' '.$cases[$i]['close_time'];
			//get the count of cars for this case
			//$cases[$i]['count'] = 0;
		}
		return $cases;
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
				  FROM `case`
				  WHERE status = '".CLOSED_NORMALLY."'";
				  
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
}
