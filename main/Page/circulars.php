<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Circulars - School Senior Secondary School</title>

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
      <h1>CIRCULARS</h1>
    </div>

    <div class="container">
      <h1>Circulars</h1>
      <div class="about-content">
        <p>
          The Circulars section at <span class="highlight">School Senior Secondary School</span> provides official communications from the school administration regarding policies, events, and other important updates. Below are the latest circulars for the academic year [Insert Year, e.g., 2025-26].
        </p>

        <table>
          <thead>
            <tr>
              <th>Date</th>
              <th>Circular Title</th>
              <th>Download</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>[e.g., August 5, 2025]</td>
              <td>Revised Fee Payment Schedule</td>
              <td><a href="circulars/fee-schedule-2025.pdf" target="_blank">Download</a></td>
            </tr>
            <tr>
              <td>[e.g., August 12, 2025]</td>
              <td>Guidelines for Annual Function Participation</td>
              <td><a href="circulars/annual-function-2025.pdf" target="_blank">Download</a></td>
            </tr>
            <tr>
              <td>[e.g., August 20, 2025]</td>
              <td>Updated Uniform Policy</td>
              <td><a href="circulars/uniform-policy-2025.pdf" target="_blank">Download</a></td>
            </tr>
          </tbody>
        </table>

        <p>
          For additional circulars or archived documents, please contact the school office at [Insert Contact Details].
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