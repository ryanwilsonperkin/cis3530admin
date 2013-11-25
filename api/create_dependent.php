<?php
include 'functions.php';
header('Content-type: application/json');
mysql_connect() or die('Could not connect: ' . mysql_error());
mysql_select_db('Company');

$essn = $_POST["Essn"];
$dependent_name = $_POST["Dependent_name"];
$sex = $_POST["Sex"];
$bdate = $_POST["Bdate"];
$relationship = $_POST["Relationship"];
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
