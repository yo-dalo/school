<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';
require_once '../../utility/chackAuth.php';
$user = authenticate();

function update($conn) {
    validateRequestMethod('POST');


    $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
    if (!$id) sendResponse(400, false, "Invalid Admission ID");

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
    $admission_date = safe($conn, $data['Admission_Date'] ?? '');
    $more_info      = safe($conn, $data['More_Info'] ?? '');
    $is_active      = safe($conn, $data['Is_Active'] ?? 'active');

    $sql = "UPDATE Admission SET 
                Name = ?, Father_Name = ?, Mother_Name = ?, Email = ?, Phone = ?, Class = ?, DOB = ?, 
                City = ?, State = ?, Gender = ?, Admission_Date = ?, More_Info = ?, Is_Active = ? 
            WHERE Id = ?";

    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param(
        $stmt,
        'sssssssssssssi',
        $name, $father_name, $mother_name, $email, $phone, $class, $dob, $city, $state, $gender,
        $admission_date, $more_info, $is_active, $id
    );

    if (mysqli_stmt_execute($stmt)) {
        sendResponse(201, true, 'Admission updated', ['id' => $id]);
    } else {
        sendResponse(500, false, 'Failed to update admission');
    }
}

//update($conn);