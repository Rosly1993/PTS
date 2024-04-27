 <!-- Add this modal HTML within your existing HTML structure -->
 <div class="modal fade" id="lotModal" tabindex="-1" role="dialog" aria-labelledby="lotModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="lotModalLabel"><b style="font-size: 30px">Lot Details(Bubblewash)</b></h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" >
                <!-- Display serial and quantity here -->
                <p style="font-size: 30px" id="areaDisplay"></p>
                <p style="font-size: 30px" id="statusDisplay"></p>
                <p style="font-size: 30px" id="serialDisplay"></p>
                <p style="font-size: 30px" id="modelDisplay"></p>
                <p style="font-size: 30px" id="cavityDisplay"></p>
                <p style="font-size: 30px" id="quantityDisplay"></p>
                <p style="font-size: 30px" id="debplanDisplay"><a id="debplanLink" href="#" target="_blank">View Deb Plan</a></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
                <button type="button" class="btn btn-success" id="confirmAddLotBtn">Proceed Lot</button>
            </div>
        </div>
    </div>
</div>