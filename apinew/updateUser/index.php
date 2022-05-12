<?php
require_once __DIR__ . './../config/databasenew.php';
class UpdateUsers{
  function UpdateUsers(){
    // $user_id = $_POST['user_id'];
    $user_id = 29;
    $firstname = $_POST['firstname'];
    $lastname = $_POST['lastname'];
    $username = $_POST['username'];
    $email = $_POST['email'];
    $contact_number = $_POST['contact_number'];
    $image_id = $_POST['image_id'];
    $db = new Connect;
    $query = "UPDATE user 
    SET firstname = '$firstname', 
    lastname = '$lastname', 
    username = '$username', 
    email = '$email', 
    phone = '$contact_number',
    image_id = $image_id
    WHERE user_id = '$user_id'";
    $query_prepare = $db->prepare($query);
    $query_prepare->execute(); 

    $repsonse = (object) [
      'message' => 'Successfully updated the user'
    ];
    http_response_code(200);
    return json_encode($repsonse);
  }
}
$UpdateUsers = new UpdateUsers;
echo $UpdateUsers->UpdateUsers();
?>