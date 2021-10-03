<?php
include 'connect.php';
include 'header.php';
if(isset($_POST['user_id']))
{
    
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