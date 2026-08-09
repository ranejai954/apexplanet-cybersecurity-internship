<?php
// CSRF Protection — Token Validation

session_start();

// Generate CSRF token if not exists
if (empty($_SESSION['token'])) {
    $_SESSION['token'] = bin2hex(random_bytes(32));
}

// Validate token on form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (!isset($_POST['user_token']) || $_POST['user_token'] !== $_SESSION['token']) {
        die('CSRF attack detected!');
    }
    
    // Process password change
    echo "Password changed successfully!";
}
?>

<!-- HTML Form with CSRF Token -->
<form method="POST">
    <input type="password" name="new_password" placeholder="New Password">
    <input type="hidden" name="user_token" value="<?php echo $_SESSION['token']; ?>">
    <input type="submit" value="Change Password">
</form>