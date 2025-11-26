<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';
require_once '../../utility/chackAuth.php';
$user = authenticate();

function getByIdForUpdate($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid School Info ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM School_Info WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, 'School Info found', $row);
    } else {
        sendResponse(404, false, 'School Info not found');
    }
}

//getByIdForUpdate($conn, $_GET["get-for-update"]);
