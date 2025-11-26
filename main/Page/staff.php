<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Staff - School Senior Secondary School</title>
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
      <h1>OUR STAFF</h1>
    </div>

    <div class="container">
      <h1>Our Staff</h1>
      <div class="about-content">
        <p>
          At <span class="highlight">School Senior Secondary School</span>, our staff is the backbone of our institution, dedicated to nurturing young minds and fostering a supportive learning environment. Comprising both teaching and non-teaching members, our team is committed to the holistic development of every student.
        </p>

        <p>
          Our teaching staff consists of highly qualified educators who are experts in their respective fields. They bring passion, innovation, and dedication to the classroom, ensuring that students receive quality education that goes beyond textbooks. Through continuous professional development, our teachers stay updated with modern teaching methodologies to inspire and guide students effectively.
        </p>

        <p>
          Our non-teaching staff plays an equally vital role in the smooth functioning of the school. From administrative support to maintaining our facilities, they ensure a safe, organized, and welcoming environment for students, parents, and visitors. Their hard work behind the scenes allows our institution to operate seamlessly.
        </p>

        <p>
          Together, our staff embodies the values of <span class="highlight">integrity, teamwork, and excellence</span>. We are proud of their contributions and their unwavering commitment to shaping the future of our students. For more details about our teaching and non-teaching staff, please explore the respective sections on our website.
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
</body>
</html>