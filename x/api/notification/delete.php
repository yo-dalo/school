<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function delete_($conn, $id_) {
    validateRequestMethod('DELETE');

    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Notification ID");

    $sql = "DELETE FROM Notification WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'i', $id);

    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Notification deleted');
    } else {
        sendResponse(500, false, 'Failed to delete notification');
    }
}

//delete_($conn, $_GET["id"]);
