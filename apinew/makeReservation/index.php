<?php
require_once __DIR__ . './../config/databasenew.php';
class Reservation {
  function clickReservation() {
    $tenant_id = !empty($_POST['tenant_id']) ? $_POST['tenant_id'] : NULL;
    $renter_id = !empty($_POST['renter_id']) ? $_POST['renter_id'] : null;
    $from_date = !empty($_POST['from_date']) ? $_POST['from_date'] : NULL;
    $to_date = !empty($_POST['to_date']) ? $_POST['to_date'] : NULL;
    $post_id= !empty($_POST['post_id']) ? $_POST['post_id'] : null;
    $db = new Connect;
    $query = "INSERT INTO reservation (renter_id, tenant_id, from_date, to_date, post_id) VALUES ($renter_id, $tenant_id, '$from_date', '$to_date', $post_id)";
    $query_prepare = $db->prepare($query);
    $query_prepare->execute(); 

    $repsonse = (object) [
      'message' => 'Successfully done click reservation',
      'reference_number' => $db->lastInsertId(),
    ];
    http_response_code(200);
    return json_encode($repsonse);
  }
}
$Reservation = new Reservation;
echo $Reservation->clickReservation();
?>