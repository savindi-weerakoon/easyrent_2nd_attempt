<?php
require_once __DIR__ . './../config/databasenew.php';
class GetParentCategoriesWithCount{
  function getParentCategoriesWithCount(){
    $db = new Connect;
    $withCountpr = array();
    $query = "SELECT 
    pr.parent_category_id As parent_category_id,
    pr.parent_category_name As parent_category_name,
    count(p.post_id) AS post_count
    FROM parent_categories AS pr
    LEFT JOIN post AS p
    ON pr.parent_category_id = p.parent_category_id
    GROUP BY pr.parent_category_id, pr.parent_category_name
    ORDER BY post_count DESC";
    $query_prepare = $db->prepare($query);
    $query_prepare->execute();
    while($OutputData=$query_prepare->fetch(PDO::FETCH_ASSOC)){
      $withCountpr[]=array(
        'parent_category_id'=> $OutputData['parent_category_id'],
        'parent_category_name' => $OutputData['parent_category_name'],
        'post_count' => $OutputData['post_count'],
      );
    }
    $response = (object) [
      'message' => 'Categories with count retrieved successfuly',
      'withCountpr' => $withCountpr
    ];
    http_response_code(200);
    return json_encode($response);  
  }
}
$GetParentCategoriesWithCount = new GetParentCategoriesWithCount;
echo $GetParentCategoriesWithCount->getParentCategoriesWithCount();
?>