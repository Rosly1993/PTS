<?php
class Shotblastunlocks_model extends CI_Model {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->database();
    }

	public function get_prresults() {
        $this->db->select('*, (quantity - quantity_lost) as newquantity');
        $this->db->from('pr_result');
        $this->db->where('area_id', '3');
        // $this->db->where('area_status', '1');
        // $this->db->where('input_by IS NOT NULL');
        $this->db->group_start();
        // $this->db->where('disposition IS NULL');
        $this->db->where('disposition', 'For Verify');
        // $this->db->or_where('disposition', 'OK');
        $this->db->group_end();
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


public function accept_lot() {
    $user = $this->session->userdata('user');
    extract($user);
    $fullname = $fullname;
    $outputdate = date('Y-m-d H:i:s');
    $id = $this->input->post('id');
    $this->db->where('id', $id);
    $this->db->update('pr_result', array('disposition' => 'OK', 'unlocked_date' => $outputdate, 'unlocked_by' => $fullname,'unlocked_remarks' => 'Lot Accepted', 'area_status' => 0 , 'lot_status' => 0 , 'locked' => 0));

    $query = $this->db->get_where('pr_result', ['id' => $id]);
    
    // Get the result as an array
    $result = $query->row_array();
    $serial1 = $result['serial1'];
    $unique1 = $result['unique1'];
    $model = $result['model'];
    $cavity = $result['cavity'];
    $mold_no = $result['mold_no'];
    $ingot_lot = $result['ingot_lot'];
    $tray_size = $result['tray_size'];
    $tray_no = $result['tray_no'];
    $debplan = $result['debplan'];
    $quantity = $result['quantity'];
    $quantity_lost = $result['quantity_lost'];
    $newquantity= $quantity-$quantity_lost;


     //query to get the next procees/ area_id for Shotblast is 3
     $query_getarea = $this->db->get_where('set_process', ['model' => $model, 'area_id' => 3]);
    
     // Get the result as an array
     $result_area = $query_getarea->row_array();
     $next_area = $result_area['next_id'];
    // Insert data to pr result
    $data = array(
       
        'disposition' => 'OK'
        
    );
    $this->db->where('serial1', $serial1);
    $this->db->where('unique1', $unique1);
    $this->db->where('area_id', $next_area);
    $this->db->update('pr_result', $data);

    $update_history = array(
        'shotblastqa_unlock_by' => $fullname,
        'shotblastqa_unlock_date' => $outputdate
    );

    $this->db->where('serial', $serial1);
    $this->db->where('unique', $unique1);
    $this->db->update('pr_history', $update_history);

    // Update sort_remarks
    $data_pr_remarks = array(
        'serial' => $serial1,
        'input_date' => $outputdate,
        'input_by' => $fullname,
        'is_active' => 1,
        'category' => 'Shotblast QA',
        'remarks' => 'Lot Accepted',
        'uniques' => $unique1
    );
    $this->db->insert('pr_remarks', $data_pr_remarks); 

    return $result;
}
}

?>  
