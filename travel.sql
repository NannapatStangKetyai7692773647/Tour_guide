-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2023 at 02:40 PM
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
  `guide_phone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `location`, `name_tour`, `sub_name_tour`, `period`, `name_user`, `member`, `phone`, `user`, `tranfer`, `status`, `day`, `to_date`, `people`, `doc`, `guide`, `guide_phone`) VALUES
(34, 28, 'แพ็คเกจที่เที่ยวพิพิธภัณฑ์ ในกรุงเทพมหานคร', 'แพ็คเกจที่เที่ยวพิพิธภัณฑ์ ในกรุงเทพมหานคร', '1 วัน', 'ชนิกานต์ ทาแทม', 'ทาแทม, ปลานิล', '0877983220', 'stangnapxt@gamil.com', 'src/assets/img/10909472.jpg', 2, '2023-03-17', '2023-03-17', 1, '', '', ''),
(35, 34, 'แพ็คเกจเกาะกูด พักที่ Paradise Beach Resort', 'เกาะศอก ดำน้ำดูประการัง ตกปลา ', '3 วัน 2 คืน', 'ชนิกานต์ ทาแทม', 'แทมแทม, โม่ง, สำลี', '0877983220', 'stangnapxt@gamil.com', 'src/assets/img/Ratcha1.jpg', 2, '2023-03-17', '2023-03-17', 1, '', '', ''),
(36, 30, 'แกงใต้แคมป์ กาญจนบุรี', 'แพนอนริมน้ำใหม่ตั้งอยู่ระหว่างเขื่อนศรีนครินทร์กับเขื่อนท่าทุ่งนา ', '2 วัน 1 คืน', 'ชนิกานต์ ทาแทม', 'แทมแทม รวย', '0877983220', 'stangnapxt@gamil.com', 'src/assets/img/กาญ03.jpg', 2, '2023-03-17', '2023-03-17', 1, '', '', '');

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
(25, 'ทริปกรุงเทพ ไหว้พระ 9 วัดรอบกรุงเทพมหานคร', 589, 'src/assets/img/ทริปกรุงเทพ 1วัน ไหว้พระ 9วัด.jpg', 'ไทย', 'src/assets/pdf/ทริปกรุงเทพ 1วัน ไหว้พระ 9วัด.pdf', '1 วัน', 'ชื่นชมความงามและอิ่มบุญตามรอยพระพุทธศาสนา'),
(26, 'แพ็คเกจที่เที่ยวธรรมชาติ ป่ากลางกรุง', 299, 'src/assets/img/แพ็คเกจที่เที่ยวธรรมชาติ ป่ากลางกรุง.jpg', 'ไทย', 'src/assets/pdf/ทริปกรุงเทพ ธรรมชาติป่าในกรุง.pdf', '1 วัน', 'ที่เที่ยวธรรมชาติป่ากลางกรุง สัมผัสบรรยากาศรมรื่นย์'),
(27, 'ทริปสวนสนุกดรีมเวิลด์', 559, 'src/assets/img/ทริปสวนสนุกดรีมเวิลด์.jpg', 'ไทย', 'src/assets/pdf/ทริปสวนสนุกดรีมเวิลด์.pdf', '1 วัน', 'เครื่องเล่นสวนสนุกดรีมเวิลด์ ที่จะพาคุณไปเพลิดเพลินกับความมันส์'),
(28, 'แพ็คเกจที่เที่ยวพิพิธภัณฑ์ ในกรุงเทพมหานคร', 289, 'src/assets/img/แพ็คเกจที่เที่ยวพิพิธภัณฑ์ ในกรุงเทพมหานคร.jpg', 'ไทย', 'src/assets/pdf/ทริปพิพิธภัณฑ์ ในกรุงเทพมหานคร.pdf', '1 วัน', 'แพ็คเกจที่เที่ยวพิพิธภัณฑ์ ในกรุงเทพมหานคร'),
(29, 'แพ็คเกจกาญจนบุรี บ้านพักส่วนตัว', 1890, 'src/assets/img/La Forestabytheriver lodge.jpg', 'ไทย', 'src/assets/pdf/La Forestabytheriver lodge.pdf', '2 วัน 1 คืน', 'แพ็คเกจกาญจนบุรี บ้านพักส่วนตัว Ls Foresta Kanchanaburi'),
(30, 'แกงใต้แคมป์ กาญจนบุรี', 1890, 'src/assets/img/แกงใต้แคมป์ กาญจนบุรี.jpg', 'ไทย', 'src/assets/pdf/แกงใต้แคมป์ กาญจนบุรี.pdf', '2 วัน 1 คืน', 'แพนอนริมน้ำใหม่ตั้งอยู่ระหว่างเขื่อนศรีนครินทร์กับเขื่อนท่าทุ่งนา '),
(31, 'ที่พักโก๋ เมืองกาญจน์ พาราไดซ์ วิว รีสอร์ท', 1100, 'src/assets/img/ที่พักโก๋ เมืองกาญจน์ พาราไดซ์ วิว รีสอร์ท.jpg', 'ไทย', 'src/assets/pdf/ที่พักโก๋ เมืองกาญจน์ พาราไดซ์ วิว รีสอร์ท.pdf', '3 วัน 2 คืน', 'ที่พักโก๋ เมืองกาญจน์ พาราไดซ์ วิว รีสอร์ท'),
(32, 'ที่พักเดอะ ริเวอร์แคว รีโซเทล', 4850, 'src/assets/img/ที่พักเดอะ ริเวอร์แคว รีโซเทล.jpg', 'ไทย', 'src/assets/pdf/ที่พักเดอะ ริเวอร์แคว รีโซเทล.pdf', '3 วัน 2 คืน', 'ที่พักเดอะ ริเวอร์แคว รีโซเทล'),
(33, 'แพ็คเกจดำน้ำ แสมสาร พักที่ วราสินธ์ รีสอร์ท', 2860, 'src/assets/img/แพ็คเกจดำน้ำ แสมสาร 2 วัน 1 คืน พักที่ วราสินธ์ รีสอร์ท.jpg', 'ไทย', 'src/assets/pdf/แพ็คเกจดำน้ำ แสมสาร 2 วัน 1 คืน พักที่ วราสินธ์ รีสอร์ท.pdf', '2 วัน 1 คืน', 'แพ็คเกจดำน้ำ แสมสาร พักที่ วราสินธ์ รีสอร์ท'),
(34, 'แพ็คเกจเกาะกูด พักที่ Paradise Beach Resort', 5800, 'src/assets/img/แพ็คเกจเกาะกูด 3 วัน 2 คืน พักที่ Koh Kood Paradise Beach Resort.jpg', 'ไทย', 'src/assets/pdf/แพ็คเกจเกาะกูด 3 วัน 2 คืน พักที่ Koh Kood Paradise Beach Resort.pdf', '3 วัน 2 คืน', 'เกาะศอก ดำน้ำดูประการัง ตกปลา '),
(35, 'แพ็คเกจตกปลา หรือ ดำน้ำ 3 เกาะ กรุ๊ปส่วนตัว', 8000, 'src/assets/img/แพ็คเกจตกปลา หรือ ดำน้ำ 3 เกาะ One Day Trip กรุ๊ปส่วนตัว.jpg', 'ไทย', 'src/assets/pdf/แพ็คเกจตกปลา หรือ ดำน้ำ 3 เกาะ One Day Trip กรุ๊ปส่วนตัว.pdf', '1 วัน', 'แพ็คเกจตกปลา หรือ ดำน้ำ 3 เกาะ One Day Trip กรุ๊ปส่วนตัว'),
(36, 'โปรแกรมทัวร์บางแสน-ชลบุรี (1 วัน)', 789, 'src/assets/img/โปรแกรมทัวร์บางแสน-ชลบุรี (1 วัน).jpg', 'ไทย', 'src/assets/pdf/โปรแกรมทัวร์บางแสน-ชลบุรี (1 วัน).pdf', '1 วัน', 'โปรแกรมทัวร์บางแสน-ชลบุรี (1 วัน)'),
(37, 'แพ็คเกจทัวร์ตกหมึกพัทยา-ชลบุรี ', 299, 'src/assets/img/พัทยา.jpg', 'ไทย', 'src/assets/pdf/พัทยา.pdf', '1 วัน', 'แพ็คเกจทัวร์ตกหมึกพัทยา-ชลบุรี '),
(38, 'แพ็คเกจที่เที่ยวสวนผึ้งกับ แสตมป์ ฮิลส์ รีสอร์ท', 3990, 'src/assets/img/Ratcha1.jpg', 'ไทย', 'src/assets/pdf/Ratcha1.pdf', '2 วัน 1 คืน', 'แพ็คเกจที่เที่ยวสวนผึ้งกับ แสตมป์ ฮิลส์ รีสอร์ท'),
(39, 'แพ็คเกจที่เที่ยวสวนผึ้งกับ มะหาด-ไทธารา โฮมสเตย์', 3990, 'src/assets/img/Ratcha2.jpg', 'ไทย', 'src/assets/pdf/Ratcha2.pdf', '2 วัน 1 คืน', 'สัมผัสกับบรรยากาศการกางเต๊นท์ที่สวนผึ้งราชบุรี'),
(40, 'แพ็คเกจเอเชียทีคพร้อมดินเนอร์บนเรือสำราญ', 1790, 'src/assets/img/แพ็คเกจเอเชียทีคพร้อมดินเนอร์บนเรือสำราญ.jpg', 'ไทย', 'src/assets/pdf/แพ็คเกจเอเชียทีคพร้อมดินเนอร์บนเรือสำราญ.pdf', '1 วัน', 'เที่ยวเอเชียทีคพร้อมดินเนอร์บนเรือสำราญ');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

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
