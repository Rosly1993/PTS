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


$(document).ready(function () {
    var table = $('#items_table').DataTable({
        "ajax": {
            "url": "../machiningmrs_dryconf/get_prresults",
            "data": function (d) {
                d.line = $('#line').val(); // Add line filter value
            }
        },
        "columns": [
            {
                data: 'id',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'serial1',
                className: 'py-0 px-1 text-center font-size-14'
            },
            // {
            //     data: 'serial2',
            //     className: 'py-0 px-1 text-center font-size-14'
            // },
            {
                data: 'tray_no',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'line',
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
                data: 'newquantity',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'input_date',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'sample_date',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'sample_by',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'split_lot_details',
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
                data: 'debplan',
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
            },
            {
                data: 'id',
                orderable: false,
                className: 'text-center py-0 px-1 font-size-14',
                render: function (data, type, row, meta) {
                    return '<a class="me-2 btn-sm editbtn rounded-0 py-0 edit_data" href="javascript:void(0)" data-id="' + (row.id) + '" data-url="../machiningmrs_dryconf/get_prresult_details/"><i class="ni ni-settings"></i></a>';
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
// Handle form submission to apply filter
$('#addItemForm').on('submit', function (e) {
    e.preventDefault();
    // Reload DataTable with new filter value
    table.ajax.reload();
});



    new $.fn.dataTable.Buttons(table, {
        buttons: [
            // {
            //     text: '<a class="text-white addbtn"><i class="fas fa-plus text-white "></i>&nbsp; Add Area</a>',
            //     className: "buttontest",
            //     action: function (e, dt, node, config) {
            //         $('#add_model').modal('show');
            //     }
            // },
            {
                extend: 'excelHtml5',
                text: '<a class="text-white excelbtn"><i class="fa fa-file-excel  text-white"></i>&nbsp;&nbsp;Excel Download</a>',
                className: "buttontest",
                autoFilter: true,
                sheetName: 'Exported data',
                exportOptions: {
                    columns: ':visible'
                },
                title: 'Traceability'
            },
            {
                extend: 'print',
                text: '<a class="text-white pdfbtn"><i class="fa fa-file-pdf text-white"></i>&nbsp;&nbsp;PDF Download</a>',
                className: "buttontest",
                autoFilter: true,
                orientation: 'landscape',
                sheetName: 'Exported data',
                exportOptions: {
                    columns: ':visible'
                },
                title: 'Traceability'
            }
        ]
    });

    // Add the buttons to the layout
    table.buttons().container().appendTo($('.dataTables_length', table.wrapper));

    // ... Your existing code ...

    // Delegate click event to dynamically added elements
    $('#items_table tbody').on('click', '.edit_data', function () {
        var id = $(this).data('id');
        edit_data(id);
    });

  


        // Function to handle edit_data
        function edit_data(id) {
            // Fetch the current item details from the server
            $.ajax({
                url: "../machiningmrs_dryconf/get_prresult_details/" + id,
                type: "GET",
                dataType: "json",
                success: function (data) {
                    // Log the data received from the server
                    console.log("Data Received:", data);

                    // Check if the response contains line_details
                    if (data.prresult_details) {
                        var existingId = data.prresult_details.id;
                        var existingSerial = data.prresult_details.serial1;
                        var existingLine = data.prresult_details.line;
                        var existingUnique = data.prresult_details.unique1;
                        var existingModel = data.prresult_details.model;
                        var existingMold = data.prresult_details.mold_no;
                        var existingCavity = data.prresult_details.cavity;
                        var existingIngot = data.prresult_details.ingot_lot;
                        var existingTraysize = data.prresult_details.tray_size;
                        var existingTrayno = data.prresult_details.tray_no;
                        var existingQuantity = data.prresult_details.newquantity;
                        var existingQuantitylost = data.prresult_details.quantity_lost;
                        var existingDebplan = data.prresult_details.debplan;
                        
                    
                        // Log the existing data
                        console.log("Existing ID:", existingId);
                        console.log("Existing Area:", existingSerial);
                        console.log("Existing Line:", existingLine);

                        // Populate form fields in the modal with existing data
                        $('#edit_id').val(existingId);
                        $('#edit_serial').val(existingSerial);
                        $('#edit_line').val(existingLine);
                        $('#edit_unique').val(existingUnique);
                        $('#edit_model').val(existingModel);
                        $('#edit_mold').val(existingMold);
                        $('#edit_cavity').val(existingCavity);
                        $('#edit_ingot').val(existingIngot);
                        $('#edit_traysize').val(existingTraysize);
                        $('#edit_trayno').val(existingTrayno);
                        $('#edit_quantity').val(existingQuantity);
                        $('#edit_quantity_lost').val(existingQuantitylost);
                        $('#edit_debplan').val(existingDebplan);
                       
                       
                

                        // Show modal with pre-filled form fields
                        $('#edit_modal').modal('show');
                        $("#edit_modal").draggable({
                            handle: ".modal-header" // Specify the header as the handle for dragging
                        }).resizable(); // Make the modal resizable
                    
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

// Bind click event to the "Save Changes" button within the modal
$('#updateChangesBtn').click(function(event) {
// Prevent the default form submission behavior
event.preventDefault();

// Get the form data
var formData = {
id: $('#edit_id').val(),
unique: $('#edit_unique').val(),
model: $('#edit_model').val(),
mold: $('#edit_mold').val(), // corrected duplicate 'location' with 'mold'
cavity: $('#edit_cavity').val(), // corrected duplicate 'location' with 'cavity'
ingot: $('#edit_ingot').val(), // corrected duplicate 'location' with 'ingot'
traysize: $('#edit_traysize').val(), // corrected duplicate 'location' with 'traysize'
quantity: $('#edit_quantity').val(), // corrected duplicate 'location' with 'quantity'
line: $('#edit_line').val(),
serial: $('#edit_serial').val(),
trayno: $('#edit_trayno').val(),
// quantitylost: $('#quantitylost').val(),
quantity_lost: $('#edit_quantity_lost').val(),
category: $('#category').val(),
remarks: $('#remarks').val(),
debplan: $('#edit_debplan').val(),
judgement: $('#judgement').val(),
ngdetails: $('#ngdetails').val(),
ngqty: $('#ngqty').val(),
userdata: $('#userdata').val()
// Add any other form fields as needed
};

// Perform validation
var quantity = parseInt(formData.quantity);
var category = formData.category.trim();
var remarks = formData.remarks.trim();
var judgement = formData.judgement.trim();
var ngdetails = formData.ngdetails.trim();
var ngqty = formData.ngqty.trim();



if (judgement ==='') {
    // Handle invalid input, perhaps show an alert
    Swal.fire({
    icon: 'error',
    title: 'Please Select Judgement',
    text: 'No Judgement Selected.'
    });
    return; // Exit the function to prevent further execution
    }

// Check if remarks field is required and empty
if ($('#ngqty').prop('required') && ngqty.trim() > quantity ) {
    Swal.fire({
        icon: 'error',
        title: 'Check your Quantity NG',
        text: 'Error    '
    });
    return; // prevent form submission
    }

// Check if remarks field is required and empty
if ($('#category').prop('required') && category.trim() === '') {
    Swal.fire({
        icon: 'error',
        title: 'Error',
        text: 'Category field cannot be empty'
    });
    return; // prevent form submission
    }


    // Check if remarks field is required and empty
if ($('#ngqty').prop('required') && ngqty.trim() === '') {
    Swal.fire({
        icon: 'error',
        title: 'Error',
        text: 'NG Qty field cannot be empty'
    });
    return; // prevent form submission
    }
    
if ($('#ngdetails').prop('required') && ngdetails.trim() === '') {
    Swal.fire({
        icon: 'error',
        title: 'Error',
        text: 'NG Details field cannot be empty'
    });
    return; // prevent form submission
    }
    
if ($('#remarks').prop('required') && remarks.trim() === '') {
Swal.fire({
    icon: 'error',
    title: 'Error',
    text: 'Remarks field cannot be empty'
});
return; // prevent form submission
}
// Perform an AJAX request to save the edited data
$.ajax({
url: "../machiningmrs_dryconf/update_prresults",
type: "POST",
data: formData,
dataType: "json",
success: function(response) {
console.log("Success:", response);
// Close the modal after successful submission
$('#edit_modal').modal('hide');
// Optionally, reload the DataTable or update the UI as needed
table.ajax.reload(); // Reload the DataTable

// Check if no changes were made
if (response.status === 'success') {
    Swal.fire({
        icon: 'success',
        title: 'Success',
        text: 'Data saved successfully!'
    });

} else {
    // Show a SweetAlert success message upon successful save
    Swal.fire({
        icon: 'warning',
        title: 'New Serial is Active!',
        text: 'Active Serial'
    });
}
},
error: function(xhr, status, error) {
console.error("Error:", error);
// Handle errors or display error messages to the user
Swal.fire({
    icon: 'error',
    title: 'Error',
    text: 'An error occurred while saving the data. Please try again.'
});
}
});
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





