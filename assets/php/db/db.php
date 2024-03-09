<?php
// Establish connection
$hostName = "localhost";
$userName = "root";
$password = "";
$databaseName = "capabilite";
$conn = new mysqli($hostName, $userName, $password, $databaseName);

// Check connection
if ($conn->connect_error) {
  die("Connection échouée: " . $conn->connect_error);
}
