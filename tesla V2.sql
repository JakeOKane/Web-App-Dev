-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 11, 2022 at 09:35 AM
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
-- Database: `tesla`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `Customer ID` varchar(5) NOT NULL,
  `FName` varchar(20) NOT NULL,
  `LName` varchar(25) NOT NULL,
  `Address` varchar(40) NOT NULL,
  `Postcode` varchar(15) NOT NULL,
  `TelNo` int(10) NOT NULL,
  `Payment` varchar(10) NOT NULL,
  PRIMARY KEY (`Customer ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`Customer ID`, `FName`, `LName`, `Address`, `Postcode`, `TelNo`, `Payment`) VALUES
('C01', 'Jake ', 'O\'Kane ', '209 Parr Lane Bury', 'BL9 8JW', 1615008234, 'Cash'),
('C02', 'Calum ', 'McCallion', '4 Lupine Avenue Farnworth', 'BL40EP', 1204507416, 'Credit'),
('C03', 'Ronan', 'Kelly', '29 Webb Street Horwich', 'BL65NS', 1204861158, 'Debit'),
('C04', 'Andrew', 'Morgan', 'Breadmeadows Horrocks Road Turnton', 'BL70QJ', 120407002, 'Debit'),
('C05', 'Emmet ', 'Bloomer ', '1 Old Oak Cottages Hawkshw', 'BL84JB', 1294615144, 'Credit'),
('C06', 'Yuanhao', 'Chen', '15 Kingscourt Avenue Bolton', 'BL16EH', 1204351116, 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `Order ID` varchar(5) NOT NULL,
  `Customer ID` varchar(5) NOT NULL,
  `Product ID` varchar(5) NOT NULL,
  `Payment` varchar(10) NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`Order ID`),
  KEY `order_customer_fk` (`Customer ID`),
  KEY `order_product_fk` (`Product ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Order ID`, `Customer ID`, `Product ID`, `Payment`, `Date`) VALUES
('O01', 'C01', 'P03', 'Cash', '2022-04-06'),
('O02', 'C03', 'P01', 'Debit', '2022-04-01'),
('O03', 'C04', 'P03', 'Debit', '2022-04-01'),
('O04', 'C02', 'P02', 'Cash', '2022-04-10');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `Customer ID` varchar(5) NOT NULL,
  `Product ID` varchar(5) NOT NULL,
  `Product Desc` varchar(30) NOT NULL,
  `Rating` int(2) NOT NULL,
  `Reviews` varchar(255) NOT NULL,
  KEY `review_customer_fk` (`Customer ID`),
  KEY `review_product_id` (`Product ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`Customer ID`, `Product ID`, `Product Desc`, `Rating`, `Reviews`) VALUES
('C01', 'P03', 'Model X', 4, 'Great car! I love it and have no major complaints, its perfect for my needs and is great for the environment. '),
('C05', 'P01', 'Model S', 1, 'Was broken out of the Box!!!'),
('C06', 'P03', 'Model X', 3, 'Great car only complaint is it takes longer to charge than I expected');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `Product ID` varchar(5) NOT NULL,
  `Product Desc` varchar(30) NOT NULL,
  `Quantity` int(20) NOT NULL,
  `Price` varchar(10) NOT NULL,
  PRIMARY KEY (`Product ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`Product ID`, `Product Desc`, `Quantity`, `Price`) VALUES
('P01', 'Model S', 20, '£74.000'),
('P02', 'Model 3 ', 50, '£42.500'),
('P03', 'Model X', 35, '£82.000'),
('P04', 'Model Y', 40, '£55.000');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `order_customer_fk` FOREIGN KEY (`Customer ID`) REFERENCES `customers` (`Customer ID`),
  ADD CONSTRAINT `order_product_fk` FOREIGN KEY (`Product ID`) REFERENCES `stock` (`Product ID`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `review_customer_fk` FOREIGN KEY (`Customer ID`) REFERENCES `customers` (`Customer ID`),
  ADD CONSTRAINT `review_product_id` FOREIGN KEY (`Product ID`) REFERENCES `stock` (`Product ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
