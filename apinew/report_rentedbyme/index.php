<?php
require_once __DIR__ . './../config/databasenew.php';
class RentByMe{
  function rentByMe(){
    // $renter_id = $_POST['renter_id'];
    $renter_id = 1;
    $rent = array();
    $db = new Connect;
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
    u.firstname AS firstname,
    u.lastname AS lastname,
    u.email AS email,
    u.phone AS phone,
    r.id AS reservation_id,
    r.renter_id AS renter_id,
    r.tenant_id AS tenant_id,
    c.city,
    d.district,
    ca.category_name AS category_name,
    img.name as img
    FROM post AS p
    LEFT JOIN user AS u
    ON p.user_id = u.user_id
    LEFT JOIN reservation AS r
    on. p.post_id = r.post_id
    LEFT JOIN categories AS ca
    ON p.category_id = ca.category_id
    LEFT JOIN cities AS c
    ON p.city_id = c.id
    LEFT JOIN district AS d
    ON p.district_id = d.id
    LEFT JOIN (
        SELECT * FROM images
        WHERE id IN (
          SELECT min(id) FROM images GROUP BY post_id
        )
      ) AS img
      ON p.post_id = img.post_id
      WHERE p.is_active IN (1,2) AND p.post_id = r.post_id AND renter_id = $renter_id";
    $query_prepare = $db->prepare($query);
    $query_prepare->execute();
    while($OutputData=$query_prepare->fetch(PDO::FETCH_ASSOC)){
      $rent[]=array(
        'renter_id' => $OutputData['renter_id'],
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
        'email' => $OutputData['email'],
        'img' => $OutputData['img'],
      );
    }
    $response = (object) [
      'message' => 'Posts rented by me retrieved successfuly',
      'rent' => $rent
    ];
    http_response_code(200);
    return json_encode($response);
  }
}
$RentByMe = new RentByMe;
echo $RentByMe->rentByMe();
?>