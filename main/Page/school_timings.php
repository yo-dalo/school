<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>School Timings - M School Senior Secondary School</title>
  <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="./css/model.css">
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f4f4f4;
    }
    .container {
      max-width: 800px;
      margin: 40px auto;
      padding: 30px;
      background-color: #fff;
      border-radius: 10px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
      line-height: 1.7;
    }
  .container  h1 {
      text-align: center;
      color: #2c3e50;
      margin-bottom: 25px;
    }
  .container  table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 30px;
    }
    .container th, td {
      padding: 12px;
      border: 1px solid #ccc;
      text-align: left;
    }
   .container  th {
      background-color: #00704A;
      color: #fff;
    }
    .container p {
      text-align: justify;
      color: #333;
    }
  </style>
</head>
<body>
  
      <div class="main">
      <div class="page_1">
        
  <!-- header -->
  <?php
  require("../php/conn.php"); require("../php/function.php");
  require("./header.php");
  ?>
    <div class="top_box">
    <h1> ABOUT </h1>
  </div>

  
  

<div class="container">
  <h1>School Timings</h1>

  <p>
    M School Senior Secondary School functions with a structured schedule designed to balance academic rigor, physical activity, and creative engagement. Below is the breakdown of school and office hours for students, parents, and visitors.
  </p>

  <h2>Class Timings</h2>
  <table>
    <tr>
      <th>Class Group</th>
      <th>Days</th>
      <th>Timings</th>
    </tr>
    <tr>
      <td>Pre-Nursery to UKG</td>
      <td>Monday to Friday</td>
      <td>08:30 AM – 12:30 PM</td>
    </tr>
    <tr>
      <td>Class I to V</td>
      <td>Monday to Saturday</td>
      <td>08:30 AM – 01:30 PM</td>
    </tr>
    <tr>
      <td>Class VI to X</td>
      <td>Monday to Saturday</td>
      <td>08:00 AM – 02:00 PM</td>
    </tr>
    <tr>
      <td>Class XI & XII</td>
      <td>Monday to Saturday</td>
      <td>07:45 AM – 02:15 PM</td>
    </tr>
  </table>

  <h2>Office Hours</h2>
  <table>
    <tr>
      <th>Section</th>
      <th>Days</th>
      <th>Timings</th>
    </tr>
    <tr>
      <td>Admin Office</td>
      <td>Monday to Saturday</td>
      <td>09:00 AM – 03:30 PM</td>
    </tr>
    <tr>
      <td>Principal's Availability</td>
      <td>Monday to Friday</td>
      <td>11:30 AM – 01:30 PM</td>
    </tr>
    <tr>
      <td>Fee Counter</td>
      <td>Monday to Saturday</td>
      <td>09:00 AM – 02:00 PM</td>
    </tr>
  </table>

  <p>
    For parent-teacher meetings, circulars are shared in advance. We encourage all visitors to take prior appointments when visiting the school administration to ensure smooth coordination.
  </p>
</div>

  </div>
    <?php   
    require("./footer.php");
    ?>
  </div>
<script src="./../js/mainNav2.js"></script>  </body>
</html>
