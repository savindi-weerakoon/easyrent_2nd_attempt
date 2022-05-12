<?php
  require_once __DIR__ . '../../../../config/databasenew.php';
  class Post {
    function getPost() {
      $user_id = $_POST['user_id'];
      $db = new Connect;

      $order_count_query = "SELECT COUNT(payment_id) AS order_count FROM payments WHERE tenant_id = $user_id AND is_completed = 1";
      $order_count_statement = $db->prepare($order_count_query);
      $order_count_statement->execute();
      $order_count_row = $order_count_statement->fetch();
      $order_count = $order_count_row["order_count"];
      
      $gross_query = "SELECT SUM(amount) AS gross FROM payments WHERE tenant_id = $user_id AND is_completed = 1";
      $gross_statement = $db->prepare($gross_query);
      $gross_statement->execute();
      $gross_row = $gross_statement->fetch();
      $gross = $gross_row["gross"];

      $current_month = date('Y-m-d');
      $month_income_query = "SELECT SUM(amount) AS month_income FROM payments WHERE tenant_id = $user_id AND MONTH(paid_at) = MONTH('$current_month') AND is_completed = 1";
      $month_income_statement = $db->prepare($month_income_query);
      $month_income_statement->execute();
      $month_income_row = $month_income_statement->fetch();
      $month_income = $month_income_row["month_income"];

      $monthly_trans_query = "SELECT
      MONTHNAME(paid_at) AS `month`,
      SUM(amount) AS `transaction`
      FROM payments
      WHERE tenant_id = $user_id AND
      YEAR(paid_at) = YEAR('$current_month')
      AND is_completed = 1
      GROUP BY MONTHNAME(paid_at)";
      
      $monthly_trans_statement = $db->prepare($monthly_trans_query);
      $monthly_trans_statement->execute();
      $trans = [];
      while($OutputData=$monthly_trans_statement->fetch(PDO::FETCH_ASSOC)){
        $trans[]=array(
          'month'=> $OutputData['month'],
          'transaction'=> $OutputData['transaction']
        );
      }

      $daily_trans_query = "SELECT
      HOUR(paid_at) AS hour,
      SUM(amount) AS `transaction`
      FROM payments
      WHERE tenant_id = $user_id AND
      DATE(paid_at) = DATE('$current_month')
      AND is_completed = 1
      GROUP BY HOUR(paid_at)";
      
      $daily_trans_statement = $db->prepare($daily_trans_query);
      $daily_trans_statement->execute();
      $daily = [];
      while($OutputData=$daily_trans_statement->fetch(PDO::FETCH_ASSOC)){
        $daily[]=array(
          'hour'=> $OutputData['hour'],
          'transaction'=> $OutputData['transaction']
        );
      }

      $repsonse = (object) [
        'message' => 'Post retrieved successfully',
        'order_count' => $order_count,
        'gross' => $gross,
        'month_income' => $month_income,
        'monthly_transactions' => $trans,
        'daily_transactions' => $daily
      ];
      http_response_code(200);
      echo json_encode($repsonse);
    }
  }
  $Post = new Post;
  echo $Post->getPost();
