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
    if (!$id) sendResponse(400, false, "Invalid Admission Open Message ID");

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
    }else {
        $image_path = safe($conn, $_POST['Image'] ?? '');
    }

    $sql = "UPDATE Admission_Open_Message SET Title = ?, Index_No = ?, Message = ?, Image = ?, Read_More_Url = ?, Is_Active = ? WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'sisissi',
        $title, $index_no, $message, $image_path, $read_more_url, $is_active, $id
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(201, true, 'Admission Open Message updated', ['id' => $id]);
    } else {
        sendResponse(500, false, 'Failed to update Admission Open Message');
    }
}

//update($conn);
