<?php
class Pruniques_model extends CI_Model {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->database();
    }

	public function get_pruniques() {
        $query = $this->db->get('pr_unique');
        return $query->result_array();
    }
	
	
}
?>  
