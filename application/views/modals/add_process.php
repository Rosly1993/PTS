<!-- Add the form element with an ID -->

<div class="modal fade" id="add_model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
    <form id="addItemForm" action="" method="post">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLongTitle">Add Process</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
        <div class="form-group col-md-12">
                            <label for="model" class="control-label">Model</label><span style="color:red">*</span>
                            <select type="text" class="form-control input-lg" id="model" name="model" placeholder="Enter description Name Here" required autocomplete="off">
                                <option value="">Select Model</option>
                                <!-- Loop through areas and populate options -->
                                <?php foreach ($models as $model): ?>
                                    <option value="<?php echo $model['model']; ?>"><?php echo $model['model']; ?></option>
                                <?php endforeach; ?>
                            </select>
          </div>
                        
          <div class="form-group col-md-12">
                            <label for="area_id" class="control-label">Current Area</label><span style="color:red">*</span>
                            <select type="text" class="form-control input-lg" id="area_id" name="area_id" placeholder="Enter description Name Here" required autocomplete="off">
                                <option value="">Select Area</option>
                                <!-- Loop through areas and populate options -->
                                <?php foreach ($areas as $area): ?>
                                    <option value="<?php echo $area['id']; ?>"><?php echo $area['area']; ?></option>
                                <?php endforeach; ?>
                            </select>
          </div>
          <div class="form-group col-md-12">
                            <label for="previous_id" class="control-label">Previous Area</label><span style="color:red">*</span>
                            <select type="text" class="form-control input-lg" id="previous_id" name="previous_id" placeholder="Enter description Name Here" required autocomplete="off">
                                <option value="">Select Area</option>
                                <!-- Loop through areas and populate options -->
                                <?php foreach ($areas as $area): ?>
                                    <option value="<?php echo $area['id']; ?>"><?php echo $area['area']; ?></option>
                                <?php endforeach; ?>
                            </select>
          </div>
          <div class="form-group col-md-12">
                            <label for="next_id" class="control-label">Next Area</label><span style="color:red">*</span>
                            <select type="text" class="form-control input-lg" id="next_id" name="next_id" placeholder="Enter description Name Here" required autocomplete="off">
                                <option value="">Select Area</option>
                                <!-- Loop through areas and populate options -->
                                <?php foreach ($areas as $area): ?>
                                    <option value="<?php echo $area['id']; ?>"><?php echo $area['area']; ?></option>
                                <?php endforeach; ?>
                            </select>
          </div>
          <div class="form-group col-md-12">
                            <label for="is_sampling" class="control-label">QA Sampling</label><span style="color:red">*</span>
                            <select type="text" class="form-control input-lg" id="is_sampling" name="is_sampling" placeholder="Enter description Name Here" required autocomplete="off">
                                <option value="">Select Data</option>
                                <!-- Loop through areas and populate options -->
                              
                                    <option value="1">Yes</option>
                                    <option value="0">No</option>
                               
                            </select>
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
