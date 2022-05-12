<?php
require_once __DIR__ . './../config/databasenew.php';
class Posts{
  function getPosts(){
    $order_by = $_GET['order_by'];
    $sort = $_GET['sort'];
    $db = new Connect;
    $posts = array();
    $query = "SELECT
    p.post_id AS post_id,
    p.price AS price,
    p.content AS content, 
    p.avg_rate AS avg_rate,
    p.city_id AS city_id, 
    p.rent_type_id AS rent_type_id, 
    p.is_active AS is_active, 
    p.published_time AS published_time, 
    p.category_id AS category_id, 
    p.user_id,
    p.post_title AS post_title,
    p.district_id AS district_id,
    img.image_url AS image_url,
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
    LEFT JOIN (
        SELECT * FROM images
        WHERE image_id IN (
          SELECT min(image_id) FROM images GROUP BY post_id
        )
      ) AS img
      ON p.post_id = img.post_id
      WHERE p.is_active IN (1,2)
      ORDER BY $order_by AND $sort
      LIMIT 8";
      $query_prepare = $db->prepare($query);
      $query_prepare->execute();
      while($OutputData=$query_prepare->fetch(PDO::FETCH_ASSOC)){
        $posts[]=array(
          'post_id'=> $OutputData['post_id'],
          'post_title' => $OutputData['post_title'],
          'content' => $OutputData['content'],
          'price' => $OutputData['price'],
          'rent_type_id' => $OutputData['rent_type_id'],
          'avg_rate' => $OutputData['avg_rate'],
          'firstname' => $OutputData['firstname'],
          'lastname' => $OutputData['lastname'],
          'category_id' => $OutputData['category_id'],
          'user_id' => $OutputData['user_id'],
          'city' => $OutputData['city'],
          'district' => $OutputData['district'],
          'image_url' => $OutputData['image_url'],
          'email' => $OutputData['email']
        );
      }
      $response = (object) [
        'message' => 'posts retrieved successfuly',
        'post' => $posts
      ];
      http_response_code(200);
      echo json_encode($response);
  }
}
$Posts = new Posts;
echo $Posts->getPosts();
?>