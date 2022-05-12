<?php
  require_once __DIR__ . './../config/databasenew.php';
  class Post{
    function publishPost ($itemname, $description, $renttype, $rent_price, $city_id){
      $db = new Connect;
      $query = "INSERT INTO post (itemname, content, rent_type_id, price, city_id) VALUES ('$itemname', '$description', $renttype, $rent_price, $city_id)";
      $php_prepared_function = $db->prepare($query);
      $php_prepared_function->execute(); 

      $repsonse = (object) [
        'message' => 'Successfully reviewed post'
      ];
      http_response_code(200);
      echo json_encode($repsonse);
        // try {
        //   if ($insert_query->execute()){
        //     $post_id = $db->lastInsertId();
        //     if (count($image_ids) >0) {
        //       $this->addImages($db, $post_id, $image_ids);
        //     } else {
        //       $repsonse = (object) [
        //       'message' => "Successfully published withput images"
        //       ];
        //       http_response_code(200);
        //       echo json_encode($repsonse);
        //     } 
        //   } 
        //   else{
        //       http_response_code(400);
        //       echo 'Error when uploading images';
        //   }
        //  } catch (Exception $e){
        //     http_response_code(400);
        //     $db->rollback();
        //     throw $e;
        //     }  
      }

    // function addImages ($db, $post_id, $image_ids){
    //   $length = count($image_ids);
    //   $count = 1;
    //   foreach($image_ids as $image_id) {
    //     $query = "UPDATE images SET post_id = $post_id WHERE image_id = $image_id";
    //     $query_statement = $db->prepare($query);
    //       try {
    //         if ($query_statement->execute()){
    //           if($length == $count ){
    //             $repsonse = (object) [
    //                 'message' => "Successfully published"
    //             ];
    //             http_response_code(200);
    //             echo json_encode($repsonse);
    //         } else {
    //             $count++;
    //         }
    //         }else {
    //           http_response_code(400);
    //           echo 'Error when uploading images';
    //         }
    //       } catch (Exception $e){
    //         http_response_code(400);
    //         $db->rollback();
    //         throw $e;
    //     }
    //       }
    //   }

    function addProduct () {
      $itemname = $_POST['itemname'];
      $description = $_POST['description'];
      $renttype = $_POST['rent_type'];
      // $rent_id = $_POST['rent_id'];
      $rent_price = $_POST['price'];
      // $user_id = $_POST['user_id'];
      // $category_id = $_POST['category_id'];
      $city_id = $_POST['city_id'];
      // $district_id = $_POST['district_id'];
      // $province_id = $_POST['province_id'];
      // $image_ids = !empty($_POST['image_ids']) ? $_POST['image_ids'] : [];
      // $image_ids = json_decode('$image_ids');
        
      
      if(
        !empty($itemname) 
        // !empty($renttype) &&
        // !empty($rent_price) &&
        // !empty($user_id) &&
        // !empty($category_id) &&
        // !empty($city_id) 
        ) {
          return $this->publishPost($itemname, $description, $renttype, $rent_price, $city_id);
          // echo $itemname;
          // echo $description;
        } else {
            http_response_code(400);
            "Item name, rent type, rent price, category and location fields are required.";    
        }
    }
  }
  $Post = new Post;
  echo $Post->addProduct();
?>