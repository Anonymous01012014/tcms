<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Service extends CI_Controller
{
	
	/**
	 * Class name: Service
	 * 
	 * Description: 
	 * This is the web service that will be used by thye android program to manage TCMS functions.
	 * 
	 * created date: 17-3-2014
	 * ccreated by: Eng. Ahmad Mulhem Barakat
	 * contact: molham225@gmail.com 
	 */
	
	
	//service name space
	var $ns="";
	
     public function __construct()
     {
          parent::__construct();
          $this->ns = 'http://198.38.94.163/tcms/service/';
          $this->load->library("Nusoap_library"); // load nusoap toolkit library in controller
          $this->nusoap_server = new soap_server(); // create soap server object
          $this->nusoap_server->configureWSDL("CaseControl", $this->ns); // wsdl cinfiguration
          $this->nusoap_server->wsdl->schemaTargetNamespace = $this->ns; // server namespace
     }
     
     public function index(){
		 
		 
		 /**
		 * Function: login
		 * 
		 * Description: 
		 * Gets the user specified by the given username and password and retursns his data as json file.
		 * 
		 * created date: 17-3-2014
		 * ccreated by: Eng. Ahmad Mulhem Barakat
		 * contact: molham225@gmail.com 
		 */
		 
		 function login($username,$password)
			{
				$CI =& get_instance();
				//load user model.
				$CI->load->model('user_model');
				
				//fill use model with user and password
				$CI->user_model->username = $username;
				$CI->user_model->password = md5($password);
				
				//get the user specified by login info entered
				$user = $CI->user_model->getUserByUsernameAndPassword();
				
				$user_json = "";
				
				//if the user exists
				if(isset($user)){
						$user_json = json_encode($user);
				}else{
					$user = array("id" => "0");
					$user_json = json_encode($user);
				}
				return $user_json;
			}
			
			/*$this->nusoap_server->wsdl->addComplexType(
				'User',
				'complexType',
				'struct',
				'all',
				'',
				array(
					'fullName' => array('name' => 'fullName', 'type' => 'xsd:string'),
					'id' => array('name' => 'id', 'type' => 'xsd:int')
				)
			);*/
			
		// registering login method in the wsdl
		$input_array = array ('username' => "xsd:string", 'password' => "xsd:string"); // login parameters
		$return_array = array ("return" => "xsd:string");
		$this->nusoap_server->register('login', $input_array, $return_array, "urn:SOAPServerWSDL", "urn:".$this->ns."/login", "rpc", "encoded", "Login to server services");
		
		
		/**
		 * Function: addClosedCase
		 * 
		 * Description: 
		 * Uploads the given binary file and creates a new open case for the 
		 * given site and closes it under the given user_id.
		 * 
		 * created date: 17-3-2014
		 * ccreated by: Eng. Ahmad Mulhem Barakat
		 * contact: molham225@gmail.com 
		 */
		
		function addClosedCase($encoded_file,$name,$user_id,$site_id){
				$CI =& get_instance();
				//load user model.
				$CI->load->model('binary_file_model');
				$CI->load->model('case_model');
			
				$location = "./files/Binary_files/new_binary_files/";                               // Mention where to upload the file
				//criete the new file and suppress file not found warning
				$current = @file_get_contents($location); 
				// Get the file content. This will create an empty file if the file does not exist     
				$current = base64_decode($encoded);   // Now decode the content which was sent by the client     
				                      // Write the decoded content in the file mentioned at particular location      
				if($name!="")
				{
					
					//get binary file data
					$file_name =  $name;
					
					
					//split the name and extension of the file
					$file_name = explode('.',$file_name);
					
					if(strtoupper($file_name[count($file_name) - 1]) == "BIN"){
										
						//insert post values into the model
						$CI->case_model->site_id = $site_id;
						$CI->case_model->admin_id = 0;
						$CI->case_model->collector_id = $user_id;
						
						//Execute addition function.
						$case_id = $CI->case_model->openCase();
					
						//setting the file name to uploaded-file-name_case-id
						$CI->binary_file_model->name = $file_name[0].'_'.$case_id.'.BIN';
						//setting the binary file location.
						$CI->binary_file_model->location = 'files/Binary_files/new_binary_files/';	
						//setting the case id for this binary file.	
						$CI->binary_file_model->case_id = $case_id;		
						//setting the counter id for this binary file
						//This step shouldn't be here	
						//$this->binary_file_model->counter_id = 1;		
						
						//execute the add file function.
						$CI->binary_file_model->addBinaryFile();
						
						//set the id of the case to be closed to the given id.
						$CI->case_model->id = $case_id;
						// set the collector id to the current user id.
						$CI->case_model->collector_id = $user_id;
						
						//execute the close normally function
						$CI->case_model->closeNormally();
						file_put_contents($location.$file_name[0].'_'.$case_id.'.BIN', $current); 
						
						return "File Uploaded successfully..."; // Output success message 				
				}
				return "You should upload binary files only...";
			}
			else        
			{
				return "Please upload a file...";
			}
	 }
		// registering add closed case method in the wsdl
		$input_array = array ('encoded_file' => "xsd:string", 'name' => "xsd:string",'user_id'=>"xsd:int",'site_id'=>"xsd:int"); 
		$return_array = array ("return" => "xsd:string");
		$this->nusoap_server->register('addClosedCase', $input_array, $return_array, "urn:SOAPServerWSDL", "urn:".$this->ns."/addClosedCase", "rpc", "encoded", "Upload a file and create a new closed case for it");
		
	 
		/**
		 * Function: closeCaseNormally
		 * 
		 * Description: 
		 * Uploads the given binary file upon the given open case closes it under the given user_id.
		 * 
		 * created date: 17-3-2014
		 * ccreated by: Eng. Ahmad Mulhem Barakat
		 * contact: molham225@gmail.com 
		 */
		
		function closeCaseNormally($encoded_file,$name,$user_id,$case_id){
				$CI =& get_instance();
				//load user model.
				$CI->load->model('binary_file_model');
				$CI->load->model('case_model');
			
				$location = "./files/Binary_files/new_binary_files/";   // Mention where to upload the file
				//criete the new file and suppress file not found warning
				$current = @file_get_contents($location); 
				// Get the file content. This will create an empty file if the file does not exist     
				$current = base64_decode($encoded);   // Now decode the content which was sent by the client     
				                      // Write the decoded content in the file mentioned at particular location      
				if($name!="")
				{
					
					//get binary file data
					$file_name =  $name;
					
					
					//split the name and extension of the file
					$file_name = explode('.',$file_name);
					
					if(strtoupper($file_name[count($file_name) - 1]) == "BIN"){
					
						//setting the file name to uploaded-file-name_case-id
						$CI->binary_file_model->name = $file_name[0].'_'.$case_id.'.BIN';
						//setting the binary file location.
						$CI->binary_file_model->location = 'files/Binary_files/new_binary_files/';	
						//setting the case id for this binary file.	
						$CI->binary_file_model->case_id = $case_id;		
						//setting the counter id for this binary file
						//This step shouldn't be here	
						//$this->binary_file_model->counter_id = 1;		
						
						//execute the add file function.
						$CI->binary_file_model->addBinaryFile();
						
						//set the id of the case to be closed to the given id.
						$CI->case_model->id = $case_id;
						// set the collector id to the current user id.
						$CI->case_model->collector_id = $user_id;
						
						//execute the close normally function
						$CI->case_model->closeNormally();
						file_put_contents($location.$file_name[0].'_'.$case_id.'.BIN', $current); 
						
						return "File Uploaded successfully..."; // Output success message 				
				}
				return "You should upload binary files only...";
			}
			else        
			{
				return "Please upload a file...";
			}
	 }
	 
	 
		// registering close case normally method in the wsdl
		$input_array = array ('encoded_file' => "xsd:string", 'name' => "xsd:string",'user_id'=>"xsd:int",'case_id'=>"xsd:int"); 
		$return_array = array ("return" => "xsd:string");
		$this->nusoap_server->register('closeCaseNormally', $input_array, $return_array, "urn:SOAPServerWSDL", "urn:".$this->ns."/closeCaseNormally", "rpc", "encoded", "Upload a file to close a case");
		
		
		
		
		function closeCaseManually($reason,$user_id,$case_id){
			$CI =& get_instance();
			//load  models.
			$CI->load->model('case_model');
			
			//insert values into the model
			$CI->case_model->id = $case_id;
			$CI->case_model->manual_closing_reason = $reason;	
			$CI->case_model->collector_id = $user_ids;	
			
			//Execute manual close function.
			$CI->case_model->closeManually();
			return 1;
		 }
		 
	 
		// registering upload file method in the wsdl
		$input_array = array ('reason' => "xsd:string",'user_id'=>"xsd:int",'case_id'=>"xsd:int"); 
		$return_array = array ("return" => "xsd:int");
		$this->nusoap_server->register('closeCaseManually', $input_array, $return_array, "urn:SOAPServerWSDL", "urn:".$this->ns."/closeCaseManually", "rpc", "encoded", "Close a case manually and save the reason for that");
		
		
		/**
		 * Function: getSites
		 * 
		 * Description: 
		 * Gets all of the available active sites in the database.
		 * 
		 * created date: 17-3-2014
		 * ccreated by: Eng. Ahmad Mulhem Barakat
		 * contact: molham225@gmail.com 
		 */
		function getSites(){
			$CI =& get_instance();
			$CI->load->model('site_model');
		
			//get all active sites.
			$sites = $CI->site_model->getAllActiveSites();
			return json_encode($sites);
		}
		
		$input_array = array (); 
		$return_array = array ("return" => "xsd:string");
		$this->nusoap_server->register('getSites', $input_array, $return_array, "urn:SOAPServerWSDL", "urn:".$this->ns."/getSites", "rpc", "encoded", "Gets all of the active sites inthe database.");
		
		/**
		 * Function: getOpenCases
		 * 
		 * Description: 
		 * Gets all of the available open cases in the database to be closed by the user.
		 * 
		 * created date: 17-3-2014
		 * ccreated by: Eng. Ahmad Mulhem Barakat
		 * contact: molham225@gmail.com 
		 */
		
		function getOpenCases(){
			$CI =& get_instance();
			$CI->load->model('case_model');
		
			//get all active sites.
			$open_cases = $CI->case_model->getOpenCasesForView();
			return json_encode($open_cases);
		}
		
		$input_array = array (); 
		$return_array = array ("return" => "xsd:string");
		$this->nusoap_server->register('getOpenCases', $input_array, $return_array, "urn:SOAPServerWSDL", "urn:".$this->ns."/getOpenCases", "rpc", "encoded", "Gets all of the opened cases in the database.");
		
		$this->nusoap_server->service(file_get_contents("php://input"));
}
}
