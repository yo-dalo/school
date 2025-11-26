<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/upload.php';
require_once '../../utility/function.php';
require_once '../../utility/chackAuth.php';
$user = authenticate();

/* Important note: 
When the SQL table includes an Image, data comes as multipart/form-data. 
When there’s no image, data comes as JSON. This example handles image uploads.
*/

function create($conn) {
    validateRequestMethod('POST');
    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $name = safe($conn, $_POST['Name'] ?? '');
    $title = safe($conn, $_POST['Title'] ?? '');
    $description = safe($conn, $_POST['Description'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');
    
    $image_path = null;

    if (!empty($_FILES['Image']['name'])) {
        $upload = upload('Image', '../../Uploads/');
        if (!$upload['success']) sendResponse(400, false, $upload['message']);
        $image_path = $upload['fileName'];
    }

    $sql = "INSERT INTO Facility (Index_No, Name, Title, Description, Image, Is_Active) VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'isssss',
        $index_no, $name, $title, $description, $image_path, $is_active
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Facility created', ['id' => mysqli_insert_id($conn)]);
    } else {
        sendResponse(500, false, 'Failed to create facility');
    }
}

//create($conn);
