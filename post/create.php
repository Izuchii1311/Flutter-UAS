<?php

header("Access-Control-Allow-Origin: *"); // Replace with the actual domain of your Flutter web app
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header('Content-Type: application/json');

include '../connection.php';
$title      = $_POST['title'];
$content    = $_POST['content'];
$date       = date('Y-m-d');

$result = mysqli_query($connectNow, "insert into post set title='$title', content='$content', date='$date'");

if($result){
    echo json_encode([
        'message' => 'Data input successfully'
    ]);
}else{
    echo json_encode([
        'message' => 'Data Failed to input'
    ]);
}