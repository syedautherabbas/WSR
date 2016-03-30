-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2016 at 11:37 PM
-- Server version: 5.6.25
-- PHP Version: 5.6.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `masterdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `userid` varchar(10) NOT NULL,
  `password` varchar(100) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Role` varchar(10) NOT NULL,
  `uniqno` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`userid`, `password`, `Email`, `Role`, `uniqno`) VALUES
('ather', '1088', 'syedautherabbas@gmail.com', 'Admin', 1),
('rehan', '9118', 'syedrehansiddique@gmail.com', 'user', 2),
('shadab', '9.896500405783799', 'ausshadu@gmail.com', 'user', 3),
('babitha', '1212', 'babitha0912@gmail.com', 'supplier', 5),
('gouthami', '9.962718130398168', 'gouthamisp@gmail.com', '', 6),
('kavana', '2.6184552531794534', 'kavanabhaskar@gmail.com ', '', 7);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `orderid` int(15) NOT NULL,
  `productid` varchar(15) NOT NULL,
  `productname` varchar(15) NOT NULL,
  `supplier` varchar(15) NOT NULL,
  `username` varchar(15) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `approval_flag` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderid`, `productid`, `productname`, `supplier`, `username`, `time`, `approval_flag`) VALUES
(1, '2', 'Blanket', 'wimno', 'rehan', '2015-06-17 16:07:26', 2),
(2, '5', 'Gamla', 'JoeBlack', 'rehan', '2015-06-17 16:07:46', 2),
(3, '4', 'Vimla', 'Ermengildo', 'rehan', '2015-06-17 16:10:34', 0),
(4, '4', 'Basna', 'Ermengildo', 'rehan', '2015-06-17 16:21:09', 0),
(5, '3', 'Bingi', 'Haji VAnishers ', 'rehan', '2015-06-17 16:50:57', 1),
(6, '4', 'Suits', 'Tefna', 'rehan', '2015-06-17 16:56:02', 1),
(7, '2', 'Bags', 'cena', 'rehan', '2015-06-19 11:10:28', 1),
(8, '2', 'Bags', 'Yano', 'ather', '2015-06-19 11:48:04', 1),
(9, '6', 'Glasses', 'batte', 'ather', '2015-06-19 11:48:25', 2),
(10, '5', 'Ties', 'RayBan', 'ather', '2015-06-19 14:11:52', 0),
(11, '6', 'Glasses', 'yatte', 'bob', '2016-02-23 19:32:13', 0);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `productid` int(10) NOT NULL,
  `productname` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productid`, `productname`) VALUES
(1, 'Watch'),
(2, 'Bags'),
(3, 'Shoes'),
(4, 'Suits'),
(5, 'Ties'),
(6, 'Glasses');

-- --------------------------------------------------------

--
-- Table structure for table `pulldown`
--

CREATE TABLE IF NOT EXISTS `pulldown` (
  `id` int(4) NOT NULL,
  `supplier` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pulldown`
--

INSERT INTO `pulldown` (`id`, `supplier`) VALUES
(1, 'Bono'),
(2, 'Yano'),
(2, 'wimno'),
(2, 'cena'),
(3, 'Haji VAnishers '),
(4, 'Vaccum cleaners'),
(3, 'blah1'),
(3, 'blah2'),
(3, 'blah3'),
(3, 'blah4'),
(4, 'Ermengildo'),
(4, 'Tefna'),
(5, 'RayBan'),
(5, 'JoeBlack'),
(6, 'yette'),
(6, 'batte');

-- --------------------------------------------------------

--
-- Table structure for table `sroles`
--

CREATE TABLE IF NOT EXISTS `sroles` (
  `id` int(6) NOT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sroles`
--

INSERT INTO `sroles` (`id`, `role`) VALUES
(3, 'admin'),
(4, 'moderator');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE IF NOT EXISTS `supplier` (
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `susers`
--

CREATE TABLE IF NOT EXISTS `susers` (
  `id` int(6) NOT NULL,
  `login` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `susers`
--

INSERT INTO `susers` (`id`, `login`, `password`) VALUES
(1, 'ather', '1234'),
(2, 'rehan', '4567');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE IF NOT EXISTS `teams` (
  `id` int(10) NOT NULL,
  `name` varchar(15) NOT NULL,
  `rating` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `rating`) VALUES
(1, 'ather', 11),
(2, 'rehan', 2),
(3, 'muheed', 8),
(5, 'shadab', 10),
(7, 'Naidistey', 1),
(8, 'baigan', 12);

-- --------------------------------------------------------

--
-- Table structure for table `udetails`
--

CREATE TABLE IF NOT EXISTS `udetails` (
  `uid` int(10) NOT NULL,
  `upassword` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `udetails`
--

INSERT INTO `udetails` (`uid`, `upassword`) VALUES
(1, '1'),
(2, '1234');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(10) NOT NULL,
  `username` varchar(10) NOT NULL,
  `age` int(10) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `phone` int(20) NOT NULL,
  `Role` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `username`, `age`, `mail`, `phone`, `Role`) VALUES
(1, 'kaka', 24, 'kaka@baka.com', 654654654, 'admin'),
(2, 'ather', 23, 'syedautherabbas@gmail.com', 2147483647, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` int(6) NOT NULL,
  `role_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(1, 3),
(2, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`uniqno`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderid`);

--
-- Indexes for table `sroles`
--
ALTER TABLE `sroles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `susers`
--
ALTER TABLE `susers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD KEY `user` (`user_id`),
  ADD KEY `role` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `uniqno` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderid` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `sroles`
--
ALTER TABLE `sroles`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `susers`
--
ALTER TABLE `susers`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `role` FOREIGN KEY (`role_id`) REFERENCES `sroles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `susers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
