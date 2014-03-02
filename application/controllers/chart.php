<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Chart extends CI_Controller {

	/**
	 * Filename: chart.php
	 * Description: 
	 * chart controller will show charts
	 * 
	 * created date: 26-2-2014
	 * ccreated by: Eng. Mohanad Shab Kaleia
	 * contact: ms.kaleia@gmail.com 
	 */
	 
	 
	 
	public function index()
	{		
		$this->showChart();
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
	 * Function name : showChart
	 * Description: 
	 * this function will show chart page
	 * 
	 * created date: 26-2-2014
	 * ccreated by: Eng. Mohanad Shab Kaleia
	 * contact: ms.kaleia@gmail.com 
	 */
	public function showChart()
	{
		//get user information	
		$data['user_data'] = $this->session->userdata['user'];
				
		//looad site model and get all active sites
		$this->load->model("site_model");
		
		$sites = $this->site_model->getAllActiveSites();
		
		$data['sites'] = $sites;		
				
		//call the general views for page structure	
		$this->load->view('gen/header');
		$this->load->view('gen/main_menu',$data);
		$this->load->view('gen/logo');
		$this->load->view('gen/main_content');
	
		$this->load->view('chart' , $data);
		
		$this->load->view('gen/footer');
		
	}
	
	
	/**
	 * Function name : countChart
	 * Description: 
	 * this function will calcuate count chart
	 * 
	 * created date: 26-2-2014
	 * ccreated by: Eng. Mohanad Shab Kaleia
	 * contact: ms.kaleia@gmail.com 
	 */
	public function countChart($site_id = "", $start_date ="" , $end_date = "")
	{
		//load chart model
		$this->load->model("chart_model");
		
		//get count from database for a spesific site, start and end date
		$this->chart_model->site_id = $site_id;
		$count_records = $this->chart_model->getCounts();		
		echo json_encode($count_records);									
	}	
}

/* End of file site.php */
/* Location: ./application/controllers/site.php */
