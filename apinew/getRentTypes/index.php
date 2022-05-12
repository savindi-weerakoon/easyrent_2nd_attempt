<?php
require_once __DIR__ . './../config/databasenew.php';
class RentType{
  function getRentType(){
    $rent = array();
    $db = new Connect;
    $query = "SELECT * FROM renttype";
    $query_prepare = $db->prepare($query);
    $query_prepare->execute();
    while($OutputData=$query_prepare->fetch(PDO::FETCH_ASSOC)){
      $rent[]=array(
        'rent_type_id' => $OutputData['rent_type_id'],
        'rent_type' => $OutputData['rent_type'],
      );
    }
    $response = (object) [
      'message' => 'rent types retrieved successfuly',
      'rent' => $rent
    ];
    http_response_code(200);
    echo json_encode($response);
  }
}
$RentType = new RentType;
echo $RentType->getRentType();
?>