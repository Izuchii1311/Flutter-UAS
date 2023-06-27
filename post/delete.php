<?php
header("Access-Control-Allow-Origin: *"); // Replace with the actual domain of your Flutter web app
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header('Content-Type: application/json');

include '../connection.php';

if (isset($_POST['id'])) {
    $id = $_POST['id'];

    $result = mysqli_query($connectNow, "DELETE FROM post WHERE id=".$id);

    if ($result) {
        echo json_encode([
            'message' => 'Data deleted successfully'
        ]);
    } else {
        echo json_encode([
            'message' => 'Failed to delete data'
        ]);
    }
} else {
    echo json_encode([
        'message' => 'No id parameter provided'
    ]);
}
?>
