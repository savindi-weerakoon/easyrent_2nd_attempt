<?php
  require_once __DIR__ . './../config/databasenew.php';
  class Locs {
    function getStates ($db, $country_id) {
      $states = array();
      $query = "SELECT * FROM province WHERE country_id = $country_id"; 
      $statement = $db->prepare($query);
      $statement->execute();
      while($OutputData=$statement->fetch(PDO::FETCH_ASSOC)){
        $states[]=array(
          'id'=> $OutputData['id'],
          'country_id' => $OutputData['country_id'],
          'province' => $OutputData['province']
        );
      }
      $repsonse = (object) [
        'message' => 'Successfully retrieved states',
        'states' => $states
      ];
      http_response_code(200);
      echo json_encode($repsonse);
    }
    function getDistricts ($db, $province_id) {
      $districts = array();
      $query = "SELECT * FROM district WHERE province_id = $province_id";
      $statement = $db->prepare($query);
      $statement->execute();
      while($OutputData=$statement->fetch(PDO::FETCH_ASSOC)){
        $districts[]=array(
          'id'=> $OutputData['id'],
          'province_id' => $OutputData['province_id'],
          'district' => $OutputData['district']
        );
      }
      $repsonse = (object) [
        'message' => 'Successfully retrieved districts',
        'districts' => $districts
      ];
      http_response_code(200);
      echo json_encode($repsonse);
    }
    function getCities ($db, $district_id) {
      $cities = array();
      $query = "SELECT * FROM cities WHERE district_id = $district_id";
      $statement = $db->prepare($query);
      $statement->execute();
      while($OutputData=$statement->fetch(PDO::FETCH_ASSOC)){
        $cities[]=array(
          'id'=> $OutputData['id'],
          'district_id' => $OutputData['district_id'],
          'city' => $OutputData['city']
        );
      }
      $repsonse = (object) [
        'message' => 'Successfully retrieved cities',
        'cities' => $cities
      ];
      http_response_code(200);
      return json_encode($repsonse);
    }
    function callMethod () {
      $country_id = !empty($_GET['country_id']) ? $_GET['country_id'] : null;
      $province_id = !empty($_GET['province_id']) ? $_GET['province_id'] : null;
      $district_id = !empty($_GET['district_id']) ? $_GET['district_id'] : null;
      $db = new Connect;
      if (!empty($country_id)) {
        return $this->getStates($db, $country_id);
      } else if (!empty($province_id)) {
        return $this->getDistricts($db, $province_id);
      } else if (!empty($district_id)) {
        return $this->getCities($db, $district_id);
      } 
    }
  }
  $Locs = new Locs;
  echo $Locs->callMethod();
?>