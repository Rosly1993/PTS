<?php
class Categories_model extends CI_Model {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->database();
    }

	public function get_categories() {
        $query = $this->db->get('set_category');
        return $query->result_array();
    }
	
	
}
?>  
