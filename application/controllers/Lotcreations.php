<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Lotcreations extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->helper('url'); // Load URL Helper
        $this->load->model('lotcreations_model');
        $this->load->model('lotdetails_model'); // Load the Models model for dropdown
        $this->load->model('categories_model'); // Load the Models model for dropdown
    }

    public function index(){
        // Check if user session exists
        if($this->session->userdata('user')){
            
            $data['lotcreations'] = $this->lotcreations_model->get_lotcreations();

            $data['lotdetails'] = $this->lotdetails_model->get_active_lotdetails();

            $data['categories'] = $this->categories_model->get_categories();

            $user = $this->session->userdata('user');
            extract($user);

            if($area_id =='19' || $area_id =='1'){

                $this->load->view('Lotcreations/index', $data);

            }else{
                $this->load->view('errors/index.html');
            }
            

           
        }
        else{
            // User is not logged in, redirect to login page
            redirect('login_page');
        }
    }
    public function add_lot() {
        if ($this->input->is_ajax_request()) {
            $serial1 = $this->input->post('serial1');
            $line = $this->input->post('line');
            $mold_no = $this->input->post('mold_no');
            $model = $this->input->post('model');
            $cavity = trim($this->input->post('cavity'));
            $ingot_no = $this->input->post('ingot_no');
            $tray_size = $this->input->post('tray_size');
            $remarks = $this->input->post('remarks');
            $category = $this->input->post('category');
            $tray_no = $this->input->post('tray_no');
            $quantity = $this->input->post('quantity');
            $userdata = $this->input->post('userdata');
    
            $result = $this->lotcreations_model->add_lot($serial1, $line, $mold_no, $model, $cavity, $ingot_no, $tray_size, $remarks, $category,$tray_no, $quantity, $userdata);
    
            $response['status'] = $result === 'success' ? 'success' : 'error';
            $response['message'] = $result === 'success' ? 'Lot Created successfully!' : 'Serial is Active!';
            
            header('Content-Type: application/json');
            echo json_encode($response);
        }
    }
    
   
    }
        

        ?>