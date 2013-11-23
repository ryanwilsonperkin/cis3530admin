<?php
include 'functions.php';
header('Content-type: application/json');
mysql_connect() or die('Could not connect: ' . mysql_error());
mysql_select_db('Company');

$fname = $_POST["fname"];
$minit = $_POST["minit"];
$lname = $_POST["lname"];
$ssn = $_POST["ssn"];
$address = $_POST["address"];
$sex = $_POST["sex"];
$salary = $_POST["salary"];
$super_ssn = $_POST["super_ssn"];
$dno = $_POST["dno"];
$bdate = $_POST["bdate"];
$empdate = $_POST["empdate"];
$userid = $INTERFACE_USER_ID;

$value = sprintf(
  "('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')",
  $fname,
  $minit,
  $lname,
  $ssn,
  $address,
  $sex,
  $salary,
  $super_ssn,
  $dno,
  $bdate,
  $empdate,
  $userid
);

$result = insert_into("Employee", $value);
echo $result;

mysql_free_result($result);
mysql_close($link);
?>
