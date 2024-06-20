<?php

session_start();

include_once("admin/class/adminback.php");
$obj = new adminback();

$cata_info = $obj->p_display_catagory();
$cataDatas = array();
while ($data = mysqli_fetch_assoc($cata_info)) {
    $cataDatas[] = $data;
}

$userid = $_SESSION['user_id'];
$username = $_SESSION['username'];

if (isset($_GET['logout'])) {
    if ($_GET['logout'] == "logout") {
        $obj->user_logout();
    }
}

if (isset($_SESSION['user_id'])) {
    $id = $_SESSION['user_id'];
    $order_query = $obj->order_details_by_id($id);
} else {
    header("location:user_login.php");
}

?>

<?php
include_once("includes/head.php");
?>

<body class="biolife-body">
    <!-- HEADER -->
    <header id="header" class="header-area style-01 layout-03">
        <?php
        include_once("includes/header_top.php");
        include_once("includes/header_middle.php");
        include_once("includes/header_bottom.php");
        ?>
    </header>

    <!-- Page Contain -->
    <div class="page-contain">
        <!-- Main content -->
        <div id="main-content" class="main-content">
            <div class="container">
                <div class="row">
                    <div class="col-md-2">
                        <h4><?php if (isset($username)) {
                                echo strtoupper($username);
                            } ?></h4>
                        <h4>Go Cashless By</h4>
                        <h4>Online Banking</h4>
                        <h4>+880174238940</h4>
                        <img src="admin/paymentQR/bkashQR.png" alt="Description of your image" width="200" height="200"><br>
                        <a href="?logout=logout">Logout</a>
                    </div>
                    <div class="col-md-10">
                        <h2 class="text-center">Cash On Delivery By Default, Unless Have Receipt</h2><br>
                        <table class="shop_table cart-form">
                            <thead>
                                <tr>
                                    <th class="product-name">Order Id</th>
                                    <th class="product-price">Products</th>
                                    <th class="product-quantity">Quantity</th>
                                    <th class="product-subtotal">Amount</th>
                                    <th class="product-subtotal">Order Status</th>
                                    <th class="product-subtotal">Placing Time</th>
                                    <th class="product-subtotal">Choose File</th>
                                    <th class="product-subtotal">Upload</th>
                                    <th class="product-subtotal">View Receipt</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php while ($order_info = mysqli_fetch_assoc($order_query)) { ?>
                                    <tr class="cart_item">
                                        <td class="product-thumbnail" data-title="Product Name">
                                            <div class="price price-contain">
                                                <a href="exist_order.php?order_id=<?php echo $order_info['order_id']; ?>">
                                                    <span class="price-amount"><?php echo $order_info['order_id']; ?></span>
                                                </a>
                                            </div>
                                        </td>
                                        <td class="" data-title="Product Name">
                                            <div class="price price-contain">
                                                <a href="exist_order.php?order_id=<?php echo $order_info['order_id']; ?>">
                                                    <h5 class="text-left"><?php echo $order_info['product_name']; ?></h5>
                                                </a>
                                            </div>
                                        </td>
                                        <td class="product-subtotal" data-title="Total">
                                            <div class="price price-contain">
                                                <ins><span class="price-amount"><span class="currencySymbol"></span><?php echo $order_info['pdt_quantity']; ?></span></ins>
                                            </div>
                                        </td>
                                        <td class="product-subtotal" data-title="Uses_Coupon">
                                            <div class="price price-contain">
                                                <ins><span class="price-amount"><?php echo $order_info['uses_coupon']; ?> Tk</span></ins>
                                            </div>
                                        </td>
                                        <td class="product-subtotal" data-title="Total">
                                            <div class="">
                                                <span class="price-amount">
                                                    <?php
                                                    if ($order_info['order_status'] == 0) {
                                                        echo "<p class='btn btn-danger btn-sm'> Pending </p>";
                                                    } elseif ($order_info['order_status'] == 1) {
                                                        echo "<p class='btn btn-warning btn-sm'> Processing </p>";
                                                    } elseif ($order_info['order_status'] == 2) {
                                                        echo "<p class='btn btn-success btn-sm'> Delivered </p>";
                                                    }
                                                    ?>
                                                </span>
                                            </div>
                                        </td>
                                        <td class="product-subtotal" data-title="Total">
                                            <div class="price price-contain">
                                                <span class="price-amount"><?php echo $order_info['order_time']; ?></span>
                                            </div>
                                        </td>
                                        <td class="product-subtotal" data-title="Choose File">
                                            <form action="upload_receipt.php" method="POST" enctype="multipart/form-data">
                                                <input type="hidden" name="order_id" value="<?php echo $order_info['order_id']; ?>">
                                                <input type="file" name="receipt" accept="image/*" required>
                                        </td>
                                        <td class="product-subtotal" data-title="Upload">
                                            <button type="submit" class="btn btn-secondary btn-sm" style="background-color: #28a745; color: white;">Upload</button>
                                            </form>
                                        </td>
                                        <td class="product-subtotal" data-title="View Receipt">
                                            <?php
                                            $receipt_query = $obj->get_receipt_by_order_id($order_info['order_id']);
                                            $receipt_info = mysqli_fetch_assoc($receipt_query);
                                            if ($receipt_info && !empty($receipt_info['receipt_upload'])) {
                                                echo '<a href="admin/receipt_upload/' . $receipt_info['receipt_upload'] . '" target="_blank" class="btn btn-info btn-sm" style="background-color: #17a2b8; color: white;">View Receipt</a>';
                                            } else {
                                                echo '<p class="btn btn-outline-info btn-sm" style="color: #17a2b8;">No Receipt</p>';
                                            }
                                            ?>
                                        </td>
                                    </tr>
                                <?php } ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <!-- FOOTER -->
    <?php
    include_once("includes/footer.php");
    include_once("includes/mobile_footer.php");
    include_once("includes/mobile_global.php");
    ?>
    <!-- Scroll Top Button -->
    <a class="btn-scroll-top"><i class="biolife-icon icon-left-arrow"></i></a>
    <?php
    include_once("includes/script.php");
    ?>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var noClickElements = document.querySelectorAll('.no-click');
            noClickElements.forEach(function(element) {
                element.addEventListener('click', function(event) {
                    event.preventDefault();
                });
            });
        });
    </script>

</body>

</html>