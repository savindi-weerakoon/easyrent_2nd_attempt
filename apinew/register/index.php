<?php
    require_once __DIR__ . './../config/databasenew.php';
    class User {
        function Usercreate ($username, $firstname, $lastname, $telephone, $email, $password) {
            $db = new Connect;
            $insert_query = "INSERT INTO user(username, firstname, lastname, phone, email, password) 
            VALUES (:username, :firstname, :lastname, :telephone, :email, :passwordnew)";
            $insert_query_prepare = $db->prepare($insert_query);
                try {
                    if ($insert_query_prepare->execute([
                        'username' => $username,
                        'firstname' => $firstname,
                        'lastname' => $lastname,
                        'telephone' => $telephone,
                        'email' => $email,
                        'passwordnew' => $password,
                    ]))
                    {
                        $repsonse = (object) [
                            'message' => "Successfully Entered"
                        ];
                        http_response_code(200);
                        echo json_encode($repsonse);
                    } else {
                        http_response_code(400);
                        echo 'Error when sending request';
                    }
                } catch (Exception $e){
                    http_response_code(400);
                    $db->rollback();
                    throw $e;
                }
             }

        function checkUsers () {
            $username = $_POST['username'];
            $firstname = $_POST['firstname'];
            $lastname = $_POST['lastname'];
            $telephone = $_POST['telephone'];
            $email = $_POST['email'];
            $password = $_POST['password'];
            $passwordnew = md5($password);

            if (empty($username)) {
                echo "empty username";
            } else if (empty($firstname)) {
                echo "empty firstname";
            } else if (empty($lastname)) {
                echo "empty lastname";
            } else if (empty($telephone)) {
                echo "empty telephone";
            } else if(empty($email)) {
                echo "empty email";
            } else if(empty($passwordnew)) {
                echo "empty password";
            } else {
                if (!preg_match('/^[A-Za-z\s ]+$/', $username)) {
                    echo "invalid username";
                } else if (!preg_match('/^[A-Za-z\s ]+$/', $firstname)) {
                    echo "invalid firstname";   
                } else if (!preg_match('/^[A-Za-z\s ]+$/', $lastname)) {
                    echo "invalid lastname";        
                } else if (!preg_match('/^\d{9}+$/', $telephone)) {
                    echo "invalid telephone";
                } else if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
                    echo "invalid email"; 
                } else if (!preg_match("/^.{4,}$/", $passwordnew)) {
                    echo "invalid password";           
                } else {
                    $this->Usercreate ($username, $firstname, $lastname, $telephone, $email, $passwordnew);
                }
            } 
        }
    }
    $User = new User;
    $User->checkUsers();
?>