<?php
include 'functions.php';
header('Content-type: application/json');
mysql_connect() or die('Could not connect: ' . mysql_error());
mysql_select_db('Company');

$fname = $_POST["Fname"];
$minit = $_POST["Minit"];
$lname = $_POST["Lname"];
$ssn = $_POST["SSN"];
$address = $_POST["Address"];
$sex = $_POST["Sex"];
$salary = $_POST["Salary"];
$super_ssn = $_POST["Super_ssn"];
$dno = $_POST["Dno"];
$bdate = $_POST["BDate"];
$empdate = $_POST["EmpDate"];
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
