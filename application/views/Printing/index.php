<?php $this->load->view('components/header'); ?>
<?php $this->load->view('components/sidebar'); ?>



    <div class="header topnavcolor pb-6">
    <div class="container-fluid">
        <div class="header-body">
            <div class="row align-items-center py-4">
                <div class="col-lg-6 col-7">
                    <h6 class="h3 text-white d-inline-block mb-0">Printing Tables</h3>
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
            <di style="margin-left: 15px"><button class="btn btn-primary" ><a href="<?=site_url().'/ogisampling/'?>" style="color:white;text-decoration: none"> OGI Sampling Fresh Lot</a> </button>&nbsp;
            <button class="btn btn-success"><a href="<?=site_url().'/reogisampling/'?>" style="color:white;text-decoration: none"> OGI Re-Sampling Lot</a></button></di>

    <div style="padding: 15px">
                
                <table id='items_table' class="table table-bordered table-striped" style="width:100%" >
                    <thead style="height: 50px">
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">MFI Serial</th>
                            <th scope="col">Plate Serial</th>
                            <th scope="col">Model</th>
                            <th scope="col">Cavity</th>
                            <th scope="col">Created By</th>
                            <th scope="col">Date Combined</th>
                            <th scope="col">Quantity</th>
                           
                            <th scope="col">View</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Table body content goes here -->
                    </tbody>
                </table>
            </div>
            </div>

<?php $this->load->view("modals/printing") ?>
<?php $this->load->view('components/footer.php'); ?>
<script src='<?=base_url()?>assets/js/printing.js'></script>   



