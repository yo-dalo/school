<?php
require_once 'conn.php';
require_once 'responseHandler.php';

require_once '../../php-jwt/src/JWT.php';
require_once '../../php-jwt/src/Key.php';

use Firebase\JWT\JWT;
use Firebase\JWT\key;


function authenticate(){
$secret = 'your_secret_key';
if(!isset($_COOKIE["token"])){
 sendResponse(400, false, 'token is not found');
}
try{
   
$decoded = JWT::decode($_COOKIE["token"], new Key($secret,"HS256"));
 return $decoded;
}
catch(Exception $e){
          sendResponse(401, false, 'jwt error');

}

}

?>