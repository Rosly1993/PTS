<?php
class Lotsorting_model extends CI_Model {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->database();
    }

	public function get_areas() {
       

      
          // Start building the query with select
          $this->db->select('
          pr_result.id,
          pr_result.model,
          pr_result.model,
          pr_result.input_by,
          pr_result.input_date,
          pr_result.cavity,
          pr_result.mfi_ogi_remarks,
          pr_result.mfi_serial
      ');

        $this->db->from('pr_result');
        $this->db->where('disposition', 'Rejected');
        $this->db->where('area_id', '20');
        // Group by control_number
        $this->db->group_by('pr_result.mfi_serial');

        $query = $this->db->get();
    
        // Return the result as an array
        return $query->result_array();
    }

	public function get_area_by_name($area_name,$location) {
		// $this->db->where('area', $area_name);
        $query = $this->db->get_where('set_areas', array('area' => $area_name, 'location' => $location));
		// $query = $this->db->get('set_areas');
		return $query->row_array(); // Assuming you expect only one row for a given area name
	}

     public function get_area_details($id) {
        // Perform a database query to get the current item details based on the ID
        $query = $this->db->get_where('pr_result', ['id' => $id]);
        
        // Return the result as an array
        return $query->row_array();
    } 
    public function get_area_details_by_control_number($control_number) {
        // Perform a database query to get the area details based on the control number
        $query = $this->db->get_where('pr_result', ['mfi_serial' => $control_number, 'disposition' => 'Rejected']);
        
        // Return the result as an array
        return $query->result_array();
    }

    public function update_status($id, $status, $remarks, $date_add, $fullname,  $disposition) {

        $remarks_sorted = 'Sorted By:'.$fullname.'-'. $remarks;
       
        $this->db->where('id', $id);
        $this->db->update('pr_result', array('disposition' => $disposition, 'mfi_sorting_remarks' =>$remarks_sorted,  'quantity_lost' => $status));
    }
    
   
}
?>  
