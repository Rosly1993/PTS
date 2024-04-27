
// Function to handle changes in the category select input
function handleCategoryChange() {
    var category = $('#category').val(); // Get the selected category value
    var remarksField = $('#remarks'); // Get the remarks field element

    // Check if category is selected
    if (category === '') {
        // If no category is selected, hide or make the remarks field readonly
        remarksField.prop('readonly', true); // Make the remarks field readonly
        remarksField.hide(); // Hide the remarks field
        remarksField.val(''); // Clear the remarks field value
        remarksField.removeAttr('required'); // Remove the required attribute
    } else {
        // If a category is selected, show and enable the remarks field
        remarksField.prop('readonly', false); // Make the remarks field editable
        remarksField.show(); // Show the remarks field
        remarksField.attr('required', true); // Add the required attribute
    }
}

// Call the handleCategoryChange function initially
handleCategoryChange();

// Add event listener to the category select input to trigger the handleCategoryChange function on change
$('#category').change(handleCategoryChange);

$(document).ready(function () {
    // DataTable initialization
    var table = $('#items_table').DataTable({
        "ajax": "../medsamplings/get_prresults",
        "columns": [
            {
                data: 'id',
                className: 'py-0 px-1 text-center font-size-14'
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
                data: 'input_by',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'id',
                orderable: false,
                className: 'py-0 px-1 text-center font-size-14',
                render: function (data, type, row, meta) {
                    return '<button class="btn-sm view-remarks-btn rounded-0 py-0" data-id="' + row.id + '" data-toggle="modal" data-target="#remarksModal"><i class="ni ni-align-center"></i> View Remarks</button>';
                }
            },
            
            {
                data: 'id',
                orderable: false,
                className: 'py-0 px-1 text-center font-size-14',
                render: function (data, type, row, meta) {
                    return '<a class="me-2 btn-sm editbtn rounded-0 py-0 edit_data" href="javascript:void(0)" data-id="' + (row.id) + '" data-url="../medsamplings/get_prresult_details/"><i class="ni ni-settings"></i></a>';
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

    function view_remarks(id) {
        console.log("Function called with ID:", id);  // Ensure ID is correct
        $.ajax({
            url: "../medsamplings/get_prresult_remarks/" + id,
            type: "GET",
            dataType: "json",
            success: function (data) {
                console.log("AJAX Success, Data Received:", data);  // Log entire data object
    
                var remarksData = data.prresult_details_remarks;  // Extract remarks data
                if (remarksData) {
                    var remarks = remarksData.remarks || 'No remarks available.';
                    var quantity = remarksData.quantity || 'No quantity available.';
                    var quantityLost = remarksData.quantity_lost || 'No quantity lost available.';
                    var area = remarksData.area || 'No area available.';
    
                    // Format the data as desired
                    var remarksContent = "Remarks: " + remarks + "<br>";
                    remarksContent += "Quantity: " + quantity + "<br>";
                    remarksContent += "Quantity Lost: " + quantityLost + "<br>";
                    remarksContent += "Area: " + area;
    
                    $('#pr_remarks_content').html(remarksContent);  // Set HTML content to preserve line breaks
                } else {
                    $('#pr_remarks_content').text('No data available.');
                }
                $('#remarksModal').modal('show');
            },
            error: function (xhr, textStatus, errorThrown) {
                console.log("AJAX Error:", textStatus, errorThrown);  // Detailed error logging
                $('#pr_remarks_content').text('Failed to retrieve data.');
                $('#remarksModal').modal('show');  // Show modal even if there's an error
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





        // Function to handle edit_data
        function edit_data(id) {
            // Fetch the current item details from the server
            $.ajax({
                url: "../medsamplings/get_prresult_details/" + id,
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
quantitylost: $('#quantitylost').val(),
category: $('#category').val(),
remarks: $('#remarks').val(),
userdata: $('#userdata').val()
// Add any other form fields as needed
};

// Perform validation
var quantity = parseInt(formData.quantity);
var quantityLost = parseInt(formData.quantitylost);
var remarks = formData.remarks.trim();

if (quantityLost < 0) {
// Handle invalid input, perhaps show an alert
Swal.fire({
icon: 'error',
title: 'Invalid Input',
text: 'Quantity Lost must be valid numbers.'
});
return; // Exit the function to prevent further execution
}

if (quantityLost > quantity) {
// Handle the case where quantity lost is greater than quantity
Swal.fire({
icon: 'warning',
title: 'Invalid Quantity Lost',
text: 'Quantity lost cannot be greater than quantity.'
});
return; // Exit the function to prevent further execution
}

// Check if remarks field is required and empty
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
url: "../medsamplings/update_prresults",
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
        title: 'Please Update Deburring Plan',
        text: 'No Deburring Plan!'
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



