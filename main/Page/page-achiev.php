<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>News Detail - M School Senior Secondary School</title>
    <link rel="stylesheet" href="../css/utility/main-utility.css">
    <link rel="stylesheet" href="../css/header/nav.css">
    <link rel="stylesheet" href="../css/header/navBar.css">
    <link rel="stylesheet" href="../css/header/mainNav2.css"> 
    <link rel="stylesheet" href="../css/footer/footer.css">
    <link rel="stylesheet" href="../css/utility/page-utility.css">


  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f4f4f4;
    }
    .container {
      max-width: 100vw;
      margin: 40px 2vw;
      padding: 20px 20px;
      background-color: #fff;
      border-radius: 0px;
      box-shadow: 0 0 20px rgba(0,0,0,0.1);
    }
    .container .news-name {
      font-size: 24px;
      font-weight: bold;
      color: #00704A;
    }
    .container .news-date {
      font-size: 14px;
      color: #777;
      margin-bottom: 20px;
    }
    .container .news-title {
      font-size: 18px;
      color: #2c3e50;
      margin-bottom: 15px;
    }
     .container .news-body {
      font-size: 16px;
      color: #333;
      text-align: justify;
      line-height: 1.8;
    }
  </style>
</head>
<body>
       <!-- Button trigger modal -->
<div class="main">
    <div class="page_1">
      <!-- model -->
      <!-- Button trigger modal -->
      <?php
require("../php/conn.php");
require("../php/function.php");
require("./header.php");
          ?>


    <div class="top_box">
    <h1>NEWS</h1>
  </div>

  
  
  <div class="container">
    <?php 
               
               $id=$_GET['id'];
               ?>

    <?php $page = getSingle($con, "SELECT * FROM Achievements WHERE Id = {$id}"); //print_r($news) ?>
      <div class="news-name"><?php echo htmlspecialchars($page['Name'] ?? 'No name'); ?> </div>
    <div class="news-date">Published on: <?php echo htmlspecialchars($page['Date'] ?? 'No name'); ?></div>
    <div class="news-title"><?php echo htmlspecialchars($page['Title'] ?? 'No title'); ?></div>
    <div class="news-title"><?php echo htmlspecialchars($page['Created_At'] ?? 'No title'); ?></div>

    <div class="news-image"><img src="http://100.99.139.175:8080/x/uploads/<?php echo htmlspecialchars($page['Image']); ?>" alt="" /></div>



    <div class="news-body">
      <?php echo ($page['Description'] ?? 'No post info'); ?>
    </div>
  </div>
  
  
      </div>
   
    <?php   
    require("./footer.php");
    ?>
    
    
  </div>
  
  
</body>
</html>
