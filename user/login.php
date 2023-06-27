<?php
include '../connection.php';

header("Access-Control-Allow-Origin: *"); // Replace with the actual domain of your Flutter web app
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header('Content-Type: application/json');

// Check if the required form fields are set
if (isset($_POST['user_email']) && isset($_POST['user_password'])) {
    $userEmail = $_POST['user_email'];
    $userPassword = md5($_POST['user_password']);

    $sqlQuery = "SELECT * FROM users_table WHERE user_email = '$userEmail' AND user_password = '$userPassword'";

    $resultOfQuery = $connectNow->query($sqlQuery);

    if ($resultOfQuery && $resultOfQuery->num_rows > 0) {
        $userRecord = $resultOfQuery->fetch_assoc();

        echo json_encode(
            array(
                "success" => true,
                "userData" => $userRecord,
            )
        );
    } else {
        echo json_encode(array("success" => false));
    }
} else {
    echo json_encode(array("success" => false, "message" => "Invalid request. Required fields are missing."));
}
?>
