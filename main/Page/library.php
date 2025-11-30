<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Library - School Senior Secondary School</title>
  <link rel="stylesheet" href="../css/utility/page-utility.css">

      <link rel="stylesheet" href="../css/utility/main-utility.css">   <link rel="stylesheet" href="../css/header/nav.css">  <link rel="stylesheet" href="../css/header/navBar.css">   <link rel="stylesheet" href="../css/header/mainNav2.css">   <link rel="stylesheet" href="../css/footer/footer.css">






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
      <h1>LIBRARY</h1>
    </div>

    <div class="container">
      <h1>Our Library</h1>
      <div class="about-content">
        <p>
          The library at <span class="highlight">School Senior Secondary School</span> is a hub of knowledge and learning, offering a vast collection of resources to support academic and personal growth. It is designed to foster a love for reading and research among students.
        </p>

        <p>
          Features of our library include:
        </p>
        <ul>
          <li><strong>Extensive Collection:</strong> Over [Insert Number, e.g., 10,000] books, including textbooks, reference materials, novels, and journals.</li>
          <li><strong>Digital Resources:</strong> Access to e-books, online journals, and educational databases.</li>
          <li><strong>Reading Areas:</strong> Quiet and comfortable spaces for individual and group study.</li>
          <li><strong>Librarian Support:</strong> Dedicated staff to assist students in finding resources and conducting research.</li>
          <li><strong>Regular Events:</strong> Book fairs, reading competitions, and author interactions to promote literacy.</li>
        </ul>

        <p>
          Our library is a vital resource for students and faculty, encouraging intellectual curiosity and lifelong learning. It is open during school hours and accessible to all students.
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