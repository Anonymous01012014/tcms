<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Tsdp_file extends CI_Controller{
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
	
	public function index(){
		$this->read_file_lines($this->session->userdata['file']);
		$this->save_to_database($this->session->userdata['case']);
		//redirect(base_url().'cases');
	}
	
	
	/**
	 * Function name: read_file_lines
	 * 
	 * Description: 
	 * this function reads the given file line by line and 
	 * stores them in the corresponding objects.
	 * This process envolves the following steps:
	 * 
	 *  1- open the given file to read its contents.
	 * 
	 *  2- loop on every line in the file until the end of file.
	 * 
	 * 	3- in the loop do the following processes for each line:
	 * 
	 * 		a- if the line isn't empty check put its contents in an array.
	 * 
	 * 		b- if the flag field (index = 0) equals "-2" then this is 
	 * 		   the file header line.Save this line into a file header 
	 * 		   object of the file header model.
	 * 		   Also,set the storage mode in this object to the one in this 
	 * 		   line (index = 11).
	 * 
	 * 		c- if the flag field equals "-1" then this is a lane header line.
	 * 		   Save this line in a lane header object of the lane header 
	 * 		   model and add this object to the lane headers array in this class.
	 * 
	 * 		d- if the flag field equals "-4" then this is the classification 
	 * 		   setup line.Save this line in a classification setup object
	 * 		   of the classification setup model.
	 * 
	 * 		e- if the flag field equals "0" then this is a count record line.
	 * 		   Save it in a count record object of the count record model and
	 * 		   add this object to the count records array in this class.
	 * 
	 * 		f- if the flag doesn't match any of the previous values then check 
	 * 		   the current storage mode(that is already determined in the file 
	 * 		   header section).
	 * 
	 * 		g- if the storage mode is "PER_VEHICLE" then this is a per vehicle 
	 * 		   record.Save it in a per vehicle record object of the per vehicle
	 * 		   record model and add this object to the per vehicle records array
	 * 		   in this class.
	 * 
	 * 		h- if the storage mode is "AXLE_CLASSIFICATION" then this is an axle 
	 * 		   classification record.Save it in an axle classification record 
	 * 		   object of the axle classification record model and add this object
	 * 		   to the per vehicle records array in this class.
	 * 	4- close the file.
	 * 
	 * Parameters:
	 * $file: TSPD output text file.
	 * 
	 * created date: 23-2-2014
	 * created by: Eng. Ahmad Mulhem Barkat
	 * contact: molham225@gmail.com
	 */
	public function read_file_lines($file){
		$this->load->helper('date');
		//load string helper
		$this->load->helper('string');
		//load enumeration helper
		$this->load->helper('enumeration');
		$now = date('m/d/Y h:i:s a', time());
		echo "<br />".$now."<br />";
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
				$line = $this->separate_line($line);
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
						$this->count_records[count($this->count_records)] = clone $this->count_record;
						break;
					default:
						$now = date('m/d/Y h:i:s a', time());
						echo "<br />".$now."<br />";
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
		$now = date('m/d/Y h:i:s a', time());
		echo "<br />".$now."---------------------------------------<br />";
	}
	
	
	/**
	 * Function name: save_to_database
	 * 
	 * Description: 
	 * this function stores the data of this TSDP 
	 * output file in the database.
	 * This function does its job as follows:
	 * 
	 * 	1- check the storage mode from the file header object in this class.
	 * 	   if it is 'count' or 'per vehicle' do the following:
	 * 
	 * 		- get the statistics record data from the file header object and
	 * 		  save it to data base.Save the id of the added statistics record 
	 * 		  in the "statistics_record_id" field.
	 * 
	 * 		- get the counters of this case's site and loop on them.
	 * 
	 * 		  	a- If the serial number of any of them matches this case's 
	 * 		  	   counter serial then this is the counter of this case,so
	 * 		 	   get the lanes of this counter and save their ids in the 
	 * 		  	   "lanes_ids" array in the same order they have in the
	 * 		 	   counter.
	 * 
	 * 			b- if no match was found then do the following:
	 * 
	 * 				+ get this counter data from the file header and add it
	 * 				  to the database as a new counter.
	 * 
	 * 				+ add this counter to the site of this case.
	 * 
	 * 				+ get the lanes of this site and loop on them.if a lane 
	 * 				  that doesn't have a counter and its direction matches
	 * 				  any of the counter's lanes direction then add the counter,
	 * 				  to this lane and add this lane id to the "lanes_ids" 
	 * 				  array in the same order of the matching counter lane. 
	 * 			   
	 * 		- In this step all of the important variables are filled with data.
	 * 		  Get the 'lane' and 'lane record' data from the lane headers array
	 * 		  and save them to the database using the ids from the lanes_ids array
	 * 		  where: 
	 * 			lane_number(from the lane header) - 1 == lanes_ids index.   
	 * 		
	 * 		- If the storage mode is 'count' then this is a count record.
	 * 		  get the data of each 'count record' + 'count lane record' from
	 * 		  one row from the count_records array and save it to the database. 
	 * 
	 * Parameters:
	 * $case_id: the id of the 
	 * 
	 * created date: 23-2-2014
	 * created by: Eng. Ahmad Mulhem Barkat
	 * contact: molham225@gmail.com
	 */
	public function save_to_database($case_id){
		//load helpers
		$this->load->helper('enumeration');
		$this->load->helper('date');
		$now = date('m/d/Y h:i:s a', time());
		echo "<br />".$now."<br />";
		/** Important variables **/
		
		//the id of this counter in the database
		$counter_id = 0;
		//the id of the site of this file in the database
		$site_id = 0;
		//this counter's lanes ids and their indeces in the array represent their order in this counter.
		$lanes_ids = array(0,0);
		//the id of the statistics record for this file
		$statistics_record_id = 0;
		
		/** End of section**/
		
		//if this file is a count or per vehicle file
		if($this->storage_mode == COUNT || $this->storage_mode == PER_VEHICLE){
		
			/** Inserting file header info into the database **/
			
			//load statistics model
			$this->load->model('statistics_record_model');
			//fill model fields with tsdp file header data
			$this->statistics_record_model->operator_name = $this->file_header->operator;
			$this->statistics_record_model->weather = $this->file_header->weather;
			$this->statistics_record_model->storage_mode = $this->file_header->storage_mode;
			$this->statistics_record_model->posted_speed_limit = $this->file_header->posted_speed_limit;
			$this->statistics_record_model->start_date = date_to_sql($this->file_header->start_date);
			$this->statistics_record_model->start_time = $this->file_header->start_time;
			$this->statistics_record_model->stop_date = date_to_sql($this->file_header->stop_date);
			$this->statistics_record_model->stop_time = $this->file_header->stop_time;
			$this->statistics_record_model->interval_length = $this->file_header->interval_length;
			$this->statistics_record_model->case_id = $case_id;
			
			//insert statistics record into the database and getting its id
			$statistics_record_id = $this->statistics_record_model->addStatisticsRecord();
			if(isset($statistics_record_id[0])){
				$statistics_record_id = $statistics_record_id[0]['statistics_record_id'];
			}
			
			/** End of Inserting file header info into the database section**/
			
			/** adding the counter to the site if it wasn't added before **/
			
			//load database views model model
			$this->load->model('db_views_model');
			//load the lane model
			$this->load->model('lane_model');
			
			//get the counters of the site of the specified case.
			$counters = $this->db_views_model->getSiteCountersByCaseId($case_id);
			//flag that is set to true if the counter was already added to this site
			$exists = false;
			//if the counter exists in the database extract its site and lanes
			foreach($counters as $counter){
				if($counter['serial'] == $this->file_header->counter_serial){
					//if the counter exists get its id and its site id and lanes ids.
					$exists = true;
					$counter_id = $counter['counter_id'];
					$site_id = $counter['site_id'];
					//get the lanes ids of this counter
					$this->lane_model->counter_id = $counter['counter_id'];
					$lanes = $this->lane_model->getLanesByCounterId();
					for($i=0;$i<count($lanes);$i++){
						$lanes_ids[$i] = $lanes[$i]['id'];
					}
					break;
				}
			}
			//if the counter isn't already in the database
			if(!$exists){
				
				/** Add this counter to the database **/
				
				//load counter model
				$this->load->model('counter_model');
				//fill the model variables
				$this->counter_model->serial = $this->file_header->counter_serial;
				$this->counter_model->unit_type = $this->file_header->unit_type;
				$this->counter_model->unit_version = $this->file_header->unit_ver;
				//get site id
				
				if(isset($counters[0])){
					$site_id = $counters[0]['site_id'];
				}else{
					//load site model
					$this->load->model('site_model');
					$this->site_model->name = $this->file_header->site_ID;
					$site = $this->site_model->getSiteByName();
					if(isset($site[0])){
						$site_id = $site[0]['id'];
					}
				}
				
				$this->counter_model->site_id = $site_id;
				
				//execute the addition function
				$counter_id = $this->counter_model->addCounter();
				
				//get the id from the returned array
				if(isset($counter_id[0])){
					$counter_id = $counter_id[0]['counter_id'];
				}
				
				/** End of section **/
				
				/** Add the counter to its lanes **/
				
				//get the lanes of this site
				$this->lane_model->site_id = $site_id; 
				$lanes = $this->lane_model->getLaneBySiteId();
				foreach($lanes as $lane){
					//check if the lane already has a counter
					if($lane['counter_id'] == 0 || $lane['counter_id'] == ""){
						for($i=0;$i<2;$i++){
							//If the site has more than one lane with the same direction
							//the app will add the counter to the first two lanes with the 
							//same direction as ones in the lane headers and have no counter in them.
							
							//if this index's field of the lanes ids already has a lane id skip it.
							if($lanes_ids[$i] !== 0){
								continue;
							}
							//get the direction and number of this lane
							$direction = $this->lane_headers[$i]->lane_1_info;
							$lane_number =(int) $this->lane_headers[$i]->lane_number;
							//echo $this->lane_headers[$i]->lane_1_info .' '. $lane['lane_direction'];
							if( $direction == $lane['lane_direction']){
								//add counter to lane
								$this->lane_model->lane_number = $lane_number;
								$this->lane_model->counter_id = $counter_id;
								$this->lane_model->id = $lane['id'];
								$this->lane_model->addCounterToLane();
								//put this lane's id in the lanes_ids array
								$lanes_ids[$lane_number - 1] = $lane['id'];							
							}
						}
					} 
				}
			/** End of section **/
			}
			/** End of section**/
			
			/** Inserting lane headers info into the database **/
			for($i=0;$i<count($this->lane_headers);$i++){
				/** Adding Lane record table info **/
				//load lane record model
				$this->load->model('lane_record_model');
				//filling the model's fields
				$this->lane_record_model->lane_sensor = $this->lane_headers[$i]->lane_sensor;
				$this->lane_record_model->count_method = $this->lane_headers[$i]->count_method;
				$this->lane_record_model->lane_mode = $this->lane_headers[$i]->lane_mode;
				$this->lane_record_model->statistics_record_id = $statistics_record_id;
				$this->lane_record_model->lane_id = $lanes_ids[$i];
				
				//execute the addition function
				$this->lane_record_model->addLaneRecord();
				/** End of section **/ 
				
				/** Adding lane table info **/
				$this->lane_model->lane_spacing = $this->lane_headers[$i]->lane_1_spacing;
				$this->lane_model->id = $lanes_ids[$i];
				$this->lane_model->addBinFileData();
				/** End of section **/
			}
			
			/** End of section **/
		}
		
		if($this->storage_mode == COUNT){
			
			/** Inserting count records + count lane records info into the database **/
			
			//load models
			$this->load->model('count_record_model');
			$this->load->model('count_lane_record_model');
			
			for($i=0;$i<count($this->count_records);$i++){
				$now = date('m/d/Y h:i:s a', time());
				echo "<br />".$now."---count<br />";
				//fill count record model fields
				$this->count_record_model->date = date_to_sql($this->count_records[$i]->date);
				$this->count_record_model->time = $this->count_records[$i]->time;
				$this->count_record_model->interval_length = $this->count_records[$i]->interval_length;
				$this->count_record_model->statistics_record_id = $statistics_record_id;
				
				//execute the addition function
				$count_record_id = $this->count_record_model->addCountRecord();
				if(isset($count_record_id[0])){
					$count_record_id = $count_record_id[0]['count_record_id'];
				}
				$lane_totals = $this->count_records[$i]->lane_total;
				//get the counts from the bins total array as key(lane number)=>value(count)
				foreach($lane_totals as $lane_num => $b_total){
					//fill the model's fields
					$this->count_lane_record_model->count = $b_total;
					$this->count_lane_record_model->lane_id = $lanes_ids[(int)$lane_num -1];
					$this->count_lane_record_model->count_record_id = $count_record_id;
					//execute the addition function
					$this->count_lane_record_model->addCountLaneRecord();
				}
			}
			/** End of section **/
		}
		else if($this->storage_mode == PER_VEHICLE){
			/** Inserting per vehicl records + vehicle axle spacings info into the database **/
			
			//load models
			$this->load->model('per_vehicle_record_model');
			$this->load->model('vehicle_axle_spacing_model');
			
			for($i=0;$i<count($this->per_vehicle_records);$i++){
				$now = date('m/d/Y h:i:s a', time());
				echo "<br />".$now."----per vehicle<br />";
				//fill per vehicle model with data
				$this->per_vehicle_record_model->date = date_to_sql($this->per_vehicle_records[$i]->date);
				$this->per_vehicle_record_model->time = $this->per_vehicle_records[$i]->time;
				$this->per_vehicle_record_model->speed = $this->per_vehicle_records[$i]->speed;
				$this->per_vehicle_record_model->axles = $this->per_vehicle_records[$i]->axles;
				$this->per_vehicle_record_model->total_number = $this->per_vehicle_records[$i]->total_length;
				$this->per_vehicle_record_model->statistics_record_id = $statistics_record_id;
				$this->per_vehicle_record_model->lane_id = $lanes_ids[$this->per_vehicle_records[$i]->lane - 1];
				//execute the addition function
				$per_vehicle_record_id = $this->per_vehicle_record_model->addPerVehicleRecord();
				if(isset($per_vehicle_record_id[0])){
					$per_vehicle_record_id = $per_vehicle_record_id[0]['per_vehicle_record_id'];
				}
				//get the axle spacings from the axle spacings array 
				foreach($this->per_vehicle_records[$i]->axle_spacings as $axle_spacing){
					//fill vehicle axle spacing model with data
					$this->vehicle_axle_spacing_model->spacing = $axle_spacing;
					$this->vehicle_axle_spacing_model->per_vehicle_record_id = $per_vehicle_record_id;
					//execute the addition function
					$this->vehicle_axle_spacing_model->addVehicleAxleSpacing();
				}
			}
			
			/** End of section **/
			
		}
		$now = date('m/d/Y h:i:s a', time());
		echo "<br />".$now."<br />";
	}
	
	
	/**
	 * This function takes a string as a parameter splits it into an array of
	 * strings by commathen it trims each string and strips it from quotes
	 **/
	function separate_line($line){
		$this->load->helper('string');
		$line = explode(',',$line);
		for($i=0 ;$i<count($line);$i++){
			$line[$i] = strip_quotes(trim($line[$i]));
		}
		return $line;
	}
	
}
