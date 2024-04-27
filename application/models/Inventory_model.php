<?php
class Inventory_model extends CI_Model {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->database();
    }

	public function get_prresults() {
        $this->db->select('pr_result.area_id, set_areas.area, pr_result.model, SUM(pr_result.quantity - pr_result.quantity_lost) AS actual_qty');
        $this->db->from('pr_result'); // Specify the main table
        $this->db->join('set_areas', 'pr_result.area_id = set_areas.id', 'left'); // LEFT JOIN with set_areas
        $this->db->where('pr_result.area_status', '1'); // Filter by area_status
        $this->db->group_by(['pr_result.model', 'pr_result.area_id']); // Grouping by model and area_id
        $query = $this->db->get(); // Execute the query
        return $query->result_array(); // Return the result as an array

    }
   

	
}
?>  
