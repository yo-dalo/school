  <?php
require './function.php';

 $aom = getSingle($con, "SELECT * FROM Pages WHERE "); 
 echo htmlspecialchars($aom['Name']) ;


?>