<?php
    require_once __DIR__ . './../config/databasenew.php';
    class UserLogin {
        function Login() {
            $username = !empty($_POST['username']) ? $_POST['username'] : null;
            $password = !empty($_POST['password']) ? $_POST['password'] : null;

            if (!empty($username) || !empty($password)) {
                $db = new Connect;
                $user = $db->prepare("SELECT username FROM user WHERE username = '$username'");
                $user->execute();
                $row = $user->fetch();
                if(!empty($row)) {
                    $pass = $db->prepare("SELECT password FROM user WHERE username = '$username'");
                    $pass->execute();
                    $passwordverify = $pass->fetch();
                    $passwordnew = md5($password);
                    if($passwordnew == $passwordverify["password"]){
                        // echo "User and Password Correct";
                        $token = random_bytes(20);
                        $token = bin2hex($token);
                        $query = "UPDATE user 
                        SET token = '$token'
                        WHERE username = '$username'";
                        $query_prepare = $db->prepare($query);
                        $query_prepare->execute(); 

                        $repsonse = (object) [
                          'message' => 'Successfully updated the token',
                          'token' => $token,
                        ];
                        http_response_code(200);
                        return json_encode($repsonse);
                    } else {
                      return "Password is incorrect or Empty";
                    }
                } else {
                  return "User does not exist";
                }
            } else {
                return "Enter Username and Password";
            }
        }
    }
    $UserLogin = new UserLogin;
    echo $UserLogin->Login();
