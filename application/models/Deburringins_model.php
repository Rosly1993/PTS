<?php
class Deburringins_model extends CI_Model {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->database();
    }

	// public function get_lotcreations() {
    //     $query = $this->db->get('set_lotdetails');
    //     return $query->result_array();
    // }
    public function get_lines_by_area($area_id) {
        $this->db->where('area_id', $area_id);
        $query = $this->db->get('set_lines');
        return $query->result_array();
    }


    public function get_quantity($serial1) {
        // Normal SQL query to retrieve quantity
        $sql = "SELECT 
        (pr_result.quantity - pr_result.quantity_lost) AS quantity, 
        pr_result.model, 
        pr_result.serial1, 
        pr_result.cavity, 
        pr_result.debplan,
          set_areas.area,	
        CASE 
            WHEN pr_result.input_by IS NULL THEN 'For In' 
            ELSE 'For Out' 
        END AS input_status
    FROM 
        pr_result 
            inner join set_areas on pr_result.area_id = set_areas.id
    WHERE 
        pr_result.serial1 = ?
    ORDER BY 
        pr_result.id DESC 
    LIMIT 1;";
        $query = $this->db->query($sql, array($serial1));
    
        // Check if query is successful and return quantity
        if ($query) {
            if ($query->num_rows() > 0) {
                $row = $query->row();
                return array(
                    'area' => $row->area,
                    'quantity' => $row->quantity,
                    'model' => $row->model,
                    'cavity' => $row->cavity,
                    'debplan' => $row->debplan,
                    'input_status' => $row->input_status,
                    'serial1' => $row->serial1
                );
            } else {
                return false; // Return false if quantity not found
            }
        } else {
            // Log or handle database query error
            error_log("Database error: " . $this->db->error());
            return false;
        }
    }
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
    
    
    
    public function add_lot($serial1, $line) {

        $date_add = date('Y-m-d H:i:s');
        $user = $this->session->userdata('user');
		extract($user);
        // Check if serial1 already exists and get the latest row with area_id = 2 and input_date is null
        $this->db->select('pr_result.serial1, pr_result.unique1, pr_result.input_by, pr_result.area_id, pr_result.id, set_areas.area');
        $this->db->from('pr_result');
        $this->db->join('set_areas', 'pr_result.area_id = set_areas.id', 'left');
        $this->db->where('pr_result.serial1', $serial1);
        $this->db->order_by('pr_result.id', 'desc');
        $this->db->limit(1);
        $query = $this->db->get();
    
        if ($query->num_rows() > 0) {
            $row = $query->row();
            if ($row->area == 'Deburring' && $row->input_by === null) {
                // Insert data into pr_result table
                $data = array(
                    'input_date' => $date_add,
                    'input_by' => $fullname,
                    'line' => $line,
                    // add other fields you want to insert
                );
                $this->db->where('id', $row->id); // Assuming $id is obtained from somewhere else
                $this->db->update('pr_result', $data);

                $data_history = array(
                    'date_deburring_in' => $date_add,
                    'deburring_pic' => $fullname,
                    'deburring_line' => $line,
                    // add other fields you want to insert
                );
                $this->db->where('serial', $row->serial1); // Assuming $id is obtained from somewhere else
                $this->db->where('unique', $row->unique1);
                $this->db->update('pr_history', $data_history);
                
                return 'success';
            } else {
                // Return error message
                return "This Serial is Active on : $row->area";
            }
        } else {
            // Return error message
            return "Error: Serial1 does not exist.";
        }
    }
    
    public function get_models() {
        $user = $this->session->userdata('user');
		extract($user);
        $query = $this->db
        ->select('id, serial1, model, cavity, (quantity - quantity_lost) AS quantity,tray_no, line, input_date,debplan as attachment')
        ->from('pr_result')
        ->where('area_id', '2')
        ->where('input_by', $fullname)
        ->where('output_by', NULL)
        // ->order_by('id', 'ASC')
        ->get();
        return $query->result_array();
    }
    
}


    


?>  
