-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 16, 2026 at 04:52 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `store_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `governorates`
--

CREATE TABLE `governorates` (
  `governorates_id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `governorates`
--

INSERT INTO `governorates` (`governorates_id`, `name`) VALUES
(3, 'Alexandria'),
(5, 'Aswan'),
(1, 'Cairo'),
(2, 'Giza'),
(4, 'Luxor');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `products_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `product_code` varchar(100) NOT NULL,
  `price` decimal(2,0) NOT NULL,
  `describtion` text DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`products_id`, `name`, `product_code`, `price`, `describtion`, `supplier_id`) VALUES
(2, 'Rice', 'R001', 45, 'Long-grain rice, 1 kg', 6),
(3, 'Coffee', 'C001', 85, 'Ground coffee, 250 g', 7),
(4, 'Dish Soap', 'D001', 33, 'Lemon dishwashing liquid, 500 ml', 8),
(5, 'Orange Juice', 'J001', 28, 'Orange juice, 1 liter', 9);

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `store_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `address` varchar(300) NOT NULL,
  `products_id` int(11) DEFAULT NULL,
  `governorates_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`store_id`, `name`, `address`, `products_id`, `governorates_id`) VALUES
(1, 'Nile Valley Market', '18 Garden Street, Giza, Egypt', 2, 2),
(2, 'Delta Daily Goods', '27 Canal Road, Mansoura, Egypt', 3, 4),
(3, 'Red Sea Supplies', '9 Marina Avenue, Hurghada, Egypt', 4, 1),
(4, 'Capital Corner Shop', '33 Olive Street, Nasr City, Cairo, Egypt', 5, 1),
(5, 'Alexandria Harbor Goods', '45 Lighthouse Road, Sidi Gaber, Alexandria', 2, 3),
(6, 'Luxor Palm Supplies', '8 Temple Garden Lane, Luxor, Egypt', 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` int(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `brief_data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `name`, `phone`, `email`, `brief_data`) VALUES
(6, 'Delta Wholesale', 1023456789, 'info@deltawholesale.example', 'Packaged foods'),
(7, 'Cairo General Supply', 1134567890, 'sales@cairogeneral.example', 'Cleaning and household goods'),
(8, 'Alexandria Trade Co', 1245678901, 'contact@alextrade.example', 'Personal care products'),
(9, 'Upper Egypt Distributors', 1556789012, 'hello@uedistributors.example', 'Drinks and snacks'),
(10, 'Nile Supplies', 1012345678, 'contact@nilesupplies.example', 'Food and household products');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `governorates`
--
ALTER TABLE `governorates`
  ADD PRIMARY KEY (`governorates_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`products_id`),
  ADD UNIQUE KEY `product_code` (`product_code`),
  ADD UNIQUE KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`store_id`),
  ADD KEY `product_store` (`products_id`),
  ADD KEY `g_st` (`governorates_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `governorates`
--
ALTER TABLE `governorates`
  MODIFY `governorates_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `products_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `suppliers_and_products` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`);

--
-- Constraints for table `store`
--
ALTER TABLE `store`
  ADD CONSTRAINT `g_st` FOREIGN KEY (`governorates_id`) REFERENCES `governorates` (`governorates_id`),
  ADD CONSTRAINT `product_store` FOREIGN KEY (`products_id`) REFERENCES `products` (`products_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
