-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.5.9-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table oivprojekt.answers
DROP TABLE IF EXISTS `answers`;
CREATE TABLE IF NOT EXISTS `answers` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `answer` varchar(128) NOT NULL,
  `isCorrect` tinyint(1) DEFAULT NULL,
  `fk_question` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `fk_question` (`fk_question`),
  CONSTRAINT `FK_question_ID` FOREIGN KEY (`fk_question`) REFERENCES `questions` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table oivprojekt.answers: ~0 rows (approximately)
DELETE FROM `answers`;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` (`ID`, `answer`, `isCorrect`, `fk_question`) VALUES
	(1, 'zaupnost, neokrnjenost, razpoložljivost', 1, 1),
	(2, 'zaupnost, razširljivost, razpoložljivost', 0, 1),
	(3, 'posredovanje, razširljivost ,dostopnost', 0, 1),
	(4, 'posredovanje, neokrnjenost, dostopnost', 0, 1),
	(5, 'doslednost informacij', 0, 2),
	(6, 'zaupne informacije', 0, 2),
	(7, 'zasebnost informacij', 1, 2),
	(8, 'natancnost informacij', 0, 2),
	(9, 'kreditna kartica', 0, 3),
	(10, 'telefon', 0, 3),
	(11, 'INCOTERM', 0, 3),
	(12, 'prstni odtis', 1, 3);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;

-- Dumping structure for table oivprojekt.leaderboard
DROP TABLE IF EXISTS `leaderboard`;
CREATE TABLE IF NOT EXISTS `leaderboard` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_name` varchar(64) NOT NULL,
  `score` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table oivprojekt.leaderboard: ~0 rows (approximately)
DELETE FROM `leaderboard`;
/*!40000 ALTER TABLE `leaderboard` DISABLE KEYS */;
INSERT INTO `leaderboard` (`ID`, `player_name`, `score`) VALUES
	(1, 'Jakob Jošt', 1000000);
/*!40000 ALTER TABLE `leaderboard` ENABLE KEYS */;

-- Dumping structure for table oivprojekt.questions
DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(128) NOT NULL,
  `difficulty` int(10) unsigned NOT NULL,
  `description` varchar(256) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table oivprojekt.questions: ~0 rows (approximately)
DELETE FROM `questions`;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`ID`, `question`, `difficulty`, `description`) VALUES
	(1, 'Kaj so osnovni principi informacijske varnosti?', 1, 'Principe informacijske varnosti, imenujemo tudi CIA Triada in so napotnice za informacijsko varnost v podjetju oz. organizaciji.'),
	(2, 'Kaj je drugo ime za zaupnost podatkov?', 1, 'Drug izraz za zaupnost podatkov je zasebnost informacij. Doslednost, natan?nost in zaupnost informacije pa govorijo o celovitosti informacij oz. podatkov.'),
	(3, 'Katera varnostna implementacija uporablja biometrijo?', 1, 'Biometrija je proces zbiranja, proucevanja in shranjevanja podatkov o posameznikovih fizicnih lastnostih z namenom identifikacije in avtentikacije.');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
