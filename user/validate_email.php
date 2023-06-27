<?php
include '../connection.php';

header("Access-Control-Allow-Origin: *"); // Replace with the actual domain of your Flutter web app
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header('Content-Type: application/json');

// Check if the required form field is set
if (isset($_POST['user_email'])) {
    $userEmail = $_POST['user_email'];

    $sqlQuery = "SELECT * FROM user_table WHERE user_email='$userEmail'";

    $resultOfQuery = $connectNow->query($sqlQuery);

    if ($resultOfQuery) {
        if ($resultOfQuery->num_rows > 0) {
            echo json_encode(array("emailFound" => true));
        } else {
            echo json_encode(array("emailFound" => false));
        }
    } else {
        echo json_encode(array("success" => false, "message" => "Error executing the query"));
    }
} else {
    echo json_encode(array("success" => false, "message" => "Required form field 'user_email' is missing"));
}
?>
