<?php
class Mfiins_model extends CI_Model {
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
        $sql = "select * from(SELECT 
        (pr_result.quantity - pr_result.quantity_lost) AS quantity, 
        pr_result.model, 
        pr_result.serial1, 
				pr_result.unique1,
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
    LIMIT 1)a
		
		left join
		
		(SELECT serial1, unique1, MAX(id) AS max_id, disposition FROM pr_result WHERE area_id = '1' GROUP BY serial1, unique1)b 
		
		using(serial1,unique1)";
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
                    'disposition' => $row->disposition,
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
    
    
    public function add_lot($serial1, $line , $disposition) {

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

              // Fetch the data from pr_result to get if Casting QA Judgement is OK
                $result = $this->db->get_where('pr_result', array('serial1' => $serial1, 'unique1' => $row->unique1, 'area_id' => 8 ))->row();
                // Return error message

            if ($row->area == 'MFI' && $row->input_by === null && $result->disposition =='OK' || $row->area == 'MFI' && $row->input_by === null && $result->disposition ===null) {
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
                    'mfiin_date' => $date_add,
                    'mfiin_pic' => $fullname,
                    'mfi_line' => $line,
                    // add other fields you want to insert
                );
                $this->db->where('serial', $row->serial1); // Assuming $id is obtained from somewhere else
                $this->db->where('unique', $row->unique1);
                $this->db->update('pr_history', $data_history);
                
                return 'success';
            } else {

                // Fetch the data from pr_result to get if Casting QA Judgement is OK
                $result = $this->db->get_where('pr_result', array('serial1' => $serial1, 'unique1' => $row->unique1, 'area_id' => 1 ))->row();
                // Return error message

               //for the alert ang ferson
               if ($result->disposition =='NG' || $result->disposition =='For Verify') {

                return "This Serial is NG on QA Diecast : <br>Lock Details - $result->locked_details <br>QAN Number - $result->qan_number";

              }else{

                // Return error message
                return "This Serial is Active on : $row->area";
              }
            }
        } else {
            // Return error message
            return "This Serial is NG on QA Diecast";
        }
    }
    
    public function get_models() {
        $user = $this->session->userdata('user');
		extract($user);
        $query = $this->db
        ->select('id, serial1,tray_no, model, cavity, (quantity - quantity_lost) AS quantity, line, input_date,debplan as attachment')
        ->from('pr_result')
        ->where('area_id', '8')
        ->where('input_by', $fullname)
        ->where('output_by', NULL)
        ->where('area_status', 1)
        ->where('lot_status', 1)
        // ->order_by('id', 'ASC')
        ->get();
        return $query->result_array();
    }
    
}


    


?>  
