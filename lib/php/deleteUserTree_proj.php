<?php
    include ('connectDB_proj.php');

    $postId = $_POST['id'];
    $sql = "delete from post where id = '".$postId."'";

    if ($con->query($sql)) {
		echo json_encode('Success');
	} else {
		echo json_encode('Error');
	}
?>