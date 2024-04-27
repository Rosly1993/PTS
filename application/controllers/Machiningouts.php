<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Machiningouts extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->helper('url'); // Load URL Helper
        $this->load->model('machiningouts_model');
        $this->load->model('categories_model'); // Load the Models model for dropdown
        $this->load->model('lines_model');
    }

    public function index(){
        // Check if user session exists
        if($this->session->userdata('user')){
            // User is logged in, load the areas data
            $data['prresults'] = $this->machiningouts_model->get_prresults();
            $data['categories'] = $this->categories_model->get_categories();
            $data['lines'] = $this->lines_model->get_lines_by_area('5'); // Pass '2' as area_id
            // Load the areas view with data
            
            $user = $this->session->userdata('user');
            extract($user);
           
            if($area_id =='19' || $area_id =='5'){

                $this->load->view('Machiningouts/index', $data);
                
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
        $line = $this->input->get('line'); // Get the selected line from the request
        $data = $this->machiningouts_model->get_prresults($line);
        echo json_encode(['data' => $data]); // Wrap the data in 'data' key
    }
    public function get_prresult_details($id) {
        $prresult_details = $this->machiningouts_model->get_prresult_details($id);
        echo json_encode(['prresult_details' => $prresult_details]);
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
        $sequence = strtoupper($this->input->post('sequence'));
        $ingot = $this->input->post('ingot');
        $traysize = $this->input->post('traysize');
        $trayno = $this->input->post('trayno');
        $category = $this->input->post('category');
        $remarks = $this->input->post('remarks');
        $debplan = $this->input->post('debplan');
        $userdata = $this->input->post('userdata');
        $new_serial = $this->input->post('new_serial');
        $updated_at = date('Y-m-d h:i');
        $new_quantity = $quantity-$quantitylost;
        $new_quantity_lost = $quantity_lost + $quantitylost;

        //query to get the next procees/ area_id for machining is 5
        $query_getarea = $this->db->get_where('set_process', ['model' => $model, 'area_id' => 5]);
            
        // Get the result as an array
        $result_area = $query_getarea->row_array();
        $next_area = $result_area['next_id'];


        // Check if serial1 if existing in pr_unique
        $this->db->where('serial', $new_serial);
        $query = $this->db->get('pr_unique');

        if ($query->num_rows() > 0) {
            $result = $query->row(); // Get the row from the query result


            if ($result->is_active == 0) {  
       
            // update pr_UNIQUE
            $data_unique = array(
                        
               
                'serial' => $new_serial,
                'uniques' => $result->uniques + 1,
                'is_active' => 1,
                'created_at' => $updated_at
            );

            $this->db->where('serial', $new_serial);
            $this->db->update('pr_unique', $data_unique);
      
                
            // update pr_result
            $data = array(
               
                'disposition' => 'For QA-DIM Judge',
                'disposition_ipqc' => 'For IPQC Judge',
                'serial2' => $new_serial,
                'tray_no' => $trayno,
                'unique2' => $result->uniques + 1,
                'quantity_lost' => $new_quantity_lost,
                'output_by' => $userdata,
                'sequence' => $sequence,
                'area_status' => 0,
                'output_date' => $updated_at
            );
    
            $this->db->where('id', $id);
            $this->db->update('pr_result', $data);
            
            // update history
            $data_pr_history = array(
                
                'machining_date_out' => $updated_at,
                'machining_pic_out' => $userdata,
               
            );
           // Specify the conditions for the update
            $this->db->where('serial', $serial);
            $this->db->where('unique', $unique);
            $this->db->update('pr_history', $data_pr_history);


          //if remarks is not empty
            if (!empty($remarks)) {
                $data_pr_remarks = array(
                    'serial' => $serial,
                    'input_date' => $updated_at,
                    'input_by' => $userdata,
                    'area_id' => 5,
                    'is_active' => 1,
                    'category' => $category,
                    'remarks' => $remarks,
                    'uniques' => $result->uniques + 1
                );
            $this->db->insert('pr_remarks', $data_pr_remarks);  }



            echo json_encode(array('status' => 'success', 'message' => 'Data updated successfully'));

            }else{

            echo json_encode(array('status' => 'error', 'message' => 'Active Serial'));

            }
    
      

           
           

        }else{

          //insert data for new serial
            $this->db->insert('pr_unique', array('serial' => $new_serial, 'is_active' => 1, 'uniques' => 1, 'created_at' => $updated_at));

            

             // update pr_result
             $data = array(
               
                'disposition' => 'For QA-DIM Judge',
                'disposition_ipqc' => 'For IPQC Judge',
                'serial2' => $new_serial,
                'unique2' =>  1,
                'quantity_lost' => $new_quantity_lost,
                'output_by' => $userdata,
                'area_status' => 0,
                'tray_no' => $trayno,
                'sequence' => $sequence,
                'output_date' => $updated_at
            );
    
            $this->db->where('id', $id);
            $this->db->update('pr_result', $data);
            
            // update history
            $data_pr_history = array(
                
                'machining_date_out' => $updated_at,
                'machining_pic_out' => $userdata,
               
            );
           // Specify the conditions for the update
            $this->db->where('serial', $serial);
            $this->db->where('unique', $unique);
            $this->db->update('pr_history', $data_pr_history);


          //if remarks is not empty
            if (!empty($remarks)) {
                $data_pr_remarks = array(
                    'serial' => $serial,
                    'input_date' => $updated_at,
                    'input_by' => $userdata,
                    'area_id' => 5,
                    'is_active' => 1,
                    'category' => $category,
                    'remarks' => $remarks,
                    'uniques' =>  1
                );
            $this->db->insert('pr_remarks', $data_pr_remarks);  }

        echo json_encode(array('status' => 'success', 'message' => 'Data updated successfully'));


        }
        
    }
}
    
    
    
?>