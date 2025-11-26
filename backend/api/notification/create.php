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
    $is_important = isset($data['Is_Important']) ? intval($data['Is_Important']) : 0;
    $title = safe($conn, $data['Title'] ?? '');
    $description = safe($conn, $data['Description'] ?? '');
    $date = safe($conn, $data['Date'] ?? '');
    $name = safe($conn, $data['Name'] ?? '');
    $is_active = safe($conn, $data['Is_Active'] ?? 'active');

    $sql = "INSERT INTO Notification (Index_No, Is_Important, Title, Description, Date, Name, Is_Active) VALUES (?, ?, ?, ?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'iisssss',
        $index_no, $is_important, $title, $description, $date, $name, $is_active
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Notification created', ['id' => mysqli_insert_id($conn)]);
    } else {
        sendResponse(500, false, 'Failed to create notification');
    }
}

//create($conn);
