<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';
require_once '../../utility/chackAuth.php';
$user = authenticate();

function update($conn) {
    validateRequestMethod('POST');
    
    $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
    if (!$id) sendResponse(400, false, "Invalid Notification ID");

    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $is_important = isset($_POST['Is_Important']) ? intval($_POST['Is_Important']) : 0;
    $title = safe($conn, $_POST['Title'] ?? '');
    $description = safe($conn, $_POST['Description'] ?? '');
    $date = safe($conn, $_POST['Date'] ?? '');
    $name = safe($conn, $_POST['Name'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');

    $sql = "UPDATE Notification SET Index_No = ?, Is_Important = ?, Title = ?, Description = ?, Date = ?, Name = ?, Is_Active = ? WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'iisssssi',
        $index_no, $is_important, $title, $description, $date, $name, $is_active, $id
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(201, true, 'Notification updated', ['id' => $id]);
    } else {
        sendResponse(500, false, 'Failed to update notification');
    }
}

//update($conn);
