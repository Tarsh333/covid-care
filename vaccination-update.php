<?php
include 'connect.php';
include 'header.php';
if(isset($_POST['certificate_link']))
{
    $sql = "INSERT INTO
    approve_vaccination(user_id,certificate_link)
    VALUES('" . mysqli_real_escape_string($conn, $_SESSION['user_id']) . "',
                       '" . mysqli_real_escape_string($conn, $_POST['certificate_link']) . "'
                        )";
    $result = mysqli_query($conn, $sql);
    // echo $result;
    // var_dump($result);
    if(!$result)
    {
        echo 'Something went wrong while deleting post. Please try again later.';
        // echo mysqli_error($conn); //debugging purposes, uncomment when needed
    }
    else
    {
        echo 'Request Successfully Generated. It will be processed soon. <a href="index.php">Back to home page</a>  :-)';
    }
  }
  else{
    header("Location: http://localhost/covid-care/index.php");
    exit();
  }
?>