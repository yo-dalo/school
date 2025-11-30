<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';


function getById($conn, $id_) {
 
$id = isset($id_) ? (int)$id_ : 0;
 

if (!$id) sendResponse(400, false, "Invalid Facility ID");

 
 $stmt = mysqli_prepare($conn, "SELECT * FROM Facility WHERE Id = ?");
 mysqli_stmt_bind_param($stmt, 'i', $id);
 mysqli_stmt_execute($stmt);
 $result = mysqli_stmt_get_result($stmt);
 if ($row = mysqli_fetch_assoc($result)) {
  sendResponse(200, true, "Facility found {$id_}", $row);
 } else {
  sendResponse(404, false, 'Facility not found');
 }
}






//getById($conn,$_GET["id"]) ;
?>