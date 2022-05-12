<?php
require_once __DIR__ . './../config/databasenew.php';
class Upload{
  function deleteImages(){
    
    $image_id = $_POST['image_id'];
    $image_url = $_POST['image_url'];
    $image_dir = $_POST['../../../uploads/items/'.$image_url];
    $db = new Connect;
    if(file_exists($image_dir)) {
      if (unlink($image_dir)) {
        $statement = $db->prepare("DELETE FROM images WHERE image_id = $image_id");
        try {
          if ($statement->execute()) {
            $response = array(
              "status" => "success",
              "error" => false,
              "message" => "Successfully deleted",
            );
            http_response_code(200);
            echo json_encode($response);
          } else {
            $response = array(
              "status" => "error",
              "error" => true,
              "message" => "Error when deleting image"
            );
            http_response_code(403);
            echo json_encode($response);
          }
        } catch (Exception $e) {
          $pdo->rollback();
          throw $e;
        }
      }
    }
}  
}
$Upload = new Upload;
echo $Upload->deleteImages();
?>