<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Exam & Assessment System - School Senior Secondary School</title>
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
      <h1>EXAM & ASSESSMENT SYSTEM</h1>
    </div>

    <div class="container">
      <h1>Exam & Assessment System</h1>
      <div class="about-content">
        <p>
          The exam and assessment system at <span class="highlight">School Senior Secondary School</span> is designed to evaluate students’ academic progress while promoting a stress-free and holistic approach to learning. Our system aligns with [Insert Board, e.g., CBSE] guidelines and focuses on continuous and comprehensive evaluation (CCE).
        </p>

        <h3>Assessment Structure</h3>
        <ul>
          <li><strong>Formative Assessments (FA):</strong> Regular class tests, quizzes, projects, and assignments to monitor ongoing progress.</li>
          <li><strong>Summative Assessments (SA):</strong> Term-end examinations to evaluate overall learning outcomes.</li>
          <li><strong>Co-Scholastic Assessments:</strong> Evaluation of life skills, attitudes, and participation in co-curricular activities.</li>
        </ul>

        <h3>Examination Schedule</h3>
        <ul>
          <li>Periodic Tests: Conducted [e.g., monthly/quarterly] to assess subject-wise understanding.</li>
          <li>Mid-Term Exams: Held halfway through the academic year.</li>
          <li>Annual Exams: Conducted at the end of the academic year for Classes I-XII.</li>
          <li>Board Exams: For Classes X and XII, as per [Insert Board] guidelines.</li>
        </ul>

        <p>
          We provide detailed feedback to students and parents after each assessment, ensuring transparency and opportunities for improvement. Our focus is on fostering a growth mindset, where assessments are seen as tools for learning rather than just evaluation.
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