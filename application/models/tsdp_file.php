<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class TSDP_file extends CI_Model{
	//a variable to store the file header object
	var $file_header;
	
	//a variable to store the classification setup object
	var $classification_setup;
	
	//an array to store the lane header objects
	var $lane_headers = array();
	
	//an array to store the count record objects
	var $count_records = array();
	
	//an array to store the per vehicle record objects
	var $per_vehicle_records = array();
	
	//an array to store the axle classification record objects
	var $axle_classification_records = array();
	
	//an array to store the speed classification record objects
	var $speed_classification_records = array();
	
	//a variable to store the current storage mode
	var $storage_mode;
	
	public function __construct(){
		parent::__construct();
		
	}
	
	public function read_file_lines($file){
		//load string helper
		$this->load->helper('string');
		//load enumeration helper
		$this->load->helper('enumeration');
		
		//open the given file
		$file = fopen($file, "r") or exit("Unable to open file!");
		//while didn't reach the end of file
		while(!feof($file))
		  {
			// get next line from the file
			$line = fgets($file);
			// if line not empty
			if(strlen(trim($line)) > 0 ){
				//form the line in an array of valid values
				$line = separate_line($line);
				//read the flag of the line
				$flag = $line[0];
				
				switch($flag){
					/** File Header **/
					case '-2':
						$this->load->model("/TSDP_file/file_header");
						//insert the current line in this file header object
						$this->file_header->insert($line);
						//find out the current storage mode from the header 
						//and store it in this object.
						$this->storage_mode = storage_mode_enum($line[11]);
						break;
					/** Lane Header **/	
					case '-1':
						$this->load->model("/TSDP_file/lane_header");
						//insert the current line in this lane header object
						$this->lane_header->insert($line);
						//add this lane header object to the lane headers array
						$this->lane_headers[count($this->lane_headers)] = clone $this->lane_header;
						break;
					/** Classification Setup **/	
					case '-4':
						$this->load->model("/TSDP_file/classification_setup");
						//insert the current line in this classification setup object
						$this->classification_setup->insert($line);
						break;
					/** Count Record **/	
					case '0':
						$this->load->model("/TSDP_file/count_record");
						//insert the current line in this count record object
						$this->count_record->insert($line);
						//add this count record object to the count records array
						$this->count_records[count($this->count_records)] = clone $this->lane_header;
						break;
					default:
						/** Per Vehicle Record **/
						if($this->storage_mode == PER_VEHICLE){
							$this->load->model("/TSDP_file/per_vehicle_record");
							//insert the current line in this per vehicle record object
							$this->per_vehicle_record->insert($line);
							//add this count record object to the count records array
							$this->per_vehicle_records[count($this->per_vehicle_records)] = clone $this->per_vehicle_record;
						}else
						/** Axle Classification Record **/
						if($this->storage_mode == AXLE_CLASSIFICATION){
							$this->load->model("/TSDP_file/classification_record");
							//insert the current line in this classification record object
							$this->classification_record->insert($line);
							//add this axle classification record object to the axle classification records array
							$this->axle_classification_records[count($this->axle_classification_records)] = clone $this->classification_record;
						}else
						/** Speed Classification Record **/
						if($this->storage_mode == SPEED_CLASSIFICATION){
							$this->load->model("/TSDP_file/classification_record");
							//insert the current line in this classification record object
							$this->classification_record->insert($line);
							//add this speed classification record object to the speed classification records array
							$this->speed_classification_records[count($this->speed_classification_records)] = clone $this->classification_record;
						}
						break;
				}
			}
		  }
		fclose($file);
	}

}
