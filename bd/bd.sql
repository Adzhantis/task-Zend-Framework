-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.5.38-log - MySQL Community Server (GPL)
-- ОС Сервера:                   Win32
-- HeidiSQL Версия:              8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры базы данных tz
CREATE DATABASE IF NOT EXISTS `tz` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tz`;


-- Дамп структуры для таблица tz.consumer
CREATE TABLE IF NOT EXISTS `consumer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_group` int(11) NOT NULL,
  `Login` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `account_expired` timestamp NOT NULL DEFAULT '2014-07-08 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `avatar_extension` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk` (`id_group`),
  CONSTRAINT `fk` FOREIGN KEY (`id_group`) REFERENCES `group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы tz.consumer: ~28 rows (приблизительно)
DELETE FROM `consumer`;
/*!40000 ALTER TABLE `consumer` DISABLE KEYS */;
INSERT INTO `consumer` (`id`, `id_group`, `Login`, `Password`, `Email`, `account_expired`, `avatar_extension`) VALUES
	(52, 1, '32', '32', '32', '0000-00-00 00:00:00', '52.jpg'),
	(114, 1, '1121213243', '14242', '4214', '0000-00-00 00:00:00', '114.jpg'),
	(115, 1, '121212', '1133131', '313', '0000-00-00 00:00:00', '115.jpg'),
	(117, 2, '123232324', '55', '553', '0000-00-00 00:00:00', '117.jpg'),
	(120, 1, '1123', '23231', '3213', '0000-00-00 00:00:00', '120.jpg'),
	(123, 2, '1', '21122', '3344', '0000-00-00 00:00:00', '123.jpg'),
	(125, 1, '1', '1', '1', '0000-00-00 00:00:00', '125.jpg'),
	(127, 1, '1', '1', '1', '0000-00-00 00:00:00', '127.jpg'),
	(129, 2, '4', '4', '4', '2013-12-10 00:00:00', '129.jpg'),
	(132, 2, '1', '1', '1', '0000-00-00 00:00:00', '132.jpg'),
	(133, 2, '1', '1', '1', '0000-00-00 00:00:00', '133.jpg'),
	(134, 1, '1', '1', '1', '0000-00-00 00:00:00', '134.jpg'),
	(135, 1, '1', '1', '1', '2011-11-11 11:11:11', '135.jpg'),
	(136, 1, '1', '1', 'r1', '0000-00-00 00:00:00', '136.jpg'),
	(137, 1, '1', '1', '5', '0000-00-00 00:00:00', '137.jpg'),
	(138, 1, '1', '11', '1', '0000-00-00 00:00:00', '138.jpg'),
	(139, 1, '1', '1', '1', '0000-00-00 00:00:00', '139.jpg'),
	(140, 1, '1', '1', '1', '2011-11-11 11:11:11', '140.jpg'),
	(142, 1, '1', '1', '1', '2012-11-11 17:01:00', '142.jpg'),
	(143, 1, '1', '1', '1', '2012-11-11 17:02:00', '143.jpg'),
	(144, 1, '1', '1', '1', '2012-11-11 17:00:00', '144.jpg'),
	(145, 1, 'IGOR', '1', 'adzhantis@ukr.net', '2012-11-05 17:00:00', '145.jpg'),
	(146, 1, 'IGRA', '1', '1', '0000-00-00 00:00:00', '146.jpg'),
	(147, 1, 'IGORKO', '1', '1', '0000-00-00 00:00:00', '147.jpg'),
	(148, 1, '1', '1', '1', '0000-00-00 00:00:00', '148.jpg'),
	(149, 1, '1', '1', '1', '0000-00-00 00:00:00', '149.jpg'),
	(150, 1, '1', '1', '1', '0000-00-00 00:00:00', '150.jpg'),
	(151, 1, 'adzh', '1adzha', 'adzhantiss@ukr.net', '0000-00-00 00:00:00', '151.jpg');
/*!40000 ALTER TABLE `consumer` ENABLE KEYS */;


-- Дамп структуры для таблица tz.group
CREATE TABLE IF NOT EXISTS `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы tz.group: ~2 rows (приблизительно)
DELETE FROM `group`;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` (`id`, `Name`) VALUES
	(1, 'free'),
	(2, 'paid');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
