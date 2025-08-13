<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function update($conn) {
    validateRequestMethod('POST');
    
    $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
    if (!$id) sendResponse(400, false, "Invalid Useful Link ID");

    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $url = safe($conn, $_POST['Url'] ?? '');
    $name = safe($conn, $_POST['Name'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');

    $sql = "UPDATE Useful_Link SET Index_No = ?, Url = ?, Name = ?, Is_Active = ? WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'isssi',
        $index_no, $url, $name, $is_active, $id
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(201, true, 'Useful Link updated', ['id' => $id]);
    } else {
        sendResponse(500, false, 'Failed to update useful link');
    }
}

//update($conn);
