<?php
    include ('connectDB_proj.php');

    //$userId = $_POST['id'];
    //$sql = "select * from users where id = '".$userId."'";
    $sql = "select * from users where id = '1'";

    $query = mysqli_query($con, $sql);
    $result = array();
    while ($rs = $query->fetch_assoc()){
        $result[] = $rs;      
    }
    
    echo json_encode($result);
?>