<?php
require_once __DIR__ . './../config/databasenew.php';
class Test
{
  function getPosts()
  {
    $posts = array();
    $db = new Connect;
    $query = "SELECT p.post_id AS post_id, p.price AS price, p.content AS content, p.user_id AS user_id, p.city_id AS city_id, p.rent_type_id AS rent_type, u.firstname AS firstname FROM post AS p LEFT JOIN user AS u ON p.user_id = u.user_id WHERE post_id = 1";
    $query_prepare = $db->prepare($query);
    $query_prepare->execute();
    while($OutputData=$query_prepare->fetch(PDO::FETCH_ASSOC)){
      $posts[]=array(
        'id'=> $OutputData['post_id'],
        'price'=> $OutputData['price'],
        'content'=> $OutputData['content'],
        'user_id'=> $OutputData['user_id'],
      );
    }
    $response = (object) [
      'message' => 'posts retrieved successfuly',
      'posts' => $posts
    ];
    http_response_code(200);
    echo json_encode($response);
    // echo $posts;
  }
}
$Test = new Test;
echo $Test-> getPosts();


// [
//   {
//     id: 1,
//     name: 'item1',
//     desc: 'description goes here'
//   },
//   {
//     id: 2,
//     name: 'item2',
//     desc: 'description goes here'
//   }
// ]