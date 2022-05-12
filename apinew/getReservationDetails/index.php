<?php
require_once __DIR__ . './../config/databasenew.php';
class GetReservation {
  function displayDates($date1, $date2, $format = 'Y-m-d' ) {
    $dates = array();
    $current = strtotime($date1);
    $date2 = strtotime($date2);
    $stepVal = '+1 day';
    while( $current <= $date2 ) {
       $dates[] = date($format, $current);
       $current = strtotime($stepVal, $current);
    }
    return $dates;
  }
  function getReservationDetails(){
    $post_id = !empty($_POST['post_id']) ? $_POST['post_id'] : null;
    $db = new Connect;

    $reservation_query = "SELECT from_date, to_date FROM reservation WHERE post_id = $post_id AND reservation_state IN (1, 2)";
    $reservation_prepare = $db->prepare($reservation_query);
    $reservation_prepare->execute();
    $reserved_date_range = array();

    while($OutputData=$reservation_prepare->fetch(PDO::FETCH_ASSOC)){
      $reserved_date_range[]=array(
        'from_date' => $OutputData['from_date'],
        'to_date' => $OutputData['to_date'],
        'date_list' => $this->displayDates($OutputData['from_date'], $OutputData['to_date']),
      );
    }
    $response = (object) [
      'message' => 'post retrieved successfuly',
      'reservations' => $reserved_date_range
    ];
    http_response_code(200);
    return json_encode($response);
  }
}
$GetReservation = new GetReservation;
echo $GetReservation->getReservationDetails();
