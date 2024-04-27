<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Machiningsplits extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->helper('url'); // Load URL Helper
        $this->load->model('machiningsplits_model');
        $this->load->model('categories_model'); // Load the Models model for dropdown
        $this->load->model('lines_model');
    }

    public function index(){
        // Check if user session exists
        if($this->session->userdata('user')){
            // User is logged in, load the areas data
            $data['prresults'] = $this->machiningsplits_model->get_prresults();
            $data['categories'] = $this->categories_model->get_categories();
            $data['lines'] = $this->lines_model->get_lines_by_area('5'); // Pass '2' as area_id
            // Load the areas view with data
            
            $user = $this->session->userdata('user');
            extract($user);
           
            if($area_id =='19' || $area_id =='5'){

                $this->load->view('Machiningsplits/index', $data);
                
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
        $data = $this->machiningsplits_model->get_prresults($line);
        echo json_encode(['data' => $data]); // Wrap the data in 'data' key
    }
    public function get_prresult_details($id) {
        $prresult_details = $this->machiningsplits_model->get_prresult_details($id);
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
        $line = $this->input->post('line');
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
      
                
            // update pr_result mother serial
            $data = array(
                
                'quantity_lost' => $new_quantity_lost
            );
    
            $this->db->where('id', $id);
            $this->db->update('pr_result', $data);

           
            // insert  pr_result lot split
             $data = array(
                
                'serial1' => $new_serial,
                'area_id' => 5,
                'line' => $line,
                'model' => $model,
                'cavity' => $cavity,
                'mold_no' => $mold,
                'ingot_lot' => $ingot,
                'tray_no' => $trayno,
                'tray_size' => $traysize,
                'debplan' => $debplan,
                'quantity_lost' => 0,
                'area_status' => 0,
                'lot_status' => 0,
                'input_date' => $updated_at,
                'input_by' => $userdata,
                'unique1' => $result->uniques + 1,
                'quantity' => $quantitylost,
                'disposition_ipqc' => 'For Tagging',
                'disposition' => 'For Tagging',
                'serial_lotsplit' => $serial,
                'unique_lotsplit' => $unique
            );
    
            
            $this->db->insert('pr_result', $data);
            
        // insert  history for split lot
        //query to get the next procees/ area_id for machining is 5
        $query_history = $this->db->get_where('pr_history', ['serial' => $serial, 'unique' => $unique]);
            
        // Get the result as an array
        $result_history = $query_history->row_array();
        $hserial = $result_history['serial'];
        $hunique = $result_history['unique'];
        $hmodel = $result_history['model'];
        $hcavity = $result_history['cavity'];
        $hmold_no = $result_history['mold_no'];
        $casting_machine = $result_history['casting_machine'];
        $trimming_date = $result_history['trimming_date'];
        $trimmer = $result_history['trimmer'];
        $med_sampling_date = $result_history['med_sampling_date'];
        $med_sampler = $result_history['med_sampler'];
        $deburring_line = $result_history['deburring_line'];
        $deburring_pic = $result_history['deburring_pic'];
        $deburring_pic_out = $result_history['deburring_pic_out'];
        $date_deburring_in = $result_history['date_deburring_in'];
        $date_deburring_out = $result_history['date_deburring_out'];
        $shotblast_line = $result_history['shotblast_line'];
        $date_shotblast_in = $result_history['date_shotblast_in'];
        $date_shotblast_out = $result_history['date_shotblast_out'];
        $shotblast_pic = $result_history['shotblast_pic'];
        $shotblastqa_lock_details = $result_history['shotblastqa_lock_details'];
        $shotblastqa_lock_date = $result_history['shotblastqa_lock_date'];
        $shotblastqa_lock_by = $result_history['shotblastqa_lock_by'];
        $shotblastqa_unlock_by = $result_history['shotblastqa_unlock_by'];
        $shotblastqa_unlock_date = $result_history['shotblastqa_unlock_date'];
        $shotblastmrs_remarks = $result_history['shotblastmrs_remarks'];
        $shotblastmrs_date = $result_history['shotblastmrs_date'];
        $shotblastmrs_by = $result_history['shotblastmrs_by'];
        $shotblast_pic_out = $result_history['shotblast_pic_out'];
        $annealing_oven = $result_history['annealing_oven'];
        $annealing_date_in = $result_history['annealing_date_in'];
        $annealing_pic_in = $result_history['annealing_pic_in'];
        $annealing_pic_out = $result_history['annealing_pic_out'];
        $annealing_date_out = $result_history['annealing_date_out'];
        $machining_date_in = $result_history['machining_date_in'];
        $machining_pic_in = $result_history['machining_pic_in'];
        $machining_line = $result_history['machining_line'];
       


            $data_pr_history = array(
                
                'serial' => $new_serial,
                'unique'=> $result->uniques + 1,
                'model'=> $hmodel,
                'cavity'=> $hcavity,
                'mold_no'=> $hmold_no,
                'from_serial'=> $hserial,
                'from_unique'=> $hunique,
                'date_split' => $updated_at,
                'split_by' => $userdata,
                'quantity' => $quantitylost,
                'casting_machine' => $casting_machine,
                'trimming_date' => $trimming_date,
                'trimmer' => $trimmer,
                'med_sampling_date' => $med_sampling_date,
                'med_sampler' => $med_sampler,
                'deburring_line' => $deburring_line,
                'deburring_pic' => $deburring_pic,
                'date_deburring_in' => $date_deburring_in,
                'date_deburring_out' => $date_deburring_out,
                'deburring_pic_out' => $deburring_pic_out,
                'shotblast_line' => $shotblast_line,
                'date_shotblast_in' => $date_shotblast_in,
                'date_shotblast_out' => $date_shotblast_out,
                'shotblast_pic' => $shotblast_pic,
                'shotblastqa_lock_details' => $shotblastqa_lock_details,
                'shotblastqa_lock_date' => $shotblastqa_lock_date,
                'shotblastqa_lock_by' => $shotblastqa_lock_by,
                'shotblastqa_unlock_by' => $shotblastqa_unlock_by,
                'shotblastqa_unlock_date' => $shotblastqa_unlock_date,
                'shotblastmrs_remarks' => $shotblastmrs_remarks,
                'shotblastmrs_date' => $shotblastmrs_date,
                'shotblastmrs_by' => $shotblastmrs_by,
                'shotblast_pic_out' => $shotblast_pic_out,
                'annealing_oven' => $annealing_oven,
                'annealing_date_in' => $annealing_date_in,
                'annealing_pic_in' => $annealing_pic_in,
                'annealing_pic_out' => $annealing_pic_out,
                'annealing_date_out' => $annealing_date_out,
                'machining_date_in' => $machining_date_in,
                'machining_pic_in' => $machining_pic_in,
                'machining_line' => $machining_line,

               
            );
         
            $this->db->insert('pr_history', $data_pr_history);


          //if remarks is not empty
            if (!empty($remarks)) {
                $data_pr_remarks = array(
                    'serial' => $new_serial,
                    'input_date' => $updated_at,
                    'input_by' => $userdata,
                    'area_id' => 5,
                    'is_active' => 1,
                    'category' => $category,
                    'remarks' => $remarks,
                    'uniques' => 1
                    
                   
                );
            $this->db->insert('pr_remarks', $data_pr_remarks);  }



            echo json_encode(array('status' => 'success', 'message' => 'Data updated successfully'));

            }else{

            echo json_encode(array('status' => 'error', 'message' => 'Active Serial'));

            }
    
      

           
           

        }else{

          //insert data for new serial
            $this->db->insert('pr_unique', array('serial' => $new_serial, 'is_active' => 1, 'uniques' => 1, 'created_at' => $updated_at));

            

             // update pr_result mother serial
             $data = array(
                
                'quantity_lost' => $new_quantity_lost
            );
    
            $this->db->where('id', $id);
            $this->db->update('pr_result', $data);


             // insert  pr_result lot split
             $data = array(
                
                'serial1' => $new_serial,
                'area_id' => 5,
                'line' => $line,
                'model' => $model,
                'cavity' => $cavity,
                'mold_no' => $mold,
                'ingot_lot' => $ingot,
                'tray_no' => $trayno,
                'tray_size' => $traysize,
                'debplan' => $debplan,
                'quantity_lost' => 0,
                'area_status' => 0,
                'lot_status' => 0,
                'input_date' => $updated_at,
                'input_by' => $userdata,
                'unique1' =>  1,
                'quantity' => $quantitylost,
                'disposition_ipqc' => 'For Tagging',
                'disposition' => 'For Tagging',
                'serial_lotsplit' => $serial,
                'unique_lotsplit' => $unique
            );
    
            
            $this->db->insert('pr_result', $data);

            
        // insert  history for split lot
        //query to get the next procees/ area_id for machining is 5
        $query_history = $this->db->get_where('pr_history', ['serial' => $serial, 'unique' => $unique]);
            
        // Get the result as an array
        $result_history = $query_history->row_array();
        $hserial = $result_history['serial'];
        $hunique = $result_history['unique'];
        $hmodel = $result_history['model'];
        $hcavity = $result_history['cavity'];
        $hmold_no = $result_history['mold_no'];
        $casting_machine = $result_history['casting_machine'];
        $trimming_date = $result_history['trimming_date'];
        $trimmer = $result_history['trimmer'];
        $med_sampling_date = $result_history['med_sampling_date'];
        $med_sampler = $result_history['med_sampler'];
        $deburring_line = $result_history['deburring_line'];
        $deburring_pic = $result_history['deburring_pic'];
        $deburring_pic_out = $result_history['deburring_pic_out'];
        $date_deburring_in = $result_history['date_deburring_in'];
        $date_deburring_out = $result_history['date_deburring_out'];
        $shotblast_line = $result_history['shotblast_line'];
        $date_shotblast_in = $result_history['date_shotblast_in'];
        $date_shotblast_out = $result_history['date_shotblast_out'];
        $shotblast_pic = $result_history['shotblast_pic'];
        $shotblastqa_lock_details = $result_history['shotblastqa_lock_details'];
        $shotblastqa_lock_date = $result_history['shotblastqa_lock_date'];
        $shotblastqa_lock_by = $result_history['shotblastqa_lock_by'];
        $shotblastqa_unlock_by = $result_history['shotblastqa_unlock_by'];
        $shotblastqa_unlock_date = $result_history['shotblastqa_unlock_date'];
        $shotblastmrs_remarks = $result_history['shotblastmrs_remarks'];
        $shotblastmrs_date = $result_history['shotblastmrs_date'];
        $shotblastmrs_by = $result_history['shotblastmrs_by'];
        $shotblast_pic_out = $result_history['shotblast_pic_out'];
        $annealing_oven = $result_history['annealing_oven'];
        $annealing_date_in = $result_history['annealing_date_in'];
        $annealing_pic_in = $result_history['annealing_pic_in'];
        $annealing_pic_out = $result_history['annealing_pic_out'];
        $annealing_date_out = $result_history['annealing_date_out'];
        $machining_date_in = $result_history['machining_date_in'];
        $machining_pic_in = $result_history['machining_pic_in'];
        $machining_line = $result_history['machining_line'];
       


            $data_pr_history = array(
                
                'serial' => $new_serial,
                'unique'=>  1,
                'model'=> $hmodel,
                'cavity'=> $hcavity,
                'mold_no'=> $hmold_no,
                'from_serial'=> $hserial,
                'from_unique'=> $hunique,
                'date_split' => $updated_at,
                'split_by' => $userdata,
                'quantity' => $quantitylost,
                'casting_machine' => $casting_machine,
                'trimming_date' => $trimming_date,
                'trimmer' => $trimmer,
                'med_sampling_date' => $med_sampling_date,
                'med_sampler' => $med_sampler,
                'deburring_line' => $deburring_line,
                'deburring_pic' => $deburring_pic,
                'date_deburring_in' => $date_deburring_in,
                'date_deburring_out' => $date_deburring_out,
                'deburring_pic_out' => $deburring_pic_out,
                'shotblast_line' => $shotblast_line,
                'date_shotblast_in' => $date_shotblast_in,
                'date_shotblast_out' => $date_shotblast_out,
                'shotblast_pic' => $shotblast_pic,
                'shotblastqa_lock_details' => $shotblastqa_lock_details,
                'shotblastqa_lock_date' => $shotblastqa_lock_date,
                'shotblastqa_lock_by' => $shotblastqa_lock_by,
                'shotblastqa_unlock_by' => $shotblastqa_unlock_by,
                'shotblastqa_unlock_date' => $shotblastqa_unlock_date,
                'shotblastmrs_remarks' => $shotblastmrs_remarks,
                'shotblastmrs_date' => $shotblastmrs_date,
                'shotblastmrs_by' => $shotblastmrs_by,
                'shotblast_pic_out' => $shotblast_pic_out,
                'annealing_oven' => $annealing_oven,
                'annealing_date_in' => $annealing_date_in,
                'annealing_pic_in' => $annealing_pic_in,
                'annealing_pic_out' => $annealing_pic_out,
                'annealing_date_out' => $annealing_date_out,
                'machining_date_in' => $machining_date_in,
                'machining_line' => $machining_line,
                'machining_pic_in' => $machining_pic_in,
               
            );
         
            $this->db->insert('pr_history', $data_pr_history);
           // Specify the conditions for the update
      


          //if remarks is not empty
            if (!empty($remarks)) {
                $data_pr_remarks = array(
                    'serial' => $new_serial,
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