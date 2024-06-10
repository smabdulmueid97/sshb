-- Structure for view `all_order_info`
--
DROP TABLE IF EXISTS `all_order_info`;

CREATE VIEW `all_order_info` AS
SELECT 
  `order_details`.`order_id` AS `order_id`, 
  `order_details`.`product_name` AS `product_name`, 
  `order_details`.`pdt_quantity` AS `pdt_quantity`, 
  `order_details`.`amount` AS `amount`, 
  `order_details`.`uses_coupon` AS `uses_coupon`, 
  `users`.`user_firstname` AS `customer_name`, 
  `order_details`.`Shipping_mobile` AS `Shipping_mobile`, 
  `order_details`.`trans_id` AS `trans_id`, 
  `order_details`.`shiping` AS `shiping_address`, 
  `order_details`.`order_status` AS `order_status`, 
  `order_details`.`order_time` AS `order_time`, 
  `order_details`.`order_date` AS `order_date` 
FROM 
  `order_details` 
  JOIN `users` 
WHERE 
  `users`.`user_id` = `order_details`.`user_id`;

-- Structure for view `product_info_ctg`
--
DROP TABLE IF EXISTS `product_info_ctg`;

CREATE VIEW `product_info_ctg` AS
SELECT 
  `products`.`pdt_id` AS `pdt_id`, 
  `products`.`pdt_name` AS `pdt_name`, 
  `products`.`pdt_price` AS `pdt_price`, 
  `products`.`pdt_des` AS `pdt_des`, 
  `products`.`pdt_img` AS `pdt_img`, 
  `products`.`product_stock` AS `product_stock`, 
  `products`.`pdt_status` AS `pdt_status`, 
  `catagory`.`ctg_id` AS `ctg_id`, 
  `catagory`.`ctg_name` AS `ctg_name` 
FROM 
  `products` 
  JOIN `catagory` 
WHERE 
  `products`.`pdt_ctg` = `catagory`.`ctg_id`;
