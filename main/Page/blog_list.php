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
      margin-bottom: 30px;
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
    .filter-form {
      text-align: center;
      margin-bottom: 20px;
    }
    .filter-form input[type="text"],
    .filter-form input[type="date"] {
      padding: 8px;
      width: 200px;
      margin: 5px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    .filter-form button {
      padding: 8px 15px;
      margin: 5px;
      border: none;
      background: #00704A;
      color: #fff;
      border-radius: 4px;
      cursor: pointer;
    }
    .pagination {
      text-align: center;
      margin-top: 20px;
    }
    .pagination a {
      display: inline-block;
      margin: 0 5px;
      padding: 6px 12px;
      border: 1px solid #ccc;
      text-decoration: none;
      color: #00704A;
      border-radius: 4px;
    }
    .pagination a.active {
      background: #00704A;
      color: #fff;
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

$limit = 10; 
$page = isset($_GET['page_number']) ? (int)$_GET['page_number'] : 1; 
$startFrom = ($page - 1) * $limit;

// filters
$filter = isset($_GET['filter']) ? mysqli_real_escape_string($con, $_GET['filter']) : "";
$nameFilter = isset($_GET['nameFilter']) ? mysqli_real_escape_string($con, $_GET['nameFilter']) : "";
$dateFrom = isset($_GET['dateFrom']) ? mysqli_real_escape_string($con, $_GET['dateFrom']) : "";
$dateTo = isset($_GET['dateTo']) ? mysqli_real_escape_string($con, $_GET['dateTo']) : "";

// base query
$where = [];
if ($filter != "") {
    $where[] = "(Title LIKE '%$filter%')";
}
if ($nameFilter != "") {
    $where[] = "(Name LIKE '%$nameFilter%')";
}
if ($dateFrom != "" && $dateTo != "") {
    $where[] = "(Date BETWEEN '$dateFrom' AND '$dateTo')";
} elseif ($dateFrom != "") {
    $where[] = "(Date >= '$dateFrom')";
} elseif ($dateTo != "") {
    $where[] = "(Date <= '$dateTo')";
}

$whereSql = "";
if (count($where) > 0) {
    $whereSql = "WHERE " . implode(" AND ", $where);
}

// total records
$totalResult = mysqli_query($con, "SELECT COUNT(*) AS total FROM Blog $whereSql");
$totalRow = mysqli_fetch_assoc($totalResult);
$totalRecords = $totalRow['total'];
$totalPages = ceil($totalRecords / $limit);

// fetch data
$newses = getAll($con, "SELECT * FROM Blog $whereSql ORDER BY Id DESC LIMIT $startFrom, $limit");
?>

  <div class="container">
    <h1>Latest News & Announcements</h1>

    <!-- Filter Form -->
    <form class="filter-form" method="get" action="">
      <input type="text" name="filter" placeholder="Search by Title" value="<?php echo htmlspecialchars($filter); ?>">
      <input type="text" name="nameFilter" placeholder="Search by Name" value="<?php echo htmlspecialchars($nameFilter); ?>">
      <br>
      <label>From: </label>
      <input type="date" name="dateFrom" value="<?php echo htmlspecialchars($dateFrom); ?>">
      <label>To: </label>
      <input type="date" name="dateTo" value="<?php echo htmlspecialchars($dateTo); ?>">
      <br>
      <button type="submit">Apply Filter</button>
      <a href="news_list.php"><button type="button">Reset</button></a>
    </form>

    <!-- News List -->
    <?php if (!empty($newses)): ?>
      <?php foreach ($newses as $n): ?>
        <a href="blog_detail.php?id=<?php echo($n['Id'] ?? '0'); ?>">
          <div class="news-item">
            <div class="news-name"><?php echo htmlspecialchars($n['Name'] ?? 'No name'); ?></div>
            <div class="news-title"><?php echo htmlspecialchars($n['Title'] ?? 'No Title'); ?></div>
            <div class="news-date">Published on: <?php echo htmlspecialchars($n['Date'] ?? 'No Date'); ?></div>
          </div>
        </a>
      <?php endforeach; ?>
    <?php else: ?>
      <p>No news found.</p>
    <?php endif; ?>

    <!-- Pagination -->
    <div class="pagination">
      <?php for ($i = 1; $i <= $totalPages; $i++): ?>
        <a href="?page_number=<?php echo $i; ?>&filter=<?php echo urlencode($filter); ?>&nameFilter=<?php echo urlencode($nameFilter); ?>&dateFrom=<?php echo urlencode($dateFrom); ?>&dateTo=<?php echo urlencode($dateTo); ?>" 
           class="<?php echo ($i == $page) ? 'active' : ''; ?>">
          <?php echo $i; ?>
        </a>
      <?php endfor; ?>
    </div>

  </div>

  </div>

<?php require("./footer.php"); ?>
</div>
</body>
</html>
