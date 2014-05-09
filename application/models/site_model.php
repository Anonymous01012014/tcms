<?php if (!defined("BASEPATH")) exit("No direct script access allowed");

/**
 * Class name : Site
 * 
 * Description :
 * This class contains functions to deal with the site table (Add , Edit , Delete)
 * 
 * Created date ; 11-2-2014
 * Modification date : ---
 * Modfication reason : ---
 * Author : Ahmad Mulhem Barakat
 * contact : molham225@gmail.com
 */    

class Site_model extends CI_Model{
	/** Site class variables **/
	
	//The id field of the site
	var $id;
	
	//The name of the site
	var $name = "";
	
	//the FIPS of the site 
	var $FIPS = "";
	
	//the county of the site 
	var $county = "";
	
	//the latitude of the site's location.
	var $latitude = "";
	
	//te longitude of the site's location.
	var $longitude = "";
	
	//The start date of the site.
	var $start_date = "";
	
	//The end date of the site.
	var $end_date = "";
	
	//The aexact address of the site.
	var $address = "";
	
	//The functional classification code of this site.
	var $functional_class = "";
	
	//The count of lanes in this site.
	var $lane_count = "";

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
	 * add new site to the database.
	 * 
	 * parameters:
	 * 	
	 * Created date : 11-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function addSite(){
		$query = "INSERT INTO site(
							name,
							FIPS,
							county,
							latitude,
							longitude,
							start_date,
							end_date,
							address,
							functional_class,
							lane_count
						) 
						VALUES (
							'{$this->name}',
							'{$this->FIPS}',
							'{$this->county}',
							'{$this->latitude}',
							'{$this->longitude}',
							'{$this->start_date}',
							'{$this->end_date}',
							'{$this->address}',
							'{$this->functional_class}',
							'{$this->lane_count}'
						);
					";
		
		$this->db->query($query);
		
		
		//return the latest added site
		$query = "select max(id) as site_id from site;";
									
		$query = $this->db->query($query);
		
		return $query->result_array();
		
		
		
	 }
	 
	 /**
	 * function name : deleteSite
	 * 
	 * Description : 
	 * delete the site of the given id from the database.
	 * 
	 * Created date : 11-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function deleteSite(){
		$query = "delete from site
	 			  where id = {$this->id}";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : modifySite
	 * 
	 * Description : 
	 * modify the data of the site specified by the given id.
	 * 
	 * Created date : 11-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function modifySite(){
		$query = "UPDATE site
				  SET 
					name = '{$this->name}',
					FIPS = '{$this->FIPS}',
					county = '{$this->county}',
					latitude = '{$this->latitude}',
					longitude = '{$this->longitude}',
					start_date = '{$this->start_date}',
					end_date = '{$this->end_date}',
					address = '{$this->address}',
					functional_class = '{$this->functional_class}',
					lane_count = '{$this->lane_count}'
				   WHERE id = {$this->id};
					";
		$this->db->query($query);
		return true;
	 }
	 
	 /**
	 * function name : getSiteById
	 * 
	 * Description : 
	 * Returns the data of the site specified by the given id.
	 * 
	 * Created date : 11-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getSiteById(){
		$query = "SELECT * 
				  FROM site
	 			  WHERE id = {$this->id}
	 			  AND end_date = '000000'";
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	
	/**
	 * function name : getSiteByName
	 * 
	 * Description : 
	 * Returns the data of the site specified by the given name.
	 * 
	 * Created date : 24-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getSiteByName(){
		$query = "SELECT * 
				  FROM site
	 			  WHERE name like '{$this->name}'
	 			  AND end_date = '000000'";
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	
	
	/**
	 * function name : getSiteByNameStateCounty
	 * 
	 * Description : 
	 * get site by its name state and county
	 * 
	 * Created date : 25-4-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Mohanad Kaleia
	 * contact : ms.kaleia@gmail.com
	 */
	 public function getSiteByNameStateCounty()
	 {
		$query = "SELECT * 
				  FROM site
	 			  WHERE 
	 			  name = '{$this->name}' 	 and
	 			  fips = '{$this->FIPS}' 	 and
	 			  county = '{$this->county}' and	 			  
	 			  end_date = '000000'";
				  
		echo $query;		  
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	
	/**
	 * function name : getAllSites
	 * 
	 * Description : 
	 * Returns the data of all of the sites in the database.
	 * 
	 * Created date : 11-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getAllSites(){
		$query = "SELECT * 
				  FROM site";
				  
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
	 
	 /**
	 * function name : getAllEndedSites
	 * 
	 * Description : 
	 * Returns the data of all of the ended sites in the database.
	 * 
	 * Note:
	 * The site is considered as ended if the end_date 
	 * field in the database is not empty.
	 * 
	 * Created date : 11-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getAllEndedSites(){
		$query = "SELECT * 
				  FROM site
				  WHERE NOT end_date = '000000'";
				  
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
	 
	 /**
	 * function name : getAllActiveSites
	 * 
	 * Description : 
	 * Returns the data of all of the active sites in the database.
	 * 
	 * Note:
	 * The site is considered as active if it wasn't ended.
	 * 
	 * Created date : 11-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getAllActiveSites(){
		$query = "SELECT * 
				  FROM site
				  WHERE end_date = '000000'
				  ORDER BY id DESC";
				  
		$query = $this->db->query($query);
		return $query->result_array();
	 }
	 
	 
	 /**
	 * function name : endSite
	 * 
	 * Description : 
	 * sets the end date of the site specified by the given 
	 * id to the given date (usually the current date).
	 * 
	 * Note:
	 * The site is considered as active if it wasn't ended.
	 * 
	 * Created date : 11-2-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function endSite(){
		$query = "UPDATE site
				  SET end_date = CURDATE()
				  WHERE id = {$this->id}";
				  
		$query = $this->db->query($query);
	 }
	 

	/**
	 * function name : getOpenedSites
	 * 
	 * Description : 
	 * gets the sites with opened cases in the the database
	 * 
	 * Note:
	 * The site is considered as active if it wasn't ended.
	 * 
	 * Created date : 21-3-2014
	 * Modification date : ---
	 * Modfication reason : ---
	 * Author : Ahmad Mulhem Barakat
	 * contact : molham225@gmail.com
	 */
	 public function getOpenedSites(){
		$query = "SELECT
					site.id AS site_id,
					`case`.id AS case_id
				  FROM
					site ,`case`
				  WHERE
					site.id = `case`.site_id AND
					`case`.`status` = 0 
					AND site.end_date = '000000'";
				  
		$query = $this->db->query($query);
		return $query->result_array();
	 }
}
