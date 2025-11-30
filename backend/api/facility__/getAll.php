<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/upload.php';
require_once '../../utility/function.php';





function buildFilters($conn) {
    $filters = [];
    if (!empty($_GET['name'])) {
        $filters[] = "Name LIKE '%" . safe($conn, $_GET['name']) . "%'";
    }
    if (!empty($_GET['title'])) {
        $filters[] = "Title LIKE '%" . safe($conn, $_GET['title']) . "%'";
    }
    if (!empty($_GET['is_active'])) {
        $filters[] = "Is_Active = '" . safe($conn, $_GET['is_active']) . "'";
    }
    if (!empty($_GET['date'])) {
        $filters[] = "DATE(Created_At) = '" . safe($conn, $_GET['date']) . "'";
    }
    return $filters ? "WHERE " . implode(' AND ', $filters) : '';
}


// GET Facilities
function getAll($conn) {
    $filters = buildFilters($conn);
    $pagination = buildPagination();
    $sql = "SELECT Index_No, Name, Title, Description, Image, Is_Active FROM Facility $filters ORDER BY Index_No ASC $pagination";
    $result = mysqli_query($conn, $sql);

    $rows = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }

    // Total count for pagination
    $count_sql = "SELECT COUNT(*) as total FROM Facility " . ($filters ? substr($filters, 6) : '');
    $count_result = mysqli_query($conn, $count_sql);
    $total = mysqli_fetch_assoc($count_result)['total'] ?? 0;

    sendResponse(200, true, 'Facilities fetched', [
        'data' => $rows,
        'pagination' => [
            'total' => $total,
            'page' => isset($_GET['page']) ? intval($_GET['page']) : 1,
            'limit' => isset($_GET['limit']) ? intval($_GET['limit']) : 10
        ]
    ]);
}


//getAll($conn) 


?>