<?php
    include ('connectDB_proj.php');

    $userId = $_POST['id'];
    //$username = $_POST['username'];
    //$password = $_POST['password'];
    $fullname = $_POST['fullname'];
    //$birthday = $_POST['birthday'];
    $address = $_POST['address'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];

    $sql = "update users set fullname = '".$fullname."', address = '".$address."', email = '".$email."', phone ='".$phone."' where id = '".$userId."'";

    if ($con->query($sql)) {
		echo json_encode('Success');
	} else {
		echo json_encode('Error');
	}
?>