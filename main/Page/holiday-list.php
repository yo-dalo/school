<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Holiday List - School Senior Secondary School</title>
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
      <h1>HOLIDAY LIST</h1>
    </div>

    <div class="container">
      <h1>Holiday List [Insert Year, e.g., 2025-26]</h1>
      <div class="about-content">
        <p>
          The Holiday List at <span class="highlight">School Senior Secondary School</span> outlines the scheduled holidays for the academic year [Insert Year, e.g., 2025-26]. These include national, regional, and school-specific holidays.
        </p>

        <table>
          <thead>
            <tr>
              <th>Holiday</th>
              <th>Date</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Independence Day</td>
              <td>[e.g., August 15, 2025]</td>
            </tr>
            <tr>
              <td>Gandhi Jayanti</td>
              <td>[e.g., October 2, 2025]</td>
            </tr>
            <tr>
              <td>Diwali Break</td>
              <td>[e.g., October 20-25, 2025]</td>
            </tr>
            <tr>
              <td>Winter Break</td>
              <td>[e.g., December 25, 2025 - January 1, 2026]</td>
            </tr>
            <tr>
              <td>Holi</td>
              <td>[e.g., March 14, 2026]</td>
            </tr>
          </tbody>
        </table>

        <p>
          Note: The holiday list is subject to change. Please check with the school office at [Insert Contact Details] for the latest updates.
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