<?php
require_once __DIR__ . './../config/databasenew.php';
class GetMinMax{
  function getMinMaxPrices(){
    $db = new Connect;
    $prices = array();
    $query = "SELECT Min(price) AS min, Max(price) AS max FROM post";
      $query_prepare = $db->prepare($query);
      $query_prepare->execute();
      while($OutputData=$query_prepare->fetch(PDO::FETCH_ASSOC)){
        $prices[]=array(
          'min'=> $OutputData['min'],
          'max' => $OutputData['max'],
        );
      }
      $response = (object) [
        'message' => 'prices retrieved successfuly',
        'prices' => $prices
      ];
      http_response_code(200);
      echo json_encode($response);  
  }
}
$GetMinMax = new GetMinMax;
echo $GetMinMax->getMinMaxPrices();
?>