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
    $student_name = safe($conn, $_POST['Student_Name'] ?? '');
    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $marks_percentage = safe($conn, $_POST['Marks_Percentage'] ?? '');
    $description = safe($conn, $_POST['Description'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');
    
    $image_path = null;

    if (!empty($_FILES['Image']['name'])) {
        $upload = upload('Image', '../../Uploads/');
        if (!$upload['success']) sendResponse(400, false, $upload['message']);
        $image_path = $upload['fileName'];
    }

    $sql = "INSERT INTO Result_10th (Student_Name, Index_No, Image, Marks_Percentage, Description, Is_Active) VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'sissss',
        $student_name, $index_no, $image_path, $marks_percentage, $description, $is_active
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Result created', ['id' => mysqli_insert_id($conn)]);
    } else {
        sendResponse(500, false, 'Failed to create result');
    }
}

//create($conn);
