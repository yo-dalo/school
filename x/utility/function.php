<?php

function safe($conn, $str) {
    return mysqli_real_escape_string($conn, trim($str));
}



function buildPagination() {
    $limit = isset($_GET['limit']) && intval($_GET['limit']) > 0 ? intval($_GET['limit']) : 10;
    $page = isset($_GET['page']) && intval($_GET['page']) > 0 ? intval($_GET['page']) : 1;
    $offset = ($page - 1) * $limit;
    return "LIMIT $offset, $limit";
}





?>