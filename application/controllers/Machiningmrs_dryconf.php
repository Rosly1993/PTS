<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Machiningmrs_dryconf extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->helper('url'); // Load URL Helper
        $this->load->model('machiningmrs_dryconf_model');
        $this->load->model('categories_model'); // Load the Models model for dropdown
        $this->load->model('lines_model');
    }

    public function index(){
        // Check if user session exists
        if($this->session->userdata('user')){
            // User is logged in, load the areas data
            $data['prresults'] = $this->machiningmrs_dryconf_model->get_prresults();
            $data['categories'] = $this->categories_model->get_categories();
            $data['lines'] = $this->lines_model->get_lines_by_area('5'); // Pass '2' as area_id
            // Load the areas view with data
           
            $user = $this->session->userdata('user');
            extract($user);
           
            if($area_id =='19' || $area_id =='22'){

                $this->load->view('Machiningmrs_dryconf/index', $data);
                
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
        $data = $this->machiningmrs_dryconf_model->get_prresults($line);
        echo json_encode(['data' => $data]); // Wrap the data in 'data' key
    }
    public function get_prresult_details($id) {
        $prresult_details = $this->machiningmrs_dryconf_model->get_prresult_details($id);
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
        // $line = $this->input->post('line');
        $ingot = $this->input->post('ingot');
        $traysize = $this->input->post('traysize');
        $trayno = $this->input->post('trayno');
        $ngqty = $this->input->post('ngqty');
        $category = $this->input->post('category');
        $remarks = $this->input->post('remarks');
        $debplan = $this->input->post('debplan');
        $userdata = $this->input->post('userdata');
        $new_serial = $this->input->post('new_serial');
        $judgement = $this->input->post('judgement');
        $updated_at = date('Y-m-d h:i');
        $new_quantity = $quantity-$quantitylost;
        $new_quantity_lost = $quantity_lost + $ngqty;


        // Get the max id for the given serial and unique
        $this->db->select_max('id');
        $this->db->where('serial1', $serial);
        $this->db->where('unique1', $unique);
        $max_id_query = $this->db->get('pr_result');
        $max_id_row = $max_id_query->row();
        $max_id = $max_id_row->id;

        
    
       


    
        if($judgement =='Scrap'){

        // update pr_result mother serial to scrap
        $data = array(
                        
            'disposition' => 'Scrap',
            'sample_by' => $userdata,
            'sample_date' => $updated_at,
            'disposition_ipqc' => 'Scrap',
            'area_status' => 0,
            'lot_status' => 0,
            'locked' => 0,
            'mrsdry_qa_remarks' => 'Lot Scrap - ' . $userdata,
            'mrsdry_qa_date' => $updated_at,
            
        );

        $this->db->where('id', $id);
        $this->db->update('pr_result', $data);

        // update pr_result mother serial to scrap max id 
        $data_max = array(
                        
            'disposition' => 'Scrap',
            'sample_by' => $userdata,
            'sample_date' => $updated_at,
            'disposition_ipqc' => 'Scrap',
            'area_status' => 0,
            'lot_status' => 0,
            'locked' => 0,
            'mrsdry_qa_remarks' => 'Lot Scrap - ' . $userdata,
            'mrsdry_qa_date' => $updated_at,
        );

        $this->db->where('id', $max_id);
        $this->db->update('pr_result', $data_max);



         // update pr_UNIQUE to inactive
         $data_unique = array(
 
            'is_active' => 0,
            'created_at' => $updated_at
        );


        $this->db->where('serial', $serial);
        $this->db->where('uniques', $unique);
        $this->db->update('pr_unique', $data_unique);


         // update pr_history 
         $data_history = array(
 
            'mrsdry_qa_status' => 'Lot Scrap - ' . $userdata,
            'mrs_dryqa_date' => $updated_at,
            'mrs_dryqa_pic' => $userdata,
        );


        $this->db->where('serial', $serial);
        $this->db->where('unique', $unique);
        $this->db->update('pr_history', $data_history);


          //if remarks is not empty
          if (!empty($remarks)) {
            $data_pr_remarks = array(
                'serial' => $serial,
                'input_date' => $updated_at,
                'input_by' => $userdata,
                'area_id' => 11,
                'is_active' => 1,
                'category' => $category,
                'remarks' => $remarks,
                'uniques' => $unique
                
               
            );
        $this->db->insert('pr_remarks', $data_pr_remarks);  }


        echo json_encode(array('status' => 'success', 'message' => 'Data updated successfully'));


        }else{

        // update pr_result mother serial to scrap
        $data = array(
                                
            // 'disposition' => 'For Sort MRS',
            // 'sample_by' => $userdata,
            'mrsdry_qa_remarks' => 'Lot Accepted - ' . $userdata,
            'mrsdry_qa_date' => $updated_at,
            'disposition_ipqc' => 'OK',
          
           
        );

        $this->db->where('id', $id);
        $this->db->update('pr_result', $data);


         // update pr_result mother serial to smax data
         $data_max = array(
                                
            // 'disposition' => 'For Sort MRS',
            // 'sample_by' => $userdata,
            'mrsdry_qa_remarks' => 'Lot Accepted - ' . $userdata,
            'mrsdry_qa_date' => $updated_at,
            'quantity_lost' => $ngqty,
            'disposition_ipqc' => 'OK',
            // 'disposition' => 'For Confirm MRS DRY',
           
        );

        $this->db->where('id', $max_id);
        $this->db->update('pr_result', $data_max);


       


        // update pr_history 
        $data_history = array(

            'mrsdry_qa_status' => 'Lot Accepted - ' . $userdata,
            'mrs_dryqa_date' => $updated_at,
            'mrs_dryqa_pic' => $userdata,
        );


        $this->db->where('serial', $serial);
        $this->db->where('unique', $unique);
        $this->db->update('pr_history', $data_history);


        //if remarks is not empty
        // if (!empty($remarks)) {
            $data_pr_remarks = array(
                'serial' => $serial,
                'input_date' => $updated_at,
                'input_by' => $userdata,
                'area_id' => 11,
                'is_active' => 1,
                'category' => 'Machining MRS-DRY Confirmation',
                'remarks' => 'Lot Accepted',
                'uniques' => $unique
                
            
            );
        $this->db->insert('pr_remarks', $data_pr_remarks); 
    //  }


        echo json_encode(array('status' => 'success', 'message' => 'Data updated successfully'));

                    
        }


        }
        
    }

    
    
    
?>