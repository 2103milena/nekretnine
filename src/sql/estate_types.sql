-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 10, 2017 at 11:13 AM
-- Server version: 5.5.52-0ubuntu0.14.04.1
-- PHP Version: 5.6.27-1+deb.sury.org~trusty+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `nekretnine_prod`
--

-- --------------------------------------------------------

--
-- Table structure for table `estate_type_languages`
--

CREATE TABLE IF NOT EXISTS `estate_type_languages` (
  `id_type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plural_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tags` text COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `active_language` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id_type`,`language`),
  FULLTEXT KEY `tags` (`tags`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `estate_type_languages`
--

INSERT INTO `estate_type_languages` (`id_type`, `name`) VALUES
(3, 'Poslovni prostor'),
(2, 'Stan'),
(1, 'Kuća'),
(4, 'Garaža'),
(5, 'Plac'),
(6, 'Vikendica'),
(7, 'Ostalo'),
(8, 'Garsonjera'),
(9, 'Lokal'),
(10, 'Hotel'),
(11, 'Apartman'),
(12, 'Projekat'),
(13, 'Magacin'),
(14, 'Hala');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
