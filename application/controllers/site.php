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
		$this->manage();
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
	 * Function name : edit
	 * Description: 
	 * this function will show the edit page of the selected site.
	 * 
	 * created date: 17-2-2014
	 * ccreated by: Eng. Ahmad Mulhem Barakat
	 * contact: molham225@gmail.com
	 */
	public function edit($site_id)
	{
		$this->load->model('site_model');
		
		$this->site_model->id = $site_id;
		
		$sites = $this->site_model->getSiteById();
		
		if(isset($sites[0])){
			
			$data['site'] = $sites[0];
			
			$this->load->helper('enumeration');
			//call the general views for page structure	
			$this->load->view('gen/header');
			$this->load->view('gen/main_menu');
			$this->load->view('gen/logo');
			$this->load->view('gen/main_content');
			
			//show log area 
			$this->load->view('site_edit',$data);
				
			
			$this->load->view('gen/footer');
		}
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
	public function saveData($action,$id)
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
		
		if($action == "add"){
		
			//Execute addition function.
			 $this->site_model->addSite();
		 
		}elseif($action == "edit" && $id > 0){
			//If the action is edit set the id in the model to the given one.
			$this->site_model->id = $id;
			//Edit the specified site.
			$this->site_model->modifySite();
		}
		
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
