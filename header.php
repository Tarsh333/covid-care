<!doctype html>
<html>

<head>
<title>Covid-Care</title>
<link rel="stylesheet" href="style.css">
</head>

<body>
      <header>
      <a class="item" href="index.php"> Home </a>
      <a class="item" href="http://localhost/covid-care/category.php?id=8">Resources</a>
      <?php
      session_start();
      // var_dump($_SESSION);
      // echo $_SESSION['user_level'];
      if (isset($_SESSION['user_level'])&&$_SESSION['user_level']==1) {
       echo '<a class="item" href="vaccination.php">View Vaccinations</a>';
       echo '<a class="item" href="approve-vaccination.php">Approve Vaccination Status</a>';
       
      }
      if (isset($_SESSION['user_level'])) {
       echo '  <a href="signout.php">Sign out</a>';
      }

      ?>
    </header>
    <div class="container">



