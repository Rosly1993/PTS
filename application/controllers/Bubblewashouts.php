<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Bubblewashouts extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->helper('url'); // Load URL Helper
        $this->load->model('bubblewashouts_model');
        $this->load->model('models_model'); // Load the Models model for dropdown
        $this->load->model('molddetails_model'); // Load the Models model for dropdown
        $this->load->model('lines_model');
    }

    public function index(){
        // Check if user session exists
        if($this->session->userdata('user')){
            // User is logged in, load the areas data
            $data['castinglocks'] = $this->bubblewashouts_model->get_castinglocks();
            $data['models'] = $this->models_model->get_models(); // Fetch models data
            $data['molddetails'] = $this->molddetails_model->get_molddetails();

            $data['lines'] = $this->lines_model->get_lines_by_area('6');
            // Load the areas view with data
           
            
            $user = $this->session->userdata('user');
            extract($user);
           
            if($area_id =='19' || $area_id =='6'){

                $this->load->view('Bubblewashouts/index', $data);
                
            }else{
                $this->load->view('errors/index.html');
            }
        }
        else{
            // User is not logged in, redirect to login page
            redirect('login_page');
        }
    }
    public function get_castinglocks() {
        // Fetch filtered data from the model
        $data = $this->bubblewashouts_model->get_castinglocks(); // No need to pass $line as an argument
        echo json_encode(['data' => $data]);
    }
    
    
    
    

    public function get_model_details($id) {
        $model_details = $this->models_model->get_model_details($id);
        echo json_encode(['model_details' => $model_details]);
    }    

    public function delete_records() {
        $user = $this->session->userdata('user');
        extract($user);
        $ids = $this->input->post('id');
        $locked_remarks = $this->input->post('locked_remarks');
        $locked_date = date('Y-m-d H:i:s');
    
        // Loop through each ID
        foreach ($ids as $id) {
            // Fetch the data from pr_result
            $result = $this->db->get_where('pr_result', array('id' => $id))->row();
    
            // Update pr_result with the fetched data
            $result_data = array(
                'area_status' => 0,
                'lot_status' => 0,
                'output_by' => $fullname,
                'output_date' => $locked_date
                // Add more fields as necessary
            );
            $this->db->where('id', $id);
            $this->db->update('pr_result', $result_data);
    
            // Update pr_history with the fetched data
            $history_data = array(
                'bubblewashout_date' => $locked_date,
                'bubblewashout_pic' => $fullname
                // Add more fields as necessary
            );
            $this->db->where('serial', $result->serial1);
            $this->db->where('unique', $result->unique1);
            $this->db->update('pr_history', $history_data);




          
            // Insert locked_remarks into pr_remarks if not null or empty
            if (!empty($locked_remarks)) {
                $remarks_data = array(
                    'serial' => $result->serial1,
                    'uniques' => $result->unique1,
                    'remarks' => $locked_remarks,
                    'input_date' => $locked_date,
                    'input_by' => $fullname,
                    'category' => 'Bubblewash',
                    'area_id' => 6,
                    'is_active' => 1
                    // Add more fields as necessary
                );
                $this->db->insert('pr_remarks', $remarks_data);
            }
            // Fetch the next_id from set_process
            $next_id_result = $this->db->get_where('set_process', array('area_id' => '6','model' => $result->model))->row();
            $next_id = $next_id_result->next_id;

            // $this->db->insert('pr_result', array('area_id' => $next_id, 'serial1' => $result->serial1,'unique1' => $result->unique1,'model' => $result->model,'cavity' => $result->cavity,'mold_no' => $result->mold_no,'ingot_no' => $result->ingot_no,'tray_size' => $result->tray_size,'debplan' => $result->debplan,'quantity' => $result->quantity,'quantity_lost' => $result->quantity_lost,'area_status' => 1,'lot_status' => 1 ));
            $this->db->insert('pr_result', array('area_id' => $next_id, 'serial1' => $result->serial1,'unique1' => $result->unique1, 'serial2' => $result->serial2,'unique2' => $result->unique2,'model' => $result->model,'cavity' => $result->cavity,'mold_no' => $result->mold_no,'ingot_lot' => $result->ingot_lot,'tray_size' => $result->tray_size,'tray_no' => $result->tray_no,'debplan' => $result->debplan,'quantity' => $result->quantity,'quantity_lost' => $result->quantity_lost,'area_status' => 1,'lot_status' => 1));
        }
        
        echo "success";
    }
    
}
        

        ?>