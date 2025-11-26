<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Latest News - M School Senior Secondary School</title>
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
    .container h1 {
      text-align: center;
      color: #2c3e50;
      margin-bottom: 20px;
    }
    .news-item {
      margin-bottom: 25px;
      padding-bottom: 20px;
      border-bottom: 1px solid #ddd;
    }
    .news-name {
      font-size: 18px;
      font-weight: bold;
      color: #00704A;
    }
    .news-title {
      font-size: 16px;
      color: #333;
      margin-top: 5px;
    }
    .news-date {
      font-size: 13px;
      color: #777;
      margin-top: 5px;
    }

    /* Filter form */
    .filter-form {
      display: flex;
      flex-wrap: wrap;
      gap: 12px;
      margin-bottom: 20px;
      justify-content: center;
    }
    .filter-form input, .filter-form button {
      padding: 8px 12px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    .filter-form button {
      background: #007bff;
      color: #fff;
      cursor: pointer;
      border: none;
    }

    /* Pagination */
    .pagination {display: flex; gap: 8px; justify-content:center; margin-top:20px;}
    .pagination a {
      padding: 6px 12px;
      border: 1px solid #ccc;
      border-radius: 4px;
      text-decoration: none;
      color: #333;
    }
    .pagination a.active {
      background-color: #007bff;
      color: white;
      border-color: #007bff;
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

// Pagination settings
$limit = 10;
$page = isset($_GET['page_number']) ? (int)$_GET['page_number'] : 1;
if($page < 1) $page = 1;
$startFrom = ($page - 1) * $limit;

// Filter inputs
$search = isset($_GET['search']) ? mysqli_real_escape_string($con, $_GET['search']) : '';
$date   = isset($_GET['date']) ? mysqli_real_escape_string($con, $_GET['date']) : '';

// Base query
$where = "WHERE 1=1";
if($search !== '') {
  $where .= " AND (Name LIKE '%$search%' OR Title LIKE '%$search%')";
}
if($date !== '') {
  $where .= " AND Date = '$date'";
}

// Fetch filtered records
$query = "SELECT * FROM Notification $where ORDER BY Id DESC LIMIT $startFrom, $limit";
$newses = getAll($con, $query);

// Count total records for pagination
$result = mysqli_query($con, "SELECT COUNT(*) AS total FROM Notification $where");
$row = mysqli_fetch_assoc($result);
$totalRecords = $row['total'];
$totalPages = ceil($totalRecords / $limit);
?>
  
  <div class="container">
    <h1>Latest News & Announcements</h1>

    <!-- Filter Form -->
    <form method="GET" class="filter-form">
      <input type="text" name="search" placeholder="Search by keyword..." value="<?php echo htmlspecialchars($search); ?>">
      <input type="date" name="date" value="<?php echo htmlspecialchars($date); ?>">
      <button type="submit">Filter</button>
    </form>

    <?php if(!empty($newses)): ?>
      <?php foreach ($newses as $news): ?>
        <a href="news_detail.php?id=<?php echo($news['Id'] ?? '0'); ?>">
          <div class="news-item">
            <div class="news-name"><?php echo htmlspecialchars($news['Name'] ?? 'No name'); ?></div>
            <div class="news-title"><?php echo htmlspecialchars($news['Title'] ?? 'No Title'); ?></div>
            <div class="news-date">Published on: <?php echo htmlspecialchars($news['Date'] ?? 'No Date'); ?></div>
          </div>
        </a>
      <?php endforeach; ?>
    <?php else: ?>
      <p>No news found for the selected filter.</p>
    <?php endif; ?>

    <!-- Pagination -->
    <div class="pagination">
      <?php if($page > 1): ?>
        <a href="?page_number=<?php echo $page-1; ?>&search=<?php echo urlencode($search); ?>&date=<?php echo urlencode($date); ?>">Prev</a>
      <?php endif; ?>

      <?php for ($i = 1; $i <= $totalPages; $i++): ?>
        <a href="?page_number=<?php echo $i; ?>&search=<?php echo urlencode($search); ?>&date=<?php echo urlencode($date); ?>" 
           class="<?php echo ($i == $page) ? 'active' : ''; ?>">
          <?php echo $i; ?>
        </a>
      <?php endfor; ?>

      <?php if($page < $totalPages): ?>
        <a href="?page_number=<?php echo $page+1; ?>&search=<?php echo urlencode($search); ?>&date=<?php echo urlencode($date); ?>">Next</a>
      <?php endif; ?>
    </div>

  </div>
  
  </div>
<?php require("./footer.php"); ?>
</div>

</body>
</html>
