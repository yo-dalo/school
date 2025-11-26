<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/upload.php';
require_once '../../utility/function.php';
require_once '../../utility/chackAuth.php';
$user = authenticate();

function update($conn) {
    validateRequestMethod('POST');
    
    $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
    if (!$id) sendResponse(400, false, "Invalid Message ID");

    $name = safe($conn, $_POST['Name'] ?? '');
    $roll = safe($conn, $_POST['Roll'] ?? '');
    $description = safe($conn, $_POST['Description'] ?? '');
    $read_more_url = safe($conn, $_POST['Read_More_Url'] ?? '');
    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');

    $image_path = null;

    if (!empty($_FILES['Image']['name'])) {
        $upload = upload('Image', '../../Uploads/');
        if (!$upload['success']) sendResponse(400, false, $upload['message']);
        $image_path = $upload['fileName'];
    }else {
        $image_path = safe($conn, $_POST['Image'] ?? '');
    }

    $sql = "UPDATE Messages SET Image = ?, Name = ?, Roll = ?, Description = ?, Read_More_Url = ?, Index_No = ?, Is_Active = ? WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'sssssisi',
        $image_path, $name, $roll, $description, $read_more_url, $index_no, $is_active, $id
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(201, true, 'Message updated', ['id' => $id]);
    } else {
        sendResponse(500, false, 'Failed to update message');
    }
}

//update($conn);
