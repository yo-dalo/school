<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function create($conn) {
    validateRequestMethod('POST');
    $data = json_decode(file_get_contents("php://input"), true);

    $pages_category_id = isset($data['Pages_Category_Id']) ? intval($data['Pages_Category_Id']) : null;
    $page_data = safe($conn, $data['Page_Data'] ?? '');
    $name = safe($conn, $data['Name'] ?? '');
    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $is_active = safe($conn, $data['Is_Active'] ?? 'active');

    $sql = "INSERT INTO Pages (Pages_Category_Id, Name ,Index_No,Page_Data, Is_Active) VALUES (?, ?, ?, ?,?)";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'isiss',
        $pages_category_id,$name ,$page_data, $is_active
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Page created', ['id' => mysqli_insert_id($conn)]);
    } else {
        sendResponse(500, false, 'Failed to create page');
    }
}

//create($conn);
