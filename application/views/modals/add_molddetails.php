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
                    <h5 class="modal-title" id="exampleModalLongTitle">Add Tooling Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" class="form-control input-lg" id="userdata" name="userdata" value="<?php echo $fullname; ?>">

                    <div class="form-row">
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
                            <label for="mold_no" class="control-label">Tooling Number</label><span style="color:red">*</span>
                            <input type="text" style="height: 38px" class="form-control input-lg" id="mold_no" name="mold_no" placeholder="Enter Tooling Number Here" required autocomplete="off">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="cavity_no" class="control-label">Number of Cavity</label><span style="color:red">*</span>
                            <select type="text" style="height: 38px" class="form-control input-lg" id="cavity_no" name="cavity_no" required autocomplete="off" onchange="showHideCavityFields()">
                                <option value="">Select Number of Cavity</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-row" id="cavity_fields">
                        <!-- Cavity fields will be dynamically shown/hidden here -->
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

