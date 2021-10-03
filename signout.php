<?php
//signin.php
include 'connect.php';
include 'header.php';

session_destroy();

header("Location: http://localhost/covid-care/signin.php");
    exit();



?>
