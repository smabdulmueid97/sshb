<?php
session_start();

// Database connection
$dbhost = "localhost";
$dbuser = "root";
$dbpass = "";
$dbname = "sshb";

$connection = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);
if (!$connection) {
    die("Database connection failed: " . mysqli_connect_error());
}

if (isset($_GET['order_id']) && isset($_GET['amount'])) {
    $order_id = $_GET['order_id'];
    $order_total_price = $_GET['amount'];
} else {
    header("Location: index.php");
    exit();
}
?>

<!-- payment -->
<section class="my-5 py-5">
    <div class="container text-center mt-3 py-5">
        <h2 class="form-weight-bold">Payment</h2>
        <hr class="mx-auto">
    </div>
    <div class="mx-auto container text-center">
        <p>Total payment: ৳<?php echo $order_total_price; ?></p>
        <div id="paypal-button-container"></div>
    </div>
</section>

<!-- Replace "test" with your own sandbox Business account app client ID -->
<script src="https://www.paypal.com/sdk/js?client-id=AV5xtx3d0XYAD-J1QdvavW5UfK6uCzcab39Y0mS0jj0NrVwAQ5hTRqkWeZ9U3EhEH9tuPtMyFh5lnEbd&currency=USD"></script>

<script>
    paypal.Buttons({
        // Sets up the transaction when a payment button is clicked
        createOrder: (data, actions) => {
            // Convert BDT to USD (Assuming a conversion rate of 1 USD = 85 BDT, you should use an API for live rates)
            const conversionRate = 85;
            const usdAmount = (<?php echo $order_total_price; ?> / conversionRate).toFixed(2);

            return actions.order.create({
                purchase_units: [{
                    amount: {
                        value: usdAmount // Convert BDT to USD
                    }
                }]
            });
        },
        // Finalize the transaction after payer approval
        onApprove: (data, actions) => {
            return actions.order.capture().then(function(orderData) {
                // Successful capture! For dev/demo purposes:
                console.log('Capture result', orderData, JSON.stringify(orderData, null, 2));
                const transaction = orderData.purchase_units[0].payments.captures[0];
                alert(`Transaction ${transaction.status}: ${transaction.id}\n\nSee console for all available details`);

                window.location.href = "complete_payment.php?transaction_id=" + transaction.id + "&order_id=" + <?php echo $order_id; ?>;

                // When ready to go live, remove the alert and show a success message within this page. For example:
                // const element = document.getElementById('paypal-button-container');
                // element.innerHTML = '<h3>Thank you for your payment!</h3>';
                // Or go to another URL:  actions.redirect('thank_you.html');
            });
        }
    }).render('#paypal-button-container');
</script>