<?php
    include ('connectDB_proj.php');

    $title = $_POST['title'];
    $caption = $_POST['caption'];
    $description = $_POST['description'];
    $userId = 1;
    //$userId = $_POST['userId'];

    $sql = "insert into post (title, caption, description, userId) values (?, ?, ?, ?)";

    $statement = $con -> prepare($sql);
    $statement -> bind_param('sssi', $title, $caption, $description, $userId);
    //i: integer, s:string, d:double, b:blob

    if ($statement->execute()) {
        echo json_encode('Success');
    } else {
        echo json_encode('Error');
    }

    $statement->close();
?>