<?php $this->load->view('components/header'); ?>
<?php $this->load->view('components/sidebar'); ?>


    <div class="header topnavcolor pb-6">
    <div class="container-fluid">
        <div class="header-body">
            <div class="row align-items-center py-4">
                <div class="col-lg-6 col-7">
                    <h6 class="h3 text-white d-inline-block mb-0">Serial History</h3>
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
        <div class="col-12">
            <div class="card">
                <!-- Card header -->
                <br>
                <div><button class="btn btn-success"  style="margin-left: 15px"><a href="<?=site_url().'/home'?>" style="color:white;text-decoration: none">Active Serial Finder</a> </button>
                <button class="btn btn-info"  style="margin-left: 15px"><a href="<?=site_url().'/history/'?>" style="color:white;text-decoration: none">Serial History</a> </button>
                <button class="btn btn-warning"  style="margin-left: 15px"><a href="<?=site_url().'/inventory/'?>" style="color:white;text-decoration: none">Inventory</a> </button>
                </div>&nbsp;
                    <!-- Card header -->
               
                
              
                <!-- Light table -->
                <div >
                <div class="modal-body">
                <form id="addItemForm" action="" method="post">
                <div class="row">
                    <div class="form-group col-md-6">

                        <input type="text" class="form-control input-lg" id="serial" name="serial" placeholder="Enter description Name Here" style="height: 50px"  autocomplete="off">
                            
                    </div>
                    <div class="form-group col-md-6">
                   
                         <button type="submit" class="btn btn-info" style="width: 200px; height: 47px" id="FilterBtn">Filter</button> 
                    </div>
                </div>
            </form>
 
           

<!-- Light table -->
<div >
                
                    <table id='items_table' class="table table-bordered table-striped" style="width: 100%" >
                        <thead style="height: 50px">
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Serial</th>
                                <th scope="col">Unique ID</th>
                                <th scope="col">Model</th>
                                <th scope="col">Cavity</th>
                                <th scope="col">Area Status</th>
                                <th scope="col">Lot Status</th>
                                <th scope="col">Remarks</th>
                                <th scope="col">History</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Table body content goes here -->
                        </tbody>
                    </table>
                </div>
                </div>




        


<?php $this->load->view('modals/remarks.php'); ?>
<?php $this->load->view('modals/history.php'); ?>
<?php $this->load->view('components/footer.php'); ?>      
<script src='<?=base_url()?>assets/js/history.js'></script>
       