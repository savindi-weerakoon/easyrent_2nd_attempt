<?php
require_once __DIR__ . './../config/databasenew.php';
class ReviewPost{
  function reviewPost() {
    $post_id = !empty($_POST['post_id']) ? $_POST['post_id'] : null;
    $reviewer = 1;
    // $reviewer = !empty($_POST['reviewer']) ? $_POST['reviewer'] : null;
    $rate = !empty($_POST['rate']) ? $_POST['rate'] : 5;
    $review = !empty($_POST['review']) ? $_POST['review'] : '';
    $db = new Connect;
   return $query = "INSERT INTO item_ratings (post_id, reviewer, review, rate) VALUES ($post_id, $reviewer, '$review', $rate)";
    $query_prepare = $db->prepare($query);
    $query_prepare->execute(); 

    $avg_rate_statement = "SELECT AVG(rate) AS Avg_rate FROM item_ratings WHERE post_id = $post_id";
    $avg_prepare = $db->prepare($avg_rate_statement);
    $avg_prepare->execute();
    $avg_row = $avg_prepare->fetch();
    $avg_rate = $avg_row['Avg_rate'];

    $avg_update = "UPDATE post SET avg_rate = $avg_rate WHERE post_id = $post_id";
    $avg_update_prepare = $db->prepare($avg_update);
    $avg_update_prepare->execute();

    $repsonse = (object) [
      'message' => 'Successfully reviewed post'
    ];
    http_response_code(200);
    return json_encode($repsonse);
  }
}
$ReviewPost = new ReviewPost;
echo $ReviewPost->reviewPost();
?>