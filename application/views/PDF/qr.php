<?php
require_once('vendor/autoload.php'); // Require autoload.php file

use Endroid\QrCode\QrCode;

$host = "10.216.128.71";
$username = "root";
$password = "Ncfldbuser21!";
$database = "db_parts"; 

$conn = new mysqli($host, $username, $password, $database);
if(!$conn) {
    echo "Database connection failed. Error:".$conn->error;
} else {

    $query_control_no = mysqli_query($conn, "SELECT * FROM pr_result WHERE disposition='Accepted' AND area_id='20' AND qr_code IS NULL");
    
    while ($row = mysqli_fetch_array($query_control_no)) {
        
        $control_number = $row['mfi_serial'];
  
        // Generate QR code
        $qrCode = new QrCode($control_number);
        $qrCodePath = '/var/www/html/PartsTraceabilitySystem/uploads/qr_code_' . $control_number . '.png'; // Set path to save QR code image
        $qrCode->writeFile($qrCodePath);

        // Update database with file name
        $updateQuery = "UPDATE `pr_result` SET `qr_code` = ? WHERE mfi_serial = ?";
        $updateStmt = $conn->prepare($updateQuery);
        $updateStmt->bind_param("ss", $qrCodePath, $control_number);
        $updateResult = $updateStmt->execute();

        if ($updateResult) {
            echo "QR code generated and database updated successfully for control number: $control_number<br>";
        } else {
            echo "Failed to update database for control number: $control_number<br>";
        }
    }
}
?>
