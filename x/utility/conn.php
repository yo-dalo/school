<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
// Rest of your code...
header("Content-Type: application/json");





$host = '127.0.0.1';
$user = 'root';
$password = 'root';
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