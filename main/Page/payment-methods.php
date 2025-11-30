<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Payment Methods - School Senior Secondary School</title>
      <link rel="stylesheet" href="../css/utility/main-utility.css">   
      <link rel="stylesheet" href="../css/header/nav.css">
      <link rel="stylesheet" href="../css/header/navBar.css">  
      <link rel="stylesheet" href="../css/header/mainNav2.css">  
      <link rel="stylesheet" href="../css/footer/footer.css">

    <link rel="stylesheet" href="../css/utility/page-utility.css">



</head>
<body>
<div class="main">
  <div class="page_1">
    <!-- Header Include -->
    <?php
      require("../php/conn.php");
      require("../php/function.php");
      require("./header.php");
    ?>

    <div class="top_box">
      <h1>PAYMENT METHODS</h1>
    </div>

    <div class="container">
      <h1>Payment Methods</h1>
      <div class="about-content">
        <p>
          At <span class="highlight">School Senior Secondary School</span>, we offer multiple payment methods to ensure convenience for parents and guardians when paying school fees for the academic year [Insert Year, e.g., 2025-26]. Below are the available options:
        </p>

        <ul>
          <li><strong>Online Payment:</strong> Pay fees through our secure online portal using credit/debit cards, net banking, or UPI. Access the portal at [Insert Portal Link].</li>
          <li><strong>Bank Transfer:</strong> Direct bank transfers to the school’s account. Bank details are available in the <a href="fee-structure-downloads.html">Fee Structure Downloads</a> PDF.</li>
          <li><strong>Cash/Cheque:</strong> Payments can be made at the school office during working hours. Cheques should be drawn in favor of [Insert Payee Name, e.g., School Senior Secondary School].</li>
          <li><strong>Installment Plans:</strong> Option to pay fees in installments (subject to school policy). Contact the school office for details.</li>
        </ul>

        <p>
          <strong>Note:</strong> Ensure timely payment to avoid late fees. Refer to the <a href="late-fee-rules.html">Late Fee Rules</a> page for guidelines. For assistance with payments, contact the school office at [Insert Contact Details].
        </p>
      </div>
    </div>

    <!-- Footer Include -->
    <?php
      require("./footer.php");
    ?>
  </div>
</div>

<script src="main.js"></script><script src="./../main.js"></script>
<script src="./../js/mainNav2.js"></script>  </body>
</html>