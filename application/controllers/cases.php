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
		 
		redirect(base_url().'cases');
		
	}
	
	
	/**
	 * Function name : ajaxGetUsers
	 * Description: 
	 * get users' information from database
	 * 
	 * created date: 19-2-2014
	 * ccreated by: Eng. Ahmad Mulhem Barakat
	 * contact: molham225@gmail.com
	 */
	public function ajaxGetCases($type)
	{										
		//load case model to get data from it
		$this->load->model('case_model');
		
			
		
		
		//for open cases table
		if($type === "open"){
			//load grid library
			$this->load->library('grid');				
			
			//grid option
			
			$this->grid->option['id'] = "id";         // database table id
			$this->grid->option['sortable'] = FALSE;  // is sortable
			$this->grid->option['page_size'] = 5;    //records per page
			$this->grid->option['row_number'] = true; //show the row number	
			$this->grid->option['title'] = "Open_Cases";   //  grid title
			$this->grid->option['add_button'] = true; //show add button
			$this->grid->option['add_url'] = base_url()."cases/add"; //add url
			$this->grid->option['add_title'] = "Open New Case"; //add title
			
			$this->grid->columns = array('site' , 'open_date_time' , 'admin');
			
			//get the data
			
			$this->grid->data = $this->case_model->getOpenCasesForView();
			
			//grid controls
			$this->grid->control = array(
										  array("title" => "Upload Binary" , "icon"=>"glyphicon glyphicon-upload" ,"url"=>base_url()."cases/closeNormally" , "message_type"=>null , "message"=>""),
										  array("title" => "Cancel" , "icon"=>"glyphicon glyphicon-trash" ,"url"=>base_url()."cases/closeManually" , "message_type"=>"input" , "message"=>"Are you sure?")
										  
										);												
		}else if($type === "closed"){
			$this->load->library('grid');				
			
			//grid option
			
			$this->grid->option['id'] = "id";         // database table id
			$this->grid->option['sortable'] = FALSE;  // is sortable
			$this->grid->option['page_size'] = 5;    //records per page
			$this->grid->option['row_number'] = true; //show the row number	

			$this->grid->option['title'] = "Closed Cases";   //  grid title
			$this->grid->option['add_button'] = false; //Don't show add button
			
			$this->grid->columns = array('site' , 'open_date_time' , 'close_date_time' , 'admin' , 'collector','count');
			
			//get the data
			
			$this->grid->data = $this->case_model->getClosedCasesForView();
			
			//grid controls
			$this->grid->control = array(
										  array("title" => "accept" , "icon"=>"glyphicon glyphicon-ok" , "url"=>base_url()."cases/accept" , "message_type"=>null , "message"=>"") , 
										  array("title" => "reject" , "icon"=>"glyphicon glyphicon-remove" ,"url"=>base_url()."cases/reject" , "message_type"=>"input" , "message"=>"Please enter the reason for rejecting this case..")
										);												
		}
		//render our grid :)
		echo $this->grid->gridRender();
												
	}
}

/* End of file cases.php */
/* Location: ./application/controllers/cases.php */
