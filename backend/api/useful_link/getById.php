<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';
require_once '../../utility/chackAuth.php';
$user = authenticate();

function getById($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Useful Link ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM Useful_Link WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, "Useful Link found {$id_}", $row);
    } else {
        sendResponse(404, false, 'Useful Link not found');
    }
}

//getById($conn, $_GET["id"]);
