<?php
class Lotdetails_model extends CI_Model {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->database();
    }

	public function get_lotdetails() {
        $query = $this->db->get('set_lotdetails');
        return $query->result_array();
    }

    public function get_active_lotdetails() {
        // Modify your SQL query to include a WHERE clause to filter by active status
        $query = $this->db->where('is_active', '1')
                          ->get('set_lotdetails');
        
        // Check if query was successful
        if($query) {
            // Return the result set
            return $query->result_array();
        } else {
            // Return an empty array or handle the error as needed
            return array();
        }
    }
	public function add_lotdetails($machine, $model, $mold_no,$tray_size, $cavity, $ingot_no, $created_by) {
        // Add your logic to insert the item into the database

       $date_add = date('Y-m-d h:i');
       $active_now = 1;
       // Concatenate the cavity values with commas
    //    $cavities = implode(',', array_filter([$cavity1, $cavity2, $cavity3, $cavity4]));

        $data = array(
            'machine' => $machine,
            'model' => $model,
            'mold_no' => $mold_no,
            'tray_size' => $tray_size,
            'cavity' => $cavity, // Insert concatenated cavities
            'ingot_no' => $ingot_no,
            // 'cavity2' => $cavity2,
            // 'cavity3' => $cavity3,
            // 'cavity4' => $cavity4,
            'is_active' => $active_now,
            'created_at' => $date_add,
            'created_by' => $created_by

        );
        $this->db->insert('set_lotdetails', $data);
    }
	public function get_molddetails_by_name($machine) {
        // Modify your SQL query to include a WHERE clause to filter by machine name and active status
        $query = $this->db->select('*')
                          ->from('set_lotdetails')
                          ->where('machine', $machine)
                          ->where('is_active', '1')
                          ->get();
        
        // Check if query was successful and if there are any rows returned
        if($query && $query->num_rows() > 0) {
            // Return the result row
            return $query->row_array();
        } else {
            // Return false if no active mold with the given machine name is found
            return false;
        }
    }

     public function get_molddetails_details($id) {
        // Perform a database query to get the current item details based on the ID
        $query = $this->db->get_where('set_molddetails', ['id' => $id]);
        
        // Return the result as an array
        return $query->row_array();
    } 
    public function delete_area() {
        $id = $this->input->post('id');
        $this->db->where('id', $id);
        $this->db->delete('set_areas');
    }

    public function get_mold_numbers_by_model($selectedModel) {
        // Fetch mold numbers from the database based on the selected model
        // Adjust the database query according to your schema
        $this->db->select('mold_no');
        $this->db->where('model', $selectedModel);
        $query = $this->db->get('set_molddetails');
    
        // Process the query result and return mold numbers as an array
        $moldNumbers = array();
        foreach ($query->result() as $row) {
            $moldNumbers[] = $row->mold_no;
        }
        return $moldNumbers;
    }

    public function get_cavities_by_mold_number($selectedMoldNo) {
        // Fetch cavities from the database based on the selected mold number
        // Adjust the database query according to your schema
        $this->db->select('cavity1');
        $this->db->where('mold_no', $selectedMoldNo);
        $query = $this->db->get('set_molddetails');
        
        $cavities = array();
        foreach ($query->result_array() as $row) {
            // Split comma-separated cavities and add them individually to the cavities array
            $cavities = array_merge($cavities, explode(',', $row['cavity1']));
        }
        
        return $cavities;
    }
    public function delete_lotdetails() {
        $id = $this->input->post('id');
        
        // Update the is_active column to 0 instead of deleting the row
        $this->db->where('id', $id);
        $this->db->update('set_lotdetails', array('is_active' => '0'));
    }
    
	
    
}

	

?>  
