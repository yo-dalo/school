<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';
require_once '../../utility/chackAuth.php';
$user = authenticate();

function update($conn) {
    validateRequestMethod('POST');
    
    $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
    if (!$id) sendResponse(400, false, "Invalid Useful Link ID");

    $data = json_decode(file_get_contents("php://input"), true);

    $index_no = isset($data['Index_No']) ? intval($data['Index_No']) : null;
    $url = safe($conn, $data['Url'] ?? '');
    $name = safe($conn, $data['Name'] ?? '');
    $is_active = safe($conn, $data['Is_Active'] ?? 'active');

    $sql = "UPDATE useful_link SET Index_No = ?, Url = ?, Name = ?, Is_Active = ? WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'isssi',
        $index_no, $url, $name, $is_active, $id
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(201, true, 'Useful Link updated', ['id' => $name]);
    } else {
        sendResponse(500, false, 'Failed to update useful link');
    }
}

//update($conn);
