-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2023 at 07:50 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `did` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `dept` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`did`, `Email`, `Name`, `dept`) VALUES
(10, 'doc1@Gmail.com', 'doc1', 'dept 1'),
(11, 'doc2@Gmail.com', 'doc2', 'dept 2'),
(12, 'doc3@Gmail.com', 'doc2', 'dept 3'),
(13, 'chy@Gmail.com', 'chy', '');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `mid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `date` date NOT NULL,
  `name` varchar(100) NOT NULL,
  `Med` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`mid`, `quantity`, `date`, `name`, `Med`) VALUES
(45, 10, '2023-01-07', 'pat1', 'Medicine1');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `pid` int(11) NOT NULL,
  `same` varchar(10) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `disease` varchar(5000) NOT NULL,
  `time` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `dept` varchar(50) NOT NULL,
  `phone` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`pid`, `same`, `Email`, `Name`, `gender`, `disease`, `time`, `date`, `dept`, `phone`) VALUES
(20, '20', 'bishap@Gmail.com', 'pat1', 'Male', 'pat', 'slot 1', '2023-01-18', 'dept 1', '1234123412');

-- --------------------------------------------------------

--
-- Table structure for table `signin`
--

CREATE TABLE `signin` (
  `id` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Email` varchar(500) NOT NULL,
  `Contact` varchar(50) NOT NULL,
  `Password` mediumtext NOT NULL,
  `confirm` mediumtext NOT NULL,
  `type` varchar(10) NOT NULL,
  `dept` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `signin`
--

INSERT INTO `signin` (`id`, `Name`, `Email`, `Contact`, `Password`, `confirm`, `type`, `dept`) VALUES
(16, 'doc1', 'doc1@Gmail.com', '9999999999', 'pbkdf2:sha256:260000$DeZVzbKapMUY0H4V$9af20ff74a21f5795cc7a81fb2290bf158e6fbd14d6f92083799ec295a32b105', 'pbkdf2:sha256:260000$hzy57AkQ1CbbG597$bc55703646f087fbfe204ab4ce396021c81cab4d354fb633a589041fddc604cc', 'doctor', 'dept 1'),
(17, 'doc2', 'doc2@Gmail.com', '8888888888', 'pbkdf2:sha256:260000$NQMMx1uf7o4ETsrb$d46fc520225a5ee035394635cad54b05fdb72ad230294f6f7411e5b2a9b705ae', 'pbkdf2:sha256:260000$GgeKKoFRJg5MEQZO$ea5662aba9550036c3731b0d5d2102e08e44b15a5dde39ad98adea6a7c303972', 'doctor', 'dept 2'),
(18, 'doc2', 'doc3@Gmail.com', '7777777777', 'pbkdf2:sha256:260000$Nz2vsGmYq7wmeOLG$3b82047ca5eadc5032987bdbc0ae6eeaab1e41971f9c0db3bd6f4d69b670bd24', 'pbkdf2:sha256:260000$mWSboyY3kLq6Edo7$99d299b07f001fe2813dd2b044264a9d4f66e9cb99f7aaf68385850fc51d12a4', 'doctor', 'dept 3'),
(19, 'Anish', 'anish@Gmail.com', '6666666666', 'pbkdf2:sha256:260000$9pcIIo46gbUdDIe3$a41b60123b780a14c6d71f0531778580680fdcdbda1ea2191fa618459c1b16fe', 'pbkdf2:sha256:260000$ozHPjLQQS2hN75xa$d2c891426bcf9bbbbf0ea02be0c16d536d417011a6c695828a68c621c3c7c4e8', 'patient', ''),
(20, 'bishap', 'bishap@Gmail.com', '5555555555', 'pbkdf2:sha256:260000$29RNqlfKnSArZ80p$fbc5492e78d97278a180cf00af16631651045f675e5ae28ca9f6b7b995b11429', 'pbkdf2:sha256:260000$zeMkDl8fU8zLSfZw$9cce3e1cea1f7b3cf82df410d188b7a024537e35251fe571a58c2816e94a577f', 'patient', ''),
(21, 'chy', 'chy@Gmail.com', '4444444444', 'pbkdf2:sha256:260000$7Q2ci6PJeTTcCscn$a5a870618165d0b2b3c334aa2dd49a86f55d91ab5e24a942387f16370d23bcc3', 'pbkdf2:sha256:260000$V8oxydgk94slMUpG$0deecee4740869fa729413536dde867dc572b64be2a6e4e230bd50f775d4a248', 'patient', ''),
(22, 'newpat', 'newpat@Gmail.com', '1212121212', 'pbkdf2:sha256:260000$NXvGu8xsb2CeqrOP$67460059180aabfcb746770009968655ad998068d5043e193a8803edb48fcc08', 'pbkdf2:sha256:260000$Y2rzG6FAffU4ks5k$bb89465919f1f94f3adbb009268859bbec993e48770d2742e4d29bd54e93db99', 'patient', 'None');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`) VALUES
(1, 'anish'),
(2, 'ram');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`did`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`mid`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `signin`
--
ALTER TABLE `signin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `signin`
--
ALTER TABLE `signin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
