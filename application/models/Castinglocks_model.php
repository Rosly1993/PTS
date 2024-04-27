<?php
class Castinglocks_model extends CI_Model {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->database();
    }

	public function get_castinglocks($where = array()) {
        // Construct where conditions based on provided filters
        $this->db->select('t1.*, t3.area_id AS current_area, t4.area as now');
        $this->db->from('pr_result t1');
        $this->db->join('(SELECT serial1, unique1, MAX(id) AS max_id FROM pr_result GROUP BY serial1, unique1) t2', 't1.serial1 = t2.serial1 AND t1.unique1 = t2.unique1 AND t1.id = t2.max_id', 'left');
        $this->db->join('pr_result t3', 't1.serial1 = t3.serial1 AND t1.unique1 = t3.unique1 AND t3.area_id = (SELECT area_id FROM pr_result WHERE serial1 = t1.serial1 AND unique1 = t1.unique1 ORDER BY id DESC LIMIT 1)', 'left');
        $this->db->join('set_areas t4', 't3.area_id = t4.id', 'left');
    
        // Apply where conditions if provided
        if (!empty($where)) {
            $this->db->where($where);
        }
    
        // Add condition for locked column not equal to '1' to the main table (t1)
        $this->db->where('(t1.locked != 1 OR t1.locked IS NULL)');
        $this->db->where('(t1.disposition !="Scrap" or t1.disposition IS NULL)');
    
        // Fetch filtered data from the model
        $query = $this->db->get();
        return $query->result_array();
    }
    
    
    
    
    
	public function add_model($modelName, $created_by) {
        // Add your logic to insert the item into the database

       $date_add = date('Y-m-d h:i');
       $active_now = 1;

        $data = array(
            'model' => $modelName,
            'is_active' => $active_now,
            'created_at' => $date_add,
            'created_by' => $created_by

        );
        $this->db->insert('set_models', $data);
    }
	public function get_model_by_name($modelName) {
		$this->db->where('model', $modelName);
		$query = $this->db->get('set_models');
		return $query->row_array(); // Assuming you expect only one row for a given area name
	}

     public function get_model_details($id) {
        // Perform a database query to get the current item details based on the ID
        $query = $this->db->get_where('set_models', ['id' => $id]);
        
        // Return the result as an array
        return $query->row_array();
    } 
    public function delete_model() {
        $id = $this->input->post('id');
        $this->db->where('id', $id);
        $this->db->delete('set_models');
    }
	
}
?>  
