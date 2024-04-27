<?php
$user = $this->session->userdata('user');
extract($user);
?> 

<?php $this->load->view('components/header'); ?>
<?php $this->load->view('components/sidebar'); ?>


    <div class="header topnavcolor pb-6">
    <div class="container-fluid">
        <div class="header-body">
            <div class="row align-items-center py-4">
                <div class="col-lg-6 col-7">
                    <h6 class="h3 text-white d-inline-block mb-0">Casting Lot Creation</h3>
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

        <div class="col">
            <div class="card">
                <!-- Card header -->
               
              
              <!-- Light table -->
              <div style="padding: 15px">
                <div class="modal-body">
                <form id="addItemForm" action="" method="post">
                    <div class="row">
                    <input type="hidden" class="form-control input-lg" id="userdata" name="userdata" value="<?php echo $fullname; ?>">
                    <div class="form-group col-md-6">
                        <input type="hidden" class="form-control input-lg" id="userdata" name="userdata" value="<?php echo $fullname; ?>">
                        <label for="serial1" class="control-label">Serial</label><span style="color:red">*</span>
                        <input type="number" class="form-control input-lg" id="serial1" name="serial1" placeholder="Enter Serial Here" required autocomplete="off">
                       
                    </div>
                        <div class="form-group col-md-6">
                            <label for="line" class="control-label">Casting Machine</label><span style="color:red">*</span>
                            <select type="text" class="form-control input-lg" id="line" name="line" placeholder="Enter description Name Here" style="height: 50px" required autocomplete="off" onchange="fillFields()">
                                <option value="">Select Machine</option>
                                <?php foreach ($lotdetails as $lotdetail): ?>
                                    <option value="<?php echo $lotdetail['machine']; ?>" data-model="<?php echo $lotdetail['model']; ?>" data-moldno="<?php echo $lotdetail['mold_no']; ?>" data-ingotno="<?php echo $lotdetail['ingot_no']; ?>" data-traysize="<?php echo $lotdetail['tray_size']; ?>" data-cavity="<?php echo $lotdetail['cavity']; ?>"> <?php echo $lotdetail['machine']; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="model" class="control-label">Model</label><span style="color:red">*</span>
                            <input type="text" class="form-control input-lg" id="model" name="model" placeholder="Select Casting Machine First" readonly autocomplete="off">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="mold_no" class="control-label">Tooling No</label><span style="color:red">*</span>
                            <input type="text" class="form-control input-lg" id="mold_no" name="mold_no" placeholder="Select Casting Machine First" readonly autocomplete="off">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="ingot_no" class="control-label">Ingot Number</label><span style="color:red">*</span>
                            <input type="text" class="form-control input-lg" id="ingot_no" name="ingot_no" placeholder="Select Casting Machine First" readonly autocomplete="off">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="tray_size" class="control-label">Tray Size</label><span style="color:red">*</span>
                            <input type="text" class="form-control input-lg" id="tray_size" name="tray_size" placeholder="Select Casting Machine First" readonly autocomplete="off">
                        </div>
                        <div class="form-group col-md-6">
                        <label for="cavity" class="control-label">Cavity Number</label><span style="color:red">*</span>
                        <select class="form-control input-lg" id="cavity" name="cavity" style="height: 50px" placeholder="Select Casting Machine First"  autocomplete="off">
                            <!-- Options will be dynamically filled by JavaScript -->
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                            <label for="tray_no" class="control-label">Tray Number</label><span style="color:red">*</span>
                            <input type="text" class="form-control input-lg" id="tray_no" name="tray_no" placeholder="Enter Tray Number Here"  autocomplete="off">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="quantity" class="control-label">Quanity</label><span style="color:red">*</span>
                            <input type="number" class="form-control input-lg" id="quantity" name="quantity" value="16"   autocomplete="off">
                        </div>
                    <div class="form-group col-md-6">
                            <label for="category" class="control-label">Category</label><span style="color:orange">&nbsp; &nbsp;(Optional)</span>
                            <select type="text" class="form-control input-lg" id="category" name="category" style="height: 50px" autocomplete="off">
                                <option value="">Select Category</option>
                                <!-- Loop through areas and populate options -->
                                <?php foreach ($categories as $category): ?>
                                    <option value="<?php echo $category['category']; ?>"><?php echo $category['category']; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>

                    
                    <div class="form-group col-md-12">
                            <input type="hidden" class="form-control input-lg" id="userdata" name="userdata" value="<?php echo $fullname; ?>">
                            <label for="area" class="control-label">Remarks</label><span style="color:orange">&nbsp; &nbsp;(Please Select Category First)</span>
                            <input type="text" class="form-control input-lg" id="remarks" name="remarks" placeholder="Enter Remarks Here"  autocomplete="off">
                        </div>
                    
                        
                        <div class="form-group col-md-12">
                      
                       <center> <button type="submit" class="btn btn-success" style="width: 200px" id="saveChangesBtn">Create Lot</button> </center>
                    </div>
                   
               
            </div>
        </div>
    </div>
</div>
</form>
 

<?php $this->load->view('components/footer.php'); ?>
<script src='<?=base_url()?>assets/js/lotcreation.js'></script>
