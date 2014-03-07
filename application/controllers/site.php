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
			
		$data['user_data'] = $this->session->userdata['user'];;
		//call the general views for page structure	
		$this->load->view('gen/header');
		$this->load->view('gen/main_menu',$data);
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
		//set the active menu in the main menu
		$active_menu = "add_site";
		$data["active_menu"] = $active_menu;	
			
		$this->load->helper('enumeration');
		$data['user_data'] = $this->session->userdata['user'];;
		//call the general views for page structure	
		$this->load->view('gen/header');
		$this->load->view('gen/main_menu',$data);
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
		//load site model	
		$this->load->model('site_model');
		
		//load lane model	
		$this->load->model('lane_model');
		
		
		//get site information by id
		$this->site_model->id = $site_id;			
		$sites = $this->site_model->getSiteById();
		
		//get lane by site id		
		$this->lane_model->site_id = $site_id;
		$lanes = $this->lane_model->getLaneBySiteId();
		
		
		
		if(isset($sites[0])){
			
			$data['site'] = $sites[0];
			$data['lanes'] = $lanes;
			$this->load->helper('enumeration');
			$data['user_data'] = $this->session->userdata['user'];
			//call the general views for page structure	
			$this->load->view('gen/header');
			$this->load->view('gen/main_menu',$data);
			$this->load->view('gen/logo');
			$this->load->view('gen/main_content');
			
			//show log area 
			$this->load->view('site_edit',$data);
				
			
			$this->load->view('gen/footer');
		}
	}
	
	/**
	 * Function name : getSiteByName
	 * Description: 
	 * this function will call get the site specified by the given name
	 * it's used to check if the site name is unique
	 * 
	 * created date: 18-2-2014
	 * ccreated by: Eng. Mohanad Shab Kaleia
	 * contact: ms.kaleia@gmail.com 
	 */
	public function getSiteByName()
	{
			
		$this->load->model('site_model');
		$site_name = $_GET['name'];
		if(isset($_GET['old_name'])){
			if($site_name == $_GET['old_name']){
				echo "";
			}else{
				$this->site_model->name = $site_name;
				$site = $this->site_model->getSiteByName();
				if(isset($site[0])){
					echo 'true';
				}else{
					echo "";
				}
			}
		}else{
			$this->site_model->name = $site_name;
			$site = $this->site_model->getSiteByName();
			if(isset($site[0])){
				echo 'true';
			}else{
				echo "";
			}
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
		$this->load->model('lane_model');
		
		//insert post values into the model
		$this->site_model->name = $this->input->post('name');
		$this->site_model->FIPS = $this->input->post('FIPS');
		$this->site_model->longitude = $this->input->post('longitude');
		$this->site_model->latitude = $this->input->post('latitude');
		$this->site_model->start_date = $this->input->post('startDate');
		$this->site_model->address = $this->input->post('address');
		$this->site_model->functional_class = $this->input->post('functionalClass');
		
		//lane count
		$lane_direction = $this->input->post('lane');
		$this->site_model->lane_count = count($lane_direction);				
		
		if($action == "add"){
		
			//Execute addition function.
			$site_id =  $this->site_model->addSite();
			
			
			
			//adding lanes max number of lane is 16		
			for($i= 0 ; $i < count($lane_direction) ; $i++)
			{																						
				$this->lane_model->lane_direction = $lane_direction[$i];										
				$this->lane_model->site_id = $site_id[0]["site_id"];
				$this->lane_model->addLane();				
			}
		 
		}elseif($action == "edit" && $id > 0){
			//If the action is edit set the id in the model to the given one.
			$this->site_model->id = $id;
			//Edit the specified site.
			$this->site_model->modifySite();
			
			//modify lanes 
			for($i= 0 ; $i < count($lane_direction) ; $i++)
			{																						
				$this->lane_model->lane_direction = $lane_direction[$i];										
				$this->lane_model->site_id = $id;								
				$this->lane_model->modifyLane();				
			}
		}
		
		
		redirect(base_url()."site");		
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
		$this->load->helper('enumeration');
												
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
		$sites_info = $this->site_model->getAllActiveSites();
		//converting enumeration
		for( $i = 0 ; $i <count($sites_info) ;  $i++)
		{
			$sites_info[$i]["FIPS"] = FIPS_text($sites_info[$i]["FIPS"]);
			$sites_info[$i]["functional_class"] = functional_class_text($sites_info[$i]["functional_class"]);
		}
		
		$this->grid->data = $sites_info;
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
		//load enumeration
		$this->load->helper('enumeration');
						
		// instanciating the model file
		$this->load->model('site_model');
		$this->site_model->id = $id;
		
		//get site information by id
		$site = $this->site_model->getSiteById();
		
		$site[0]["FIPS"] = FIPS_text($site[0]["FIPS"]);
		$site[0]["functional_class"] = functional_class_text($site[0]["functional_class"]);
		$data["site"] = $site;	
		
		
		$data['user_data'] = $this->session->userdata['user'];;
		//call the general views for page structure	
		$this->load->view('gen/header');
		$this->load->view('gen/main_menu',$data);
		$this->load->view('gen/logo');
		$this->load->view('gen/main_content');	
		$this->load->view("site_on_map" , $data);
		$this->load->view('gen/footer');
					
	}
	
}

/* End of file site.php */
/* Location: ./application/controllers/site.php */
