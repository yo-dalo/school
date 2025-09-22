<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Downloads Admission Form - GSSS Senior Secondary School</title>


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
      <h1>ADMISSION FORM DOWNLOADS</h1>
    </div>

    <div class="container">
      <h1>Admission Form Downloads</h1>
      <div class="about-content">
        <p>
          Download the admission forms for <span class="highlight">GSSS Senior Secondary School</span> for the academic year [Insert Year, e.g., 2025-26]. Both online and offline forms are available for your convenience.
        </p>

        <table>
          <thead>
            <tr>
              <th>Form Type</th>
              <th>Download Link</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Online Admission Form</td>
              <td><a href="forms/admission-form-online.pdf" target="_blank">Download Online Form</a></td>
            </tr>
            <tr>
              <td>Offline Admission Form</td>
              <td><a href="forms/admission-form-offline.pdf" target="_blank">Download Offline Form</a></td>
            </tr>
          </tbody>
        </table>

        <p>
          <strong>Instructions:</strong>
        </p>
        <ul>
          <li>Download and print the offline form for manual submission at the school office.</li>
          <li>Fill the online form digitally and submit it through the school’s online portal, if available.</li>
          <li>Ensure all required documents are attached with the form during submission.</li>
          <li>Contact the admissions office at [Insert Contact Details] for assistance with form submission or queries.</li>
        </ul>
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