<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';
require_once '../../utility/chackAuth.php';
$user = authenticate();

function create($conn) {
    validateRequestMethod('POST');
    $data = json_decode(file_get_contents("php://input"), true);

    $index_no = isset($data['Index_No']) ? intval($data['Index_No']) : null;
    $url = safe($conn, $data['Url'] ?? '');
    $name = safe($conn, $data['Name'] ?? '');
    $is_active = safe($conn, $data['Is_Active'] ?? 'active');

    $sql = "INSERT INTO quick_link (Index_No, Url, Name, Is_Active) VALUES (?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'isss',
        $index_no, $url, $name, $is_active
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Quick Link created', ['id' => mysqli_insert_id($conn)]);
    } else {
        sendResponse(500, false, 'Failed to create quick link');
    }
}

//create($conn);
