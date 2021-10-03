<?php
//connect.php
$server = 'sql304.epizy.com';
$username   = 'epiz_29928039';
$password   = 'r1fovCl022q';
$database   = 'epiz_29928039_covidCare';

// Create connection
$conn = new mysqli($server, $username, $password);

// Check connection
if ($conn->connect_error) {
   die("Connection failed: " . $conn->connect_error);
}
if(!mysqli_select_db($conn, $database))
{
    exit('Error: could not select the database');
}

// // Check connection
if ($conn->connect_error) {
   die("Connection failed: " . $conn->connect_error);
}
// echo "Connected successfully";

?>
