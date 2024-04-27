
    $(document).ready(function () {
        // Define a function to load data without filtering
        function loadData() {
            // Clear existing table data
            table.clear().draw();

            // Load data without any filters
            table.ajax.url("../castingunlocks/get_castinglocks").load();
        }

        // Define an empty DataTable
        var table = $('#items_table').DataTable({
            "columns": [
                { data: null, className: 'py-0 px-1 text-center custom-height-30 font-size-14', defaultContent: '<input type="checkbox"  style="height: 30px" class="row-checkbox">' }, // Checkbox column
                { data: 'id', className: 'py-0 px-1 text-center custom-height-30 font-size-14' },
                { data: 'serial1', className: 'py-0 px-1 text-center custom-height-30 font-size-14' },
                { data: 'model', className: 'py-0 px-1 text-center custom-height-30 font-size-14' },
                { data: 'mold_no', className: 'py-0 px-1 text-center custom-height-30 font-size-14' },
                { data: 'cavity', className: 'py-0 px-1 text-center custom-height-30 font-size-14' },
                { data: 'quantity', className: 'py-0 px-1 text-center custom-height-30 font-size-14' },
                { data: 'input_date', className: 'py-0 px-1 text-center custom-height-30 font-size-14' },
                { data: 'line', className: 'py-0 px-1 text-center custom-height-30 font-size-14' },
                { data: 'locked_date', className: 'py-0 px-1 text-center custom-height-30 font-size-14' },
                { data: 'locked_remarks', className: 'py-0 px-1 text-center custom-height-30 font-size-14' },
                { data: 'locked_details', className: 'py-0 px-1 text-center custom-height-30 font-size-14' },
                { data: 'locked_by', className: 'py-0 px-1 text-center custom-height-30 font-size-14' },
                { data: 'sorted_by', className: 'py-0 px-1 text-center custom-height-30 font-size-14' },
                { data: 'sort_remarks', className: 'py-0 px-1 text-center custom-height-30 font-size-14' },
                { data: 'date_sorted', className: 'py-0 px-1 text-center custom-height-30 font-size-14' },
            ],
            "responsive": true,
            lengthMenu: [
                [10, 25, 50 ,100,  -1],
                [10, 25, 50 ,100,  "All"],
            ],


            "pageLength": 10,
        });

        // Load data initially without any filters
        loadData();

        // Event listener for filter button
        $('#filterBtn').on('click', function (event) {
            event.preventDefault(); // Prevent default form submission

            // Validate the form
            if (!validateForm()) {
                return; // If validation fails, do not proceed
            }

            // Capture form data
            var line = $('#line').val();
            var model = $('#model').val();
            var mold_no = $('#mold_no').val();
            var cavity = $('#cavity').val();
            var date_from = $('#date_from').val();
            var date_to = $('#date_to').val();

            // Filter data based on captured form data
        //     table.clear().draw(); // Clear existing table data
        //     table.ajax.url("<?php echo base_url('index.php/castingunlocks/get_castinglocks'); ?>?" +
        //         "line=" + line +
        //         "&model=" + model +
        //         "&mold_no=" + mold_no +
        //         "&cavity=" + cavity +
        //         "&date_from=" + date_from +
        //         "&date_to=" + date_to
        //     ).load();
        // });
        table.clear().draw(); // Clear existing table data
        var url = '../castingunlocks/get_castinglocks' +
            "?line=" + encodeURIComponent(line) +
            "&model=" + encodeURIComponent(model) +
            "&mold_no=" + encodeURIComponent(mold_no) +
            "&cavity=" + encodeURIComponent(cavity) +
            "&date_from=" + encodeURIComponent(date_from) +
            "&date_to=" + encodeURIComponent(date_to);

        table.ajax.url(url).load();
        });

        // Event listener for lock button
        $('#btn_delete').on('click', function () {
            var id = [];
            $('.row-checkbox:checked').each(function (i) {
                id[i] = $(this).closest('tr').find('td:eq(1)').text(); // Assuming ID is in the second column
            });

            console.log(id); // Check if IDs are captured correctly

            // Check if locked_details and locked_remarks are empty
            // var lockedDetails = $('#locked_details').val().trim();
            var unlockedRemarks = $('#unlocked_remarks').val().trim();

            // if (lockedDetails === '' || lockedRemarks === '') {
            if (unlockedRemarks === '') {
                // alert('Please fill in NG Details and NG Remarks.');
                Swal.fire({
                    icon: 'warning',
                    title: 'Please fill in Remarks!',
                    text: 'Please Input Required Fields.'
                });
                return; // Stop execution if fields are empty
            }

            if (id.length == 0) {
                Swal.fire({
                    icon: 'warning',
                    title: 'No Serial Selected',
                    text: 'Please Select'
                });
            } else {
                $.ajax({
                    url: '../castingunlocks/delete_records',
                    method: 'POST',
                    data: {
                        id: id,
                        userdata: $('#userdata').val(),
                        // locked_details: lockedDetails,
                        unlocked_remarks: unlockedRemarks
                    },
                    success: function (response) {
                        // Check if response indicates success or error
                        if (response.trim() === "success") {
                            Swal.fire({
                                icon: 'success',
                                title: 'Successfully UnLocked Serial!',
                                text: 'ok'
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    // Reload the DataTable
                                    loadData(); // Call function to reload data
                                }
                            });
                        } else {
                            // Handle error
                            alert("Error: " + response);
                        }
                    },
                    error: function (xhr, status, error) {
                        // Handle AJAX error
                        alert("AJAX Error: " + error);
                    }
                });
            }
            $('.row-checkbox').prop('checked', false);
            $('#checkAll').prop('checked', false);
        });

        $('#checkAll').on('click', function () {
            $('.row-checkbox').prop('checked', $(this).prop('checked'));
        });

        // Event listener for individual row checkboxes
        $(document).on('click', '.row-checkbox', function () {
            if (!$(this).prop('checked')) {
                $('#checkAll').prop('checked', false);
            } else {
                var allChecked = true;
                $('.row-checkbox').each(function () {
                    if (!$(this).prop('checked')) {
                        allChecked = false;
                        return false;
                    }
                });
                $('#checkAll').prop('checked', allChecked);
            }
        });

        // Validation function for the form
        function validateForm() {
            var line = $('#line').val();
            var model = $('#model').val();
            var mold_no = $('#mold_no').val();
            var cavity = $('#cavity').val();
            var date_from = $('#date_from').val();
            var date_to = $('#date_to').val();

            if (line === '' || model === '' || mold_no === '' || cavity === '' || date_from === '' || date_to === '') {
                // If any of the required fields are empty, show an alert
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'Please fill all required data!'
                });
                return false; // Return false to indicate validation failure
            }

            return true; // Return true if validation passes
        }
    });

$(document).ready(function() {
  $('#model').change(function() {
    var selectedModel = $(this).val();
    console.log('Selected Model:', selectedModel);

    // Clear the mold_no and cavity dropdowns
    $('#mold_no').empty().append('<option value="">Select Tooling Number</option>');
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
          $('#mold_no').append('<option value="">No Tooling number</option>');
        }
      },
      error: function() {
        // If there is an error in the AJAX request, display "No mold_no"
        $('#mold_no').append('<option value="">No Tooling number</option>');
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
