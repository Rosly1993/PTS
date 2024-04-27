
$(document).ready(function () {
    // DataTable initialization
    var table = $('#items_table').DataTable({


        "ajax": "../scraps/get_prresults",
        "columns": [
            {
                data: 'id',
                className: 'py-0 px-1 text-center font-size-14'
            },
           
            {
                data: 'input_date',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'serial1',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'newarea',
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
                data: 'locked_by',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'locked_date',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'qan_number',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'locked_details',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'locked_remarks',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'date_sorted',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'sorted_by',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'sort_remarks',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'disposition',
                className: 'py-0 px-1 text-center font-size-14'
            },
            // {
            //     data: 'id',
            //     orderable: false,
            //     className: 'text-center font-size-14 py-0 px-1',
            //     render: function (data, type, row, meta) {
            //         return '<a class="me-2 btn-sm editbtn rounded-0 py-0 edit_data" href="javascript:void(0)" data-id="' + (row.id) + '" data-url="../medsamplings/get_prresult_details/"><i class="ni ni-settings"></i></a>';
            //     }
            // }
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

  


        // Function to handle edit_data
        function edit_data(id) {
            // Fetch the current item details from the server
            $.ajax({
                url: "../castingmrs/get_prresult_details/" + id,
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

                        // Show modal with pre-filled form fields
                        $('#edit_modal').modal('show');
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
line: $('#edit_line').val(),
serial: $('#edit_serial').val(),
trayno: $('#edit_trayno').val(),
ng_qty: $('#ng_qty').val(),
category: $('#category').val(),
remarks: $('#remarks').val(),
userdata: $('#userdata').val()
// Add any other form fields as needed
};

// Perform validation

var ng_qty = parseInt(formData.ng_qty);
var remarks = formData.remarks.trim();

if (ng_qty < 0) {
// Handle invalid input, perhaps show an alert
Swal.fire({
icon: 'error',
title: 'Invalid Input',
text: 'Quantity Lost must be valid numbers.'
});
return; // Exit the function to prevent further execution
}


// Check if remarks field is required and empty
if (remarks.trim() === '') {
Swal.fire({
    icon: 'error',
    title: 'Error',
    text: 'Remarks field cannot be empty'
});
return; // prevent form submission
}
// Perform an AJAX request to save the edited data
$.ajax({
url: "../castingmrs/update_prresults",
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
        title: 'Quantity lost is greater than quantity',
        text: 'Please Check Quantity!'
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


