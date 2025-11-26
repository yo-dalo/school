<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';
require_once '../../utility/chackAuth.php';
// $user = authenticate();

function buildFilters($conn) {
    $filters = [];
    if (!empty($_GET['gallery_category_id'])) {
        $filters[] = "Gallery_Category_Id = '" . safe($conn, $_GET['gallery_category_id']) . "'";
    }
    if (!empty($_GET['is_active'])) {
        $filters[] = "Is_Active = '" . safe($conn, $_GET['is_active']) . "'";
    }
    return $filters ? "WHERE " . implode(' AND ', $filters) : '';
}

function getAll($conn) {
    $filters = buildFilters($conn);
    $pagination = buildPagination();
    $sql = "SELECT Id, Gallery_Category_Id, Image, Is_Active FROM Gallery $filters ORDER BY Created_At DESC $pagination";
    $result = mysqli_query($conn, $sql);

    $rows = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }

    // Total count for pagination
    $count_sql = "SELECT COUNT(*) as total FROM Gallery " . ($filters ? substr($filters, 6) : '');
    $count_result = mysqli_query($conn, $count_sql);
    $total = mysqli_fetch_assoc($count_result)['total'] ?? 0;

    sendResponse(200, true, 'Gallery items fetched', [
        'data' => $rows,
        'pagination' => [
            'total' => $total,
            'page' => isset($_GET['page']) ? intval($_GET['page']) : 1,
            'limit' => isset($_GET['limit']) ? intval($_GET['limit']) : 10
        ]
    ]);
}

//getAll($conn);
