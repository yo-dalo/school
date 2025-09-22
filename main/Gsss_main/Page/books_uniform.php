<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Books & Uniform - M GSSS Senior Secondary School</title>
  <link rel="stylesheet" href="./style.css">
  <link rel="stylesheet" href="./css/model.css">
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f8f8f8;
    }
    .container {
      max-width: 1000px;
      margin: 40px auto;
      padding: 30px;
      background-color: #fff;
      border-radius: 12px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.08);
    }
   .container h1 {
      text-align: center;
      color: #2c3e50;
      margin-bottom: 30px;
    }
  .container  h2 {
      color: #00704A;
      margin-top: 30px;
    }
  .container  ul {
      padding-left: 20px;
    }
  .container  li {
      margin-bottom: 10px;
    }
   .container table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }
  .container  th, td {
      padding: 12px;
      border: 1px solid #ccc;
    }
   .container th {
      background-color: #00704A;
      color: #fff;
    }
 .container   a.download-btn {
      display: inline-block;
      background-color: #007BFF;
      color: #fff;
      padding: 6px 12px;
      border-radius: 5px;
      text-decoration: none;
    }
    .container   a.download-btn:hover {
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
require("../php/function.php");
require("./header.php");
          ?>
    <div class="top_box">
    <h1> ABOUT </h1>
  </div>

  
<div class="container">
  <h1>Books & Uniform Guidelines</h1>

  <h2>Booklist (Academic Session 2025–26)</h2>
  <p>You may download class-wise booklists here:</p>
  <table>
    <thead>
      <tr>
        <th>Class</th>
        <th>Booklist PDF</th>
      </tr>
    </thead>
    <tbody>
      <tr><td>Class I</td><td><a class="download-btn" href="./booklist/Class-1-Booklist.pdf" download>Download</a></td></tr>
      <tr><td>Class II</td><td><a class="download-btn" href="./booklist/Class-2-Booklist.pdf" download>Download</a></td></tr>
      <tr><td>Class III</td><td><a class="download-btn" href="./booklist/Class-3-Booklist.pdf" download>Download</a></td></tr>
      <tr><td>Class IV</td><td><a class="download-btn" href="./booklist/Class-4-Booklist.pdf" download>Download</a></td></tr>
      <tr><td>Class V</td><td><a class="download-btn" href="./booklist/Class-5-Booklist.pdf" download>Download</a></td></tr>
      <tr><td>Class VI</td><td><a class="download-btn" href="./booklist/Class-6-Booklist.pdf" download>Download</a></td></tr>
      <tr><td>Class VII</td><td><a class="download-btn" href="./booklist/Class-7-Booklist.pdf" download>Download</a></td></tr>
      <tr><td>Class VIII</td><td><a class="download-btn" href="./booklist/Class-8-Booklist.pdf" download>Download</a></td></tr>
      <tr><td>Class IX</td><td><a class="download-btn" href="./booklist/Class-9-Booklist.pdf" download>Download</a></td></tr>
      <tr><td>Class X</td><td><a class="download-btn" href="./booklist/Class-10-Booklist.pdf" download>Download</a></td></tr>
      <tr><td>Class XI</td><td><a class="download-btn" href="./booklist/Class-11-Booklist.pdf" download>Download</a></td></tr>
      <tr><td>Class XII</td><td><a class="download-btn" href="./booklist/Class-12-Booklist.pdf" download>Download</a></td></tr>
    </tbody>
  </table>

  <h2>Uniform Guidelines</h2>
  <p>The school uniform is mandatory and must be worn on all working days, special assemblies, and school outings. The attire reflects discipline, unity, and pride.</p>
  <ul>
    <li><strong>For Boys (Classes I–XII):</strong> White shirt with school logo, navy blue pants, school tie & belt, black leather shoes, navy blue socks, and blazer (in winters)</li>
    <li><strong>For Girls (Classes I–VIII):</strong> White shirt with school logo, navy blue skirt, tie, belt, black shoes, and blazer (in winters)</li>
    <li><strong>For Girls (Classes IX–XII):</strong> White shirt with school logo, navy blue salwar & dupatta or pants, black shoes, blazer (in winters)</li>
    <li><strong>PT Uniform (All Classes):</strong> House-colored T-shirt, white trousers/skirt, white canvas shoes</li>
    <li><strong>Winter Accessories:</strong> Navy blue blazer/sweater and muffler (no casual jackets permitted)</li>
  </ul>

  <p>Uniforms and books can be purchased from the authorized vendors listed in the school notice board. Ensure correct fitting and labeling of student's name inside each item.</p>
</div>

  </div>
    <?php   
    require("./footer.php");
    ?>
  </div>


<script src="./../js/mainNav2.js"></script>  </body>
</html>
