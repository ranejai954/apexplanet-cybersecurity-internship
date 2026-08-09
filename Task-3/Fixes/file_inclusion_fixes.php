<?php
// File Inclusion Prevention — Whitelist

$allowed_pages = [
    'home.php',
    'about.php',
    'contact.php',
    'file1.php',
    'file2.php',
    'file3.php'
];

$page = $_GET['page'];

if (in_array($page, $allowed_pages)) {
    include($page);
} else {
    include('404.php');
}
?>