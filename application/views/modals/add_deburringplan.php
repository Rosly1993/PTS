<!-- Add the form element with an ID -->
<?php
$user = $this->session->userdata('user');
extract($user);
?> 
<div class="modal fade" id="add_model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
    <form id="addItemForm" action="<?php echo base_url('debplans/add_debplans'); ?>" method="post" enctype="multipart/form-data">

        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLongTitle">Add Deburring Plan</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="form-row">
            <div class="form-group col-md-6">
            <input type="hidden" class="form-control input-lg" id="userdata" name="userdata" value="<?php echo $fullname; ?>">
              <label for="model" class="control-label">Model</label><span style="color:red">*</span>
              <select type="text" class="form-control input-lg" id="model" name="model" placeholder="Enter description Name Here" required autocomplete="off">
                <option value="">Select Model</option>
                <?php foreach ($models as $model): ?>
                  <option value="<?php echo $model['model']; ?>"><?php echo $model['model']; ?></option>
                <?php endforeach; ?>
              </select>
            </div>

            <div class="form-group col-md-6">
              <label for="mold_no" class="control-label">Tooling Number</label><span style="color:red">*</span>
              <select type="text" class="form-control input-lg" id="mold_no" name="mold_no" placeholder="Enter Tooling Number Here" required autocomplete="off">
                <option value="">Select Mold No</option>
              </select>
            </div>
          </div>

          <div class="form-row">
            <div class="form-group col-md-6">
              <label for="cavity" class="control-label">Cavity</label><span style="color:red">*</span>
              <select type="text" class="form-control input-lg" id="cavity" name="cavity" placeholder="Enter Location Here" required autocomplete="off">
                <option value="">Select Cavity</option>
              </select>
            </div>
            <div class="form-group col-md-6">
              <label for="attachment" class="control-label">Attachment</label><span style="color:red">*</span>
              <input type="file" class="form-control input-lg" id="attachment" name="attachment" style="height: 40px" required autocomplete="off">
                
            </div>
          </div>
        </div>
        <?php if($area_id=='19' || $area_id=='16'){ ?>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary" id="saveChangesBtn">Save changes</button>
        </div>
        <?php }else{ }?>
      </form>
    </div>
  </div>
</div>




