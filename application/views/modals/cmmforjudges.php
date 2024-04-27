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
                <h5 class="modal-title" id="edit_modal_label">Machining Judgement QA Dimension</h5>
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

                <input type="hidden" id="edit_unique2" name="unique2">
                <input type="hidden" id="edit_serial2" name="serial2">

                   
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
        <option value="Scrap">Scrap</option>
    </select>
</div>

<div class="form-group col-md-6" id="remarksCategorySection" style="display:none;">
    <label for="category" class="control-label">Remarks Category</label><span style="color:orange">&nbsp; &nbsp;(Mandatory)</span>
    <select type="text" class="form-control input-lg" id="category" name="category" style="height: 50px" autocomplete="off">
        <option value="">Select Category</option>
        <!-- Loop through areas and populate options -->
        <?php foreach ($categories as $category): ?>
            <option value="<?php echo $category['category']; ?>"><?php echo $category['category']; ?></option>
        <?php endforeach; ?>
    </select>
</div>

<div class="form-group col-md-6" id="remarksSection" style="display:none;">
  
    <label for="area" class="control-label">Remarks</label><span style="color:orange">&nbsp; &nbsp;(Mandatory)</span>
    <input type="text" class="form-control input-lg" id="remarks" name="remarks" placeholder="Enter Remarks Here" autocomplete="off">
</div>
<div class="form-group col-md-12" id="ngdetailsSection" style="display:none;">
    <input type="hidden" class="form-control input-lg" id="userdata" name="userdata" value="<?php echo $fullname; ?>">
    <label for="ngdetails" class="control-label">NG Details</label><span style="color:orange">&nbsp; &nbsp;(Mandatory)</span>
    <input type="text" class="form-control input-lg" id="ngdetails" name="ngdetails" placeholder="Enter NG Details Here" autocomplete="off">
</div>

<div class="form-group col-md-12" id="qtySection" style="display:none;">
   
    <label for="ngqty" class="control-label">NG Qty</label><span style="color:orange">&nbsp; &nbsp;(Mandatory)</span>
    <input type="number" class="form-control input-lg" id="ngqty" name="ngqty" value="0" autocomplete="off">
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
    <script>
    document.getElementById('judgement').addEventListener('change', function() {
        var judgementValue = this.value;
        var remarksCategorySection = document.getElementById('remarksCategorySection');
        var remarksSection = document.getElementById('remarksSection');
        var ngdetailsSection = document.getElementById('ngdetailsSection');
        var qtySection = document.getElementById('qtySection');
        var categorySelect = document.getElementById('category');
        var remarksInput = document.getElementById('remarks');
        var ngdetailsInput = document.getElementById('ngdetails');
        var ngqtyInput = document.getElementById('ngqty');

        if (judgementValue === 'Accept') {
            remarksCategorySection.style.display = 'none';
            remarksSection.style.display = 'none';
            ngdetailsSection.style.display = 'none';
            qtySection.style.display = 'block';
            ngqtyInput.setAttribute('required', 'required');
            categorySelect.removeAttribute('required');
            categorySelect.val(''); // Clear the remarks field value
            remarksInput.removeAttribute('required');
            remarksInput.val(''); // Clear the remarks field value
            ngdetailsInput.removeAttribute('required');
            ngdetailsInput.val(''); // Clear the remarks field value

        } else if (judgementValue === 'Scrap') { // Corrected value to 'Scrap'
            remarksCategorySection.style.display = 'block';
            remarksSection.style.display = 'block';
            ngdetailsSection.style.display = 'block';
            qtySection.style.display = 'none';
            ngqtyInput.removeAttribute('required');
            categorySelect.setAttribute('required', 'required');
            remarksInput.setAttribute('required', 'required');
            ngdetailsInput.setAttribute('required', 'required');
        } else {
            // If no judgement selected or invalid selection
            remarksCategorySection.style.display = 'none';
            remarksSection.style.display = 'none';
            ngdetailsSection.style.display = 'none';
            qtySection.style.display = 'none';
            ngqtyInput.removeAttribute('required');
            categorySelect.removeAttribute('required');
            remarksInput.removeAttribute('required');
            ngdetailsInput.removeAttribute('required');
        }
    });
</script>



