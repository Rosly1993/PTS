<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Deburringins extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->helper('url'); // Load URL Helper
        $this->load->model('lines_model');
        $this->load->model('deburringins_model');
    
    }

    public function index(){
        // Check if user session exists
        if($this->session->userdata('user')){

            $data['lines'] = $this->lines_model->get_lines_by_area('2'); // Pass '2' as area_id
  
            // Load the areas view with data
            $user = $this->session->userdata('user');
            extract($user);
           
            if($area_id =='19' || $area_id =='2'){

                $this->load->view('Deburringins/index', $data);

            }else{
                $this->load->view('errors/index.html');
            }
            
        }
        else{
            // User is not logged in, redirect to login page
            redirect('login_page');
        }
    }

    public function get_quantity() {
        // Check if it's an AJAX request
        if ($this->input->is_ajax_request()) {
            // Get the serial number from the input
            $serial1 = $this->input->get('serial1');
            
            if ($serial1 !== false && $serial1 !== '') {
                // Call the model method to get the quantity
                $quantity = $this->deburringins_model->get_quantity($serial1);
                
                if ($quantity !== false) {
                    echo json_encode(array('status' => 'success', 'quantity' => $quantity));
                } else {
                    echo json_encode(array('status' => 'error', 'message' => 'Failed to retrieve quantity for the serial: ' . $quantity));
                }
            } else {
                echo json_encode(array('status' => 'error', 'message' => 'Serial number is missing or invalid.'));
            }
        }
    }
    
    public function get_prresult_remarks($id) {
        $prresult_details_remarks = $this->medsamplings_model->get_prresult_remarks($id);
        if ($prresult_details_remarks) {
            echo json_encode(['prresult_details_remarks' => $prresult_details_remarks]);
        } else {
            // Return a default structure if no data is found
            echo json_encode(['prresult_details_remarks' => null]);
        }
    }
     
    public function add_lot() {
        if ($this->input->is_ajax_request()) {
            $serial1 = $this->input->post('serial1');
            $line = $this->input->post('line');
    
            $result = $this->deburringins_model->add_lot($serial1, $line);
    
            // Check the result of the operation
            if ($result === 'success') {
                $response['message'] = 'Lot created successfully!';
                $response['status'] = 'success';
    
            } else {
                // If an error occurred, include the area information in the error message
                $response['message'] = $result; // This message already includes the area information
                $response['status'] = 'error';
            }
    
            // Send JSON response
            header('Content-Type: application/json');
            echo json_encode($response);
        }
    }
    
   
    public function get_models() {
        $data = $this->deburringins_model->get_models();
        echo json_encode(['data' => $data]); // Wrap the data in 'data' key
    }
    
    
    
   
    }
        

        ?>