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
                <h5 class="modal-title" id="edit_modal_label">Machining Splitlot Judgement</h5>
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
                <input type="hidden" class="form-control input-lg" id="userdata" name="userdata" value="<?php echo $fullname; ?>">
                   
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="edit_serial">Serial</label>
                        <input type="text" class="form-control" id="edit_serial" name="editSerial" readonly placeholder="Enter Line Number">
                    </div>
                   
                    <div class="form-group col-md-6">
                        <label for="edit_trayno">Tray</label>
                       <input type="text" class="form-control" id="edit_trayno" name="editTrayno"  readonly placeholder="Enter Line Number">
                    </div>
                    <div class="form-group col-md-12">
                    <label for="judgement">Judgement</label><span style="color:red">&nbsp; &nbsp;*</span>
                    <select type="select" class="form-control" id="judgement" name="judgement">
                        <option value="">Select Judgement</option>
                        <option value="Accept">Accept</option>
                        <option value="Reject">Reject</option>
                    </select>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="updateChangesBtn">Save Changes</button>
            </div>
        </div>
    </div>
    </div>
    </div>
    </form>
   


