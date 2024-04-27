
$(document).ready(function () {
    var table = $('#items_table').DataTable({
        "ajax": {
            "url": "../history/get_prresults",
            "data": function (d) {
                d.serial = $('#serial').val(); // Add line filter value
            }
        },
        "columns": [
            {
                data: 'id',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'serial',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'unique',
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
                data: 'model',
                className: 'py-0 px-1 text-center font-size-14',
                
            },
            {
                data: 'model',
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
                className: 'py-0 px-1 text-center font-size-14',
                render: function (data, type, row, meta) {
                    return '<a class="btn-sm  view-history-btn rounded-0 py-0" data-id="' + row.id + '" data-toggle="modal" data-target="#historyModal"><i class="ni ni-book-bookmark"></i></a>';
                }
            },
            // {
            //     data: 'debplan',
            //     className: 'py-0 px-1 text-center font-size-14',
            //     render: function(data, type, row, meta) {
            //         // Assuming the 'attachment' field contains the full URL to the PDF file
            //         if (data) {
            //             // Extract the filename from the URL
            //             var filename = data.substring(data.lastIndexOf('/') + 1);
            //             return '<a href="/PartsTraceabilitySystem/uploads/' + filename + '" class="pdf-link" target="_blank"><i class="fa fa-file-pdf fa-2x deletebtn"></i></a>';
            //         } else {
            //             return ''; // Empty string if no attachment
            //         }
            //     }
            // },
          
        ],
        "responsive": true,
        "searching": false,  // Disable searching
            lengthMenu: [
                [10, 25, 50 ,100,  -1],
                [10, 25, 50 ,100,  "All"],
            ],

       
            "pageLength": 10,
            // "rowCallback": function(row, data) {
            //     if (data.area_status === '1' ) {
            //         $(row).addClass('text-white bg-info'); // Add red background to rows with disposition="NG"
                   
            //     }}
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
        //     {
        //         extend: 'excelHtml5',
        //         text: '<a class="text-white excelbtn"><i class="fa fa-file-excel  text-white"></i>&nbsp;&nbsp;Excel Download</a>',
        //         className: "buttontest",
        //         autoFilter: true,
        //         sheetName: 'Exported data',
        //         exportOptions: {
        //             columns: ':visible'
        //         },
        //         title: 'Traceability'
        //     },
        //     {
        //         extend: 'print',
        //         text: '<a class="text-white pdfbtn"><i class="fa fa-file-pdf text-white"></i>&nbsp;&nbsp;PDF Download</a>',
        //         className: "buttontest",
        //         autoFilter: true,
        //         orientation: 'landscape',
        //         sheetName: 'Exported data',
        //         exportOptions: {
        //             columns: ':visible'
        //         },
        //         title: 'Traceability'
        //     }
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
        url: "../medsamplings/get_prhistory_remarks/" + id,
        type: "GET",
        dataType: "json",
        success: function (data) {
            console.log("AJAX Success, Data Received:", data);  // Log entire data object

            // var remarksData = data.prresult_details_remarks;  // Extract remarks data
            // console.log("Remarks Data:", remarksData);
                            // Check if the response contains prresult_details_remarks
                         
            if (Array.isArray(data.prhistory_details_remarks)) {
                var remarksData = data.prhistory_details_remarks;
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
                    tableHtml += '<td>' + item.serial + '</td>';
                    tableHtml += '<td>' + item.unique + '</td>';
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


/// view history

               
function view_history(id) {
    console.log("Function called with ID:", id);  // Ensure ID is correct
    $.ajax({
        url: "../medsamplings/get_prhistory/" + id,
        type: "GET",
        dataType: "json",
        success: function (data) {
            console.log("AJAX Success, Data Received:", data);  // Log entire data object

            // var remarksData = data.prresult_details_remarks;  // Extract remarks data
            // console.log("Remarks Data:", remarksData);
                            // Check if the response contains prresult_details_remarks
                         
            if (Array.isArray(data.prhistory_details)) {
                var remarksData = data.prhistory_details;
                var modalBody = $('#historyModal .modal-body');
                modalBody.empty(); // Clear previous content

                // Create a table element
                var tableHtml = '<table class="table table-bordered">';
                // Add table header row
                tableHtml += '<tr>';
                tableHtml += '<th>Process/Area</th>';
                tableHtml += '<th>Line/Machine</th>';
                tableHtml += '<th>Date Scan-In</th>';
                tableHtml += '<th>Date Scan-Out</th>'; // Add new header for remarks
                tableHtml += '<th>Scan-In PIC</th>'; // Add new header for category
                tableHtml += '<th>Scan_Out PIC</th>'; // Add new header for category
                tableHtml += '<th>Remarks</th>'; // Add new header for area ID
                tableHtml += '</tr>';

                // Add table rows for each data object
                remarksData.forEach(function (item, index) {
                   // Trimming Area
                    tableHtml += '<tr>';
                    tableHtml += '<td>Trimming</td>';
                    tableHtml += '<td>' + (item.casting_machine || '') + '</td>';
                    tableHtml += '<td>' + (item.trimming_date || '') + '</td>';
                    tableHtml += '<td>' + (item.trimming_date || '') + '</td>';
                    tableHtml += '<td>' + (item.trimmer || '') + '</td>';
                    tableHtml += '<td>' + (item.trimmer || '') + '</td>';
                    tableHtml += '<td></td>';
                    tableHtml += '</tr>';

                    //Med Sampling
                    tableHtml += '<tr>';
                    tableHtml += '<td>Med Sampling</td>';
                    tableHtml += '<td>' + (item.casting_machine || '') + '</td>';
                    tableHtml += '<td>' + (item.med_sampling_date || '') + '</td>';
                    tableHtml += '<td>' + (item.med_sampling_date || '') + '</td>';
                    tableHtml += '<td>' + (item.med_sampler || '') + '</td>';
                    tableHtml += '<td>' + (item.med_sampler || '') + '</td>';
                    tableHtml += '<td></td>';
                    tableHtml += '</tr>';
                    //Deburring
                    tableHtml += '<tr>';
                    tableHtml += '<td>Deburring Area</td>';
                    tableHtml += '<td>' + (item.deburring_line || '') + '</td>';
                    tableHtml += '<td>' + (item.date_deburring_in || '') + '</td>';
                    tableHtml += '<td>' + (item.date_deburring_out || '') + '</td>';
                    tableHtml += '<td>' + (item.deburring_pic || '') + '</td>';
                    tableHtml += '<td>' + (item.deburring_pic_out || '') + '</td>';
                    tableHtml += '<td></td>';
                    tableHtml += '</tr>';
                     //Shotblast
                     tableHtml += '<tr>';
                     tableHtml += '<td>Shotblast Area</td>';
                     tableHtml += '<td>' + (item.shotblast_line || '') + '</td>';
                     tableHtml += '<td>' + (item.date_shotblast_in || '') + '</td>';
                     tableHtml += '<td>' + (item.date_shotblast_out || '') + '</td>';
                     tableHtml += '<td>' + (item.shotblast_pic || '') + '</td>';
                     tableHtml += '<td>' + (item.shotblast_pic_out || '') + '</td>';
                     tableHtml += '<td></td>';
                     tableHtml += '</tr>';
                    //Shotblast Sampling
                    tableHtml += '<tr>';
                    tableHtml += '<td>Shotblast Sampling</td>';
                    tableHtml += '<td>' + (item.shotblast_line || '') + '</td>';
                    tableHtml += '<td>' + (item.shotblastqa_lock_date || '') + '</td>';
                    tableHtml += '<td>' + (item.shotblastqa_unlock_date || '') + '</td>';
                    tableHtml += '<td>' + (item.shotblastqa_lock_by || '') + '</td>';
                    tableHtml += '<td>' + (item.shotblastqa_unlock_by || '') + '</td>';
                    tableHtml += '<td>' + (item.shotblastqa_lock_details || '') + '</td>';
                    tableHtml += '</tr>';

                    //Shotblast MRS
                    tableHtml += '<tr>';
                    tableHtml += '<td>Shotblast MRS</td>';
                    tableHtml += '<td>' + (item.shotblast_line || '') + '</td>';
                    tableHtml += '<td>' + (item.shotblastmrs_date || '') + '</td>';
                    tableHtml += '<td>' + (item.shotblastmrs_date || '') + '</td>';
                    tableHtml += '<td>' + (item.shotblastmrs_by || '') + '</td>';
                    tableHtml += '<td>' + (item.shotblastmrs_by || '') + '</td>';
                    tableHtml += '<td>' + (item.shotblastmrs_remarks || '') + '</td>';
                    tableHtml += '</tr>';

                    
                    //Annealing
                    tableHtml += '<tr>';
                    tableHtml += '<td>Annealing Area</td>';
                    tableHtml += '<td>' + (item.annealing_oven || '') + '</td>';
                    tableHtml += '<td>' + (item.annealing_date_in || '') + '</td>';
                    tableHtml += '<td>' + (item.annealing_pic_out || '') + '</td>';
                    tableHtml += '<td>' + (item.annealing_pic_in || '') + '</td>';
                    tableHtml += '<td>' + (item.annealing_date_out || '') + '</td>';
                    tableHtml += '<td></td>';
                    tableHtml += '</tr>';

                     //Machining
                     tableHtml += '<tr>';
                     tableHtml += '<td>Machining Area</td>';
                     tableHtml += '<td>' + (item.machining_line || '') + '</td>';
                     tableHtml += '<td>' + (item.machining_date_in || '') + '</td>';
                     tableHtml += '<td>' + (item.machining_date_out || '') + '</td>';
                     tableHtml += '<td>' + (item.machining_pic_in || '') + '</td>';
                     tableHtml += '<td>' + (item.machining_pic_out || '') + '</td>';
                     tableHtml += '<td></td>';
                     tableHtml += '</tr>';

                    //Machining Split Lot
                    tableHtml += '<tr>';
                    tableHtml += '<td>Split Lot From ' + (item.from_serial || '') + ' - ' + (item.from_unique || '') + '</td>';
                    tableHtml += '<td>' + (item.machining_line || '') + '</td>';
                    tableHtml += '<td>' + (item.date_split || '') + '</td>';
                    tableHtml += '<td>' + (item.date_split || '') + '</td>';
                    tableHtml += '<td>' + (item.split_by || '') + '</td>';
                    tableHtml += '<td>' + (item.split_by || '') + '</td>';
                    tableHtml += '<td>' + (item.reason_split || '') + '</td>';
                    tableHtml += '</tr>';

                    //Machining Split Lot QA
                    tableHtml += '<tr>';
                    tableHtml += '<td>Split Lot Judgement</td>';
                    tableHtml += '<td>' + (item.machining_line || '') + '</td>';
                    tableHtml += '<td>' + (item.qa_split_date || '') + '</td>';
                    tableHtml += '<td>' + (item.date_split || '') + '</td>';
                    tableHtml += '<td>' + (item.qa_split_pic || '') + '</td>';
                    tableHtml += '<td>' + (item.split_by || '') + '</td>';
                    tableHtml += '<td>' + (item.qa_split_judge || '') + ' - ' + (item.reason_split || '') + '</td>';
                    tableHtml += '</tr>';
                     //Machining MRS Wet
                    tableHtml += '<tr>';
                    tableHtml += '<td>MRS Wet</td>';
                    tableHtml += '<td>' + (item.machining_line || '') + '</td>';
                    tableHtml += '<td>' + (item.mrs_wet_date || '') + '</td>';
                    tableHtml += '<td>' + (item.mrs_wet_date || '') + '</td>';
                    tableHtml += '<td>' + (item.mrs_wet_pic || '') + '</td>';
                    tableHtml += '<td>' + (item.mrs_wet_pic || '') + '</td>';
                    tableHtml += '<td>' + (item.mrs_wet_details || '') + '</td>';
                    tableHtml += '</tr>';

                     //Machining IPQE Inline
                    tableHtml += '<tr>';
                    tableHtml += '<td>Machining IPQE Inline</td>';
                    tableHtml += '<td>' + (item.machining_line || '') + '</td>';
                    tableHtml += '<td>' + (item.date_ipqc_mc || '') + '</td>';
                    tableHtml += '<td>' + (item.date_ipqc_mc || '') + '</td>';
                    tableHtml += '<td>' + (item.ipqc_pic || '') + '</td>';
                    tableHtml += '<td>' + (item.ipqc_pic || '') + '</td>';
                    tableHtml += '<td>' + (item.ipqc_mc_judge || '') + '</td>';

                    //Machining IPQE Dimension
                    tableHtml += '<tr>';
                    tableHtml += '<td>Machining IPQE Dimension</td>';
                    tableHtml += '<td>' + (item.machining_line || '') + '</td>';
                    tableHtml += '<td>' + (item.qa_dimension_date || '') + '</td>';
                    tableHtml += '<td>' + (item.qa_dimension_date || '') + '</td>';
                    tableHtml += '<td>' + (item.qa_dimension_pic || '') + '</td>';
                    tableHtml += '<td>' + (item.qa_dimension_pic || '') + '</td>';
                    tableHtml += '<td>' + (item.qa_dimension_judgement || '') + ' - ' + (item.qa_dimension_remarks || '') + '</td>';
                   
                    //Bubble Wash
                    tableHtml += '<tr>';
                    tableHtml += '<td>BubbleWash Area</td>';
                    tableHtml += '<td>' + (item.bubblewashin_line || '') + '</td>';
                    tableHtml += '<td>' + (item.bubblewashin_date || '') + '</td>';
                    tableHtml += '<td>' + (item.bubblewashout_date || '') + '</td>';
                    tableHtml += '<td>' + (item.bubblewashin_pic || '') + '</td>';
                    tableHtml += '<td>' + (item.bubblewashout_pic || '') + '</td>';
                    tableHtml += '<td></td>';

                    //Oven
                    tableHtml += '<tr>';
                    tableHtml += '<td>Oven Area</td>';
                    tableHtml += '<td>' + (item.ovenin_line || '') + '</td>';
                    tableHtml += '<td>' + (item.ovenin_date || '') + '</td>';
                    tableHtml += '<td>' + (item.ovenout_date || '') + '</td>';
                    tableHtml += '<td>' + (item.ovenin_pic || '') + '</td>';
                    tableHtml += '<td>' + (item.ovenout_pic || '') + '</td>';
                    tableHtml += '<td></td>';

                     //Machining MRS DRY
                     tableHtml += '<tr>';
                     tableHtml += '<td>MRS Dry</td>';
                     tableHtml += '<td>' + (item.machining_line || '') + '</td>';
                     tableHtml += '<td>' + (item.mrs_dry_date || '') + '</td>';
                     tableHtml += '<td>' + (item.mrs_dry_date || '') + '</td>';
                     tableHtml += '<td>' + (item.mrs_dry_pic || '') + '</td>';
                     tableHtml += '<td>' + (item.mrs_dry_pic || '') + '</td>';
                     tableHtml += '<td>' + (item.mrs_dry_details || '') + '</td>';
                     tableHtml += '</tr>';
                    
                     //Machining MRS DRY
                     tableHtml += '<tr>';
                     tableHtml += '<td>MRS Dry QA</td>';
                     tableHtml += '<td>' + (item.machining_line || '') + '</td>';
                     tableHtml += '<td>' + (item.mrs_dryqa_date || '') + '</td>';
                     tableHtml += '<td>' + (item.mrs_dryqa_date || '') + '</td>';
                     tableHtml += '<td>' + (item.mrs_dryqa_pic || '') + '</td>';
                     tableHtml += '<td>' + (item.mrs_dryqa_pic || '') + '</td>';
                     tableHtml += '<td>' + (item.mrsdry_qa_status || '') + '</td>';
                     tableHtml += '</tr>';

                     //MFI
                     tableHtml += '<tr>';
                     tableHtml += '<td>MFI Area</td>';
                     tableHtml += '<td>' + (item.mfi_line || '') + '</td>';
                     tableHtml += '<td>' + (item.mfiin_date || '') + '</td>';
                     tableHtml += '<td>' + (item.mfiout_date || '') + '</td>';
                     tableHtml += '<td>' + (item.mfiin_pic || '') + '</td>';
                     tableHtml += '<td>' + (item.mfiout_pic || '') + '</td>';
                     tableHtml += '<td>' + (item.mfi_serial || '') + '</td>';
                     tableHtml += '</tr>';
                
                   
                });
                tableHtml += '</table>';

                // Append the table HTML to the modal body
                modalBody.append(tableHtml);
                $('#historyModal').modal('show'); // Show modal with table content
                $("#historyModal").draggable({
                    handle: ".modal-header" // Specify the header as the handle for dragging
                }).resizable(); // Make the modal resizable
            } else {
                $('#historyModal .modal-body').text('No data available.'); // Display message if no data
                $('#historyModal').modal('show'); // Show modal even if there's no data
                $("#historyModal").draggable({
                    handle: ".modal-header" // Specify the header as the handle for dragging
                }).resizable(); // Make the modal resizable
            }


                
            }
            });
            }


            // Assuming you use the click event initialization after the document is ready
            $(document).ready(function() {
                $('#items_table tbody').on('click', '.view-history-btn', function() {
                    var id = $(this).data('id');
                    view_history(id);
                });
            });



});



