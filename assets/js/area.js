

$(document).ready(function () {
    // DataTable initialization
    var table = $('#items_table').DataTable({
        "ajax": "../areas/get_areas",
        // "ajax": {
        //     url: "../areas/get_areas",
        //     method: 'POST'
        // },
        "columns": [
            {
                data: 'id',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'area',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'location',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'created_by',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'created_at',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'id',
                orderable: false,
                className: 'text-center font-size-14 py-0 px-1',
                render: function (data, type, row, meta) {
                    return '<a class="me-2 btn-sm editbtn rounded-0 py-0 edit_data" href="javascript:void(0)" data-id="' + (row.id) + '" data-url="../areas/get_area_details/"><i class="ni ni-settings"></i></a>' +
        '<a class="me-2 btn-sm deletebtn rounded-0 py-0 delete_data" href="javascript:void(0)" data-id="' + (row.id) + '"><i class="ni ni-fat-remove"></i></a>';
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
           
                {
                    text: '<a class="text-white addbtn"><i class="fas fa-plus text-white"></i>&nbsp; Add Area</a>',
                    className: "buttontest",
                    action: function (e, dt, node, config) {
                        $('#add_model').modal('show');
        
                        // Make the modal draggable and resizable
                        $("#add_model").draggable({
                            handle: ".modal-header" // Specify the header as the handle for dragging
                        }).resizable(); // Make the modal resizable
                    }
            },
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

    function validateForm() {

    var area = $('#area').val().trim();
    var location = $('#location').val().trim();
   
    
    if (area === '') {
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'Area field cannot be empty'
        });
        return false; // prevent form submission
    } else if (location === '') {
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'Location field cannot be empty'
        });
        return false; // prevent form submission
    }
    
    return true; // allow form submission
}

    function addArea() {
    if (!validateForm()) return; // validate the form before proceeding
    var areaName = $('#area').val();
    var locationName = $('#location').val();
    var userdata = $('#userdata').val();

    $.post("../areas/add_area", 
    // "ajax": {
    //     url: "../areas/get_areas",
    //     method: 'POST'
    // },
    { areaName: areaName, locationName: locationName, userdata: userdata })
        .done(function (data) {
            if (data.status == 'success') {
                Swal.fire({
                    icon: 'success',
                    title: 'Success',
                    text: data.message,
                    showConfirmButton: false,
                    timer: 1500
                });

                table.ajax.reload();
                $('#add_model').modal('hide');
                $('#area').val('');
                $('#location').val('');
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: data.message
                });
            }
        })
        .fail(function (xhr, status, error) {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'Failed to add area. Please try again later.'
            });
        });
}

$(document).on('click', '#saveChangesBtn', function (event) {
    event.preventDefault();
    addArea();
});


// Function to handle edit_data
function edit_data(id) {
// Fetch the current item details from the server
$.ajax({
url: "../areas/get_area_details/" + id,
type: "GET",
dataType: "json",
success: function (data) {
// Log the data received from the server
console.log("Data Received:", data);

// Check if the response contains line_details
if (data.area_details) {
    var existingId = data.area_details.id;
    var existingArea = data.area_details.area;
    var existingLocation = data.area_details.location;
   
    // Log the existing data
    console.log("Existing Line:", existingId);
    console.log("Existing Area:", existingArea);
    console.log("Existing Location:", existingLocation);

    // Populate form fields in the modal with existing data
    $('#edit_id').val(existingId);
    $('#edit_area').val(existingArea);
    $('#edit_location').val(existingLocation);


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
    area: $('#edit_area').val(),
    location: $('#edit_location').val(),
    userdata: $('#userdata').val()
    // Add any other form fields as needed
};

// Perform an AJAX request to save the edited data
$.ajax({
url: "../areas/update_area",
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
if (response.status === 'no_changes') {
Swal.fire({
    icon: 'info',
    title: 'No Changes',
    text: 'No changes were made.'
});
} else if (response.status === 'duplicate') {
Swal.fire({
    icon: 'warning',
    title: 'Duplicate Data',
    text: 'Combination of Area and Location already exists.'
});
} else {
// Show a SweetAlert success message upon successful save
Swal.fire({
    icon: 'success',
    title: 'Success',
    text: 'Data saved successfully!'
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






// Function to handle delete_data
function delete_data(id) {
// Show Swal confirmation modal
Swal.fire({
title: 'Delete Area',
text: 'Are you sure you want to delete this area?',
icon: 'warning',
showCancelButton: true,
confirmButtonText: 'Yes, delete it!',
cancelButtonText: 'Cancel',
confirmButtonColor: '#d33',
cancelButtonColor: '#3085d6',
}).then((result) => {
if (result.isConfirmed) {
// User confirmed, make an AJAX request to delete the item
$.ajax({
    url: "../areas/delete_area",
    type: "POST",
    data: { id: id },
    success: function (data) {
        console.log("Success:", data);
        // Reload the DataTable after deleting the item
        table.ajax.reload();
        Swal.fire({
            icon: 'success',
            title: 'Area Deleted Successfully!',
            showConfirmButton: false,
            timer: 1500
        });
    },
    error: function (xhr, status, error) {
        console.error("Error:", error);
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Something went wrong!',
        });
    }
});
}
});
}

// Attach click event to dynamically added elements
$('#items_table tbody').on('click', '.delete_data', function () {
var id = $(this).data('id');
delete_data(id);
});
});


