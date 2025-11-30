<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';

$data = json_decode(file_get_contents("php://input"), true);

// Validation
$errors = [];

// Check if required fields are present
if (!isset($data['name']) || empty(trim($data['name']))) {
    $errors[] = "Name is required";
}

if (!isset($data['email']) || empty(trim($data['email']))) {
    $errors[] = "Email is required";
} elseif (!filter_var($data['email'], FILTER_VALIDATE_EMAIL)) {
    $errors[] = "Invalid email format";
}

if (!isset($data['username']) || empty(trim($data['username']))) {
    $errors[] = "Username is required";
} elseif (strlen($data['username']) < 4) {
    $errors[] = "Username must be at least 4 characters";
}

if (!isset($data['password']) || empty($data['password'])) {
    $errors[] = "Password is required";
} elseif (strlen($data['password']) < 6) {
    $errors[] = "Password must be at least 6 characters";
}

// If there are validation errors, return them
if (!empty($errors)) {
    sendResponse(400, false, 'Validation failed', ['errors' => $errors]);
    exit;
}

// If validation passes, proceed with registration
$name = trim($data['name']);
$email = trim($data['email']);
$username = trim($data['username']);
$password = password_hash($data['password'], PASSWORD_BCRYPT);

// Check if email or username already exists
$checkStmt = $conn->prepare("SELECT id FROM admins WHERE Email = ? OR Username = ?");
$checkStmt->bind_param("ss", $email, $username);
$checkStmt->execute();
$result = $checkStmt->get_result();

if ($result->num_rows > 0) {
    sendResponse(400, false, 'Email or username already exists');
    exit;
}
$checkStmt->close();

// Insert into database
$stmt = $conn->prepare("INSERT INTO admins (Name, Email, Username, Password) VALUES (?, ?, ?, ?)");
$stmt->bind_param("ssss", $name, $email, $username, $password);

if ($stmt->execute()) {
    sendResponse(200, true, 'Registration successful', ['id' => mysqli_insert_id($conn)]);
} else {
    sendResponse(500, false, 'Registration failed: ' . $stmt->error);
}

$stmt->close();
$conn->close();
?>