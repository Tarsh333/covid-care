<?php
include 'connect.php';
include 'header.php';
if(isset($_POST['user_id']))
{
    $sql="UPDATE users
    SET user_vaccination = user_vaccination + 1
    WHERE users.user_id = " . mysqli_real_escape_string($conn, $_POST['user_id']);
    $result = mysqli_query($conn, $sql);
    // echo $result;
    // var_dump($result);
    if(!$result)
    {
        echo 'Something went wrong while updating. Please try again later.';
        echo mysqli_error($conn); //debugging purposes, uncomment when needed
    }
    else
    {
        $sql = "DELETE FROM approve_vaccination WHERE user_id=".$_POST['user_id'];
        $result = mysqli_query($conn, $sql);
        if(!$result)
    {
        echo 'Something went wrong while updating. Please try again later.';
        echo mysqli_error($conn); //debugging purposes, uncomment when needed
    }
    else{
        echo 'Successfully updated. <a href="index.php">Back to home page</a>  :-)';
    }
    }
  }
  else{
    header("Location: index.php");
    exit();
  }
?>