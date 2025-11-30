<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Exam Dates & Results - School Senior Secondary School</title>
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
      <h1>EXAM DATES & RESULTS</h1>
    </div>

    <div class="container">
      <h1>Exam Dates & Results</h1>
      <div class="about-content">
        <p>
          The Exam Dates & Results section at <span class="highlight">School Senior Secondary School</span> provides information on examination schedules and result announcements for the academic year [Insert Year, e.g., 2025-26].
        </p>

        <h3>Examination Schedule</h3>
        <table>
          <thead>
            <tr>
              <th>Exam</th>
              <th>Class</th>
              <th>Date</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>First Periodic Test</td>
              <td>Classes I-VIII</td>
              <td>[e.g., July 15-20, 2025]</td>
            </tr>
            <tr>
              <td>Mid-Term Exams</td>
              <td>Classes I-XII</td>
              <td>[e.g., September 10-20, 2025]</td>
            </tr>
            <tr>
              <td>Second Periodic Test</td>
              <td>Classes I-VIII</td>
              <td>[e.g., January 10-15, 2026]</td>
            </tr>
            <tr>
              <td>Annual Exams</td>
              <td>Classes I-IX, XI</td>
              <td>[e.g., March 1-15, 2026]</td>
            </tr>
            <tr>
              <td>Board Exams</td>
              <td>Classes X, XII</td>
              <td>[e.g., February-March 2026]</td>
            </tr>
          </tbody>
        </table>

        <h3>Results</h3>
        <p>
          Results will be announced on the following dates and can be accessed via the school portal or notice board:
        </p>
        <table>
          <thead>
            <tr>
              <th>Exam</th>
              <th>Class</th>
              <th>Result Date</th>
              <th>Link</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>First Periodic Test</td>
              <td>Classes I-VIII</td>
              <td>[e.g., July 30, 2025]</td>
              <td><a href="results/periodic-test1-2025.pdf" target="_blank">View Results</a></td>
            </tr>
            <tr>
              <td>Mid-Term Exams</td>
              <td>Classes I-XII</td>
              <td>[e.g., October 5, 2025]</td>
              <td><a href="results/mid-term-2025.pdf" target="_blank">View Results</a></td>
            </tr>
          </tbody>
        </table>

        <p>
          For any queries regarding exam schedules or results, please contact the school office at [Insert Contact Details].
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