<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';
require_once '../../utility/chackAuth.php';
$user = authenticate();

function create($conn) {
    validateRequestMethod('POST');
    $data = json_decode(file_get_contents("php://input"), true);


    $name           = safe($conn, $data['Name'] ?? '');
    $father_name    = safe($conn, $data['Father_Name'] ?? '');
    $mother_name    = safe($conn, $data['Mother_Name'] ?? '');
    $email          = safe($conn, $data['Email'] ?? '');
    $phone          = safe($conn, $data['Phone'] ?? '');
    $class          = safe($conn, $data['Class'] ?? '');
    $dob            = safe($conn, $data['DOB'] ?? '');
    $city           = safe($conn, $data['City'] ?? '');
    $state          = safe($conn, $data['State'] ?? '');
    $gender         = safe($conn, $data['Gender'] ?? '');
    $admission_date = safe($conn, $data['admission_Date'] ?? '');
    $more_info      = safe($conn, $data['More_Info'] ?? '');
    $is_active      = safe($conn, $data['Is_Active'] ?? 'active');

    $sql = "INSERT INTO admission (Name, Father_Name, Mother_Name, Email, Phone, Class, DOB, City, State, Gender, admission_Date, More_Info, Is_Active)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param(
        $stmt,
        'sssssssssssss',
        $name, $father_name, $mother_name, $email, $phone, $class, $dob, $city, $state, $gender, $admission_date, $more_info, $is_active
    );

    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'admission created', ['id' => mysqli_insert_id($conn)]);
    } else {
        sendResponse(500, false, 'Failed to create admission');
    }
}

//create($conn);