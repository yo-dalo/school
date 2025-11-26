<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/upload.php';
require_once '../../utility/function.php';
require_once '../../utility/chackAuth.php';
$user = authenticate();

function create($conn) {
    validateRequestMethod('POST');
    $title = safe($conn, $_POST['Title'] ?? '');
    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $message = safe($conn, $_POST['Message'] ?? '');
    $read_more_url = safe($conn, $_POST['Read_More_Url'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');
    
    $image_path = null;

    if (!empty($_FILES['Image']['name'])) {
        $upload = upload('Image', '../../Uploads/');
        if (!$upload['success']) sendResponse(400, false, $upload['message']);
        $image_path = $upload['fileName'];
    }

    $sql = "INSERT INTO Admission_Open_Message (Title, Index_No, Message, Image, Read_More_Url, Is_Active) VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'sisiss',
        $title, $index_no, $message, $image_path, $read_more_url, $is_active
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Admission Open Message created', ['id' => mysqli_insert_id($conn)]);
    } else {
        sendResponse(500, false, 'Failed to create Admission Open Message');
    }
}

//create($conn);
