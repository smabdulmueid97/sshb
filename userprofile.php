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

if (empty($userid)) {
    header("location:user_login.php");
}

if (empty($_SESSION['cart'])) {
    header("location:exist_order.php");
}

if (isset($_POST['remove_product'])) {
    foreach ($_SESSION['cart'] as $key => $value) {
        if ($value['pdt_name'] == $_POST['remove_pdt_name']) {
            unset($_SESSION['cart'][$key]);
            $_SESSION['cart'] = array_values($_SESSION['cart']);
        }
    }
}

if (isset($_GET['logout'])) {
    if ($_GET['logout'] == "logout") {
        $obj->user_logout();
    }
}

if (isset($_POST['confirm_order'])) {
    $order_msg = $obj->confirm_order($_POST, $_SESSION['cart']);
}

if (isset($_POST['update_quantity'])) {
    $new_quantity = $_POST['quantity'];
    $pdt_name = $_POST['pdt_name'];

    foreach ($_SESSION['cart'] as $key => $value) {
        if ($value['pdt_name'] == $pdt_name) {
            $original_price_per_unit = $value['pdt_price'] / $value['quantity']; // Calculate the original price per unit
            $_SESSION['cart'][$key]['quantity'] = $new_quantity;
            $_SESSION['cart'][$key]['pdt_price'] = $original_price_per_unit * $new_quantity; // Adjust price based on new quantity
        }
    }
}

include_once("includes/head.php");
?>

<body class="biolife-body">
    <!-- HEADER -->
    <header id="header" class="header-area style-01 layout-03">
        <?php include_once("includes/header_top.php"); ?>
        <?php include_once("includes/header_middle.php"); ?>
        <?php include_once("includes/header_bottom.php"); ?>
    </header>

    <!-- Page Contain -->
    <div class="page-contain">
        <div id="main-content" class="main-content">
            <div class="container">
                <div class="row">
                    <div class="col-md-2">
                        <h4>Hello <?php echo isset($username) ? strtoupper($username) : ''; ?></h4>
                        <a href="?logout=logout">Logout</a>
                    </div>
                    <div class="col-md-7">
                        <h2 class="text-center text-dark">Cart Summary</h2>
                        <?php if (isset($_SESSION['cart']) && count($_SESSION['cart']) > 0) { ?>
                            <form class="shopping-cart-form" action="" method="POST">
                                <table class="shop_table cart-form">
                                    <thead>
                                        <tr>
                                            <th class="product-name">Product Name</th>
                                            <th class="product-name">Price</th>
                                            <th class="product-price">Remove</th>
                                            <th class="product-quantity">Quantity</th>
                                            <th class="product-subtotal">Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $_SESSION['subtotal'] = 0;
                                        $_SESSION['cart_pdt_number'] = 0;
                                        $order_names = '';

                                        foreach ($_SESSION['cart'] as $key => $value) {
                                            $subtotal = $value['pdt_price']; // The total price for this product is already adjusted
                                            $_SESSION['subtotal'] += $subtotal;
                                            $_SESSION['cart_pdt_number']++;
                                            $order_names .= $value['pdt_name'] . "<br> ";
                                        ?>
                                                <tr class="cart_item">
                                                    <td class="product-thumbnail" data-title="Product Name">
                                                        <a class="prd-thumb" href="single_product.php?status=singleproduct&&id=<?php echo $value['pdt_id'] ?>">
                                                            <figure><img width="113" height="113" src="admin/uploads/<?php echo $value['pdt_img'] ?>" alt="shipping cart"></figure>
                                                        </a>
                                                        <a class="prd-name" href="single_product.php?status=singleproduct&&id=<?php echo $value['pdt_id'] ?>"><?php echo $value['pdt_name'] ?></a>

                                                    </td>



                                                    <td class="product-subtotal" data-title="Total">
                                                        <div class="price price-contain">
                                                            <ins><span class="price-amount"><?php echo $value['pdt_price'] ?>
                                                                    <input type="hidden" class="pdt_price" value="<?php echo $value['pdt_price'] ?>">
                                                                </span></ins>

                                                        </div>
                                                    </td>

          

                                                
                                                    <td class="product-quantity" data-title="Quantity">
                                                        <form action="" method="POST">


                                                            <input class="btn btn-warning" type="submit" value="Remove" name="remove_product">
                                                            <input type="hidden" value="<?php echo $value['pdt_name'] ?>" name="remove_pdt_name">
                                                        </form>
                                                    </td>

                     <form class="shopping-cart-form" action="#" method="POST">

                                                    <td class="product-price" data-title="Price">
                                                        <?php $count=1; ?>
                                                        <div class="">
                                                            <input type="number" value="1" name="quantity" class="quantity" style="width: 65px;" id="quantity" min="1" max="10" onchange="subtotal(), totalOfAll()">

                                                        </div>
                                                    </td>


                                                    <td class="product-subtotal" data-title="Total">
                                                        <div class="price price-contain">
                                                            <ins><span class="price-amount subtotal"> <?php echo $value['pdt_price'] ?> </span></ins>

                                                        </div>
                                                    </td>
                                                </tr>





                                        <?php }
                                        } else {
                                            echo "Your cart is empty";
                                        } ?>


                                      
                                   
                                        

                                        <!-- <tr class="cart_item wrap-buttons">
                                            <td>
                                                <h3 style="color: black;">Payment</h3>
                                            </td>

                                            <form class="shopping-cart-form" action="#" method="POST">

                                                <td colspan="3">
                                                    <input type="text" style="border: none; width:100%;" placeholder="input bKash TXID" name="txid" required>
                                                </td>

                                        </tr> -->

                                        <!-- <tr class="cart_item wrap-buttons">
                                            <td>

                                                <h3 style="color: black;">Shiping Address</h3>
                                            </td>
                                            <td colspan="3">


                                                <input type="text" style="border: none; width:100%" placeholder="input courier service and location" name="shiping" required>
                                            </td>

                                        </tr> -->




                                    </tbody>
                                </table>
                            </form>
                        <?php } else {
                            echo "Your cart is empty";
                        } ?>
                    </div>
                    <div class="col-md-3">
                        <div class="shpcart-subtotal-block">
                            <div class="subtotal-line">
                                <b class="stt-name">Total <span class="sub">(<?php echo $_SESSION['cart_pdt_number'] ?> Items)</span></b>
                                <span class="stt-price" id="totalOfall"><?php echo $_SESSION['subtotal'] ?></span>
                            </div>
                            <div class="subtotal-line">
                                <p class="stt-name">Use Coupon</p>
                                <input type="text" name="coupon" id="cupon" class="form-control" style="width:40%; padding:5px; display:inline">
                                <span class="stt-price" id="discount">0</span>
                            </div>
                            <hr>
                            <div class="subtotal-line">
                                <b class="stt-name">Total</b>
                                <span class="stt-price" id="afterdiscount"><?php echo $_SESSION['subtotal'] ?></span>
                            </div>
                            <div class="btn-checkout">
                                <form class="shopping-cart-form" action="" method="POST">
                                    <input type="text" name="txid" placeholder="input bKash TXID">
                                    <input type="text" name="shipping_Mobile" class="form-control" value="<?php echo $_SESSION['mobile'] ?>" required>
                                    <textarea name="shiping" class="form-control" required><?php echo $_SESSION['address'] ?></textarea>
                                    <input type="hidden" name="user_id" value="<?php echo $_SESSION['user_id'] ?>">
                                    <input type="hidden" name="product_name" value="<?php echo $order_names ?>">
                                    <input type="hidden" name="product_item" value="<?php echo $_SESSION['cart_pdt_number'] ?>">
                                    <input type="hidden" name="amount" value="<?php echo $_SESSION['subtotal'] ?>">
                                    <input type="hidden" name="order_status" value="0">
                                    <input type="submit" class="btn btn-success btn-block btn-lg" value="Confirm Order" name="confirm_order">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- FOOTER -->
    <?php include_once("includes/footer.php"); ?>
    <?php include_once("includes/mobile_footer.php"); ?>
    <?php include_once("includes/mobile_global.php"); ?>
    <a class="btn-scroll-top"><i class="biolife-icon icon-left-arrow"></i></a>
    <?php include_once("includes/script.php"); ?>

    <script>
        function updateTotal() {
            var itemTotals = document.getElementsByClassName("subtotal");
            var total = 0;
            for (var i = 0; i < itemTotals.length; i++) {
                total += parseFloat(itemTotals[i].textContent);
            }
            document.getElementById("totalOfall").textContent = total;
            document.getElementById("afterdiscount").textContent = total;
        }

        document.addEventListener('DOMContentLoaded', (event) => {
            updateTotal();

            var quantities = document.querySelectorAll('.quantity');
            quantities.forEach((element) => {
                element.addEventListener('change', (event) => {
                    updateTotal();
                });
            });

            var couponInput = document.getElementById("cupon");
            couponInput.addEventListener('input', (event) => {
                var total = parseFloat(document.getElementById("totalOfall").textContent);
                var discountElement = document.getElementById("discount");
                var afterDiscountElement = document.getElementById("afterdiscount");

                $.ajax({
                    url: "json/coupon.php",
                    method: "POST",
                    data: {
                        action: 'load_discount',
                        cupon: couponInput.value,
                        price: total
                    },
                    success: function(data) {
                        var html = Math.round(data);
                        discountElement.textContent = html;
                        afterDiscountElement.textContent = total - parseInt(html);
                    }
                });
            });
        });
    </script>
</body>

</html>