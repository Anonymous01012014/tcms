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
		$this->load->helper('enumeration');
		//call the general views for page structure	
		$this->load->view('gen/header');
		$this->load->view('gen/main_menu');
		$this->load->view('gen/logo');
		$this->load->view('gen/main_content');
		
		//show log area 
		$this->load->view('site_add');
			
		
		$this->load->view('gen/footer');
		
	}
	
	
	/**
	 * Function name : saveData
	 * Description: 
	 * this function will save the addition form info ot the database.
	 * 
	 * created date: 15-2-2014
	 * ccreated by: Eng. Ahmad Mulhem Barakat
	 * contact: molham225@gmail.com
	 */
	public function saveData()
	{
		$this->load->helper('enumeration');
		
		// instanciating the model file
		$this->load->model('site_model');
		
		//insert post values into the model
		$this->site_model->name = $this->input->post('name');
		$this->site_model->FIPS = $this->input->post('FIPS');
		$this->site_model->longitude = $this->input->post('longitude');
		$this->site_model->latitude = $this->input->post('latitude');
		$this->site_model->start_date = $this->input->post('startDate');
		$this->site_model->address = $this->input->post('address');
		$this->site_model->functional_class = $this->input->post('functionalClass');
		$this->site_model->lane_count = $this->input->post('laneCount');
		
		//Execute addition function.
		 $this->site_model->addSite();
		
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
