<?php if (!defined("BASEPATH")) exit("No direct script access allowed");

/**
 * Class name : Per_vehicle_record
 * 
 * Description :
 * This class contains functions to deal with the per vehicle record table (Add , Edit , Delete)
 * 
 * Created date ; 14-2-2014
 * Modification date : ---
 * Modfication reason : ---
 * Author : Ahmad Mulhem Barakat
 * contact : molham225@gmail.com
 */    

class Per_vehicle_record_model extends CI_Model{
	/** Per vehicle record class variables **/
	
	//The id field of the per vehicle record
	var $id;
	
	//The date of the current record’s info.
	var $date = "";
	
	//The time of the current record’s info.
	var $time = "";
	
	//The speed of the car in the tenth of a KPH.
	var $speed = "";
	
	//Num of axles in the car.
	var $axles = "";
	
	//The total sum of all axle spacings of this car.
	var $total_number = "";
	
	//Array of vehicle axle spacings.
	//Each field of it is a Vehicle_axle_spacing object.
	var $vehicle_axle_spacings= array();
	
	//The id of the statistics record of this record.
	var $statistics_record_id = "";
	
	//The id of the axle record generated from this record.
	var $axle_record_id = "";
	
	//The id of the speed record generated from this record.
	var $speed_record_id = "";
	
	//The id of the classification record generated from this record.
	var $classification_record_id = "";
	
	//The id of the lane recod of this record.
	var $lane_record = "";
	
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
	 * function name : addPerVehicleRecord
	 * 
	 * Description : 
	 * add new per vehicle record to the database.
	 * 
	 * parameters:
	 * 	
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function addPerVehicleRecord(){
		$query = "INSERT INTO per_vehicle_record(
							date,
							time,
							speed,
							axles,
							total_number,
							statistics_record_id,
							axle_record_id,
							speed_record_id,
							classification_record_id,
							lane_id
						) 
						VALUES (
							'{$this->date}',
							'{$this->time}',
							'{$this->speed}',
							'{$this->axles}',
							'{$this->total_number}',
							'{$this->statistics_record_id}',
							'{$this->axle_record_id}',
							'{$this->speed_record_id}',
							'{$this->classification_record_id}',
							'{$this->lane_id}'
						);
					";
		$this->db->query($query);
		
		//return the latest added count record's id
		$query = "select max(id) as per_vehicle_record_id from per_vehicle_record;";
									
		$query = $this->db->query($query);
		
		return $query->result_array();
	 }
	 
	 
	 /**
	 * function name : addMultiRecords
	 * 
	 * Description : 
	 * add an array of per vehicle records and inserts them in the data base 
	 * and returns the first and last inserted ids
	 * 
	 * parameters:
	 * per vehicle record array: the array of per vehicle records to be added to database.
	 * 	
	 * Created date : 26-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function addMultiRecords($per_vehicle_record_array){
		//array that has first and last added ids
		$ids = array(0,0);
		//get the latest added per vehicle record's id to know the id of the first inserted record
		$query = "select max(id) as per_vehicle_record_id from per_vehicle_record;";
									
		$query = $this->db->query($query);
		$id = $query->result_array();
		if($id[0]['per_vehicle_record_id'] !== 0)
		$ids[0] = $id[0]['per_vehicle_record_id'] + 1;
		
		$this->db->insert_batch('per_vehicle_record',$per_vehicle_record_array);
		//get the latest added per vehicle record's id
		$query = "select max(id) as per_vehicle_record_id from per_vehicle_record;";
		$query = $this->db->query($query);
		$id = $query->result_array();
		$ids[1] = $id[0]['per_vehicle_record_id'];
		return $ids;
	 }
	 
	 
	 /**
	 * function name : deletePerVehicleRecord
	 * 
	 * Description : 
	 * delete the per vehicle record of the given id from the database.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function deletePerVehicleRecord(){
		$query = "delete from per_vehicle_record
	 			  where id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : modifyPerVehicleRecord
	 * 
	 * Description : 
	 * modify the data of the per vehicle record of the given id.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function modifyPerVehicleRecord(){
		$query = "UPDATE per_vehicle_record
				  SET
					date = '{$this->date}',
					time = '{$this->time}',
					speed = '{$this->speed}',
					axles = '{$this->axles}',
					total_number = '{$this->total_number}',
					statistics_record_id = '{$this->statistics_record_id}',
					axle_record_id = '{$this->axle_record_id}',
					speed_record_id = '{$this->speed_record_id}',
					classification_record_id = '{$this->classification_record_id}',
					lane_id = '{$this->lane_id}'					
	 			  WHERE id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : getPerVehicleReocrdById
	 * 
	 * Description : 
	 * Returns the data of the per vehicle record specified by the given id.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getPerVehicleRecordById(){
		$query = "SELECT * 
				  FROM per_vehicle_record
	 			  WHERE id = {$this->id}";
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	
	/**
	 * function name : getAllPerVehicleRecords
	 * 
	 * Description : 
	 * Returns the data of all of the per vehicle records in the database.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getAllPerVehicleRecords(){
		$query = "SELECT * 
				  FROM per_vehcle_record";
				  
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
	 
	 /**
	 * function name : getPerVehicleReocrdByLaneId
	 * 
	 * Description : 
	 * Returns the data of the per vehicle record specified by the given lane.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getPerVehicleRecordByLaneId(){
		$query = "SELECT * 
				  FROM per_vehicle_record
	 			  WHERE lane_id = {$this->lane_id}";
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
	 
	 /**
	 * function name : getPerVehicleReocrdByClassificationRecordId
	 * 
	 * Description : 
	 * Returns the data of the per vehicle record specified by the 
	 * given classification record.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getPerVehicleReocrdByClassificationRecordId(){
		$query = "SELECT * 
				  FROM per_vehicle_record
	 			  WHERE classification_record_id = {$this->classification_record_id}";
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
	 
	 /**
	 * function name : getPerVehicleReocrdBySpeedRecordId
	 * 
	 * Description : 
	 * Returns the data of the per vehicle record specified by the 
	 * given speed record.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getPerVehicleReocrdBySpeedRecordId(){
		$query = "SELECT * 
				  FROM per_vehicle_record
	 			  WHERE speed_record_id = {$this->speed_record_id}";
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
	 
	 /**
	 * function name : getPerVehicleReocrdByAxleRecordId
	 * 
	 * Description : 
	 * Returns the data of the per vehicle record specified by the 
	 * given axle record.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getPerVehicleReocrdByAxleRecordId(){
		$query = "SELECT * 
				  FROM per_vehicle_record
	 			  WHERE axle_record_id = {$this->axle_record_id}";
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
	 
	 /**
	 * function name : getPerVehicleReocrdsBetweenDates
	 * 
	 * Description : 
	 * Returns the data of the per vehicle records whose dates are 
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
	 public function getPerVehicleReocrdsBetweenDates($start_date,$end_date){
		$query = "SELECT * 
				  FROM per_vehicle_record
	 			  WHERE date >= {$start_date} 
					AND date <= {$end_date}   ";
		$query = $this->db->query($query);
		return $query->result_array();
	 }
}
