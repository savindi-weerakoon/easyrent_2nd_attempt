<?php
require_once __DIR__ . './../config/databasenew.php';
class GetCategoriesWithCount{
  function getCategoriesWithCount(){
    $db = new Connect;
    $withCount = array();
    $query = "SELECT 
    c.category_id As category_id,
    c.parent_id AS parent_id,
    c.category_name As category_name,
    count(p.post_id) AS post_count
    FROM categories AS c
    LEFT JOIN post AS p
    ON c.category_id = p.category_id
    GROUP BY c.category_id, c.category_name
    ORDER BY post_count DESC";
    $query_prepare = $db->prepare($query);
    $query_prepare->execute();
    while($OutputData=$query_prepare->fetch(PDO::FETCH_ASSOC)){
      $withCount[]=array(
        'category_id'=> $OutputData['category_id'],
        'parent_id' => $OutputData['parent_id'],
        'category_name' => $OutputData['category_name'],
        'post_count' => $OutputData['post_count'],
      );
    }
    $response = (object) [
      'message' => 'Categories with count retrieved successfuly',
      'withCount' => $withCount
    ];
    http_response_code(200);
    return json_encode($response);  
  }
}
$GetCategoriesWithCount = new GetCategoriesWithCount;
echo $GetCategoriesWithCount->getCategoriesWithCount();
?>