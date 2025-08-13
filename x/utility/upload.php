<?php


function upload ( 
 $img="image",
$uploadDir = '../../uploads/',
$allowedTypes = ['image/jpeg', 'image/png', 'image/gif', 'image/webp'],
$maxFileSize = 5 * 1024 * 1024,
){




// Create upload directory if it doesn't exist
if (!file_exists($uploadDir)) {
    mkdir($uploadDir, 0755, true);
}

// Check if the request method is POST
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    
    //return json_encode(['error' => 'Method not allowed']);
    return ['success' => false, 'message' => 'Method not allowed'];

}

// Check if file was uploaded
if (!isset($_FILES[$img])) {
    return ['success' => false, 'message' => 'No file uploaded'];

    //return json_encode(['error' => 'No file uploaded']);
    exit;
}

$file = $_FILES[$img];

// Validate file upload
if ($file['error'] !== UPLOAD_ERR_OK) {
    $errors = [
        UPLOAD_ERR_INI_SIZE => 'File exceeds upload_max_filesize directive in php.ini',
        UPLOAD_ERR_FORM_SIZE => 'File exceeds MAX_FILE_SIZE directive in HTML form',
        UPLOAD_ERR_PARTIAL => 'File was only partially uploaded',
        UPLOAD_ERR_NO_FILE => 'No file was uploaded',
        UPLOAD_ERR_NO_TMP_DIR => 'Missing temporary folder',
        UPLOAD_ERR_CANT_WRITE => 'Failed to write file to disk',
        UPLOAD_ERR_EXTENSION => 'A PHP extension stopped the file upload'
    ];
    
    return ['success' => false, 'message' => $errors[$file['error']] ?? 'Unknown upload error'];

  //  return json_encode(['error' => $errors[$file['error']] ?? 'Unknown upload error']);
   
}

// Validate file type
$finfo = finfo_open(FILEINFO_MIME_TYPE);
$mimeType = finfo_file($finfo, $file['tmp_name']);
finfo_close($finfo);

if (!in_array($mimeType, $allowedTypes)) {
   return ['success' => false, 'message' => 'Invalid file type. Only JPEG, PNG, GIF, and WEBP are allowed.'];

   // return json_encode(['error' => 'Invalid file type. Only JPEG, PNG, GIF, and WEBP are allowed.']);
    
}

// Validate file size
if ($file['size'] > $maxFileSize) {
   
   return ['success' => false, 'message' => 'File size too large. Maximum 5MB allowed.'];

  //  return json_encode(['error' => 'File size too large. Maximum 5MB allowed.']);
    
}

// Generate a secure filename
$extension = pathinfo($file['name'], PATHINFO_EXTENSION);
$filename = bin2hex(random_bytes(16)) . '.' . $extension;
$destination = $uploadDir . $filename;

// Move the uploaded file
if (!move_uploaded_file($file['tmp_name'], $destination)) {
    
   // return json_encode(['error' => 'Failed to move uploaded file']);
    return ['success' => false, 'message' => 'Failed to move uploaded file'];

}

// Get the base URL
$protocol = isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? 'https://' : 'http://';
$host = $_SERVER['HTTP_HOST'];
$fileUrl = $protocol . $host . '/' . $destination;

// Return success response

return [
    'success' => true,
    'message' => 'File uploaded successfully',
    'filePath' => $destination,
    'fileUrl' => $fileUrl,
    'fileName' => $filename,
    'fileDetails' => [
        'originalName' => $file['name'],
        'size' => $file['size'],
        'mimeType' => $mimeType
    ]
];

}






?>