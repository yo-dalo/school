<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function delete_($conn, $id_) {
    validateRequestMethod('DELETE');

    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Useful Link ID");

    $sql = "DELETE FROM Useful_Link WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'i', $id);

    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Useful Link deleted');
    } else {
        sendResponse(500, false, 'Failed to delete useful link');
    }
}

//delete_($conn, $_GET["id"]);
