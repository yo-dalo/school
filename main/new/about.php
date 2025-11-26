<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>About - .... Senior Secondary School</title>
  <link rel="stylesheet" href="../style.css" />

  <style>
    .container {
      max-width: 800px;
      margin: 20px auto;
      padding: 20px;
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h1 {
      text-align: center;
      color: #333;
      margin-bottom: 20px;
    }

    .about-content {
      font-size: 16px;
      color: #555;
      line-height: 1.6;
    }

    .highlight {
      color: #007bff;
      font-weight: bold;
    }
  </style>
</head>
<body>

<div class="main">
  <div class="page_1">

    <!-- Header Include -->
    <?php
      require("../conn.php");
      require("../header.php");
    ?>

    <div class="top_box">
      <h1>ABOUT US</h1>
    </div>

    <div class="container">
      <div class="about-content">
        <p>
          <span class="highlight">... Senior Secondary School</span> is a premier institution committed to delivering quality education and fostering all-round development in students. Established with a vision to promote academic excellence, discipline, and moral values, our school has become a trusted name in the field of education.
        </p>
        <p>
          The school offers classes from Nursery to Class XII and follows a well-structured CBSE curriculum. We focus on a holistic learning approach that blends academics, sports, arts, and cultural activities. Our faculty is highly qualified and dedicated to nurturing each child’s unique potential.
        </p>
        <p>
          With modern classrooms, laboratories, a rich library, and various co-curricular clubs, we aim to make learning a joyful and meaningful experience. At School Senior Secondary School, we believe in shaping responsible citizens and future leaders.
        </p>
        <p>
          <strong>Our Motto:</strong> "Knowledge. Discipline. Progress."
        </p>
      </div>
    </div>

    <!-- Footer Include -->
    <?php
      require("../footer.php");
    ?>

  </div>
</div>

<script src="main.js"></script>
<script src="./../js/mainNav2.js"></script>  </body>
</html>