<?php
require_once __DIR__ . './../config/databasenew.php';
class CategoriesView{
  function getCategoriesView(){
    $categories = array();
    $db = new Connect;
    $query = "SELECT * FROM categories";
    $query_prepare = $db->prepare($query);
    $query_prepare->execute();
    while($OutputData=$query_prepare->fetch(PDO::FETCH_ASSOC)){
      $categories[]=array(
        'category_id' => $OutputData['category_id'],
        'category_name' => $OutputData['category_name'],
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
$CategoriesView = new CategoriesView;
echo $CategoriesView->getCategoriesView();
?>