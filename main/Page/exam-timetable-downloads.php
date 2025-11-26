<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Exam Timetable Downloads - School Senior Secondary School</title>
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
      <h1>EXAM TIMETABLE DOWNLOADS</h1>
    </div>

    <div class="container">
      <h1>Exam Timetable Downloads</h1>
      <div class="about-content">
        <p>
          Download the examination timetables for <span class="highlight">School Senior Secondary School</span> for the academic year [Insert Year, e.g., 2025-26]. These schedules cover periodic tests, mid-term exams, and annual examinations for all classes.
        </p>

        <table>
          <thead>
            <tr>
              <th>Exam</th>
              <th>Class</th>
              <th>Download Link</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>First Periodic Test</td>
              <td>Classes I-VIII</td>
              <td><a href="timetables/first-periodic-test-2025.pdf" target="_blank">Download Timetable</a></td>
            </tr>
            <tr>
              <td>Mid-Term Exams</td>
              <td>Classes I-XII</td>
              <td><a href="timetables/mid-term-exam-2025.pdf" target="_blank">Download Timetable</a></td>
            </tr>
            <tr>
              <td>Second Periodic Test</td>
              <td>Classes I-VIII</td>
              <td><a href="timetables/second-periodic-test-2025.pdf" target="_blank">Download Timetable</a></td>
            </tr>
            <tr>
              <td>Annual Exams</td>
              <td>Classes I-IX, XI</td>
              <td><a href="timetables/annual-exam-2025.pdf" target="_blank">Download Timetable</a></td>
            </tr>
            <tr>
              <td>Board Exams</td>
              <td>Classes X, XII</td>
              <td><a href="timetables/board-exam-2025.pdf" target="_blank">Download Timetable</a></td>
            </tr>
          </tbody>
        </table>

        <p>
          For any queries regarding exam schedules or additional resources, please contact the school office at [Insert Contact Details].
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