<?php if (!defined("BASEPATH")) exit("No direct script access allowed");

/**
 * Class name : Classification_record
 * 
 * Description :
 * This class contains functions to deal with the classification record table (Add , Edit , Delete)
 * 
 * Created date ; 14-2-2014
 * Modification date : ---
 * Modfication reason : ---
 * Author : Ahmad Mulhem Barakat
 * contact : molham225@gmail.com
 */    

class Classification_record_model extends CI_Model{
	/** Count record class variables **/
	
	//The id field of the classification record
	var $id;
	
	//The date of the current record’s info.
	var $date = "";
	
	//The time of the current record’s info.
	var $time = "";
	
	//The classification time step. It’s measured by days.
	var $classification_step = "";
	
	//An array of axle record objects.
	var axle_records = array();
	
	//An array of speed record objects.
	var speed_records = array();
	
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
	 * function name : addClassificationRecord
	 * 
	 * Description : 
	 * Add new classification record to the database.
	 * 
	 * parameters:
	 * 	
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function addClassificationRecord(){
		$query = "INSERT INTO classification_record(
							date,
							time,
							classification_step
						) 
						VALUES (
							'{$this->date}',
							'{$this->time}',
							'{$this->classification_step}'
						);
					";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : deleteClassificationRecord
	 * 
	 * Description : 
	 * delete the classification record of the given id from the database.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function deleteClassificationRecord(){
		$query = "delete from classification_record
	 			  where id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : modifyClassificationRecord
	 * 
	 * Description : 
	 * modify the data of the classification record of the given id.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function modifyClassificationRecord(){
		$query = "UPDATE classification_record
				  SET
					date = '{$this->date}',
					time = '{$this->time}',
					classification_step = '{$this->classification_step}'						
	 			  WHERE id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : getClassificationReocrdById
	 * 
	 * Description : 
	 * Returns the data of the classification record specified by the given id.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getClassificationRecordById(){
		$query = "SELECT * 
				  FROM classification_record
	 			  WHERE id = {$this->id}";
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	
	/**
	 * function name : getAllClassificationReocrds
	 * 
	 * Description : 
	 * Returns the data of all of the classification records in the database.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getAllClassificationReocrds(){
		$query = "SELECT * 
				  FROM classification_record";
				  
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
	 
	 /**
	 * function name : getClassificationReocrdsBetweenDates
	 * 
	 * Description : 
	 * Returns the data of the classification record whose dates are 
	 * between the given start and end dates.
	 * 
	 * Parameters:
	 * start_date(Type: date)
	 * end_date(Type: date)
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getClassificationReocrdsBetweenDates($start_date,$end_date){
		$query = "SELECT * 
				  FROM classification_record
	 			  WHERE date >= {$start_date} 
					AND date <= {$end_date}   ";
		$query = $this->db->query($query);
		return $query->result_array();
	 }
}
