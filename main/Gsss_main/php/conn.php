<?php
// Assuming database connection is established
$servername = "127.0.0.1";
$username = "root";
$password = "";
$database = "school";
$database1 = "school";

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

$con = new mysqli($servername, $username, $password, $database1);


// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
}


?>