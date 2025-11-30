<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';
require_once '../../utility/chackAuth.php';
$user = authenticate();

function buildFilters($conn) {
    $filters = [];
    if (!empty($_GET['school_name'])) {
        $filters[] = "School_Name LIKE '%" . safe($conn, $_GET['school_name']) . "%'";
    }
    if (!empty($_GET['is_active'])) {
        $filters[] = "Is_Active = '" . safe($conn, $_GET['is_active']) . "'";
    }
    return $filters ? "WHERE " . implode(' AND ', $filters) : '';
}

function getAll($conn) {
    $filters = buildFilters($conn);
    $pagination = buildPagination();
    $sql = "SELECT Id, xperience, Students, Teachers, Awards, School_Name, Short_Name, Logo_Url, Favicon_Url, Motto, Established_Year, Address, City, State, Pin_Code, Alternate_Phone, Email, Website, Academic_Year_Start, Academic_Year_End, Board_Affiliation, Board_Affiliation_Number, Latitude, Longitude, Contact_Person_Name, Contact_Person_Position, Contact_Person_Phone, Medium_Of_Instruction, Display_Order, Is_Active FROM school_info $filters ORDER BY Display_Order ASC $pagination";
    $result = mysqli_query($conn, $sql);

    $rows = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }

    // Total count for pagination
    $count_sql = "SELECT COUNT(*) as total FROM school_info " . ($filters ? substr($filters, 6) : '');
    $count_result = mysqli_query($conn, $count_sql);
    $total = mysqli_fetch_assoc($count_result)['total'] ?? 0;

    sendResponse(200, true, 'School Info fetched', [
        'data' => $rows,
        'pagination' => [
            'total' => $total,
            'page' => isset($_GET['page']) ? intval($_GET['page']) : 1,
            'limit' => isset($_GET['limit']) ? intval($_GET['limit']) : 10
        ]
    ]);
}

//getAll($conn);
