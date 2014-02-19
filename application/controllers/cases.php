<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Cases extends CI_Controller {

	/**
	 * Filename: cases.php
	 * Description: 
	 * case contoller that control the case for example add - edit - delete - manage - ...etc
	 * 
	 * created date: 16-2-2014
	 * created by: Eng. Ahmad Mulhem Barkat
	 * contact: molham225@gmail.com
	 */
	 
	 
	 
	public function index()
	{	
		
		$this->manage();
		
	}	
	
	/**
	 * Function name : manage
	 * Description: 
	 * this function will call the page header. 
	 * 
	 * created date: 16-2-2014
	 * created by: Eng. Ahmad Mulhem Barkat
	 * contact: molham225@gmail.com
	 */
	public function manage()
	{
		$this->load->view('gen/header');
		$this->load->view('gen/main_menu');
		$this->load->view('gen/logo');
		//show manage user view
		$this->load->view('case_manage');
		$this->load->view('gen/footer');
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
	 * Function name : add
	 * Description: 
	 * this function will call site_add views 
	 * 
	 * created date: 16-2-2014
	 * created by: Eng. Ahmad Mulhem Barakat
	 * contact: molham225@gmail.com
	 */
	public function add()
	{
		$this->load->model('site_model');
		
		//get all active sites.
		$sites = $this->site_model->getAllActiveSites();
		$data['sites']= $sites;
		
		//call the general views for page structure	
		$this->load->view('gen/header');
		$this->load->view('gen/main_menu');
		$this->load->view('gen/logo');
		$this->load->view('gen/main_content');
		
		//show add case view
		$this->load->view('case_add',$data);
			
		
		$this->load->view('gen/footer');
		
	}
	
	
	/**
	 * Function name : saveData
	 * Description: 
	 * this function will save the addition form info ot the database.
	 * 
	 * created date: 15-2-2014
	 * created by: Eng. Ahmad Mulhem Barakat
	 * contact: molham225@gmail.com
	 */
	public function saveData()
	{		
		// instanciating the model file
		$this->load->model('case_model');
		
		//insert post values into the model
		$this->case_model->site_id = $this->input->post('site');
		$this->case_model->admin_id = 1;
		$this->case_model->collector_id = 1;
		
		
		//Execute addition function.
		 $this->case_model->openCase();
		
	}
}

/* End of file cases.php */
/* Location: ./application/controllers/cases.php */
