<?php if (!defined("BASEPATH")) exit("No direct script access allowed");

/**
 * Class name : Vehicle_axle_spasing
 * 
 * Description :
 * This class contains functions to deal with the vehicle axle spacing table (Add , Edit , Delete)
 * 
 * Created date ; 14-2-2014
 * Modification date : ---
 * Modfication reason : ---
 * Author : Ahmad Mulhem Barakat
 * contact : molham225@gmail.com
 */    

class Vehicle_axle_spacing_model extends CI_Model{
	/** Vehicle axle spacing class variables **/
	
	//The id field of the vehicle axle spacing
	var $id;
	
	//The spacing between two axles of car in cm.
	var $spacing = "";
	
	//The id of the per vehicle record of this vehicle axle spacing.
	var $per_vehicle_record_id = "";
	
	
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
	 * function name : addVehicleAxleSpacing
	 * 
	 * Description : 
	 * add new vehicle axle spacing to the database.
	 * 
	 * parameters:
	 * 	
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function addVehicleAxleSpacing(){
		$query = "INSERT INTO vehicle_axle_spacing(
							spacing,
							per_vehicle_record_id
						) 
						VALUES (
							'{$this->spacing}',
							'{$this->per_vehicle_record_id}'
						);
					";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : deleteVehicleAxleSpacing
	 * 
	 * Description : 
	 * delete the vehicle axle spacing of the given id from the database.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function deleteVehicleAxleSpacing(){
		$query = "delete from vehicle_axle_spacing
	 			  where id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : modifyVehicleAxleSpacing
	 * 
	 * Description : 
	 * modify the data of the vehicle axle spacing of the given id.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function modifyVehicleAxleSpacing(){
		$query = "UPDATE vehicle_axle_spacing
				  SET
					spacing = '{$this->spacing}',
					per_vehicle_record_id = '{$this->per_vehicle_record_id}'
	 			  WHERE id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : getVehicleAxleSpacingById
	 * 
	 * Description : 
	 * Returns the data of the vehicle axle spacing specified by the given id.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getVehicleAxleSpacingById(){
		$query = "SELECT * 
				  FROM vehicle_axle_spacing
	 			  WHERE id = {$this->id}";
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	
	/**
	 * function name : getAllVehicleAxleSpacings
	 * 
	 * Description : 
	 * Returns the data of all of the vehicle axle spacings in the database.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getAllVehicleAxleSpacings(){
		$query = "SELECT * 
				  FROM vehicle_axle_spacing";
				  
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
	 
	 /**
	 * function name : getVehicleAxleSpacingByPerVehicleRecordId
	 * 
	 * Description : 
	 * Returns the data of the vehicle axle spacing specified 
	 * by the given per vehicle record.
	 * 
	 * Created date : 14-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getVehicleAxleSpacingByPerVehicleRecordId(){
		$query = "SELECT * 
				  FROM vehicle_axle_spacing
	 			  WHERE per_vehicle_record_id = {$this->per_vehicle_record_id}";
		$query = $this->db->query($query);
		return $query->result_array();
	 }
}
