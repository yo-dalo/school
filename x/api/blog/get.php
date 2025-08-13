<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function buildFilters($conn) {
    $filters = [];
    if (!empty($_GET['title'])) {
        $filters[] = "Title LIKE '%" . safe($conn, $_GET['title']) . "%'";
    }
    if (!empty($_GET['author'])) {
        $filters[] = "Author LIKE '%" . safe($conn, $_GET['author']) . "%'";
    }
    return $filters ? "WHERE " . implode(' AND ', $filters) : '';
}

function getAll($conn) {
    $filters = buildFilters($conn);
    $pagination = buildPagination();
    $sql = "SELECT * FROM Blog $filters ORDER BY Created_At DESC $pagination";
    $result = mysqli_query($conn, $sql);

    $rows = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }

    // Total count for pagination
    $count_sql = "SELECT COUNT(*) as total FROM Blog " . ($filters ? substr($filters, 6) : '');
    $count_result = mysqli_query($conn, $count_sql);
    $total = mysqli_fetch_assoc($count_result)['total'] ?? 0;

    sendResponse(200, true, 'Blogs fetched', [
        'data' => $rows,
        'pagination' => [
            'total' => $total,
            'page' => isset($_GET['page']) ? intval($_GET['page']) : 1,
            'limit' => isset($_GET['limit']) ? intval($_GET['limit']) : 10
        ]
    ]);
}

//getAll($conn);
