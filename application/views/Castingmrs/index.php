<?php $this->load->view('components/header'); ?>
<?php $this->load->view('components/sidebar'); ?>


    <div class="header topnavcolor pb-6">
    <div class="container-fluid">
        <div class="header-body">
            <div class="row align-items-center py-4">
                <div class="col-lg-6 col-7">
                    <h6 class="h3 text-white d-inline-block mb-0">MRS For Sort Tables</h3>
                    <nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
                        <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
                            <li class="breadcrumb-item"><a href="<?=site_url().'/home'?>"><i class="fas fa-home"></i></a></li>
                           
                        </ol>
                    </nav>
                </div>
               
            </div>
        </div>
    </div>
</div>

<!-- Page content -->
<div class="container-fluid mt--6">
    <div class="row">
        <div class="col">
            <div class="card">
            <br>
            <div style="margin-left: 15px"><button class="btn btn-primary" ><a href="<?=site_url().'/castingmrs/'?>" style="color:white;text-decoration: none"> Casting MRS</a> </button>&nbsp;
            <button class="btn btn-success"><a href="<?=site_url().'/shotblastmrs/'?>" style="color:white;text-decoration: none"> Shotblast MRS</a></button></div>
                <!-- Card header -->
               
              
                <!-- Light table -->
                <div style="padding: 15px">
                
                    <table id='items_table' class="table table-bordered table-striped" style="width: 100%" >
                        <thead style="height: 50px">
                            <tr>
                                <th scope="col">ID</th>
                              
                                <th scope="col">Serial</th>
                                <th scope="col">Current Area</th>
                                <th scope="col">Casting Machine</th>
                                <th scope="col">Model</th>
                                <th scope="col">Cavity</th>
                                <th scope="col">Quanity</th>
                                <th scope="col">Locked By</th>
                                <th scope="col">Date Locked</th>
                                <th scope="col">QAN Number</th>
                                <th scope="col">NG Details</th>
                                <th scope="col">NG Remarks</th>
                                <th scope="col">Action</th>
                                <!-- <th>Action</th> -->
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Table body content goes here -->
                        </tbody>
                    </table>
                </div>
                </div>




        

<?php $this->load->view("modals/edit_castingmrs.php") ?>
<?php $this->load->view('components/footer.php'); ?>
<script src='<?=base_url()?>assets/js/castingmrs.js'></script> 
        
        


