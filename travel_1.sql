-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2023 at 05:25 PM
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
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `location` int(11) NOT NULL,
  `name_tour` varchar(255) NOT NULL,
  `sub_name_tour` varchar(255) NOT NULL,
  `period` varchar(255) NOT NULL,
  `name_user` varchar(255) NOT NULL,
  `member` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `tranfer` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `day` date NOT NULL,
  `to_date` date DEFAULT NULL,
  `people` int(11) NOT NULL,
  `doc` varchar(255) NOT NULL,
  `guide` varchar(255) NOT NULL,
  `guide_phone` varchar(255) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `location`, `name_tour`, `sub_name_tour`, `period`, `name_user`, `member`, `phone`, `user`, `tranfer`, `status`, `day`, `to_date`, `people`, `doc`, `guide`, `guide_phone`, `create_at`) VALUES
(38, 26, 'แพ็คเกจที่เที่ยวธรรมชาติ ป่ากลางกรุง', 'ที่เที่ยวธรรมชาติป่ากลางกรุง สัมผัสบรรยากาศรมรื่นย์', '1 วัน', 'ชนิกานต์ ทาแทม', 'ฟหดฟหด ,ดหดหด', '0877983220', 'stangnapxt@gamil.com', 'txrm1-sofa-interior-pillow-library-wallpaper-preview.jpg', 4, '2023-03-20', '2023-03-23', 1, 'gcgez-test-tour.pdf', 'Kaiii', '08766788766', '2023-03-19 10:01:03'),
(40, 25, 'ทริปกรุงเทพ ไหว้พระ 9 วัดรอบกรุงเทพมหานคร', 'ชื่นชมความงามและอิ่มบุญตามรอยพระพุทธศาสนา', '1 วัน', 'ชนิกานต์ ทาแทม', 'zczzx', '0877983220', 'stangnapxt@gamil.com', '21ziq-hd.jpg', 2, '2023-03-22', '2023-03-30', 4, '', '', '', '2023-03-19 18:51:11'),
(41, 45, 'zxczxcZxc', 'sadfasdf', 'sdfasdf', 'ชนิกานต์ ทาแทม', 'ต้น , อ้อ ', '0877983220', 'stangnapxt@gamil.com', '08bz8-screencapture-hydedate-promotion-detail-php-2023-03-09-22_47_52.png', 4, '2023-03-24', '2023-03-30', 1, 'jyuxf-test-tour.pdf', 'พรกวี ศรีอรุโณทัย', '09834656542', '2023-03-20 16:31:47'),
(42, 25, 'ทริปกรุงเทพ ไหว้พระ 9 วัดรอบกรุงเทพมหานคร', 'ชื่นชมความงามและอิ่มบุญตามรอยพระพุทธศาสนา', '1 วัน', 'นันท์นภัส เขตใหญ่', '', '0624921307', 'nannapat.ket@ku.th', '', 2, '2023-03-20', '2023-03-20', 3, '', '', '', '2023-03-20 22:06:00'),
(43, 26, 'แพ็คเกจที่เที่ยวธรรมชาติ ป่ากลางกรุง', 'ที่เที่ยวธรรมชาติป่ากลางกรุง สัมผัสบรรยากาศรมรื่นย์', '1 วัน', 'นันท์นภัส เขตใหญ่', '', '0624921307', 'nannapat.ket@ku.th', '', 1, '2023-03-21', '2023-03-21', 2, '', '', '', '2023-03-20 22:17:31');

-- --------------------------------------------------------

--
-- Table structure for table `guide`
--

CREATE TABLE `guide` (
  `id` int(11) NOT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `sname` varchar(100) DEFAULT NULL,
  `license` varchar(20) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guide`
--

INSERT INTO `guide` (`id`, `fname`, `sname`, `license`, `mobile`, `email`, `avatar`, `create_at`, `update_at`) VALUES
(4, 'พรกวี', 'ศรีอรุโณทัย', '1-98776565', '09834656542', 'test@hotmail.com', 'xd6lo-jeremy-thomas-O6N9RV2rzX8-unsplash.jpg', '2023-03-19 09:57:48', '2023-03-19 09:57:48'),
(5, 'อโนทัย', 'sdfsadfasdf', '9-925472369', '09876543399', 'newguide@xxx.xxx', 'zemi1-pexels-tiia-pakk-5075473.jpg', '2023-03-20 02:40:11', '2023-03-20 02:41:22');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `img` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `detail` varchar(255) NOT NULL,
  `day` varchar(255) NOT NULL,
  `sub_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `price`, `img`, `type`, `detail`, `day`, `sub_name`) VALUES
(25, 'ทริปกรุงเทพ ไหว้พระ 9 วัดรอบกรุงเทพมหานคร', 799, 'wolpy-Pattaya.jpg', 'ไทย', 'vryaz-Pattaya01.pdf', '1 วัน', 'ชื่นชมความงามและอิ่มบุญตามรอยพระพุทธศาสนา'),
(26, 'แพ็คเกจที่เที่ยวธรรมชาติ ป่ากลางกรุง', 299, 'gyey8-annegret.jpg', 'ไทย', 'gyva6-à¸à¸£à¸´à¸à¸ªà¸§à¸à¸ªà¸à¸¸à¸à¸à¸£à¸µà¸¡à¹à¸§à¸´à¸¥à¸à¹.pdf', '1 วัน', 'ที่เที่ยวธรรมชาติป่ากลางกรุง สัมผัสบรรยากาศรมรื่นย์'),
(27, 'ทริปสวนสนุกดรีมเวิลด์', 559, '8awrt-yellow_sunflowers_sunset_field_flowers_summer_sunrays_4_k_hd_flowers.jpg', 'ไทย', 'frowh-test-tour.pdf', '1 วัน', 'เครื่องเล่นสวนสนุกดรีมเวิลด์ ที่จะพาคุณไปเพลิดเพลินกับความมันส์'),
(45, 'zxczxcZxc', 18908, 'uxs9q-clean_calm_body_of_water_in_beach_with_rocks_hd_beach.jpg', 'ไทย', '15660-user---xxx.pdf', 'sdfasdf', 'sadfasdf'),
(46, 'ปแอผปแอผปแอ', 3000, 'knhg1-shifaaz-shamoon-qtbV_8P_Ksk-unsplash.jpg', 'ไทย', '6n1ag-test-tour.pdf', 'กดเกหเดหก', 'กหดเหกเด');

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
('Admin', 'KIND SO GROUP TRAVEL', '0999999999', 'KindSoGroupTravel@gmail.com', 'admin', 'admin'),
('ธนกร', 'คำหอม', '0877983220', 'momeyystz@gmail.com', '1234', 'user'),
('นันท์นภัส', 'เขตใหญ่', '0624921307', 'nannapat.ket@ku.th', '1234', 'user'),
('ชนิกานต์', 'ทาแทม', '0877983220', 'stangnapxt@gamil.com', '123456', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loc` (`location`),
  ADD KEY `user` (`user`);

--
-- Indexes for table `guide`
--
ALTER TABLE `guide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `guide`
--
ALTER TABLE `guide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `loc` FOREIGN KEY (`location`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user` FOREIGN KEY (`user`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
