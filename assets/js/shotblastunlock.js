
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
        "ajax": "../shotblastunlocks/get_prresults",
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
                data: 'input_by',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'serial1',
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
                data: 'locked_date',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'locked_by',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'locked_details',
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
                data: 'id',
                orderable: false,
                className: 'py-0 px-1 text-center font-size-14',
                render: function (data, type, row, meta) {
                    return '<a class="btn-sm  view-remarks-btn rounded-0 py-0" data-id="' + row.id + '" data-toggle="modal" data-target="#remarksModal"><i class="ni ni-archive-2"></i></a>';
                }
            },
            
            {
                data: 'id',
                orderable: false,
                className: 'text-center font-size-14 py-0 px-1',
                render: function (data, type, row, meta) {
                    return '<a class="me-2 btn-sm editbtn rounded-0 py-0 delete_data" href="javascript:void(0)" data-id="' + (row.id) + '"><i class="ni ni-check-bold"></i></a>';
                    // '<a class="me-2 btn-sm deletebtn rounded-0 py-0 edit_data" href="javascript:void(0)" data-id="' + (row.id) + '" data-url="../shotblastsamplings/get_prresult_details/"><i class="ni ni-fat-remove"></i></a>'+
                    
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

  


      


// Function to handle delete_data
function delete_data(id) {

    // var fullname = "<?php echo $this->session->userdata('fullname'); ?>";
    // Show Swal confirmation modal
    Swal.fire({
    title: 'Accept Lot',
    text: 'Are you sure you want to accept this lot?',
    icon: 'warning',
    showCancelButton: true,
    confirmButtonText: 'Yes, accept it!',
    cancelButtonText: 'Cancel',
    confirmButtonColor: '#74E291',
    cancelButtonColor: '#3085d6',
    }).then((result) => {
    if (result.isConfirmed) {
    // User confirmed, make an AJAX request to delete the item
    $.ajax({
        url: "../shotblastunlocks/accept_lot",
        type: "POST",
        data: { 
            id: id },
        success: function (data) {
            console.log("Success:", data);
            // Reload the DataTable after deleting the item
            table.ajax.reload();
            Swal.fire({
                icon: 'success',
                title: 'Accepted Lot Successfully!',
                showConfirmButton: false,
                timer: 1500
            });
            // table.ajax.reload();
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
