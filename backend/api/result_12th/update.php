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
    if (!$id) sendResponse(400, false, "Invalid Result ID");

    $student_name = safe($conn, $_POST['Student_Name'] ?? '');
    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $marks_percentage = safe($conn, $_POST['Marks_Percentage'] ?? '');
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

    $sql = "UPDATE Result_12th SET Student_Name = ?, Index_No = ?, Image = ?, Marks_Percentage = ?, Description = ?, Is_Active = ? WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'sissssi',
        $student_name, $index_no, $image_path, $marks_percentage, $description, $is_active, $id
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(201, true, 'Result updated', ['id' => $id]);
    } else {
        sendResponse(500, false, 'Failed to update result');
    }
}

//update($conn);
