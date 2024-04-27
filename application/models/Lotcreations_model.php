<?php
class Lotcreations_model extends CI_Model {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->database();
    }

	public function get_lotcreations() {
        $query = $this->db->get('set_lotdetails');
        return $query->result_array();
    }

    public function add_lot($serial1, $line, $mold_no, $model, $cavity, $ingot_no, $tray_size, $remarks, $category,$tray_no, $quantity, $userdata) {
        // Check if serial1 already exists
        $this->db->where('serial', $serial1);
        $query = $this->db->get('pr_unique');
    
        if ($query->num_rows() > 0) {
            $result = $query->row(); // Get the row from the query result
    
            // Check if is_active is 0
            if ($result->is_active == 0) {
                // Serial exists and is_active is 0, proceed with insertion
                $date_add = date('Y-m-d h:i');
                $area_id = 1;
    
                // Update pr_unique data
                $this->db->where('serial', $serial1);
                $this->db->update('pr_unique', array('is_active' => 1, 'created_at' => $date_add));
    
                // Increment uniques
                $this->db->where('serial', $serial1);
                $this->db->set('uniques', 'uniques+1', FALSE);
                $this->db->update('pr_unique');
    
                // Insert into pr_result
                $data_pr_result = array(
                    'serial1' => $serial1,
                    'line' => $line,
                    'mold_no' => $mold_no,
                    'model' => $model,
                    'cavity' => $cavity,
                    'ingot_lot' => $ingot_no,
                    'tray_size' => $tray_size,
                    'tray_no' => $tray_no,
                    'quantity' => $quantity,
                    'quantity_lost' => 0,
                    'area_status' => 1,
                    'lot_status' => 1,
                    'area_id' => $area_id,
                    'input_date' => $date_add,
                   
                    'input_by' => $userdata,
                    'unique1' => $result->uniques + 1
                );
                $this->db->insert('pr_result', $data_pr_result);

                $data_pr_history = array(
                    'serial' => $serial1,
                    'casting_machine' => $line,
                    'mold_no' => $mold_no,
                    'model' => $model,
                    'cavity' => $cavity,
                    'trimming_date' => $date_add,
                    'quantity' => $quantity,
                    'trimmer' => $userdata,
                    'unique' => $result->uniques + 1
                );
                $this->db->insert('pr_history', $data_pr_history);
                // Insert data into pr_remarks table
                if (!empty($remarks)) {
                    $data_pr_remarks = array(
                        'serial' => $serial1,
                        'input_date' => $date_add,
                        'input_by' => $userdata,
                        'area_id' => 1,
                        'is_active' => 1,
                        'category' => $category,
                        'remarks' => $remarks,
                        'uniques' => $result->uniques + 1
                    );
                    $this->db->insert('pr_remarks', $data_pr_remarks);
                }
                return 'success';
            } else {
                // Serial exists but is_active is 1, return an error
                return 'error_active';
            }
        } else {
            // Serial doesn't exist, proceed with insertion into pr_unique and pr_result
            $date_add = date('Y-m-d h:i');
            $area_id = 1;
    
            // Insert into pr_unique
            $this->db->insert('pr_unique', array('serial' => $serial1, 'is_active' => 1, 'uniques' => 1, 'created_at' => $date_add));
    
            // Insert into pr_result
            $data_pr_result = array(
                'serial1' => $serial1,
                'line' => $line,
                'mold_no' => $mold_no,
                'model' => $model,
                'cavity' => $cavity,
                'ingot_lot' => $ingot_no,
                'tray_size' => $tray_size,
                'tray_no' => $tray_no,
                'quantity' => $quantity,
                'quantity_lost' => 0,
                'area_status' => 1,
                'lot_status' => 1,
                'area_id' => $area_id,
                'input_date' => $date_add,
                'input_by' => $userdata,
                'unique1' => 1
            );
            $this->db->insert('pr_result', $data_pr_result);

            $data_pr_history = array(
                'serial' => $serial1,
                'casting_machine' => $line,
                'mold_no' => $mold_no,
                'model' => $model,
                'cavity' => $cavity,
                'trimming_date' => $date_add,
                'quantity' => $quantity,
                'trimmer' => $userdata,
                'unique' => 1
            );
            $this->db->insert('pr_history', $data_pr_history);
  
        
            // Insert data into pr_remarks table
            if (!empty($remarks)) {
                $data_pr_remarks = array(
                    'serial' => $serial1,
                    'input_date' => $date_add,
                    'input_by' => $userdata,
                    'area_id' => 1,
                    'is_active' => 1,
                    'category' => $category,
                    'remarks' => $remarks,
                    'uniques' => 1
                );
                $this->db->insert('pr_remarks', $data_pr_remarks);
            }
            return 'success';
        }
    }
    
    
    
    
    
}


?>  
