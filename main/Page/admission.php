<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>About Government Girls School</title>

  <!-- Custom Styles -->
  <link rel="stylesheet" href="../css/utility/main-utility.css"> 
  <link rel="stylesheet" href="../css/header/nav.css">
  <link rel="stylesheet" href="../css/header/navBar.css">
  <link rel="stylesheet" href="../css/header/mainNav2.css">
  <link rel="stylesheet" href="../css/footer/footer.css">
  <link rel="stylesheet" href="../css/utility/page-utility.css">
  <link rel="stylesheet" href="../css/admission/admission.css">
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
    <h1> ABOUT </h1>
  </div>

  <div class="sidebar">
    <ul>
      <a href="./admission-procedure.php"><li>Admission Process</li></a>
      <a href="./fee.php"><li>Fee Structure</li></a>
    </ul>
  </div>

  <div class="form-container">
    <h2>Online Registration Form</h2>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $student_name = mysqli_real_escape_string($conn, $_POST['student_name']);
        $dob = mysqli_real_escape_string($conn, $_POST['dob']);
        $father_name = mysqli_real_escape_string($conn, $_POST['father_name']);
        $mother_name = mysqli_real_escape_string($conn, $_POST['mother_name']);
        $email = mysqli_real_escape_string($conn, $_POST['email']);
        $contact = mysqli_real_escape_string($conn, $_POST['contact']);
        $address = mysqli_real_escape_string($conn, $_POST['address']);
        $city = mysqli_real_escape_string($conn, $_POST['city']);
        $class = mysqli_real_escape_string($conn, $_POST['class']);
        $gender = mysqli_real_escape_string($conn, $_POST['gender']);

        $sql = "INSERT INTO admissions (student_name, dob, father_name, mother_name, email, contact, address, city, class, gender) 
                VALUES ('$student_name','$dob','$father_name','$mother_name','$email','$contact','$address','$city','$class','$gender')";

        if (mysqli_query($conn, $sql)) {
            echo "<p style='color:green;'>Admission form submitted successfully!</p>";
        } else {
            echo "<p style='color:red;'>Error: " . mysqli_error($conn) . "</p>";
        }
    }
    ?>

    <form id="addmission_form_id" method="POST" action="">
      <div class="form-row">
        <div>
          <label>Student Name <span style="color:red">*</span></label>
          <input name="student_name" type="text" required>
        </div>
        <div>
          <label>Date of Birth <span style="color:red">*</span></label>
          <input type="date" name="dob" required>
        </div>
      </div>

      <div class="form-row">
        <div>
          <label>Father's Name <span style="color:red">*</span></label>
          <input type="text" name="father_name" required>
        </div>
        <div>
          <label>Mother's Name <span style="color:red">*</span></label>
          <input type="text" name="mother_name" required>
        </div>
      </div>

      <div class="form-row">
        <div>
          <label>Email ID <span style="color:red">*</span></label>
          <input type="email" name="email" required>
        </div>
        <div>
          <label>Contact No. <span style="color:red">*</span></label>
          <input type="tel" name="contact" required>
        </div>
      </div>

      <div class="form-row">
        <div>
          <label>City</label>
          <input name="address" type="text">
        </div>
        <div>
          <label>State</label>
          <input name="city" type="text">
        </div>
      </div>

      <div>
        <label>Select Class for Registration <span style="color:red">*</span></label>
        <select name="class" required>
          <option value="">--Select Class--</option>
          <option>Class I</option>
          <option>Class II</option>
          <option>Class III</option>
          <option>Class IV</option>
          <option>Class V</option>
          <option>Class VI</option>
        </select>
      </div>

      <div>
        <label>Select Gender for Registration <span style="color:red">*</span></label>
        <select name="gender" required>
          <option value="">--Select Gender--</option>
          <option value="male">Male</option>
          <option value="female">Female</option>
        </select>
      </div>

      <div style="margin-top: 20px;">
        <!-- Placeholder for reCAPTCHA -->
        <div style="height: 78px; background-color: #eee; text-align: center; line-height: 78px; border-radius: 4px;">
          I'm not a robot (reCAPTCHA placeholder)
        </div>
      </div>

      <div class="actions">
        <button type="submit">Submit</button>
        <button type="reset">Reset</button>
      </div>
    </form>
  </div>

  </div>
  <?php require("./footer.php"); ?>
</div>

<script type="text/javascript" src="cdn_modules/jquery@3.7.1/jquery.min.js"></script>
<script src="./post.js"></script>
<script src="main.js"></script>
</body>
</html>
