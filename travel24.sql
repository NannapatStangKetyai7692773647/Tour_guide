-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2023 at 12:36 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travel`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`fname`, `lname`, `phone`, `email`, `pwd`, `role`) VALUES
('ariyavas', 'phaipong', '0992439788', 'ariyavas@gmail.com', '1234', 'user'),
('บอล', 'เชิญยิ้ม', '0912345678', 'ball@gmail.com', '111', 'user'),
('Admin', 'KIND SO GROUP TRAVEL', '0999999999', 'KindSoGroupTravel@gmail.com', 'admin', 'admin'),
('ธนกร', 'คำหอม', '0877983220', 'momeyystz@gmail.com', '1234', 'user'),
('นันท์นภัส', 'เขตใหญ่', '0624921307', 'nannapat.ket@ku.th', '1234', 'user'),
('ชนิกานต์', 'ทาแทม', '0877983220', 'stangnapxt@gamil.com', '123456', 'user'),
('แทมแทม', 'ทาทา', '0982744212', 'tatam@gmail.com', '123456', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
