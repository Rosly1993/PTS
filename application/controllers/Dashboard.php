<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->helper('url'); // Load URL Helper
        $this->load->model('dashboard_model');
        $this->load->model('categories_model'); // Load the Models model for dropdown
        $this->load->model('lines_model');
    }

    public function index(){
        // Check if user session exists
        if($this->session->userdata('user')){
            // User is logged in, load the areas data
            $data['prresults'] = $this->dashboard_model->get_prresults();
            $data['categories'] = $this->categories_model->get_categories();
            $data['lines'] = $this->lines_model->get_lines_by_area('2'); // Pass '2' as area_id
            // Load the areas view with data
            $this->load->view('Dashboard/index', $data);
        }
        else{
            // User is not logged in, redirect to login page
            redirect('login_page');
        }
    }
    public function get_prresults() {
        $serial = $this->input->get('serial'); // Get the selected serial from the request
        $data = $this->dashboard_model->get_prresults($serial);
        echo json_encode(['data' => $data]); // Wrap the data in 'data' key
    }
    public function get_prresult_details($id) {
        $prresult_details = $this->dashboard_model->get_prresult_details($id);
        echo json_encode(['prresult_details' => $prresult_details]);
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
  
    
    public function update_prresults() {
        $id = $this->input->post('id');
        $model = $this->input->post('model');
        $mold = $this->input->post('mold');
        $cavity = $this->input->post('cavity');
        $quantitylost = $this->input->post('quantitylost');
        $quantity_lost = $this->input->post('quantity_lost');
        $quantity = $this->input->post('quantity');
        $serial = $this->input->post('serial');
        $unique = $this->input->post('unique');
        // $line = $this->input->post('line');
        $ingot = $this->input->post('ingot');
        $traysize = $this->input->post('traysize');
        $trayno = $this->input->post('trayno');
        $category = $this->input->post('category');
        $remarks = $this->input->post('remarks');
        $debplan = $this->input->post('debplan');
        $userdata = $this->input->post('userdata');
        $updated_at = date('Y-m-d h:i');
        $new_quantity = $quantity-$quantitylost;
        $new_quantity_lost = $quantity_lost + $quantitylost;

        //query to get the next procees/ area_id for deburring is 2
        $query_getarea = $this->db->get_where('set_process', ['model' => $model, 'area_id' => 2]);
    
        // Get the result as an array
        $result_area = $query_getarea->row_array();
        $next_area = $result_area['next_id'];

        $data = array(
            'lot_status' => 0,
            'area_status' => 0,
            'quantity_lost' => $new_quantity_lost,
            'output_by' => $userdata,
            'output_date' => $updated_at
        );

        $this->db->where('id', $id);
        $this->db->update('pr_result', $data);


            if ($new_quantity > 0) {

            $insert_data = array(
                'area_id' => $next_area,
                'lot_status' => 1,
                'area_status' => 1,
                'quantity' => $new_quantity,
                'quantity_lost' => 0,
                'model' => $model,
                'cavity' => $cavity,
                'mold_no' => $mold,
                'serial1' => $serial,
                'unique1' => $unique,
                'debplan' => $debplan,
                'ingot_lot' => $ingot,
                'tray_size' => $traysize,
                'tray_no' => $trayno
                
            );
            
            $this->db->insert('pr_result', $insert_data);

            }else{

                $insert_data = array(
                    'disposition' => 'Scrap',  
                );
                $this->db->where('id', $id);
                $this->db->update('pr_result', $insert_data);
            }

            $data_pr_history = array(
                
                'date_deburring_out' => $updated_at,
                'deburring_pic_out' => $userdata,
               
            );
           // Specify the conditions for the update
            $this->db->where('serial', $serial);
            $this->db->where('unique', $unique);
            $this->db->update('pr_history', $data_pr_history);

            if (!empty($remarks)) {
                $data_pr_remarks = array(
                    'serial' => $serial,
                    'input_date' => $updated_at,
                    'input_by' => $userdata,
                    'area_id' => 2,
                    'is_active' => 1,
                    'category' => $category,
                    'remarks' => $remarks,
                    'uniques' => 1
                );
                $this->db->insert('pr_remarks', $data_pr_remarks);  }

                if ($new_quantity < 1) {
                    $data_update_serial = array(
                       
                    'is_active' => 0,
                       
                    );
                // Specify the conditions for the update
                $this->db->where('serial', $serial);
                $this->db->where('uniques', $unique);
                $this->db->update('pr_unique', $data_update_serial);  }

           
            if ($insert_data) {
                echo json_encode(array('status' => 'success', 'message' => 'Data updated successfully'));
            } else {
                echo json_encode(array('status' => 'error', 'message' => 'Failed to update data'));
            }
        
    }
    
    
    
    
   
}

        

        ?>