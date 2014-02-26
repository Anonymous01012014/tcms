<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class TsdpCommand extends CI_Controller {
	var $storage_mode = '';
	var $lane_headers = array();
	//an array to store the count record objects
	var $count_records = array();
	
	//an array to store the per vehicle record objects
	var $per_vehicle_records = array();
	
	//an array to store the axle classification record objects
	var $axle_classification_records = array();
	
	//an array to store the speed classification record objects
	var $speed_classification_records = array();
	
	public function index(){
		$now = date('m/d/Y h:i:s a', time());
		echo "<br />".$now."<br />";
		//echo execInBackground("whoami");
	//	exec(__DIR__ ."\TSDP\TSDP.exe AUTO --in ". __DIR__ ."\TSDP\BinFiles\\test_10.BIN --out ". __DIR__ ."\TSDP\b.txt --settings ". __DIR__ ."\TSDP\SettingsFiles\CGSET.INI --numLanes 2 --classification --twoWay --sensorSpacing 48 2> error.txt");
		//echo "<h1>analyze completed</h1>";
		//echo __DIR__ ."\TSDP\TSDP.exe AUTO --in ". __DIR__ ."\TSDP\BinFiles\\test_10.BIN --out ". __DIR__ ."\TSDP\b.txt --settings ". __DIR__ ."\TSDP\SettingsFiles\CGSET.INI --numLanes 2 --classification --twoWay --sensorSpacing 48 2> error.txt" ;
		//load enumeration helper
		$this->load->helper('enumeration');
			$file = fopen("files/output_files/count/test_20_14.txt", "r") or exit("Unable to open file!");
			//Output a line of the file until the end is reached
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
					case '-2':
						$this->load->model("/TSDP_file/file_header");
						//insert the current line in this file header object
						$this->file_header->insert($line);
						//find out the current storage mode from the header 
						//and store it in this object.
						$this->storage_mode = storage_mode_enum($line[11]);
						break;
					case '-1':
						$this->load->model("/TSDP_file/lane_header");
						//insert the current line in this lane header object
						$this->lane_header->insert($line);
						//add this lane header object to the lane headers array
						$this->lane_headers[count($this->lane_headers)] = clone $this->lane_header;
						break;	
					case '-4':
						$this->load->model("/TSDP_file/classification_setup");
						//insert the current line in this classification setup object
						$this->classification_setup->insert($line);
						break;
					case '0':
						$this->load->model("/TSDP_file/count_record");
						//insert the current line in this count record object
						$this->count_record->insert($line);
						//add this count record object to the count records array
						$this->count_records[count($this->count_records)] = clone $this->count_record;
						break;
					default:
						if($this->storage_mode == PER_VEHICLE){
							$this->load->model("/TSDP_file/per_vehicle_record");
							//insert the current line in this per vehicle record object
							$this->per_vehicle_record->insert($line);
							//add this count record object to the count records array
							$this->per_vehicle_records[count($this->per_vehicle_records)] = clone $this->per_vehicle_record;
						}else
						if($this->storage_mode == AXLE_CLASSIFICATION){
							$this->load->model("/TSDP_file/classification_record");
							//insert the current line in this classification record object
							$this->classification_record->insert($line);
							//add this axle classification record object to the axle classification records array
							$this->axle_classification_records[count($this->axle_classification_records)] = clone $this->classification_record;
						}else
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
			$this->print_headers();
			$now = date('m/d/Y h:i:s a', time());
		echo "<br />".$now."<br />";
		
	}
	
	public function print_headers(){
		echo var_dump($this->file_header);
		echo var_dump($this->lane_headers);
		echo var_dump($this->count_records);
		echo var_dump($this->per_vehicle_records);
		echo var_dump($this->axle_classification_records);
		echo var_dump($this->speed_classification_records);
		echo var_dump($this->lane_headers[0]->lane_number + 1);
	}
	
	function separate_line($line){
		$this->load->helper('string');
		$line = explode(',',$line);
		for($i=0 ;$i<count($line);$i++){
			$line[$i] = strip_quotes(trim($line[$i]));
		}
		return $line;
	}
}







		
?>
