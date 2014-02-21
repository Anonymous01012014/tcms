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
	 * Function name : manage
	 * Description: 
	 * this function will call managment views 
	 * 
	 * created date: 18-2-2014
	 * ccreated by: Eng. Mohanad Shab Kaleia
	 * contact: ms.kaleia@gmail.com 
	 */
	public function manage()
	{
			
		//call the general views for page structure	
		$this->load->view('gen/header');
		$this->load->view('gen/main_menu');
		$this->load->view('gen/logo');
		$this->load->view('gen/main_content');
	
		$this->load->view('site_manage');
		
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
	 * Function name : end
	 * Description: 
	 * this function will set the end date of the given 
	 * site to current date.
	 * 
	 * created date: 19-2-2014
	 * ccreated by: Eng. Ahmad Mulhem Barakat
	 * contact: molham225@gmail.com
	 */
	public function end($site_id)
	{
		$this->load->model('site_model');
		if($site_id > 0){
			$this->site_model->id = $site_id;
			$this->site_model->endSite();
		}
		redirect(base_url().'site');
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
	public function saveData($action,$id = 0)
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
		//redirect(base_url()."site");		
	}
	
	
	
	/**
	 * function name : ajaxGetSites
	 * 
	 * Description : 
	 * get sites information from database
	 * 
	 * Created date ; 18-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Mohanad Shab Kaleia
	 * contact : ms.kaleia@gmail.com
	 */
	public function ajaxGetSites()
	{										
		//load user model to get data from it
		$this->load->model('site_model');
		
		//load grid library
		$this->load->library('grid');				
		
		//grid option
		$this->grid->option['title'] = "Sites";   //  grid title
		$this->grid->option['id'] = "id";         // database table id
		$this->grid->option['sortable'] = FALSE;  // is sortable
		$this->grid->option['page_size'] = 5;    //records per page
		$this->grid->option['row_number'] = true; //show the row number		
		$this->grid->option['add_button'] = true; //show add button
		$this->grid->option['add_url'] = base_url()."site/add"; //add url
		$this->grid->option['add_title'] = "Add new"; //add title
			
		$this->grid->columns = array('name' , 'FIPS' , 'latitude' , 'longitude' , 'lane_count' , 'start_date');
		
		//get the data	
		$this->grid->data = $this->site_model->getAllActiveSites();
		
		//grid controls
		$this->grid->control = array(
									  array("title" => "Show" , "icon"=>"glyphicon glyphicon-pushpin" , "url"=>base_url()."site/showOnMap" , "message_type"=>null , "message"=>"") ,
									  array("title" => "Edit" , "icon"=>"glyphicon glyphicon-pencil" , "url"=>base_url()."site/edit" , "message_type"=>null , "message"=>"") , 
									  array("title" => "End" , "icon"=>"glyphicon glyphicon-trash" ,"url"=>base_url()."site/end" , "message_type"=>"confirm" , "message"=>"Are you sure?")
									);												
						
		//render our grid :)
		echo $this->grid->gridRender();
												
	}



	/**
	 * Function name : showOnMap
	 * Description: 
	 * this function will show site information on map.
	 * 
	 * created date: 19-2-2014
	 * ccreated by: Eng. Mohanad Shab Kaleia
	 * contact: ms.kaleia@gmail.com
	 */
	public function showOnMap($id)
	{
		$this->load->helper('enumeration');
		
		// instanciating the model file
		$this->load->model('site_model');
		$this->site_model->id = $id;
		
		//get site information by id
		$site = $this->site_model->getSiteById();
		
		
				
	}
	
}

/* End of file site.php */
/* Location: ./application/controllers/site.php */
