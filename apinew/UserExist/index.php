<?php
   require_once __DIR__ . './../config/databasenew.php';
    class IsUserExist {
        function UserExist() {
            $username = $_POST['username'];

            $db = new Connect;
            $exist = $db->prepare("SELECT COUNT(*) AS BIT FROM user WHERE username = '$username'");
            $exist->execute();
            $row = $exist->fetch();
            return json_encode($row["BIT"]);
        }
    }
    $IsUserExist= new IsUserExist;
    echo $IsUserExist-> UserExist();
?>