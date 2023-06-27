<?php

header("Access-Control-Allow-Origin: *"); // Replace with the actual domain of your Flutter web app
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header('Content-Type: application/json');

include '../connection.php';

$title      = $_POST['title']; 
$content    = $_POST['content'];
$id         = $_POST['id'];
    
$result = mysqli_query($connectNow, "update post set title='$title', content='$content' where id='$id'");
    
if($result){
    echo json_encode([
        'message' => 'Data edit successfully'
    ]);
}else{
    echo json_encode([
        'message' => 'Data Failed to update'
    ]);
}