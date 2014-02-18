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
			
		//call the general views for page structure	
		$this->load->view('gen/header');
		$this->load->view('gen/main_menu');
		$this->load->view('gen/logo');
		$this->load->view('gen/main_content');
		
		//show log area 
		$this->load->view('gen/latest_activities');
		
		//show buttons
		$this->load->view('gen/managment_board');
		
		$this->load->view('gen/footer');
		
	}
	
	
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
