

$(document).ready(function () {
    // DataTable initialization
    var table = $('#items_table').DataTable({
        "ajax": "../ogisampling/get_areas",
        "columns": [
            {
                data: 'id',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'model',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'cavity',
                className: 'py-0 px-1 text-center font-size-14'
            },
            // {
            //     data: 'cavity',
            //     className: 'py-0 px-1 text-center font-size-14'
            // },
            {
                data: 'mfi_serial',
                className: 'py-0 px-1 text-left font-size-14'
            },
            {
                data: 'input_by',
                className: 'py-0 px-1 text-left font-size-14'
            },
            {
                data: 'input_date',
                className: 'py-0 px-1 text-center font-size-14'
            },
            // {
            //     data: 'mfi_serial',
            //     className: 'py-0 px-1 text-center font-size-14'
            // },
            // {
            //     data: 'mfi_serial',
            //     className: 'py-0 px-1 text-center font-size-14'
            // }, 
            {
                data: 'id',
                orderable: false,
                className: 'text-center font-size-14 py-0 px-1',
                render: function (data, type, row, meta) {
                    return '<a class="me-2 btn-sm editbtn rounded-0 py-0 edit_data" href="javascript:void(0)" data-id="' + (row.id) + '"><i class="ni ni-settings"></i></a>' ;
                }
            }
        ],
        "responsive": true,
        lengthMenu: [
            [10, 25, 50 ,100,  -1],
            [10, 25, 50 ,100,  "All"],
        ],
        
        "pageLength": 10,

    });

    // Buttons initialization
    new $.fn.dataTable.Buttons(table, {
        buttons: [
            
        ]
    });

    // Add the buttons to the layout
    table.buttons().container().appendTo($('.dataTables_length', table.wrapper));

    // Delegate click event to dynamically added elements
    $('#items_table tbody').on('click', '.edit_data', function () {
        var id = $(this).data('id');
        edit_data(id);
    });

   

    function edit_data(id) {
        // Fetch the current item details from the server
        $.ajax({
            url: "../ogisampling/get_area_details/" + id,
            type: "GET",
            dataType: "json",
            success: function (data) {
                // Log the data received from the server
                console.log("Data Received:", data);
    
                // Check if the response contains area_details
                if (data.area_details) {
                    var areaDetails = data.area_details;
                    var modalBody = $('#edit_modal .modal-body');
                    modalBody.empty(); // Clear previous content
    
                    // Create a table element
                    var tableHtml = '<table class="table table-bordered">';
                    // Add table header row
                    tableHtml += '<tr>';
                    tableHtml += '<th>ID</th>';
                    tableHtml += '<th>MFI Serial</th>';
                    tableHtml += '<th>Lot Serial</th>';
                    tableHtml += '<th>Model</th>';
                    tableHtml += '<th>Cavity</th>';
                    tableHtml += '<th>Quantity</th>';
                    tableHtml += '<th>Quantity Lost</th>';
                    tableHtml += '<th>MFI Line</th>';
                    tableHtml += '<th>Combined By</th>';
                    tableHtml += '<th>Date</th>';
                    tableHtml += '</tr>';
                    
                    // Add table rows for each data object
                    areaDetails.forEach(function (item, index) {
                        tableHtml += '<tr>';
                        tableHtml += '<td>' + item.id + '</td>';
                        tableHtml += '<td><input type="text" class="form-control" style="width: 270px" value="' + item.mfi_serial + '" id="mfi_serial_' + index + '" readonly></td>';
                        tableHtml += '<td><input type="text" class="form-control" style="width: 150px" value="' + item.serial1 + '" id="serial1_' + index + '" readonly></td>';
                        tableHtml += '<td><input type="text" class="form-control" style="width: 150px" value="' + item.model + '" id="model_' + index + '" readonly></td>';
                        tableHtml += '<td><input type="text" class="form-control" style="width: 150px" value="' + item.cavity + '" id="cavity_' + index + '" readonly></td>';
                        tableHtml += '<td><input type="text" class="form-control" style="width: 150px" value="' + item.quantity + '" id="quantity_' + index + '" readonly></td>';
                        tableHtml += '<td><input type="text" class="form-control" style="width: 150px" value="' + item.quantity_lost + '" id="quantity_lost_' + index + '" readonly></td>';
                        tableHtml += '<td>' + item.line + '</td>';
                        tableHtml += '<td>' + item.input_by + '</td>';
                        tableHtml += '<td>' + item.input_date + '</td>';
                        tableHtml += '</tr>';
                    });
                    tableHtml += '</table>';
    
                    // Append the table to the modal body
                    modalBody.append(tableHtml);
    
                    // Add status and remarks inputs outside the table
                    modalBody.append(
                        '<div class="form-group">' +
                            '<label for="overall-status">Judgement:</label>' +
                            '<select id="status" class="form-control">' +
                                '<option value="Accepted">Accept</option>' +
                                '<option value="Rejected">Reject</option>' +
                            '</select>' +
                        '</div>' +
                        '<div class="form-group">' +
                            '<label for="overall-remarks">Remarks:</label>' +
                            '<textarea id="remarks" class="form-control"></textarea>' +
                        '</div>'
                    );
    
                    // Add a single submit button
                    var submitButtonHtml = '<button class="btn btn-primary" id="submit-all">Submit</button>';
                    modalBody.append(submitButtonHtml);
    
                    // Show modal with pre-filled form fields
                    $('#edit_modal').modal('show');
                    $("#edit_modal").draggable({
                        handle: ".modal-header" // Specify the header as the handle for dragging
                    }).resizable(); // Make the modal resizable
                
    
                    // Add event listener for submit button
                    $('#submit-all').click(function() {
                        // Handle status update for all rows here
                        var status = $('#status').val();
                        var remarks = $('#remarks').val();
                        var statusUpdates = [];
                        areaDetails.forEach(function (item, index) {

                            var mfi_serial = $('#mfi_serial_' + index).val();
                            var serial1 = $('#serial1_' + index).val();
                            var model = $('#model_' + index).val();
                            var cavity = $('#cavity_' + index).val();
                            var quantity = $('#quantity_' + index).val();
                            var quantity_lost = $('#quantity_lost_' + index).val();

                            var rowData = {
                                id: item.id,
                                mfi_serial: mfi_serial,
                                serial1: serial1,
                                model: model,
                                cavity: cavity,
                                quantity: quantity,
                                quantity_lost: quantity_lost,
                                status: status,
                                remarks: remarks
                            };
                            statusUpdates.push(rowData);
                        });
                        console.log('Submitting status updates for all rows:', statusUpdates);
                        // Add AJAX call to update status for all rows here
                        updateStatus(statusUpdates);
                    });
                } else {
                    // Handle error or show a message if item details are not available
                    console.error('Failed to fetch item details.');
                }
            },
            error: function (xhr, status, error) {
                console.error("AJAX Error:", error);
                // Handle error or show a message
            }
        });
    }
    
    function updateStatus(statusUpdates) {
        $.ajax({
            url: "../ogisampling/update_status",
            type: "POST",
            dataType: "json",
            data: { status_updates: statusUpdates },
            success: function(response) {

                console.log('Update response:', response);
                Swal.fire({
                    icon: 'success',
                    title: 'Success',
                    text: 'Successfully Transacted Data',
                    showConfirmButton: false,
                    timer: 1500
                });

                table.ajax.reload();
                $('#edit_modal').modal('hide');
                // console.log("Status updated successfully.");
            },
            error: function(xhr, status, error) {
                // Handle error
                console.error("Error occurred: " + xhr.responseText); // Log the response text
                console.error("Error updating status:", error);
            }
        });
    }
});