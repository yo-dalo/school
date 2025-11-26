<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/chackAuth.php';
$user = authenticate();

 sendResponse(200, true, 'Registration successful', $user);




?>