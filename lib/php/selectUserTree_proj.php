<?php
    include ('connectDB_proj.php');

    //$username = $_POST['username'];
    //$sql = "select * from post where username = '". $username ."'" ;
    $sql = "select * from post where userId = '1'";

    $query = mysqli_query($con, $sql);
    $result = array();
    while ($rs = $query->fetch_assoc()){
        $result[] = $rs;      
    }
    
    echo json_encode($result);
?>