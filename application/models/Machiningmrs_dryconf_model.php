<?php
class Machiningmrs_dryconf_model extends CI_Model {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->database();
    }

	public function get_prresults($line = null) {
        $this->db->select('*, (quantity - quantity_lost) as newquantity'); // Calculate newquantity
        $this->db->where('area_id', '5');
        // $this->db->where('area_status', '1');
        $this->db->where('disposition_ipqc', 'For Confirm MRS DRY'); // Correct usage for checking NOT NULL condition

        if ($line) {
            // $query->where('line', $line); // Apply filter for selected line
            $this->db->where('line', $line);
        }
    
        $query = $this->db->get('pr_result');
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
