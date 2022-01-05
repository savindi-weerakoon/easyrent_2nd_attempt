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
                        echo "User and Password Correct";
                    } else {
                        echo "Password is incorrect or Empty";
                    }
                } else {
                    echo "User does not exist";
                }
            } else {
                echo "Enter Username and Password";
            }
        }
    }
    $UserLogin = new UserLogin;
    $UserLogin->Login();
?>