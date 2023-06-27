<?php
include '../connection.php';

header("Access-Control-Allow-Origin: *"); // Replace with the actual domain of your Flutter web app
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header('Content-Type: application/json');

// Check if the required form fields are set
if (isset($_POST['user_name']) && isset($_POST['user_email']) && isset($_POST['user_password'])) {
    $userName = $_POST['user_name'];
    $userEmail = $_POST['user_email'];
    $userPassword = md5($_POST['user_password']);

    $sqlQuery = "INSERT INTO users_table SET user_name = '$userName', user_email = '$userEmail', user_password = '$userPassword'";

    $resultOfQuery = $connectNow->query($sqlQuery);

    if ($resultOfQuery) {
        echo json_encode(array("success" => true));
    } else {
        echo json_encode(array("success" => false));
    }
} else {
    echo json_encode(array("success" => false, "message" => "Required form fields are missing"));
}
?>
