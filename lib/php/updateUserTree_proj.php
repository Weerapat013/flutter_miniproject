<?php
    include ('connectDB_proj.php');

    $postId = $_POST['id'];
    $title = $_POST['title'];
    $caption = $_POST['caption'];
    $description = $_POST['description'];

    $sql = "update post set title = '".$title."', caption = '".$caption."', description = '".$description."' where id = '".$postId."'";

    if ($con->query($sql)) {
		echo json_encode('Success');
	} else {
		echo json_encode('Error');
	}
?>