<?php if (!defined("BASEPATH")) exit("No direct script access allowed");

/**
 * Class name : User
 * 
 * Description :
 * This class contains functions to deal with the user table (Add , Edit , Delete)
 * 
 * Created date ; 11-2-2014
 * Modification date : ---
 * Modfication reason : ---
 * Author : Ahmad Mulhem Barakat
 * contact : molham225@gmail.com
 */    

class User_model extends CI_Model{
	/** User class variables **/
	
	//The id field of the user
	var $id;
	
	//The first name of the user
	var $first_name = "";
	
	//The middle name of the user
	var $middle_name = "";
	
	//The last name of the user
	var $last_name = "";
	
	//The login username of the user
	var $username = "";
	
	//The login password of the user encrypted with MD5 hash.
	var $password = "";
	
	//The current address of the user
	var $address = "";
	
	//The current phone number of the user
	var $phone_number = "";
	
	//The current mobile number of the user
	var $mobile_number = "";
	
	//The type of the user (collector or operator)
	var $type = "";
	
	//The date of adding this user to the app
	var $hire_date = "";
	
	//The date of ending this user.once the end date 
	//is determined the user is no longer able to login the app
	var $end_date = "";
	
	/**
     * Constructor
     **/	
	function __construct()
    {
        parent::__construct();
    }
    
    /**
     * Class functions
	 **/
    
    /**
	 * function name : addUser
	 * 
	 * Description : 
	 * add new user to the app
	 * 
	 * parameters:
	 * 	
	 * Created date : 11-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function addUser(){
		$query = "INSERT INTO user(
							first_name,
							middle_name,
							last_name,
							username,
							password,
							address,
							phone_number,
							mobile_number,
							type,
							hire_date,
							end_date
						) 
						VALUES (
							'{$this->first_name}',
							'{$this->middle_name}',
							'{$this->last_name}',
							'{$this->username}',
							'{$this->password}',
							'{$this->address}',
							'{$this->phone_number}',
							'{$this->mobile_number}',
							'{$this->type}',
							'{$this->hire_date}',
							'{$this->end_date}'
						);
					";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : deleteUser
	 * 
	 * Description : 
	 * delete the user of the given id from the database.
	 * 
	 * Created date : 11-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function deleteUser(){
		$query = "delete from user
	 			  where id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : modifyUser
	 * 
	 * Description : 
	 * modify the data of the user of the given id.
	 * 
	 * Created date : 11-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function modifyUser(){
		$query = "UPDATE user
				  SET
					first_name = '{$this->first_name}',
					middle_name = '{$this->middle_name}',
					last_name = '{$this->last_name}',
					username = '{$this->username}',
					password = '{$this->password}',
					address = '{$this->address}',
					phone_number = '{$this->phone_number}',
					mobile_number = '{$this->mobile_number}',
					type = '{$this->type}',
					hire_date = '{$this->hire_date}',
					end_date = '{$this->end_date}'
	 			  WHERE id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : getUserById
	 * 
	 * Description : 
	 * Returns the data of the user specified by the given id.
	 * 
	 * Created date : 11-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getUserById(){
		$query = "SELECT * 
				  FROM user
	 			  WHERE id = {$this->id}";
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	
	/**
	 * function name : getAllUsers
	 * 
	 * Description : 
	 * Returns the data of all of the users in the database.
	 * 
	 * Created date : 11-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getAllUsers(){
		$query = "SELECT * 
				  FROM user";
				  
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
	 /**
	 * function name : checkUser
	 * 
	 * Description : 
	 * Checks if the user of the given id exists in the database.
	 * 
	 * Created date : 11-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function checkUser(){
		$query = "SELECT * 
				  FROM user
				  WHERE id = {$this->id}";
				  
		$query = $this->db->query($query);
		
		if(count($query->result_array()) == 0){
			return false;
		}else{
			return true;
		}
	 }
	 
	 /**
	 * function name : getUserByUsernameAndPassword
	 * 
	 * Description : 
	 * Gets the user whose username 
	 * and password are the same as the given ones.
	 * 
	 * Notes : 
	 * When using this function you should use isset() function
	 * on the returned to know if the user exists or not.
	 * 
	 * Created date : 11-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getUserByUsernameAndPassword(){
		$query = "SELECT * 
				  FROM user
				  WHERE username = '{$this->username}'
				  AND password = '{$this->password}'";
				  
		$query = $this->db->query($query);
		$users = $query->result_array();
		if(count($users) == 1)
		return $users[0];
	 }
}