<?php
function sendResponse($statusCode, $success, $message, $data = null) {
  http_response_code($statusCode);
    echo json_encode([
        "status" => $success,
        "message" => $message,
        "data" => $data
    ]);
    exit();
}

function validateRequestMethod($expectedMethod) {
    if ($_SERVER['REQUEST_METHOD'] !== strtoupper($expectedMethod)) {
        sendResponse(405, false, "Invalid request method {$expectedMethod}");
    }
}
?>