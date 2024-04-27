<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pruniques extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->helper('url'); // Load URL Helper
        $this->load->model('pruniques_model');
    }

    
    public function get_pruniques() {
        $serial = $this->input->post('serial1'); // Get the serial value from POST data
        $data = $this->pruniques_model->get_pruniques($serial);
    
        // Check if serial exists
        $exists = false;
        foreach ($data as $row) {
            if ($row['serial'] == $serial) {
                $exists = true;
                break;
            }
        }
    
        echo $exists ? 'exists' : 'not exists';
    }
    

   
    }
        

        ?>