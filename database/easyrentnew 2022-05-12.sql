-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2022 at 02:40 PM
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
  `name` varchar(255) NOT NULL DEFAULT '',
  `amout` varchar(255) NOT NULL DEFAULT '',
  `timestamp` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `reservation_id` int(11) DEFAULT NULL
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
  `district_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `city`, `district_id`) VALUES
(1, 'Colombo 1 : Colombo Fort (Kotuwa)', 1),
(2, 'Colombo 2 : Slave island (Kompannavidiya)', 1),
(3, 'Colombo 3 : Kollupitiya', 1),
(4, 'Colombo 4 : Bambalapitiya', 1),
(5, 'Colombo 5 : Narahenpita, Havelock Town , Kirulapona North', 1),
(6, 'Colombo 6 : Wellawatta, Pamankada, Kirulapona South', 1),
(7, 'Colombo 7 : Kurunduwatta', 1),
(8, 'Colombo 8 : Borella', 1),
(9, 'Colombo 9 : Dematagoda', 1),
(10, 'Colombo 10 : Maradana', 1),
(11, 'Colombo 11: Pettah (Pitakotuwa)', 1),
(12, 'Colombo 12:Aluthkade', 1),
(13, 'Colombo 13:Kotahena, Kochchikade', 1),
(14, 'Colombo 14:Grandpass', 1),
(15, 'Colombo 15:Mattakkuliya, Modara, Mutwal, Madampitiya', 1),
(16, 'Dehiwala', 1),
(17, 'Homagama', 1),
(18, 'Kaduwela', 1),
(19, 'Kesbewa', 1),
(20, 'Kolonnawa', 1),
(21, 'Kotte', 1),
(22, 'Maharagama', 1),
(23, 'Moratuwa', 1),
(24, 'Padukka', 1),
(25, 'Ratmalana', 1),
(26, 'Seethawaka', 1),
(27, 'Thimbirigasyaya', 1),
(28, 'Nugegoda', 1),
(29, 'Piliyandala', 1),
(30, 'Athurugiriya', 1),
(31, 'Kottawa ', 1),
(32, 'Malabe', 1),
(33, 'Battaramulla', 1),
(34, 'Rajagiriya', 1),
(35, 'Boralesgamuwa', 1),
(36, 'Thalawathugoda', 1),
(37, 'Pannipitiya', 1),
(38, 'Kohuwala', 1),
(39, 'Mount Lavinia', 1),
(40, 'Kotte', 1),
(41, 'Wellampitiya', 1),
(42, 'Angoda', 1),
(43, 'Nawala', 1),
(44, 'Padukka', 1),
(45, 'Avissawella', 1),
(46, 'Hanwella', 1),
(47, '', 2),
(48, 'Attanagalla', 2),
(49, 'Biyagama', 2),
(50, 'Divulapitiya', 2),
(51, 'Dompe', 2),
(52, 'Gampaha', 2),
(53, 'Ja-Ela', 2),
(54, 'Katana', 2),
(55, 'Kelaniya', 2),
(56, 'Mahara', 2),
(57, 'Minuwangoda', 2),
(58, 'Mirigama', 2),
(59, 'Negombo', 2),
(60, 'Wattala', 2),
(61, 'Kiribathgoda', 2),
(62, 'Kadawatha', 2),
(63, 'Delgoda', 2),
(64, 'Dompe', 2),
(65, 'Kirindiwela', 2),
(66, 'Nittambuwa', 2),
(67, 'Veyangoda', 2),
(68, 'Kandana', 2),
(69, 'Ragama', 2),
(70, 'Katunayake', 2),
(71, 'Ganemulla', 1);

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
(2, 1, 'Gampaha'),
(3, 1, 'Kaluthara'),
(5, 2, 'Galle'),
(6, 2, 'Hambanthota'),
(7, 2, 'Matara');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `timestamp` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `post_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `name`, `timestamp`, `post_id`) VALUES
(1, '1651994561311.jpeg', '2022-05-08 12:52:41', NULL),
(2, '1651994768960.jpeg', '2022-05-08 12:56:08', NULL),
(3, '1651995022389.jpeg', '2022-05-08 13:00:22', NULL),
(4, '1651997254894.jpeg', '2022-05-08 13:37:34', NULL),
(5, '1651997280830.jpeg', '2022-05-08 13:38:00', NULL),
(6, '1651997327347.jpeg', '2022-05-08 13:38:47', NULL),
(7, '1651997540333.jpeg', '2022-05-08 13:42:20', NULL),
(8, '1651997650904.jpeg', '2022-05-08 13:44:10', NULL),
(9, '1651997662085.jpeg', '2022-05-08 13:44:22', NULL),
(10, '1651997716049.jpeg', '2022-05-08 13:45:16', NULL),
(11, '1651997751402.jpeg', '2022-05-08 13:45:51', NULL),
(12, '1651997756776.jpeg', '2022-05-08 13:45:56', NULL),
(13, '1651997760635.jpeg', '2022-05-08 13:46:00', NULL),
(14, '1651998106795.jpeg', '2022-05-08 13:51:46', NULL),
(15, '1651998112210.jpeg', '2022-05-08 13:51:52', NULL),
(16, '1651998119206.jpeg', '2022-05-08 13:51:59', NULL),
(17, '1651998312739.jpeg', '2022-05-08 13:55:12', NULL),
(18, '1651998332841.jpeg', '2022-05-08 13:55:32', NULL),
(19, '1651998348101.jpeg', '2022-05-08 13:55:48', NULL),
(20, '1651998352867.jpeg', '2022-05-08 13:55:52', NULL),
(21, '1651998357464.jpeg', '2022-05-08 13:55:57', NULL),
(22, '1651998460540.jpeg', '2022-05-08 13:57:40', NULL),
(23, '1651998464163.jpeg', '2022-05-08 13:57:44', NULL),
(24, '1651998468637.jpeg', '2022-05-08 13:57:48', NULL),
(25, '1651998593906.jpeg', '2022-05-08 13:59:53', NULL),
(26, '1651998598485.jpeg', '2022-05-08 13:59:58', NULL),
(27, '1651998602443.jpeg', '2022-05-08 14:00:02', NULL),
(28, '1652074171508.jpeg', '2022-05-09 10:59:31', NULL),
(29, '1652074356216.jpeg', '2022-05-09 11:02:36', NULL),
(30, '1652076169326.jpeg', '2022-05-09 11:32:49', NULL),
(31, '1652076538641.jpeg', '2022-05-09 11:38:58', NULL),
(32, '1652076556771.jpeg', '2022-05-09 11:39:16', NULL),
(33, '1652076665450.jpeg', '2022-05-09 11:41:05', NULL),
(34, '1652076965115.jpeg', '2022-05-09 11:46:05', NULL),
(35, '1652077101117.jpeg', '2022-05-09 11:48:21', NULL),
(36, '1652077247145.jpeg', '2022-05-09 11:50:47', NULL);

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

--
-- Dumping data for table `item_ratings`
--

INSERT INTO `item_ratings` (`rate_id`, `post_id`, `review`, `rate`, `timestamp`, `reviewer`) VALUES
(1, 1, 'this is good', '5', NULL, 2),
(25, 1, 'good so much', '2', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `renter_id` int(11) DEFAULT NULL,
  `tenant_id` int(11) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_complete` varchar(255) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `payment_reference_id` int(11) DEFAULT NULL,
  `paid_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `post_id`, `renter_id`, `tenant_id`, `amount`, `status`, `is_complete`, `timestamp`, `payment_reference_id`, `paid_at`) VALUES
(1, 1, 1, 3, '100', '1', '1', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `paymenttype`
--

CREATE TABLE `paymenttype` (
  `paymant_id` int(255) NOT NULL,
  `paymant_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paymenttype`
--

INSERT INTO `paymenttype` (`paymant_id`, `paymant_type`) VALUES
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
  `avg_rate` decimal(10,0) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT '',
  `published_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `category_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `post_title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`post_id`, `user_id`, `price`, `content`, `city_id`, `rent_type_id`, `avg_rate`, `is_active`, `published_time`, `category_id`, `district_id`, `post_title`) VALUES
(1, 1, '100.00', 'caamera', 1, 2, '1', '1', '0000-00-00 00:00:00', 1, 2, 'camera'),
(2, 1, '2000.00', 'camera', 2, 1, '2', '2', '2022-05-07 23:00:43', 2, 4, 'camera'),
(3, 2, '3000.00', 'camera', 3, 1, '4', '1', '0000-00-00 00:00:00', 5, 3, 'camera'),
(4, 3, '5000.00', 'calculator', 6, 2, '5', '2', '0000-00-00 00:00:00', 3, 6, 'calculator');

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
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `renter_id` int(11) NOT NULL,
  `tenant_id` int(11) NOT NULL,
  `reservation_state` int(11) NOT NULL DEFAULT 1,
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`id`, `renter_id`, `tenant_id`, `reservation_state`, `from_date`, `to_date`, `post_id`) VALUES
(20, 30, 2, 1, '2022-05-05 00:00:00', '2022-05-07 00:00:00', 1),
(21, 30, 2, 1, '2022-05-09 00:00:00', '2022-05-11 00:00:00', 1),
(22, 30, 2, 1, '2022-05-09 00:00:00', '2022-05-11 00:00:00', 1),
(23, 30, 2, 1, '2022-05-16 00:00:00', '2022-05-17 00:00:00', 1),
(24, 30, 2, 1, '2022-05-18 00:00:00', '2022-05-19 00:00:00', 1),
(25, 30, 2, 1, '2022-05-21 00:00:00', '2022-05-22 00:00:00', 1),
(26, 30, 2, 1, '2022-05-24 00:00:00', '2022-05-25 00:00:00', 1),
(27, 30, 2, 1, '2022-05-27 00:00:00', '2022-05-28 00:00:00', 1);

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
  `phone` varchar(255) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `firstname`, `lastname`, `email`, `password`, `role_id`, `timestamp`, `token`, `phone`, `image_id`) VALUES
(1, 'amal', 'amal', 'perera', 'wee@gmail.com', '55', 2, '2022-05-09 19:28:03', '2a81c013c81c019800846c428c24bf6459e7d7bf', '556789000', NULL),
(29, '', 'Savindi', 'Weerakoon', 'savindidweerakoon@gmail.com', '12345', 1, '2022-05-09 11:51:25', '', '12345678', 36),
(30, 'savindi', 'savindi', 'wee', 'wee@gmail.com', 'b59c67bf196a4758191e42f76670ceba', 0, '2022-05-11 18:46:49', 'fa9b5df16e1d75e7c574f0b33f87e524b62a3db7', '344444444', NULL);

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
(1, 0, 7, '2', 'hhl', NULL, '2'),
(2, 0, 8, '1', '', NULL, '5'),
(2, 0, 9, '1', '', NULL, '5'),
(2, 0, 10, '1', '', NULL, '5'),
(2, 0, 11, '1', '', NULL, '5'),
(2, 0, 12, '5', 'xxxxsdref', NULL, '5'),
(2, 0, 13, '5', 'xxxxsdref', NULL, '5');

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_ratings`
--
ALTER TABLE `item_ratings`
  ADD PRIMARY KEY (`rate_id`),
  ADD KEY `post_rate_fk` (`post_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paymenttype`
--
ALTER TABLE `paymenttype`
  ADD PRIMARY KEY (`paymant_id`);

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
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `district`
--
ALTER TABLE `district`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `item_ratings`
--
ALTER TABLE `item_ratings`
  MODIFY `rate_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `paymenttype`
--
ALTER TABLE `paymenttype`
  MODIFY `paymant_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `province`
--
ALTER TABLE `province`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `userrate`
--
ALTER TABLE `userrate`
  MODIFY `rate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `rent_type_id_fk` FOREIGN KEY (`rent_type_id`) REFERENCES `renttype` (`rent_type_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
