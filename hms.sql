-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2023 at 11:33 AM
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
  `id` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `dept` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `password` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`id`, `Email`, `Name`, `dept`, `phone`, `password`) VALUES
(48, 'doc1@Gmail.com', 'doc1', 'OPD', '9999888776', 'pbkdf2:sha256:260000$YZu7NM0QVQkfsvP9$1616e8122b83feef7999d8161a369b2be01ccf49d9eab5dfce689b91ee9eea57'),
(49, 'doc2@Gmail.com', 'doc2', 'IPD', '654565456', 'pbkdf2:sha256:260000$7zMXEYMdrBHRpqlD$895c920cf620b5a2a8b2d49f7d0d86add95eef19cb870377dd5c914e3bd080af'),
(50, 'doc3@Gmail.com', 'doc3', 'Oncology', '987678987', 'pbkdf2:sha256:260000$4zrcve6CheeRuwnP$08ba13b6c0befea0ff74a5a61d01ba2b6d34d4726b7943214a28bc2af3a298aa'),
(51, 'doc4@Gmail.com', 'doc4', 'Pediatrics', '234543234', 'pbkdf2:sha256:260000$wmpUjYCG0jYS9wry$a55316c9f0b351e15accdb4e34794011d03cf468818c39d91f88ae36f13270fd'),
(52, 'doc5@Gmail.com', 'doc5', 'Neurology', '876787678', 'pbkdf2:sha256:260000$WGmZ6XiCjCplCwEl$7e34727fff536829953fc343698ef51eec633a1cbb8463430f8868514e5eb5d0'),
(53, 'doc6@Gmail.com', 'doc6', 'Orthopaedic', '5434567854', 'pbkdf2:sha256:260000$mwnfCzLcEKQbpFmb$98212cdef50343af815b3b6714130941b5e76b8dcf296e883079aa41b4bd045a');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `mid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `date` date NOT NULL,
  `name` varchar(100) NOT NULL,
  `Med` varchar(100) NOT NULL,
  `dept` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`mid`, `quantity`, `date`, `name`, `Med`, `dept`) VALUES
(48, 12, '2023-01-19', 'pat1', 'colaba', 'OPD'),
(49, 1, '2023-01-19', 'pat1', 'zxcv1', 'OPD');

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
(29, '25', 'pat1@Gmail.com', 'pat1', 'Male', 'fever', 'slot 2', '2023-01-29', 'OPD', '9999888776'),
(30, '70', 'pat2@Gmail.com', 'pat2', 'Female', 'female', 'slot 1', '2023-01-20', 'IPD', '9988998899');

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
(25, 'pat1', 'pat1@Gmail.com', '9999999999', 'pbkdf2:sha256:260000$MjBXPZ0qFUkMs6bq$15d66da2370fb7c99160e887cd5d9509e0d73a3b9e0f9210d136cb8e9bee66cd', 'pbkdf2:sha256:260000$rD3dUj2qlycxO17D$7b123c2ea118b14f365b205464b9cb77541e41cca52601b39ba5f3f36789bc7d', 'patient', 'None'),
(53, 'anurag', '7259154670a@gmail,com', '7259154670', 'pbkdf2:sha256:260000$nRgPvprXrkTBFPry$f7dc99c11dda4860c6dd5a2581c4167584a5c0422327d9c7bb552862385d5b2f', 'pbkdf2:sha256:260000$ceHIVVh5fwspqyLK$d2e83612b4907d6b311d47e500f9b2bfb1404005fa816c759073b1532599b076', 'patient', 'None'),
(57, 'Ayush', 'Ayush@Gmail.com', '4567876543', 'pbkdf2:sha256:260000$7PAODzx7BvWvTrno$51de600afb8f1d1814bcb2128940f56d57a38568479cc9b0222ce9e9cb2fe03d', 'pbkdf2:sha256:260000$y8LmmrmZRNwyowfP$dcfa4666c68e4fc09c6b7b9e7f836fc6e180fc7068f2cc277cde1dbd86322cd4', 'admin', 'None'),
(63, 'doc1', 'doc1@Gmail.com', '9999888776', 'pbkdf2:sha256:260000$YZu7NM0QVQkfsvP9$1616e8122b83feef7999d8161a369b2be01ccf49d9eab5dfce689b91ee9eea57', 'pbkdf2:sha256:260000$YZu7NM0QVQkfsvP9$1616e8122b83feef7999d8161a369b2be01ccf49d9eab5dfce689b91ee9eea57', 'doctor', 'OPD'),
(64, 'doc2', 'doc2@Gmail.com', '654565456', 'pbkdf2:sha256:260000$7zMXEYMdrBHRpqlD$895c920cf620b5a2a8b2d49f7d0d86add95eef19cb870377dd5c914e3bd080af', 'pbkdf2:sha256:260000$7zMXEYMdrBHRpqlD$895c920cf620b5a2a8b2d49f7d0d86add95eef19cb870377dd5c914e3bd080af', 'doctor', 'IPD'),
(65, 'doc3', 'doc3@Gmail.com', '987678987', 'pbkdf2:sha256:260000$4zrcve6CheeRuwnP$08ba13b6c0befea0ff74a5a61d01ba2b6d34d4726b7943214a28bc2af3a298aa', 'pbkdf2:sha256:260000$4zrcve6CheeRuwnP$08ba13b6c0befea0ff74a5a61d01ba2b6d34d4726b7943214a28bc2af3a298aa', 'doctor', 'Oncology'),
(66, 'doc4', 'doc4@Gmail.com', '234543234', 'pbkdf2:sha256:260000$wmpUjYCG0jYS9wry$a55316c9f0b351e15accdb4e34794011d03cf468818c39d91f88ae36f13270fd', 'pbkdf2:sha256:260000$wmpUjYCG0jYS9wry$a55316c9f0b351e15accdb4e34794011d03cf468818c39d91f88ae36f13270fd', 'doctor', 'Pediatrics'),
(67, 'doc5', 'doc5@Gmail.com', '876787678', 'pbkdf2:sha256:260000$WGmZ6XiCjCplCwEl$7e34727fff536829953fc343698ef51eec633a1cbb8463430f8868514e5eb5d0', 'pbkdf2:sha256:260000$WGmZ6XiCjCplCwEl$7e34727fff536829953fc343698ef51eec633a1cbb8463430f8868514e5eb5d0', 'doctor', 'Neurology'),
(68, 'doc6', 'doc6@Gmail.com', '5434567854', 'pbkdf2:sha256:260000$mwnfCzLcEKQbpFmb$98212cdef50343af815b3b6714130941b5e76b8dcf296e883079aa41b4bd045a', 'pbkdf2:sha256:260000$mwnfCzLcEKQbpFmb$98212cdef50343af815b3b6714130941b5e76b8dcf296e883079aa41b4bd045a', 'doctor', 'Orthopaedic'),
(70, 'pat2', 'pat2@Gmail.com', '76567865', 'pbkdf2:sha256:260000$34SeNKNP5na3daIl$2b47c8fa5b45934cf85b1ff2f3aeb0adf5d47ade916263524809b7180eec6d18', 'pbkdf2:sha256:260000$p0lbuHsDeEtXiFaC$ffbed8c2efc64d5f7dd27e34720aa94c9a3252243f1b350ad1b7ab5cd79b8b15', 'patient', 'None');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `Sid` int(11) NOT NULL,
  `Med Name` int(11) NOT NULL,
  `Stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`Sid`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `signin`
--
ALTER TABLE `signin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
