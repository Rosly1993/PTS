<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Splitlotjudgements extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->helper('url'); // Load URL Helper
        $this->load->model('splitlotjudgements_model');
        $this->load->model('categories_model'); // Load the Models model for dropdown
        $this->load->model('lines_model');
    }

    public function index(){
        // Check if user session exists
        if($this->session->userdata('user')){
            // User is logged in, load the areas data
            $data['prresults'] = $this->splitlotjudgements_model->get_prresults();
            $data['categories'] = $this->categories_model->get_categories();
            $data['lines'] = $this->lines_model->get_lines_by_area('5'); // Pass '2' as area_id
            // Load the areas view with data
            
            $user = $this->session->userdata('user');
            extract($user);
           
            if($area_id =='19' || $area_id =='22'){

                $this->load->view('Splitlotjudgements/index', $data);
                
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
        $data = $this->splitlotjudgements_model->get_prresults($line);
        echo json_encode(['data' => $data]); // Wrap the data in 'data' key
    }
    public function get_prresult_details($id) {
        $prresult_details = $this->splitlotjudgements_model->get_prresult_details($id);
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

    
        if($judgement =='Reject'){

        // update pr_result mother serial to scrap
        $data = array(
                        
          
            'sample_by' => $userdata,
            'sample_date' => $updated_at,
            'disposition_ipqc' => 'For Sort MRS',
            'disposition' => 'For Sort MRS',
           
        );

        $this->db->where('id', $id);
        $this->db->update('pr_result', $data);

          //if remarks is not empty
         
            $data_pr_remarks = array(
                'serial' => $serial,
                'input_date' => $updated_at,
                'input_by' => $userdata,
                'area_id' => 5,
                'is_active' => 1,
                'category' => 'IPQC Reject',
                'remarks' => 'For Re-Sort',
                'uniques' => $unique
                
               
            );
        $this->db->insert('pr_remarks', $data_pr_remarks);


        echo json_encode(array('status' => 'success', 'message' => 'Data updated successfully'));


        }else{

        // update pr_result mother serial to scrap
        $data = array(
                                
            // 'disposition' => 'For Sort MRS',
            'sample_by' => $userdata,
            'sample_date' => $updated_at,
            // 'quantity_lost' => $new_quantity_lost,
            'disposition_ipqc' => 'For QA-DIM Judge',
            'disposition' => 'For QA-DIM Judge',
           
        );

        $this->db->where('id', $id);
        $this->db->update('pr_result', $data);

       


        // update pr_history 
        $data_history = array(

            'ipqc_mc_judge' => 'Lot Accepted',
            // 'reason_split' => $remarks,
            'date_ipqc_mc' => $updated_at,
            'ipqc_pic' => $userdata,
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
                'area_id' => 5,
                'is_active' => 1,
                'category' => 'Machining IPQC',
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