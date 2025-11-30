<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Photos - School Senior Secondary School</title>
      <link rel="stylesheet" href="../css/utility/main-utility.css">   <link rel="stylesheet" href="../css/header/nav.css">  <link rel="stylesheet" href="../css/header/navBar.css">   <link rel="stylesheet" href="../css/header/mainNav2.css">   <link rel="stylesheet" href="../css/footer/footer.css">


    <link rel="stylesheet" href="../css/utility/page-utility.css">



</head>
<body>
<div class="main">
  <div class="page_1">
    <!-- Header Include -->
       <?php
      require("../php/conn.php");
      require("../php/function.php");
      require("./header.php");
    ?>

    <div class="top_box">
      <h1>PHOTOS</h1>
    </div>

    <div class="container">
      <h1>Photo Gallery</h1>
      <div class="about-content">
        <p>
          Explore the vibrant moments captured at <span class="highlight">School Senior Secondary School</span>. Our photo gallery showcases memories from school functions, classrooms, and sports events, reflecting the dynamic and enriching environment of our institution.
        </p>

        <h3>School Functions</h3>
        <div class="gallery">
          <div class="gallery-item">
            <img src="images/functions/annual-day-2025.jpg" alt="Annual Day Celebration">
            <p>Annual Day 2025</p>
          </div>
          <div class="gallery-item">
            <img src="images/functions/cultural-fest-2025.jpg" alt="Cultural Fest">
            <p>Cultural Fest 2025</p>
          </div>
        </div>

        <h3>Classrooms</h3>
        <div class="gallery">
          <div class="gallery-item">
            <img src="images/classrooms/smart-classroom.jpg" alt="Smart Classroom">
            <p>Smart Classroom Learning</p>
          </div>
          <div class="gallery-item">
            <img src="images/classrooms/science-lab.jpg" alt="Science Lab">
            <p>Science Lab Session</p>
          </div>
        </div>

        <h3>Sports</h3>
        <div class="gallery">
          <div class="gallery-item">
            <img src="images/sports/sports-day-2025.jpg" alt="Sports Day">
            <p>Sports Day 2025</p>
          </div>
          <div class="gallery-item">
            <img src="images/sports/cricket-match.jpg" alt="Cricket Match">
            <p>Inter-House Cricket Match</p>
          </div>
        </div>

        <p>
          For more photos or to share your own captures from school events, please contact the school office at [Insert Contact Details].
        </p>
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