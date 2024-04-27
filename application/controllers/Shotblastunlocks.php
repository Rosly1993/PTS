<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Shotblastunlocks extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->helper('url'); // Load URL Helper
        $this->load->model('shotblastunlocks_model');
        $this->load->model('categories_model'); // Load the Models model for dropdown
    }

    public function index(){
        // Check if user session exists
        if($this->session->userdata('user')){
            // User is logged in, load the areas data
            $data['prresults'] = $this->shotblastunlocks_model->get_prresults();
            $data['categories'] = $this->categories_model->get_categories();
            // Load the areas view with data
            
            $user = $this->session->userdata('user');
            extract($user);
           
            if($area_id =='19' || $area_id =='18'){

                $this->load->view('Shotblastunlocks/index', $data);
                
            }else{
                
                $this->load->view('errors/index.html');
            }
        }
        else{
            // User is not logged in, redirect to login page
            redirect('login_page');
        }
    }
    public function get_prresults() {
        $data = $this->shotblastunlocks_model->get_prresults();
        echo json_encode(['data' => $data]); // Wrap the data in 'data' key
    }
    public function get_prresult_details($id) {
        $prresult_details = $this->shotblastunlocks_model->get_prresult_details($id);
        echo json_encode(['prresult_details' => $prresult_details]);
    }    

        public function accept_lot() {
            $this->shotblastunlocks_model->accept_lot();
            echo json_encode(['success' => true]);
        }
        
   
}

        ?>