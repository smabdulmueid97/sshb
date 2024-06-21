<?php
$dbhost = "localhost";
$dbuser = "root";
$dbpass = "";
$dbname = "sshb";

$connection = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);

if (isset($_POST['action'])) {
    if ($_POST['action'] == 'load_discount') {
        $coupon_code = $_POST['cupon'];
        $price = $_POST['price'];
        $query = "SELECT * FROM `cupon` WHERE `cupon_code`='$coupon_code' AND `status`=1";

        $result = mysqli_query($connection, $query);

        if (mysqli_num_rows($result) > 0) {
            $res = mysqli_fetch_assoc($result);
            $discount = $res['discount'];

            $dis = ($price * $discount / 100);
            echo $dis;
        } else {
            echo 0;
        }
    }
}
