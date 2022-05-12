<?php
require_once __DIR__ . './../config/databasenew.php';
class PostApproval{
  function postapproval(){
    $user_id = $_POST['user_id'];
    $post_id = $_POST['post_id'];
    $approve = $_POST['approve'];
    $db = new Connect;
    $query = "SELECT COUNT(*) AS is_allowed FROM user WHERE user_id = $user_id AND role_id = 2";
    $query_prepare = $db->prepare($query);
    $query_prepare->execute();
    $row = $query_prepare->fetch();
    $is_allowed= json_encode($row['is_allowed']);
    $is_allowed = (int)$is_allowed;

    if($is_allowed == 1){
      $query = "UPDATE post SET is_active = $approve WHERE post_id = $post_id";
      $statement = $db->prepare($query); 
      $statement->execute();
      $msg = "post is deleted";
      if($approve == 1){
        $msg = "successfully approved";
      }
      else if ($approve == 2){
        $msg = "post rejected";
      }
      $repsonse = (object) [
        'message' => $msg
      ];
      http_response_code(200);
      echo json_encode($repsonse);
    }
  }
}
$PostApproval = new PostApproval;
echo $PostApproval->postapproval();
?>

<!-- 0 = pending state  
1- approve
2- rejected
3- deleted-->