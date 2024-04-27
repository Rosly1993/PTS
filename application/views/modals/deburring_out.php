<!-- Edit Line Modal -->
<div class="modal fade" id="edit_modal" tabindex="-1" aria-labelledby="edit_modal_label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="edit_modal_label">Deburring Out</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editItemForm">
                <input type="hidden" id="edit_id" name="id">
   
                <input type="hidden" id="edit_unique" name="editUnique">
                <input type="hidden" id="edit_model" name="editModel">
                <input type="hidden" id="edit_quantity" name="editQuantity">
                    <div class="form-group">
                        <label for="edit_serial">Serial</label>
                        <input type="text" class="form-control" id="edit_serial" name="editSerial" readonly >
                    </div>
                    <div class="form-group">
                        <label for="ng_qty">Quantity Lost</label>&nbsp;<span style="color: red">*</span>
                        <input type="number" class="form-control" id="ng_qty" name="editQty" value="0">
                       
                       
                    </div>

                    <div class="form-group">
                        <label for="remarks">Remarks</label>&nbsp;<span style="color: orange">(Optional)</span>
                        <input type="number" class="form-control" id="remarks" name="remarks" placeholder="Enter Remarks Here">
                       
                       
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
