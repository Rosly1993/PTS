
$(document).ready(function() {
    // Store added ID numbers in a Set for quick lookup
    var addedIds = new Set();

    $('#employeeForm').submit(function(e) {
        e.preventDefault(); // Prevent default form submission

        var idNumber = $('input[name="id_number"]').val().trim(); // Get the ID number from the input and remove leading/trailing whitespace

        // Check if the ID number is empty
        if (idNumber === '') {
            Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'Serial is empty!'
                });
            return; // Exit the function if ID number is empty
        }

        // Reset the textbox color before making the AJAX request
        $('input[name="id_number"]').removeClass('error');
        $('input[name="id_number"]').removeClass('success');

        // Check if the ID number is already added
        if (addedIds.has(idNumber)) {
            console.log("ID number already exists in the table:", idNumber);
            return; // Exit the function to avoid adding duplicate entry
        }

        $.ajax({
            url: "../sublotcombine/get_employee_details",
            type: "GET",
            dataType: "json",
            data: { id_number: idNumber },
            success: function(response) {
                console.log("Response from server:", response);
                if (response && response.data) {
                    var employee = response.data;
                    
                    var id = employee.id;
                    var serial1 = employee.sublot_serial;
                    var model = employee.model;
                    var cavity = employee.cavity;
                    var quantity = employee.quantity;

                    var newRowContent = `<tr>
                                           
                                            <td>${id}</td>
                                            <td>${serial1}</td>
                                            <td>${model}</td>
                                            <td>${cavity}</td>
                                            <td>${quantity}</td>
                                            <td><button class="removeRowBtn btn btn-danger">Remove</button></td>
                                        </tr>`;
                    $('#items_table tbody').append(newRowContent);

                    // Add the ID to the set of added IDs
                    addedIds.add(idNumber);
                    $('input[name="id_number"]').addClass('success');
                } else {
                    // console.error("No data found in database.");
                    Swal.fire({
                        icon: 'error',
                        title: 'No Data Found!',
                        text: 'Please Check'
                    });
            return; // Exit the function if ID number is empty
            //         $('input[name="id_number"]').addClass('error');    
                }
            },
            error: function(xhr, status, error) {
                console.error("Error fetching data:", error);
            }
        });
    });

    // Add event delegation for dynamically created remove buttons
    $('#items_table').on('click', '.removeRowBtn', function() {
        $(this).closest('tr').remove();
        // You may also want to remove the ID from the addedIds set
    });
});



$('#save_appenddata_btn').click(function(e) {
    e.preventDefault(); // Prevent default form submission
   // Get all rows from the table body
   var tableRows = $('#items_table tbody tr');
   if (tableRows.length === 0) {
       Swal.fire({
           icon: 'error',
           title: 'Error',
           text: 'No Data to Save. Please Check!'
       });
       return; // Exit the function if there are no rows
   }

   // Retrieve model and cavity from the first row as the reference
   var firstRow = tableRows.eq(0); // This gets the first row
   var referenceModel = firstRow.find('td:nth-child(3)').text();


   var isValid = true;
   var errorMsg = '';

   var totalQuantity = 0;

   // Validate each row against the first row's model and cavity
   tableRows.each(function(index) {
       var model = $(this).find('td:nth-child(3)').text();

       var quantity = parseInt($(this).find('td:nth-child(5)').text(), 10); // Parse as integer

       // Add quantity to total
       totalQuantity += quantity;

       if (model !== referenceModel) {
           isValid = false;
           errorMsg = 'All rows must have the same Model!';
           return false; // Break the loop
       }
   });

   console.log("Total Quantity:", totalQuantity); // Debugging output

   // Check if total quantity is greater than 32
   if (totalQuantity > 2000) {
       Swal.fire({
           icon: 'error',
           title: 'Validation Error', 
           text: 'The total quantity of all rows exceeds 2000!' + totalQuantity
       });
       return; // Exit the function if total quantity is greater than 32
   }

   if (!isValid) {
       Swal.fire({
           icon: 'error',
           title: 'Validation Error',
           text: errorMsg
       });
       return; // Exit the function if validation fails
   }

   // If all validations are passed, proceed with the save operation
   console.log("Data is consistent and total quantity is within limit. Proceeding with save operation.");
  



  // Implement the save logic here
    // If validation passes, proceed with saving the data
    var requestData = [];
    $('#items_table tbody tr').each(function() {
        var id = $(this).find('td:first').text();
        var serial1 = $(this).find('td:nth-child(2)').text();
        // var disposition = $(this).find('td:nth-child(3)').text();
        var model = $(this).find('td:nth-child(3)').text();
        var cavity = $(this).find('td:nth-child(4)').text();
        var quantity = $(this).find('td:nth-child(5)').text();

        // requestData.push({ idNumber: idNumber, firstName: firstName, lastName: lastName, timeFrom: timeFrom, timeTo: timeTo, division: division, area: area.join(','), location: location.join(','), date_ot: date_ot, category: category, purpose: purpose });
        requestData.push({ serial1: serial1, id: id, model: model, cavity: cavity, quantity: quantity});
       
       
    });
    // Send the data to the server for insertion
    $.ajax({
        url: "../sublotcombine/add_request", // URL of your server-side endpoint
        type: "POST",
        dataType: "json",
        data: { requestData: JSON.stringify(requestData) },
        success: function(response) {
            console.log(response);
            // Handle success response
            Swal.fire({
                icon: 'success',
                title: 'Success',
                text: 'Data successfully saved!',
                showConfirmButton: false,
                timer: 1500
            }).then(() => {
                // Clear the table by removing all its rows
                $('#items_table tbody').empty();
                $('input[name="id_number"]').val('');

                // Optionally, clear the addedIds object if you want to allow these IDs to be added again.
                addedIds = {};
            });
        },
        error: function(xhr, status, error) {
            console.error(xhr.responseText);
            // Handle error response
        }
    });
});
