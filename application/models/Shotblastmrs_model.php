<?php
class Shotblastmrs_model extends CI_Model {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->database();

        
    }

	public function get_prresults() {
    $this->db->select('c.*');
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
    (pr_result.quantity - pr_result.quantity_lost) as actual,
    pr_result.locked_date,
    pr_result.unique1
    FROM pr_result
    WHERE pr_result.disposition="NG" AND pr_result.area_id="3") c');
    
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
