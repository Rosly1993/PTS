<?php $this->load->view('components/header'); ?>
<?php $this->load->view('components/sidebar'); ?>


    <div class="header topnavcolor pb-6">
    <div class="container-fluid">
        <div class="header-body">
            <div class="row align-items-center py-4">
                <div class="col-lg-6 col-7">
                    <h6 class="h3 text-white d-inline-block mb-0">Machining Scan-out</h3>
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
                <div style="margin-left: 15px"><button class="btn btn-primary" ><a href="<?=site_url().'/machiningins/'?>" style="color:white;text-decoration: none"> Machining In</a> </button>&nbsp;
            <button class="btn btn-success"><a href="<?=site_url().'/machiningouts/'?>" style="color:white;text-decoration: none"> Machining Out</a></button>&nbsp;
            <button class="btn btn-warning"><a href="<?=site_url().'/machiningsplits/'?>" style="color:white;text-decoration: none"> Machining Split Lot</a></button>
        </div>
                <!-- Card header -->
              
                <!-- Light table -->
                <div style="padding: 15px">
                <div class="modal-body">
                <form id="addItemForm" action="" method="post">
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="line" class="control-label">Machine Number</label><span style="color:red">*</span>
                        <select type="text" class="form-control input-lg" id="line" name="line" placeholder="Enter description Name Here" style="height: 50px"  autocomplete="off">
                            <option value="">All Lines</option>
                            <?php foreach ($lines as $line): ?>
                                <option value="<?php echo $line['lines']; ?>"> <?php echo $line['lines']; ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                   
                    <div class="form-group col-md-6">
                    <label for="btn" class="control-label">Filter Line</label><span style="color:red">*</span><br>
                         <button type="submit" class="btn btn-success" style="width: 200px; height: 45px" id="FilterBtn">Filter Line</button> 
                    </div>
                </div>
            </form>
 
           

<!-- Light table -->
<div style="padding: 15px">
                
                    <table id='items_table' class="table table-bordered table-striped" style="width: 100%" >
                        <thead style="height: 50px">
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Serial</th>
                                <th scope="col">Tray Number</th>
                                <th scope="col">Machine Number</th>
                                <th scope="col">Model</th>
                                <th scope="col">Cavity</th>
                                <th scope="col">Quanity</th>
                                <th scope="col">Date Create</th>
                                <th scope="col">Created By</th>
                                <th scope="col">Deb Plan</th>
                                <th scope="col">View Remarks</th>
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
                </div>
                </div>




        

<?php $this->load->view("modals/machining_out.php") ?>
<?php $this->load->view("modals/remarks.php") ?>
<?php $this->load->view('components/footer.php'); ?>      
<script src='<?=base_url()?>assets/js/machiningouts.js'></script>
       