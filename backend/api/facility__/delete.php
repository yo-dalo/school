<?php

require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';




function delete_($conn,$id_) {
    validateRequestMethod('DELETE');


$id = isset($id_) ? (int)$id_ : 1;
if (!$id) sendResponse(400, false, "Invalid Facility ID");



    $sql = "DELETE FROM Facility WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'i', $id);

    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Facility deleted');
    } else {
        sendResponse(500, false, 'Failed to delete facility');
    }
}




//delete_($conn,$id) 
