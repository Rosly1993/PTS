<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Castingunlocks extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->helper('url'); // Load URL Helper
        $this->load->model('castingunlocks_model');
        $this->load->model('models_model'); // Load the Models model for dropdown
        $this->load->model('molddetails_model'); // Load the Models model for dropdown
        $this->load->model('lines_model');
    }

    public function index(){
        // Check if user session exists
        if($this->session->userdata('user')){
            // User is logged in, load the areas data
            $data['castinglocks'] = $this->castingunlocks_model->get_castinglocks();
            $data['models'] = $this->models_model->get_models(); // Fetch models data
            $data['molddetails'] = $this->molddetails_model->get_molddetails();

            $data['lines'] = $this->lines_model->get_lines_by_area('1');
            // Load the areas view with data
           
            $user = $this->session->userdata('user');
            extract($user);
           
            if($area_id =='19' || $area_id =='18'){

                $this->load->view('Castingunlocks/index', $data);

            }else{
                $this->load->view('errors/index.html');
            }
        }
        else{
            // User is not logged in, redirect to login page
            redirect('login_page');
        }
    }
    public function get_castinglocks() {
        // Get filter parameters from the GET request
        $line = $this->input->get('line');
        $model = $this->input->get('model');
        $mold_no = $this->input->get('mold_no');
        $cavity = $this->input->get('cavity');
        $date_from = $this->input->get('date_from');
        $date_to = $this->input->get('date_to');
    
        // Construct where conditions based on provided filters
        $where = array();
        if (!empty($line)) {
            $where['line'] = $line;
        }
        if (!empty($model)) {
            $where['model'] = $model;
        }
        if (!empty($mold_no)) {
            $where['mold_no'] = $mold_no;
        }
        if (!empty($cavity)) {
            $where['cavity'] = $cavity;
        }
        if (!empty($date_from) && !empty($date_to)) {
            $where['input_date >='] = $date_from;
            $where['input_date <='] = $date_to;
        }
    
        // Add condition for locked column not equal to '1' or NULL
        $this->db->group_start();
        $this->db->where('disposition =', 'For Verify');
        // $this->db->where('locked =', '1');
        // $this->db->or_where('locked IS NULL');
        $this->db->group_end();
    
        // Fetch filtered data from the model
        $data = $this->castingunlocks_model->get_castinglocks($where);
        echo json_encode(['data' => $data]); // Wrap the data in 'data' key
    }
    
    
    

    public function get_model_details($id) {
        $model_details = $this->models_model->get_model_details($id);
        echo json_encode(['model_details' => $model_details]);
    }    

    public function delete_records() {

        $ids = $this->input->post('id');
        // $userdata = $this->input->post('userdata');
        // $locked_details = $this->input->post('locked_details');
        $unlocked_remarks = $this->input->post('unlocked_remarks');
        $userdata = $this->input->post('userdata');
        $locked_date=date('Y-m-d H:i:s');
        // Loop through each ID and update the fields
        foreach ($ids as $id) {
            // Example: Update the fields in your database table
            $data = array(
                'locked' => '0',
                'unlocked_remarks' => $unlocked_remarks,
                'disposition' => 'OK',
                'unlocked_by' => $userdata,
                'unlocked_date' => $locked_date
            );
            $this->db->where('id', $id);
            $this->db->update('pr_result', $data);
        }

        echo "success";
    }
}
        

        ?>