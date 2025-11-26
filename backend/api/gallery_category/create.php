<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';
require_once '../../utility/chackAuth.php';
$user = authenticate();

function create($conn) {
    validateRequestMethod('POST');
    $name = safe($conn, $_POST['Name'] ?? '');
    $title = safe($conn, $_POST['Title'] ?? '');
    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $date = safe($conn, $_POST['Date'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');

    $sql = "INSERT INTO Gallery_Category (Name, Title, Index_No, Date, Is_Active) VALUES (?, ?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'ssiss',
        $name, $title, $index_no, $date, $is_active
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Gallery Category created', ['id' => mysqli_insert_id($conn)]);
    } else {
        sendResponse(500, false, 'Failed to create gallery category');
    }
}

//create($conn);
