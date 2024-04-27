
$(document).ready(function() {
  $('#model').change(function() {
    var selectedModel = $(this).val();
    console.log('Selected Model:', selectedModel);

    // Clear the mold_no and cavity dropdowns
    $('#mold_no').empty().append('<option value="">Select Mold No</option>');
    $('#cavity').empty().append('<option value="">Select Cavity</option>');

    // Send AJAX request to fetch mold_no options based on the selected model
    $.ajax({
      url: '../debplans/get_mold_numbers',
      type: 'POST',
      dataType: 'json',
      data: {model: selectedModel},
      success: function(response) {
        console.log('Mold Numbers Response:', response);
        if (response && response.length > 0) {
          // Populate mold_no options based on the response array
          $.each(response, function(index, moldNo) {
            $('#mold_no').append('<option value="' + moldNo + '">' + moldNo + '</option>');
          });
        } else {
          // If no mold_no available, display "No mold_no"
          $('#mold_no').append('<option value="">No mold number</option>');
        }
      },
      error: function() {
        // If there is an error in the AJAX request, display "No mold_no"
        $('#mold_no').append('<option value="">No mold number</option>');
      }
    });
  });

  $('#mold_no').change(function() {
    var selectedMoldNo = $(this).val();
    console.log('Selected Mold No:', selectedMoldNo);

    // Clear the cavity dropdown
    $('#cavity').empty().append('<option value="">Select Cavity</option>');

    // Send AJAX request to fetch cavity options based on the selected mold_no
    $.ajax({
      url: '../debplans/get_cavities_by_mold_number',
      type: 'POST',
      dataType: 'json',
      data: {mold_no: selectedMoldNo},
      success: function(response) {
        console.log('Cavity Response:', response);
        if (response && response.length > 0) {
          // Populate cavity options based on the response array
          $.each(response, function(index, cavity) {
            $('#cavity').append('<option value="' + cavity + '">' + cavity + '</option>');
          });
        } else {
          // If no cavities available, display "No cavity"
          $('#cavity').append('<option value="">No cavity</option>');
        }
      },
      error: function() {
        // If there is an error in the AJAX request, display "No cavity"
        $('#cavity').append('<option value="">No cavity</option>');
      }
    });
  });
});

        $(document).ready(function () {
    // DataTable initialization
    var table = $('#items_table').DataTable({
        "ajax": "../debplans/get_debplans",
        "columns": [
            {
                data: 'id',
                className: 'py-0 px-1 text-center font-size-14 custom-height-30'
            },
            {
                data: 'model',
                className: 'py-0 px-1 text-center font-size-14 custom-height-30'
            },
            {
                data: 'mold_no',
                className: 'py-0 px-1 text-center font-size-14 custom-height-30'
            },
            {
                data: 'cavity',
                className: 'py-0 px-1 text-center font-size-14 custom-height-30'
            },
            {
                data: 'created_by',
                className: 'py-0 px-1 text-center font-size-14 custom-height-30'
            },
            {
                data: 'created_at',
                className: 'py-0 px-1 text-center font-size-14 custom-height-30'
            },
            {
                data: 'attachment',
                className: 'py-0 px-1 text-center font-size-14 custom-height-30',
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
                [10, 25, 50 ,100,  -1],
                [10, 25, 50 ,100,  "All"],
            ],


            "pageLength": 10,
    });

    // Open PDF links in new tab
    $('#items_table').on('click', 'a.pdf-link', function(event) {
        event.preventDefault(); // Prevent the default link behavior
        var url = $(this).attr('href');
        window.open(url, '_blank');
    });


                // Buttons initialization
                new $.fn.dataTable.Buttons(table, {
                    buttons: [
                        {
                            text: '<a class="text-white addbtn"><i class="fas fa-plus text-white "></i>&nbsp; Add Deburring Plan</a>',
                            className: "buttontest",
                            action: function (e, dt, node, config) {
                                $('#add_model').modal('show');
                             // Make the modal draggable and resizable
                        $("#add_model").draggable({
                            handle: ".modal-header" // Specify the header as the handle for dragging
                        }).resizable(); // Make the modal resizable
                    }
                        },
                        // {
                        //     extend: 'excelHtml5',
                        //     text: '<a class="text-white excelbtn"><i class="fa fa-file-excel  text-white"></i>&nbsp;&nbsp;Excel Download</a>',
                        //     className: "buttontest",
                        //     autoFilter: true,
                        //     sheetName: 'Exported data',
                        //     exportOptions: {
                        //         columns: ':visible'
                        //     },
                        //     title: 'Traceability'
                        // },
                        // {
                        //     extend: 'print',
                        //     text: '<a class="text-white pdfbtn"><i class="fa fa-file-pdf text-white"></i>&nbsp;&nbsp;PDF Download</a>',
                        //     className: "buttontest",
                        //     autoFilter: true,
                        //     orientation: 'landscape',
                        //     sheetName: 'Exported data',
                        //     exportOptions: {
                        //         columns: ':visible'
                        //     },
                        //     title: 'Traceability'
                        // }
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
                var model = $('#model').val().trim();
                var mold_no = $('#mold_no').val().trim();
                var cavity = $('#cavity').val().trim();
                var attachment = $('#attachment').val().trim();
                
                if (model === '') {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'Model field cannot be empty'
                    });
                    return false; // prevent form submission
                } else if (mold_no === '') {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'Mold No field cannot be empty'
                    });
                    return false; // prevent form submission
                } else if (cavity === '') {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'Cavity No field cannot be empty'
                    });
                    return false; // prevent form submission
                } else if (attachment === '') {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'Attachment field cannot be empty'
                    });
                    return false; // prevent form submission
                }
                
                return true; // allow form submission
            }

                function addDebplans() {
                if (!validateForm()) return; // validate the form before proceeding
                var formData = new FormData($('#addItemForm')[0]); // Creating FormData object from form

                $.ajax({
                    url: "../debplans/add_debplans",
                    type: "POST",
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function(data) {
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
                            $('#addItemForm')[0].reset(); // Reset form
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Error',
                                text: data.message
                            });
                        }
                    },
                    error: function(xhr, status, error) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Error',
                            text: 'Failed to add area. Please try again later.'
                        });
                    }
                });
            }

            $(document).on('click', '#saveChangesBtn', function(event) {
                event.preventDefault();
                addDebplans();
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


