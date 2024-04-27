<!-- Add the form element with an ID -->
<?php
    $user = $this->session->userdata('user');
    extract($user);
?> 
<div class="modal fade" id="add_model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <form id="addItemForm"> <!-- Add the form element here -->
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Add Lot Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" class="form-control input-lg" id="userdata" name="userdata" value="<?php echo $fullname; ?>">

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="machine" class="control-label">Casting Machine</label><span style="color:red">*</span>
                            <select type="text" class="form-control input-lg" id="machine" name="machine" placeholder="Enter description Name Here" required autocomplete="off">
                                <option value="">Select Casting Machine</option>
                                <!-- Loop through areas and populate options -->
                                <?php foreach ($lines as $line): ?>
                                    <option value="<?php echo $line['lines']; ?>"><?php echo $line['lines']; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        
                        <div class="form-group col-md-6">
                            <label for="model" class="control-label">Model</label><span style="color:red">*</span>
                            <select type="text" class="form-control input-lg" id="model" name="model" placeholder="Enter description Name Here" required autocomplete="off">
                                <option value="">Select Model</option>
                                <!-- Loop through areas and populate options -->
                                <?php foreach ($models as $model): ?>
                                    <option value="<?php echo $model['model']; ?>"><?php echo $model['model']; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        
                        <div class="form-group col-md-6">
                        <label for="mold_no" class="control-label">Tooling No</label><span style="color:red">*</span>
                        <select type="text" class="form-control input-lg" id="mold_no" name="mold_no" placeholder="Enter Mold No Here" required autocomplete="off">
                            <option value="">Select Tooling No</option>
                        </select>
                        </div>
                 

      
                        <div class="form-group col-md-6">
                        <label for="cavity" class="control-label">Cavity</label><span style="color:red">*</span>
                        <select type="text" class="form-control input-lg" id="cavity" name="cavity" placeholder="Enter Location Here" required autocomplete="off">
                            <option value="">Select Cavity</option>
                        </select>
                        </div>
                        <div class="form-group col-md-6">
                        <label for="ingot_no" class="control-label">Ingot Number</label><span style="color:red">*</span>
                        <input type="text" class="form-control input-lg" id="ingot_no" name="ingot_no" placeholder="Enter Ingot Number Here" required autocomplete="off">
                           
                        </div>
                        <div class="form-group col-md-6">
                        <label for="tray_size" class="control-label">Tray Size</label><span style="color:red">*</span>
                        <input type="number" class="form-control input-lg" id="tray_size" name="tray_size" value='16'  autocomplete="off">
                           
                        </div>


                                
                            </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary" id="saveChangesBtn">Save changes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>


