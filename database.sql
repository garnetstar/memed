-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Počítač: localhost
-- Vygenerováno: Čtv 25. zář 2014, 14:57
-- Verze MySQL: 5.5.38
-- Verze PHP: 5.5.17-1+deb.sury.org~precise+1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databáze: `memed`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `adminID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) CHARACTER SET utf32 COLLATE utf32_czech_ci NOT NULL,
  `surname` varchar(50) COLLATE utf8mb4_czech_ci NOT NULL,
  `login` varchar(20) COLLATE utf8mb4_czech_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_czech_ci NOT NULL,
  `roleID` int(11) NOT NULL,
  PRIMARY KEY (`adminID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci AUTO_INCREMENT=4 ;

--
-- Vypisuji data pro tabulku `admin`
--

INSERT INTO `admin` (`adminID`, `firstName`, `surname`, `login`, `password`, `roleID`) VALUES
(1, 'Duncan', 'Idaho', 'sword', 'mecmec', 1),
(2, 'Thufir', 'Hawat', 'mentat', 'brain', 2),
(3, 'Paul', 'Atreid', 'muaddib', 'worm', 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_czech_ci NOT NULL,
  `parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci AUTO_INCREMENT=10 ;

--
-- Vypisuji data pro tabulku `category`
--

INSERT INTO `category` (`categoryID`, `name`, `parent`) VALUES
(1, 'počítače', 0),
(2, 'elektronika', 0),
(3, 'notebooky', 1),
(4, 'desktopy', 1),
(5, '14 palců', 3),
(6, '17 palců', 3),
(7, 'Počítače do školy', 4),
(8, 'Počítače na hry', 4),
(9, 'Počítače do práce', 4);

-- --------------------------------------------------------

--
-- Struktura tabulky `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `roleID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_czech_ci NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci AUTO_INCREMENT=3 ;

--
-- Vypisuji data pro tabulku `role`
--

INSERT INTO `role` (`roleID`, `name`) VALUES
(1, 'category'),
(2, 'users');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
