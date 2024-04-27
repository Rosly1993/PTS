<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Reogisampling extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->helper('url'); // Load URL Helper
        $this->load->model('reogisampling_model');
        $this->load->model('userroles_model'); 
        $this->load->model('areas_model');
    }

    public function index(){
        // Check if user session exists
        if($this->session->userdata('user')){
            // User is logged in, load the areas data
            // $data['userroles'] = $this->userroles_model->get_userperarea();
            $data['areas'] = $this->reogisampling_model->get_areas();
            
            // Load the areas view with data
           
            $user = $this->session->userdata('user');
            extract($user);
           
            if($area_id =='19' || $area_id =='9'){

                $this->load->view('Reogisampling/index', $data);
                
            }else{
                $this->load->view('errors/index.html');
            }
        }
        else{
            // User is not logged in, redirect to login page
            redirect('login_page');
        }
    }



    public function get_areas() {
        $data = $this->reogisampling_model->get_areas();
        echo json_encode(['data' => $data]); // Wrap the data in 'data' key
    }

    public function get_area_details($id) {
        // Fetch area details where id is $id
        $area_details = $this->reogisampling_model->get_area_details($id);
    
        // Get the mfi_serial from the area_details
        $control_number = $area_details['mfi_serial'];
    
        // Fetch area details based on control_number
        $filtered_area_details = $this->reogisampling_model->get_area_details_by_control_number($control_number);
    
        // Output JSON response
        echo json_encode(['area_details' => $filtered_area_details]);
    }
    
    public function update_status() {
        // Get data from POST request
        $status_updates = $this->input->post('status_updates');
        
        // Loop through each status update and update the database
        foreach ($status_updates as $update) {
            $date_add = date('Y-m-d H:i');
            $user = $this->session->userdata('user');
            extract($user);
            $id = $update['id'];
            $status = $update['status'];
            $remarks = $update['remarks'];
            $model = $update['model'];
            $cavity = $update['cavity'];
            $quantity = $update['quantity'];
            $quantity_lost = $update['quantity_lost'];
            $serial1 = $update['serial1'];
            $mfi_serial = $update['mfi_serial'];
           
            if($status=='Rejected'){
                $remarks = 'Rejected  By: '.$fullname.' - '.$remarks;
                $area_status= 1;
                $lot_status= 1;

            }else{

                $remarks = 'Accepted  By: '.$fullname.' - '.$remarks;
                $area_status= 0;
                $lot_status= 0;

            }
            $this->reogisampling_model->update_status($id, $status, $remarks, $date_add, $fullname,$area_status,$lot_status, $serial1, $model, $cavity, $quantity,$mfi_serial, $quantity_lost);
        }
    
        // Return response
        echo json_encode(['success' => true]);
    }
    
    
   

    }
        

        ?>