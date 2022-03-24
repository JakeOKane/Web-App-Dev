-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 24, 2022 at 04:58 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tesla dealership2`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `Customer ID` int(5) NOT NULL,
  `FName` varchar(20) NOT NULL,
  `LName` varchar(25) NOT NULL,
  `Address` varchar(40) NOT NULL,
  `Postcode` varchar(15) NOT NULL,
  `TelNo` int(10) NOT NULL,
  `Payment` varchar(10) NOT NULL,
  PRIMARY KEY (`Customer ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `Order ID` int(10) NOT NULL,
  `Customer ID` int(5) NOT NULL,
  `Product ID` int(5) NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`Order ID`),
  KEY `order_customer_fk` (`Customer ID`),
  KEY `order_product_fk` (`Product ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `Customer ID` int(5) NOT NULL,
  `Product ID` int(5) NOT NULL,
  `Product Desc` varchar(30) NOT NULL,
  `Rating` int(2) NOT NULL,
  `Reviews` varchar(255) NOT NULL,
  KEY `review_customer_fk` (`Customer ID`),
  KEY `review_product_fk` (`Product ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `Product ID` int(5) NOT NULL,
  `Product Desc` varchar(30) NOT NULL,
  `Quantity` int(20) NOT NULL,
  `Price` varchar(10) NOT NULL,
  PRIMARY KEY (`Product ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_customer_fk` FOREIGN KEY (`Customer ID`) REFERENCES `customer` (`Customer ID`),
  ADD CONSTRAINT `order_product_fk` FOREIGN KEY (`Product ID`) REFERENCES `stock` (`Product ID`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `review_customer_fk` FOREIGN KEY (`Customer ID`) REFERENCES `customer` (`Customer ID`),
  ADD CONSTRAINT `review_product_fk` FOREIGN KEY (`Product ID`) REFERENCES `stock` (`Product ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
