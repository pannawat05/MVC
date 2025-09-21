-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Sep 21, 2025 at 06:06 AM
-- Server version: 9.4.0
-- PHP Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `MVC`
--

-- --------------------------------------------------------

--
-- Table structure for table `Admin`
--

CREATE TABLE `Admin` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_520_ci NOT NULL,
  `email` text COLLATE utf8mb3_unicode_520_ci NOT NULL,
  `password` text COLLATE utf8mb3_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_520_ci;

--
-- Dumping data for table `Admin`
--

INSERT INTO `Admin` (`id`, `name`, `email`, `password`) VALUES
(1, 'panawat', '67050334@kmitl.ac.th', 'pan0334');

-- --------------------------------------------------------

--
-- Table structure for table `Application`
--

CREATE TABLE `Application` (
  `job_id` int NOT NULL,
  `candidate_id` int NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Candidates`
--

CREATE TABLE `Candidates` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_520_ci NOT NULL,
  `lname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_520_ci NOT NULL,
  `email` text COLLATE utf8mb3_unicode_520_ci NOT NULL,
  `password` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_520_ci;

--
-- Dumping data for table `Candidates`
--

INSERT INTO `Candidates` (`id`, `name`, `lname`, `email`, `password`) VALUES
(37753482, 'Juan', 'Wickwarth', 'jwickwarth8@bbc.co.uk', 'qA0&KkeTZCr'),
(41027801, 'Raychel', 'Haugen', 'rhaugen6@bbb.org', 'wA6$YC2y@0.y'),
(44370551, 'Deane', 'Rosie', 'drosie3@hubpages.com', 'qX0_W}*\'AVLK'),
(53609414, 'Peder', 'Piatek', 'ppiatek7@slate.com', 'wC5#~<9Xc`JE'),
(63756419, 'Donnajean', 'Mackstead', 'dmackstead4@ox.ac.uk', 'jP3,%ZrE'),
(67560385, 'Laurens', 'Capelow', 'lcapelow0@last.fm', 'aP5_%RK23$qxZB'),
(74891228, 'Danyette', 'Rollitt', 'drollitt9@blogtalkradio.com', 'aV8|3*_>w_HWT'),
(79692013, 'Lianna', 'O\'Leahy', 'loleahy5@shinystat.com', 'yU6)Jql,F'),
(80328139, 'Tannie', 'Valentetti', 'tvalentetti2@patch.com', 'tG0)Q.N9'),
(85141007, 'Elias', 'Tutin', 'etutin1@prlog.org', 'gM6>0%tWg');

-- --------------------------------------------------------

--
-- Table structure for table `Companies`
--

CREATE TABLE `Companies` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_520_ci NOT NULL,
  `email` text COLLATE utf8mb3_unicode_520_ci NOT NULL,
  `address` text COLLATE utf8mb3_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_520_ci;

--
-- Dumping data for table `Companies`
--

INSERT INTO `Companies` (`id`, `name`, `email`, `address`) VALUES
(44472188, 'Hirthe Group', 'bmcging1@wix.com', '20th Floor'),
(48609659, 'McCullough-Grant', 'eblyde0@nymag.com', 'PO Box 93676');

-- --------------------------------------------------------

--
-- Table structure for table `Jobs`
--

CREATE TABLE `Jobs` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_520_ci NOT NULL,
  `detail` text COLLATE utf8mb3_unicode_520_ci NOT NULL,
  `c_code` int NOT NULL,
  `deadline` text COLLATE utf8mb3_unicode_520_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_520_ci;

--
-- Dumping data for table `Jobs`
--

INSERT INTO `Jobs` (`id`, `title`, `detail`, `c_code`, `deadline`, `status`) VALUES
(80903913, 'GIS Technical Architect', '$4.30', 48609659, '9/25/2025', 1),
(14096383, 'Assistant Professor', '$3.25', 48609659, '9/24/2025', 1),
(60272013, 'Structural Analysis Engineer', '$1.87', 44472188, '9/22/2025', 1),
(76881143, 'Accounting Assistant I', '$0.25', 48609659, '9/29/2025', 1),
(89176751, 'Media Manager II', '$7.48', 48609659, '9/25/2025', 1),
(16486484, 'Editor', '$5.92', 48609659, '9/27/2025', 1),
(58133876, 'Engineer III', '$5.43', 44472188, '9/24/2025', 1),
(14374035, 'Programmer IV', '$8.85', 48609659, '9/24/2025', 1),
(19394898, 'Paralegal', '$7.86', 44472188, '9/25/2025', 1),
(26768313, 'Help Desk Operator', '$8.90', 44472188, '9/23/2025', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Application`
--
ALTER TABLE `Application`
  ADD KEY `job_id` (`job_id`,`candidate_id`);

--
-- Indexes for table `Candidates`
--
ALTER TABLE `Candidates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Companies`
--
ALTER TABLE `Companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indexes for table `Jobs`
--
ALTER TABLE `Jobs`
  ADD KEY `c_code` (`c_code`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Jobs`
--
ALTER TABLE `Jobs`
  ADD CONSTRAINT `Jobs_ibfk_1` FOREIGN KEY (`c_code`) REFERENCES `Companies` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
