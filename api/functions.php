<?php
$INTERFACE_USER_ID = 'CIS3530';

function update($fields, $table, $condition) {
  $result = mysql_query("UPDATE " . $table . " SET " . $fields . " WHERE " . $condition);
  $response = Array();
  if (!$result) {
    $response['status'] = "ERROR"; 
    $response['message'] = mysql_error();
  }
  else {
    $response['status'] = "OK";
    $response['message'] = "OK";
  }
  return json_encode($response);
}

function insert_into($table, $value) {
  $result = mysql_query("INSERT INTO " . $table . " VALUE " . $value);
  $response = Array();
  if (!$result) {
    $response['status'] = "ERROR"; 
    $response['message'] = mysql_error();
  }
  else {
    $response['status'] = "OK";
    $response['message'] = "OK";
  }
  return json_encode($response);
}

function select_as_json($fields, $table, $clause = 'True') {
  $result = mysql_query("SELECT " . $fields . " FROM " . $table . " WHERE " . $clause);
  $rows = array();
  while ($r = mysql_fetch_assoc($result)) {
    $rows[] = $r;
  }
  return json_encode($rows);
}

?>
