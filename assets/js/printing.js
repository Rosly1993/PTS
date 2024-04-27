

$(document).ready(function () {
    // DataTable initialization
    var table = $('#items_table').DataTable({
        "ajax": "../printing/get_areas",
        "columns": [
            {
                data: 'id',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'mfi_serial',
                className: 'py-0 px-1 text-left font-size-14'
            },
            {
                data: 'plate_serial',
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
                data: 'input_by',
                className: 'py-0 px-1 text-left font-size-14'
            },
            {
                data: 'input_date',
                className: 'py-0 px-1 text-center font-size-14'
            },
            {
                data: 'actual',
                className: 'py-0 px-1 text-center font-size-14'
            },
           
            {
                data: 'id',
                orderable: false,
                className: 'text-center font-size-14 py-0 px-1',
                render: function (data, type, row, meta) {
                    return '<a class="me-2 btn-sm editbtn rounded-0 py-0 edit_data" href="javascript:void(0)" data-id="' + (row.id) + '"><i class="ni ni-settings"></i></a>' ;
                }
            }
        ],
        "rowGroup": {
            // Group by the 'mfi_serial' column
            "dataSrc": "mfi_serial"
        },
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
            
        ]
    });

    // Add the buttons to the layout
    table.buttons().container().appendTo($('.dataTables_length', table.wrapper));

    // Delegate click event to dynamically added elements
    $('#items_table tbody').on('click', '.edit_data', function () {
        var id = $(this).data('id');
        edit_data(id);
    });

   

    function edit_data(id) {
        $.ajax({
            url: "../printing/get_area_details/" + id,
            type: "GET",
            dataType: "json",
            success: function (data) {
                console.log("Data Received:", data);
    
                if (data.area_details) {
                    var areaDetails = data.area_details;
    
                    var htmlContent = '<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8"><title>Area Details</title>';
                    htmlContent += '<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">';
                    htmlContent += '<style>';
                    htmlContent += 'body { padding: 20px; }';
                    htmlContent += '@media print {';
                    htmlContent += '  @page { size: A4; margin: 20mm; }';  // Adjusting page size and margins for printing
                    htmlContent += '  body { font-size: 100pt; }';         // Smaller text on printed page
                    htmlContent += '  table { width: 100%; font-size: 80pt; }';  // Full-width tables with smaller text
                    htmlContent += '  .no-print { display: none; }';     // Elements with class "no-print" will not be shown
                    htmlContent += '}';
                    htmlContent += '</style></head><body>';
                    htmlContent += '<h1 class="no-print">Serial Details</h1>';  // The header won't print
                    htmlContent += '<table class="table table-bordered"><thead class="thead-light"><tr>';
                    htmlContent += '<th>ID</th><th>Serial</th><th>Model</th><th>Cavity</th><th>Quantity</th>';
                    htmlContent += '<th>Quantity Lost</th><th>Actual Quantity</th><th>MFI Line</th>';
                    htmlContent += '<th>Combined By</th><th>Date</th></tr></thead><tbody>';
    
                    areaDetails.forEach(function (item) {
                        var quantityDifference = item.quantity - item.quantity_lost;
                        htmlContent += '<tr><td>' + item.id + '</td><td>' + item.serial1 + '</td><td>' + item.model + '</td>';
                        htmlContent += '<td>' + item.cavity + '</td><td>' + item.quantity + '</td>';
                        htmlContent += '<td>' + item.quantity_lost + '</td><td>' + quantityDifference + '</td>';
                        htmlContent += '<td>' + item.line + '</td><td>' + item.input_by + '</td><td>' + item.input_date + '</td></tr>';
                    });
    
                    htmlContent += '</tbody></table></body></html>';
    
                    var newWindow = window.open('', '_blank');
                    newWindow.document.open();
                    newWindow.document.write(htmlContent);
                    newWindow.document.close();
                } else {
                    console.error('Failed to fetch item details.');
                    alert('Failed to fetch item details.');
                }
            },
            error: function (xhr, status, error) {
                console.error("AJAX Error:", error);
                alert('Error loading data.');
            }
        });
    }
    
    
    
    function updateStatus(statusUpdates) {
        $.ajax({
            url: "../printing/update_status",
            type: "POST",
            dataType: "json",
            data: { status_updates: statusUpdates },
            success: function(response) {
                Swal.fire({
                    icon: 'success',
                    title: 'Success',
                    text: 'Successfully Transacted Data',
                    showConfirmButton: false,
                    timer: 1500
                });

                table.ajax.reload();
                $('#edit_modal').modal('hide');
                // console.log("Status updated successfully.");
            },
            error: function(xhr, status, error) {
                // Handle error
                console.error("Error updating status:", error);
            }
        });
    }
});