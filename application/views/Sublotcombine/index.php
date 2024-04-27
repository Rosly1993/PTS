<?php $this->load->view('components/header'); ?>
<?php $this->load->view('components/sidebar'); ?>


    <div class="header topnavcolor pb-6">
    <div class="container-fluid">
        <div class="header-body">
            <div class="row align-items-center py-4">
                <div class="col-lg-6 col-7">
                    <h6 class="h3 text-white d-inline-block mb-0">Sublot Combine Tables</h3>
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
                <!-- Card header -->
            <div style="margin-left: 15px"><button class="btn btn-primary" ><a href="<?=site_url().'/sublotcombine/'?>" style="color:white;text-decoration: none"> Sub-Lot Combine</a> </button></div>
            
            
            <br>
                <!-- Card header -->
               
   <form id="employeeForm">
    <div class="form-group col-6">

        <input type="text" name="id_number" class="form-control input-lg" placeholder="Enter SubLot Serial Here"><br>
        <button type="submit"   class="btn btn-primary" id="saveChangesBtn">Add Data</button>
    </div>



<!-- Light table -->
<div style="padding: 15px">
    <table id='items_table' class="table table-bordered table-striped" style="width:100%">
        <thead style="height: 50px">
            <tr>
               
                <th scope="col">Unique ID</th>
                <th scope="col">Sub Lot Serial</th>
                <th scope="col">Model</th>
                <th scope="col">Cavity</th>
                <th scope="col">Quantity</th>
                <th scope="col">Remove Item</th>
            </tr>
        </thead>
        <tbody>
            <!-- Table body content goes here -->
        </tbody>
    </table><br>
    <button id="save_appenddata_btn" class="btn btn-success">Save Data</button>
    </div>
  </div>
</form>

<?php $this->load->view('components/footer.php'); ?>


<script src='<?=base_url()?>assets/js/sublotcombine.js'></script>   



