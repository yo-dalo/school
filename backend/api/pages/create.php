<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';
require_once '../../utility/chackAuth.php';
$user = authenticate();

function create($conn) {
    validateRequestMethod('POST');
    $data = json_decode(file_get_contents("php://input"), true);

    $pages_category_id = isset($data['Pages_Category_Id']) ? intval($data['Pages_Category_Id']) : null;
    $page_data = safe($conn, $data['Page_Data'] ?? '');
    $name = safe($conn, $data['Name'] ?? '');
    $index_no = safe($conn, $data['Index_No'] ?? '0');
    $is_active = safe($conn, $data['Is_Active'] ?? 'active');

    

    $sql =  "INSERT INTO `pages` (`Name`, `Pages_Category_Id`, `Page_Data`, `Is_Active`, `Index_No`) VALUES ( ?, ?, ?,?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
     mysqli_stmt_bind_param($stmt, 'sissi',
    $name,  
     $pages_category_id 
     ,$page_data, $is_active,
     $index_no
     );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Page created', ['id' => mysqli_insert_id($conn)]);
    } else {
        sendResponse(500, false, 'Failed to create page');
    }
}

//create($conn);
