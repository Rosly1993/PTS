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
                    <h6 class="h3 text-white d-inline-block mb-0">Casting IPQE Lot Unlocking Tables</h3>
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
            <div class="card"><br>
                <!-- Card header -->
            <di style="margin-left: 15px"><button class="btn btn-primary" ><a href="<?=site_url().'/castinglocks/'?>" style="color:white;text-decoration: none"> Casting Lock</a> </button>&nbsp;
            <button class="btn btn-success"><a href="<?=site_url().'/castingunlocks/'?>" style="color:white;text-decoration: none"> Casting Unlock</a></button></di>
            <form method="POST" action="">
                <div class="form-row" style="padding: 15px">
                <div class="form-group col-md-4">
                <select type="text" class="form-control input-lg" id="line" name="line" placeholder="Enter description Name Here" required autocomplete="off">
                <option value="">Select Casting Machine...</option>
                <!-- Loop through areas and populate options -->
                <?php foreach ($lines as $line): ?>
                    <option value="<?php echo $line['lines']; ?>"><?php echo $line['lines']; ?></option>
                <?php endforeach; ?>
            </select>
            </div>
            <div class="form-group col-md-4">
            <select type="text" class="form-control input-lg" id="model" name="model" placeholder="Enter description Name Here" required autocomplete="off">
                <option value="">Select Model...</option>
                <?php foreach ($models as $model): ?>
                <option value="<?php echo $model['model']; ?>"><?php echo $model['model']; ?></option>
                <?php endforeach; ?>
            </select>
            </div>

            <div class="form-group col-md-4">
            <select type="text" class="form-control input-lg" id="mold_no" name="mold_no" placeholder="Enter Mold No Here" required autocomplete="off">
                <option value="">Select Tooling Number...</option>
            </select>
            </div>
            </div>

            <div class="form-row" style="padding: 15px">
            <div class="form-group col-md-4">
            <select type="text" style="height: 50px" class="form-control input-lg" id="cavity" name="cavity" placeholder="Enter Location Here" required autocomplete="off">
                <option value="">Select Cavity Number...</option>
            </select>
            </div>
            <div class="form-group col-md-4">
            <input type="datetime-local" class="form-control input-lg" id="date_from" name="date_from" placeholder="Enter Mold No Here" required autocomplete="off">
                
            </div>
            <div class="form-group col-md-4">
          
            <input type="datetime-local" class="form-control input-lg" id="date_to" name="date_to" placeholder="Enter Mold No Here" required autocomplete="off">
                
            </div><br>

         <div class="form-group col-md-12" ><button  style="float: right" type="submit" class="btn btn-success" id="filterBtn">Filter Data</button></div>


            </div>
            </form>
                <!-- Light table -->
                <div style="padding: 15px">

               
                <form id="lockForm" method="POST" action="">
                
                    <table id='items_table' class="table table-bordered table-striped" style="width: 100%" >
                        <thead style="height: 50px">
                            <tr>
                                <th scope="col">
                                    <input type="checkbox" id="checkAll" class="check-all" style="width: 20px;height: 20px;"> All 
                                </th>
                                <th scope="col">ID</th>
                                <th scope="col">Serial</th>
                                <th scope="col">Model</th>
                                <th scope="col">Tooling Number</th>
                                <th scope="col">Cavity Number</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Date Cast</th>
                                <th scope="col">Casting Machine</th>
                                <th scope="col">Date Locked</th>
                                <th scope="col">Remarks</th>
                                <th scope="col">NG Details</th>
                                <th scope="col">Locked By</th>
                                <th scope="col">Sorted By</th>
                                <th scope="col">Remarks</th>
                                <th scope="col">Date Sorted</th>
                                <!-- <th scope="col">Action</th> -->
                                <!-- <th>Action</th> -->
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Table body content goes here -->
                        </tbody>
                    </table>
                  
                    <tfooter><br>
                    <button style="float: right" class = "btn btn-sm btn-success pull-right" id = "btn_modal"  data-toggle="modal" data-target="#myModal"><span class = "glyphicon glyphicon-remove"></span> UnLock Serial</button>

                    <!-- Modal -->
                   
                    <div id="myModal" class="modal fade" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                        <div class="modal-header">
                        <h4 class = "text-primary">Are you sure you want to unlock  all this record?</h4>
                        </div>
                        <div class="modal-body">
                            <div id ="result"></div>
                        </div>
                        <input type="hidden" class="form-control input-lg" id="userdata" name="userdata" value="<?php echo $fullname; ?>">
                            <div class="form-group col-12 col-md-12 col-sm-12">
                            
                                <label for="unlocked_remarks" class="control-label">Remarks</label><span style="color:red">*</span>
                                <input type="text" class="form-control input-lg" id="unlocked_remarks" name="unlocked_remarks" placeholder="Enter Remarks Here"  required autocomplete="off">
                            </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" id = "btn_delete" data-dismiss="modal">Yes</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">No</button>
                        </div>
                        </div>

                    </div>
                    </div>
                    </div>
                   
                    </tfooter>
              
</div>
</form>


        

<?php $this->load->view('components/footer.php'); ?>
<script src='<?=base_url()?>assets/js/castingunlock.js'></script>  



<!-- table main -->
