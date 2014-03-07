<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Dashboard extends CI_Controller {

	/**
	 * Filename: dashboard.php
	 * Description: 
	 * dashboard contoller that control the dashboard page functions like log
	 * 
	 * created date: 14-2-2014 (-- it's the valantine day :) <3
	 * ccreated by: Eng. Mohanad Shab Kaleia
	 * contact: ms.kaleia@gmail.com 
	 */
	 
	 
	 
	public function index()
	{		
		$this->showDashboard();
	}
	
	/**
	 * Function name : __construct
	 * Description: 
	 * this contructor is called as this object is initiated.
	 * 
	 * created date: 18-2-2014
	 * ccreated by: Eng. Mohanad Shab Kaleia
	 * contact: ms.kaleia@gmail.com 
	 */
	public function __construct(){
		parent::__construct();
		//check login state of the user requestin this controller.
		$this->load->helper('is_logged_in');
		checkLogin($this->session->userdata['user']);
	}
	
	
	/**
	 * Function name : showDashboard
	 * Description: 
	 * this function will call dashboard views 
	 * 
	 * created date: 14-2-2014
	 * ccreated by: Eng. Mohanad Shab Kaleia
	 * contact: ms.kaleia@gmail.com 
	 */
	public function showDashboard()
	{
		//load enumeration helper
		$this->load->helper('enumeration');
		
		$active_menu = "dashboard";
		$data["active_menu"] = $active_menu;
		 	
		$data['user_data'] = $this->session->userdata['user'];
		
		//get the latest activities
		$this->load->model('db_views_model');
		
		$activities = $this->db_views_model->getCaseActivities();
		
		//prepare the activity list for the view
		$open_list = array();
		$close_list = array();
		$acc_rej_list = array();
		
		foreach($activities as $activity){
			switch ($activity['status']){
				case OPENED:
				$open_list[] = "A new '".$activity['site']."' case was opened by '<b>".$activity['user']."</b>' on ".$activity['open_date'].".";
				break;
				case CLOSED_MANUALLY:
				$close_list[] = "'".$activity['site']."' case was Manually Closed(Cancelled) by '<b>".$activity['user']."</b>' on ".$activity['close_date'].".";
				break;
				case CLOSED_NORMALLY:
				$close_list[] = "'".$activity['site']."' case was Closed Normally by '<b>".$activity['user']."</b>' on ".$activity['close_date'].".";
				break;
				case REJECTED_CLOSED:
				$acc_rej_list[] = "'".$activity['site']."' case was Rejected by '<b>".$activity['user']."</b>' on ".$activity['acc_rej_date'].".";
				break;
				case ACCEPTED_CLOSED:
				$acc_rej_list[] = "'".$activity['site']."' case was Accepted by '<b>".$activity['user']."</b>' on ".$activity['acc_rej_date'].".";
				break;
			}
		}
		//send the activities to the view
		$data['open_list'] = $open_list;
		$data['close_list'] = $close_list;
		$data['acc_rej_list'] = $acc_rej_list;
		
		//call the general views for page structure	
		$this->load->view('gen/header');
		$this->load->view('gen/main_menu',$data);
		$this->load->view('gen/logo');
		$this->load->view('gen/main_content');
		
		//show log area 
		$this->load->view('gen/latest_activities',$data);
		
		//show buttons
		$this->load->view('gen/managment_board');
		
		$this->load->view('gen/footer');
		
	}
	
	
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
