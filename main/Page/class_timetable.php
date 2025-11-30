<!DOCTYPE html>
<html lang="en">
>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Class Timetables - M School Senior Secondary School</title>
  <link rel="stylesheet" href="style.css">
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f5f5f5;
    }
    .container {
      max-width: 1000px;
      margin: 40px auto;
      padding: 30px;
      background-color: #fff;
      border-radius: 12px;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.08);
    }
   .container > h1 {
      text-align: center;
      color: #2c3e50;
      margin-bottom: 30px;
    }
  .container  table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 20px;
    }
  .container th, td {
      padding: 10px;
      border: 1px solid #ccc;
      text-align: center;
    }
  .container  th {
      background-color: #00704A;
      color: #fff;
    }
  .container  a.download-btn {
      background-color: #007BFF;
      color: #fff;
      padding: 6px 12px;
      border-radius: 5px;
      text-decoration: none;
    }
  .container  a.download-btn:hover {
      background-color: #0056b3;
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
  <h1>Class Timetables (2025–26)</h1>
  <p style="text-align:center; margin-bottom: 25px;">Click below to download the latest PDF schedules for each class.</p>
  <table>
    <thead>
      <tr>
        <th>Class</th>
        <th>Timetable</th>
      </tr>
    </thead>
    <tbody>
      <tr><td>Class I</td><td><a class="download-btn" href="./timetables/Class-1-Timetable.pdf" download>Download</a></td></tr>
      <tr><td>Class II</td><td><a class="download-btn" href="./timetables/Class-2-Timetable.pdf" download>Download</a></td></tr>
      <tr><td>Class III</td><td><a class="download-btn" href="./timetables/Class-3-Timetable.pdf" download>Download</a></td></tr>
      <tr><td>Class IV</td><td><a class="download-btn" href="./timetables/Class-4-Timetable.pdf" download>Download</a></td></tr>
      <tr><td>Class V</td><td><a class="download-btn" href="./timetables/Class-5-Timetable.pdf" download>Download</a></td></tr>
      <tr><td>Class VI</td><td><a class="download-btn" href="./timetables/Class-6-Timetable.pdf" download>Download</a></td></tr>
      <tr><td>Class VII</td><td><a class="download-btn" href="./timetables/Class-7-Timetable.pdf" download>Download</a></td></tr>
      <tr><td>Class VIII</td><td><a class="download-btn" href="./timetables/Class-8-Timetable.pdf" download>Download</a></td></tr>
      <tr><td>Class IX</td><td><a class="download-btn" href="./timetables/Class-9-Timetable.pdf" download>Download</a></td></tr>
      <tr><td>Class X</td><td><a class="download-btn" href="./timetables/Class-10-Timetable.pdf" download>Download</a></td></tr>
      <tr><td>Class XI (Science)</td><td><a class="download-btn" href="./timetables/Class-11-Science-Timetable.pdf" download>Download</a></td></tr>
      <tr><td>Class XI (Commerce)</td><td><a class="download-btn" href="./timetables/Class-11-Commerce-Timetable.pdf" download>Download</a></td></tr>
      <tr><td>Class XII (Science)</td><td><a class="download-btn" href="./timetables/Class-12-Science-Timetable.pdf" download>Download</a></td></tr>
      <tr><td>Class XII (Commerce)</td><td><a class="download-btn" href="./timetables/Class-12-Commerce-Timetable.pdf" download>Download</a></td></tr>
    </tbody>
  </table>
</div>
  </div>
    <?php   
    require("./footer.php");
    ?>
  </div>
<script src="./../js/mainNav2.js"></script>  </body>
</html>
