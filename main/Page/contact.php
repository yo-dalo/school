<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Contact Us</title>



    <link rel="stylesheet" href="../css/utility/main-utility.css">
  <link rel="stylesheet" href="../css/header/nav.css">
 <link rel="stylesheet" href="../css/header/navBar.css">
  <link rel="stylesheet" href="../css/header/mainNav2.css">
  <link rel="stylesheet" href="../css/footer/footer.css">

    <link rel="stylesheet" href="../css/utility/page-utility.css">

  <style>
    .container {
      max-width: 800px;
      margin: 20px auto;
      padding: 20px;
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h1 {
      text-align: center;
      color: #333;
    }
    .contact-form {
      margin-top: 20px;
    }
    .form-group {
      margin-bottom: 20px;
    }
    .form-group label {
      font-weight: bold;
    }
    .form-group input,
    .form-group textarea {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    .form-group textarea {
      height: 100px;
    }
    .form-group button {
      padding: 10px 20px;
      background-color: #007bff;
      color: #fff;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
    .form-group button:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>

  <div class="main">
    <div class="page_1">

      <!-- header -->
      <?php
      require("../php/conn.php"); 
      require("../php/function.php");
      require("./header.php");
      ?>
      <div class="top_box">
        <h1> CONTACT </h1>
      </div>




      <style>
        .container {
          max-width: 900px;
          margin: auto;
          line-height: 1.6;
          display: flex;
          flex-direction: column-reverse;


        }
        h2 {
          color: #00704A;
        }
        .sidebar {
          float: right;
          width: 250px;
          background: #f4f4f4;
          padding: 10px;
          border: 1px solid #ddd;
        }
        .sidebar ul {
          list-style: none;
          padding-left: 0;
        }
        .sidebar li {
          padding: 10px 0;
          border-bottom: 1px dotted #aaa;
        }
        .sidebar li::before {
          content: "▶";
          color: purple;
          margin-right: 5px;
        }
        .content {
          margin-right: 270px;
        }
        a {
          color: #007BFF;
          text-decoration: none;
        }
        a:hover {
          text-decoration: underline;
        }
        .label {
          font-weight: bold;
        }
      </style>
    </head>
    <body>

      <div class="container">
        <div class="sidebar">
          <ul>
            <li>Contact Address</li>
            <li>Contact Details of Administrators</li>
          </ul>
        </div>

        <div class="content">
          <h2>Contact Address</h2>
          <h3>School Public School</h3>
          <p>
            <span class="label">Address :</span> NH-52, Hisar to Rajgarh Road, Chaudharywas, Hisar (Haryana) 125001
          </p>
          <p>
            <span class="label">On Google Map :</span> <a href="https://maps.app.goo.gl/HKuyJmXKfRmD2wau8" target="_blank">https://maps.app.goo.gl/HKuyJmXKfRmD2wau8</a>
          </p>
          <p>
            <span class="label">Mobile :</span> <a href="tel:8813870220">8813870220</a>, <a href="tel:9817238620">9817238620</a>
          </p>
          <p>
            <span class="label">Email :</span> <a href="mailto:Schoolpublicschool@gmail.com">Schoolpublicschool@gmail.com</a>
          </p>
          <p>
            <span class="label">Website :</span> <a href="http://Schoolpublicschool.org" target="_blank">http://Schoolpublicschool.org</a>
          </p>
          <p>
            <span class="label">Facebook :</span> <a href="https://www.facebook.com/groups/793416251069802/" target="_blank">https://www.facebook.com/groups/793416251069802/</a>
          </p>
          <p>
            <span class="label">Instagram :</span> <a href="https://www.instagram.com/invites/contact/?i=1xy0s3cn0cms8&utm_content=4exhyjb" target="_blank">Instagram Invite</a>
          </p>
          <p>
            <span class="label">Youtube :</span> <a href="https://www.youtube.com/channel/UC1_FvwMxEj5ffxOy_ubum7Q" target="_blank">https://www.youtube.com/channel/UC1_FvwMxEj5ffxOy_ubum7Q</a>
          </p>
          <p>
            <span class="label">Twitter :</span> <a href="https://x.com/hpschaudharywas/" target="_blank">https://x.com/hpschaudharywas/</a>
          </p>
        </div>
      </div>







    </div>
    <?php
    require("./footer.php");
    ?>


  </div>
  <script src="main.js"></script><script src="./../main.js"></script>

<script src="./../js/mainNav2.js"></script>  </body>
</html>