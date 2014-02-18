<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class User extends CI_Controller {

	/**
	 * Filename: user.php
	 * Description: 
	 * user contoller that control the user for example add - edit - delete - manage - ...etc
	 * 
	 * created date: 17-2-2014
	 * created by: Eng. Ahmad Mulhem Barkat
	 * contact: molham225@gmail.com
	 */
	 
	 
	 
	public function index()
	{	
		$this->load->view('gen/header');
		$this->load->view('gen/main_menu');
		$this->load->view('gen/logo');
		$this->manage();
		$this->load->view('gen/footer');
	}	
	
	/**
	 * Function name : manage
	 * Description: 
	 * this function calls the case management view. 
	 * 
	 * created date: 17-2-2014
	 * created by: Eng. Ahmad Mulhem Barkat
	 * contact: molham225@gmail.com
	 */
	public function manage()
	{
		
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
	 * Function name : add
	 * Description: 
	 * this function will call user_add view. 
	 * 
	 * created date: 17-2-2014
	 * created by: Eng. Ahmad Mulhem Barkat
	 * contact: molham225@gmail.com
	 */
	public function add()
	{
		
		//call the general views for page structure	
		$this->load->view('gen/header');
		$this->load->view('gen/main_menu');
		$this->load->view('gen/logo');
		$this->load->view('gen/main_content');
		
		//show add user view
		$this->load->view('user_add');
			
		
		$this->load->view('gen/footer');
		
	}
	
	
	/**
	 * Function name : edit
	 * Description: 
	 * this function will call user_edit view. 
	 * 
	 * created date: 17-2-2014
	 * created by: Eng. Ahmad Mulhem Barkat
	 * contact: molham225@gmail.com
	 */
	public function edit($user_id)
	{
		//load user model.
		$this->load->model('user_model');
		//set user model id to given id.
		$this->user_model->id = $user_id;
		//get the data of the user to be edited
		$users = $this->user_model->getUserById();
		
		$user = $users[0];
		
		if(isset($user)){
			$data['user'] = $user;
			
			//call the general views for page structure	
			$this->load->view('gen/header');
			$this->load->view('gen/main_menu');
			$this->load->view('gen/logo');
			$this->load->view('gen/main_content');
			
			//show edit user view
			$this->load->view('user_edit',$data);
				
			
			$this->load->view('gen/footer');
		}
	}
	
	
	/**
	 * Function name : saveData
	 * Description: 
	 * this function will save the addition form info ot the database.
	 * 
	 * created date: 17-2-2014
	 * ccreated by: Eng. Ahmad Mulhem Barakat
	 * contact: molham225@gmail.com
	 */
	public function saveData($action,$id)
	{		
		// instanciating the model file
		$this->load->model('user_model');
		
		//insert post values into the model
		$this->user_model->first_name = $this->input->post('first_name');
		$this->user_model->middle_name = $this->input->post('middle_name');
		$this->user_model->last_name = $this->input->post('last_name');
		$this->user_model->username = $this->input->post('username');
		$this->user_model->address = $this->input->post('address');
		$this->user_model->phone_number = $this->input->post('phone_number');
		$this->user_model->mobile_number = $this->input->post('mobile_number');
		$this->user_model->type = $this->input->post('type');
		
		if($action == "add"){
			//insert post values into the model 
			if($this->input->post('password') == $this->input->post('re_password')){
				$this->user_model->password = md5($this->input->post('password'));
				//Execute addition function.
				$this->user_model->addUser();
			}
		}elseif($action == "edit" && $id>0){
			
			if(
				trim($this->input->post('re_password').$this->input->post('password')) !== "" &&
			    $this->input->post('password') == $this->input->post('re_password')
			    )
			    {
					$this->user_model->password = md5($this->input->post('password'));
			   }
				echo print_r($this->user_model);
				$this->user_model->id = $id;
				
				//Execute addition function.
				$this->user_model->modifyUser();
			}
	}
}

/* End of file user.php */
/* Location: ./application/controllers/user.php */
