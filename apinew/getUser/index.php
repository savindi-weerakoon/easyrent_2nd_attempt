<?php
require_once __DIR__ . './../config/databasenew.php';
class User{
  function getToken(){
    $token = $_POST['token'];
    $user = array();
    $db = new Connect;
    $query = "SELECT username, firstname, lastname, user_id, email, phone, role_id
    FROM user
    WHERE token = '$token'";
    $query_prepare = $db->prepare($query);
    $query_prepare->execute(); 
    while($OutputData=$query_prepare->fetch(PDO::FETCH_ASSOC)){
      $user[]=array(
        'username' => $OutputData['username'],
        'firstname' => $OutputData['firstname'],
        'lastname' => $OutputData['lastname'],
        'user_id' => $OutputData['user_id'],
        'email' => $OutputData['email'],
        'phone' => $OutputData['phone'],
        'role_id' => $OutputData['role_id'],
      );
    }
    $repsonse = (object) [
      'message' => 'Successfully taken the token',
      'user' => $user[0]
    ];
    http_response_code(200);
    return json_encode($repsonse);
  }
}
$User = new User;
echo $User->getToken();
?>