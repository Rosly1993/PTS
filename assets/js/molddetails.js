
   function showHideCavityFields() {
    var cavity_no = document.getElementById("cavity_no").value;
    var cavity_fields = document.getElementById("cavity_fields");
    
    // Clear previous cavity fields
    cavity_fields.innerHTML = "";
    
    // Show cavity fields if cavity number is not empty
    if (cavity_no.trim() !== "") {
        // Show cavity fields based on selected cavity number
        for (var i = 1; i <= cavity_no; i++) {
            var label = document.createElement("label");
            label.setAttribute("for", "cavity" + i);
            label.innerText = "Cavity" + i;
            label.classList.add("control-label");
            label.innerHTML += "<span style='color:red'>*</span>";
            
            var input = document.createElement("input");
            input.setAttribute("type", "text");
            input.setAttribute("style", "height: 38px");
            input.classList.add("form-control", "input-lg");
            input.setAttribute("id", "cavity" + i);
            input.setAttribute("name", "cavity" + i);
            input.setAttribute("placeholder", "Cavity" + i);
            input.setAttribute("required", "required"); // Always add required attribute
            
            input.setAttribute("autocomplete", "off");
            
            var div = document.createElement("div");
            div.classList.add("form-group", "col-md-3");
            div.appendChild(label);
            div.appendChild(input);
            
            cavity_fields.appendChild(div);
        }
    }
}


            $(document).ready(function () {
                // DataTable initialization
                var table = $('#items_table').DataTable({
                    "ajax": "../molddetails/get_molddetails",
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
                            data: 'cavity1',
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
                    //     {
                    //         data: 'cavity4',
                    //         className: 'py-0 px-1 text-center'
                    //     },
                    //     {
                    //         data: 'id',
                    //         orderable: false,
                    //         className: 'text-center py-0 px-1',
                    //         render: function (data, type, row, meta) {
                    //             return '<a class="me-2 btn-sm editbtn rounded-0 py-0 edit_data" href="javascript:void(0)" data-id="' + (row.id) + '" data-url="<?php echo base_url('index.php/molddetails/get_molddetails_details/'); ?>"><i class="ni ni-settings"></i></a>' ;
                    // // '<a class="me-2 btn-sm deletebtn rounded-0 py-0 delete_data" href="javascript:void(0)" data-id="' + (row.id) + '"><i class="ni ni-fat-remove"></i></a>';
                    //         }
                    //     }
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
                            text: '<a class="text-white addbtn"><i class="fas fa-plus text-white"></i>&nbsp; Add Tooling Details</a>',
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
                var modelName = $('#model').val().trim();
                var moldName = $('#mold_no').val().trim();
                var cavity_no = $('#cavity_no').val().trim();
                var cavity1Name = $('#cavity1').val().trim();
                
                if (modelName === '') {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'Model field cannot be empty'
                    });
                    return false; // prevent form submission
                } else if (moldName === '') {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'Tooling Number field cannot be empty'
                    });
                    return false; // prevent form submission
                } else if (cavity_no === '') {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'Cavity No field cannot be empty'
                    });
                    return false; // prevent form submission
                } else if (cavity1Name === '') {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'Cavity1 field cannot be empty'
                    });
                    return false; // prevent form submission
                }
                
                return true; // allow form submission
            }



                function addMolddetails() {
                if (!validateForm()) return; // validate the form before proceeding

                var modelName = $('#model').val();
                var moldName = $('#mold_no').val();
                var cavity_no = $('#cavity_no').val();
                var cavity1Name = $('#cavity1').val();
                var cavity2Name = $('#cavity2').val();
                var cavity3Name = $('#cavity3').val();
                var cavity4Name = $('#cavity4').val();
                var userdata = $('#userdata').val();

                $.post("../molddetails/add_molddetails", { model: modelName, mold_no: moldName, cavity_no: cavity_no, cavity1: cavity1Name, cavity2: cavity2Name, cavity3: cavity3Name, cavity4: cavity4Name, userdata: userdata })
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
                            $('#model').val('');
                            $('#mold_no').val('');
                            $('#cavity_no').val('');
                            $('#cavity1').val('');
                            $('#cavity2').val('');
                            $('#cavity3').val('');
                            $('#cavity4').val('');
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
                addMolddetails();
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
                text: 'Combination of Tooling Number already exists.'
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


