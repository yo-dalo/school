<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/chackAuth.php';
$user = authenticate();

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':
        if (isset($_GET["get-for-update"])) {
            require_once './getByIdForUpdate.php';
            getByIdForUpdate($conn, $_GET["get-for-update"]);
        } elseif (isset($_GET["id"])) {
            require_once './getById.php';
            getById($conn, $_GET["id"]);
        } else {
            require_once './get.php';
            getAll($conn);
        }
        break;
    case 'POST':
        if (isset($_GET["id"])) {
            require_once './update.php';
            update($conn);
        } else {
            require_once './create.php';
            create($conn);
        }
        break;
    case 'DELETE':
        require_once './delete.php';
        delete_($conn, $_GET["id"]);
        break;
    default:
        sendResponse(405, false, 'Method Not Allowed');
        break;
}
