<?php
class Sublotcombine_model extends CI_Model {
   
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->database();
       
    }
    

	public function get_employee_details($idNumber) {
    $this->db->select('model, id, cavity, sum(quantity) as quantity, lot_serial, sublot_serial');
    $this->db->from('tbl_serial_printing');
    $this->db->where('sublot_serial', $idNumber);
    $this->db->where('mother_serial', Null);
    $this->db->group_by('sublot_serial');
    $query = $this->db->get();
    return $query->row_array();
}

public function add_request($serial1, $id,  $model, $cavity, $quantity, $controlNumber) {
    // Add your logic to insert the item into the database
    $user = $this->session->userdata('user');
	extract($user);

   $date_add = date('Y-m-d h:i');
   $month_add = date('Y-m-d h:i');
   $formatted_date = date('Y-m', strtotime($month_add));

    $data = array(
        'mother_serial' => $controlNumber, // Add the control number to the data array
        // 'disposition' => 'Combined',
        'combine_motherlot' => $fullname,
        'date_add_motherlot' => $date_add,
       
    );
    $this->db->where('sublot_serial', $serial1);
    $this->db->update('tbl_serial_printing', $data);

}
}




?>  
