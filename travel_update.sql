-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.18-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for travel
CREATE DATABASE IF NOT EXISTS `travel` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `travel`;

-- Dumping structure for table travel.booking
CREATE TABLE IF NOT EXISTS `booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`),
  KEY `loc` (`location`),
  KEY `user` (`user`),
  CONSTRAINT `loc` FOREIGN KEY (`location`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user` FOREIGN KEY (`user`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table travel.booking: ~2 rows (approximately)
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
REPLACE INTO `booking` (`id`, `location`, `name_tour`, `sub_name_tour`, `period`, `name_user`, `member`, `phone`, `user`, `tranfer`, `status`, `day`, `to_date`, `people`, `doc`, `guide`, `guide_phone`, `create_at`) VALUES
	(38, 26, 'แพ็คเกจที่เที่ยวธรรมชาติ ป่ากลางกรุง', 'ที่เที่ยวธรรมชาติป่ากลางกรุง สัมผัสบรรยากาศรมรื่นย์', '1 วัน', 'ชนิกานต์ ทาแทม', 'ฟหดฟหด ,ดหดหด', '0877983220', 'stangnapxt@gamil.com', 'txrm1-sofa-interior-pillow-library-wallpaper-preview.jpg', 4, '2023-03-20', '2023-03-23', 1, 'gcgez-test-tour.pdf', 'Kaiii', '08766788766', '2023-03-19 10:01:03'),
	(40, 25, 'ทริปกรุงเทพ ไหว้พระ 9 วัดรอบกรุงเทพมหานคร', 'ชื่นชมความงามและอิ่มบุญตามรอยพระพุทธศาสนา', '1 วัน', 'ชนิกานต์ ทาแทม', 'zczzx', '0877983220', 'stangnapxt@gamil.com', '21ziq-hd.jpg', 2, '2023-03-22', '2023-03-30', 4, '', '', '', '2023-03-19 18:51:11'),
	(41, 45, 'zxczxcZxc', 'sadfasdf', 'sdfasdf', 'ชนิกานต์ ทาแทม', 'ต้น , อ้อ ', '0877983220', 'stangnapxt@gamil.com', '08bz8-screencapture-hydedate-promotion-detail-php-2023-03-09-22_47_52.png', 4, '2023-03-24', '2023-03-30', 1, 'jyuxf-test-tour.pdf', 'พรกวี ศรีอรุโณทัย', '09834656542', '2023-03-20 16:31:47');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;

-- Dumping structure for table travel.guide
CREATE TABLE IF NOT EXISTS `guide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) DEFAULT NULL,
  `sname` varchar(100) DEFAULT NULL,
  `license` varchar(20) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table travel.guide: ~0 rows (approximately)
/*!40000 ALTER TABLE `guide` DISABLE KEYS */;
REPLACE INTO `guide` (`id`, `fname`, `sname`, `license`, `mobile`, `email`, `avatar`, `create_at`, `update_at`) VALUES
	(3, 'ddddd7799', 'asasasas89', '90-22289', '098678989', 'xxwewew@sss.ccc', 'y9xtv-cactus-(1).png', '2023-03-19 16:53:21', '2023-03-19 17:52:55'),
	(4, 'พรกวี', 'ศรีอรุโณทัย', '1-98776565', '09834656542', 'test@hotmail.com', 'xd6lo-jeremy-thomas-O6N9RV2rzX8-unsplash.jpg', '2023-03-19 16:57:48', '2023-03-19 16:57:48'),
	(5, 'อโนทัย', 'sdfsadfasdf', '9-925472369', '09876543399', 'newguide@xxx.xxx', 'zemi1-pexels-tiia-pakk-5075473.jpg', '2023-03-20 09:40:11', '2023-03-20 09:41:22');
/*!40000 ALTER TABLE `guide` ENABLE KEYS */;

-- Dumping structure for table travel.locations
CREATE TABLE IF NOT EXISTS `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `img` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `detail` varchar(255) NOT NULL,
  `day` varchar(255) NOT NULL,
  `sub_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table travel.locations: ~3 rows (approximately)
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
REPLACE INTO `locations` (`id`, `name`, `price`, `img`, `type`, `detail`, `day`, `sub_name`) VALUES
	(25, 'ทริปกรุงเทพ ไหว้พระ 9 วัดรอบกรุงเทพมหานคร', 799, '3jobz-pexels-brady-knoll-3369569.jpg', 'ไทย', 'wp2au-river-quare-kanchanaburi.pdf', '1 วัน', 'ชื่นชมความงามและอิ่มบุญตามรอยพระพุทธศาสนา'),
	(26, 'แพ็คเกจที่เที่ยวธรรมชาติ ป่ากลางกรุง', 299, 'gyey8-annegret.jpg', 'ไทย', 'gyva6-à¸à¸£à¸´à¸à¸ªà¸§à¸à¸ªà¸à¸¸à¸à¸à¸£à¸µà¸¡à¹à¸§à¸´à¸¥à¸à¹.pdf', '1 วัน', 'ที่เที่ยวธรรมชาติป่ากลางกรุง สัมผัสบรรยากาศรมรื่นย์'),
	(27, 'ทริปสวนสนุกดรีมเวิลด์', 559, '8awrt-yellow_sunflowers_sunset_field_flowers_summer_sunrays_4_k_hd_flowers.jpg', 'ไทย', 'frowh-test-tour.pdf', '1 วัน', 'เครื่องเล่นสวนสนุกดรีมเวิลด์ ที่จะพาคุณไปเพลิดเพลินกับความมันส์'),
	(45, 'zxczxcZxc', 18908, 'uxs9q-clean_calm_body_of_water_in_beach_with_rocks_hd_beach.jpg', 'ไทย', '15660-user---xxx.pdf', 'sdfasdf', 'sadfasdf'),
	(46, 'ปแอผปแอผปแอ', 3000, 'knhg1-shifaaz-shamoon-qtbV_8P_Ksk-unsplash.jpg', 'ไทย', '6n1ag-test-tour.pdf', 'กดเกหเดหก', 'กหดเหกเด');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;

-- Dumping structure for table travel.users
CREATE TABLE IF NOT EXISTS `users` (
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table travel.users: ~3 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`fname`, `lname`, `phone`, `email`, `pwd`, `role`) VALUES
	('Admin', 'KIND SO GROUP TRAVEL', '0999999999', 'KindSoGroupTravel@gmail.com', 'admin', 'admin'),
	('นันท์นภัส', 'เขตใหญ่', '0624921307', 'nannapat.ket@ku.th', '1234', 'user'),
	('ชนิกานต์', 'ทาแทม', '0877983220', 'stangnapxt@gamil.com', '123456', 'user');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
