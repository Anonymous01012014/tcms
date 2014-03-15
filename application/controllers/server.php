<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class server extends CI_Controller
{
	
	/**
	 * Class name: Server
	 * 
	 * Description: 
	 * these variables are used as flags in the login page
	 * 
	 * created date: 18-2-2014
	 * ccreated by: Eng. Ahmad Mulhem Barakat
	 * contact: molham225@gmail.com 
	 */
	
	/**
	 * Function: login.php
	 * Description: 
	 * the actual login process.
	 * 
	 * created date: 11-3-2014
	 * ccreated by: Eng. Ahmad Mulhem Barakat
	 * contact: molham225@gmail.com 
	 */
	//service name space
	var $ns="";
	
     public function __construct()
     {
          parent::__construct();
          $this->ns = 'http://192.168.1.33:8080/tcms/server/';
          $this->load->library("Nusoap_library"); // load nusoap toolkit library in controller
          $this->nusoap_server = new soap_server(); // create soap server object
          $this->nusoap_server->configureWSDL("CaseControl", $this->ns); // wsdl cinfiguration
          $this->nusoap_server->wsdl->schemaTargetNamespace = $this->ns; // server namespace
     }
     
     public function index(){
		 
		 
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
		
		
		function upload_file($encoded,$name,$user_id,$site_id){
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
		// registering upload file method in the wsdl
		$input_array = array ('encoded' => "xsd:string", 'name' => "xsd:string",'user_id'=>"xsd:int",'site_id'=>"xsd:int"); 
		$return_array = array ("return" => "xsd:string");
		$this->nusoap_server->register('upload_file', $input_array, $return_array, "urn:SOAPServerWSDL", "urn:".$this->ns."/upload_file", "rpc", "encoded", "Upload a file to close a case");
		$this->nusoap_server->service(file_get_contents("php://input"));
}
}
