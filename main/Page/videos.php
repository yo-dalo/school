<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Videos - School Senior Secondary School</title>
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
      <h1>VIDEOS</h1>
    </div>

    <div class="container">
      <h1>Video Gallery</h1>
      <div class="about-content">
        <p>
          Relive the vibrant moments at <span class="highlight">School Senior Secondary School</span> through our video gallery. This section features videos from our Annual Day, educational tours, and other significant school events, showcasing the talents and experiences of our students.
        </p>

        <h3>Annual Day</h3>
        <div class="video-gallery">
          <div class="video-item">
            <video controls>
              <source src="videos/annual-day-2025.mp4" type="video/mp4">
              Your browser does not support the video tag.
            </video>
            <p>Annual Day 2025 Highlights</p>
          </div>
        </div>

        <h3>Educational Tours</h3>
        <div class="video-gallery">
          <div class="video-item">
            <video controls>
              <source src="videos/tour-historical-site-2025.mp4" type="video/mp4">
              Your browser does not support the video tag.
            </video>
            <p>Educational Tour to Historical Site 2025</p>
          </div>
          <div class="video-item">
            <video controls>
              <source src="videos/science-city-tour-2025.mp4" type="video/mp4">
              Your browser does not support the video tag.
            </video>
            <p>Science City Tour 2025</p>
          </div>
        </div>

        <h3>Other Events</h3>
        <div class="video-gallery">
          <div class="video-item">
            <video controls>
              <source src="videos/sports-day-2025.mp4" type="video/mp4">
              Your browser does not support the video tag.
            </video>
            <p>Sports Day 2025 Highlights</p>
          </div>
        </div>

        <p>
          For more videos or to share feedback, please contact the school office at [Insert Contact Details].
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