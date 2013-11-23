<?php
include 'functions.php';
header('Content-type: application/json');
mysql_connect() or die('Could not connect: ' . mysql_error());
mysql_select_db('Company');

$json = select_as_json(
  "Fname, 
  Minit, 
  Lname, 
  SSN, 
  Address, 
  Sex, 
  Salary, 
  Super_ssn, 
  Dno, 
  BDate, 
  EmpDate", 
  "Employee",
  "userid = '" . $INTERFACE_USER_ID . "'"
);
echo $json;

mysql_free_result($result);
mysql_close($link);
?>
