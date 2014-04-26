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
          $this->ns = 'http://192.168.1.34:8080/tcms/service/';
          $this->load->library("Nusoap_library"); // load nusoap toolkit library in controller
          $this->nusoap_server = new soap_server(); // create soap server object
          $this->nusoap_server->configureWSDL("CaseControl", $this->ns); // wsdl configuration
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
				$CI->user_model->password = hash('sha256', $password, false);
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
			
		// registering login method in the wsdl
		$input_array = array ('username' => "xsd:string", 'password' => "xsd:string"); // login parameters
		$return_array = array ("return" => "xsd:string");
		$this->nusoap_server->register('login', $input_array, $return_array, "urn:SOAPServerWSDL", "urn:".$this->ns."/login", "rpc", "encoded", "Login to server services");
		
		
		/**
		 * Function: uploadBinary
		 * 
		 * Description: 
		 * Uploads the given binary file and creates a new open case for the 
		 * given site and closes it under the given user_id.
		 * 
		 * created date: 22-3-2014
		 * ccreated by: Eng. Ahmad Mulhem Barakat
		 * contact: molham225@gmail.com 
		 */
		
		function uploadBinary($encoded_file,$name,$user_id){
			$CI =& get_instance();
			//load user model.
			$CI->load->model('binary_file_model');
			$CI->load->model('case_model');
		
			$location = "./files/Binary_files/new_binary_files/";                               // Mention where to upload the file
			//criete the new file and suppress file not found warning
			$current = @file_get_contents($location); 
			// Get the file content. This will create an empty file if the file does not exist     
			$current = base64_decode($encoded_file);   // Now decode the content which was sent by the client     
			
			//if a file was chosen
			if($name!="")
			{
				
				//get binary file data
				$file_name =  $name;
				
				
				//split the name and extension of the file
				$file_name = explode('.',$file_name);
				//if the file is a binary file
				if(strtoupper($file_name[count($file_name) - 1]) == "BIN"){
					//put the file in the new binary files directory
					file_put_contents($location.$file_name[0].'.BIN', $current); 
					
					//execute the TSDP command with volume choice to generate the count text file.
					exec(__DIR__ ."\TSDP\TSDP.exe AUTO --in \"files/binary_files/new_binary_files/".$file_name[0].'.BIN'."\" --out \"files/output_files/count/".$file_name[0].".txt\" --settings ". __DIR__ ."\TSDP\SettingsFiles\CGSET.INI --numLanes 2 --volume --twoWay --sensorSpacing 48 ");	
					//echo __DIR__ ." files/binary_files/new_binary_files/".$file_name[0].'.BIN';
					//getting the output count file name
					$file = "files/output_files/count/".$file_name[0].".txt";
					//extracting data from the count file and send it to database
					$CI->load->model('tsdp_file');
					//reading TSDP count file into the model object
					$CI->tsdp_file->read_file_lines($file);
					//getting the site name and county from the file header
					$site_ID = $CI->tsdp_file->file_header->site_ID;
					$county = $CI->tsdp_file->file_header->info1;
					//loading site model
					$CI->load->model('site_model');
					//getting the id of this site
					$CI->site_model->name = $site_ID;
					$CI->site_model->name = $county;
					$site = $CI->site_model->getSiteByNameCounty();
					//if the site exists
					if(isset($site[0])){
						//get the opened case for this site
						$CI->case_model->site_id = $site[0]['id'];
						$open_case = $CI->case_model->getOpenCaseBySiteId();
						//if the site already has an opened case just close and
						if(isset($open_case[0])){
							$case_id = $open_case[0]['id'];
						}else{//if not create a new open case and close it
							//insert post values into the model
							$CI->case_model->site_id = $site[0]['id'];
							$CI->case_model->admin_id = 0;
							$CI->case_model->collector_id = $user_id;
							
							//Execute addition function.
							$case_id = $CI->case_model->openCase();
						}
						//inserting output file headers info into the database (just file_header for now)
						$CI->tsdp_file->save_file_headers($case_id);
						
						//setting the file name to uploaded-file-name_case-id
						$CI->binary_file_model->name = $file_name[0].'_'.$case_id.'.BIN';
						//setting the binary file location.
						$CI->binary_file_model->location = 'files/Binary_files/closed_binary_files/';	
						//setting the case id for this binary file.	
						$CI->binary_file_model->case_id = $case_id;			
						
						//execute the add file function.
						$CI->binary_file_model->addBinaryFile();
						
						//set the id of the case to be closed to the given id.
						$CI->case_model->id = $case_id;
						// set the collector id to the current user id.
						$CI->case_model->collector_id = $user_id;
						
						//execute the close normally function
						$CI->case_model->closeNormally();
						
						rename($location.$file_name[0].'.BIN','files/binary_files/closed_binary_files/'.$file_name[0].'_'.$case_id.'.BIN');
						
						return 0; // Output success message 	"File Uploaded successfully..."	
					}else{
						/* adding the undifined site binary file to the database under case_id=0 and thefile name is fileName_binaryFileId.BIN */
						//setting the file name to uploaded-file-name_case-id
						$CI->binary_file_model->name = $file_name[0];
						//setting the binary file location.
						$CI->binary_file_model->location = 'files/Binary_files/undefined_binary_files/';	
						//setting the case id for this binary file.	
						$CI->binary_file_model->case_id = 0;			
						
						//execute the add file function.
						$file_id = $CI->binary_file_model->addBinaryFile();
						//moving the binaryfile to the undefined binary files directory
						rename($location.$file_name[0].'.BIN','files/binary_files/undefined_binary_files/'.$file_name[0].'_'.$file_id.'.BIN');
						
						return 1;//"The site of this file doesn't exist.."
					}	
					//delete the generated output count file
					unlink($file);	
				}
				return 2; //"You should upload binary files only..."
			}
			else        
			{
				return 3;//"Please select a file for upload..."
			}
	 }
		// registering add closed case method in the wsdl
		$input_array = array ('encoded_file' => "xsd:string", 'name' => "xsd:string",'user_id'=>"xsd:int"); 
		$return_array = array ("return" => "xsd:int");
		$this->nusoap_server->register('uploadBinary', $input_array, $return_array, "urn:SOAPServerWSDL", "urn:".$this->ns."/uploadBinary", "rpc", "encoded", "Upload a file and create a new closed case for it");
		
		$this->nusoap_server->service(file_get_contents("php://input"));
	}
}
