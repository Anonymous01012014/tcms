<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Upload_sevice extends CI_Controller {
	
	/**
	 * upload_sevice variables
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
	 
	public function login()
	{
		//load user model.
		$this->load->model('user_model');
		
		//fill use model with user and password
		$this->user_model->username = $this->input->post('username');
		$this->user_model->password = md5($this->input->post('password'));
		
		//get the user specified by login info entered
		$user = $this->user_model->getUserByUsernameAndPassword();
		
		//if the user exists
		if(isset($user)){
			echo $user[0]['id'];
		}else{
			echo "User not found...";
		}
	}
	
	
	/**
	 * Function name : closeNormally
	 * Description: 
	 * this function will call a page to upload the binary file of the specified case.
	 * 
	 * created date: 11-3-2014
	 * created by: Eng. Ahmad Mulhem Barakat
	 * contact: molham225@gmail.com
	 */
	function addClosed($action,$case_id = 0)
	{
		if($this->check_login()){
			$config['upload_path'] = './files/Binary_files/new_binary_files/';
			$config['allowed_types'] = '*';
			$config['max_size']    = '80000';

			$this->load->library('upload', $config);
			if ( ! $this->upload->do_upload('binary_file') )
			{
				$error = array('error' => $this->upload->display_errors());
				echo print_r($error);
				//$this->load->view('upload_form', $error);
			}
			else
			{
				$this->load->model('binary_file_model');
				$this->load->model('case_model');
				
				//get binary file data
				$file_data =  $this->upload->data();
				
				
				//split the name and extension of the file
				$file_name = explode('.',$file_data['file_name']);
				if($file_name[count($file_name) - 1] == "BIN" || $file_name[count($file_name) - 1] == "bin"){
					//if the action is close the create an open case to be closed
					//if($action == "open_close"){					
						//insert post values into the model
						$this->case_model->site_id = $this->input->post('site');
						$this->case_model->admin_id = 0;
						$this->case_model->collector_id = $this->session->userdata['user']['id'];
						
						//Execute addition function.
						$case_id = $this->case_model->openCase();
						echo $case_id;
					//}
					//setting the file name to uploaded-file-name_case-id
					$this->binary_file_model->name = $file_name[0].'_'.$case_id.'.BIN';
					//setting the binary file location.
					$this->binary_file_model->location = 'files/Binary_files/new_binary_files/';	
					//setting the case id for this binary file.	
					$this->binary_file_model->case_id = $case_id;		
					//setting the counter id for this binary file
					//This step shouldn't be here	
					//$this->binary_file_model->counter_id = 1;		
					
					//execute the add file function.
					$this->binary_file_model->addBinaryFile();
					
					//set the id of the case to be closed to the given id.
					$this->case_model->id = $case_id;
					// set the collector id to the current user id.
					$this->case_model->collector_id = $this->session->userdata['user']['id'];
					
					//execute the close normally function
					$this->case_model->closeNormally();
					rename('files/binary_files/new_binary_files/'.$file_data['file_name'],'files/binary_files/new_binary_files/'.$file_name[0].'_'.$case_id.'.BIN');
					
				}
			}
		}else{
			echo "User not found..."
		}
	}
	
	/**
	 * Function: ckeck_login.php
	 * Description: 
	 * checks if the user given user and pass matches its returned id.
	 * 
	 * created date: 11-3-2014
	 * ccreated by: Eng. Ahmad Mulhem Barakat
	 * contact: molham225@gmail.com 
	 */
	 
	public function ckeck_login()
	{
		//load user model.
		$this->load->model('user_model');
		
		//fill use model with user and password
		$this->user_model->username = $this->input->post('username');
		$this->user_model->password = md5($this->input->post('password'));
		
		//get the user specified by login info entered
		$user = $this->user_model->getUserByUsernameAndPassword();
		
		//if the user exists
		if(isset($user)){
			if($user[0]['id'] == $this->input->post['user_id']){
				return true;
			}
		}else{
			return false;
		}
	}
}

/* End of file login.php */
/* Location: ./application/controllers/login.php */
