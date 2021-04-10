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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- Dumping data for table oivprojekt.answers: ~32 rows (approximately)
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
	(12, 'prstni odtis', 1, 3),
	(13, 'kontrolna vsota ali cheksum', 1, 4),
	(14, 'varnostna kopija ali backup', 0, 4),
	(15, 'avtentikacija', 0, 4),
	(16, 'enkripcija', 0, 4),
	(17, 'enkripcija podatkov', 0, 5),
	(18, 'nadzor razlicic', 1, 5),
	(19, 'uporabniško ime in geslo', 0, 5),
	(20, 'dvofaktorski nadzor avtentikacije.', 0, 5),
	(21, 'Notranji uporabniki lahko dostopajo do infrastrukturnih naprav prek interneta.', 0, 6),
	(22, 'Notranji uporabniki lahko dostopajo do poslovnih podatkov brez avtentikacije.', 0, 6),
	(23, 'Notranji uporabniki imajo neposreden dostop do infrastrukturnih naprav.', 1, 6),
	(24, 'Notranji uporabniki imajo boljše hekerske sposobnosti', 0, 6),
	(25, 'skrije se v mirujocem stanju, dokler ga napadalec ne potrebuje', 0, 7),
	(26, 'potuje v nove racunalnike brez kakršnega koli posredovanja ali vedenja uporabnika', 1, 7),
	(27, 'okuži racunalnike s pritrditvijo na programsko kodo', 0, 7),
	(28, 'se izvaja, ko se programska oprema zažene v racunalniku', 0, 7),
	(29, 'Nmap', 1, 8),
	(30, 'ping', 0, 8),
	(31, 'Whois', 0, 8),
	(32, 'Tracert', 0, 8);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;

-- Dumping structure for table oivprojekt.leaderboard
DROP TABLE IF EXISTS `leaderboard`;
CREATE TABLE IF NOT EXISTS `leaderboard` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_name` varchar(64) NOT NULL,
  `score` int(10) unsigned NOT NULL,
  `time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table oivprojekt.leaderboard: ~1 rows (approximately)
DELETE FROM `leaderboard`;
/*!40000 ALTER TABLE `leaderboard` DISABLE KEYS */;
INSERT INTO `leaderboard` (`ID`, `player_name`, `score`, `time`) VALUES
	(1, 'Jakob Jošt', 100, 11),
	(2, 'David Kovač', 69, 54);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table oivprojekt.questions: ~8 rows (approximately)
DELETE FROM `questions`;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`ID`, `question`, `difficulty`, `description`) VALUES
	(1, 'Kaj so osnovni principi informacijske varnosti?', 1, 'Principe informacijske varnosti, imenujemo tudi CIA Triada in so napotnice za informacijsko varnost v podjetju oz. organizaciji.'),
	(2, 'Kaj je drugo ime za zaupnost podatkov?', 1, 'Drug izraz za zaupnost podatkov je zasebnost informacij. Doslednost, natan?nost in zaupnost informacije pa govorijo o celovitosti informacij oz. podatkov.'),
	(3, 'Katera varnostna implementacija uporablja biometrijo?', 1, 'Biometrija je proces zbiranja, proucevanja in shranjevanja podatkov o posameznikovih fizicnih lastnostih z namenom identifikacije in avtentikacije.'),
	(4, 'Katera metoda se uporablja za preverjanje celovitosti podatkov?', 2, 'Vrednost kontrolne vsote bloka podatkov se izracuna in prenese s podatki. Po prejemu podatkov se ponovno izvede zgošcevanje kontrolne vsote. Izracunana vrednost se primerja s poslano vrednostjo, da se preveri celovitost podatkov.'),
	(5, 'Kaj od naštetega ne moremo uporabiti da lahko zagotovimo zaupnost podatkov?', 2, 'Nadzor razlicic ne more zagotoviti zaupnosti podatkov, saj podatki niso odvisni od tega.'),
	(6, 'Kaj je razlog, da lahko notranje varnostne grožnje organizaciji povzrocijo vecjo škodo kot zunanje?', 2, 'Notranje grožnje lahko povzrocijo vecjo škodo, kot zunanje, ker imajo notranji uporabniki neposreden dostop do stavbe in njenih infrastrukturnih naprav.\n'),
	(7, 'Katera karakteristika opisuje crva (worm)?', 1, 'A computer worm is a standalone malware computer program that replicates itself in order to spread to other computers. It often uses a computer network to spread itself, relying on security failures on the target computer to access it. '),
	(8, 'Katero orodje se uporablja za pridobitev seznama odprtih vrat (ports) v omrežnih napravah?', 2, 'Orodje Nmap je opticni bralnik vrat, ki se uporablja za dolocanje, katera vrata so odprta v doloceni omrežni napravi. Uporabi se pred napadom.');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
