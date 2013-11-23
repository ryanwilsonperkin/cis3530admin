<?php
include 'functions.php';
header('Content-type: application/json');
mysql_connect() or die('Could not connect: ' . mysql_error());
mysql_select_db('Company');

$original_ssn = $_POST["original_ssn"];
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

$fields = sprintf(
  "%s='%s',%s='%s',%s='%s',%s='%s',%s='%s',%s='%s',
  %s='%s',%s='%s',%s='%s',%s='%s',%s='%s',%s='%s'",
  'Fname',$fname,
  'Minit',$minit,
  'Lname',$lname,
  'SSN',$ssn,
  'Address',$address,
  'Sex',$sex,
  'Salary',$salary,
  'Super_ssn',$super_ssn,
  'Dno',$dno,
  'Bdate',$bdate,
  'EmpDate',$empdate,
  'userid',$userid
);

$condition = "SSN = '" . $original_ssn . "'";

$result = update($fields, "Employee", $condition);
echo $result;

mysql_free_result($result);
mysql_close($link);
?>
