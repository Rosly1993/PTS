<?php
class Ipqcforrejudges_model extends CI_Model {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->database();
    }

	public function get_prresults($line = null) {
        $this->db->select('*');
        $this->db->from('(SELECT DISTINCT(serial1), MAX(id) AS id, sequence, serial2, tray_no, line, model, cavity, input_date, output_date, output_by, sample_date, sample_by, debplan, (quantity - quantity_lost) AS newquantity 
                        FROM pr_result 
                        WHERE area_id = "5" 
                        AND disposition_ipqc IN ("OK", "For QA-DIM Judge")' . ($line ? ' AND line = "'.$line.'"' : '') . ' 
                        GROUP BY serial1) a');
        $this->db->join('(SELECT pr_result.serial1, pr_result.unique1, pr_result.area_id AS newareaid, pr_result.id AS newid, pr_result.input_date AS newdate, set_areas.area AS newarea 
                        FROM pr_result 
                        INNER JOIN set_areas ON pr_result.area_id = set_areas.id 
                        JOIN (SELECT serial1, MAX(id) AS max_id FROM pr_result GROUP BY serial1, unique1) a 
                        ON pr_result.serial1 = a.serial1 AND pr_result.id = a.max_id) b', 'b.serial1 = a.serial1', 'left');
        $query = $this->db->get();
        return $query->result_array();

    }
   public function get_prresult_details($id) {
    // Perform a database query to get the current item details based on the ID
    $query = $this->db->get_where('pr_result', ['id' => $id]);
    
    // Get the result as an array
    $result = $query->row_array();
    
    // Calculate newquantity
    $newquantity = $result['quantity'] - $result['quantity_lost'];
    
    // Add newquantity to the result array
    $result['newquantity'] = $newquantity;
    
    // Return the modified result array
    return $result;
}

	
public function update_prresults($id, $data) {
    $this->db->where('id', $id);
    $result = $this->db->update('pr_result', $data);
    return $result;
}

	
}
?>  
