<?php
require_once __DIR__ . './../config/databasenew.php';
class ReviewUser{
  function reviewUser() {
    $tenant_id = !empty($_POST['tenant_id']) ? $_POST['tenant_id'] : NULL;
    // $reviewer = !empty($_POST['reviewer']) ? $_POST['reviewer'] : null;
    $reviewer = 5;
    $rate = !empty($_POST['rate']) ? $_POST['rate'] : 5;
    $review = !empty($_POST['review']) ? $_POST['review'] : '';
    $db = new Connect;
    $query = "INSERT INTO userrate (user_id, reviewer, review, rate) VALUES ($tenant_id, $reviewer, '$review', $rate)";
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