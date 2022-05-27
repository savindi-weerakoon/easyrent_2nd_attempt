-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2022 at 09:35 PM
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
-- Database: `easyrent`
--
CREATE DATABASE IF NOT EXISTS `easyrent` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `easyrent`;

-- --------------------------------------------------------

--
-- Table structure for table `bank_slips`
--

CREATE TABLE `bank_slips` (
  `id` int(11) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `timestamp` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bank_slips`
--

INSERT INTO `bank_slips` (`id`, `image_url`, `timestamp`) VALUES
(18, '1620110942336.jpg', '2021-05-04 12:19:02'),
(19, '1620110977931.jpg', '2021-05-04 12:19:37'),
(20, '1620111375883.jpg', '2021-05-04 12:26:15'),
(21, '1621581453431.jpg', '2021-05-21 12:47:33');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL DEFAULT '',
  `parent_category_id` int(11) DEFAULT NULL,
  `timestamp` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `parent_category_id`, `timestamp`) VALUES
(1, 'home equipment', NULL, '2021-04-14 18:09:00'),
(2, 'party items', NULL, '2021-04-14 18:08:57'),
(3, 'kitchen equipment', 1, '2021-04-14 18:09:37'),
(4, 'garden equipment', 1, '2021-04-14 18:09:54'),
(5, 'grass cutter', 4, '2021-04-14 19:50:37'),
(6, 'technical equipment', NULL, '2021-05-03 00:38:14'),
(7, 'construction equipment', NULL, '2021-05-04 10:54:20');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `district_id` int(11) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `district_id`, `city`) VALUES
(1, 1, 'Colombo 1 : Colombo Fort (Kotuwa)'),
(2, 1, 'Colombo 2 : Slave island (Kompannavidiya)'),
(3, 1, 'Colombo 3 : Kollupitiya'),
(4, 1, 'Colombo 4 : Bambalapitiya'),
(5, 1, 'Colombo 5 : Narahenpita, Havelock Town , Kirulapona North'),
(6, 1, 'Colombo 6 : Wellawatta, Pamankada, Kirulapona South'),
(7, 1, 'Colombo 7 : Kurunduwatta'),
(8, 1, 'Colombo 8 : Borella'),
(9, 1, 'Colombo 9 : Dematagoda'),
(10, 1, 'Colombo 10 : Maradana'),
(11, 1, 'Colombo 11: Pettah (Pitakotuwa)'),
(12, 1, 'Colombo 12:Aluthkade'),
(13, 1, 'Colombo 13:Kotahena, Kochchikade'),
(14, 1, 'Colombo 14:Grandpass'),
(15, 1, 'Colombo 15:Mattakkuliya, Modara, Mutwal, Madampitiya'),
(16, 1, 'Dehiwala'),
(17, 1, 'Homagama'),
(18, 1, 'Kaduwela'),
(19, 1, 'Kesbewa'),
(20, 1, 'Kolonnawa'),
(21, 1, 'Kotte'),
(22, 1, 'Maharagama'),
(23, 1, 'Moratuwa'),
(24, 1, 'Padukka'),
(25, 1, 'Ratmalana'),
(26, 1, 'Seethawaka'),
(27, 1, 'Thimbirigasyaya'),
(28, 1, 'Nugegoda'),
(29, 1, 'Piliyandala'),
(30, 1, 'Athurugiriya'),
(31, 1, 'Kottawa '),
(32, 1, 'Malabe'),
(33, 1, 'Battaramulla'),
(34, 1, 'Rajagiriya'),
(35, 1, 'Boralesgamuwa'),
(36, 1, 'Thalawathugoda'),
(37, 1, 'Pannipitiya'),
(38, 1, 'Kohuwala'),
(39, 1, 'Mount Lavinia'),
(40, 1, 'Kotte'),
(41, 1, 'Wellampitiya'),
(42, 1, 'Angoda'),
(43, 1, 'Nawala'),
(44, 1, 'Padukka'),
(45, 1, 'Avissawella'),
(46, 1, 'Hanwella'),
(47, 2, 'Attanagalla'),
(48, 2, 'Biyagama'),
(49, 2, 'Divulapitiya'),
(50, 2, 'Dompe'),
(51, 2, 'Gampaha'),
(52, 2, 'Ja-Ela'),
(53, 2, 'Katana'),
(54, 2, 'Kelaniya'),
(55, 2, 'Mahara'),
(56, 2, 'Minuwangoda'),
(57, 2, 'Mirigama'),
(58, 2, 'Negombo'),
(59, 2, 'Wattala'),
(60, 2, 'Kiribathgoda'),
(61, 2, 'Kadawatha'),
(62, 2, 'Delgoda'),
(63, 2, 'Dompe'),
(64, 2, 'Kirindiwela'),
(65, 2, 'Nittambuwa'),
(66, 2, 'Veyangoda'),
(67, 2, 'Kandana'),
(68, 2, 'Ragama'),
(69, 2, 'Katunayake'),
(70, 2, 'Ganemulla'),
(71, 2, 'Peliyagoda'),
(72, 2, 'Yakkala'),
(73, 3, 'Agalawatta'),
(74, 3, 'Bandaragama'),
(75, 3, 'Beruwala'),
(76, 3, 'Bulathsinhala'),
(77, 3, 'Dodangoda'),
(78, 3, 'Horana'),
(79, 3, 'Ingiriya'),
(80, 3, 'Kalutara'),
(81, 3, 'Madurawela'),
(82, 3, 'Mathugama'),
(83, 3, 'Millaniya'),
(84, 3, 'Palindanuwara'),
(85, 3, 'Panadura'),
(86, 3, 'Walallavita'),
(87, 3, 'Wadduwa'),
(88, 3, 'Aluthgama'),
(89, 4, 'Akurana'),
(90, 4, 'Delthota'),
(91, 4, 'Doluwa'),
(92, 4, 'Ganga Ihala Korale'),
(93, 4, 'Harispattuwa'),
(94, 4, 'Hatharaliyadda'),
(95, 4, 'Kandy'),
(96, 4, 'Kundasale'),
(97, 4, 'Medadumbara'),
(98, 4, 'Minipe'),
(99, 4, 'Panvila'),
(100, 4, 'Pasbage Korale'),
(101, 4, 'Pathadumbara'),
(102, 4, 'Pathahewaheta'),
(103, 4, 'Poojapitiya'),
(104, 4, 'Thumpane'),
(105, 4, 'Udadumbara'),
(106, 4, 'Udapalatha'),
(107, 4, 'Udunuwara'),
(108, 4, 'Yatinuwara'),
(109, 4, 'Katugastota'),
(110, 4, 'Gampola'),
(111, 4, 'Peradeniya'),
(112, 4, 'Pilimathalawa'),
(113, 4, 'Digana'),
(114, 4, 'Gelioya'),
(115, 4, 'Nawalapitiya'),
(116, 4, 'Galagedara'),
(117, 4, 'Kadugannawa'),
(118, 4, 'Wattegama'),
(119, 4, 'Ampitiya'),
(120, 4, 'Madawala Bazaar'),
(121, 5, 'Ambanganga Korale'),
(122, 5, 'Dambulla'),
(123, 5, 'Galewela'),
(124, 5, 'Laggala-Pallegama'),
(125, 5, 'Matale'),
(126, 5, 'Naula'),
(127, 5, 'Pallepola'),
(128, 5, 'Rattota'),
(129, 5, 'Ukuwela'),
(130, 5, 'Wilgamuwa'),
(131, 5, 'Yatawatta'),
(132, 5, 'Sigiriya'),
(133, 5, 'Palapathwela'),
(134, 6, 'Ambagamuwa'),
(135, 6, 'Hanguranketha'),
(136, 6, 'Kothmale'),
(137, 6, 'Nuwara Eliya'),
(138, 6, 'Walapane'),
(139, 6, 'Hatton'),
(140, 6, 'Madulla'),
(141, 6, 'Ginigathhena'),
(142, 7, 'Alawwa'),
(143, 7, 'Ambanpola'),
(144, 7, 'Bamunakotuwa'),
(145, 7, 'Bingiriya'),
(146, 7, 'Ehetuwewa'),
(147, 7, 'Galgamuwa'),
(148, 7, 'Ganewatta'),
(149, 7, 'Giribawa'),
(150, 7, 'Ibbagamuwa'),
(151, 7, 'Katupotha'),
(152, 7, 'Kobeigane'),
(153, 7, 'Kotavehera'),
(154, 7, 'Kuliyapitiya East'),
(155, 7, 'Kuliyapitiya West'),
(156, 7, 'Kurunegala'),
(157, 7, 'Mahawa'),
(158, 7, 'Mallawapitiya'),
(159, 7, 'Maspotha'),
(160, 7, 'Mawathagama'),
(161, 7, 'Narammala'),
(162, 7, 'Nikaweratiya'),
(163, 7, 'Panduwasnuwara'),
(164, 7, 'Pannala'),
(165, 7, 'Polgahawela'),
(166, 7, 'Polpithigama'),
(167, 7, 'Rasnayakapura'),
(168, 7, 'Rideegama'),
(169, 7, 'Udubaddawa'),
(170, 7, 'Wariyapola'),
(171, 7, 'Weerambugedara'),
(172, 7, 'Hettipola'),
(173, 7, 'Giriulla'),
(174, 8, 'Anamaduwa'),
(175, 8, 'Arachchikattuwa'),
(176, 8, 'Chilaw'),
(177, 8, 'Dankotuwa'),
(178, 8, 'Kalpitiya'),
(179, 8, 'Karuwalagaswewa'),
(180, 8, 'Madampe'),
(181, 8, 'Mahakumbukkadawala'),
(182, 8, 'Mahawewa'),
(183, 8, 'Mundalama'),
(184, 8, 'Nattandiya'),
(185, 8, 'Nawagattegama'),
(186, 8, 'Pallama'),
(187, 8, 'Puttalam'),
(188, 8, 'Vanathavilluwa'),
(189, 8, 'Wennappuwa'),
(190, 8, 'Marawila'),
(191, 9, 'Akmeemana'),
(192, 9, 'Ambalangoda'),
(193, 9, 'Baddegama'),
(194, 9, 'Balapitiya'),
(195, 9, 'Benthota'),
(196, 9, 'Bope-Poddala'),
(197, 9, 'Elpitiya'),
(198, 9, 'Galle'),
(199, 9, 'Gonapinuwala'),
(200, 9, 'Habaraduwa'),
(201, 9, 'Hikkaduwa'),
(202, 9, 'Imaduwa'),
(203, 9, 'Karandeniya'),
(204, 9, 'Nagoda'),
(205, 9, 'Neluwa'),
(206, 9, 'Niyagama'),
(207, 9, 'Thawalama'),
(208, 9, 'Welivitiya-Divithura'),
(209, 9, 'Yakkalamulla'),
(210, 9, 'Karapitiya'),
(211, 9, 'Ahangama'),
(212, 9, 'Batapola'),
(213, 10, 'Ambalantota'),
(214, 10, 'Angunakolapelessa'),
(215, 10, 'Beliatta'),
(216, 10, 'Hambantota'),
(217, 10, 'Katuwana'),
(218, 10, 'Lunugamvehera'),
(219, 10, 'Okewela'),
(220, 10, 'Sooriyawewa'),
(221, 10, 'Tangalle'),
(222, 10, 'Thissamaharama'),
(223, 10, 'Walasmulla'),
(224, 10, 'Weeraketiya'),
(225, 11, 'Akuressa'),
(226, 11, 'Athuraliya'),
(227, 11, 'Devinuwara'),
(228, 11, 'Dickwella'),
(229, 11, 'Hakmana'),
(230, 11, 'Kamburupitiya'),
(231, 11, 'Kirinda Puhulwella'),
(232, 11, 'Kotapola'),
(233, 11, 'Malimbada'),
(234, 11, 'Matara'),
(235, 11, 'Mulatiyana'),
(236, 11, 'Pasgoda'),
(237, 11, 'Pitabeddara'),
(238, 11, 'Thihagoda'),
(239, 11, 'Weligama'),
(240, 11, 'Welipitiya'),
(241, 11, 'Deniyaya'),
(242, 11, 'Kamburugamuwa'),
(243, 11, 'Kakannadurra'),
(244, 12, 'Ayagama'),
(245, 12, 'Balangoda'),
(246, 12, 'Eheliyagoda'),
(247, 12, 'Elapattha'),
(248, 12, 'Embilipitiya'),
(249, 12, 'Godakawela'),
(250, 12, 'Imbulpe'),
(251, 12, 'Kahawatta'),
(252, 12, 'Kalawana'),
(253, 12, 'Kiriella'),
(254, 12, 'Kolonna'),
(255, 12, 'Kuruvita'),
(256, 12, 'Nivithigala'),
(257, 12, 'Opanayaka'),
(258, 12, 'Pelmadulla'),
(259, 12, 'Ratnapura'),
(260, 12, 'Weligepola'),
(261, 13, 'Aranayaka'),
(262, 13, 'Bulathkohupitiya'),
(263, 13, 'Dehiowita'),
(264, 13, 'Deraniyagala'),
(265, 13, 'Galigamuwa'),
(266, 13, 'Kegalle'),
(267, 13, 'Mawanella'),
(268, 13, 'Rambukkana'),
(269, 13, 'Ruwanwella'),
(270, 13, 'Warakapola'),
(271, 13, 'Yatiyanthota'),
(272, 13, 'Kitulgala'),
(273, 14, 'Galnewa'),
(274, 14, 'Galenbindunuwewa'),
(275, 14, 'Horowpothana'),
(276, 14, 'Ipalogama'),
(277, 14, 'Kahatagasdigiliya'),
(278, 14, 'Kebithigollewa'),
(279, 14, 'Kekirawa'),
(280, 14, 'Mahavilachchiya'),
(281, 14, 'Medawachchiya'),
(282, 14, 'Mihinthale'),
(283, 14, 'Nachchadoowa'),
(284, 14, 'Nochchiyagama'),
(285, 14, 'Nuwaragam Palatha Central'),
(286, 14, 'Nuwaragam Palatha East'),
(287, 14, 'Padaviya'),
(288, 14, 'Palagala'),
(289, 14, 'Palugaswewa'),
(290, 14, 'Rajanganaya'),
(291, 14, 'Rambewa'),
(292, 14, 'Thalawa'),
(293, 14, 'Thambuttegama'),
(294, 14, 'Thirappane'),
(295, 14, 'Anuradhapura'),
(296, 14, 'Eppawala'),
(297, 14, 'Habarana'),
(298, 15, 'Dimbulagala'),
(299, 15, 'Elahera'),
(300, 15, 'Hingurakgoda'),
(301, 15, 'Lankapura'),
(302, 15, 'Medirigiriya'),
(303, 15, 'Thamankaduwa'),
(304, 15, 'Welikanda'),
(305, 15, 'Polonnaruwa'),
(306, 16, 'Addalachchenai'),
(307, 16, 'Akkaraipattu'),
(308, 16, 'Alayadiwembu'),
(309, 16, 'Ampara'),
(310, 16, 'Damana'),
(311, 16, 'Dehiattakandiya'),
(312, 16, 'Eragama'),
(313, 16, 'Kalmunai '),
(314, 16, 'Karaitivu'),
(315, 16, 'Lahugala'),
(316, 16, 'Mahaoya'),
(317, 16, 'Navithanveli'),
(318, 16, 'Ninthavur'),
(319, 16, 'Padiyathalawa'),
(320, 16, 'Pothuvil'),
(321, 16, 'Sainthamarathu'),
(322, 16, 'Samanthurai'),
(323, 16, 'Thirukkovil'),
(324, 16, 'Uhana'),
(325, 17, 'Eravur Pattu'),
(326, 17, 'Eravur Town'),
(327, 17, 'Kattankudy'),
(328, 17, 'Koralai Pattu'),
(329, 17, 'Manmunai '),
(330, 17, 'Porativu Pattu'),
(331, 17, 'Batticaloa'),
(332, 18, 'Gomarankadawala'),
(333, 18, 'Kantalai'),
(334, 18, 'Kinniya'),
(335, 18, 'Kuchchaveli'),
(336, 18, 'Morawewa'),
(337, 18, 'Muttur'),
(338, 18, 'Padavi Sri Pura'),
(339, 18, 'Seruvila'),
(340, 18, 'Thambalagamuwa'),
(341, 18, 'Trincomalee'),
(342, 18, 'Verugal'),
(343, 18, 'Trincomalee'),
(344, 19, 'Badulla'),
(345, 19, 'Bandarawela'),
(346, 19, 'Ella'),
(347, 19, 'Haldummulla'),
(348, 19, 'Hali-Ela'),
(349, 19, 'Haputale'),
(350, 19, 'Kandaketiya'),
(351, 19, 'Lunugala'),
(352, 19, 'Mahiyanganaya'),
(353, 19, 'Meegahakivula'),
(354, 19, 'Passara'),
(355, 19, 'Rideemaliyadda'),
(356, 19, 'Soranathota'),
(357, 19, 'Uva-Paranagama'),
(358, 19, 'Welimada'),
(359, 19, 'Diyathalawa'),
(360, 20, 'Badalkumbura'),
(361, 20, 'Bibile'),
(362, 20, 'Buttala'),
(363, 20, 'Katharagama'),
(364, 20, 'Madulla'),
(365, 20, 'Medagama'),
(366, 20, 'Moneragala'),
(367, 20, 'Sevanagala'),
(368, 20, 'Siyambalanduwa'),
(369, 20, 'Thanamalvila'),
(370, 20, 'Wellawaya'),
(371, 21, 'Delft'),
(372, 21, 'Karainagar'),
(373, 21, 'Nallur'),
(374, 21, 'Thenmaradchi'),
(375, 21, 'Vadamaradchi '),
(376, 21, 'Jaffna'),
(377, 21, 'Valikamam '),
(378, 22, 'Kandavalai'),
(379, 22, 'Karachchi'),
(380, 22, 'Pachchilaipalli'),
(381, 22, 'Poonakary'),
(382, 23, 'Madhu'),
(383, 23, 'Mannar'),
(384, 23, 'Manthai'),
(385, 23, 'Musalai'),
(386, 23, 'Nanaddan'),
(387, 24, 'Manthai '),
(388, 24, 'Maritimepattu'),
(389, 24, 'Oddusuddan'),
(390, 24, 'Puthukudiyiruppu'),
(391, 24, 'Thunukkai'),
(392, 24, 'Welioya'),
(393, 24, 'Mullaitivu'),
(394, 25, 'Vavuniya'),
(395, 25, 'Vengalacheddikulam'),
(396, 1, 'Other'),
(397, 2, 'Other'),
(398, 3, 'Other'),
(399, 4, 'Other'),
(400, 5, 'Other'),
(401, 6, 'Other'),
(402, 7, 'Other'),
(403, 8, 'Other'),
(404, 9, 'Other'),
(405, 10, 'Other'),
(406, 11, 'Other'),
(407, 12, 'Other'),
(408, 13, 'Other'),
(409, 14, 'Other'),
(410, 15, 'Other'),
(411, 16, 'Other'),
(412, 17, 'Other'),
(413, 18, 'Other'),
(414, 19, 'Other'),
(415, 20, 'Other'),
(416, 21, 'Other'),
(417, 22, 'Other'),
(418, 23, 'Other'),
(419, 24, 'Other'),
(420, 25, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `contact_list`
--

CREATE TABLE `contact_list` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `contact_number` varchar(50) DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT 0,
  `is_mobile` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_list`
--

INSERT INTO `contact_list` (`id`, `user_id`, `contact_number`, `is_primary`, `is_mobile`) VALUES
(63, 83, '776287978', 0, 0),
(64, 83, '775131637', 1, 1),
(65, 84, '112345667', 0, 0),
(66, 84, '776234566', 1, 1),
(67, 85, '776287978', 0, 0),
(68, 85, '771234998', 1, 1),
(69, 86, '118909978', 0, 0),
(70, 86, '765432211', 1, 1),
(71, 87, '112337866', 0, 0),
(72, 87, '778890900', 1, 1),
(73, 88, '118900766', 0, 0),
(74, 88, '774321122', 1, 1),
(75, 89, '112345677', 0, 0),
(76, 89, '776543222', 1, 1),
(77, 90, '113456666', 0, 0),
(78, 90, '778990999', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `country` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country`) VALUES
(1, 'Sri Lanka');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_id` int(11) DEFAULT NULL,
  `country_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` int(11) NOT NULL,
  `state_id` int(11) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `state_id`, `district`) VALUES
(1, 1, 'Colombo'),
(2, 1, 'Gampaha'),
(3, 1, 'Kaluthara'),
(4, 2, 'Kandy'),
(5, 2, 'Matale'),
(6, 2, 'NuwaraEliya'),
(7, 3, 'Kurunegala'),
(8, 3, 'Puttalam'),
(9, 4, 'Galle'),
(10, 4, 'Hambantota'),
(11, 4, 'Matara'),
(12, 5, 'Ratnapura'),
(13, 5, 'Kegalle'),
(14, 6, 'Anuradhapura'),
(15, 6, 'Polonnaruwa'),
(16, 7, 'Ampara'),
(17, 7, 'Batticaloa'),
(18, 7, 'Trincomalee'),
(19, 8, 'Badulla'),
(20, 8, 'Moneragala'),
(21, 9, 'Jaffna'),
(22, 9, 'Kilinochchi'),
(23, 9, 'Mannar'),
(24, 9, 'Mullaitivu'),
(25, 9, 'Vavuniya');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `post_id` int(20) DEFAULT NULL,
  `image_id` int(200) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `display_order` int(10) DEFAULT 1,
  `timestamp` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`post_id`, `image_id`, `image_url`, `display_order`, `timestamp`) VALUES
(45, 79, '1620106250099.jpg', 1, '2021-05-04 11:01:11'),
(46, 80, '1620106308080.png', 1, '2021-05-04 11:04:24'),
(46, 81, '1620106314330.jpg', 1, '2021-05-04 11:04:24'),
(46, 82, '1620106383719.png', 1, '2021-05-04 11:04:24'),
(NULL, 83, '1620107742055.jpg', 1, '2021-05-04 11:25:42'),
(47, 84, '1620107807107.jpg', 1, '2021-05-04 11:27:32'),
(47, 85, '1620107812889.jpg', 1, '2021-05-04 11:27:33'),
(48, 86, '1620107934557.jpg', 1, '2021-05-04 11:29:11'),
(NULL, 87, '1620108031059.jpg', 1, '2021-05-04 11:30:31'),
(49, 88, '1620108142167.jpg', 1, '2021-05-04 11:32:30'),
(51, 89, '1620114583179.png', 1, '2021-05-04 13:21:49'),
(51, 90, '1620114590647.png', 1, '2021-05-04 13:21:49'),
(NULL, 91, '1621578927181.jpg', 1, '2021-05-21 12:05:27'),
(53, 93, '1621582538005.jpg', 1, '2021-05-21 13:06:11');

-- --------------------------------------------------------

--
-- Table structure for table `item_ratings`
--

CREATE TABLE `item_ratings` (
  `rate_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `reviewer` int(11) NOT NULL,
  `review` varchar(255) DEFAULT NULL,
  `rate` tinyint(1) NOT NULL DEFAULT 5,
  `timestamp` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_ratings`
--

INSERT INTO `item_ratings` (`rate_id`, `post_id`, `reviewer`, `review`, `rate`, `timestamp`) VALUES
(26, 47, 87, 'Excellent', 5, '2021-05-04 11:37:01'),
(27, 45, 88, 'Poor quality', 2, '2021-05-04 11:40:46');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `renter_id` int(11) NOT NULL,
  `tenant_id` int(11) NOT NULL,
  `payment_type_id` int(11) NOT NULL,
  `amount` float(11,0) NOT NULL,
  `payment_reference_id` varchar(255) NOT NULL,
  `paid_at` varchar(255) DEFAULT NULL,
  `timestamp` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` tinyint(1) DEFAULT 0,
  `slip_id` int(11) DEFAULT NULL,
  `from` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `to` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `is_read` tinyint(1) DEFAULT 0,
  `is_completed` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `post_id`, `renter_id`, `tenant_id`, `payment_type_id`, `amount`, `payment_reference_id`, `paid_at`, `timestamp`, `status`, `slip_id`, `from`, `to`, `is_read`, `is_completed`) VALUES
(59, 47, 87, 84, 1, 5600, '6090e43c5f28f', '2020-07-04 08:05:48', '2021-05-11 21:29:36', 0, NULL, '2021-05-11 21:29:36', '2021-05-11 21:29:36', 1, 1),
(60, 45, 88, 84, 1, 3500, '6090e51bb9101', '2020-12-15 08:09:31', '2021-05-11 21:33:16', 0, NULL, '2021-05-11 21:33:16', '2021-05-11 21:33:16', 1, 1),
(66, 50, 88, 84, 2, 6000, '6090f012f168a', '2021-01-10 08:56:18', '2021-05-11 21:33:21', 0, 20, '2021-05-11 21:33:21', '2021-05-11 21:33:21', 0, 1),
(67, 51, 86, 84, 1, 2400, '6090fd9dce504', '2021-05-04 09:54:05', '2021-05-11 21:32:34', 0, NULL, '2021-05-11 21:32:34', '2021-05-11 21:32:34', 0, 1),
(68, 51, 86, 84, 1, 2400, '60980ddb2761f', '2021-05-09 18:29:15', '2021-05-11 21:32:35', 0, NULL, '2021-05-11 21:32:35', '2021-05-11 21:32:35', 0, 1),
(69, 46, 84, 86, 1, 4500, '60a699657adf2', '2021-05-20 19:16:21', '2021-05-21 12:42:59', 0, NULL, '2021-05-21 12:42:59', '2021-05-21 12:42:59', 1, 1),
(70, 46, 89, 86, 1, 4500, '60a75e290cfb5', '2021-05-21 09:15:53', '2021-05-21 12:52:01', 1, NULL, '2021-05-21 12:52:01', '2021-05-21 12:52:01', 0, 1),
(71, 46, 85, 86, 1, 4500, '60a75e689b6a1', '2021-05-21 09:16:56', '2021-05-21 12:52:42', 1, NULL, '2021-05-21 12:52:42', '2021-05-21 12:52:42', 0, 1),
(72, 45, 85, 86, 2, 3500, '60a75e9600c74', '2021-05-21 09:17:42', '2021-05-21 12:47:42', 0, 21, '2021-05-21 00:00:00', '2021-05-22 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment_type`
--

CREATE TABLE `payment_type` (
  `payment_type_id` int(11) NOT NULL,
  `payment_type_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_type`
--

INSERT INTO `payment_type` (`payment_type_id`, `payment_type_name`) VALUES
(1, 'cash'),
(2, 'bank transfer');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(255) NOT NULL,
  `post_title` varchar(255) NOT NULL DEFAULT '',
  `post_content` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `category_id` int(255) NOT NULL DEFAULT 1,
  `city_id` int(11) DEFAULT NULL,
  `rate_id` int(255) DEFAULT NULL,
  `user_id` int(255) NOT NULL,
  `published_time` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `payment_id` int(255) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT 0,
  `rent_type_id` int(11) NOT NULL DEFAULT 1,
  `timestamp` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `avg_rate` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `post_title`, `post_content`, `price`, `category_id`, `city_id`, `rate_id`, `user_id`, `published_time`, `payment_id`, `is_active`, `rent_type_id`, `timestamp`, `avg_rate`) VALUES
(45, 'Oven', 'It is a high quality oven', '3500.00', 3, 282, NULL, 86, '2021-05-04 11:41:38', NULL, 1, 1, '2021-05-04 11:41:38', '2.00'),
(46, 'Canon Camera', 'iT IS A DIGITALCAMERA. THE BRAND IS CANON. \n\nIF YOU WANT TO RENT IT OUT PLEASE CONTACT ME.', '4500.00', 6, 282, NULL, 86, '2021-05-21 12:52:01', NULL, 2, 1, '2021-05-21 12:52:01', '0.00'),
(47, 'Outdoor lighting', 'If you want to have an outdoor function may be a birthday party or wedding you can use this. ', '5600.00', 2, 18, NULL, 84, '2021-05-04 13:16:28', NULL, 1, 1, '2021-05-04 13:16:28', '5.00'),
(48, 'Tent', '', '12000.00', 2, 18, NULL, 84, '2021-05-04 11:29:34', NULL, 1, 2, '2021-05-04 11:29:34', '0.00'),
(49, 'Grinder machine', '', '4500.00', 7, 357, NULL, 86, '2021-05-04 11:33:01', NULL, 1, 1, '2021-05-04 11:33:01', '0.00'),
(50, 'camera', '', '6000.00', 6, 269, NULL, 86, '2021-05-04 12:15:57', NULL, 1, 1, '2021-05-04 12:15:57', '0.00'),
(51, 'oven', 'Canon camera', '2400.00', 3, 16, NULL, 84, '2021-05-04 13:22:43', NULL, 1, 1, '2021-05-04 13:22:43', '0.00'),
(52, 'Refrigerator', '', '3800.00', 3, 127, NULL, 84, '2021-05-20 23:42:27', NULL, 1, 1, '2021-05-20 23:42:27', '0.00'),
(53, 'ucsc', 'This is an oven', '4500.00', 3, 16, NULL, 86, '2021-05-21 13:07:14', NULL, 1, 1, '2021-05-21 13:07:14', '0.00'),
(54, 'Canon', '', '7777.00', 3, 153, NULL, 83, NULL, NULL, 0, 1, '2022-01-20 13:57:49', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `rent_type`
--

CREATE TABLE `rent_type` (
  `rent_type_id` int(11) NOT NULL,
  `rent_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rent_type`
--

INSERT INTO `rent_type` (`rent_type_id`, `rent_type`) VALUES
(1, 'per day'),
(2, 'one time');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `country_id`, `state`) VALUES
(1, 1, 'Western 		'),
(2, 1, 'Central'),
(3, 1, 'North Western'),
(4, 1, 'Southern Province'),
(5, 1, 'Sabaragamuwa'),
(6, 1, 'North Central	'),
(7, 1, 'Eastern'),
(8, 1, 'Uva'),
(9, 1, 'Nothern ');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL DEFAULT '',
  `profile_image` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `timestamp` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `role_id` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `firstname`, `lastname`, `email`, `address`, `password`, `profile_image`, `token`, `timestamp`, `role_id`) VALUES
(83, 'savindi', 'savindi', 'weerakoon', 'savindiweerakoon@gmail.com', NULL, '16101!181@171#141$191%131^151&', NULL, 'f27f0d800cd7c13abc754c655cef12ee591abe2b99ebd08c40f46e7ba2b8febf345107f7e6a40a9e9115be2fcdc5ebc7d6f3e3965ed735a68cfc736767683201', '2022-05-06 14:24:21', 2),
(84, 'dilshara', 'dilshara', 'perera', 'dilshara123@gmail.com', NULL, '16101!181@171#141$191%131^151&', NULL, '795149e533738c5931f4b0f53ea302105d09cc80b79c1d4c201799dffd87c9494204fa6ad7c9529c602a0f4c75f5cc5a4251f3c375ecaf7f3900eef9a8537632', '2021-05-21 13:09:02', 1),
(85, 'amal', 'amal', 'fernando', 'amalfernando@gmail.com', NULL, '16101!181@171#141$191%131^151&', NULL, '095a3f584f1bd70b7400bf60daa5ddc424356bbd2ae40a520b9c7ae098f0cf50d9865b2b31250f34e365db72c8722548ca1bd9b7104d1f032fa655a219ce0a5a', '2021-05-21 12:46:41', 1),
(86, 'nimal', 'nimal', 'jayasinghe', 'nimal345@gmail.com', NULL, '16101!181@171#141$191%131^151&', NULL, '302e827ec1a8cfa4eedc59d8ee2cb23687ed80593393bbd8e2db8c3e57ce1285ae0264ff48bde93365afc4059bbe11de49e825d002709473a264ccf22fd0cf6c', '2021-05-21 12:48:53', 1),
(87, 'wimal', 'wimal', 'perera', 'wimalpr@gmail.com', NULL, '16101!181@171#141$191%131^151&', NULL, '45eef29b7258551a815443e600235923546dd4e9b3837bc57a41e438bd6125f1f9b2d608f9f37d753c74fa0cdb825036329cd798494ce41cbb2407097e44d6da', '2021-05-04 11:34:07', 1),
(88, 'amali', 'amali', 'weerasinghe', 'amali123@gmail.com', NULL, '16101!181@171#141$191%131^151&', NULL, '0868d0f8ce3479a702f24823511f5fc6d46cb2cff9b1637d7c42ecb69e7cdb97b5b6da5a3d5f43ded4c46936a11409c297bb6e145d708d6e6b93d4db85baea4d', '2021-05-04 12:16:09', 1),
(89, 'UCSC', 'bit', 'demo', 'ucsc@gmail.com', NULL, '16101!181@171#141$191%131^151&', NULL, '24d3ef9a66231b8ed0cde924abe29104649ad10f85ded53873386a7a607cb314fbe83bd5bcdf115b282842543686976d28d22863e7ed381c8aa8c699b7df384f', '2021-05-21 12:45:23', 1),
(90, 'bitcheck', 'bit', 'check', 'bit@gmail.com', NULL, '16101!181@171#141$191%131^151&', NULL, 'c32abb209b26970a5b3c39206c81594ba8ea877f4fce28121a1bed800e614e169c3129894f3821ae58e5a1dba4a043c11a8957afc6a43becd0dde65a3f5b8881', '2021-05-21 13:19:29', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_ratings`
--

CREATE TABLE `user_ratings` (
  `rate_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reviewer` int(11) NOT NULL,
  `review` varchar(255) DEFAULT NULL,
  `rate` tinyint(1) NOT NULL DEFAULT 5,
  `timestamp` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_ratings`
--

INSERT INTO `user_ratings` (`rate_id`, `user_id`, `reviewer`, `review`, `rate`, `timestamp`) VALUES
(17, 84, 87, 'Good communication', 5, '2021-05-04 11:37:01'),
(18, 86, 88, 'Very bad', 2, '2021-05-04 11:40:47');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `role_id` tinyint(4) NOT NULL,
  `role_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`role_id`, `role_name`) VALUES
(1, 'consumer'),
(2, 'moderator');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_name`
-- (See below for the actual view)
--
CREATE TABLE `view_name` (
`username` varchar(255)
);

-- --------------------------------------------------------

--
-- Structure for view `view_name`
--
DROP TABLE IF EXISTS `view_name`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_name`  AS  select `users`.`username` AS `username` from `users` where `users`.`lastname` = 'Bob' ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank_slips`
--
ALTER TABLE `bank_slips`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `district_city_fk` (`district_id`);

--
-- Indexes for table `contact_list`
--
ALTER TABLE `contact_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_number` (`contact_number`),
  ADD KEY `user_contacts_fk` (`user_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `district_state_fk` (`state_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD KEY `post_id` (`post_id`,`image_id`),
  ADD KEY `post_id_2` (`post_id`),
  ADD KEY `image_id` (`image_id`);

--
-- Indexes for table `item_ratings`
--
ALTER TABLE `item_ratings`
  ADD PRIMARY KEY (`rate_id`),
  ADD KEY `post_rate_fk` (`post_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `user_id` (`renter_id`),
  ADD KEY `payment_type_fk` (`payment_type_id`),
  ADD KEY `post_id_fk` (`post_id`),
  ADD KEY `payment_slip_fk` (`slip_id`);

--
-- Indexes for table `payment_type`
--
ALTER TABLE `payment_type`
  ADD PRIMARY KEY (`payment_type_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `categories_fk` (`category_id`),
  ADD KEY `payment_id` (`payment_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `rate_fk` (`rate_id`),
  ADD KEY `rent_fk` (`rent_type_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `rent_type`
--
ALTER TABLE `rent_type`
  ADD KEY `rent_type_id` (`rent_type_id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `state_country_fk` (`country_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_role_fk` (`role_id`);

--
-- Indexes for table `user_ratings`
--
ALTER TABLE `user_ratings`
  ADD PRIMARY KEY (`rate_id`),
  ADD KEY `user_rate_fk` (`user_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank_slips`
--
ALTER TABLE `bank_slips`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=421;

--
-- AUTO_INCREMENT for table `contact_list`
--
ALTER TABLE `contact_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `item_ratings`
--
ALTER TABLE `item_ratings`
  MODIFY `rate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `payment_type`
--
ALTER TABLE `payment_type`
  MODIFY `payment_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `user_ratings`
--
ALTER TABLE `user_ratings`
  MODIFY `rate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `role_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `district_city_fk` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`);

--
-- Constraints for table `contact_list`
--
ALTER TABLE `contact_list`
  ADD CONSTRAINT `user_contacts_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `districts`
--
ALTER TABLE `districts`
  ADD CONSTRAINT `district_state_fk` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`);

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `post_image_fk` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`);

--
-- Constraints for table `item_ratings`
--
ALTER TABLE `item_ratings`
  ADD CONSTRAINT `post_rate_fk` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payment_slip_fk` FOREIGN KEY (`slip_id`) REFERENCES `bank_slips` (`id`),
  ADD CONSTRAINT `payment_type_fk` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_type` (`payment_type_id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_id_fk` FOREIGN KEY (`renter_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `categories_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  ADD CONSTRAINT `payment_fk` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`payment_id`),
  ADD CONSTRAINT `post_city_fk` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `rent_fk` FOREIGN KEY (`rent_type_id`) REFERENCES `rent_type` (`rent_type_id`),
  ADD CONSTRAINT `users_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `states`
--
ALTER TABLE `states`
  ADD CONSTRAINT `state_country_fk` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `user_role_fk` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`role_id`);

--
-- Constraints for table `user_ratings`
--
ALTER TABLE `user_ratings`
  ADD CONSTRAINT `user_rate_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
--
-- Database: `easyrentnew`
--
CREATE DATABASE IF NOT EXISTS `easyrentnew` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `easyrentnew`;

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
(9, 'Audio systems', 3),
(10, 'Blender', 4),
(11, 'fridge', 4),
(12, 'Coffee Machine', 4),
(13, 'Tent', 2);

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
(47, 'Attanagalla', 2),
(48, 'Biyagama', 2),
(49, 'Divulapitiya', 2),
(50, 'Dompe', 2),
(51, 'Gampaha', 2),
(52, 'Ja-Ela', 2),
(53, 'Katana', 2),
(54, 'Kelaniya', 2),
(55, 'Mahara', 2),
(70, 'Minuwangoda', 2),
(71, 'Mirigama', 2),
(74, 'Negombo', 2),
(75, 'Wattala', 2),
(76, 'Kiribathgoda', 2),
(77, 'Kadawatha', 2),
(78, 'Delgoda', 2),
(79, 'Dompe', 2),
(80, 'Kirindiwela', 2),
(81, 'Nittambuwa', 2),
(82, 'Veyangoda', 2),
(83, 'Kandana', 2),
(84, 'Ragama', 2),
(85, 'Katunayake', 2),
(86, 'Ganemulla', 2),
(87, 'Peliyagoda', 2),
(88, 'Yakkala', 2),
(89, 'Agalawatta', 3),
(90, 'Bandaragama', 3),
(91, 'Beruwala', 3),
(92, 'Bulathsinhala', 3),
(93, 'Dodangoda', 3),
(94, 'Horana', 3),
(95, 'Ingiriya', 3),
(96, 'Kalutara', 3),
(97, 'Madurawela', 3),
(98, 'Mathugama', 3),
(99, 'Millaniya', 3),
(100, 'Palindanuwara', 3),
(101, 'Panadura', 3),
(102, 'Walallavita', 3),
(103, 'Wadduwa', 3),
(104, 'Aluthgama', 3),
(105, 'Akurana', 4),
(106, 'Delthota', 4),
(107, 'Doluwa', 4),
(108, 'Ganga Ihala Korale', 4),
(109, 'Harispattuwa', 4),
(110, 'Hatharaliyadda', 4),
(111, 'Kandy', 4),
(112, 'Kundasale', 4),
(113, 'Medadumbara', 4),
(114, 'Minipe', 4),
(115, 'Panvila', 4),
(116, 'Pasbage Korale', 4),
(117, 'Pathadumbara', 4),
(118, 'Pathahewaheta', 4),
(119, 'Poojapitiya', 4),
(120, 'Thumpane', 4),
(121, 'Udadumbara', 4),
(122, 'Udapalatha', 4),
(123, 'Udunuwara', 4),
(124, 'Yatinuwara', 4),
(125, 'Katugastota', 4),
(126, 'Gampola', 4),
(127, 'Peradeniya', 4),
(128, 'Pilimathalawa', 4),
(129, 'Digana', 4),
(130, 'Gelioya', 4),
(131, 'Nawalapitiya', 4),
(132, 'Galagedara', 4),
(133, 'Kadugannawa', 4),
(134, 'Wattegama', 4),
(135, 'Ampitiya', 4),
(136, 'Madawala Bazaar', 4),
(137, 'Ambanganga Korale', 5),
(138, 'Dambulla', 5),
(139, 'Galewela', 5),
(140, 'Laggala-Pallegama', 5),
(141, 'Matale', 5),
(142, 'Naula', 5),
(143, 'Pallepola', 5),
(144, 'Rattota', 5),
(145, 'Ukuwela', 5),
(146, 'Wilgamuwa', 5),
(147, 'Yatawatta', 5),
(148, 'Sigiriya', 5),
(149, 'Palapathwela', 5),
(150, 'Ambagamuwa', 6),
(151, 'Hanguranketha', 6),
(152, 'Kothmale', 6),
(153, 'Nuwara Eliya', 6),
(154, 'Walapane', 6),
(155, 'Hatton', 6),
(156, 'Madulla', 6),
(157, 'Ginigathhena', 6),
(158, 'Alawwa', 7),
(159, 'Ambanpola', 7),
(160, 'Bamunakotuwa', 7),
(161, 'Bingiriya', 7),
(162, 'Ehetuwewa', 7),
(163, 'Galgamuwa', 7),
(164, 'Ganewatta', 7),
(165, 'Giribawa', 7),
(166, 'Ibbagamuwa', 7),
(167, 'Katupotha', 7),
(168, 'Kobeigane', 7),
(169, 'Kotavehera', 7),
(170, 'Kuliyapitiya East', 7),
(171, 'Kuliyapitiya West', 7),
(172, 'Kurunegala', 7),
(173, 'Mahawa', 7),
(174, 'Mallawapitiya', 7),
(175, 'Maspotha', 7),
(176, 'Mawathagama', 7),
(177, 'Narammala', 7),
(178, 'Nikaweratiya', 7),
(179, 'Panduwasnuwara', 7),
(180, 'Pannala', 7),
(181, 'Polgahawela', 7),
(182, 'Polpithigama', 7),
(183, 'Rasnayakapura', 7),
(184, 'Rideegama', 7),
(185, 'Udubaddawa', 7),
(186, 'Wariyapola', 7),
(187, 'Weerambugedara', 7),
(188, 'Hettipola', 7),
(189, 'Giriulla', 7),
(190, 'Anamaduwa', 8),
(191, 'Arachchikattuwa', 8),
(192, 'Chilaw', 8),
(193, 'Dankotuwa', 8),
(194, 'Kalpitiya', 8),
(195, 'Karuwalagaswewa', 8),
(196, 'Madampe', 8),
(197, 'Mahakumbukkadawala', 8),
(198, 'Mahawewa', 8),
(199, 'Mundalama', 8),
(200, 'Nattandiya', 8),
(201, 'Nawagattegama', 8),
(202, 'Pallama', 8),
(203, 'Puttalam', 8),
(204, 'Vanathavilluwa', 8),
(205, 'Wennappuwa', 8),
(206, 'Marawila', 8),
(207, 'Akmeemana', 9),
(208, 'Ambalangoda', 9),
(209, 'Baddegama', 9),
(210, 'Balapitiya', 9),
(211, 'Benthota', 9),
(212, 'Bope-Poddala', 9),
(213, 'Elpitiya', 9),
(214, 'Galle', 9),
(215, 'Gonapinuwala', 9),
(216, 'Habaraduwa', 9),
(217, 'Hikkaduwa', 9),
(218, 'Imaduwa', 9),
(219, 'Karandeniya', 9),
(220, 'Nagoda', 9),
(221, 'Neluwa', 9),
(222, 'Niyagama', 9),
(223, 'Thawalama', 9),
(224, 'Welivitiya-Divithura', 9),
(225, 'Yakkalamulla', 9),
(226, 'Karapitiya', 9),
(227, 'Ahangama', 9),
(228, 'Batapola', 9),
(229, 'Ambalantota', 10),
(230, 'Angunakolapelessa', 10),
(231, 'Beliatta', 10),
(232, 'Hambantota', 10),
(233, 'Katuwana', 10),
(234, 'Lunugamvehera', 10),
(235, 'Okewela', 10),
(236, 'Sooriyawewa', 10),
(237, 'Tangalle', 10),
(238, 'Thissamaharama', 10),
(239, 'Walasmulla', 10),
(240, 'Weeraketiya', 10),
(241, 'Akuressa', 11),
(242, 'Athuraliya', 11),
(243, 'Devinuwara', 11),
(244, 'Dickwella', 11),
(245, 'Hakmana', 11),
(246, 'Kamburupitiya', 11),
(247, 'Kirinda Puhulwella', 11),
(248, 'Kotapola', 11),
(249, 'Malimbada', 11),
(250, 'Matara', 11),
(251, 'Mulatiyana', 11),
(252, 'Pasgoda', 11),
(253, 'Pitabeddara', 11),
(254, 'Thihagoda', 11),
(255, 'Weligama', 11),
(256, 'Welipitiya', 11),
(257, 'Deniyaya', 11),
(258, 'Kamburugamuwa', 11),
(259, 'Kakannadurra', 11),
(260, 'Ayagama', 12),
(261, 'Balangoda', 12),
(262, 'Eheliyagoda', 12),
(263, 'Elapattha', 12),
(264, 'Embilipitiya', 12),
(265, 'Godakawela', 12),
(266, 'Imbulpe', 12),
(267, 'Kahawatta', 12),
(268, 'Kalawana', 12),
(269, 'Kiriella', 12),
(270, 'Kolonna', 12),
(271, 'Kuruvita', 12),
(272, 'Nivithigala', 12),
(273, 'Opanayaka', 12),
(274, 'Pelmadulla', 12),
(275, 'Ratnapura', 12),
(276, 'Weligepola', 12),
(277, 'Aranayaka', 13),
(278, 'Bulathkohupitiya', 13),
(279, 'Dehiowita', 13),
(280, 'Deraniyagala', 13),
(281, 'Galigamuwa', 13),
(282, 'Kegalle', 13),
(283, 'Mawanella', 13),
(284, 'Rambukkana', 13),
(285, 'Ruwanwella', 13),
(286, 'Warakapola', 13),
(287, 'Yatiyanthota', 13),
(288, 'Kitulgala', 13),
(289, 'Galnewa', 14),
(290, 'Galenbindunuwewa', 14),
(291, 'Horowpothana', 14),
(292, 'Ipalogama', 14),
(293, 'Kahatagasdigiliya', 14),
(294, 'Kebithigollewa', 14),
(295, 'Kekirawa', 14),
(296, 'Mahavilachchiya', 14),
(297, 'Medawachchiya', 14),
(298, 'Mihinthale', 14),
(299, 'Nachchadoowa', 14),
(300, 'Nochchiyagama', 14),
(301, 'Nuwaragam Palatha Central', 14),
(302, 'Nuwaragam Palatha East', 14),
(303, 'Padaviya', 14),
(304, 'Palagala', 14),
(305, 'Palugaswewa', 14),
(306, 'Rajanganaya', 14),
(307, 'Rambewa', 14),
(308, 'Thalawa', 14),
(309, 'Thambuttegama', 14),
(310, 'Thirappane', 14),
(311, 'Anuradhapura', 14),
(312, 'Eppawala', 14),
(313, 'Habarana', 14),
(314, 'Dimbulagala', 15),
(315, 'Elahera', 15),
(316, 'Hingurakgoda', 15),
(317, 'Lankapura', 15),
(318, 'Medirigiriya', 15),
(319, 'Thamankaduwa', 15),
(320, 'Welikanda', 15),
(321, 'Polonnaruwa', 15),
(322, 'Addalachchenai', 16),
(323, 'Akkaraipattu', 16),
(324, 'Alayadiwembu', 16),
(325, 'Ampara', 16),
(326, 'Damana', 16),
(327, 'Dehiattakandiya', 16),
(328, 'Eragama', 16),
(329, 'Kalmunai ', 16),
(330, 'Karaitivu', 16),
(331, 'Lahugala', 16),
(332, 'Mahaoya', 16),
(333, 'Navithanveli', 16),
(334, 'Ninthavur', 16),
(335, 'Padiyathalawa', 16),
(336, 'Pothuvil', 16),
(337, 'Sainthamarathu', 16),
(338, 'Samanthurai', 16),
(339, 'Thirukkovil', 16),
(340, 'Uhana', 16),
(341, 'Eravur Pattu', 17),
(342, 'Eravur Town', 17),
(343, 'Kattankudy', 17),
(344, 'Koralai Pattu', 17),
(345, 'Manmunai ', 17),
(346, 'Porativu Pattu', 17),
(347, 'Batticaloa', 17),
(348, 'Gomarankadawala', 18),
(349, 'Kantalai', 18),
(350, 'Kinniya', 18),
(351, 'Kuchchaveli', 18),
(352, 'Morawewa', 18),
(353, 'Muttur', 18),
(354, 'Padavi Sri Pura', 18),
(355, 'Seruvila', 18),
(356, 'Thambalagamuwa', 18),
(357, 'Trincomalee', 18),
(358, 'Verugal', 18),
(359, 'Trincomalee', 18),
(360, 'Badulla', 19),
(361, 'Bandarawela', 19),
(362, 'Ella', 19),
(363, 'Haldummulla', 19),
(364, 'Hali-Ela', 19),
(365, 'Haputale', 19),
(366, 'Kandaketiya', 19),
(367, 'Lunugala', 19),
(368, 'Mahiyanganaya', 19),
(369, 'Meegahakivula', 19),
(370, 'Passara', 19),
(371, 'Rideemaliyadda', 19),
(372, 'Soranathota', 19),
(373, 'Uva-Paranagama', 19),
(374, 'Welimada', 19),
(375, 'Diyathalawa', 19),
(376, 'Badalkumbura', 20),
(377, 'Bibile', 20),
(378, 'Buttala', 20),
(379, 'Katharagama', 20),
(380, 'Madulla', 20),
(381, 'Medagama', 20),
(382, 'Moneragala', 20),
(383, 'Sevanagala', 20),
(384, 'Siyambalanduwa', 20),
(385, 'Thanamalvila', 20),
(386, 'Wellawaya', 20),
(387, 'Delft', 21),
(388, 'Karainagar', 21),
(389, 'Nallur', 21),
(390, 'Thenmaradchi', 21),
(391, 'Vadamaradchi ', 21),
(392, 'Jaffna', 21),
(393, 'Valikamam ', 21),
(394, 'Kandavalai', 22),
(395, 'Karachchi', 22),
(396, 'Pachchilaipalli', 22),
(397, 'Poonakary', 22),
(398, 'Madhu', 23),
(399, 'Mannar', 23),
(400, 'Manthai', 23),
(401, 'Musalai', 23),
(402, 'Nanaddan', 23),
(403, 'Manthai ', 24),
(404, 'Maritimepattu', 24),
(405, 'Vengalacheddikulam', 25),
(406, 'Vavuniya', 25),
(407, 'Mullaitivu', 24),
(408, 'Welioya', 24),
(409, 'Thunukkai', 24),
(410, 'Puthukudiyiruppu', 24),
(411, 'Oddusuddan', 24);

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
(4, 2, 'Kandy'),
(5, 2, 'Matale'),
(6, 2, 'NuwaraEliya'),
(7, 3, 'Kurunegala'),
(8, 3, 'Puttalam'),
(9, 4, 'Galle'),
(10, 4, 'Hambantota'),
(11, 4, 'Matara'),
(12, 5, 'Ratnapura'),
(13, 5, 'Kegalle'),
(14, 6, 'Anuradhapura'),
(15, 6, 'Polonnaruwa'),
(16, 7, 'Ampara'),
(17, 7, 'Batticaloa'),
(18, 7, 'Trincomalee'),
(19, 8, 'Badulla'),
(20, 8, 'Moneragala'),
(21, 9, 'Jaffna'),
(22, 9, 'Kilinochchi'),
(23, 9, 'Mannar'),
(24, 8, 'Mullaitivu'),
(25, 2, 'Vavuniya');

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
(84, '1653618155840.jpg', '2022-05-27 07:52:36', NULL),
(85, '1653618324044.jpg', '2022-05-27 07:55:24', NULL),
(86, '1653618684420.jpg', '2022-05-27 08:01:24', NULL),
(87, '1653618881418.jpg', '2022-05-27 08:05:11', 46),
(88, '1653619039037.jpeg', '2022-05-27 08:07:19', NULL),
(89, '1653620713624.jpeg', '2022-05-27 08:35:51', 56),
(90, '1653621155823.jpeg', '2022-05-27 08:42:35', NULL),
(91, '1653621980088.jpeg', '2022-05-27 08:56:20', NULL),
(92, '1653624531847.jpeg', '2022-05-27 09:38:52', NULL),
(93, '1653633684022.jpg', '2022-05-27 12:11:24', NULL),
(94, '1653633698184.jpeg', '2022-05-27 12:11:38', NULL),
(95, '1653666704538.jpeg', '2022-05-27 21:21:44', NULL),
(96, '1653667689702.jpg', '2022-05-27 21:38:35', 57),
(97, '1653677148938.jpeg', '2022-05-28 00:15:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item_ratings`
--

CREATE TABLE `item_ratings` (
  `rate_id` int(100) NOT NULL,
  `post_id` int(100) DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
  `rate` varchar(255) DEFAULT NULL,
  `timestamp` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reservation_id` int(11) DEFAULT NULL,
  `reviewer` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_ratings`
--

INSERT INTO `item_ratings` (`rate_id`, `post_id`, `review`, `rate`, `timestamp`, `reservation_id`, `reviewer`) VALUES
(142, 47, 'Little bit damaged', '4', '2022-05-28 00:36:06', 57, 42),
(143, 47, 'totaled', '2', '2022-05-28 00:36:51', 57, 42);

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
(2, 'Online Transfer');

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
  `is_active` varchar(255) DEFAULT '0',
  `published_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `category_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `post_title` varchar(255) DEFAULT NULL,
  `available` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`post_id`, `user_id`, `price`, `content`, `city_id`, `rent_type_id`, `avg_rate`, `is_active`, `published_time`, `category_id`, `district_id`, `post_title`, `available`) VALUES
(46, 35, '15000.00', 'high quality smart fridge', 48, 0, '5', '1', '2022-05-28 00:54:33', 11, 2, 'Smart fridge', 0),
(47, 35, '400.00', 'Blender for daily use', 92, 0, '3', '1', '2022-05-28 00:36:51', 10, 3, 'Blender', 1),
(48, 35, '15000.00', '', 1, 0, NULL, '1', '2022-05-27 08:27:58', 5, 1, 'Sofa set', 1),
(49, 35, '2000.00', 'lights', 137, 0, NULL, '1', '2022-05-27 08:28:07', 7, 5, 'Light system', 1),
(50, 35, '5600.00', '', 158, 0, NULL, '1', '2022-05-28 00:55:41', 8, 7, 'Nikon camera', 1),
(51, 35, '4000.00', '', 47, 0, NULL, '0', '2022-05-27 08:12:19', 9, 2, 'Speakers', 1),
(52, 35, '4000.00', '', 158, 0, NULL, '1', '2022-05-27 08:28:11', 8, 7, 'Cannon camera', 1),
(53, 35, '13000.00', '', 106, 0, NULL, '0', '2022-05-27 08:16:30', 9, 4, 'Line array sounds', 1),
(54, 35, '3400.00', '', 1, 0, NULL, '0', '2022-05-27 08:17:19', 7, 1, 'Wall Papers', 1),
(55, 35, '2355.00', '', 105, 0, NULL, '1', '2022-05-28 00:54:28', 6, 4, 'Flower vases', 0),
(56, 36, '1900.00', 'You can use this coffee machine for any function or event. It is in good condition.', 342, 0, '5', '1', '2022-05-27 21:24:08', 12, 17, 'Coffee Machine', 1),
(57, 44, '2300.00', 'This is a luxury wedding tent. Suitable for outdoor weddings.', 340, 0, NULL, '1', '2022-05-27 21:39:27', 13, 16, 'Tent', 1);

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
(2, 'Central', 1),
(3, 'North Western', 1),
(4, 'Southern Province', 1),
(5, 'Sabaragamuwa', 1),
(6, 'North Central	', 1),
(7, 'Eastern', 1),
(8, 'Uva', 1),
(9, 'Nothern ', 1);

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
  `reservation_state` int(11) NOT NULL DEFAULT 0,
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `timestamp` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `image_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`id`, `renter_id`, `tenant_id`, `reservation_state`, `from_date`, `to_date`, `post_id`, `timestamp`, `image_id`, `amount`) VALUES
(57, 35, 42, 4, '2022-05-29 00:00:00', '2022-05-31 00:00:00', 47, '2022-05-28 00:17:28', 97, 1200);

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
  `role_id` int(11) NOT NULL DEFAULT 2,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `token` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `firstname`, `lastname`, `email`, `password`, `role_id`, `timestamp`, `token`, `phone`, `image_id`) VALUES
(35, 'amal', 'amal', 'perera', 'amal@gmail.com', 'b59c67bf196a4758191e42f76670ceba', 2, '2022-05-28 00:42:24', '61271ff77e162df23029a436f830bf641fdae410', '112345666', NULL),
(36, 'kasun', 'kasun', 'silva', 'kasun@gmail.com', 'b59c67bf196a4758191e42f76670ceba', 2, '2022-05-27 21:23:14', 'df246d437acfc448cfcad8a4dcc8b428849027d9', '112345677', NULL),
(37, 'kamal', 'kamal', 'wijesinghe', 'kamal@gmail.com', 'b59c67bf196a4758191e42f76670ceba', 2, '2022-05-27 08:36:50', '608abb5cab1805614652ba17a400d77a8a9ba9e6', '116778990', NULL),
(38, 'savindi', 'savindi', 'weerakoon', 'savindi@gmail.com', 'b59c67bf196a4758191e42f76670ceba', 1, '2022-05-27 21:39:14', 'f7cb2c3b47b68bf69fc0db36ad2e05bde68764c1', '338900965', NULL),
(39, 'gayan', 'gayan', 'sandamal', 'gayan@gmail.com', 'b59c67bf196a4758191e42f76670ceba', 2, '2022-05-27 00:16:54', '', '119567744', NULL),
(40, 'anne', 'anne', 'rajasinghe', 'anne@gmail.com', 'b59c67bf196a4758191e42f76670ceba', 2, '2022-05-27 21:40:10', '500c1e7707a0a1d8a7d1299f54958b9a465e0c7a', '119008789', NULL),
(41, 'ruwan', 'ruwan', 'perera', 'ruwan@gmail.com', 'b59c67bf196a4758191e42f76670ceba', 2, '2022-05-27 00:39:35', '', '119876555', NULL),
(42, 'ajith', 'ajith', 'wijekoon', 'ajith@gmail.com', 'b59c67bf196a4758191e42f76670ceba', 2, '2022-05-28 00:14:51', 'ccb36d5341d5441f59f2cecef75e79e093841abf', '112333211', NULL),
(43, 'binara', 'binara', 'soyza', 'binara@gmail.com', 'b59c67bf196a4758191e42f76670ceba', 2, '2022-05-27 21:20:37', '2eef2c0c7d3c48ece0d8bc2e89233daf6bc9a3ac', '998900987', NULL),
(44, 'gihan', 'gihan', 'silva', 'gihan@gmail.com', 'b59c67bf196a4758191e42f76670ceba', 2, '2022-05-27 21:36:33', '78a0be3fdfe168fc1a4b1e713e653de2c32a3d2e', '776789045', NULL),
(45, 'bimal', 'bimal', 'kodikara', 'bimal@gmail.com', 'b59c67bf196a4758191e42f76670ceba', 2, '2022-05-27 00:42:35', '', '112345678', NULL),
(46, 'chamal', 'chamal', 'soyza', 'chamal@gmail.com', 'b59c67bf196a4758191e42f76670ceba', 2, '2022-05-27 00:43:17', '', '112345098', NULL),
(47, 'yasas', 'yasas', 'soyza', 'yasas@gmail.com', 'b59c67bf196a4758191e42f76670ceba', 2, '2022-05-27 00:43:56', '', '556789094', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userrate`
--

CREATE TABLE `userrate` (
  `rate_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `rate` varchar(255) DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `reviewer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userrate`
--

INSERT INTO `userrate` (`rate_id`, `user_id`, `post_id`, `rate`, `review`, `timestamp`, `reviewer`) VALUES
(48, 37, 46, '5', 'He is a kind hearted person. returned the item on time', NULL, '5'),
(49, 37, 46, '5', 'He is a kind hearted person. returned the item on time', NULL, '5'),
(50, 43, 56, '5', 'he is good', NULL, '5'),
(51, 43, 56, '5', 'he is good', NULL, '5');

-- --------------------------------------------------------

--
-- Table structure for table `userrole`
--

CREATE TABLE `userrole` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userrole`
--

INSERT INTO `userrole` (`role_id`, `role_name`) VALUES
(1, 'Admin'),
(2, 'Typical User');

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
  ADD KEY `district_fk` (`district_id`);

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
  ADD KEY `district` (`district`),
  ADD KEY `province_fk` (`province_id`);

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
  ADD KEY `post_rate_fk` (`post_id`),
  ADD KEY `reservation_fk` (`reservation_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_payment_fk` (`post_id`),
  ADD KEY `payment_render_fk` (`renter_id`),
  ADD KEY `payment_tenant_fk` (`tenant_id`);

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
  ADD KEY `rent_type_id_fk` (`rent_type_id`),
  ADD KEY `user_post_fk` (`user_id`),
  ADD KEY `post_city_fk` (`city_id`),
  ADD KEY `post_category_fk` (`category_id`),
  ADD KEY `post_district_fk` (`district_id`);

--
-- Indexes for table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_fk` (`country_id`);

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
  ADD KEY `user_role_fk` (`role_id`);

--
-- Indexes for table `userrate`
--
ALTER TABLE `userrate`
  ADD PRIMARY KEY (`rate_id`),
  ADD KEY `user_rate_fk` (`user_id`),
  ADD KEY `user_post_rate_fk` (`post_id`);

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
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=412;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `district`
--
ALTER TABLE `district`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `item_ratings`
--
ALTER TABLE `item_ratings`
  MODIFY `rate_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `paymenttype`
--
ALTER TABLE `paymenttype`
  MODIFY `paymant_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `province`
--
ALTER TABLE `province`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `userrate`
--
ALTER TABLE `userrate`
  MODIFY `rate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `district_fk` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`),
  ADD CONSTRAINT `district_fk
district_fk
district_fk
district_fk` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`);

--
-- Constraints for table `district`
--
ALTER TABLE `district`
  ADD CONSTRAINT `province_fk` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`);

--
-- Constraints for table `item_ratings`
--
ALTER TABLE `item_ratings`
  ADD CONSTRAINT `post_rate_fk` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`),
  ADD CONSTRAINT `reservation_fk` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_render_fk` FOREIGN KEY (`renter_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `payment_tenant_fk` FOREIGN KEY (`tenant_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `post_payment_fk` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_category_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  ADD CONSTRAINT `post_city_fk` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `post_district_fk` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`),
  ADD CONSTRAINT `user_post_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `province`
--
ALTER TABLE `province`
  ADD CONSTRAINT `country_fk` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_role_fk` FOREIGN KEY (`role_id`) REFERENCES `userrole` (`role_id`);

--
-- Constraints for table `userrate`
--
ALTER TABLE `userrate`
  ADD CONSTRAINT `user_post_rate_fk` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`),
  ADD CONSTRAINT `user_rate_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'easyrent-old-backup', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"bank_slips\",\"categories\",\"cities\",\"contact_list\",\"countries\",\"country\",\"districts\",\"images\",\"item_ratings\",\"payments\",\"payment_type\",\"posts\",\"rent_type\",\"states\",\"users\",\"user_ratings\",\"user_roles\",\"view_name\"],\"table_structure[]\":[\"bank_slips\",\"categories\",\"cities\",\"contact_list\",\"countries\",\"country\",\"districts\",\"images\",\"item_ratings\",\"payments\",\"payment_type\",\"posts\",\"rent_type\",\"states\",\"users\",\"user_ratings\",\"user_roles\",\"view_name\"],\"table_data[]\":[\"bank_slips\",\"categories\",\"cities\",\"contact_list\",\"countries\",\"country\",\"districts\",\"images\",\"item_ratings\",\"payments\",\"payment_type\",\"posts\",\"rent_type\",\"states\",\"users\",\"user_ratings\",\"user_roles\",\"view_name\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(2, 'root', 'database', 'easyrent-old-2022-05-02', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"bank_slips\",\"categories\",\"cities\",\"contact_list\",\"countries\",\"country\",\"districts\",\"images\",\"item_ratings\",\"payments\",\"payment_type\",\"posts\",\"rent_type\",\"states\",\"users\",\"user_ratings\",\"user_roles\",\"view_name\"],\"table_structure[]\":[\"bank_slips\",\"categories\",\"cities\",\"contact_list\",\"countries\",\"country\",\"districts\",\"images\",\"item_ratings\",\"payments\",\"payment_type\",\"posts\",\"rent_type\",\"states\",\"users\",\"user_ratings\",\"user_roles\",\"view_name\"],\"table_data[]\":[\"bank_slips\",\"categories\",\"cities\",\"contact_list\",\"countries\",\"country\",\"districts\",\"images\",\"item_ratings\",\"payments\",\"payment_type\",\"posts\",\"rent_type\",\"states\",\"users\",\"user_ratings\",\"user_roles\",\"view_name\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2022-05-27 19:33:19', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
