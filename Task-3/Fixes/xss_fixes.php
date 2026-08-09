<?php
// XSS Prevention — Output Encoding

$user_input = $_GET['name'];

// FIX: HTML escape before output
$safe_output = htmlspecialchars($user_input, ENT_QUOTES, 'UTF-8');

echo "Hello " . $safe_output;
?>