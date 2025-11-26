<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/upload.php';
require_once '../../utility/function.php';
require_once '../../utility/chackAuth.php';
$user = authenticate();

function update($conn) {
    validateRequestMethod('POST');
    
    $id = isset($_GET['id']) ? (int)$_GET['id'] : 1;
    if (!$id) sendResponse(400, false, "Invalid Achievement ID");

    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $name = safe($conn, $_POST['Name'] ?? '');
    $title = safe($conn, $_POST['Title'] ?? '');
    $description = safe($conn, $_POST['Description'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');

    $image_path = null;

    if (!empty($_FILES['Image']['name'])) {
        $upload = upload('Image', '../../Uploads/');
        if (!$upload['success']) sendResponse(400, false, $upload['message']);
        $image_path = $upload['fileName'];
    }else {
        $image_path = safe($conn, $_POST['Image'] ?? '');
    }

    $sql = "UPDATE Achievements SET Index_No = ?, Name = ?, Title = ?, Description = ?, Image = ?, Is_Active = ? WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'isssssi',
        $index_no, $name, $title, $description, $image_path, $is_active, $id
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(201, true, 'Achievement updated', ['id' => $id]);
    } else {
        sendResponse(500, false, 'Failed to update achievement');
    }
}

//update($conn);
