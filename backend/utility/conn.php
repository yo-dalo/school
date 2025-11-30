<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
?>





<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
 header("Access-Control-Allow-Credentials: true");

// Rest of your code...
header("Content-Type: application/json");





$host = '127.0.0.1';
$user = 'yo-dalo';
$password = 'yo';
$database = 'school';

$conn = new mysqli($host, $user, $password, $database);

if ($conn->connect_error) {
    http_response_code(500);
    echo json_encode([
        "status" => false,
        "message" => "Database connection failed",
        "error" => $conn->connect_error
    ]);
    exit();
}

$conn->set_charset("utf8");
?>