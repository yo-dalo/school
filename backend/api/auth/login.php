

<?php

require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';

require_once '../../php-jwt/src/JWT.php';
require_once '../../php-jwt/src/Key.php';


use Firebase\JWT\JWT;
use Firebase\JWT\key;


$data = json_decode(file_get_contents('php://input'), true);
$email = $data['email'] ?? '';
$password = $data['password'] ?? '';


try {
    // Validate input
    if (empty($email) || empty($password)) {
        throw new Exception('Email and password are required');
    }

    // Query user from database
    $stmt = $conn->prepare("SELECT * FROM admins WHERE Email = ?");
     $stmt->bind_param("s", $email);
     $stmt->execute();

    $result = $stmt->get_result();
    $user = $result->fetch_assoc();

    if (!$user || !password_verify($password, $user['Password'])) {
        throw new Exception('Invalid credentials');
    }

    // Generate JWT token
    $key = "your_secret_key"; // Store this securely in environment variables
    $payload = [
        "user_id" => $user['Id'],
        "name" => $user['Name'],
        "email" => $user['Email'],
        "exp" => time() + (60 * 60) * 12 * 30    // 1 hour expiration
    ];

    $jwt = JWT::encode($payload, $key, 'HS256');

    // Set JWT in HTTP-only cookie
    setcookie(
        'token',
        $jwt,
        [
            'expires' => time() + (60 * 60) * 12 * 30 ,
            'path' => '/',
            'httponly' => false,
            'secure' => false,
            'samesite' => 'Strict'
        ]
    );

  sendResponse(200, true, ' Login successful', $payload );


} catch (Exception $e) {
    http_response_code(401);
    echo json_encode([
        'status' => 'error',
        'message' => $e->getMessage()
    ]);
}