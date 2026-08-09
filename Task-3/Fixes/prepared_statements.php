<?php
// Secure Prepared Statement Example

$conn = new mysqli("localhost", "username", "password", "database");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$id = $_GET['id'];

// Prepared Statement — prevents SQL Injection
$stmt = $conn->prepare("SELECT username, password FROM users WHERE id = ?");
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();

while ($row = $result->fetch_assoc()) {
    echo "Username: " . $row['username'] . "<br>";
}

$stmt->close();
$conn->close();
?>