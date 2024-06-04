<?php
// Database connection setup
$dbhost = "localhost";
$dbuser = "root";
$dbpass = "";
$dbname = "sshb";

$this->connection = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);

// Function to show coupons
$show_coupon = $obj->show_coupon();

// Handle delete request
if (isset($_GET['delete_id'])) {
    $delete_id = $_GET['delete_id'];
    $delete_query = "DELETE FROM cupon WHERE cupon_id = $delete_id";
    $delete_result = mysqli_query($this->connection, $delete_query);

    if ($delete_result) {
        echo "Coupon deleted successfully.";
        // Refresh the page to reflect changes
        header("Location: manage_coupon_view.php");
        exit();
    } else {
        echo "Failed to delete coupon.";
    }
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
        while ($result = mysqli_fetch_assoc($show_coupon)) {
        ?>
            <tr>
                <td> <?php echo $result['cupon_id'] ?></td>
                <td> <?php echo $result['cupon_code'] ?></td>
                <td> <?php echo $result['description'] ?></td>
                <td> <?php echo $result['discount'] ?></td>
                <td><a href="manage_coupon_view.php?delete_id=<?php echo $result['cupon_id'] ?>" onclick="return confirm('Are you sure you want to delete this coupon?');">Delete</a> </td>
            </tr>
        <?php } ?>
    </tbody>
</table>