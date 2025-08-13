<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function buildFilters($conn) {
    $filters = [];
    if (!empty($_GET['name'])) {
        $filters[] = "Name LIKE '%" . safe($conn, $_GET['name']) . "%'";
    }
    if (!empty($_GET['class'])) {
        $filters[] = "Class LIKE '%" . safe($conn, $_GET['class']) . "%'";
    }
    if (!empty($_GET['is_active'])) {
        $filters[] = "Is_Active = '" . safe($conn, $_GET['is_active']) . "'";
    }
    return $filters ? "WHERE " . implode(' AND ', $filters) : '';
}

function getAll($conn) {
    $filters = buildFilters($conn);
    $pagination = buildPagination();
    $sql = "SELECT * FROM Admission $filters ORDER BY Id DESC $pagination";
    $result = mysqli_query($conn, $sql);

    $rows = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }

    $count_sql = "SELECT COUNT(*) as total FROM Admission " . ($filters ? substr($filters, 6) : '');
    $count_result = mysqli_query($conn, $count_sql);
    $total = mysqli_fetch_assoc($count_result)['total'] ?? 0;

    sendResponse(200, true, 'Admissions fetched', [
        'data' => $rows,
        'pagination' => [
            'total' => $total,
            'page' => isset($_GET['page']) ? intval($_GET['page']) : 1,
            'limit' => isset($_GET['limit']) ? intval($_GET['limit']) : 10
        ]
    ]);
}

//getAll($conn);