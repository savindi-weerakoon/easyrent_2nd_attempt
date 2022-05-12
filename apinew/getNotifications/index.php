<?php
require_once __DIR__ . './../config/databasenew.php';
class Notifications {
  function getNotifications() {
    // $user_id = !empty($_POST['user_id']) ? $_POST['user_id'] : NULL;
    $user_id =30;
    $notifications = array();
    $db = new Connect;
    $query = "SELECT * FROM reservation WHERE renter_id= $user_id OR tenant_id= $user_id";
    $query_prepare = $db->prepare($query);
    $query_prepare->execute(); 
    while($OutputData=$query_prepare->fetch(PDO::FETCH_ASSOC)){
      $notifications[]=array(
        'id' => $OutputData['id'],
        'renter_id' => $OutputData['renter_id'],
        'tenant_id' => $OutputData['tenant_id'],
        'reservation_state' => $OutputData['reservation_state'],
        'from_date' => $OutputData['from_date'],
        'to_date' => $OutputData['to_date'],
        'post_id' => $OutputData['post_id'],
      );
    }
    $repsonse = (object) [
      'message' => 'Successfully taken notification information',
      'notifications' => $notifications
    ];
    http_response_code(200);
    return json_encode($repsonse);
  }
}
$Notifications = new Notifications;
echo $Notifications->getNotifications();
?>
