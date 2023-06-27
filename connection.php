<?php

    header("Access-Control-Allow-Origin: *"); // Replace with the actual domain of your Flutter web app
    header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
    header("Access-Control-Allow-Headers: Content-Type, Authorization");
    header('Content-Type: application/json');

    $serverHost = 'localhost';
    $user = 'root';
    $password = '';
    $database = 'clothes_app';

    $connectNow = new mysqli($serverHost, $user, $password, $database);

?>