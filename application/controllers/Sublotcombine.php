<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sublotcombine extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->helper('url'); // Load URL Helper
        $this->load->model('sublotcombine_model');
       
        
    }

    public function index(){
        // Check if user session exists
        if($this->session->userdata('user')){

      
           
            $user = $this->session->userdata('user');
            extract($user);
           
            if($area_id =='19' || $area_id =='8'){

                $this->load->view('Sublotcombine/index');
                
            }else{
                $this->load->view('errors/index.html');
            }
        }
        else{
            // User is not logged in, redirect to login page
            redirect('login_page');
        }
    }
    
    public function get_employee_details() {
        $idNumber = $this->input->get('id_number');
        $data = $this->sublotcombine_model->get_employee_details($idNumber);
        echo json_encode(['data' => $data]);
    }
    public function add_request() {
        // Check if it's an AJAX request
        if ($this->input->is_ajax_request()) {
            // Decode the JSON string into an array
            $requestData = json_decode($this->input->post('requestData'), true);

           


            if (is_array($requestData)) {
                $successCount = 0;
                foreach ($requestData as $item) {
                    $serial1 = $item['serial1'];
                    $id = $item['id'];
                    $model = $item['model'];
                    $cavity = $item['cavity'];
                    $quantity = $item['quantity'];
                    $controlNumber = $model . $cavity . date('YmdHi') . mt_rand(10, 99);
    
                    // Insert each item into the database
                    $insertResult = $this->sublotcombine_model->add_request($serial1, $id, $model, $cavity, $quantity, $controlNumber);
                    if ($insertResult) {
                        $successCount++;
                    } else {
                        // Handle insertion failure
                        // You might log the error or take other appropriate action
                    }
                }
    
                // Determine the overall success or failure
                if ($successCount == count($requestData)) {
                    $response['status'] = 'success';
                    $response['message'] = 'All items added successfully!';
                } else {
                    $response['status'] = 'error';
                    $response['message'] = 'Some items could not be added.';
                }
            } else {
                // Handle error, in case requestData is not an array
                $response['status'] = 'error';
                $response['message'] = 'Invalid data format!';
            }
    
            // Send the JSON-encoded response
            echo json_encode($response);
        } else {
            // Handle non-AJAX request error
            show_error('No direct script access allowed');
        }
    }
    

}

   
        

        ?>