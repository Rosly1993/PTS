<?php
class Annealingouts_model extends CI_Model {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->database();
    }

	public function get_castinglocks() {
        // Construct where conditions based on provided filters
        $this->db->select('a.*, b.disposition');
        $this->db->from('(SELECT 
        pr_result.id, 
        pr_result.serial1,
        pr_result.area_id,
        pr_result.area_status,
        pr_result.lot_status,
        pr_result.unique1,
        pr_result.model,
        pr_result.mold_no,
        set_models.annealing_baking,
        pr_result.cavity,
        (pr_result.quantity - pr_result.quantity_lost) AS quantity,
        TIMESTAMPDIFF(MINUTE, pr_result.input_date, NOW()) AS hours_difference,
        pr_result.line,
        pr_result.input_date,
        pr_result.input_by
    FROM 
        pr_result 
            inner join set_models on pr_result.model = set_models.model
    WHERE 
        pr_result.area_id = "4" 
        AND pr_result.area_status = "1" 
        AND pr_result.lot_status = "1") a');
        $this->db->join('(SELECT serial1, unique1, MAX(id) AS max_id, disposition FROM pr_result WHERE area_id = "1" GROUP BY serial1, unique1) b', 'a.serial1 = b.serial1 AND a.unique1 = b.unique1', 'left');   
        // Get filter parameters from the GET request
        $line = $this->input->get('line');
        
        // Apply where conditions if provided
        if (!empty($line)) {
            // Assuming $line is an array or some other appropriate structure
            $this->db->where('a.line',$line);
        }
        
        $this->db->where('a.area_id', '4');
        $this->db->where('a.area_status', '1');
        $this->db->where('a.lot_status', '1');
        
        // Fetch filtered data from the model
        $query = $this->db->get();
        return $query->result_array();
    }
    
    
    
    
    
	// public function add_model($modelName, $created_by) {
    //     // Add your logic to insert the item into the database

    //    $date_add = date('Y-m-d h:i');
    //    $active_now = 1;

    //     $data = array(
    //         'model' => $modelName,
    //         'is_active' => $active_now,
    //         'created_at' => $date_add,
    //         'created_by' => $created_by

    //     );
    //     $this->db->insert('set_models', $data);
    // }
	// public function get_model_by_name($modelName) {
	// 	$this->db->where('model', $modelName);
	// 	$query = $this->db->get('set_models');
	// 	return $query->row_array(); // Assuming you expect only one row for a given area name
	// }

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
