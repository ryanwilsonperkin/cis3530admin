<?php
include 'functions.php';
header('Content-type: application/json');
mysql_connect() or die('Could not connect: ' . mysql_error());
mysql_select_db('Company');

$json = select_as_json(
  "Essn,
  Dependent_name,
  Sex,
  Bdate,
  Relationship",
  "Dependent"
);
echo $json;

mysql_free_result($result);
mysql_close($link);
?>
