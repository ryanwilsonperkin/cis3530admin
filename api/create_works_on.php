<?php
include 'functions.php';
header('Content-type: application/json');
mysql_connect() or die('Could not connect: ' . mysql_error());
mysql_select_db('Company');

$essn = $_POST["Essn"];
$pno = $_POST["Pno"];
$hours = $_POST["Hours"];
$userid = $INTERFACE_USER_ID;

$value = sprintf(
  "('%s','%s','%s','%s')",
  $essn,
  $pno,
  $hours,
  $userid
);

$result = insert_into("WorksOn", $value);
echo $result;

mysql_free_result($result);
mysql_close($link);
?>
