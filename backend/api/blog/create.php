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
    $name = safe($conn, $_POST['Name'] ?? '');
    $title = safe($conn, $_POST['Title'] ?? '');
    $description = safe($conn, $_POST['Description'] ?? '');
    $date = safe($conn, $_POST['Date'] ?? '');
    $content = safe($conn, $_POST['Content'] ?? '');
    $author = safe($conn, $_POST['Author'] ?? '');
    
    $image_path = null;

    if (!empty($_FILES['Image']['name'])) {
        $upload = upload('Image', '../../uploads/');
        if (!$upload['success']) sendResponse(400, false, $upload['message']);
        $image_path = $upload['fileName'];
    }

    $sql = "INSERT INTO Blog (Name, Title, Description, Date, Content, Author, Image) VALUES (?, ?, ?, ?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'sssssss',
        $name, $title, $description, $date, $content, $author, $image_path
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Blog created', ['id' => mysqli_insert_id($conn)]);
    } else {
        sendResponse(500, false, 'Failed to create blog');
    }
}

//create($conn);
