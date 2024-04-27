<?php $this->load->view('components/header'); ?>
<?php $this->load->view('components/sidebar'); ?>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <div class="header topnavcolor pb-6">
    <div class="container-fluid">
        <div class="header-body">
            <div class="row align-items-center py-4">
                <div class="col-lg-6 col-7">
                    <h6 class="h3 text-white d-inline-block mb-0">Inventory Tables</h3>
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
                <!-- Card header -->
                <br>
                <div><button class="btn btn-success"  style="margin-left: 15px"><a href="<?=site_url().'/home'?>" style="color:white;text-decoration: none">Active Serial Finder</a> </button>
                <button class="btn btn-info"  style="margin-left: 15px"><a href="<?=site_url().'/history/'?>" style="color:white;text-decoration: none">Serial History</a> </button>
                <button class="btn btn-warning"  style="margin-left: 15px"><a href="<?=site_url().'/inventory/'?>" style="color:white;text-decoration: none">Inventory</a> </button>
                </div><br><br> &nbsp;
                    <!-- Card header -->
                    <center><h3>Inventory Per Area</h3></center>
                <div class="table-container" style="width: 100%; margin-left: 15px">
                <!-- <center><h6>Models</h6></center> -->
                <div style="width: 98%; margin-left: 15px"><canvas id="myChart" width="400" height="100"></canvas></div>
                <center><h6>Areas</h6></center>
                <br><br>      
                </div>
              
                <!-- Light table -->
                <div style="padding: 15px">
                
                    <table id='items_table' class="table table-bordered table-striped" style="width: 100%" >
                        <thead style="height: 50px">
                            <tr>
                                <th scope="col">Area ID</th>
                                <th scope="col">Area Name</th>
                                <th scope="col">Model</th>
                                <th scope="col">Actual Quantity</th>
                               
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Table body content goes here -->
                        </tbody>
                    </table>
                    
                </div>
                </div>



           




<?php $this->load->view('components/footer.php'); ?>      
<script src='<?=base_url()?>assets/js/inventory.js'></script>
       