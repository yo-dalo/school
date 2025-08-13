<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function create($conn) {
    validateRequestMethod('POST');
    $data = json_decode(file_get_contents("php://input"), true);

    $index_no = isset($data['Index_No']) ? intval($data['Index_No']) : null;
    $name = safe($conn, $data['Name'] ?? '');
    $url = safe($conn, $data['Url'] ?? '');
    $is_active = safe($conn, $data['Is_Active'] ?? 'active');

    $sql = "INSERT INTO Pages_Category (Index_No, Name, Url, Is_Active) VALUES (?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'isss',
        $index_no, $name, $url, $is_active
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Pages Category created', ['id' => mysqli_insert_id($conn)]);
    } else {
        sendResponse(500, false, 'Failed to create pages category');
    }
}

//create($conn);
