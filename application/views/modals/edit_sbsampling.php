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
                <h5 class="modal-title" id="edit_modal_label">Edit Shotblast Sampling</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editItemForm">
                <input type="hidden" id="edit_id" name="id">
                <input type="hidden" id="edit_unique" name="unique">
                   
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="edit_serial">Serial</label>
                        <input type="text" class="form-control" id="edit_serial" name="editSerial" readonly placeholder="Enter Line Number">
                    </div>

                    <div class="form-group col-md-12">
                            <input type="hidden" class="form-control input-lg" id="userdata" name="userdata" value="<?php echo $fullname; ?>">
                            <label for="area" class="control-label">Remarks</label><span style="color:orange"></span>
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
