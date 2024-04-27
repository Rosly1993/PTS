
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
        // Concatenate cavity options into a single string
        var cavities = response.join(', ');
        // Populate cavity options based on the concatenated string
        $('#cavity').append('<option value="' + cavities + '">' + cavities + '</option>');
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
                    "ajax": "../lotdetails/get_active_lotdetails",
                    "columns": [
                        {
                            data: 'id',
                            className: 'py-0 px-1 text-center font-size-14'
                        },
                        {
                            data: 'machine',
                            className: 'py-0 px-1 text-center font-size-14'
                        },
                        {
                            data: 'model',
                            className: 'py-0 px-1 text-center font-size-14'
                        },
                        {
                            data: 'mold_no',
                            className: 'py-0 px-1 text-center font-size-14'
                        },
                        {
                            data: 'cavity',
                            className: 'py-0 px-1 text-center font-size-14'
                        },
                        {
                            data: 'ingot_no',
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
                    //     {
                    //         data: 'cavity4',
                    //         className: 'py-0 px-1 text-center font-size-14'
                    //     },
                        {
                            data: 'id',
                            orderable: false,
                            className: 'text-center font-size-14 py-0 px-1',
                            render: function (data, type, row, meta) {
                                return '<a class="me-2 btn-sm deletebtn rounded-0 py-0 delete_data" href="javascript:void(0)" data-id="' + (row.id) + '"><i class="ni ni-fat-remove"></i></a>';
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
                            text: '<a class="text-white addbtn"><i class="fas fa-plus text-white "></i>&nbsp; Add Lot Details</a>',
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
                var machine = $('#machine').val().trim();
                var model = $('#model').val().trim();
                var mold_no = $('#mold_no').val().trim();
                var cavity = $('#cavity').val().trim();
                var ingot_no = $('#ingot_no').val().trim();
                
                if (machine === '') {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'Machine field cannot be empty'
                    });
                    return false; // prevent form submission
                } else if (model === '') {
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
                        text: 'Cavity field cannot be empty'
                    });
                    return false; // prevent form submission
             
             } else if (ingot_no === '') {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'Ingot No field cannot be empty'
                    });
                    return false; // prevent form submission
                }
                return true; // allow form submission
            }



                function addLotdetails() {
                if (!validateForm()) return; // validate the form before proceeding

                var machine = $('#machine').val();
                var model = $('#model').val();
                var mold_no = $('#mold_no').val();
                var cavity = $('#cavity').val();
                var tray_size = $('#tray_size').val();
                var ingot_no = $('#ingot_no').val();
                var userdata = $('#userdata').val();

                $.post("../lotdetails/add_lotdetails", { machine: machine, model: model, mold_no: mold_no, cavity: cavity, ingot_no: ingot_no, userdata: userdata , tray_size: tray_size  })
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
                            $('#machine').modal('hide');
                            $('#model').val('');
                            $('#mold_no').val('');
                 
                            $('#tray_size').val('');
                            $('#cavity').val('');
                            
                            $('#ingot_no').val('');
                           
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
                addLotdetails();
            });


// Function to handle edit_data
function edit_data(id) {
    // Fetch the current item details from the server
    $.ajax({
        url: "../molddetails/get_molddetails_details/" + id,
        type: "GET",
        dataType: "json",
        success: function (data) {
            // Log the data received from the server
            console.log("Data Received:", data);

            // Check if the response contains line_details
            if (data.molddetails_details) {
                var existingId = data.molddetails_details.id;
                var existingModel = data.molddetails_details.model;
                var existingMoldno = data.molddetails_details.mold_no;
                var existingCavity1 = data.molddetails_details.cavity1;
                var existingCavity2 = data.molddetails_details.cavity2;
                var existingCavity3 = data.molddetails_details.cavity3;
                var existingCavity4 = data.molddetails_details.cavity4;
                
               
                // Log the existing data
                console.log("Existing Line:", existingId);
                console.log("Existing Model:", existingModel);
                console.log("Existing Moldno:", existingMoldno);
                console.log("Existing Cavity1:", existingCavity1);
                console.log("Existing Cavity2:", existingCavity2);
                console.log("Existing Cavity3:", existingCavity3);
                console.log("Existing Cavity4:", existingCavity4);

                // Populate form fields in the modal with existing data
                $('#edit_id').val(existingId);
                $('#edit_model').val(existingModel);
                $('#edit_moldno').val(existingMoldno);
                $('#edit_cavity1').val(existingCavity1);
                $('#edit_cavity2').val(existingCavity2);
                $('#edit_cavity3').val(existingCavity3);
                $('#edit_cavity4').val(existingCavity4);
              
           

                // Show modal with pre-filled form fields
                $('#edit_modal').modal('show');
            } else {
                // Handle error or show a message if item details are not available
                console.error('Failed to fetch mold details.');
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
                model: $('#edit_model').val(),
                mold_no: $('#edit_moldno').val(),
                cavity1: $('#edit_cavity1').val(),
                cavity2: $('#edit_cavity2').val(),
                cavity3: $('#edit_cavity3').val(),
                cavity4: $('#edit_cavity4').val(),
                userdata: $('#userdata').val()
                // Add any other form fields as needed
            };

            // Perform an AJAX request to save the edited data
            $.ajax({
    url: "../molddetails/update_molddetails",
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
                text: 'Combination of Mold already exists.'
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
        title: 'Deactivate Tool',
        text: 'Are you sure you want to deactivate this tool?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Yes, deactivate it!',
        cancelButtonText: 'Cancel',
        confirmButtonColor: '#d33',
        cancelButtonColor: '#3085d6',
    }).then((result) => {
        if (result.isConfirmed) {
            // User confirmed, make an AJAX request to delete the item
            $.ajax({
                url: "../lotdetails/delete_lotdetails",
                type: "POST",
                data: { id: id },
                success: function (data) {
                    console.log("Success:", data);
                    // Reload the DataTable after deleting the item
                    table.ajax.reload();
                    Swal.fire({
                        icon: 'success',
                        title: 'Tooling Deactivated Successfully!',
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


