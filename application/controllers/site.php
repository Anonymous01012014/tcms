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
			
		if(isset($this->session->userdata['siteCase'])){
			//echo 1111;
			$data['site_name'] = $this->session->userdata['site'];
			$data['FIPS'] = $this->session->userdata['FIPS'];
			$data['county'] = $this->session->userdata['county'];
			$data['long'] = $this->session->userdata['long'];
			$data['lat'] = $this->session->userdata['lat'];
			$data['binary'] = $this->session->userdata['binary'];
			$this->session->unset_userdata('site');
			$this->session->unset_userdata('long');
			$this->session->unset_userdata('lat');
			$this->session->unset_userdata('binary');
			$this->session->unset_userdata('siteCase');
		}
		$this->load->helper('enumeration');
		$data['user_data'] = $this->session->userdata['user'];
		//call the general views for page structure	
		$this->load->view('gen/header');
		$this->load->view('gen/main_menu',$data);
		$this->load->view('gen/logo');
		$this->load->view('gen/main_content');
		
		//show log area 
		$this->load->view('site_add' , $data);
			
		
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
		$this->site_model->county = $this->input->post('county');
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
			//processing adding site from binary file issue
			//adding binary file info to the database
			$binary = $this->input->post('binary');
			if(isset($binary)){				
				$binary_fragments = explode('/',$binary);
				echo count($binary_fragments);
				if(count($binary_fragments)>3 ){
					//gretting binary file information
					$binary_name = $binary_fragments[count($binary_fragments) - 1];
					$binary_name_fragments = explode('_',$binary_name);
					$binary_id = explode('.',$binary_name_fragments[count($binary_name_fragments) - 1]);
					$binary_id = $binary_id[0];
					/** adding binary file to database **/
					$this->load->model("case_model");
					
					//adding new open case for the file in the new site
					$this->case_model->site_id = $site_id[0]["site_id"];
					$this->case_model->admin_id = 0;
					$this->case_model->collector_id = $this->session->userdata['user']['id'];
					
					//Execute addition function.
					$case_id = $this->case_model->openCase();
					
					//execute the TSDP command with volume choice to generate the count text file.
					exec(__DIR__ ."\TSDP\TSDP.exe AUTO --in \"".$binary."\" --out \"files/output_files/count/".'count_'.$case_id.".txt\" --settings ". __DIR__ ."\TSDP\SettingsFiles\CGSET.INI --numLanes 2 --volume --twoWay --sensorSpacing 48 ");	
					//getting the output count file name
					$file = "files/output_files/count/".'count_'.$case_id.".txt";
					//extracting data from the count file and send it to database
					$this->load->model('tsdp_file');
					//reading TSDP count file into the model object
					$this->tsdp_file->read_file_lines($file);
					
					//inserting output file headers info into the database (just file_header for now)
					$this->tsdp_file->save_file_headers($case_id);
					
					$this->load->model("binary_file_model");
					//get current file data from the data base
					$this->binary_file_model->id = $binary_id;
					$binary_data = $this->binary_file_model->getBinaryFileById();
					echo var_dump($binary_data[0]);
					if(isset($binary_data[0])){
						//inserting binary file data into model
						$this->binary_file_model->upload_date = $binary_data[0]['upload_date'];
						$this->binary_file_model->upload_time = $binary_data[0]['upload_time'];
						$this->binary_file_model->counter_id = $binary_data[0]['counter_id'];
						$this->binary_file_model->name = $binary_data[0]['name'];
						
						//setting the binary file location.
						$this->binary_file_model->location = 'files/Binary_files/closed_binary_files/';	
						//setting the case id for this binary file.	
						$this->binary_file_model->case_id = $case_id;	
						
						//execute the modify file function.
						$this->binary_file_model->modifyBinaryFile();
						
						//set the id of the case to be closed to the given id.
						$this->case_model->id = $case_id;
						// set the collector id to the current user id.
						$this->case_model->collector_id = $this->session->userdata['user']['id'];
						
						//execute the close normally function
						$this->case_model->closeNormally();
						$binary_name = explode('.',$binary_data[0]['name']); 
						rename($binary,'files/binary_files/closed_binary_files/'.$binary_name[0].'_'.$case_id.'.BIN');
						redirect(base_url()."cases");
					}
				}
			}
		 
		}elseif($action == "edit" && $id > 0){
			
			//If the action is edit set the id in the model to the given one.
			$this->site_model->id = $id;
			//Edit the specified site.
			$this->site_model->modifySite();
			
			//get lanes ids
			$lane_id = $this->input->post('lane_id');
			
			//get all site lanes									
			$this->lane_model->site_id = $id;
			$lanes = $this->lane_model->getLaneBySiteId();
			
			
			for($i= 0 ; $i < count($lane_id) ; $i++){
				//add the new added lanes
				if($lane_id[$i] == '0'){
					$this->lane_model->lane_direction = $lane_direction[$i];
					$this->lane_model->addLane();
				//modify the modified lanes
				}else{
					$this->lane_model->lane_direction = $lane_direction[$i];
					$this->lane_model->id = $lane_id[$i];
					$this->lane_model->modifyLaneDirection();
				}
			}
			
			//delete the removed lanes 
			foreach($lanes as $lane)
			{	
				$delete = true;			
				for($i= 0 ; $i < count($lane_id) ; $i++){
					if($lane_id[$i] == $lane['id']){
						$delete = false;
						break;
					}
				}
				if($delete){
					$this->lane_model->id = $lane['id'];
					$this->lane_model->deleteLane();
				}	
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
