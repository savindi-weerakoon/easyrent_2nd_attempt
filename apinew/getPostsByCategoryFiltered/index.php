<?php
require_once __DIR__ . './../config/databasenew.php';
class PostsFiltered{
  function postsFiltered(){
    return $keyword = !empty($_POST['keyword']) ? $_POST['keyword'] : '';
    $min = !empty($_POST['min']) ? $_POST['min'] : 0;
    $max = !empty($_POST['max']) ? $_POST['max'] : 99999999999;
    $rating = !empty($_POST['rating']) ? $_POST['rating'] : 0;
    $category_id = !empty($_POST['category_id']) ? $_POST['category_id'] : 1;
    $posts = array();
    $db = new Connect;
    $query = "SELECT
    p.post_id AS post_id,
    p.price AS price,
    p.content AS content, 
    p.city_id AS city_id,
    p.is_active AS is_active, 
    p.published_time AS published_time, 
    p.category_id AS category_id, 
    p.user_id,
    p.post_title AS post_title,
    p.district_id AS district_id,
    p.avg_rate AS avg_rate,
    u.firstname AS firstname,
    u.lastname AS lastname,
    u.email AS email,
    u.phone AS phone,
    c.city,
    d.district,
    ca.category_name AS category_name,
    p.category_id AS category_id
    FROM post AS p
    LEFT JOIN user AS u
    ON p.user_id = u.user_id
    LEFT JOIN categories AS ca
    ON p.category_id = ca.category_id
    LEFT JOIN cities AS c
    ON p.city_id = c.id
    LEFT JOIN district AS d
    ON p.district_id = d.id
    WHERE (p.post_title LIKE '%$keyword%')
    AND (p.price BETWEEN $min AND $max) AND (p.avg_rate = $rating) AND p.category_id = $category_id";
    $query_prepare = $db->prepare($query);
    $query_prepare->execute(); 
    while($OutputData=$query_prepare->fetch(PDO::FETCH_ASSOC)){
      $posts[]=array(
        'post_id'=> $OutputData['post_id'],
        'price'=> $OutputData['price'],
        'content'=> $OutputData['content'],
        'post_title'=> $OutputData['post_title'],
        'firstname'=> $OutputData['firstname'],
        'lastname'=> $OutputData['lastname'],
      );
    }
    $repsonse = (object) [
      'message' => 'Successfully filtered posts',
      'posts' => $posts,
    ];
    http_response_code(200);
    return json_encode($repsonse);
  }
}
$PostsFiltered = new PostsFiltered;
echo $PostsFiltered->postsFiltered();
?>