<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login extends CI_Controller {

	/**
	 * Filename: login.php
	 * Description: 
	 * login contoller that login process.
	 * 
	 * created date: 17-2-2014
	 * ccreated by: Eng. Ahmad Mulhem Barakat
	 * contact: molham225@gmail.com 
	 */
	 
	 
	 
	public function index()
	{		
		$this->load->view('gen/header');
		$this->load->view('gen/main_menu');
		$this->load->view('gen/logo');
		$this->load->view('gen/main_content');
		$this->load->view('login');
		$this->load->view('gen/footer');
	}
}

/* End of file login.php */
/* Location: ./application/controllers/login.php */
