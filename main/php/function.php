<?php 


function getAll($conn, $sql) {
    $result = mysqli_query($conn, $sql);
    if (!$result) {
        return ['error' => mysqli_error($conn)];
    }
    
    $data = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $data[] = $row;
    }
    return $data;
}



function getSingle($conn, $sql) {
    $result = mysqli_query($conn, $sql);
    if (!$result) {
        return ['error' => mysqli_error($conn)];
    }
    return mysqli_num_rows($result) > 0 ? mysqli_fetch_assoc($result) : [];
}






?>
