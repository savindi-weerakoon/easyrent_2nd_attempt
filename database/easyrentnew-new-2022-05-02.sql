-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2022 at 04:43 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `easyrentnew`
--

-- --------------------------------------------------------

--
-- Table structure for table `bankslips`
--

CREATE TABLE `bankslips` (
  `id` int(255) NOT NULL,
  `bank_slip_url` varchar(255) NOT NULL DEFAULT '',
  `amout` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `parent_id`) VALUES
(1, 'Home appliance', 0),
(2, 'Party Items', 0),
(3, 'Technical equipment', 0),
(4, 'Kitchen equipment', 1),
(5, 'Home furnitures', 1),
(6, 'Garden items', 1),
(7, 'Wall decos', 2),
(8, 'Digital cameras', 3),
(9, 'Audio systems', 3);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `district_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `city`, `district_id`) VALUES
(0, 'Colombo', 1),
(2, 'Rajagiriya', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contactnumber`
--

CREATE TABLE `contactnumber` (
  `user_id` int(11) NOT NULL,
  `contact_number_id` int(11) NOT NULL,
  `contact_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `country_name`) VALUES
(1, 'Sri Lanka');

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
  `id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `district` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `district`
--

INSERT INTO `district` (`id`, `province_id`, `district`) VALUES
(1, 1, 'Colombo'),
(2, 1, 'Gampaha');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `post_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL DEFAULT '',
  `timestamp` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `image_id` int(11) NOT NULL,
  `display_order` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item_ratings`
--

CREATE TABLE `item_ratings` (
  `rate_id` int(100) NOT NULL,
  `post_id` int(100) DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
  `rate` varchar(255) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `reviewer` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paymettype`
--

CREATE TABLE `paymettype` (
  `paymet_id` int(255) NOT NULL,
  `paymet_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paymettype`
--

INSERT INTO `paymettype` (`paymet_id`, `paymet_type`) VALUES
(1, 'Bank Deposit'),
(2, 'Online Transfer'),
(3, 'ff');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `rent_type_id` int(11) NOT NULL,
  `avg_rate` varchar(255) DEFAULT '',
  `is_active` varchar(255) DEFAULT '',
  `published_time` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `Itemname` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `post_title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`post_id`, `user_id`, `price`, `content`, `city_id`, `rent_type_id`, `avg_rate`, `is_active`, `published_time`, `Itemname`, `category_id`, `district_id`, `post_title`) VALUES
(0, 1, '3000.00', 'This is a camera', 0, 1, '', '', NULL, 'Camera', 2, 2, 'Camera'),
(1, 1, '5000.00', 'table', 0, 2, '', '', NULL, 'Table', 1, 1, 'Table'),
(2, 1, '4500.00', 'chair', 0, 1, '', '', NULL, 'chair', 6, 1, 'chiair');

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

CREATE TABLE `province` (
  `id` int(11) NOT NULL,
  `province` varchar(255) DEFAULT '',
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `province`
--

INSERT INTO `province` (`id`, `province`, `country_id`) VALUES
(1, 'Western', 1),
(2, 'Southern', 1),
(3, 'Central', 1),
(4, 'North Western', 1),
(5, 'Sabaragamuwa', 1),
(6, 'North Central', 1),
(7, 'Eastern', 1),
(8, 'Uva', 1),
(9, 'Nothern', 1);

-- --------------------------------------------------------

--
-- Table structure for table `renttype`
--

CREATE TABLE `renttype` (
  `rent_type_id` int(11) NOT NULL,
  `rent_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `renttype`
--

INSERT INTO `renttype` (`rent_type_id`, `rent_type`) VALUES
(1, 'per day'),
(2, 'per duration');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `token` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `firstname`, `lastname`, `email`, `password`, `role_id`, `timestamp`, `token`, `phone`) VALUES
(29, 'Saman', 'Saman', 'Perera', 'saman@gmail.com', '12345', 1, '2022-05-01 16:18:13', '', '776789806');

-- --------------------------------------------------------

--
-- Table structure for table `userrate`
--

CREATE TABLE `userrate` (
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `rate_id` int(11) NOT NULL,
  `rate` varchar(255) DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `reviewer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userrate`
--

INSERT INTO `userrate` (`user_id`, `post_id`, `rate_id`, `rate`, `review`, `timestamp`, `reviewer`) VALUES
(1, 0, 1, '2', 'hhl', NULL, '2'),
(1, 0, 2, '2', 'hhl', NULL, '2'),
(1, 0, 3, '2', 'hhl', NULL, '2'),
(1, 0, 4, '2', 'hhl', NULL, '2'),
(1, 0, 5, '2', 'hhl', NULL, '2'),
(1, 0, 6, '2', 'hhl', NULL, '2'),
(1, 0, 7, '2', 'hhl', NULL, '2');

-- --------------------------------------------------------

--
-- Table structure for table `userrole`
--

CREATE TABLE `userrole` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bankslips`
--
ALTER TABLE `bankslips`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `parent_id_fk` (`parent_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `district_id_fk` (`district_id`);

--
-- Indexes for table `contactnumber`
--
ALTER TABLE `contactnumber`
  ADD PRIMARY KEY (`contact_number_id`,`user_id`),
  ADD KEY `user_id_fk` (`user_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`id`),
  ADD KEY `province_id_fk` (`province_id`),
  ADD KEY `district` (`district`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `post_id_fk` (`post_id`);

--
-- Indexes for table `item_ratings`
--
ALTER TABLE `item_ratings`
  ADD PRIMARY KEY (`rate_id`),
  ADD KEY `post_rate_fk` (`post_id`);

--
-- Indexes for table `paymettype`
--
ALTER TABLE `paymettype`
  ADD PRIMARY KEY (`paymet_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `user_fk` (`user_id`),
  ADD KEY `city_id_fk` (`city_id`),
  ADD KEY `rent_type_id_fk` (`rent_type_id`),
  ADD KEY `category_id_fk` (`category_id`);

--
-- Indexes for table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_id_fk` (`country_id`);

--
-- Indexes for table `renttype`
--
ALTER TABLE `renttype`
  ADD PRIMARY KEY (`rent_type_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `role_id_fk` (`role_id`);

--
-- Indexes for table `userrate`
--
ALTER TABLE `userrate`
  ADD PRIMARY KEY (`rate_id`),
  ADD KEY `post_fk` (`post_id`),
  ADD KEY `user_id_fk` (`user_id`);

--
-- Indexes for table `userrole`
--
ALTER TABLE `userrole`
  ADD PRIMARY KEY (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `item_ratings`
--
ALTER TABLE `item_ratings`
  MODIFY `rate_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `paymettype`
--
ALTER TABLE `paymettype`
  MODIFY `paymet_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `userrate`
--
ALTER TABLE `userrate`
  MODIFY `rate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `district_id_fk` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`);

--
-- Constraints for table `district`
--
ALTER TABLE `district`
  ADD CONSTRAINT `province_id_fk` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`);

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `post_id_fk` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`);

--
-- Constraints for table `item_ratings`
--
ALTER TABLE `item_ratings`
  ADD CONSTRAINT `post_rate_fk` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `city_id_fk` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `rent_type_id_fk` FOREIGN KEY (`rent_type_id`) REFERENCES `renttype` (`rent_type_id`);

--
-- Constraints for table `province`
--
ALTER TABLE `province`
  ADD CONSTRAINT `country_id_fk` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
