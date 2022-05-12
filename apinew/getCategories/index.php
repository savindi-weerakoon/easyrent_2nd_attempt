<?php
require_once __DIR__ . './../config/databasenew.php';
class Categories{
  function getCategories(){
    $parent_id = $_GET['parent_id'];
    $categories = array();
    $db = new Connect;
    $query = "SELECT * FROM categories WHERE parent_id = $parent_id";
    $query_prepare = $db->prepare($query);
    $query_prepare->execute();
    while($OutputData=$query_prepare->fetch(PDO::FETCH_ASSOC)){
      $categories[]=array(
        'category_id' => $OutputData['category_id'],
        'category_name' => $OutputData['category_name'],
        'parent_id' => $OutputData['parent_id'],
      );
    }
    $response = (object) [
      'message' => 'categories retrieved successfuly',
      'categories' => $categories
    ];
    http_response_code(200);
    return json_encode($response);
  }
}
$Categories = new Categories;
echo $Categories->getCategories();
?>