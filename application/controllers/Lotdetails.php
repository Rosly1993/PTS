<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Lotdetails extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->helper('url'); // Load URL Helper
        $this->load->model('lotdetails_model');
        $this->load->model('lines_model');
        $this->load->model('models_model'); // Load the Models model for dropdown
    }

    public function index(){
        // Check if user session exists
        if($this->session->userdata('user')){
            // User is logged in, load the areas data
            // $data['lotdetails'] = $this->lotdetails_model->get_lotdetails();
            $data['lotdetails'] = $this->lotdetails_model->get_active_lotdetails();
            $data['models'] = $this->models_model->get_models(); // Fetch models data
            // $data['lines'] = $this->lines_model->get_lines('1');
            $data['lines'] = $this->lines_model->get_lines_by_area('1');
            // Load the areas view with data

            $user = $this->session->userdata('user');
            extract($user);

            if($area_id =='19' || $area_id =='1'){

                $this->load->view('Lotdetails/index', $data);

            }else{
                $this->load->view('errors/index.html');
            }
           
        }
        else{
            // User is not logged in, redirect to login page
            redirect('login_page');
        }
    }
    public function get_active_lotdetails() {
        $data = $this->lotdetails_model->get_active_lotdetails();
        echo json_encode(['data' => $data]); // Wrap the data in 'data' key
    }

    public function get_lotdetails_details($id) {
        $lotdetails_details = $this->lotdetails_model->get_lotdetails_details($id);
        echo json_encode(['lotdetails_details' => $lotdetails_details]);
    }    

    public function add_lotdetails() {
        // Check if it's an AJAX request
        if ($this->input->is_ajax_request()) {
            // Get form data
            $machine = $this->input->post('machine');
            $model = $this->input->post('model');
            $mold_no = $this->input->post('mold_no');
            $tray_size = $this->input->post('tray_size');
            $cavity = $this->input->post('cavity');
            $ingot_no = strtoupper($this->input->post('ingot_no'));
            $created_by = $this->input->post('userdata');
    
            // Check if the area already exists
            $existing_mold = $this->lotdetails_model->get_molddetails_by_name($machine);
            if ($existing_mold) {
                // Area already exists, return error response
                $response['status'] = 'error';
                $response['message'] = 'Machine has Active Mold!';
            }else{

           
                // If the item doesn't exist, add it to the database
                $this->lotdetails_model->add_lotdetails($machine, $model, $mold_no, $tray_size, $cavity, $ingot_no, $created_by);
        
                // Return a success response
                $response['status'] = 'success';
                $response['message'] = 'Mold added successfully!';
            }
        
            // Send the JSON-encoded response
            header('Content-Type: application/json');
            echo json_encode($response);
        }
    }


        public function update_molddetails() {
            $id = $this->input->post('id');
            $model = strtoupper($this->input->post('model')); // Convert to uppercase
            $mold_no = $this->input->post('mold_no');
            $cavity1 = strtoupper($this->input->post('cavity1'));
            $cavity2 = strtoupper($this->input->post('cavity2'));
            $cavity3 = strtoupper($this->input->post('cavity3'));
            $cavity4 = strtoupper($this->input->post('cavity4'));
            $userdata = $this->input->post('userdata');
            $updated_at =date('Y-m-d h:i');
        
            // Fetch the existing data from the database
            $existing_data = $this->db->get_where('set_molddetails', array('id' => $id))->row_array();
        
            // Check if there are changes
            if ($existing_data['model'] === $model && $existing_data['mold_no'] == $mold_no && $existing_data['cavity1'] == $cavity1 && $existing_data['cavity2'] == $cavity2 && $existing_data['cavity3'] == $cavity3 && $existing_data['cavity4'] == $cavity4) {
                // No changes, return a response indicating no changes
                echo json_encode(array('status' => 'no_changes', 'message' => 'No changes detected.'));
                return;
            }
        
            // Check if the combination of lines and area_id already exists in the database
            $existing_combination = $this->db->get_where('set_molddetails', array('model' => $model, 'mold_no' => $mold_no))->row_array();
            if ($existing_combination && $existing_combination['id'] != $id) {
                // Combination already exists, return a response indicating duplicate data
                echo json_encode(array('status' => 'duplicate', 'message' => 'Combination of Model and Mold Number already exists.'));
                return;
            }
        
            // Changes detected and no duplicate combination, proceed with updating the data
            $data = array(
                'model' => $model,
                'mold_no' => $mold_no,
                'cavity1' => $cavity1,
                'cavity2' => $cavity2,
                'cavity3' => $cavity3,
                'cavity4' => $cavity4,
                'created_by' => $userdata,
                'updated_at' => $updated_at
            );
        
            $this->db->where('id', $id);
            $result = $this->db->update('set_molddetails', $data);
            if ($result) {
                echo json_encode(array('status' => 'success', 'message' => 'Data updated successfully'));
            } else {
                echo json_encode(array('status' => 'error', 'message' => 'Failed to update data'));
            }
        }
   
        public function delete_lotdetails() {
            $this->lotdetails_model->delete_lotdetails();
            echo json_encode(['success' => true]);
        }
        
    }
        

        ?>