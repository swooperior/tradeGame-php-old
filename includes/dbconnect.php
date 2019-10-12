<?php
//dbconnet script connects to the database.
$servername = "localhost";
$username = "root";
$password = "";

// Create connection
$GLOBALS['link'] = mysqli_connect($servername, $username, $password, 'tradeGame');

// Check connection
if (!$GLOBALS['link']) {
    die("Connection failed: " . mysqli_connect_error());
    echo "Connection Failed";
}
//echo "Connected successfully";
?>
