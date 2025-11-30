<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Computer Lab - School Senior Secondary School</title>
  
      <link rel="stylesheet" href="../css/utility/main-utility.css">
  <link rel="stylesheet" href="../css/header/nav.css">
 <link rel="stylesheet" href="../css/header/navBar.css">
  <link rel="stylesheet" href="../css/header/mainNav2.css">
  <link rel="stylesheet" href="../css/footer/footer.css">

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
      <h1>COMPUTER LAB</h1>
    </div>

    <div class="container">
      <h1>Computer Lab</h1>
      <div class="about-content">
        <p>
          The computer lab at <span class="highlight">School Senior Secondary School</span> is a state-of-the-art facility designed to equip students with essential digital skills. It supports our curriculum in Computer Science and Information Technology, preparing students for a technology-driven world.
        </p>

        <p>
          Features of our computer lab include:
        </p>
        <ul>
          <li><strong>Advanced Systems:</strong> [Insert Number, e.g., 30] high-performance computers with the latest software.</li>
          <li><strong>High-Speed Internet:</strong> Reliable connectivity for research and online learning.</li>
          <li><strong>Programming Environment:</strong> Tools for coding in languages like Python, C++, and Java.</li>
          <li><strong>Technical Support:</strong> Dedicated staff to assist with hardware and software queries.</li>
          <li><strong>Regular Workshops:</strong> Training in coding, robotics, and digital literacy for students.</li>
        </ul>

        <p>
          Our computer lab is a hub for innovation, enabling students to explore technology, develop problem-solving skills, and prepare for careers in STEM fields.
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