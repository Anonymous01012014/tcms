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
	 
	 
	 
	public function index($message = "")
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
		$data['message'] = "";
		if(isset($_GET['message'])){
			$data['message'] = $_GET['message'];
			//echo $message;
		}
		//insert user data in the views
		//$data['message'] = $message;
		//insert user data in the views
		$data['user_data'] = $this->session->userdata['user'];
		//call the general views for page structure	
		$this->load->view('gen/header');
		$this->load->view('gen/main_menu',$data);
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
		
		//these helper classes are for file upload function. 
		$this->load->helper(array('form', 'url'));
	}
	
	
	/**
	 * Function name : add
	 * Description: 
	 * this function will call case_add views 
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
		//get all opened sites.
		$open_sites = $this->site_model->getOpenedSites();
		$data['open_sites']= $open_sites;
		
		
		//insert user data in the views
		$data['user_data'] = $this->session->userdata['user'];;
		//call the general views for page structure	
		$this->load->view('gen/header');
		$this->load->view('gen/main_menu',$data);
		$this->load->view('gen/logo');
		$this->load->view('gen/main_content');
		
		//show add case view
		$this->load->view('case_add',$data);
			
		
		$this->load->view('gen/footer');
		
	}
	
	
	/**
	 * Function name : addClosed
	 * Description: 
	 * this function will call case_add_closed view 
	 * 
	 * created date: 28-2-2014
	 * created by: Eng. Ahmad Mulhem Barakat
	 * contact: molham225@gmail.com
	 */
	public function addClosed()
	{
		$this->load->model('site_model');
		
		//get all active sites.
		$sites = $this->site_model->getAllActiveSites();
		$data['sites']= $sites;
		
		
		//insert user data in the views
		$data['user_data'] = $this->session->userdata['user'];
		//call the general views for page structure	
		$this->load->view('gen/header');
		$this->load->view('gen/main_menu',$data);
		$this->load->view('gen/logo');
		$this->load->view('gen/main_content');
		
		//show add case view
		$this->load->view('case_add_closed',$data);
			
		
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
		$this->case_model->admin_id = $this->session->userdata['user']['id'];
		$this->case_model->collector_id = 0;
		
		
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
										  array("title" => "Cancel" , "icon"=>"glyphicon glyphicon-trash" ,"url"=>base_url()."cases/closeManually" , "message_type"=>"input" , "message"=>"Please enter the reason for manually closing this case..")
										  
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
										  array("title" => "Analyze" , "icon"=>"glyphicon glyphicon-signal" ,"url"=>base_url()."analyze/analyzeFile" , "message_type"=>"" , "message"=>""),
										  array("title" => "accept" , "icon"=>"glyphicon glyphicon-ok" , "url"=>base_url()."cases/accept" , "message_type"=>null , "message"=>"") , 
										  array("title" => "reject" , "icon"=>"glyphicon glyphicon-remove" ,"url"=>base_url()."cases/reject" , "message_type"=>"input" , "message"=>"Please enter the reason for rejecting this case..")
										);												
		}
		//render our grid :)
		echo $this->grid->gridRender();
												
	}
	
	
	/**
	 * Function name : closeManually
	 * Description: 
	 * this function will manually close the case specified by the id 
	 * and set the manual closing reason to the given one.
	 * 
	 * created date: 15-2-2014
	 * created by: Eng. Ahmad Mulhem Barakat
	 * contact: molham225@gmail.com
	 */
	public function closeManually($id,$reason)
	{		
		// instanciating the case model class
		$this->load->model('case_model');
		
		//insert post values into the model
		$this->case_model->id = $id;
		$this->case_model->manual_closing_reason = $reason;	
		$this->case_model->collector_id = $this->session->userdata['user']['id'];	
		
		//Execute manual close function.
		$this->case_model->closeManually();
		 
		redirect(base_url().'cases');
		
	}
	
	
	/**
	 * Function name : reject
	 * Description: 
	 * this function will reject the case specified by the id 
	 * and set the rejecting reason to the given one.
	 * 
	 * created date: 15-2-2014
	 * created by: Eng. Ahmad Mulhem Barakat
	 * contact: molham225@gmail.com
	 */
	public function reject($id,$reason)
	{		
		// instanciating the case model class
		$this->load->model('case_model');
		$this->load->model('binary_file_model');
		
		//insert post values into the model
		$this->case_model->id = $id;
		$this->case_model->rejecting_reason= $reason;	
		
		//add the id of the admin rejected this case
		$this->case_model->admin_id = $this->session->userdata['user']['id'];
		
		//Execute reject function.
		$this->case_model->rejectCase();
		
		//get the binary file and move it to rejected file folder
		$this->binary_file_model->case_id = $id;
		$binary = $this->binary_file_model->getBinaryFileByCaseId();
		if(isset($binary[0])){
			rename($binary[0]['location'].$binary[0]['name'],'files/binary_files/rejected_binary_files/'.$binary[0]['name']);
			$this->binary_file_model->location = 'files/binary_files/rejected_binary_files/';
			$this->binary_file_model->id = $binary[0]['id'];
			//change the location of this file to its new location
			$this->binary_file_model->changeLocation();
			
		}
		redirect(base_url().'cases');
		
	}
	
	
	/**
	 * Function name : accept
	 * Description: 
	 * this function will set the case specified by the id
	 * to accepted closed.
	 * 
	 * created date: 15-2-2014
	 * created by: Eng. Ahmad Mulhem Barakat
	 * contact: molham225@gmail.com
	 */
	public function accept($id)
	{		
		// instanciating the case model class
		$this->load->model('case_model');
		$this->load->model('binary_file_model');
		
		//insert post values into the model
		$this->case_model->id = $id;	
		
		//add the id of the admin accepted this case
		$this->case_model->admin_id = $this->session->userdata['user']['id'];
		
		//Execute accept function.
		$this->case_model->acceptCase();
		 
		//get the binary file and move it to rejected file folder
		$this->binary_file_model->case_id = $id;
		$binary = $this->binary_file_model->getBinaryFileByCaseId();
		if(isset($binary[0])){
			rename($binary[0]['location'].$binary[0]['name'],'files/binary_files/accepted_binary_files/'.$binary[0]['name']);
			$this->binary_file_model->location = 'files/binary_files/accepted_binary_files/';
			$this->binary_file_model->id = $binary[0]['id'];
			//change the location of this file to its new location
			$this->binary_file_model->changeLocation();
		}
		 
		redirect(base_url().'cases');
		
	}
	
	/**
	 * Function name : closeNormally
	 * Description: 
	 * this function will call a page to upload the binary file of the specified case.
	 * 
	 * created date: 15-2-2014
	 * created by: Eng. Ahmad Mulhem Barakat
	 * contact: molham225@gmail.com
	 */
	public function closeNormally($id)
	{		
		$data['case_id'] = $id;
		//insert user data in the views
		$data['user_data'] = $this->session->userdata['user'];
		//call the general views for page structure	
		$this->load->view('gen/header');
		$this->load->view('gen/main_menu',$data);
		$this->load->view('gen/logo');
		$this->load->view('gen/main_content');
		
		//show close case view
		$this->load->view('case_close',$data);
			
		
		$this->load->view('gen/footer');
		
	}
	
	/**
	 * Function name : closeNormally
	 * Description: 
	 * this function will call a page to upload the binary file of the specified case.
	 * 
	 * created date: 15-2-2014
	 * created by: Eng. Ahmad Mulhem Barakat
	 * contact: molham225@gmail.com
	 */
	function saveBinaryFile($action,$case_id = 0)
	{
		
		//info message
		$message = "";
		
		$config['upload_path'] = './files/Binary_files/new_binary_files/';
		$config['allowed_types'] = '*';
		//$config['max_size']    = '80000';

		$this->load->library('upload', $config);
		if ( ! $this->upload->do_upload('binary_file') )
		{
			$error = array('error' => $this->upload->display_errors());
			echo print_r($error);
			//$this->load->view('upload_form', $error);
		}
		else
		{
			$this->load->model('binary_file_model');
			$this->load->model('case_model');
			
			//get binary file data
			$file_data =  $this->upload->data();
			
			
			//split the name and extension of the file
			$file_name = explode('.',$file_data['file_name']);
			if(strtoupper($file_name[count($file_name) - 1]) == "BIN"){ 
				//echo $file_data['file_name'];
				//echo __DIR__ ."\TSDP\TSDP.exe AUTO --in 'files/binary_files/new_binary_files/".$file_data['file_name']."' --out 'files/output_files/count/".$file_name[0].'_'.$case_id.".txt' --settings ". __DIR__ ."\TSDP\SettingsFiles\CGSET.INI --numLanes 2 --volume --twoWay --sensorSpacing 48 2> error.txt";
				//execute the TSDP command with volume choice to generate the count text file.
				exec(__DIR__ ."\TSDP\TSDP.exe AUTO --in \"files/binary_files/new_binary_files/".$file_data['file_name']."\" --out \"files/output_files/count/".'count_'.$case_id.".txt\" --settings ". __DIR__ ."\TSDP\SettingsFiles\CGSET.INI --numLanes 2 --volume --twoWay --sensorSpacing 48 ");	
				//getting the output count file name
				$file = "files/output_files/count/".'count_'.$case_id.".txt";
				//extracting data from the count file and send it to database
				$this->load->model('tsdp_file');
				//reading TSDP count file into the model object
				$this->tsdp_file->read_file_lines($file);
				//getting the site name from the file header
				$site_ID = $this->tsdp_file->CI->file_header->site_ID;
				
				//splite the info1 field into state and county
				$info1 = explode("|", $this->tsdp_file->CI->file_header->info1 ) ;				
				$state = $info1[0];
				//get the state id
				$FIPS = FIPS_id($FIPS_text);
				$county = $info1[1];				
				
				//loading site model				
				$this->load->model('site_model');
				
				//getting the id of this site
				$this->site_model->name = $site_ID;
				$this->site_model->FIPS = $FIPS;
				$this->site_model->county = $county;
				$site = $this->site_model->getSiteByNameStateCounty();
				//if the site exists
				if(isset($site[0])){
					//if the action is open_close the create an open case to be closed
					if($action == "open_close"){					
						//insert post values into the model
						$this->case_model->site_id = $site[0]['id'];
						$this->case_model->admin_id = 0;
						$this->case_model->collector_id = $this->session->userdata['user']['id'];
						
						//Execute addition function.
						$case_id = $this->case_model->openCase();
						//echo $case_id;
					}else{
						$this->case_model->id = $case_id;
						$case = $this->case_model->getCaseById();
						if(isset($case[0])){
							if($site[0]['id'] !== $case[0]['site_id']){
								$message = "The file you uploaded belongs to '".$site[0]['name']."' site so a case was closed for that site..";
								$this->case_model->site_id = $site[0]['id'];
								$open_case = $this->case_model->getOpenCaseBySiteId();
								if(isset($open_case[0])){
									$case_id = $open_case[0]['id'];
								}else{
									//insert post values into the model
									$this->case_model->site_id = $site[0]['id'];
									$this->case_model->admin_id = 0;
									$this->case_model->collector_id = $this->session->userdata['user']['id'];
									
									//Execute addition function.
									$case_id = $this->case_model->openCase();
								}
							}
						}
					}
					
					//inserting output file headers info into the database (just file_header for now)
					$this->tsdp_file->save_file_headers($case_id);
					
					//setting the file name to uploaded-file-name_case-id
					$this->binary_file_model->name = $file_name[0].'_'.$case_id;
					//setting the binary file location.
					$this->binary_file_model->location = 'files/Binary_files/closed_binary_files/';	
					//setting the case id for this binary file.	
					$this->binary_file_model->case_id = $case_id;	
					
					//execute the add file function.
					$this->binary_file_model->addBinaryFile();
					
					//set the id of the case to be closed to the given id.
					$this->case_model->id = $case_id;
					// set the collector id to the current user id.
					$this->case_model->collector_id = $this->session->userdata['user']['id'];
					
					//execute the close normally function
					$this->case_model->closeNormally();
					rename('files/binary_files/new_binary_files/'.$file_data['file_name'],'files/binary_files/closed_binary_files/'.$file_name[0].'_'.$case_id.'.BIN');
					
					/**extract count info from the binary and add it to database**/
					//execute the TSDP command with volume choice to generate the count text file.
					//exec(__DIR__ ."\TSDP\TSDP.exe AUTO --in files/binary_files/".$file_name[0].'_'.$case_id.'.BIN'." --out files/output_files/count/".$file_name[0].'_'.$case_id.".txt --settings ". __DIR__ ."\TSDP\SettingsFiles\CGSET.INI --numLanes 2 --volume --twoWay --sensorSpacing 48 2> error.txt");
					//getting the output count file name
					//$file = "files/output_files/count/".$file_name[0].'_'.$case_id.".txt";
					//extracting data from the count file and send it to database
					//$this->read_and_save($file,$case_id);
					
				}else{
					$message = "The file you uploaded doesn't belong to any of the sites in the database so it was moved to undefined_binary_files folder..\nPlease add this site to add the your file's data to the database..";
					/* adding the undifined site binary file to the database under case_id=0 */
					//setting the file name to uploaded-file-name_case-id
					$this->binary_file_model->name = $file_name[0];
					//setting the binary file location.
					$this->binary_file_model->location = 'files/Binary_files/undefined_binary_files/';	
					//setting the case id for this binary file.	
					$this->binary_file_model->case_id = 0;			
					
					//execute the add file function.
					$file_id = $this->binary_file_model->addBinaryFile();
					//moving the binaryfile to the undefined binary files directory
					rename('files/binary_files/new_binary_files/'.$file_data['file_name'],'files/binary_files/undefined_binary_files/'.$file_name[0].'_'.$file_id.'.BIN');
					//redirect the user to add site page
					$this->session->set_userdata('site',$this->tsdp_file->CI->file_header->site_ID);
					$this->session->set_userdata('county',$this->tsdp_file->CI->file_header->info1);
					$this->session->set_userdata('long',$this->tsdp_file->CI->file_header->longitude);
					$this->session->set_userdata('lat',$this->tsdp_file->CI->file_header->latitude);
					$this->session->set_userdata('siteCase',1);
					$this->session->set_userdata('binary','files/binary_files/undefined_binary_files/'.$file_name[0].'_'.$file_id.'.BIN');
					redirect(base_url().'site/add');
				}
			}
			//delete the generated count output file
			unlink($file);
			redirect(base_url().'cases/manage?message='.urlencode($message));
		}
	}
	
	
	/**
	 * Function name: read_and_save
	 * Description: 
	 * this function reads the given tsdp file and save it to database
	 * 
	 * Parameters:
	 * $file: TSPD output text file.
	 * $case_id: the id of the case for this file.
	 * 
	 * created date: 23-2-2014
	 * created by: Eng. Ahmad Mulhem Barkat
	 * contact: molham225@gmail.com
	 */
	public function read_and_save($file,$case_id){
		$this->session->set_userdata('file',$file);
		$this->session->set_userdata('case',$case_id);
		redirect(base_url()."tsdp_file");
		//call read file lines function with the file as aparameter
		$this->tsdp_file->read_file_lines($file);
		
		//save the read file into the database on this case id
		$this->tsdp_file->save_to_database($case_id);
	}
	
}

	

/* End of file cases.php */
/* Location: ./application/controllers/cases.php */
