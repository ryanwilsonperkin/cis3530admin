<?php
include 'functions.php';
header('Content-type: application/json');
mysql_connect() or die('Could not connect: ' . mysql_error());
mysql_select_db('Company');

$essn = $_POST["essn"];
$dependent_name = $_POST["dependent_name"];
$sex = $_POST["sex"];
$bdate = $_POST["bdate"];
$relationship = $_POST["relationship"];
$userid = $INTERFACE_USER_ID;

$value = sprintf(
  "('%s','%s','%s','%s','%s','%s')",
  $essn,
  $dependent_name,
  $sex,
  $bdate,
  $relationship,
  $userid
);

$result = insert_into("Dependent", $value);
echo $result;

mysql_free_result($result);
mysql_close($link);
?>
