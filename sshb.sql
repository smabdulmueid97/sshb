-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2024 at 05:53 PM
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
(5, 't@t.t', '81dc9bdb52d04dc20036dbd8313ed055', 2);

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
(12, 7, 'a', 21, 'wow', '2024-06-04');

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
  `order_date` date DEFAULT current_timestamp()
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
(73, 8, 'Rice and Chicken Curry', 1, 250, '', 0, '', '2147483647', 'rajshahi, borisal', '2024-06-04 15:48:57', '2024-06-04');

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
(1, 'Rice and Chicken Curry', 250, 'A harmonious blend of flavors, this curry is a symphony of spices, herbs, and tender chicken, all wrapped up in a flavorful sauce and served with a side of fluffy rice. The aroma of sautéed onions and garlic fills the air, enticing you to take a bite. The chicken is cooked to perfection, and the rice is cooked just right, making this dish a comforting and satisfying meal.\nEach mouthful is a symphony of textures and tastes, where the subtle nuttiness of the rice complements the rich, savory notes of the curry. Delve deeper, and you\'ll discover layers of complexity as the spices unfold on your palate, leaving a lingering warmth that is both comforting and invigorating.\n\nOur chefs craft this dish with utmost care and precision, ensuring that every bite is an experience to remember. Whether you\'re a connoisseur of Indian cuisine or simply seeking a culinary adventure, our Rice and Chicken Curry promises to delight your senses and leave you craving for more.\n\nIndulge in this culinary journey and let the enticing aroma and vibrant flavors whisk you away to a world of culinary bliss. Whether enjoyed as a hearty meal on its own or paired with your favorite accompaniments, our Rice and Chicken Curry is sure to satisfy your cravings and leave you craving for another serving.', 1, 'p1.jpg', 10, 1),
(2, 'Khichuri', 250, 'A hearty and comforting dish, khichuri is a flavorful mix of rice and lentils, cooked to perfection and served with a hint of spices. The aroma of sautéed onions and garlic fills the air, enticing you to take a bite. The rice and lentils are cooked just right, making this dish a filling and satisfying meal.', 1, 'p2.jpg', 15, 1),
(3, 'Alu Bhorta ', 200, 'A simple yet satisfying dish, alu bhorta is a flavorful mash of boiled potatoes, mixed with spices and herbs. The potatoes are cooked to perfection, and the spices add a subtle warmth, making this dish a comforting and satisfying snack.\nAs you take your first spoonful, the soft, fluffy potatoes melt in your mouth, releasing a gentle sweetness that\'s balanced by the subtle tang of the mustard oil. The aroma of the cilantro wafts up, teasing your senses and leaving you craving more. Whether served as a side dish or a light meal, Alu Bhorta is a true delight that\'s sure to become a favorite. So go ahead, indulge in this comforting treat and let the warmth of this beloved dish envelop you in its cozy embrace.', 1, 'p3.jpg', 10, 1),
(4, 'Roti with Beef Curry', 300, 'A classic combination, roti and beef curry is a match made in heaven. The tender beef is cooked in a rich and spicy curry sauce, and served with a side of soft roti. The aroma of sautéed onions and garlic fills the air, enticing you to take a bite. The beef is cooked to perfection, and the roti is soft and fluffy, making this dish a comforting and satisfying meal.', 2, 'p4.jpg', 10, 1),
(5, 'Dal Bhat', 100, 'A staple dish, dal bhat is a flavorful and filling combination of lentil soup and steamed rice. The aroma of sautéed onions and garlic fills the air, enticing you to take a bite. The lentils are cooked to perfection, and the rice is cooked just right, making this dish a comforting and satisfying meal.', 2, 'p5.jpg', 8, 1),
(6, 'Luchi with Aloo Dom', 100, 'A popular street food, luchi and aloo dom is a crispy and flavorful combination of fried bread and spicy potato curry. The aroma of fried bread fills the air, enticing you to take a bite. The potato curry is spicy and flavorful, and the fried bread is crispy and crunchy, making this dish a delicious and satisfying snack.', 2, 'p6.jpg', 12, 1),
(18, ' jilapi', 30, 'A sweet and crispy treat, jilapi is a popular dessert made with deep-fried batter and sugar. The aroma of fried batter fills the air, enticing you to take a bite. The sugar adds a sweet and sticky flavor, making this dish a delicious and satisfying treat.', 9, 'p11.jpg', 30, 1),
(19, 'Fish fry', 140, 'A crispy and flavorful dish, fish fry is a popular snack made with tender fish, coated in a light batter and deep-fried to perfection. The aroma of fried fish fills the air, enticing you to take a bite. The fish is cooked to perfection, and the batter is crispy and crunchy, making this dish a delicious and satisfying snack.', 10, 'p7.jpg', 30, 1),
(21, 'beef', 130, 'Beef - a rich and savory meat that\'s a staple in many cuisines around the world. With its tender texture and robust flavor, beef is a popular choice for many dishes, from hearty stews and roasts to juicy burgers and sandwiches.\n\nWhether grilled, sautéed, or slow-cooked, beef is a versatile ingredient that can be prepared in a variety of ways to suit any taste. From the rich flavor of a well-marbled ribeye to the tender bite of a lean sirloin, beef is a meat that\'s sure to please even the most discerning palate.', 10, 'p8.jpg', 30, 1),
(22, 'BBQ', 200, 'BBQ - the sweet and tangy flavors of a perfectly grilled or smoked meat, infused with the rich aromas of spices and herbs. Whether it\'s a tender rack of ribs, a juicy burger, or a slow-cooked brisket, BBQ is a culinary delight that\'s sure to tantalize the taste buds.\n\nThe sweet and tangy flavors of the BBQ sauce mingle with the rich flavors of the meat, creating a harmonious balance of flavors that\'s both familiar and comforting. The aroma of smoked meat wafts through the air, teasing the senses and leaving you craving more.', 10, 'p9.jpg', 30, 1),
(23, 'Rice & Fish ', 190, 'Rice & Fish - a match made in heaven! The fluffy, tender rice provides the perfect canvas for the delicate, flaky fish. The subtle sweetness of the rice complements the savory flavor of the fish, creating a harmonious balance of flavors that\'s both familiar and comforting.\n\nThe aroma of the fish wafts up, enticing you to take a bite. The rice is cooked to perfection, with a subtle crunch that gives way to a soft, fluffy interior. The fish is cooked just right, with a tender flake that melts in your mouth.', 9, 'p10.jpg', 30, 1),
(24, 'Somosa', 20, 'Somosa - the crispy, golden-brown pastry that\'s a staple of many cuisines around the world. The delicate layers of dough are filled with a savory mixture of spices, herbs, and sometimes meat or vegetables, creating a flavor profile that\'s both familiar and comforting.\n\nAs you take your first bite, the crispy exterior gives way to a soft, fluffy interior that\'s infused with the aromas of spices and herbs. The flavors meld together in a harmonious balance of sweet and savory, with a subtle crunch from the crispy pastry.', 1, 'p12.jpg', 30, 1),
(25, 'Singara', 20, 'Singara - the crispy, golden-brown pastry that\'s a staple of many cuisines around the world. The delicate layers of dough are filled with a savory mixture of spices, herbs, and sometimes meat or vegetables, creating a flavor profile that\'s both familiar and comforting.\n\nAs you take your first bite, the crispy exterior gives way to a soft, fluffy interior that\'s infused with the aromas of spices and herbs. The flavors meld together in a harmonious balance of sweet and savory, with a subtle crunch from the crispy pastry.', 2, 'p13.jpg', 30, 1),
(26, 'Beef Somosa', 30, 'Beef Somosa - a savory and satisfying treat that combines the crispy, golden-brown pastry of a traditional Somosa with the rich flavor of beef. The tender beef is cooked to perfection and wrapped in a delicate layer of dough, creating a flavor profile that\'s both familiar and comforting.\n\nAs you take your first bite, the crispy exterior gives way to a soft, fluffy interior that\'s infused with the rich flavors of the beef. The beef is tender and juicy, with a subtle sweetness that\'s balanced by the savory flavors of the spices and herbs.', 2, 'p14.jpg', 30, 1),
(27, 'Puri', 20, 'Puri - the crispy, golden-brown bread that\'s a staple of many cuisines around the world. The delicate layers of dough are fried to perfection, creating a flavor profile that\'s both familiar and comforting.\n\nAs you take your first bite, the crispy exterior gives way to a soft, fluffy interior that\'s infused with the aromas of spices and herbs. The flavors meld together in a harmonious balance of sweet and savory, with a subtle crunch from the crispy bread.', 10, 'p15.jpg', 30, 1),
(28, 'Cake', 90, 'Cake - the sweet and indulgent treat that\'s a staple of celebrations and celebrations around the world. The moist and fluffy texture is infused with the sweetness of sugar and the richness of butter, creating a flavor profile that\'s both familiar and comforting.\n\nAs you take your first bite, the sweetness of the cake melts in your mouth, releasing a burst of flavors that\'s both rich and decadent. The texture is soft and fluffy, with a subtle crumb that\'s both tender and satisfying.', 1, 'p16.jpg', 30, 1);

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
(1, 'Welcome To SSHB Online', 'Fresh Breakfast One Click Away\n', 'We Can Delever In 30 min', 'Menu', 'Go Up', 's1.jpg '),
(2, 'Welcome To SSHB Online', 'Fresh Breakfast One Click Away\n', 'We Can Delevery In 30 min', 'Menu', 'Go Up', 's2.jpg ');

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
(8, 't', ' tim', ' kon', 't@t.t', '81dc9bdb52d04dc20036dbd8313ed055', 2147483647, 'rajshahi, borisal', 5, '2024-06-04 10:41:21', '2024-06-04 10:41:21');

-- --------------------------------------------------------

--
-- Structure for view `all_order_info`
--
DROP TABLE IF EXISTS `all_order_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `all_order_info`  AS SELECT `order_details`.`order_id` AS `order_id`, `order_details`.`product_name` AS `product_name`, `order_details`.`pdt_quantity` AS `pdt_quantity`, `order_details`.`amount` AS `amount`, `order_details`.`uses_coupon` AS `uses_coupon`, `users`.`user_firstname` AS `customer_name`, `order_details`.`Shipping_mobile` AS `Shipping_mobile`, `order_details`.`trans_id` AS `trans_id`, `order_details`.`shiping` AS `shiping_address`, `order_details`.`order_status` AS `order_status`, `order_details`.`order_time` AS `order_time`, `order_details`.`order_date` AS `order_date` FROM (`order_details` join `users`) WHERE `users`.`user_id` = `order_details`.`user_id` ;

-- --------------------------------------------------------

--
-- Structure for view `product_info_ctg`
--
DROP TABLE IF EXISTS `product_info_ctg`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `product_info_ctg`  AS SELECT `products`.`pdt_id` AS `pdt_id`, `products`.`pdt_name` AS `pdt_name`, `products`.`pdt_price` AS `pdt_price`, `products`.`pdt_des` AS `pdt_des`, `products`.`pdt_img` AS `pdt_img`, `products`.`product_stock` AS `product_stock`, `products`.`pdt_status` AS `pdt_status`, `catagory`.`ctg_id` AS `ctg_id`, `catagory`.`ctg_name` AS `ctg_name` FROM (`products` join `catagory`) WHERE `products`.`pdt_ctg` = `catagory`.`ctg_id` ;

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
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `catagory`
--
ALTER TABLE `catagory`
  MODIFY `ctg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cupon`
--
ALTER TABLE `cupon`
  MODIFY `cupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer_feedback`
--
ALTER TABLE `customer_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `header_info`
--
ALTER TABLE `header_info`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `order_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pdt_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `slider_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
