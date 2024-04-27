<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Shotblastmrs extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->helper('url'); // Load URL Helper
        $this->load->model('shotblastmrs_model');
        $this->load->model('categories_model'); // Load the Models model for dropdown
    }

    public function index(){
        // Check if user session exists
        if($this->session->userdata('user')){
            // User is logged in, load the areas data
            $data['prresults'] = $this->shotblastmrs_model->get_prresults();
            $data['categories'] = $this->categories_model->get_categories();
            // Load the areas view with data
           
            $user = $this->session->userdata('user');
            extract($user);
           
            if($area_id =='19' || $area_id =='15'){

                $this->load->view('Shotblastmrs/index', $data);
                
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
        $data = $this->shotblastmrs_model->get_prresults();
        echo json_encode(['data' => $data]); // Wrap the data in 'data' key
    }
    public function get_prresult_details($id) {
        $prresult_details = $this->shotblastmrs_model->get_prresult_details($id);
        echo json_encode(['prresult_details' => $prresult_details]);
    }    


  
    
    public function update_prresults() {
        $id = $this->input->post('id');
        $ng_qty = $this->input->post('ng_qty');
        $serial = $this->input->post('serial');
        $unique = $this->input->post('unique');
        $remarks = $this->input->post('remarks');
        $userdata = $this->input->post('userdata');
        $updated_at = date('Y-m-d h:i');


        // Get the current quantity_lost and quantity
        $this->db->select('quantity, quantity_lost');
        $this->db->where('id', $id);
        $quantity_query = $this->db->get('pr_result');
        $quantity_row = $quantity_query->row();
        $quantity = $quantity_row->quantity;
        $current_quantity_lost = $quantity_row->quantity_lost;
    
        // Sum the current quantity_lost with $ng_qty
        $total_quantity_lost = $current_quantity_lost + $ng_qty;
    
        // Check if total_quantity_lost is greater than quantity
        if ($total_quantity_lost > $quantity) {
            echo json_encode(array('status' => 'error', 'message' => 'Quantity lost is greater than quantity'));
            return; // Stop further execution
        }

        if($total_quantity_lost == $quantity)
        {

        // Update quantity_lost based on the max id
        $this->db->group_start();
        $this->db->where('serial1', $serial);
        $this->db->where('unique1', $unique);
        $this->db->where('area_id', 4);
        $this->db->group_end();
        $this->db->or_group_start();
        $this->db->where('serial1', $serial);
        $this->db->where('unique1', $unique);
        $this->db->where('area_id', 3);
        $this->db->group_end();
        $this->db->update('pr_result', array('quantity_lost' => $total_quantity_lost, 'disposition' => 'Scrap' , 'locked' => 0, 'area_status' => 0,'lot_status' => 0,'sorted_by' => $userdata,'date_sorted' => $updated_at));

   
       //update pr_unique to inactive
        $update_prunique = array( 

            'is_active' => 0,
            'created_at' => $updated_at,
            
        );

        $this->db->where('serial', $serial);
        $this->db->where('uniques', $unique);
        $this->db->update('pr_unique', $update_prunique);

        $data_pr_remarks = array(
            'serial' => $serial,
            'input_date' => $updated_at,
            'input_by' => $userdata,
            'is_active' => 1,
            'category' => 'Shotblast MRS',
            'remarks' => $remarks,
            'uniques' => $unique
        );
        $this->db->insert('pr_remarks', $data_pr_remarks); 

        // update history
        $data_pr_history = array(
                
            'shotblastmrs_remarks' => $remarks,
            'shotblastmrs_date' => $updated_at,
            'shotblastmrs_by' => $userdata,
           
        );
       // Specify the conditions for the update
        $this->db->where('serial', $serial);
        $this->db->where('unique', $unique);
        $this->db->update('pr_history', $data_pr_history);

        }else{

       
         // Update main table
         $result = array(
            'quantity_lost' => $total_quantity_lost,
            'sort_remarks' => $remarks,
            'disposition' => 'For Verify',
            'date_sorted' => $updated_at,
            'sorted_by' => $userdata
        );
    
        // $this->db->where('id', $id);
        $this->db->group_start();
        $this->db->where('serial1', $serial);
        $this->db->where('unique1', $unique);
        $this->db->where('area_id', 4);
        $this->db->group_end();
        $this->db->or_group_start();
        $this->db->where('serial1', $serial);
        $this->db->where('unique1', $unique);
        $this->db->where('area_id', 3);
        $this->db->group_end();
        $this->db->update('pr_result', $result);

       // Update sort_remarks
        $data_pr_remarks = array(
            'serial' => $serial,
            'input_date' => $updated_at,
            'input_by' => $userdata,
            'is_active' => 1,
            'category' => 'Shotblast MRS',
            'remarks' => $remarks,
            'uniques' => $unique
        );
        $this->db->insert('pr_remarks', $data_pr_remarks); 


        // update history
        $data_pr_history = array(
                
            'shotblastmrs_remarks' => $remarks,
            'shotblastmrs_date' => $updated_at,
            'shotblastmrs_by' => $userdata,
           
        );
       // Specify the conditions for the update
        $this->db->where('serial', $serial);
        $this->db->where('unique', $unique);
        $this->db->update('pr_history', $data_pr_history);


        }
    
       
    
        echo json_encode(array('status' => 'success', 'message' => 'Data updated successfully'));
    }
    
}
    

        ?>