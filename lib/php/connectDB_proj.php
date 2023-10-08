<?php
    $host = "localhost";    //ชื่อเครื่อง Server
    $username = "root";     //ชื่อ username connect MySQL
    $password = "";         // password ของ username
    $db= "project_mobile";  // ชื่อ ฐานข้อมูล

    $con = new mysqli($host, $username, $password, $db);

    if ($con -> connect_error) {
        // echo "Something Error";
        die('Error : ('. $con->connect_errno .')'. $con->connect_error);
    } else {
         //echo "Connect sucessfully";
    }
    
    $con->set_charset("utf8"); 
?>