<?php
require_once __DIR__ . './../config/databasenew.php';
class ReviewUser{
  function reviewUser() {
    $post_id = !empty($_POST['post_id']) ? $_POST['post_id'] : NULL;
    $tenant_id = !empty($_POST['tenant_id']) ? $_POST['tenant_id'] : NULL;
    $db = new Connect;
    $query = "UPDATE reservation SET reservation_state = 2 WHERE post_id = $post_id AND tenant_id = $tenant_id";
    $query_prepare = $db->prepare($query);
    $query_prepare->execute(); 

    $repsonse = (object) [
      'message' => 'Successfully reviewed review user'
    ];
    http_response_code(200);
    echo json_encode($repsonse);
  }
}
$ReviewUser = new ReviewUser;
echo $ReviewUser->reviewUser();
?>