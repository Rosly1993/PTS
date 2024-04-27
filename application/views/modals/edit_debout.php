<?php
$user = $this->session->userdata('user');
extract($user);
?> 

<!-- Edit Line Modal -->
<div class="modal fade" id="edit_modal" tabindex="-1" aria-labelledby="edit_modal_label" aria-hidden="true">
    <!-- <div class="modal-dialog modal-dialog-centered modal-lg"> -->
    <div class="modal-dialog  modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="edit_modal_label">Scan Out</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editItemForm">
                <input type="hidden" id="edit_id" name="id">
                <input type="hidden" id="edit_unique" name="unique">
                <input type="hidden" id="edit_model" name="model">
                <input type="hidden" id="edit_mold" name="mold">
                <input type="hidden" id="edit_cavity" name="cavity">
                <input type="hidden" id="edit_ingot" name="ingot">
                <input type="hidden" id="edit_traysize" name="traysize">
                <input type="hidden" id="edit_quantity" name="quantity">
                <input type="hidden" id="edit_quantity_lost" name="quantity_lost">
                <input type="hidden" id="edit_line" name="line">
                <input type="hidden" id="edit_debplan" name="debplan">
                   
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="edit_serial">Serial</label>
                        <input type="text" class="form-control" id="edit_serial" name="editSerial" readonly placeholder="Enter Line Number">
                    </div>
                   
                    <div class="form-group col-md-6">
                        <label for="edit_trayno">Tray</label>
                       <input type="text" class="form-control" id="edit_trayno" name="editTrayno"  placeholder="Enter Line Number">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="quantitylost">Quantity Lost</label>
                       <input type="number" class="form-control" id="quantitylost" name="quantitylost"  value="0"placeholder="Enter Line Number">
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
                    </div>
                   
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="updateChangesBtn">Save Changes</button>
            </div>
        </div>
    </div>
</div>
