-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2024 at 08:08 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sshb`
--

-- --------------------------------------------------------

--
-- Table structure for table `add_logo`
--

CREATE TABLE `add_logo` (
  `id` int(10) NOT NULL,
  `img` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `add_logo`
--

INSERT INTO `add_logo` (`id`, `img`) VALUES
(2, 'logo.png');

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(11) NOT NULL,
  `admin_email` varchar(60) NOT NULL,
  `admin_pass` varchar(60) NOT NULL,
  `role` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_email`, `admin_pass`, `role`) VALUES
(1, 'a@a.a', '81dc9bdb52d04dc20036dbd8313ed055', 1),
(5, 't@t.t', '81dc9bdb52d04dc20036dbd8313ed055', 2),
(6, 'q@q.q', '81dc9bdb52d04dc20036dbd8313ed055', 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `all_order_info`
-- (See below for the actual view)
--
CREATE TABLE `all_order_info` (
`order_id` int(255)
,`product_name` varchar(255)
,`pdt_quantity` int(11)
,`amount` int(11)
,`uses_coupon` varchar(35)
,`customer_name` varchar(60)
,`Shipping_mobile` varchar(20)
,`trans_id` varchar(25)
,`shiping_address` varchar(255)
,`order_status` int(3)
,`order_time` timestamp
,`order_date` date
);

-- --------------------------------------------------------

--
-- Table structure for table `catagory`
--

CREATE TABLE `catagory` (
  `ctg_id` int(11) NOT NULL,
  `ctg_name` varchar(60) NOT NULL,
  `ctg_des` varchar(150) NOT NULL,
  `ctg_status` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `catagory`
--

INSERT INTO `catagory` (`ctg_id`, `ctg_name`, `ctg_des`, `ctg_status`) VALUES
(1, 'Breakfast', 'Morning food before work', 1),
(2, 'Afternoon Food', 'afternoon snacks and more', 1),
(9, 'Evening snack', 'Evening snack', 1),
(10, 'Dinner', 'Dinner', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cupon`
--

CREATE TABLE `cupon` (
  `cupon_id` int(11) NOT NULL,
  `cupon_code` varchar(25) NOT NULL,
  `description` varchar(255) NOT NULL,
  `discount` int(5) NOT NULL,
  `status` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cupon`
--

INSERT INTO `cupon` (`cupon_id`, `cupon_code`, `description`, `discount`, `status`) VALUES
(1, 'sshb', 'It\'s a discount coupon.', 10, 1),
(2, 'eid1', 'Eid discount', 15, 1),
(5, 'eid2', 'eid2', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_feedback`
--

CREATE TABLE `customer_feedback` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `pdt_id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `comment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_feedback`
--

INSERT INTO `customer_feedback` (`id`, `user_id`, `user_name`, `pdt_id`, `comment`, `comment_date`) VALUES
(5, 6, 'a', 1, 'Nice', '2024-06-04'),
(6, 7, 'a', 3, 'great', '2024-06-04'),
(7, 7, 'a', 2, 'tasty', '2024-06-04'),
(8, 7, 'a', 4, 'cheap', '2024-06-04'),
(9, 7, 'a', 5, 'not good', '2024-06-04'),
(10, 7, 'a', 6, 'good', '2024-06-04'),
(11, 7, 'a', 18, 'sweet', '2024-06-04'),
(12, 7, 'a', 21, 'wow', '2024-06-04'),
(13, 8, 't', 28, 'cake!!', '2024-06-05'),
(14, 7, 'a', 22, 'good', '2024-06-05'),
(16, 7, 'a', 30, 'good\r\n', '2024-06-11');

-- --------------------------------------------------------

--
-- Table structure for table `header_info`
--

CREATE TABLE `header_info` (
  `id` int(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `tweeter` varchar(500) NOT NULL,
  `fb_link` varchar(500) NOT NULL,
  `pinterest` varchar(500) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `header_info`
--

INSERT INTO `header_info` (`id`, `email`, `tweeter`, `fb_link`, `pinterest`, `phone`) VALUES
(10, 'a@a.a', 'https://twitter.com/', 'https://facebook.com/', 'https://pinerest.com/', '+880174238940');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `pdt_quantity` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `uses_coupon` varchar(35) NOT NULL,
  `order_status` int(3) NOT NULL,
  `trans_id` varchar(25) NOT NULL,
  `Shipping_mobile` varchar(20) NOT NULL,
  `shiping` varchar(255) NOT NULL,
  `order_time` timestamp NULL DEFAULT current_timestamp(),
  `order_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_id`, `user_id`, `product_name`, `pdt_quantity`, `amount`, `uses_coupon`, `order_status`, `trans_id`, `Shipping_mobile`, `shiping`, `order_time`, `order_date`) VALUES
(42, 7, 'Rice and Chicken Curry', 3, 750, '', 2, '', '123456789', 'dhaka, bangladesh', '2024-06-04 15:46:44', '2024-06-04'),
(43, 7, 'Khichuri', 2, 500, '', 0, '', '123456789', 'dhaka, bangladesh', '2024-06-04 15:46:44', '2024-06-04'),
(44, 7, 'Alu Bhorta ', 2, 400, '', 2, '', '123456789', 'dhaka, bangladesh', '2024-06-04 15:46:44', '2024-06-04'),
(45, 7, 'Roti with Beef Curry', 2, 600, '', 1, '', '123456789', 'dhaka, bangladesh', '2024-06-04 15:46:44', '2024-06-04'),
(46, 7, 'Dal Bhat', 2, 200, '', 1, '', '123456789', 'dhaka, bangladesh', '2024-06-04 15:46:44', '2024-06-04'),
(47, 7, 'Luchi with Aloo Dom', 2, 200, '', 0, '', '123456789', 'dhaka, bangladesh', '2024-06-04 15:46:44', '2024-06-04'),
(48, 7, ' jilapi', 2, 60, '', 0, '', '123456789', 'dhaka, bangladesh', '2024-06-04 15:46:44', '2024-06-04'),
(49, 7, 'Fish fry', 4, 560, '', 0, '', '123456789', 'dhaka, bangladesh', '2024-06-04 15:46:44', '2024-06-04'),
(50, 7, 'beef', 1, 130, '', 0, '', '123456789', 'dhaka, bangladesh', '2024-06-04 15:46:44', '2024-06-04'),
(51, 7, 'BBQ', 2, 400, '', 0, '', '123456789', 'dhaka, bangladesh', '2024-06-04 15:46:44', '2024-06-04'),
(52, 7, 'Rice & Fish ', 1, 190, '', 0, '', '123456789', 'dhaka, bangladesh', '2024-06-04 15:46:44', '2024-06-04'),
(53, 7, 'Somosa', 1, 20, '', 0, '', '123456789', 'dhaka, bangladesh', '2024-06-04 15:46:44', '2024-06-04'),
(54, 7, 'Singara', 1, 20, '', 0, '', '123456789', 'dhaka, bangladesh', '2024-06-04 15:46:44', '2024-06-04'),
(55, 7, 'Beef Somosa', 2, 60, '', 0, '', '123456789', 'dhaka, bangladesh', '2024-06-04 15:46:44', '2024-06-04'),
(56, 7, 'Puri', 1, 20, '', 0, '', '123456789', 'dhaka, bangladesh', '2024-06-04 15:46:44', '2024-06-04'),
(57, 7, 'Cake', 2, 180, '', 2, '', '123456789', 'dhaka, bangladesh', '2024-06-04 15:46:44', '2024-06-04'),
(58, 8, 'Cake', 4, 360, '', 2, '', '2147483647', 'rajshahi, borisal', '2024-06-04 15:48:57', '2024-06-04'),
(59, 8, 'Puri', 2, 40, '', 0, '', '2147483647', 'rajshahi, borisal', '2024-06-04 15:48:57', '2024-06-04'),
(60, 8, 'Beef Somosa', 6, 180, '', 0, '', '2147483647', 'rajshahi, borisal', '2024-06-04 15:48:57', '2024-06-04'),
(61, 8, 'Singara', 4, 80, '', 0, '', '2147483647', 'rajshahi, borisal', '2024-06-04 15:48:57', '2024-06-04'),
(62, 8, 'Somosa', 3, 60, '', 1, '', '2147483647', 'rajshahi, borisal', '2024-06-04 15:48:57', '2024-06-04'),
(63, 8, 'Rice & Fish ', 1, 190, '', 1, '', '2147483647', 'rajshahi, borisal', '2024-06-04 15:48:57', '2024-06-04'),
(64, 8, 'BBQ', 1, 200, '', 0, '', '2147483647', 'rajshahi, borisal', '2024-06-04 15:48:57', '2024-06-04'),
(65, 8, 'beef', 2, 260, '', 0, '', '2147483647', 'rajshahi, borisal', '2024-06-04 15:48:57', '2024-06-04'),
(66, 8, 'Fish fry', 3, 420, '', 2, '', '2147483647', 'rajshahi, borisal', '2024-06-04 15:48:57', '2024-06-04'),
(67, 8, ' jilapi', 1, 30, '', 1, '', '2147483647', 'rajshahi, borisal', '2024-06-04 15:48:57', '2024-06-04'),
(68, 8, 'Luchi with Aloo Dom', 1, 100, '', 0, '', '2147483647', 'rajshahi, borisal', '2024-06-04 15:48:57', '2024-06-04'),
(69, 8, 'Dal Bhat', 2, 200, '', 0, '', '2147483647', 'rajshahi, borisal', '2024-06-04 15:48:57', '2024-06-04'),
(70, 8, 'Roti with Beef Curry', 1, 300, '', 2, '', '2147483647', 'rajshahi, borisal', '2024-06-04 15:48:57', '2024-06-04'),
(71, 8, 'Alu Bhorta ', 1, 200, '', 0, '', '2147483647', 'rajshahi, borisal', '2024-06-04 15:48:57', '2024-06-04'),
(72, 8, 'Khichuri', 1, 250, '', 0, '', '2147483647', 'rajshahi, borisal', '2024-06-04 15:48:57', '2024-06-04'),
(73, 8, 'Rice and Chicken Curry', 1, 250, '', 0, '', '2147483647', 'rajshahi, borisal', '2024-06-04 15:48:57', '2024-06-04'),
(74, 7, 'Khichuri', 1, 250, '', 2, '', '123456789', 'dhaka, bangladesh', '2024-06-05 09:43:22', '2024-06-05'),
(75, 7, 'Beef Somosa', 3, 90, '', 0, '', '123456789', 'dhaka, bangladesh', '2024-06-05 12:15:32', '2024-06-05'),
(76, 7, 'Alu Bhorta ', 7, 1400, '', 0, '', '123456789w32424', 'dhaka, bangladesh,kalala', '2024-06-05 12:48:26', '2024-06-05'),
(77, 7, 'BBQ', 2, 400, '', 0, '', '123456789', 'dhaka, bangladesh', '2024-06-05 13:06:37', '2024-06-05'),
(78, 7, 'Rice and Chicken Curry', 2, 500, '', 0, '', '123456789', 'dhaka, bangladesh', '2024-06-05 13:06:37', '2024-06-05'),
(79, 8, 'Fish fry', 2, 280, '', 0, '', '2147483647', 'rajshahi, borisal', '2024-06-05 13:17:50', '2024-06-05'),
(80, 7, 'Khichuri', 4, 1000, '', 0, '', '123456789', 'dhaka, bangladesh', '2024-06-07 15:10:37', '2024-06-07'),
(81, 7, 'Khichuri', 1, 250, '', 0, '', '123456789', 'dhaka, bangladesh', '2024-06-07 15:35:21', '2024-06-07'),
(82, 7, 'Khichuri', 1, 250, '', 0, '', '123456789', 'dhaka, bangladesh', '2024-06-09 04:27:19', '2024-06-09'),
(83, 10, 'BBQ', 2, 400, '', 1, '', '2147483647', 'johor, malaysia', '2024-06-10 16:19:25', '2024-06-11'),
(84, 10, ' jilapi', 1, 30, '', 2, '', '2147483647', 'johor, malaysia', '2024-06-10 16:19:25', '2024-06-11');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(255) NOT NULL,
  `receipt_upload` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `order_id`, `receipt_upload`) VALUES
(6, 74, '1715570002.png'),
(7, 42, '1704449019.jpg'),
(8, 75, '1715570002.png'),
(9, 43, '1704449019.jpg'),
(10, 75, '1704449019.webp'),
(11, 44, '1704449019.webp'),
(12, 44, '1715570002.png'),
(13, 58, '1715570002.png'),
(14, 83, '1715570002.png');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `pdt_id` int(255) NOT NULL,
  `pdt_name` varchar(200) NOT NULL,
  `pdt_price` int(255) NOT NULL,
  `pdt_des` varchar(2000) NOT NULL,
  `pdt_ctg` int(200) NOT NULL,
  `pdt_img` varchar(250) NOT NULL,
  `product_stock` int(5) NOT NULL,
  `pdt_status` tinyint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pdt_id`, `pdt_name`, `pdt_price`, `pdt_des`, `pdt_ctg`, `pdt_img`, `product_stock`, `pdt_status`) VALUES
(1, 'Rice and Chicken Curry', 250, ' A classic combination where rice is served with a flavorful chicken curry, typically made with a mix of spices, tomatoes, and onions.', 1, 'p1.jpg', 10, 1),
(2, 'Khichuri', 250, 'A popular South Asian dish made with rice and lentils. It can include vegetables and is often seasoned with spices like turmeric, cumin, and bay leaves.', 1, 'p2.jpg', 15, 1),
(3, 'Alu Bhorta ', 200, 'A Bangladeshi mashed potato dish flavored with mustard oil, green chilies, and onions.', 1, 'p3.jpg', 10, 1),
(4, 'Roti with Beef Curry', 300, 'Roti is a type of flatbread made from whole wheat flour, and it is often served with a spicy and rich beef curry.', 2, 'p4.jpg', 10, 1),
(5, 'Dal Bhat', 100, 'A traditional South Asian meal consisting of lentil soup (dal) and rice (bhat).', 2, 'p5.jpg', 8, 1),
(6, 'Luchi with Aloo Dom', 100, 'Luchi is a deep-fried flatbread made from refined flour, often served with Aloo Dom, a spicy potato curry.', 2, 'p6.jpg', 12, 1),
(18, ' jilapi', 30, 'A sweet, deep-fried dessert made from a batter of wheat flour, which is then soaked in sugar syrup. Also known as jalebi.', 9, 'p11.jpg', 30, 1),
(19, 'Fish fry', 140, 'Fish fillets or whole fish coated in a spiced batter or breading and deep-fried until crispy.', 10, 'p7.jpg', 30, 1),
(21, 'beef', 130, 'Grilled or barbecued beef, typically marinated in spices and cooked over an open flame.', 10, 'p8.jpg', 30, 1),
(22, 'BBQ', 200, 'BBQ - the sweet and tangy flavors of a perfectly grilled or smoked meat, infused with the rich aromas of spices and herbs. Whether it\'s a tender rack of ribs, a juicy burger, or a slow-cooked brisket, BBQ is a culinary delight that\'s sure to tantalize the taste buds.\n\nThe sweet and tangy flavors of the BBQ sauce mingle with the rich flavors of the meat, creating a harmonious balance of flavors that\'s both familiar and comforting. The aroma of smoked meat wafts through the air, teasing the senses and leaving you craving more.', 10, 'p9.jpg', 30, 1),
(23, 'Rice & Fish ', 190, 'A staple meal in many parts of the world, particularly in South Asia, where rice is paired with a variety of fish preparations.', 9, 'p10.jpg', 30, 1),
(24, 'Somosa', 20, 'A fried or baked pastry with a savory filling, such as spiced potatoes, peas, and sometimes meat.', 1, 'p12.jpg', 30, 1),
(25, 'Singara', 20, 'Similar to samosas, singaras are filled pastries, often with a spiced potato and pea filling, popular in Bengal.', 2, 'p13.jpg', 30, 1),
(26, 'Beef Somosa', 30, ' A variation of the samosa filled with spiced ground beef.', 2, 'p14.jpg', 30, 1),
(27, 'Puri', 20, 'A deep-fried bread made from unleavened wheat flour dough, often served with a variety of side dishes.', 10, 'p15.jpg', 30, 1),
(28, 'Regular Cake', 90, 'Can come in various flavors and styles, such as sponge cakes, layer cakes, etc.', 1, 'p16.jpg', 30, 1),
(30, 'Ice cream vanina', 2000, 'udfgkasjlfsjdf w4uryweuirhkwjrhtkwrht89248274908374824\r\n\r\nefheoifhnaf\r\nsdfsdf\r\nsfsdfd\r\nf', 2, '140877-easy-eggless-strawberry-ice-cream-ddmfs-3x4-1-092e4d11b59049c8b3843014ea3c57f2.jpg', 20, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `product_info_ctg`
-- (See below for the actual view)
--
CREATE TABLE `product_info_ctg` (
`pdt_id` int(255)
,`pdt_name` varchar(200)
,`pdt_price` int(255)
,`pdt_des` varchar(2000)
,`pdt_img` varchar(250)
,`product_stock` int(5)
,`pdt_status` tinyint(5)
,`ctg_id` int(11)
,`ctg_name` varchar(60)
);

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `slider_id` int(11) NOT NULL,
  `first_line` varchar(255) NOT NULL,
  `second_line` varchar(255) NOT NULL,
  `third_line` varchar(255) NOT NULL,
  `btn_left` varchar(25) NOT NULL,
  `btn_right` varchar(25) NOT NULL,
  `slider_img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`slider_id`, `first_line`, `second_line`, `third_line`, `btn_left`, `btn_right`, `slider_img`) VALUES
(1, 'Welcome To SSHB Online', 'Fresh Breakfast One Click Away\n', 'We Can Deliver In 30 min', 'Menu', 'Go Up', 's1.jpg '),
(2, 'Welcome To SSHB Online', 'Fresh Breakfast One Click Away\n', 'We Can Deliver In 30 min', 'Menu', 'Go Up', 's2.jpg ');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(6) NOT NULL,
  `user_name` varchar(60) NOT NULL,
  `user_firstname` varchar(60) NOT NULL,
  `user_lastname` varchar(60) NOT NULL,
  `user_email` varchar(60) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_mobile` int(11) NOT NULL,
  `user_address` varchar(255) NOT NULL,
  `user_roles` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_firstname`, `user_lastname`, `user_email`, `user_password`, `user_mobile`, `user_address`, `user_roles`, `created_at`, `modified_at`) VALUES
(7, 'a', ' a', ' a', 'a@a.a', '81dc9bdb52d04dc20036dbd8313ed055', 123456789, 'dhaka, bangladesh', 5, '2024-06-04 04:04:53', '2024-06-04 04:04:53'),
(8, 't', ' tim', ' kon', 't@t.t', '81dc9bdb52d04dc20036dbd8313ed055', 2147483647, 'rajshahi, borisal', 5, '2024-06-04 10:41:21', '2024-06-04 10:41:21'),
(9, 'EzaFa', ' Eza', ' Fa', 's@s.s', '81dc9bdb52d04dc20036dbd8313ed055', 2147483647, 'kalabagal, foridpur', 5, '2024-06-09 03:23:05', '2024-06-09 03:23:05'),
(10, 'Akmal', ' Akmal ', ' Hossin', 'q@q.q', '81dc9bdb52d04dc20036dbd8313ed055', 2147483647, 'johor, malaysia', 5, '2024-06-10 16:17:54', '2024-06-10 16:17:54');

-- --------------------------------------------------------

--
-- Structure for view `all_order_info`
--
DROP TABLE IF EXISTS `all_order_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=CURRENT_USER SQL SECURITY DEFINER VIEW `all_order_info`  AS SELECT `order_details`.`order_id` AS `order_id`, `order_details`.`product_name` AS `product_name`, `order_details`.`pdt_quantity` AS `pdt_quantity`, `order_details`.`amount` AS `amount`, `order_details`.`uses_coupon` AS `uses_coupon`, `users`.`user_firstname` AS `customer_name`, `order_details`.`Shipping_mobile` AS `Shipping_mobile`, `order_details`.`trans_id` AS `trans_id`, `order_details`.`shiping` AS `shiping_address`, `order_details`.`order_status` AS `order_status`, `order_details`.`order_time` AS `order_time`, `order_details`.`order_date` AS `order_date` FROM (`order_details` join `users`) WHERE `users`.`user_id` = `order_details`.`user_id` ;

-- --------------------------------------------------------

--
-- Structure for view `product_info_ctg`
--
DROP TABLE IF EXISTS `product_info_ctg`;

CREATE ALGORITHM=UNDEFINED DEFINER=CURRENT_USER SQL SECURITY DEFINER VIEW `product_info_ctg`  AS SELECT `products`.`pdt_id` AS `pdt_id`, `products`.`pdt_name` AS `pdt_name`, `products`.`pdt_price` AS `pdt_price`, `products`.`pdt_des` AS `pdt_des`, `products`.`pdt_img` AS `pdt_img`, `products`.`product_stock` AS `product_stock`, `products`.`pdt_status` AS `pdt_status`, `catagory`.`ctg_id` AS `ctg_id`, `catagory`.`ctg_name` AS `ctg_name` FROM (`products` join `catagory`) WHERE `products`.`pdt_ctg` = `catagory`.`ctg_id` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `add_logo`
--
ALTER TABLE `add_logo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `catagory`
--
ALTER TABLE `catagory`
  ADD PRIMARY KEY (`ctg_id`);

--
-- Indexes for table `cupon`
--
ALTER TABLE `cupon`
  ADD PRIMARY KEY (`cupon_id`);

--
-- Indexes for table `customer_feedback`
--
ALTER TABLE `customer_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `header_info`
--
ALTER TABLE `header_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pdt_id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`slider_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `add_logo`
--
ALTER TABLE `add_logo`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `catagory`
--
ALTER TABLE `catagory`
  MODIFY `ctg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cupon`
--
ALTER TABLE `cupon`
  MODIFY `cupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer_feedback`
--
ALTER TABLE `customer_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `header_info`
--
ALTER TABLE `header_info`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `order_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pdt_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `slider_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_details` (`order_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
