<?php

$hostname = "localhost";
$username = "root";
$password = "";
$dbname = "project_allocation";

$conn = mysqli_connect($hostname, $username, $password, $dbname);

if (!$conn) {
    die("Error encountered: ".mysqli_connect_error($conn));
}