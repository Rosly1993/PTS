<?php
class Setprocess_model extends CI_Model {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->database();
    }

	public function get_setprocess() {
        $this->db->select('sp.id, sp.model, sp.area_id, 
        sa.area AS current_area, 
        next_area.area AS next_area, 
        prev_area.area AS prev_area, 
        sp.is_sampling, 
        sp.created_by, 
        sp.created_at');
        $this->db->from('set_process AS sp');
        $this->db->join('set_areas AS sa', 'sp.area_id = sa.id', 'left');
        $this->db->join('set_areas AS next_area', 'sp.next_id = next_area.id', 'left');
        $this->db->join('set_areas AS prev_area', 'sp.previous_id = prev_area.id', 'left');
        $query = $this->db->get();

        return $query->result_array();
    }
    
 
	public function add_area($model, $area, $previous_id, $next_id, $is_sampling) {
        // Add your logic to insert the item into the database
       $user = $this->session->userdata('user');
       extract($user);
       $date_add = date('Y-m-d h:i');
       $active_now = 1;

        $data = array(
            'model' => $model,
            'area_id' => $area,
            'previous_id' => $previous_id,
            'next_id' => $next_id,
            'is_sampling' => $is_sampling,
            'is_active' => $active_now,
            'created_at' => $date_add,
            'created_by' => $fullname

        );
        $this->db->insert('set_process', $data);
    }
	public function get_area_by_name($area,$model) {
		$query = $this->db->get_where('set_process', array('model' => $model, 'area_id' => $area));
		// $this->db->where('area', $area_name);
		
		return $query->row_array(); // Assuming you expect only one row for a given area name
	}

     public function get_area_details($id) {
        // Perform a database query to get the current item details based on the ID
        $query = $this->db->get_where('set_areas', ['id' => $id]);
        
        // Return the result as an array
        return $query->row_array();
    } 
    public function delete_area() {
        $id = $this->input->post('id');
        $this->db->where('id', $id);
        $this->db->delete('set_areas');
    }
	
}
?>  
