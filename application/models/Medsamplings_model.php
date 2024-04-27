<?php
class Medsamplings_model extends CI_Model {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->database();
    }

	public function get_prresults() {
        $this->db->select('*, (quantity - quantity_lost) as newquantity'); // Calculate newquantity
        $this->db->where('area_id', '1');
        $this->db->where('area_status', '1');
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

// public function get_prresult_remarks($id) {
//     // Perform a database query to get the current item details based on the ID
//     $this->db->select('id, quantity,serial1,unique1, quantity_lost, mfi_sorting_remarks'); // Assuming 'remarks' is a column in your table
    
//     $query = $this->db->get_where('pr_result', ['id' => $id]);
//     $result = $query->row_array();



//     return $result;
// }

public function get_prresult_remarks($id) {
    // Perform a database query to join pr_result with pr_remarks based on serial1 and unique1
    $this->db->select('pr_result.id, pr_result.quantity, pr_result.serial1, pr_result.unique1, pr_result.quantity_lost, pr_remarks.remarks, pr_remarks.category, set_areas.area, pr_remarks.input_by, pr_remarks.input_date');
    $this->db->from('pr_result');
    $this->db->join('pr_remarks', 'pr_result.serial1 = pr_remarks.serial AND pr_result.unique1 = pr_remarks.uniques');
    $this->db->join('set_areas', 'pr_remarks.area_id = set_areas.id');
    $this->db->where('pr_result.id', $id);
    $query = $this->db->get();
    
    // Check if any rows are returned
    if ($query->num_rows() > 0) {
        // Fetch the result as an array of associative arrays
        $result = $query->result_array();
        return $result;
    } else {
        // Return null if no data is found
        return null;
    }
}

// history remarks
public function get_prhistory_remarks($id) {
    // Perform a database query to join pr_result with pr_remarks based on serial1 and unique1
    $this->db->select('pr_history.id, pr_history.quantity, pr_history.serial, pr_history.unique,pr_remarks.remarks, pr_remarks.category, set_areas.area, pr_remarks.input_by, pr_remarks.input_date');
    $this->db->from('pr_history');
    $this->db->join('pr_remarks', 'pr_history.serial = pr_remarks.serial AND pr_history.unique = pr_remarks.uniques');
    $this->db->join('set_areas', 'pr_remarks.area_id = set_areas.id');
    $this->db->where('pr_history.id', $id);
    $query = $this->db->get();
    
    // Check if any rows are returned
    if ($query->num_rows() > 0) {
        // Fetch the result as an array of associative arrays
        $result = $query->result_array();
        return $result;
    } else {
        // Return null if no data is found
        return null;
    }
}




// history details
public function get_prhistory($id) {
    // Perform a database query to join pr_result with pr_remarks based on serial1 and unique1
    $this->db->select('*');
    $this->db->from('pr_history');
    // $this->db->join('pr_remarks', 'pr_history.serial = pr_remarks.serial AND pr_history.unique = pr_remarks.uniques');
    // $this->db->join('set_areas', 'pr_remarks.area_id = set_areas.id');
    $this->db->where('pr_history.id', $id);
    $query = $this->db->get();
    
    // Check if any rows are returned
    if ($query->num_rows() > 0) {
        // Fetch the result as an array of associative arrays
        $result = $query->result_array();
        return $result;
    } else {
        // Return null if no data is found
        return null;
    }
}

	
public function update_prresults($id, $data) {
    $this->db->where('id', $id);
    $result = $this->db->update('pr_result', $data);
    return $result;
}

	
}
?>  
