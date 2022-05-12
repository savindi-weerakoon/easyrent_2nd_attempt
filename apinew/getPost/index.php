<?php
require_once __DIR__ . './../config/databasenew.php';
class GetPost{
  function getPost(){
    $post_id = $_GET['post_id'];
    $post = array();
    $db = new Connect;
    $query = "SELECT
    p.post_id AS post_id,
    p.price AS price,
    p.content AS content, 
    p.city_id AS city_id, 
    p.rent_type_id AS rent_type_id, 
    p.is_active AS is_active, 
    p.published_time AS published_time, 
    p.category_id AS category_id, 
    p.user_id,
    p.post_title AS post_title,
    p.district_id AS district_id,
    u.firstname AS firstname,
    u.lastname AS lastname,
    u.email AS email,
    u.phone AS phone,
    c.city,
    d.district,
    ca.category_name AS category_name
    FROM post AS p
    LEFT JOIN user AS u
    ON p.user_id = u.user_id
    LEFT JOIN categories AS ca
    ON p.category_id = ca.category_id
    LEFT JOIN cities AS c
    ON p.city_id = c.id
    LEFT JOIN district AS d
    ON p.district_id = d.id
    WHERE p.post_id = $post_id";
    $query_prepare = $db->prepare($query);
    $query_prepare->execute();

    $image_query = "SELECT * FROM images WHERE post_id = $post_id ORDER BY display_order ASC";
    $image_prepare = $db->prepare($image_query);
    $image_prepare->execute();
    $images = array();
    while($OutputData=$image_prepare->fetch(PDO::FETCH_ASSOC)){
      $images[]=array(
        'post_id'=> $OutputData['post_id'],
        'image_url'=> $OutputData['image_url'],
        'timestamp'=> $OutputData['timestamp'],
        'image_id'=> $OutputData['image_id'],
        'display_order'=> $OutputData['display_order'],
      );
    }

    $review_query = "SELECT 
    i.rate_id AS rate_id,
    i.post_id AS post_id,
    i.review AS review,
    i.rate AS rate,
    i.timestamp AS timestamp,
    u.firstname AS firstname,
    u.lastname AS lastname
    FROM item_ratings AS i
    LEFT JOIN user AS u
    ON i.reviewer = u.user_id 
    WHERE post_id = $post_id ORDER BY i.`timestamp` DESC";
    $review_prepare = $db->prepare($review_query);
    $review_prepare->execute();
    $reviews = array();
    while($OutputData=$review_prepare->fetch(PDO::FETCH_ASSOC)){
      $reviews[]=array(
        'rate_id'=> $OutputData['rate_id'],
        'post_id'=> $OutputData['post_id'],
        'review'=> $OutputData['review'],
        'rate'=> $OutputData['rate'],
        'timestamp'=> $OutputData['timestamp'],
        'firstname'=> $OutputData['firstname'],
        'lastname'=> $OutputData['lastname'],
      );
    }

    $average_rate = "SELECT AVG(rate) AS avg_item_rate FROM item_ratings WHERE post_id = $post_id";
    $average_prepare = $db->prepare($average_rate);
    $average_prepare->execute();
    $avg_rate_row = $average_prepare->fetch(); //get data from db without an array
    $avg_item_rate = $avg_rate_row["avg_item_rate"];

    while($OutputData=$query_prepare->fetch(PDO::FETCH_ASSOC)){
      $post[]=array(
        'post_id' => $OutputData['post_id'],
        'post_title' => $OutputData['post_title'],
        'content' => $OutputData['content'],
        'price' => $OutputData['price'],
        'rent_type_id' => $OutputData['rent_type_id'],
        'firstname' => $OutputData['firstname'],
        'lastname' => $OutputData['lastname'],
        'email' => $OutputData['email'],
        'user_id' => $OutputData['user_id'],
        'phone' => $OutputData['phone'],
        'city' => $OutputData['city'],
        'district' => $OutputData['district'],
        'category_name' => $OutputData['category_name'],
        'is_active' => $OutputData['is_active'],
        'images' => $images,
        'reviews' => $reviews,
        'avg_item_rate' => !empty($avg_item_rate) ? $avg_item_rate : 0
      );
    }
    $response = (object) [
      'message' => 'post retrieved successfuly',
      'post' => $post
    ];
    http_response_code(200);
    echo json_encode($response);
    // echo $posts;
  }
}
$GetPost = new GetPost;
echo $GetPost->getPost();
?>