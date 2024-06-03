<?php
// Suppress the error messages using the @ operator
@include_once('../class/adminback.php');

// Check if the class exists before trying to use it
if (class_exists('adminback')) {
    // Create an instance of the adminback class
    $obj = new adminback();

    // Check if a delete request has been made
    if (isset($_GET['delete_id'])) {
        $delete_id = $_GET['delete_id'];
        $delete_msg = $obj->delete_coupon($delete_id);
        echo "<script>alert('$delete_msg');</script>";
    }

    // Fetch the coupons to display
    $show_coupon = $obj->show_coupon();
} else {
    $show_coupon = false;
    echo "<script>alert('Failed to load the adminback class.');</script>";
}
?>

<h2>Manage Coupon</h2>

<table class="table table-bordered table-striped">
    <thead>
        <tr>
            <th>Coupon Id</th>
            <th>Coupon Code</th>
            <th>Coupon Description</th>
            <th>Coupon Discount</th>
            <th>Action</th>
        </tr>
    </thead>

    <tbody>
        <?php
        if ($show_coupon) {
            while ($result = mysqli_fetch_assoc($show_coupon)) {
        ?>
                <tr>
                    <td> <?php echo $result['cupon_id'] ?></td>
                    <td> <?php echo $result['cupon_code'] ?></td>
                    <td> <?php echo $result['description'] ?></td>
                    <td> <?php echo $result['discount'] ?></td>
                    <td>
                        <a href="?delete_id=<?php echo $result['cupon_id'] ?>" onclick="return confirm('Are you sure you want to delete this coupon?')">Delete</a>
                    </td>
                </tr>
        <?php
            }
        } else {
            echo "<tr><td colspan='5'>Failed to load coupons. Please try again later.</td></tr>";
        }
        ?>
    </tbody>
</table>