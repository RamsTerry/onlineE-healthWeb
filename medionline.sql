-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2021 at 06:35 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medionline`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `csrNo` int(11) NOT NULL,
  `employeeId` varchar(60) NOT NULL,
  `username` varchar(30) NOT NULL,
  `userpwd` varchar(30) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`csrNo`, `employeeId`, `username`, `userpwd`, `firstname`, `lastname`) VALUES
(1, 'realterry@gmail.com', 'Real Terry', 'passwords', 'Terry Khudani', 'Ramurebiwa');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cartNo` int(11) NOT NULL,
  `itemId` int(11) DEFAULT NULL,
  `itemName` varchar(100) DEFAULT NULL,
  `customerId` varchar(100) DEFAULT NULL,
  `numberofmedicine` varchar(100) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cartNo`, `itemId`, `itemName`, `customerId`, `numberofmedicine`, `quantity`, `price`) VALUES
(5, 0, NULL, NULL, NULL, 1, 0),
(6, 0, NULL, NULL, NULL, 1, 0),
(7, 0, NULL, NULL, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customerNo` int(11) NOT NULL,
  `customerId` varchar(60) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `userpwd` varchar(30) DEFAULT NULL,
  `firstname` varchar(30) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `postalCode` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customerNo`, `customerId`, `username`, `userpwd`, `firstname`, `lastname`, `address`, `city`, `postalCode`) VALUES
(5, 'viollah0119@gmail.com', 'NKHANGWELENI VIOLLAH MUDAU', 'passwords.....', 'NKHANGWELENI VIOLLAH', 'MUDAU', 'BLUE HILLS', 'MIDRAND', '1658'),
(6, 'realterryrams@gmail.com', 'Real Terry Rams', 'passwords.', 'Real Terry', 'Rams', 'BLUE HILLS', 'MIDRAND', '1658');

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

CREATE TABLE `medicines` (
  `itemId` int(11) NOT NULL,
  `itemName` varchar(50) NOT NULL,
  `category` varchar(10) NOT NULL,
  `numberofmedicine` varchar(5) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `content` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicines`
--

INSERT INTO `medicines` (`itemId`, `itemName`, `category`, `numberofmedicine`, `quantity`, `price`, `content`) VALUES
(16, 'paracetamol', 'Women', '35', 25, '50.00', 'Not recommended for anti&#8208;inflammatory use due to lack of\r\nproven benefit to that effect.'),
(17, 'morphine', 'Women', '55', 78, '60.00', ': 10 mg; 30 mg; 60 mg (morphine\r\nsulfate).'),
(18, 'deferoxamine', 'Women', '10', 25, '60.00', '500 mg (mesilate) in vial.'),
(19, 'amphotericin B', 'Men', '33', 25, '55.00', '50 mg in vial.\r\nAs deoxycholate or liposomal'),
(20, 'ferrous salt', 'Kids', '12', 25, '22.00', 'equivalent to 60 mg iron');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(11) NOT NULL,
  `itemId` int(11) DEFAULT NULL,
  `itemName` varchar(100) DEFAULT NULL,
  `customerId` varchar(100) DEFAULT NULL,
  `numberofmedicine` varchar(100) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `orderStatus` varchar(100) DEFAULT NULL,
  `orderdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderId`, `itemId`, `itemName`, `customerId`, `numberofmedicine`, `quantity`, `price`, `orderStatus`, `orderdate`) VALUES
(4, 14, NULL, 'viollah0119@gmail.com', '55', 1, 56, 'Order Placed', '2021-11-04'),
(5, 20, NULL, 'realterryrams@gmail.com', '12', 1, 22, 'Order Placed', '2021-11-05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`csrNo`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartNo`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customerNo`);

--
-- Indexes for table `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`itemId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `csrNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cartNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customerNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `medicines`
--
ALTER TABLE `medicines`
  MODIFY `itemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
