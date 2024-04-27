
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


   function fillFields() {
    var machine = document.getElementById("line").value;
    var selectedOption = document.getElementById("line").options[document.getElementById("line").selectedIndex];
    var model = selectedOption.getAttribute("data-model");
    var moldNo = selectedOption.getAttribute("data-moldno");
    var ingotNo = selectedOption.getAttribute("data-ingotno");
    var traySize = selectedOption.getAttribute("data-traysize");
    var remarks = selectedOption.getAttribute("data-remarks");
    var cavityString = selectedOption.getAttribute("data-cavity");
    var cavityArray = cavityString.split(","); // Split the cavity numbers into an array
    

    document.getElementById("model").value = model;
    document.getElementById("mold_no").value = moldNo;
    document.getElementById("ingot_no").value = ingotNo;
    document.getElementById("tray_size").value = traySize;
    document.getElementById("remarks").value = remarks;

    var cavitySelect = document.getElementById("cavity");
    cavitySelect.innerHTML = ""; // Clear previous options

    // Add options for each cavity number
    cavityArray.forEach(function(cavityNumber) {
        var option = document.createElement("option");
        option.text = cavityNumber;
        option.value = cavityNumber;
        cavitySelect.add(option);
    });
}


function validateForm() {
    var serial1 = $('#serial1').val().trim();
    var line = $('#line').val().trim();
    var tray_no = $('#tray_no').val().trim();
    var quantity = $('#quantity').val().trim();
    var tray_size = $('#tray_size').val().trim();

    if (serial1 === '') {
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'Serial1 field cannot be empty'
        });
        return false; // prevent form submission
    } else if (serial1.length !== 12) {
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'Serial must be 12 characters long'
        });
        return false; // prevent form submission
    } else if (line === '') {
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'Machine field cannot be empty'
        });
        return false; // prevent form submission
    } else if (tray_no === '') {
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'Tray Number field cannot be empty'
        });
        return false; // prevent form submission
    } else if (quantity < '1' || quantity > tray_size) {
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'Check your Quantity'
        });
        return false; // prevent form submission
    }

    return true; // allow form submission
}
function addLot() {
if (!validateForm()) return; // validate the form before proceeding
var serial1 = $('#serial1').val();
var line = $('#line').val();
var mold_no = $('#mold_no').val();
var model = $('#model').val();
var cavity = $('#cavity').val();
var ingot_no = $('#ingot_no').val();
var tray_size = $('#tray_size').val();
var remarks = $('#remarks').val();
var category = $('#category').val();
var tray_no = $('#tray_no').val();
var quantity = $('#quantity').val();
var userdata = $('#userdata').val();

// Check if remarks field is required and empty
if ($('#remarks').prop('required') && remarks.trim() === '') {
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'Remarks field cannot be empty'
        });
        return; // prevent form submission
    }

$.post("../lotcreations/add_lot", { serial1: serial1, line: line, mold_no: mold_no, model: model, cavity: cavity , ingot_no: ingot_no , tray_size: tray_size , remarks: remarks, category: category, tray_no: tray_no, quantity: quantity, userdata: userdata })
    .done(function (data) {
        if (data.status == 'success') {
            Swal.fire({
                icon: 'success',
                title: 'Success',
                text: data.message,
                showConfirmButton: false,
                timer: 1500
            });

            // table.ajax.reload();
            // $('#add_model').modal('hide');
             $('#serial1').val('');
             $('#tray_no').val('');
        
      
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
addLot();
$('#serial1').focus();
});

