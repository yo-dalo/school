<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/upload.php';
require_once '../../utility/function.php';
require_once '../../utility/chackAuth.php';
$user = authenticate();

function update($conn) {
    validateRequestMethod('POST');
    
    $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
    if (!$id) sendResponse(400, false, "Invalid Blog ID");

    $set_clauses = [];
    $params = [];

    if (isset($_POST['Name'])) {
        $set_clauses[] = "Name = ?";
        $params[] = safe($conn, $_POST['Name']);
    }
    if (isset($_POST['Title'])) {
        $set_clauses[] = "Title = ?";
        $params[] = safe($conn, $_POST['Title']);
    }
    if (isset($_POST['Description'])) {
        $set_clauses[] = "Description = ?";
        $params[] = safe($conn, $_POST['Description']);
    }
    if (isset($_POST['Date'])) {
        $set_clauses[] = "Date = ?";
        $params[] = safe($conn, $_POST['Date']);
    }
    if (isset($_POST['Content'])) {
        $set_clauses[] = "Content = ?";
        $params[] = safe($conn, $_POST['Content']);
    }
    if (isset($_POST['Author'])) {
        $set_clauses[] = "Author = ?";
        $params[] = safe($conn, $_POST['Author']);
    }

    if (!empty($_FILES['Image']['name'])) {
        $upload = upload('Image', '../../uploads/');
        if (!$upload['success']) sendResponse(400, false, $upload['message']);
        $set_clauses[] = "Image = ?";
        $params[] = $upload['fileName'];
    }else {
        $image_path = safe($conn, $_POST['Image'] ?? '');
    }

    if (empty($set_clauses)) {
        sendResponse(400, false, 'No fields to update');
    }

    $sql = "UPDATE Blog SET " . implode(', ', $set_clauses) . " WHERE Id = ?";
    $params[] = $id;

    // Determine types: all 's' except the last one 'i'
    $types = str_repeat('s', count($params) - 1) . 'i';

    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, $types, ...$params);

    if (mysqli_stmt_execute($stmt)) {
        sendResponse(201, true, 'Blog updated', ['id' => $id]);
    } else {
        sendResponse(500, false, 'Failed to update blog');
    }
}

//update($conn);
