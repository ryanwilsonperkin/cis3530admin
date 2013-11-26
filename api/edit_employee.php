<?php
include 'functions.php';
header('Content-type: application/json');
mysql_connect() or die('Could not connect: ' . mysql_error());
mysql_select_db('Company');

$original_ssn = $_POST["original_ssn"];
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
