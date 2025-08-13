<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Latest News - M Hindu Senior Secondary School</title>
      <link rel="stylesheet" href="../css/utility/main-utility.css">   
      <link rel="stylesheet" href="../css/header/nav.css">
      <link rel="stylesheet" href="../css/header/navBar.css">  
      <link rel="stylesheet" href="../css/header/mainNav2.css">  
      <link rel="stylesheet" href="../css/footer/footer.css">

    <link rel="stylesheet" href="../css/utility/page-utility.css">


  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f5f5f5;
    }
    .container {
      max-width: 900px;
      margin: 40px auto;
      padding: 30px;
      background-color: #fff;
      border-radius: 0px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.08);
    }
  .container   h1 {
      text-align: center;
      color: #2c3e50;
      margin-bottom: 30px;
    }
  .container   .news-item {
      margin-bottom: 25px;
      padding-bottom: 20px;
      border-bottom: 1px solid #ddd;
    }
   .container  .news-name {
      font-size: 18px;
      font-weight: bold;
      color: #00704A;
    }
    .container .news-title {
      font-size: 16px;
      color: #333;
      margin-top: 5px;
    }
   .container  .news-date {
      font-size: 13px;
      color: #777;
      margin-top: 5px;
    }
  </style>
</head>
<body>
  
  
  <div class="main">
<div class="page_1">

<?php
require("../php/conn.php");
require("../php/function.php");
require("./header.php");

          $limit = 10; // Number of records per page
          $page = isset($_GET['page_number']) ? $_GET['page_number'] : 1; // Current page number
          $startFrom = ($page - 1) * $limit;


?>
  
  
  
  
  <div class="container">
    <h1>Latest News & Announcements</h1>
<?php $newses = getAll($con, "SELECT * FROM Blog ORDER BY Id DESC LIMIT $startFrom, $limit"); //print_r($facilities) ?>

<?php foreach ($newses as $newses): ?>
   <a href="blog_detail.php?id=<?php echo($newses['Id'] ?? '0'); ?>"><div class="news-item">
      <div class="news-name"><?php echo htmlspecialchars($newses['Name'] ?? 'No name'); ?></div>
      <div class="news-title"><?php echo htmlspecialchars($newses['Title'] ?? 'No Title'); ?></div>
      <div class="news-date">Published on: <?php echo htmlspecialchars($newses['Date'] ?? 'No Date'); ?></div>
    </div>
  </a>


<?php endforeach; ?>
  </div>
  
  
  
  </div>


<?php
require("./footer.php");
?>


<!----- footer  -->
</div>
  
  
  
</body>
</html>
