<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>School Notices - School Senior Secondary School</title>
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
      <h1>SCHOOL NOTICES</h1>
    </div>

    <div class="container">
      <h1>School Notices</h1>
      <div class="about-content">
        <p>
          The School Notices section at <span class="highlight">School Senior Secondary School</span> keeps our community informed about important announcements, events, and updates. Below is a list of recent notices for the academic year [Insert Year, e.g., 2025-26].
        </p>

        <table>
          <thead>
            <tr>
              <th>Date</th>
              <th>Notice</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>[e.g., August 10, 2025]</td>
              <td>Parent-Teacher Meeting for Classes I-V scheduled for [Insert Date].</td>
            </tr>
            <tr>
              <td>[e.g., August 15, 2025]</td>
              <td>Independence Day Celebration: All students to report by 7:30 AM.</td>
            </tr>
            <tr>
              <td>[e.g., August 20, 2025]</td>
              <td>Submission of Science Project for Classes VI-VIII by [Insert Date].</td>
            </tr>
            <tr>
              <td>[e.g., September 1, 2025]</td>
              <td>School will remain closed for Teachers' Day preparations.</td>
            </tr>
          </tbody>
        </table>

        <p>
          For additional details or archived notices, please contact the school office at [Insert Contact Details].
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