-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2023 at 05:18 PM
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
(61, 25, 'ทริปกรุงเทพ ไหว้พระ 9 วัดรอบกรุงเทพมหานคร', 'ชื่นชมความงามและอิ่มบุญตามรอยพระพุทธศาสนา', '1 วัน', 'นันท์นภัส เขตใหญ่', 'สตางค์ เขตใหญ่', '0624921307', 'nannapat.ket@ku.th', 'jgiam-Test1.jpg', 4, '2023-03-21', '2023-03-21', 2, '2utjx-Bkk_Temple.pdf', 'กชนันท์ จิตอิ่มเอม', '0912347512', '2023-03-21 12:50:43', 1598),
(63, 54, 'แพ็คเกจตกหมึก พัทยา-ชลบุรี ', 'ล่องเรือตกหมึกทะเลพัทยา', '1 วัน', 'นันท์นภัส เขตใหญ่', '', '0624921307', 'nannapat.ket@ku.th', '', 1, '2023-03-22', '2023-03-22', 1, '', '', '', '2023-03-22 23:59:26', 2499),
(64, 55, 'หัวหิน-ประจวบคีรีขันธ์ หวานเจี๊ยบ', 'ภากลาง - ท่องเที่ยวทะเลอ่าวไทยไม่ต้องไปไกลถึงใต้', '2 วัน 1 คืน', 'นันท์นภัส เขตใหญ่', '', '0624921307', 'nannapat.ket@ku.th', '', 1, '2023-03-22', '2023-03-22', 1, '', '', '', '2023-03-23 00:22:22', 2590),
(65, 47, 'ภาคกลาง - แพ็คเกจเอเชียทีคพร้อมดินเนอร์บนเรือสำราญ กรุงเทพมหานคร', 'เอเชียทีคสถานที่สุดชิค ของคนชิคๆ พร้อมกับรับประทานอาหารดินเนอร์บนเรือสำราญหรู', '1 วัน', 'นันท์นภัส เขตใหญ่', '', '0624921307', 'nannapat.ket@ku.th', '', 1, '2023-03-22', '2023-03-22', 1, '', '', '', '2023-03-23 00:31:49', 1590),
(66, 61, 'ทัวร์เกาะราชา - ภูเก็ต', 'ภาคใต้ - บริการนำเที่ยวเกาะ เกาะสวยสุดคุ้มค่า เกาะราชา ที่สวยงาม เหมาะแก่การเดินทางมาพักผ่อนเป็นอย่างมาก', '2 วัน 1 คืน', 'นันท์นภัส เขตใหญ่', '', '0624921307', 'nannapat.ket@ku.th', '', 1, '2023-03-22', '2023-03-22', 1, '', '', '', '2023-03-23 01:59:42', 3100),
(67, 67, 'ทัวร์เชียงใหม่ เชียงดาว อ่างขาง', 'ภาคเหนือ - ทัวร์เชียงใหม่ รับบรรยากาศสุดฟิน ', '4 วัน 3 คืน ', 'นันท์นภัส เขตใหญ่', '', '0624921307', 'nannapat.ket@ku.th', '', 1, '2023-03-22', '2023-03-22', 1, '', '', '', '2023-03-23 02:33:19', 5590),
(68, 26, 'แพ็คเกจที่เที่ยวธรรมชาติ ป่ากลางกรุงเทพมหานคร', 'ภาคกลาง - ที่เที่ยวธรรมชาติป่ากลางกรุง สัมผัสบรรยากาศรมรื่นย์', '1 วัน', 'นันท์นภัส เขตใหญ่', '', '0624921307', 'nannapat.ket@ku.th', '', 1, '2023-03-23', '2023-03-23', 1, '', '', '', '2023-03-23 09:06:32', 599),
(69, 27, 'ทริปสวนสนุกดรีมเวิลด์ กรุงเทพมหานคร', 'ภาคกลาง - เครื่องเล่นสวนสนุกดรีมเวิลด์ ที่จะพาคุณไปเพลิดเพลินกับความมันส์', '1 วัน', 'นันท์นภัส เขตใหญ่', '', '0624921307', 'nannapat.ket@ku.th', '', 1, '2023-03-23', '2023-03-23', 1, '', '', '', '2023-03-23 18:41:18', 1190),
(70, 47, 'แพ็คเกจเอเชียทีคพร้อมดินเนอร์บนเรือสำราญ กรุงเทพมหานคร', 'ภาคกลาง - เอเชียทีคสถานที่สุดชิค ของคนชิคๆ พร้อมกับรับประทานอาหารดินเนอร์บนเรือสำราญหรู', '1 วัน', 'วิทย์ นพคุณ', 'แมว\nหมา\nไก่\nปู\nกุ้ง\nนก\nแพรว', '0974581236', 'wit01@gmail.com', 'jmjo6-Test1.jpg', 4, '2023-04-14', '2023-04-14', 7, 'jvs0q-Bkk_Asiatique.pdf', 'เทพกาญ ศรีอรุโณทัย', '09834656542', '2023-03-23 18:58:20', 11130);

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
(8, 'กชนันท์', 'จิตอิ่มเอม', '1001475', '0912347512', 'nannan@gmail.com', 'ys41k-Guide06.png', '2023-03-21 13:21:23', '2023-03-23 12:16:50'),
(9, 'เจนนี่', 'แบล็กพิงค์', '1-014442', '0963214852', 'janneyjane@gmail.com', 'xqwn1-Guide05.jpg', '2023-03-23 12:16:16', '2023-03-23 12:16:16'),
(10, 'เก้า', 'จิรายุ', '1-014236', '0812345678', 'kaoji49@gmail.com', '98s5w-Guide07.jpg', '2023-03-23 12:19:25', '2023-03-23 12:19:25');

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
(25, 'ทริปกรุงเทพ ไหว้พระ 9 วัดรอบกรุงเทพมหานคร', 799, 'ksrg0-Bkk_Temple.jpg', 'ไทย', '9z3p9-Bkk_Temple.pdf', '1 วัน', 'ภาคกลาง - ชื่นชมความงามและอิ่มบุญตามรอยพระพุทธศาสนา'),
(26, 'แพ็คเกจที่เที่ยวธรรมชาติ ป่ากลางกรุงเทพมหานคร', 599, 'q7ds2-Bkk_forest.jpg', 'ไทย', 'hmw1q-Bkk_Forest.pdf', '1 วัน', 'ภาคกลาง - ที่เที่ยวธรรมชาติป่ากลางกรุง สัมผัสบรรยากาศรมรื่นย์'),
(27, 'ทริปสวนสนุกดรีมเวิลด์ กรุงเทพมหานคร', 1190, 'zqx0y-Bkk_dreamworld.jpg', 'ไทย', 'ys2z3-BKK_Dreamworld.pdf', '1 วัน', 'ภาคกลาง - เครื่องเล่นสวนสนุกดรีมเวิลด์ ที่จะพาคุณไปเพลิดเพลินกับความมันส์'),
(47, 'แพ็คเกจเอเชียทีคพร้อมดินเนอร์บนเรือสำราญ กรุงเทพมหานคร', 1590, 'm5kly-Bkk-asia.jpg', 'ไทย', 'z5yym-Bkk_Asiatique.pdf', '1 วัน', 'ภาคกลาง - เอเชียทีคสถานที่สุดชิค ของคนชิคๆ พร้อมกับรับประทานอาหารดินเนอร์บนเรือสำราญหรู'),
(48, 'แพ็คเกจท่องเที่ยวพิพิธภัณฑ์ และSEA&LIFE กลางใจกรุงเทพมหานคร', 2790, 'pzjj3-Bkk_museum.jpg', 'ไทย', '41svz-Bkk_Asiatique.pdf', '1 วัน', 'ภาคกลาง - ตะลุยพิพิธภัณฑ์สำหรับคนชอบศิลปะกลางใจกรุงเทพมหานคร พร้อมท่องโลกใต้ทะเลกับ SEA&LIFE BANKKOK'),
(49, 'ดำน้ำแสมสาร-ชลบุรี ', 2590, 'rna13-Chonburi-SamSarn.jpg', 'ไทย', '15n5m-Chonburi-SamSarn.pdf', '2 วัน 1 คืน', 'ภาคตะวันออก - ดำน้ำดูประการังที่แสมสาร ไหว้พระทำบุญวัดดังชลบุรี'),
(50, 'เกาะกูด-ชลบุรี ท่องเที่ยวเกาะสายน้ำแห่งท้องทะเล', 3890, 'up4im-Koh-kood.jpg', 'ไทย', 'nxayo-Chonburi_Koh-Kood.pdf', '3 วัน 2 คืน', 'ภาคตะวันออก - กิจกรรมดำน้ำดูประการังตามเกาะต่างๆ สนุดสุดฟิน'),
(51, 'One Day Trip ดำน้ำ สามเกาะ-ชลบุรี', 2489, '25fph-Pattaya1Day.jpg', 'ไทย', 'ald3u-Chonburi_1Day.pdf', '3 วัน 2 คืน', 'ภาคตะวันออก - 1 วันกับการดำน้ำดูประการัง ชิคๆฟินๆ'),
(52, 'ทริปเกาะล้าน-ชลบุรี ', 3990, 'wa2j5-Chonburi-Koh-larn.jpg', 'ไทย', 'nzsht-Chonburi-Koh-larn.pdf', '2 วัน 1 คืน', 'ภาคตะวันออก - เรือส่วนตัวถึงเกาะล้าน ที่พักแบบส่วนตัวพร้อมกิจกรรมต่างๆมากกว่า 10 กิจกรรม'),
(53, 'ทริป บางแสน-ชลบุรี', 499, 'g9vr8-Pattaya_Bangsaen.jpg', 'ไทย', '0093t-Chonburi_BangSaen.pdf', '1 วัน', 'ภาคตะวันออก - 1 วันกับบางแสนที่เที่ยวใกล้กรุงเทพในวันหยุด'),
(54, 'แพ็คเกจตกหมึก พัทยา-ชลบุรี ', 2499, '1z35r-Pattaya_Tok.jpg', 'ไทย', '7o9gg-ChonBuri_Pattaya.pdf', '1 วัน', 'ภาคตะวันออก - ล่องเรือตกหมึกทะเลพัทยา'),
(55, 'หัวหิน-ประจวบคีรีขันธ์ หวานเจี๊ยบ', 2590, 'poemq-Huahin.jpg', 'ไทย', '5npdo-Huahin.pdf', '2 วัน 1 คืน', 'ภากลาง - ท่องเที่ยวทะเลอ่าวไทยไม่ต้องไปไกลถึงใต้'),
(56, 'ทริปดูวาฬ @สมุทรสงคราม', 1599, 'nhd34-Samutsongkarm@.jpeg', 'ไทย', '10iih-Samutsongkarm.pdf', '1 วัน', 'ภาคกลาง - ดูปลาวาฬบรูด้า ไม่ต้องเดินทางไปถึงต่างประเทศ แค่มา สมุทรสงคราม ก็ได้ดูแล้ว '),
(57, 'อัมพวา-สมุทรสงคราม พาเพลิน', 2599, 'nnekb-Samutsongkarm.jpeg', 'ไทย', 'l3jk3-Samutsongkarm01.pdf', '1 วัน', 'ภาคกลาง - ชื่นชมตลาดน้ำโบราณ พร้อมชมความของหิ่งห้อยในตอนกลางคืน ไหว้พระวัดดังสมุทรสงคราม'),
(58, 'ทริปเส้นทางเมืองรอง บูชาพระราหู กรุงเทพฯ – นครปฐม', 899, 'syilo-Nakorn01.jpg', 'ไทย', 'tbkjg-Nakorn01.pdf', '1 วัน', 'ภาคกลาง - ไหว้พระวัดประจำจังหวัด พร้อมเดินชมตลาดน้ำโฐราณ'),
(59, 'แพ็คเกจสวนผึ้ง-ราชบุรี พักกับ แสตมป์ ฮิลส์ รีสอร์ท', 2790, 'du6pw-Ratcha1.jpg', 'ไทย', 'jwe3m-Ratcha01.pdf', '3 วัน 2 คืน', 'ภาคกลาง - ชิลๆที่สวนผึ้งท่ามกลางธรรมชาติ เหมาะกับสายแคมป์วัยรุ่น'),
(60, 'แพ็คเกจสวนผึ้ง มะหาด-ไทธารา โฮมสเตย์-จุดกางเต็นท์ราชบุรี', 3900, 'ezqc8-Ratcha2.jpg', 'ไทย', 'gt623-Ratcha02.pdf', '2 วัน 1 คืน', 'ภาคกลาง - จุดกางเต๊นท์สำหรับสายแคมป์ ชื่นชมบรรยากาศหมกยามเช้าสุดฟิน'),
(61, 'ทัวร์เกาะราชา - ภูเก็ต', 3100, 'akw68-Phuket01.jpg', 'ไทย', '9tii8-Phuket01.pdf', '2 วัน 1 คืน', 'ภาคใต้ - บริการนำเที่ยวเกาะ เกาะสวยสุดคุ้มค่า เกาะราชา ที่สวยงาม เหมาะแก่การเดินทางมาพักผ่อนเป็นอย่างมาก'),
(62, 'ทัวร์เกาะเฮ - ภูเก็ต เรือคาตามารัน เรือใบ', 1150, '3x8g2-Phuket02.jpg', 'ไทย', 'g3m9o-Phuket02.pdf', '1 วัน', 'ภาคใ้ต้ - ทัวร์เกาะเฮ สานฝันสายดำน้ำ'),
(63, 'ทัวร์เกาะรอก - กระบี่ เรือคาตามารัน', 3990, 'imzre-Krabi01.jpg', 'ไทย', 'afvns-Krabi01.pdf', '2 วัน 1 คืน', 'ภาคใต้ - เกาะสวยสุดคุ้มค่า ที่สวยงาม เหมาะแก่การเดินทางมาพักผ่อนเป็นอย่างมาก พาทุกท่านดำน้ำดูปะการัง พักผ่อนเล่นน้ำชายหาด '),
(64, 'ทัวร์เกาะสิมิลัน - พังงา ', 3899, 'uzg0o-Krabi02.jpg', 'ไทย', '6e3u3-Krabi02.pdf', '3 วัน 2 คืน', 'ภาคใต้ - ทัวร์กาะสิมิลัน เดินทางด้วยเรือเร็ว ไปยังเกาะ(5) แวะให้ดำน้ำชมความสวยงามใต้ท้องทะเล ออกเดินทางต่อไปยังอ่าวหน้าหรือ เกาะเมี่ยง สำรวจความงามของเกาะ '),
(65, 'ทัวร์เชียงใหม่ สายทำบุญ', 4789, 'h3gax-ChiangMai01.jpg', 'ไทย', 'hxmvs-ChiangMai01.pdf', '3 วัน 2 คืน', 'ภาคเหนือ - นมัสการไหว้พระ และตื่นตากับอุทยาน และเที่ยวชมตลาดโบราณ'),
(66, 'ทัวร์เชียงใหม่ ม่อนแจ่ม ดอยอินทนนท์', 3789, 'rss91-ChiangMai02.jpg', 'ไทย', '8jath-ChiangMai02.pdf', '3 วัน 2 คืน', 'ภาคเหนือ - ทัวร์ม่อมแจ่มรับลมหนาว หมอยามเช้า บรรยากาศสบายๆ'),
(67, 'ทัวร์เชียงใหม่ เชียงดาว อ่างขาง', 5590, '6zqfq-ChiangMai03.jpg', 'ไทย', 'b55u1-ChiangMai03.pdf', '4 วัน 3 คืน ', 'ภาคเหนือ - ทัวร์เชียงใหม่ รับบรรยากาศสุดฟิน ');

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
('สตางค์', 'เขตใหญ่', '0974581236', 'a@cc.com', 'admin', 'user'),
('ariyavas', 'phaipong', '0992439788', 'ariyavas@gmail.com', '1234', 'user'),
('บอล', 'เชิญยิ้ม', '0912345678', 'ball@gmail.com', '111', 'user'),
('Admin', 'KIND SO GROUP TRAVEL', '0999999999', 'KindSoGroupTravel@gmail.com', 'admin', 'admin'),
('สตางค์', 'เขตใหญ่', '0974581236', 'KindSoGroupTravel@gmail.comaa', 'admin11', 'user'),
('ธนกร', 'คำหอม', '0877983220', 'momeyystz@gmail.com', '1234', 'user'),
('นันท์นภัส', 'เขตใหญ่', '0624921307', 'nannapat.ket@ku.th', '1234', 'user'),
('สตางค์', 'เขตใหญ่', '0624921307', 'ss@ggg.com', '1111', 'user'),
('ชนิกานต์', 'ทาแทม', '0877983220', 'stangnapxt@gamil.com', '123456', 'user'),
('สตางค์', 'เขตใหญ่', '0624921307', 'stangnapxt@gmail.coms', '12345566', 'user'),
('แทมแทม', 'ทาทา', '0982744212', 'tatam@gmail.com', '123456', 'user'),
('วิทย์', 'นพคุณ', '0974581236', 'wit01@gmail.com', '123456', 'user');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `guide`
--
ALTER TABLE `guide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

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
