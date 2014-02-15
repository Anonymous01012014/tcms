<?php if (!defined("BASEPATH")) exit("No direct script access allowed");

/**
 * Class name : Binary file
 * 
 * Description :
 * This class contains functions to deal with the binary_file table (Add , Edit , Delete)
 * 
 * Created date ; 12-2-2014
 * Modification date : ---
 * Modfication reason : ---
 * Author : Ahmad Mulhem Barakat
 * contact : molham225@gmail.com
 */    

class Binary_file_model extends CI_Model{
	/** Binary file class variables **/
	
	//The name of the binary file on the server.
	var $name;
	
	//The date of uploading this file to the server.
	var $upload_date = "";
	
	//The time of uploading this file to the server. 
	var $upload_time = "";
	
	//the location of this file on the server.
	/** 
	 * Note: 
	 * If this field was empty for a file it means 
	 * that this file is deleted.
	 **/
	var $location = "";
	
	//The id of the counter from which this file was taken.
	var $counter_id = "";
	
	//The id of the case for which this file is.
	var $case_id = "";
	
	
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
	 * function name : addBinaryFile
	 * 
	 * Description : 
	 * add new binary file to the database.
	 * 
	 * parameters:
	 * 	
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function addBinaryFile(){
		$query = "INSERT INTO binary_file(
							name,
							upload_date,
							upload_time,
							location,
							counter_id,
							case_id
						) 
						VALUES (
							'{$this->name}',
							'{$this->upload_date}',
							'{$this->upload_time}',
							'{$this->location}',
							'{$this->counter_id}',
							'{$this->case_id}'
						);
					";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : deleteBinaryFile
	 * 
	 * Description : 
	 * delete the binary file of the given id from the database.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function deleteBinaryFile(){
		$query = "delete from binary_file
	 			  where id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : modifyBinaryFile
	 * 
	 * Description : 
	 * modify the data of the binary file of the given id.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function modifyBinaryFile(){
		$query = "UPDATE binary_file
				  SET
					name = '{$this->name}',
					upload_date = '{$this->upload_date}',
					upload_time = '{$this->upload_time}',
					location = '{$this->location}',
					counter_id = '{$this->counter_id}',
					case_id = '{$this->case_id}'					
	 			  WHERE id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : getBinaryFileById
	 * 
	 * Description : 
	 * Returns the data of the binary file specified by the given id.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getBinaryFileById(){
		$query = "SELECT * 
				  FROM binary_file
	 			  WHERE id = {$this->id}";
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	
	/**
	 * function name : getAllBinaryFiles
	 * 
	 * Description : 
	 * Returns the data of all of the binary files in the database.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getAllBinaryFiles(){
		$query = "SELECT * 
				  FROM binary_file";
				  
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
	 /**
	 * function name : getAllNotDeletedBinaryFiles
	 * 
	 * Description : 
	 * Returns the data of all of the not deleted binary files 
	 * in the database.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getAllNotDeletedBinaryFiles(){
		$query = "SELECT * 
				  FROM binary_file
				  WHERE location LIKE ''";
				  
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
	 /**
	 * function name : getBinaryFileByCaseId
	 * 
	 * Description : 
	 * Gets the binary file of the given case.
	 * 
	 * Created date : 12-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getBinaryFileByCaseId(){
		$query = "SELECT * 
				  FROM binary_file
				  WHERE case_id = {$this->case_id}";
				  
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
}
