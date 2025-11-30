<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Teaching Staff - School Senior Secondary School</title>
      <link rel="stylesheet" href="../css/utility/main-utility.css">   <link rel="stylesheet" href="../css/header/nav.css">  <link rel="stylesheet" href="../css/header/navBar.css">   <link rel="stylesheet" href="../css/header/mainNav2.css">   <link rel="stylesheet" href="../css/footer/footer.css">

    <link rel="stylesheet" href="../css/utility/page-utility.css">


</head>
<body>
<div class="main">
  <div class="page_1">
    <!-- Header Include -->
    <?php
      require("../php/conn.php"); require("../php/function.php");
      require("./header.php");
    ?>

    <div class="top_box">
      <h1>TEACHING STAFF</h1>
    </div>

    <div class="container">
      <h1>Our Teaching Staff</h1>
      <div class="about-content">
        <p>
          Our teaching staff at <span class="highlight">School Senior Secondary School</span> comprises dedicated educators who are passionate about imparting knowledge and shaping young minds. Each teacher is highly qualified and specializes in their respective subjects, fostering a dynamic and engaging learning environment.
        </p>

        <div class="staff-grid">
          <!-- Sample Staff Member -->
          <div class="staff-card">
            <img src="images/teacher1.jpg" alt="Teacher Name">
            <h3>Ms. [Teacher Name]</h3>
            <p>Subject: Mathematics</p>
          </div>
          <div class="staff-card">
            <img src="images/teacher2.jpg" alt="Teacher Name">
            <h3>Mr. [Teacher Name]</h3>
            <p>Subject: Physics</p>
          </div>
          <div class="staff-card">
            <img src="images/teacher3.jpg" alt="Teacher Name">
            <h3>Ms. [Teacher Name]</h3>
            <p>Subject: English</p>
          </div>
          <div class="staff-card">
            <img src="images/teacher4.jpg" alt="Teacher Name">
            <h3>Mr. [Teacher Name]</h3>
            <p>Subject: History</p>
          </div>
          <!-- Add more staff members as needed -->
        </div>
      </div>
    </div>

    <!-- Footer Include -->
    <?php
      require("./footer.php");
    ?>
  </div>
</div>

<script src="main.js"></script><script src="./../main.js"></script>
<script src="./../js/mainNav2.js"></script>  </body>
</html>