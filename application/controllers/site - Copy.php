<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Site extends CI_Controller {

	/**
	 * Filename: site.php
	 * Description: 
	 * site contoller that control the site for example add - edit - delete - manage - ...etc
	 * 
	 * created date: 15-2-2014
	 * ccreated by: Eng. Mohanad Shab Kaleia
	 * contact: ms.kaleia@gmail.com 
	 */
	 
	 
	 
	public function index()
	{		
		$this->add();
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
	
	
	
	/**
	 * Function name : add
	 * Description: 
	 * this function will call site_add views 
	 * 
	 * created date: 15-2-2014
	 * ccreated by: Eng. Mohanad Shab Kaleia
	 * contact: ms.kaleia@gmail.com 
	 */
	public function add()
	{
			
		//call the general views for page structure	
		$this->load->view('gen/header');
		$this->load->view('gen/main_menu');
		$this->load->view('gen/logo');
		$this->load->view('gen/main_content');
		
		//show log area 
		$this->load->view('site_add');
			
		
		$this->load->view('gen/footer');
		
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */