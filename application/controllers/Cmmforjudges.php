<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Cmmforjudges extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->helper('url'); // Load URL Helper
        $this->load->model('cmmforjudges_model');
        $this->load->model('categories_model'); // Load the Models model for dropdown
        $this->load->model('lines_model');
    }

    public function index(){
        // Check if user session exists
        if($this->session->userdata('user')){
            // User is logged in, load the areas data
            $data['prresults'] = $this->cmmforjudges_model->get_prresults();
            $data['categories'] = $this->categories_model->get_categories();
            $data['lines'] = $this->lines_model->get_lines_by_area('5'); // Pass '2' as area_id
            // Load the areas view with data
           
            $user = $this->session->userdata('user');
            extract($user);
           
            if($area_id =='19' || $area_id =='18'){

                $this->load->view('Cmmforjudges/index', $data);
                
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
        $data = $this->cmmforjudges_model->get_prresults($line);
        echo json_encode(['data' => $data]); // Wrap the data in 'data' key
    }
    public function get_prresult_details($id) {
        $prresult_details = $this->cmmforjudges_model->get_prresult_details($id);
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
        $serial2 = $this->input->post('serial2');
        $unique2 = $this->input->post('unique2');
        // $line = $this->input->post('line');
        $ingot = $this->input->post('ingot');
        $traysize = $this->input->post('traysize');
        $trayno = $this->input->post('trayno');
        $category = $this->input->post('category');
        $remarks = $this->input->post('remarks');
        $debplan = $this->input->post('debplan');
        $userdata = $this->input->post('userdata');
        $new_serial = $this->input->post('new_serial');
        $judgement = $this->input->post('judgement');
        $ngqty = $this->input->post('ngqty');
        $updated_at = date('Y-m-d h:i');
        $new_quantity = $quantity-$quantitylost;
        $new_quantity_lost = $quantity_lost + $quantitylost;

    
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
        );

        $this->db->where('id', $id);
        $this->db->update('pr_result', $data);

         // update pr_UNIQUE to inactive mother serial
         $data_unique = array(
 
            'is_active' => 0,
            'created_at' => $updated_at
        );


        $this->db->where('serial', $serial);
        $this->db->where('uniques', $unique);
        $this->db->update('pr_unique', $data_unique);

         // update pr_UNIQUE to inactive for child serial
         $data_unique_child = array(
 
            'is_active' => 0,
            'created_at' => $updated_at
        );


        $this->db->where('serial', $serial2);
        $this->db->where('uniques', $unique2);
        $this->db->update('pr_unique', $data_unique_child);



         // update pr_history 
         $data_history = array(
 
            'qa_dimension_judgement' => $judgement,
            'qa_dimension_remarks' => $category.'--'.$remarks,
            'qa_dimension_date' => $updated_at,
            'qa_dimension_pic' => $userdata,
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
                'area_id' => 5,
                'is_active' => 1,
                'category' => $category,
                'remarks' => $remarks,
                'uniques' => $unique
                
               
            );
        $this->db->insert('pr_remarks', $data_pr_remarks);  }


        echo json_encode(array('status' => 'success', 'message' => 'Data updated successfully'));


        }else{
        
        //query to get the next procees/ area_id for machining is 5
        $query_newdata = $this->db->get_where('pr_result', ['serial1' => $serial, 'unique1' => $unique, 'id' => $id]);
            
        // Get the result as an array
        $result_newdata = $query_newdata->row_array();
        $nserial = $result_newdata['serial1'];
        $nunique = $result_newdata['unique1'];
        $nserial2 = $result_newdata['serial2'];
        $nunique2 = $result_newdata['unique2'];
        $nmodel = $result_newdata['model'];
        $ncavity = $result_newdata['cavity'];
        $nmold_no = $result_newdata['mold_no'];
        $ningot_lot = $result_newdata['ingot_lot'];
        $ntray_size = $result_newdata['tray_size'];
        $ntray_no = $result_newdata['tray_no'];
        $ndebplan = $result_newdata['debplan'];
        $nquantity = $result_newdata['quantity'];
        $nquantity_lost = $result_newdata['quantity_lost'];
        $total_qlost = $ngqty + $nquantity_lost;
        $newquan = $nquantity - $total_qlost;
   

        //query to get the next procees/ area_id  
        $query_getarea = $this->db->get_where('set_process', ['model' => $model, 'area_id' => 5]);
    
        // Get the result as an array
        $result_area = $query_getarea->row_array();
        $next_area = $result_area['next_id'];


        // update pr_result mother serial to scrap
        $data_insert = array(
                                        
            // 'disposition' => 'For Sort MRS',
            'serial1' => $nserial,
            'unique1' => $nunique,
            'serial2' => $nserial2,
            'unique2' => $nunique2,
            'model' => $nmodel,
            'cavity' => $ncavity,
            'mold_no' => $nmold_no,
            'ingot_lot' => $ningot_lot,
            'tray_size' => $ntray_size,
            'tray_no' => $ntray_no,
            'debplan' => $ndebplan,
            'quantity' => $newquan,
            'quantity_lost' => 0,
            'area_status' => 1,
            'lot_status' => 1,
            'area_id' => $next_area,
           
        
        );

      
        $this->db->insert('pr_result', $data_insert);


        // update pr_result mother serial to scrap
        $data = array(
                                
            'quantity_lost' => $total_qlost,
            'sample_by' => $userdata,
            'sample_date' => $updated_at,
            'disposition' => 'OK',
            'area_status' => 0,
            'lot_status' => 0,
           
        );

        $this->db->where('id', $id);
        $this->db->update('pr_result', $data);

       


        // update pr_history 
        $data_history = array(

            'qa_dimension_judgement' => $judgement,
            'qa_dimension_remarks' => 'Lot Accepted',
            'qa_dimension_date' => $updated_at,
            'qa_dimension_pic' => $userdata,
        );


        $this->db->where('serial', $serial);
        $this->db->where('unique', $unique);
        $this->db->update('pr_history', $data_history);


        //if remarks is not empty
      
            $data_pr_remarks = array(
                'serial' => $serial,
                'input_date' => $updated_at,
                'input_by' => $userdata,
                'area_id' => 5,
                'is_active' => 1,
                'category' => 'QA-Dimension',
                'remarks' => 'Lot Accepted',
                'uniques' => $unique
                
            
            );
        $this->db->insert('pr_remarks', $data_pr_remarks);  


        echo json_encode(array('status' => 'success', 'message' => 'Data updated successfully'));

                    
        }


        }
        
    }

    
    
    
?>