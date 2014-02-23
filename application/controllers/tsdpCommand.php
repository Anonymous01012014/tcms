<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class TsdpCommand extends CI_Controller {
	var $lane_headers = array();
	var $count_records = array();
	public function index(){
		//echo execInBackground("whoami");
	//	exec(__DIR__ ."\TSDP\TSDP.exe AUTO --in ". __DIR__ ."\TSDP\BinFiles\\test_10.BIN --out ". __DIR__ ."\TSDP\b.txt --settings ". __DIR__ ."\TSDP\SettingsFiles\CGSET.INI --numLanes 2 --classification --twoWay --sensorSpacing 48 2> error.txt");
		//echo "<h1>analyze completed</h1>";
		//echo __DIR__ ."\TSDP\TSDP.exe AUTO --in ". __DIR__ ."\TSDP\BinFiles\\test_10.BIN --out ". __DIR__ ."\TSDP\b.txt --settings ". __DIR__ ."\TSDP\SettingsFiles\CGSET.INI --numLanes 2 --classification --twoWay --sensorSpacing 48 2> error.txt" ;
		
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
							//addthis lane header object to the lane headers array
							$this->lane_headers[count($this->lane_headers)] = clone $this->lane_header;
							break;
							/** Count Record **/	
						case '0':
							$this->load->model("/TSDP_file/count_record");
							//insert the current line in this count record object
							$this->count_record->insert($line);
							//add this count record object to the count records array
							$this->count_records[count($this->count_records)] = clone $this->count_record;
							break;
						}
					
				}
			  }
			fclose($file);
			$this->print_headers();
		
	}
	
	public function print_headers(){
		echo var_dump($this->file_header);
		echo var_dump($this->lane_headers);
		echo var_dump($this->count_records);
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
