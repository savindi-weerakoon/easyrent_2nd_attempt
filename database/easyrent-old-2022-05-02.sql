-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2022 at 04:42 PM
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
(83, 'savindi', 'savindi', 'weerakoon', 'savindiweerakoon@gmail.com', NULL, '16101!181@171#141$191%131^151&', NULL, 'd06dfb8415dc2f5debd336b73eb15640aeca412f0389edd0ac818246db5fe46ce3e6aaceb8d827f0b66021b969c55e99b6d9f71049954d690723978535ce3652', '2022-05-02 14:04:11', 2),
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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
