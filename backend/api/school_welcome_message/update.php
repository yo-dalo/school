<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';
require_once '../../utility/chackAuth.php';
$user = authenticate();

function update($conn) {
    validateRequestMethod('POST');
    
    $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
    if (!$id) sendResponse(400, false, "Invalid Welcome Message ID");

    $title = safe($conn, $_POST['Title'] ?? '');
    $message = safe($conn, $_POST['Message'] ?? '');
    $read_more_url = safe($conn, $_POST['Read_More_Url'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');

    $sql = "UPDATE school_welcome_message SET Title = ?, Message = ?, Read_More_Url = ?, Is_Active = ? WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'ssssi',
        $title, $message, $read_more_url, $is_active, $id
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(201, true, 'Welcome Message updated', ['id' => $id]);
    } else {
        sendResponse(500, false, 'Failed to update welcome message');
    }
}

//update($conn);
