<?php
include_once("admin/class/adminback.php");
$obj = new adminback();

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_FILES['receipt'])) {
    $order_id = $_POST['order_id'];
    $receipt = $_FILES['receipt'];

    // Validate file
    $allowed_types = ['image/jpeg', 'image/png', 'image/gif'];
    if (!in_array($receipt['type'], $allowed_types)) {
        die('Invalid file type. Only JPG, PNG, and GIF files are allowed.');
    }

    // Upload file
    $upload_dir = 'admin/receipt_upload/';
    $file_name = basename($receipt['name']);
    $target_file = $upload_dir . $file_name;

    if (move_uploaded_file($receipt['tmp_name'], $target_file)) {
        // Save file path in the database
        if ($obj->save_receipt($order_id, $file_name)) {
            header("Location: exist_order.php");
        } else {
            echo 'Failed to save receipt in the database.';
        }
    } else {
        echo 'Failed to upload receipt.';
    }
} else {
    echo 'Invalid request.';
}
