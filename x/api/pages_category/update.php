<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function update($conn) {
    validateRequestMethod('POST');
        $data = json_decode(file_get_contents("php://input"), true);

    $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
    if (!$id) sendResponse(400, false, "Invalid Pages Category ID");

    $index_no = isset($data['Index_No']) ? intval($data['Index_No']) : null;
    $name = safe($conn, $data['Name'] ?? '');
    $url = safe($conn, $data['Url'] ?? '');
    $is_active = safe($conn, $data['Is_Active'] ?? 'active');

    $sql = "UPDATE Pages_Category SET Index_No = ?, Name = ?, Url = ?, Is_Active = ? WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'isssi',
        $index_no, $name, $url, $is_active, $id
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(201, true, 'Pages Category updated', ['id' => $id]);
    } else {
        sendResponse(500, false, 'Failed to update pages category');
    }
}

//update($conn);
