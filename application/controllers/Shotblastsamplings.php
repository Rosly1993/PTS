<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Shotblastsamplings extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->helper('url'); // Load URL Helper
        $this->load->model('shotblastsamplings_model');
        $this->load->model('categories_model'); // Load the Models model for dropdown
    }

    public function index(){
        // Check if user session exists
        if($this->session->userdata('user')){
            // User is logged in, load the areas data
            $data['prresults'] = $this->shotblastsamplings_model->get_prresults();
            $data['categories'] = $this->categories_model->get_categories();
            // Load the areas view with data
            
            $user = $this->session->userdata('user');
            extract($user);
           
            if($area_id =='19' || $area_id =='18'){

                $this->load->view('Shotblastsamplings/index', $data);
                
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
        $data = $this->shotblastsamplings_model->get_prresults();
        echo json_encode(['data' => $data]); // Wrap the data in 'data' key
    }
    public function get_prresult_details($id) {
        $prresult_details = $this->shotblastsamplings_model->get_prresult_details($id);
        echo json_encode(['prresult_details' => $prresult_details]);
    }    


  
    
    public function update_prresults() {
        $id = $this->input->post('id');
        $serial = $this->input->post('serial');
        $remarks = $this->input->post('remarks');
        $unique = $this->input->post('unique');
        $userdata = $this->input->post('userdata');
        $updated_at = date('Y-m-d h:i');
       
    
        
            // Changes detected and no duplicate combination, proceed with updating the data
            $data = array(
                'locked' => 1,
                'disposition' => 'NG',
                'locked_details' => $remarks,
                'locked_remarks' => 'QA Shotblast',
                'locked_by' => $userdata,
                'locked_date' => $updated_at
            );
    
            $this->db->where('id', $id);
            $result = $this->db->update('pr_result', $data);

            
                $data_pr_remarks = array(
                    'serial' => $serial,
                    'input_date' => $updated_at,
                    'input_by' => $userdata,
                    'is_active' => 1,
                    'category' => 'QA Shotblast',
                    'area_id' => '3',
                    'remarks' => $remarks,
                    'uniques' => $unique
                );
                $this->db->insert('pr_remarks', $data_pr_remarks);  


                $update_history = array(
                    'shotblastqa_lock_details' => $remarks,
                    'shotblastqa_lock_by' => $userdata,
                    'shotblastqa_lock_date' => $updated_at
                );
            
                $this->db->where('serial', $serial);
                $this->db->where('unique', $unique);
                $this->db->update('pr_history', $update_history);
               

           
            if ($result) {
                echo json_encode(array('status' => 'success', 'message' => 'Data updated successfully'));
            } else {
                echo json_encode(array('status' => 'error', 'message' => 'Failed to update data'));
            
        
               
            }
        }
    
    
        public function accept_lot() {
            $this->shotblastsamplings_model->accept_lot();
            echo json_encode(['success' => true]);
        }
        
   
}

        ?>