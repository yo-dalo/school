<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/upload.php';
require_once '../../utility/function.php';

/* Important note: 
When the SQL table includes an Image, data comes as multipart/form-data. 
When there’s no image, data comes as JSON. This example handles image uploads.
*/
require_once '../../utility/chackAuth.php';
$user = authenticate();


function create($conn) {
    validateRequestMethod('POST');
    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $url = safe($conn, $_POST['Url'] ?? '');
    $name = safe($conn, $_POST['Name'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');
    
    $image_path = null;

    if (!empty($_FILES['Image']['name'])) {
        $upload = upload('Image', '../../uploads/');
        if (!$upload['success']) sendResponse(400, false, $upload['message']);
        $image_path = $upload['fileName'];
    }

    $sql = "INSERT INTO poster (Index_No, Url, Image, Name, Is_Active) VALUES (?, ?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'issss',
        $index_no, $url, $image_path, $name, $is_active
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'poster created', ['id' => mysqli_insert_id($conn)]);
    } else {
        sendResponse(500, false, 'Failed to create poster');
    }
}

//create($conn);
