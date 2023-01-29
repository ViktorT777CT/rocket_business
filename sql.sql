-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.8.4-MariaDB - mariadb.org binary distribution
-- Операционная система:         Win64
-- HeidiSQL Версия:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Дамп структуры базы данных business
CREATE DATABASE IF NOT EXISTS `business` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `business`;

-- Дамп структуры для таблица business.b_check_up
CREATE TABLE IF NOT EXISTS `b_check_up` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` varchar(256) COLLATE utf8mb4_bin DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `image` text COLLATE utf8mb4_bin DEFAULT NULL,
  `date_added` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Дамп данных таблицы business.b_check_up: ~2 rows (приблизительно)
INSERT INTO `b_check_up` (`id`, `title`, `description`, `price`, `discount`, `image`, `date_added`) VALUES
	(1, 'check-up', 'для мужчин', 3500, 2800, 'img/test.png', '2023-01-29 12:47:40'),
	(2, 'check-up', 'для мужчин', 2800, 2300, 'img/test.png', '2023-01-29 12:47:40'),
	(3, 'check-up', 'для мужчин', 4000, NULL, 'img/test.png', '2023-01-29 12:47:40');

-- Дамп структуры для таблица business.b_check_up_advantages
CREATE TABLE IF NOT EXISTS `b_check_up_advantages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `check_up_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `b_check_up_advantages_b_check_up_null_fk` (`check_up_id`),
  CONSTRAINT `b_check_up_advantages_b_check_up_null_fk` FOREIGN KEY (`check_up_id`) REFERENCES `b_check_up` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Дамп данных таблицы business.b_check_up_advantages: ~7 rows (приблизительно)
INSERT INTO `b_check_up_advantages` (`id`, `check_up_id`, `name`) VALUES
	(1, 1, 'Гормональный скрининг'),
	(2, 1, 'Тестостерон'),
	(3, 1, 'Свободный тестостерон'),
	(4, 1, 'Глобулин, связывающий половые гормоны'),
	(5, 2, 'Гормональный скрининг'),
	(6, 2, 'Тестостерон'),
	(7, 2, 'Свободный тестостерон'),
	(8, 2, 'Глобулин, связывающий половые гормоны'),
	(9, 3, 'Гормональный скрининг'),
	(10, 3, 'Тестостерон'),
	(11, 3, 'Свободный тестостерон');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
