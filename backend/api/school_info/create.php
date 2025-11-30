<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';
require_once '../../utility/chackAuth.php';
$user = authenticate();

function create($conn) {
    validateRequestMethod('POST');
    $experience = safe($conn, $_POST['Experience'] ?? '');
    $students = isset($_POST['Students']) ? intval($_POST['Students']) : null;
    $teachers = isset($_POST['Teachers']) ? intval($_POST['Teachers']) : null;
    $awards = safe($conn, $_POST['Awards'] ?? '');
    $school_name = safe($conn, $_POST['School_Name'] ?? '');
    $short_name = safe($conn, $_POST['Short_Name'] ?? '');
    $logo_url = safe($conn, $_POST['Logo_Url'] ?? '');
    $favicon_url = safe($conn, $_POST['Favicon_Url'] ?? '');
    $motto = safe($conn, $_POST['Motto'] ?? '');
    $established_year = isset($_POST['Established_Year']) ? intval($_POST['Established_Year']) : null;
    $address = safe($conn, $_POST['Address'] ?? '');
    $city = safe($conn, $_POST['City'] ?? '');
    $state = safe($conn, $_POST['State'] ?? '');
    $pin_code = safe($conn, $_POST['Pin_Code'] ?? '');
    $alternate_phone = safe($conn, $_POST['Alternate_Phone'] ?? '');
    $email = safe($conn, $_POST['Email'] ?? '');
    $website = safe($conn, $_POST['Website'] ?? '');
    $academic_year_start = isset($_POST['Academic_Year_Start']) ? intval($_POST['Academic_Year_Start']) : null;
    $academic_year_end = isset($_POST['Academic_Year_End']) ? intval($_POST['Academic_Year_End']) : null;
    $youtube_url = safe($conn, $_POST['Youtube_Url'] ?? '');
    $linkedin_url = safe($conn, $_POST['Linkedin_Url'] ?? '');
    $instagram_url = safe($conn, $_POST['Instagram_Url'] ?? '');
    $twitter_url = safe($conn, $_POST['Twitter_Url'] ?? '');
    $board_affiliation = safe($conn, $_POST['Board_Affiliation'] ?? '');
    $board_affiliation_number = safe($conn, $_POST['Board_Affiliation_Number'] ?? '');
    $latitude = safe($conn, $_POST['Latitude'] ?? '');
    $longitude = safe($conn, $_POST['Longitude'] ?? '');
    $contact_person_name = safe($conn, $_POST['Contact_Person_Name'] ?? '');
    $contact_person_position = safe($conn, $_POST['Contact_Person_Position'] ?? '');
    $contact_person_phone = safe($conn, $_POST['Contact_Person_Phone'] ?? '');
    $medium_of_instruction = safe($conn, $_POST['Medium_Of_Instruction'] ?? '');
    $display_order = isset($_POST['Display_Order']) ? intval($_POST['Display_Order']) : null;
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');

    $sql = "INSERT INTO school_info (Experience, Students, Teachers, Awards, School_Name, Short_Name, Logo_Url, Favicon_Url, Motto, Established_Year, Address, City, State, Pin_Code, Alternate_Phone, Email, Website, Academic_Year_Start, Academic_Year_End, Youtube_Url, Linkedin_Url, Instagram_Url, Twitter_Url, Board_Affiliation, Board_Affiliation_Number, Latitude, Longitude, Contact_Person_Name, Contact_Person_Position, Contact_Person_Phone, Medium_Of_Instruction, Display_Order, Is_Active) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'siissssssisssssssiiissssssssssssis',
        $experience, $students, $teachers, $awards, $school_name, $short_name, $logo_url, $favicon_url, $motto, $established_year, $address, $city, $state, $pin_code, $alternate_phone, $email, $website, $academic_year_start, $academic_year_end, $youtube_url, $linkedin_url, $instagram_url, $twitter_url, $board_affiliation, $board_affiliation_number, $latitude, $longitude, $contact_person_name, $contact_person_position, $contact_person_phone, $medium_of_instruction, $display_order, $is_active
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'School Info created', ['id' => mysqli_insert_id($conn)]);
    } else {
        sendResponse(500, false, 'Failed to create school info');
    }
}

//create($conn);
