
<footer class="main-footer">
  <div class="footer-container">
    <!-- Quick Contact -->
    <div class="footer-column">
      <h4>Quick Contact</h4>
      <p>NH-52, Hisar to Rajgarh Road,<br>Chaudharywas, Hisar (Haryana)</p>
      <p>📞 +91-88138-70220, 21<br>📧 .....publicschool@gmail.com</p>
      <p><span class="highlight">School Timing</span><br>Mon - Sat: 8:00AM - 3:00PM</p>
    </div>

    <!-- Quick Links -->
    <div class="footer-column">
      <h4>Quick Links</h4>
      <ul>
        <?php $qLinks = getAll($con, "SELECT * FROM Quick_Link "); //print_r($facilities) ?>
       <?php foreach ($qLinks as $qLink): ?>
        <li><a href="<?php echo htmlspecialchars($qLink['Url'] ?? 'No name'); ?>"><?php echo htmlspecialchars($qLink['Name'] ?? 'No name'); ?></a></li>
        <?php endforeach; ?>
      </ul>
    </div>

    <!-- Useful Links -->
    <div class="footer-column">
      <h4>Useful Links</h4>
      <ul>
        <?php $uLinks = getAll($con, "SELECT * FROM Useful_Link "); //print_r($facilities) ?>
           <?php foreach ($uLinks as $uLink): ?>
        <li><a href="<?php echo htmlspecialchars($uLink['Url'] ?? 'No name'); ?>"><?php echo htmlspecialchars($uLink['Name'] ?? 'No name'); ?></a></li>
        <?php endforeach; ?>
      </ul>
    </div>

    <!-- Location Map -->
    <div class="footer-column">
      <h4>Location Map</h4>
      <iframe
        src="https://www.google.com/maps?q=School%20public%20school%20hisar&output=embed"
        width="100%" height="200" style="border:0; border-radius: 8px;" allowfullscreen=""
        loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>
  </div>

  <!-- Bottom Footer Bar -->
  <div class="footer-bottom">
    <div class="footer-bottom-text">
      <span>© 2021 © School Public School, Chaudharywas, Hisar | All Rights Reserved</span>
      <span class="dev-credit">Website Designed & Developed by <span class="dev-name">Adarsh Khichi</span></span>
    </div>
  </div>
</footer>
