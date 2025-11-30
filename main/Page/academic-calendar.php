<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Academic Calendar - School Senior Secondary School</title>
  
  
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
      <h1>ACADEMIC CALENDAR</h1>
    </div>

    <div class="container">
      <h1>Academic Calendar [Insert Year, e.g., 2025-26]</h1>
      <div class="about-content">
        <p>
          The academic calendar at <span class="highlight">School Senior Secondary School</span> outlines key dates for the academic year, including examinations, holidays, and school events. This calendar helps students, parents, and staff plan effectively for the year ahead.
        </p>

        <table>
          <thead>
            <tr>
              <th>Event</th>
              <th>Date</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Academic Session Begins</td>
              <td>[e.g., April 1, 2025]</td>
            </tr>
            <tr>
              <td>Summer Vacation</td>
              <td>[e.g., May 15 - June 30, 2025]</td>
            </tr>
            <tr>
              <td>First Periodic Test</td>
              <td>[e.g., July 2025]</td>
            </tr>
            <tr>
              <td>Mid-Term Examinations</td>
              <td>[e.g., September 2025]</td>
            </tr>
            <tr>
              <td>Diwali Break</td>
              <td>[e.g., October 20 - October 25, 2025]</td>
            </tr>
            <tr>
              <td>Annual Day</td>
              <td>[e.g., December 2025]</td>
            </tr>
            <tr>
              <td>Second Periodic Test</td>
              <td>[e.g., January 2026]</td>
            </tr>
            <tr>
              <td>Annual Examinations</td>
              <td>[e.g., March 2026]</td>
            </tr>
            <tr>
              <td>Session Ends</td>
              <td>[e.g., March 31, 2026]</td>
            </tr>
          </tbody>
        </table>

        <p>
          For a detailed academic calendar, including additional events and updates, please download the PDF below:
        </p>
        <p>
          <a href="calendar/academic-calendar-2025-26.pdf" target="_blank">Download Academic Calendar</a>
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