-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2023 at 05:53 PM
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
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `location`, `name_tour`, `sub_name_tour`, `period`, `name_user`, `member`, `phone`, `user`, `tranfer`, `status`, `day`, `to_date`, `people`, `doc`, `guide`, `guide_phone`, `create_at`, `price`) VALUES
(61, 25, 'ทริปกรุงเทพ ไหว้พระ 9 วัดรอบกรุงเทพมหานคร', 'ชื่นชมความงามและอิ่มบุญตามรอยพระพุทธศาสนา', '1 วัน', 'นันท์นภัส เขตใหญ่', '', '0624921307', 'nannapat.ket@ku.th', '', 1, '2023-03-21', '2023-03-21', 2, '', '', '', '2023-03-21 12:50:43', 1598),
(62, 26, 'แพ็คเกจที่เที่ยวธรรมชาติ ป่ากลางกรุงเทพมหานคร', 'ที่เที่ยวธรรมชาติป่ากลางกรุง สัมผัสบรรยากาศรมรื่นย์', '1 วัน', 'แทมแทม ทาทา', 'แทมแทมแทม', '0982744212', 'tatam@gmail.com', 'rb0sp--+++Test1.jpg', 4, '2023-03-25', '2023-03-25', 1, 'nrpwj-Chonburi_1Day.pdf', 'นพวิทย์ ศรีบุญรัตน์', '0859784123', '2023-03-21 20:30:45', 599);

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
(4, 'เทพกาญ', 'ศรีอรุโณทัย', '1-007845', '09834656542', 'karn@gmail.com', 'xkb4o-Guide02.jpg', '2023-03-19 09:57:48', '2023-03-21 13:13:50'),
(5, 'ภัทร', 'เกตุกุณ', '1-007456', '09876543399', 'patpat08@gmail.com', '3ui2z-Guide_01.jpg', '2023-03-20 02:40:11', '2023-03-21 13:11:45'),
(6, 'มินตรา', 'ทองจันทร์', '1007481', '0964512411', 'mintra1@gmail.com', 'ye49s-Guide03.jpg', '2023-03-21 13:16:42', '2023-03-21 13:16:42'),
(7, 'นพวิทย์', 'ศรีบุญรัตน์', '1001145', '0859784123', 'game011@gmail.com', 't8368-Guide04.jpg', '2023-03-21 13:19:15', '2023-03-21 13:19:15'),
(8, 'กชนันท์', 'จิตอิ่มเอม', '1001475', '0912347512', 'nannan@gmail.com', 't6ufu-Guide05.jpg', '2023-03-21 13:21:23', '2023-03-21 13:21:23');

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
(25, 'ทริปกรุงเทพ ไหว้พระ 9 วัดรอบกรุงเทพมหานคร', 799, '245cp-Bkk_Temple.jpg', 'ไทย', '6xvn8-Bkk_Temple.pdf', '1 วัน', 'ชื่นชมความงามและอิ่มบุญตามรอยพระพุทธศาสนา'),
(26, 'แพ็คเกจที่เที่ยวธรรมชาติ ป่ากลางกรุงเทพมหานคร', 599, '8r7jk-Bkk_forest.jpg', 'ไทย', '9k7nj-Bkk_Forest.pdf', '1 วัน', 'ที่เที่ยวธรรมชาติป่ากลางกรุง สัมผัสบรรยากาศรมรื่นย์'),
(27, 'ทริปสวนสนุกดรีมเวิลด์ กรุงเทพมหานคร', 1190, 'irflp-Bkk_dreamworld.jpg', 'ไทย', 'ostqk-BKK_Dreamworld.pdf', '1 วัน', 'เครื่องเล่นสวนสนุกดรีมเวิลด์ ที่จะพาคุณไปเพลิดเพลินกับความมันส์'),
(47, 'แพ็คเกจเอเชียทีคพร้อมดินเนอร์บนเรือสำราญ กรุงเทพมหานคร', 1590, 'bhbn1-bangkok03.jpg', 'ไทย', '57io1-Bkk_Asiatique.pdf', '1 วัน', 'เอเชียทีคสถานที่สุดชิค ของคนชิคๆ พร้อมกับรับประทานอาหารดินเนอร์บนเรือสำราญหรู'),
(48, 'แพ็คเกจท่องเที่ยวพิพิธภัณฑ์ และSEA&LIFE กลางใจกรุงเทพมหานคร', 2790, 'jo9dv-Bkk_museum.jpg', 'ไทย', 'ku3m3-Bkk-Museum.pdf', '1 วัน', 'ตะลุยพิพิธภัณฑ์สำหรับคนชอบศิลปะกลางใจกรุงเทพมหานคร พร้อมท่องโลกใต้ทะเลกับ SEA&LIFE BANKKOK'),
(49, 'ดำน้ำแสมสาร-ชลบุรี ', 2590, 'vqew3-Chonburi-SamSarn.jpg', 'ไทย', 'vs7v9-Chonburi-SamSarn.pdf', '2 วัน 1 คืน', 'ดำน้ำดูประการังที่แสมสาร ไหว้พระทำบุญวัดดังชลบุรี'),
(50, 'เกาะกูด-ชลบุรี ท่องเที่ยวเกาะสายน้ำแห่งท้องทะเล', 3890, 'filol-Koh-kood.jpg', 'ไทย', 'ww2n9-Chonburi_Koh-Kood.pdf', '3 วัน 2 คืน', 'กิจกรรมดำน้ำดูประการังตามเกาะต่างๆ สนุดสุดฟิน'),
(51, 'One Day Trip ดำน้ำ สามเกาะ-ชลบุรี', 2489, 'o3nnb-Pattaya1Day.jpg', 'ไทย', 'xwnal-Chonburi_1Day.pdf', '3 วัน 2 คืน', '1 วันกับการดำน้ำดูประการัง ชิคๆฟินๆ'),
(52, 'ทริปเกาะล้าน-ชลบุรี ', 3990, '052bp-Chonburi-Koh-larn.jpg', 'ไทย', 'arw6m-Chonburi-Koh-larn.pdf', '2 วัน 1 คืน', 'เรือส่วนตัวถึงเกาะล้าน ที่พักแบบส่วนตัวพร้อมกิจกรรมต่างๆมากกว่า 10 กิจกรรม'),
(53, 'ทริป บางแสน-ชลบุรี', 499, 'hx6qj-Pattaya_Bangsaen.jpg', 'ไทย', 'aqoep-Chonburi_BangSaen.pdf', '1 วัน', '1 วันกับบางแสนที่เที่ยวใกล้กรุงเทพในวันหยุด'),
(54, 'แพ็คเกจตกหมึก พัทยา-ชลบุรี ', 2499, '0ikcr-Pattaya.jpg', 'ไทย', 'qlq9q-ChonBuri_Pattaya.pdf', '1 วัน', 'ล่องเรือตกหมึกทะเลพัทยา');

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
('Admin', 'KIND SO GROUP TRAVEL', '0999999999', 'KindSoGroupTravel@gmail.com', 'admin', 'admin'),
('ธนกร', 'คำหอม', '0877983220', 'momeyystz@gmail.com', '1234', 'user'),
('นันท์นภัส', 'เขตใหญ่', '0624921307', 'nannapat.ket@ku.th', '1234', 'user'),
('ชนิกานต์', 'ทาแทม', '0877983220', 'stangnapxt@gamil.com', '123456', 'user'),
('แทมแทม', 'ทาทา', '0982744212', 'tatam@gmail.com', '123456', 'user');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `guide`
--
ALTER TABLE `guide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

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
