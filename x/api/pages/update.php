<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function update($conn) {
    validateRequestMethod('POST');
    $data = json_decode(file_get_contents("php://input"), true);

    $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
    if (!$id) sendResponse(400, false, "Invalid Page ID");

    $pages_category_id = isset($data['Pages_Category_Id']) ? intval($data['Pages_Category_Id']) : null;
    $page_data = safe($conn, $data['Page_Data'] ?? '');
    $name = safe($conn, $data['Name'] ?? '');
    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $is_active = safe($conn, $data['Is_Active'] ?? 'active');

    $sql = "UPDATE Pages SET Pages_Category_Id = ?,Name = ? , Index_No = ?, Page_Data = ?, Is_Active = ? WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'isisi',
        $pages_category_id,$name,$index_no , $page_data, $is_active, $id
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(201, true, 'Page updated', ['id' => $id]);
    } else {
        sendResponse(500, false, 'Failed to update page');
    }
}

//update($conn);
