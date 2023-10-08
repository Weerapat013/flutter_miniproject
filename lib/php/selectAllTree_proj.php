<?php
    include ('connectDB_proj.php');

    $sql = "select * from post";

    $query = mysqli_query($con, $sql);
    $result = array();
    while ($rs = $query->fetch_assoc()){
        $result[] = $rs;      
    }
    
    echo json_encode($result);
?>