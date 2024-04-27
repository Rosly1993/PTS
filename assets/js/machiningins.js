

function toggleSerialInput() {
    var lineDropdown = document.getElementById("line");
    var serialInput = document.getElementById("serialInput");
    if (lineDropdown.value === "") {
        serialInput.style.display = "none"; // Hide the Serial input
    } else {
        serialInput.style.display = "block"; // Show the Serial input
    }
}


function validateForm() {
    var serial1 = $('#serial1').val().trim();
    var line = $('#line').val().trim();
    
    if (line === '') {
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'Please select a Line'
        });
        return false; // prevent form submission
    } else if (serial1 === '') {
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'Serial field cannot be empty'
        });
        return false; // prevent form submission
    } else if (serial1.length !== 12) {
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'Serial must be 12 characters long'
        });
        return false; // prevent form submission
    }
    
    return true; // allow form submission if all validations pass
}

$(document).ready(function () {
    // Define table variable outside of document.ready
    var table;

    // DataTable initialization
    table = $('#items_table').DataTable({
        "ajax": "../machiningins/get_models",
        "columns": [
            {
                data: 'id',
                className: 'py-0 px-1 text-center font-size-14',
                // style: 'color: red;' // Add font-size style
            },
            {
                data: 'serial1',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'tray_no',
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
            {
                data: 'quantity',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'line',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'input_date',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'id',
                orderable: false,
                className: 'py-0 px-1 text-center font-size-14',
                render: function (data, type, row, meta) {
                    return '<a class="btn-sm  view-remarks-btn rounded-0 py-0" data-id="' + row.id + '" data-toggle="modal" data-target="#remarksModal"><i class="ni ni-archive-2"></i></a>';
                }
            },
            {
                data: 'attachment',
                className: 'py-0 px-1 text-center font-size-14',
                render: function(data, type, row, meta) {
                    // Assuming the 'attachment' field contains the full URL to the PDF file
                    if (data) {
                        // Extract the filename from the URL
                        var filename = data.substring(data.lastIndexOf('/') + 1);
                        return '<a href="/PartsTraceabilitySystem/uploads/' + filename + '" class="pdf-link" target="_blank"><i class="fa fa-file-pdf fa-2x deletebtn"></i></a>';
                    } else {
                        return ''; // Empty string if no attachment
                    }
                }
            }
        ],
        "responsive": true,
        lengthMenu: [
            [10, 25, 50, 100, -1],
            [10, 25, 50, 100, "All"]
        ],
        "pageLength": 100,
        "order": [[6, "asc"]] // Order by the 7th column (index 6) in ascending order
       
    });

    // Move addLot() function outside of document.ready
    function addLot() {
        if (!validateForm()) return; // validate the form before proceeding
        var serial1 = $('#serial1').val();
        var line = $('#line').val();

        $.ajax({
            url: '../machiningins/get_quantity',
            type: "GET",
            dataType: "json",
            data: { serial1: serial1 },
            success: function(response) {
                if (response.status === 'success') {
                    var quantityData = response.quantity;
                    var area = quantityData.area;
                    var quantity = quantityData.quantity;
                    var model = quantityData.model;
                    var serial1 = quantityData.serial1;
                    var cavity = quantityData.cavity;
                    var debplan = quantityData.debplan;
                    var input_status = quantityData.input_status;

                    // Display data in modal
                    $('#areaDisplay').text('Current Area: ' + area);
                    $('#modelDisplay').text('Model: ' + model);
                    $('#quantityDisplay').text('Quantity: ' + quantity);
                    $('#serialDisplay').text('Serial: ' + serial1);
                    $('#cavityDisplay').text('Cavity: ' + cavity);
                    $('#statusDisplay').text('Serial Status: ' + input_status);
                    $('#debplanLink').attr('href', debplan); // Set the href attribute of the anchor tag
                    $('#debplanLink').text('View Deb Plan'); // Set the text of the anchor tag

                    $('#lotModal').modal('show'); // Show the modal
                } else {
                    console.error('Failed to retrieve quantity.');
                }
            },
            error: function(xhr, status, error) {
                console.error('AJAX Error: ' + error);
            }
        });

        // Handle confirm add lot button click
        $('#confirmAddLotBtn').off('click').on('click', function() {
            // Perform the AJAX request to add lot
            $.post("../machiningins/add_lot", { serial1: serial1, line: line })
                .done(function(data) {
                    if (data.status == 'success') {
                        Swal.fire({
                            icon: 'success',
                            title: 'Success',
                            text: data.message,
                            showConfirmButton: false,
                            timer: 1500
                        });
                        $('#serial1').val('');
                        table.ajax.reload(); // Reload DataTables
                    } else {
                        Swal.fire({
                            icon: 'warning',
                            title: data.message
                        });
                    }
                })
                .fail(function(xhr, status, error) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'Failed to add lot. Please try again later.'
                    });
                });

            // Close the modal
            $('#lotModal').modal('hide');
        });
    }

    // Event binding for #saveChangesBtn outside of document.ready
    $(document).on('click', '#saveChangesBtn', function(event) {
        event.preventDefault();
        addLot();
    });
});

  
function view_remarks(id) {
    console.log("Function called with ID:", id);  // Ensure ID is correct
    $.ajax({
        url: "../medsamplings/get_prresult_remarks/" + id,
        type: "GET",
        dataType: "json",
        success: function (data) {
            console.log("AJAX Success, Data Received:", data);  // Log entire data object

            // var remarksData = data.prresult_details_remarks;  // Extract remarks data
            // console.log("Remarks Data:", remarksData);
                            // Check if the response contains prresult_details_remarks
                         
            if (Array.isArray(data.prresult_details_remarks)) {
                var remarksData = data.prresult_details_remarks;
                var modalBody = $('#remarksModal .modal-body');
                modalBody.empty(); // Clear previous content

                // Create a table element
                var tableHtml = '<table class="table table-bordered">';
                // Add table header row
                tableHtml += '<tr>';
                tableHtml += '<th>ID</th>';
                // tableHtml += '<th>Quantity</th>';
                tableHtml += '<th>Serial</th>';
                tableHtml += '<th>Unique ID</th>';
                // tableHtml += '<th>Quantity Lost</th>'; // Add new header for quantity lost
                tableHtml += '<th>Remarks</th>'; // Add new header for remarks
                tableHtml += '<th>Category</th>'; // Add new header for category
                tableHtml += '<th>Area</th>'; // Add new header for area ID
                tableHtml += '<th>Inputed By</th>'; // Add new header for area ID
                tableHtml += '<th>Date</th>'; // Add new header for area ID
                tableHtml += '</tr>';

                // Add table rows for each data object
                remarksData.forEach(function (item, index) {
                    tableHtml += '<tr>';
                    tableHtml += '<td>' + item.id + '</td>';
                    // tableHtml += '<td>' + item.quantity + '</td>';
                    tableHtml += '<td>' + item.serial1 + '</td>';
                    tableHtml += '<td>' + item.unique1 + '</td>';
                    // tableHtml += '<td>' + item.quantity_lost + '</td>';
                    tableHtml += '<td>' + item.remarks + '</td>';
                    tableHtml += '<td>' + item.category + '</td>';
                    tableHtml += '<td>' + item.area + '</td>';
                    tableHtml += '<td>' + item.input_by + '</td>';
                    tableHtml += '<td>' + item.input_date + '</td>';
                    tableHtml += '</tr>';
                });
                tableHtml += '</table>';

                // Append the table HTML to the modal body
                modalBody.append(tableHtml);
                $('#remarksModal').modal('show'); // Show modal with table content
                $("#remarksModal").draggable({
                    handle: ".modal-header" // Specify the header as the handle for dragging
                }).resizable(); // Make the modal resizable
            } else {
                $('#remarksModal .modal-body').text('No data available.'); // Display message if no data
                $('#remarksModal').modal('show'); // Show modal even if there's no data
                $("#remarksModal").draggable({
                    handle: ".modal-header" // Specify the header as the handle for dragging
                }).resizable(); // Make the modal resizable
            }


                
            }
            });
            }


            // Assuming you use the click event initialization after the document is ready
            $(document).ready(function() {
                $('#items_table tbody').on('click', '.view-remarks-btn', function() {
                    var id = $(this).data('id');
                    view_remarks(id);
                });
            });