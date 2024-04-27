<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Castingmrs extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->helper('url'); // Load URL Helper
        $this->load->model('castingmrs_model');
        $this->load->model('categories_model'); // Load the Models model for dropdown
    }

    public function index(){
        // Check if user session exists
        if($this->session->userdata('user')){
            // User is logged in, load the areas data
            $data['prresults'] = $this->castingmrs_model->get_prresults();
            $data['categories'] = $this->categories_model->get_categories();
            // Load the areas view with data
            
            $user = $this->session->userdata('user');
            extract($user);
           
            if($area_id =='19' || $area_id =='15'){

                $this->load->view('Castingmrs/index', $data);
                
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
        $data = $this->castingmrs_model->get_prresults();
        echo json_encode(['data' => $data]); // Wrap the data in 'data' key
    }
    public function get_prresult_details($id) {
        $prresult_details = $this->castingmrs_model->get_prresult_details($id);
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

    
        // Get the max id for the given serial and unique
        $this->db->select_max('id');
        $this->db->where('serial1', $serial);
        $this->db->where('unique1', $unique);
        $max_id_query = $this->db->get('pr_result');
        $max_id_row = $max_id_query->row();
        $max_id = $max_id_row->id;
    
        // Get the current quantity_lost and quantity
        $this->db->select('quantity, quantity_lost');
        $this->db->where('id', $max_id);
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
        $this->db->where('id', $max_id);
        $this->db->update('pr_result', array('quantity_lost' => $total_quantity_lost, 'disposition' => 'Scrap' , 'locked' => 0, 'area_status' => 0,'lot_status' => 0,));

        // Update sort_remarks
        $result = array(
            'sort_remarks' => $remarks,
            'disposition' => 'Scrap',
            'locked' => 0,
            'area_status' => 0,
            'lot_status' => 0,
            'date_sorted' => $updated_at,
            'sorted_by' => $userdata
        );

        $this->db->where('id', $id);
        $this->db->update('pr_result', $result);


       //update pr_unique to inactive
        $update_prunique = array( 

            'is_active' => 0,
            'created_at' => $updated_at,
            
        );

        $this->db->where('serial', $serial);
        $this->db->where('uniques', $unique);
        $this->db->update('pr_unique', $update_prunique);

        }else{

        // Update quantity_lost based on the max id
        $this->db->where('id', $max_id);
        $this->db->update('pr_result', array('quantity_lost' => $total_quantity_lost));

         // Update sort_remarks
         $result = array(
            'sort_remarks' => $remarks,
            'disposition' => 'For Verify',
            'date_sorted' => $updated_at,
            'sorted_by' => $userdata
        );
    
        $this->db->where('id', $id);
        $this->db->update('pr_result', $result);


        }
    
       
    
        echo json_encode(array('status' => 'success', 'message' => 'Data updated successfully'));
    }
    
}
    

        ?>