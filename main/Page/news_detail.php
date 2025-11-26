<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>News Detail - M School Senior Secondary School</title>
    <link rel="stylesheet" href="../css/utility/main-utility.css">   <link rel="stylesheet" href="../css/header/nav.css">  <link rel="stylesheet" href="../css/header/navBar.css">   <link rel="stylesheet" href="../css/header/mainNav2.css">   <link rel="stylesheet" href="../css/footer/footer.css">

    <link rel="stylesheet" href="../css/utility/page-utility.css">


  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f4f4f4;
    }
    .container {
      max-width: 800px;
      margin: 40px auto;
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
               
    <?php $news = getSingle($con, "SELECT * FROM Notification WHERE Id = '$id'"); //print_r($news) ?>
    <div class="news-name"><?php echo htmlspecialchars($news['Name'] ?? 'No name'); ?> </div>
    <div class="news-date">Published on: <?php echo htmlspecialchars($news['Date'] ?? 'No name'); ?></div>
    <div class="news-title"><?php echo htmlspecialchars($news['Title'] ?? 'No title'); ?></div>
    <div class="news-title"><?php echo htmlspecialchars($news['Created_At'] ?? 'No title'); ?></div>

    <div class="news-body">
      <?php echo ($news['Description'] ?? 'No post info'); ?>
    </div>
  </div>
  
      </div>
   
    <?php   
    require("./footer.php");
    ?>
    
    
  </div>
  
  
</body>
</html>
