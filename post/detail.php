<?php

header("Access-Control-Allow-Origin: *"); // Replace with the actual domain of your Flutter web app
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header('Content-Type: application/json');

include '../connection.php';


    $data       = mysqli_query($connectNow, "select * from post where id=".$_GET['id']);
    $data       = mysqli_fetch_array($data, MYSQLI_ASSOC);

    echo json_encode($data);