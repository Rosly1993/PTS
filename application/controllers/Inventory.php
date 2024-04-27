<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Inventory extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->helper('url'); // Load URL Helper
        $this->load->model('inventory_model');
        $this->load->model('categories_model'); // Load the Models model for dropdown
    }

    public function index(){
        // Check if user session exists
        if($this->session->userdata('user')){
            // User is logged in, load the areas data
            $data['prresults'] = $this->inventory_model->get_prresults();
            $data['categories'] = $this->categories_model->get_categories();
            
            // Load the areas view with data
         

                $this->load->view('Inventory/index', $data);

        }
        else{
            // User is not logged in, redirect to login page
            redirect('login_page');
        }
    }
    public function get_prresults() {
        $data = $this->inventory_model->get_prresults();
        echo json_encode(['data' => $data]); // Wrap the data in 'data' key
    }
   
    
    
    
    
   
}

        

        ?>