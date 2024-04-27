<?php
class Scraps_model extends CI_Model {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->database();
    }

	public function get_prresults() {
    $this->db->select('c.*, b.unique1, b.newareaid, b.newdate, b.newarea, b.newquantity, b.newid');
    $this->db->from('(SELECT
        pr_result.id,
        pr_result.serial1,
        pr_result.model,
        pr_result.mold_no,
        pr_result.cavity,
        pr_result.area_id,
        pr_result.line,
        pr_result.qan_number,
        pr_result.locked_remarks,
        pr_result.locked_details,
        pr_result.locked_by,
        pr_result.input_date,
        pr_result.locked_date,
        pr_result.date_sorted,
        pr_result.sorted_by,
        pr_result.sort_remarks,
        pr_result.disposition,
        pr_result.unique1
        FROM pr_result
        WHERE pr_result.disposition="Scrap" AND pr_result.area_id="1" or  pr_result.disposition="Scrap" AND pr_result.area_id="3" or  pr_result.disposition="Scrap" AND pr_result.area_id="5"
        ) c');
    $this->db->join('(SELECT
        pr_result.serial1,
        pr_result.unique1,
        pr_result.area_id AS newareaid,
        pr_result.id AS newid,
        pr_result.input_date AS newdate,
        (pr_result.quantity - pr_result.quantity_lost) as newquantity,
        set_areas.area AS newarea
        FROM pr_result
        INNER JOIN set_areas ON pr_result.area_id = set_areas.id
        JOIN (SELECT serial1, MAX(id) AS max_id FROM pr_result GROUP BY serial1,unique1) a
        ON pr_result.serial1 = a.serial1 AND pr_result.id = a.max_id) b', 'c.serial1 = b.serial1 AND c.unique1 = b.unique1', 'left');
    $query = $this->db->get();


     return $query->result_array();
    }
   public function get_prresult_details($id) {
    // Perform a database query to get the current item details based on the ID
    $query = $this->db->get_where('pr_result', ['id' => $id]);
    
    // Get the result as an array
    $result = $query->row_array();
    
    // Calculate newquantity
    $newquantity = $result['quantity'] - $result['quantity_lost'];
    
    // Add newquantity to the result array
    $result['newquantity'] = $newquantity;
    
    // Return the modified result array
    return $result;
}

	
public function update_prresults($id, $data) {
    $this->db->where('id', $id);
    $result = $this->db->update('pr_result', $data);
    return $result;
}

	
}
?>  
