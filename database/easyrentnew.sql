-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2022 at 07:02 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `city_id` int(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `district_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `district_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `district` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `district`
--

INSERT INTO `district` (`district_id`, `province_id`, `district`) VALUES
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
-- Table structure for table `itemrate`
--

CREATE TABLE `itemrate` (
  `rate_give_user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `rate_id` int(255) NOT NULL,
  `review` varchar(255) DEFAULT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `rate` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `parent_categories`
--

CREATE TABLE `parent_categories` (
  `parent_category_id` int(11) NOT NULL,
  `paret_category_name` varchar(255) DEFAULT NULL
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
  `parent_category_id` int(11) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `rent_type_id` int(11) NOT NULL,
  `avg_rate` varchar(255) DEFAULT '',
  `is-active` varchar(255) DEFAULT NULL,
  `pulished_time` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

CREATE TABLE `province` (
  `provice_id` int(11) NOT NULL,
  `provice` varchar(255) DEFAULT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `province`
--

INSERT INTO `province` (`provice_id`, `provice`, `country_id`) VALUES
(1, 'Western', 1),
(2, 'Southern', 1);

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
(5, 'amal', 'kamal', 'amal', 'amal@gmail.com', '123e4', 0, '2021-09-25 01:17:43', '', '776287978'),
(6, 'amal', 'kamal', 'amal', 'amal@gmail.com', '123e4', 0, '2021-09-25 01:18:21', '', '776287978'),
(7, 'scsaqq', 'kamal', 'amal', 'amal@gmail.com', 'b552ddea2667f1a60b7fd2d2bbbb5907', 0, '2021-10-13 00:39:29', '', '776287978');

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
  `timestamp` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  ADD PRIMARY KEY (`city_id`),
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
  ADD PRIMARY KEY (`district_id`),
  ADD KEY `province_id_fk` (`province_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `post_id_fk` (`post_id`);

--
-- Indexes for table `itemrate`
--
ALTER TABLE `itemrate`
  ADD PRIMARY KEY (`rate_id`),
  ADD KEY `rate_give_user_id` (`rate_give_user_id`);

--
-- Indexes for table `parent_categories`
--
ALTER TABLE `parent_categories`
  ADD PRIMARY KEY (`parent_category_id`);

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
  ADD KEY `parent_category_id_fk` (`parent_category_id`);

--
-- Indexes for table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`provice_id`),
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
  ADD KEY `post_fk` (`post_id`);

--
-- Indexes for table `userrole`
--
ALTER TABLE `userrole`
  ADD PRIMARY KEY (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `paymettype`
--
ALTER TABLE `paymettype`
  MODIFY `paymet_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `parent_id_fk` FOREIGN KEY (`parent_id`) REFERENCES `parent_categories` (`parent_category_id`);

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `district_id_fk` FOREIGN KEY (`district_id`) REFERENCES `district` (`district_id`);

--
-- Constraints for table `district`
--
ALTER TABLE `district`
  ADD CONSTRAINT `province_id_fk` FOREIGN KEY (`province_id`) REFERENCES `province` (`provice_id`);

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `post_id_fk` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `city_id_fk` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`),
  ADD CONSTRAINT `parent_category_id_fk` FOREIGN KEY (`parent_category_id`) REFERENCES `parent_categories` (`parent_category_id`),
  ADD CONSTRAINT `rent_type_id_fk` FOREIGN KEY (`rent_type_id`) REFERENCES `renttype` (`rent_type_id`);

--
-- Constraints for table `province`
--
ALTER TABLE `province`
  ADD CONSTRAINT `country_id_fk` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`);

--
-- Constraints for table `userrate`
--
ALTER TABLE `userrate`
  ADD CONSTRAINT `post_fk` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
