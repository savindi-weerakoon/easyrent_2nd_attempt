<?php
require_once __DIR__ . './../config/databasenew.php';
class UploadBankSlip
{
  function bankSlipUpload()
  {
    $image = $_FILES['image']; //image is taken
    $image_name = "";
    if ($image['size'] > 0 && $image['error'] == 0) { //check whether image is empty 
      $allowed = array('png', 'jpg', 'jpeg', 'PNG', 'JPG', 'JPEG'); //check file format
      $filename = $image['name'];
      $ext = pathinfo($filename, PATHINFO_EXTENSION);
      $ext = strtolower($ext);
      if (!in_array($ext, $allowed)) {
        $response = array(
          "status" => "error",
          "error" => true,
          "message" => "Image type is not allowed"
        );
        http_response_code(403);
        echo json_encode($response);
      } else {
        $image_name = round(microtime(true) * 1000) . "." . $ext; //code to change the image name
        $image_upload_dir = './../uploads/bank_slip/' . $image_name;
        $temp_name = $_FILES['image']['tmp_name'];
        if (move_uploaded_file($temp_name, $image_upload_dir)) {
          $db = new Connect;
          $statement = $db->prepare('INSERT INTO images (`name`) VALUES (:image_name)');
          try {
            if ($statement->execute([
              'image_name' => $image_name
            ])) {
              $response = array(
                "status" => "success",
                "error" => false,
                "message" => "Successfully uploaded",
                "data" => array(
                  "id" => $db->lastInsertId(),
                  "name" => $image_name
                )
              );
              http_response_code(200);
              return json_encode($response);
            } else {
              $response = array(
                "status" => "error",
                "error" => true,
                "message" => "Error when recording image"
              );
              http_response_code(403);
              return json_encode($response);
            }
          } catch (Exception $e) {
            $db->rollback();
            throw $e;
          }
        } else {
          $response = array(
            "status" => "error",
            "error" => true,
            "message" => "Error when uploading bank slip"
          );
          http_response_code(403);
          return json_encode($response);
        }
      }
    } else {
      $response = array(
        "status" => "error",
        "error" => true,
        "message" => "Error when reading bank slip"
      );
      http_response_code(403);
      return json_encode($response);
    }
  }
}
$UploadBankSlip = new UploadBankSlip;
echo $UploadBankSlip->bankSlipUpload();
