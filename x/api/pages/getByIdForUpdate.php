<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getByIdForUpdate($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Page ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM Pages WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, 'Page found', $row);
    } else {
        sendResponse(404, false, 'Page not found');
    }
}

//getByIdForUpdate($conn, $_GET["get-for-update"]);
