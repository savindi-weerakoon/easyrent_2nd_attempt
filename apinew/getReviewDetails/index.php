<?php
require_once __DIR__ . './../config/databasenew.php';
class ReviewDetails{
  function getreviewDetails(){
    $post_id = !empty($_GET['post_id']) ? $_GET['post_id'] : null;
    $reviewDetails = array();
    $db = new Connect;
    $query = "SELECT p.post_id AS post_id,
    p.post_title AS post_title,
    u.user_id AS user_id,
    u.firstname AS firstname,
    u.lastname AS lastname, 
    i.reviewer AS reviewer,
    i.rate AS rate,
    i.timestamp AS timestamp,
    i.review AS review
    FROM post AS p
    LEFT JOIN user AS u
    ON p.user_id = u.user_id
    LEFT JOIN item_ratings AS i
    on p.post_id = i.post_id  
    WHERE p.post_id = $post_id" ;
    $query_prepare = $db->prepare($query);
    $query_prepare->execute();
    while($OutputData=$query_prepare->fetch(PDO::FETCH_ASSOC)){
      $reviewDetails[]=array(
        'post_id'=> $OutputData['post_id'],
        'post_title'=> $OutputData['post_title'],
        'user_id'=> $OutputData['user_id'],
        'firstname'=> $OutputData['firstname'],
        'lastname'=> $OutputData['lastname'],
        'reviewer'=> $OutputData['reviewer'],
        'rate'=> $OutputData['rate'],
        'review'=> $OutputData['review'],
        'timestamp'=> $OutputData['timestamp'],
      );
    }
    $response = (object) [
      'message' => 'Review details retrieved successfuly',
      'postReviews' => $reviewDetails
    ];
    http_response_code(200);
    echo json_encode($response);
  }
}
$ReviewDetails = new ReviewDetails;
echo $ReviewDetails->getreviewDetails();
?>