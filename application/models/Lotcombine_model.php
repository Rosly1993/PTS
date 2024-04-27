<?php
class Lotcombine_model extends CI_Model {
   
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->database();
       
    }
    

	public function get_employee_details($idNumber) {
    $this->db->select('serial1, unique1 as id, disposition, model, cavity, quantity');
    $this->db->from('pr_result');
    $this->db->where('serial1', $idNumber);
    $this->db->where('disposition', 'For Lot Combine');
    $query = $this->db->get();
    return $query->row_array();
}

public function add_request($serial1, $id, $disposition, $model, $cavity, $quantity, $controlNumber) {
    // Add your logic to insert the item into the database
    $user = $this->session->userdata('user');
	extract($user);

   $date_add = date('Y-m-d h:i');
   $month_add = date('Y-m-d h:i');
   $formatted_date = date('Y-m', strtotime($month_add));

    $data = array(
        'mfi_serial' => $controlNumber, // Add the control number to the data array
        'disposition' => 'Combined',
        'input_by' => $fullname,
        'input_date' => $date_add,
       
    );
    $this->db->where('serial1', $serial1);
    $this->db->where('disposition', 'For Lot Combine');
    $this->db->update('pr_result', $data);

}
}




?>  
