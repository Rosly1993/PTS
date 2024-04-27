

$(document).ready(function () {
    // DataTable initialization
    var table = $('#items_table').DataTable({
        "ajax": "../lotsorting/get_areas",
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
            {
                data: 'mfi_ogi_remarks',
                className: 'py-0 px-1 text-center font-size-14'
            },
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
            url: "../lotsorting/get_area_details/" + id,
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
                    tableHtml += '<th>Serial</th>';
                    tableHtml += '<th>Model</th>';
                    tableHtml += '<th>Cavity</th>';
                    tableHtml += '<th>Quantity</th>';
                    tableHtml += '<th>Quantity NG</th>';
                    tableHtml += '<th>Remarks</th>';
                    tableHtml += '</tr>';
                    // Add table rows for each data object
                    areaDetails.forEach(function (item, index) {
                        tableHtml += '<tr>';
                        tableHtml += '<td>' + item.id + '</td>';
                        tableHtml += '<td>' + item.serial1 + '</td>';
                        tableHtml += '<td>' + item.model + '</td>';
                        tableHtml += '<td>' + item.cavity + '</td>';
                        tableHtml += '<td>' + item.quantity + '</td>';
                        tableHtml += '<td><input type="number" name="status" style="height: 30px; border-radius: 5px; width: 100px" value="0" min="0"></td>';
                        tableHtml += '<td><textarea name="remarks" style="height: 30px; border-radius: 5px; width: 100px"></textarea></td>';
                        tableHtml += '</tr>';
                        // Add more rows for other properties as needed
                    });
                    tableHtml += '</table>';
    
                    // Append the table to the modal body
                    modalBody.append(tableHtml);
    
                    // Add a single submit button
                    var submitButtonHtml = '<button class="btn btn-primary" id="submit-all">Submit</button>';
                    modalBody.append(submitButtonHtml);
    
                    // Show modal with pre-filled form fields
                    $('#edit_modal').modal('show');
                    $("#edit_modal").draggable({
                        handle: ".modal-header" // Specify the header as the handle for dragging
                    }).resizable(); // Make the modal resizable
                                
                                // Add event listener for input change on the Status input fields
                // Add event listener for input change on the Status input fields
                $('input[name="status"]').on('input', function() {
                    // Get the current row
                    var $row = $(this).closest('tr');
                    var status = parseInt($(this).val());
                    var quantity = parseInt($row.find('td:eq(4)').text()); // Get the Quantity value per row
                    if (status > quantity) {
                        // Highlight the input field in red for the current row
                        $(this).addClass('is-invalid');
                    } else {
                        // Remove red border from the input field for the current row
                        $(this).removeClass('is-invalid');
                    }
                    
                    // Check if any row has an invalid input
                    var anyInvalid = false;
                    $('input[name="status"]').each(function() {
                        if ($(this).hasClass('is-invalid')) {
                            anyInvalid = true;
                            return false; // Exit the loop early if any row is invalid
                        }
                    });
                    
                    // Hide or show the submit button based on the validation state
                    if (anyInvalid) {
                        $('#submit-all').hide();
                    } else {
                        $('#submit-all').show();
                    }
                });


    
                    // Add event listener for submit button
                    $('#submit-all').click(function () {
                        // Handle status update for all rows here
                        var statusUpdates = [];
                        $('input[name="status"]').each(function (index, element) {
                            var status = $(this).val();
                            var remarks = $(this).closest('tr').find('textarea[name="remarks"]').val();
                            var id = $(this).closest('tr').find('td:eq(0)').text(); // Assuming ID is in the first column
                            var quantity = $(this).closest('tr').find('td:eq(4)').text(); // Assuming ID is in the first column
                            var rowData = {
                                id: id,
                                status: status,
                                quantity: quantity,
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
            url: "../lotsorting/update_status",
            type: "POST",
            dataType: "json",
            data: { status_updates: statusUpdates },
            success: function(response) {
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
                console.error("Error updating status:", error);
            }
        });
    }
});