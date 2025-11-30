<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';
require_once '../../utility/chackAuth.php';
$user = authenticate();

function create($conn) {
    validateRequestMethod('POST');
    $title = safe($conn, $_POST['Title'] ?? '');
    $message = safe($conn, $_POST['Message'] ?? '');
    $read_more_url = safe($conn, $_POST['Read_More_Url'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');

    $sql = "INSERT INTO school_welcome_message (Title, Message, Read_More_Url, Is_Active) VALUES (?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'ssss',
        $title, $message, $read_more_url, $is_active
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Welcome Message created', ['id' => mysqli_insert_id($conn)]);
    } else {
        sendResponse(500, false, 'Failed to create welcome message');
    }
}

//create($conn);
