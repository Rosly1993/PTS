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
                    <h6 class="h3 text-white d-inline-block mb-0">Annealing Out</h3>
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
            <div style="margin-left: 15px"><button class="btn btn-primary" ><a href="<?=site_url().'/annealingins/'?>" style="color:white;text-decoration: none"> Annealing In</a> </button>&nbsp;
            <button class="btn btn-success"><a href="<?=site_url().'/annealingouts/'?>" style="color:white;text-decoration: none"> Annealing Out</a></button></div>
            <form method="POST" action="">
                <div class="form-row" style="padding: 15px">
                <div class="form-group col-md-6">
                <select type="text" class="form-control input-lg" id="line" name="line" placeholder="Enter description Name Here" required autocomplete="off">
                <option value="">Select Annealing Oven...</option>
                <!-- Loop through areas and populate options -->
                <?php foreach ($lines as $line): ?>
                    <option value="<?php echo $line['lines']; ?>"><?php echo $line['lines']; ?></option>
                <?php endforeach; ?>
            </select>
            </div>
           

            <div class="form-group col-md-6" >
            <button  style="float: left" type="submit" class="btn btn-success" id="filterBtn">Filter Data</button>
            </div>
            

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
                                <th scope="col">Oven Line</th>
                                <th scope="col">Date In</th>
                                <th scope="col">Baking Time(No. of Mins.)</th>
                                <th scope="col">Baking Time(Mins.)</th>
                                <th scope="col">Scan-in By</th>
                                <th scope="col">View Remarks</th>
                                <th scope="col">QA Dispo</th>
                                <!-- <th>Action</th> -->
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Table body content goes here -->
                        </tbody>
                    </table>
                  
                    <tfooter><br>
                    <button style="float: right" class = "btn btn-sm btn-success pull-right" id = "btn_modal"  data-toggle="modal" data-target="#myModal"><span class = "glyphicon glyphicon-remove"></span> Proceed Serial</button>

                    <!-- Modal -->
                   
                    <div id="myModal" class="modal fade" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                        <div class="modal-header">
                        <h4 class = "text-primary">Are you sure you want to proceed  all this record?</h4>
                        </div>
                        <div class="modal-body">
                            <div id ="result"></div>
                        </div>
                        <input type="hidden" class="form-control input-lg" id="userdata" name="userdata" value="<?php echo $fullname; ?>">
                       
                            <div class="form-group col-12 col-md-12 col-sm-12">
                            
                                <label for="locked_remarks" class="control-label"> Remarks</label><span style="color:red">&nbsp;(Optional)</span>
                                <input type="text" class="form-control input-lg" id="locked_remarks" name="locked_remarks" placeholder="Enter Remarks Here"  required autocomplete="off">
                            </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-success" id = "btn_delete" data-dismiss="modal">Yes</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
                        </div>
                        </div>

                    </div>
                    </div>
                    </div>
                   
                    </tfooter>
              
</div>
</form>


        
<?php $this->load->view('modals/remarks.php'); ?>
<?php $this->load->view('components/footer.php'); ?>
<script src='<?=base_url()?>assets/js/annealingouts.js'></script> 



<!-- table main -->

  