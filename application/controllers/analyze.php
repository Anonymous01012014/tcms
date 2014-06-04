<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Analyze extends CI_Controller {



	/**
	 * Function name : __construct
	 * Description: 
	 * this contructor is called as this object is initiated.
	 * 
	 * created date: 18-2-2014
	 * ccreated by: Eng. Mohanad Shab Kaleia
	 * contact: ms.kaleia@gmail.com 
	 */
	public function __construct()
	{
		parent::__construct();
		//check login state of the user requestin this controller.
		$this->load->helper('is_logged_in');
		checkLogin($this->session->userdata['user']);
		
		//these helper classes are for file upload function. 
		$this->load->helper(array('form', 'url'));
	}

	/**
	 * this controller is to control the analyze functions like 
	 * set tscdp parameters
	 * execute tsdp command on a spesific file
	 */
	public function index()
	{
		
	}
	
	
	/**
	 * Function name : parameterSet
	 * Description: 
	 * this function will call tsdp paramteres view to set TSDP command parameters
	 * 
	 * created date: 27-4-2014
	 * created by: Eng. Mohanad Kaleia
	 * contact: ms.kaleia@gmail.com
	 */
	public function parameterSet($case_id)
	{
		//pass the case id to the paramater set page
		$data["case_id"] = $case_id;
			
		$data['user_data'] = $this->session->userdata['user'];;
		//call the general views for page structure	
		$this->load->view('gen/header');
		$this->load->view('gen/main_menu',$data);
		$this->load->view('gen/logo');
		$this->load->view('gen/main_content');
	
		$this->load->view('parameters_add' , $data);
		
		$this->load->view('gen/footer');
	}
	
	
	/**
	 * Function name : analyzeFile
	 * Description: 
	 * read tsdp parameters from the interface and apply these parameters to TSDP command
	 * the generated file put it in the output folder
	 * 
	 * created date: 27-4-2014
	 * created by: Eng. Mohanad Kaleia
	 * contact: ms.kaleia@gmail.com
	 */
	public function analyzeFile()
	{		
		//get tsdp paramters options
		
		//analyze type
		$analyze_type = $this->input->post('analysis_type');
		
		//lane number
		$num_lane = $this->input->post('num_lane');
		
		//lane direction
		$lane_direction = $this->input->post('lane_direction');
		
		//tube
		$tube = $this->input->post('tube');
		
		//sensor spacing
		$sensor_spacing = $this->input->post('sensor_spacing');
		
		//get binary file from case id
		$case_id = $this->input->post('case_id');
						
		$this->load->model("tsdp_file");
		
		//generate output file
		$output_file = $this->tsdp_file->generateOutputFile($analyze_type  , $num_lane , $lane_direction , $tube , $sensor_spacing , $case_id);						
		
		//read the output file lines
		$this->tsdp_file->read_file_lines($output_file);
		
		//save the output to the database
			
		$this->tsdp_file->save_to_database($case_id);	
		
		//echo "an output file is created succesfully";
		redirect(base_url().'cases/manage');
	}







	
	
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */