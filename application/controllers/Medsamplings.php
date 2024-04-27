<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Medsamplings extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->helper('url'); // Load URL Helper
        $this->load->model('medsamplings_model');
        $this->load->model('categories_model'); // Load the Models model for dropdown
    }

    public function index(){
        // Check if user session exists
        if($this->session->userdata('user')){
            // User is logged in, load the areas data
            $data['prresults'] = $this->medsamplings_model->get_prresults();
            $data['categories'] = $this->categories_model->get_categories();
            
            // Load the areas view with data
            $user = $this->session->userdata('user');
            extract($user);
           
            if($area_id =='19' || $area_id =='13'){

                $this->load->view('Medsamplings/index', $data);

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
        $data = $this->medsamplings_model->get_prresults();
        echo json_encode(['data' => $data]); // Wrap the data in 'data' key
    }
    public function get_prresult_details($id) {
        $prresult_details = $this->medsamplings_model->get_prresult_details($id);
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
     

    public function get_prhistory_remarks($id) {
        $prhistory_details_remarks = $this->medsamplings_model->get_prhistory_remarks($id);
        if ($prhistory_details_remarks) {
            echo json_encode(['prhistory_details_remarks' => $prhistory_details_remarks]);
        } else {
            // Return a default structure if no data is found
            echo json_encode(['prhistory_details_remarks' => null]);
        }
    }

    public function get_prhistory($id) {
        $prhistory_details = $this->medsamplings_model->get_prhistory($id);
        if ($prhistory_details) {
            echo json_encode(['prhistory_details' => $prhistory_details]);
        } else {
            // Return a default structure if no data is found
            echo json_encode(['prhistory_details' => null]);
        }
    }
  
    
    public function update_prresults() {
        $id = $this->input->post('id');
        $model = $this->input->post('model');
        $mold = $this->input->post('mold');
        $cavity = $this->input->post('cavity');
        $quantitylost = $this->input->post('quantitylost');
        $quantity = $this->input->post('quantity');
        $serial = $this->input->post('serial');
        $unique = $this->input->post('unique');
        $line = $this->input->post('line');
        $ingot = $this->input->post('ingot');
        $traysize = $this->input->post('traysize');
        $trayno = $this->input->post('trayno');
        $category = $this->input->post('category');
        $remarks = $this->input->post('remarks');
        $userdata = $this->input->post('userdata');
        $updated_at = date('Y-m-d h:i');
        $new_quantity = $quantity-$quantitylost;

        //query to get the next procees/ area_id
        $query_getarea = $this->db->get_where('set_process', ['model' => $model]);
    
        // Get the result as an array
        $result_area = $query_getarea->row_array();
        $next_area = $result_area['next_id'];




        // Check for the latest filepath
        $this->db->select('file_path');
        $this->db->from('pr_debplans');
        $this->db->where('model', $model);
        $this->db->where('mold_no', $mold);
        $this->db->where('cavity', $cavity);
        $this->db->order_by('created_at', 'DESC');
        $this->db->limit(1);
        $query = $this->db->get();
    
        if ($query->num_rows() > 0) {
            $filepath = $query->row()->file_path;
    
            // Changes detected and no duplicate combination, proceed with updating the data
            $data = array(
                'lot_status' => 0,
                'area_status' => 0,
                'quantity_lost' => $quantitylost,
                'debplan' => $filepath,
                'output_by' => $userdata,
                'output_date' => $updated_at
            );
    
            $this->db->where('id', $id);
            $result = $this->db->update('pr_result', $data);

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
                // 'line' => $line,
                'ingot_lot' => $ingot,
                'tray_size' => $traysize,
                'tray_no' => $trayno,
                // 'input_date' => $updated_at,
                'debplan' => $filepath
                
            );
            
            $this->db->insert('pr_result', $insert_data);

            }else{

                $update_dispo = array(
                    'disposition' => 'Scrap',  
                );
                $this->db->where('id', $id);
                $this->db->update('pr_result', $update_dispo);
            }

            $data_pr_history = array(
                
                'med_sampling_date' => $updated_at,
                'med_sampler' => $userdata,
               
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
                    'area_id' => 1,
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

           
            if ($result) {
                echo json_encode(array('status' => 'success', 'message' => 'Data updated successfully', 'filepath' => $filepath));
            } else {
                echo json_encode(array('status' => 'error', 'message' => 'Failed to update data'));
            }
        } else {
            // No debplan found
            echo json_encode(array('status' => 'error', 'message' => 'No debplan', 'file_path' => null));
        }
    }
    
    
    
    
   
}

        

        ?>