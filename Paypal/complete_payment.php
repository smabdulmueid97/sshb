<?php
session_start();

// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Database connection
$dbhost = "localhost";
$dbuser = "root";
$dbpass = "";
$dbname = "sshb";

$connection = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);
if (!$connection) {
    die("Database connection failed: " . mysqli_connect_error());
}

if (isset($_GET['transaction_id']) && isset($_GET['order_id'])) {

    $order_id = $_GET['order_id'];
    $order_status = 1;  // Assuming '1' represents 'paid'
    $transaction_id = $_GET['transaction_id'];
    $payment_date = date('Y-m-d H:i:s');

    // Update order_status to paid
    $stmt = $connection->prepare("UPDATE order_details SET order_status=? WHERE order_id=?");
    if (!$stmt) {
        die("Prepare failed: " . $connection->error);
    }
    $stmt->bind_param('ii', $order_status, $order_id);
    if (!$stmt->execute()) {
        die("Execute failed: " . $stmt->error);
    }

    // Store payment info as HTML receipt
    $receipt_content = generateReceiptContent($order_id, $transaction_id, $payment_date);
    $receipt_path = "../admin/receipt_upload" . $transaction_id . ".html";
    if (!file_put_contents($receipt_path, $receipt_content)) {
        die("Failed to write receipt file");
    }

    // Store payment info in database
    $stmt1 = $connection->prepare("INSERT INTO payment (order_id, receipt_upload) VALUES(?, ?)");
    if (!$stmt1) {
        die("Prepare failed: " . $connection->error);
    }
    $stmt1->bind_param('is', $order_id, $receipt_path);
    if (!$stmt1->execute()) {
        die("Execute failed: " . $stmt1->error);
    }

    // Set session message
    $_SESSION['payment_message'] = "Paid successfully, now please wait!";

    // Redirect to user account
    header("Location:../exist_order.php");
    exit();
} else {
    header("Location:../index.php");
    exit();
}

function generateReceiptContent($order_id, $transaction_id, $payment_date)
{
    // Generate HTML content for the receipt
    $html = "
        <!DOCTYPE html>
        <html lang='en'>
        <head>
            <meta charset='UTF-8'>
            <title>Receipt</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    line-height: 1.6;
                }
                .receipt {
                    max-width: 600px;
                    margin: 0 auto;
                    padding: 20px;
                    border: 1px solid #ccc;
                }
                .receipt h2 {
                    margin-bottom: 10px;
                    text-align: center;
                }
                .receipt p {
                    margin: 5px 0;
                }
            </style>
        </head>
        <body>
            <div class='receipt'>
                <h2>Receipt</h2>
                <p><strong>Order ID:</strong> $order_id</p>
                <p><strong>Transaction ID:</strong> $transaction_id</p>
                <p><strong>Payment Date:</strong> $payment_date</p>
                <p><strong>Status:</strong> Paid</p>
            </div>
        </body>
        </html>
    ";

    return $html;
}
