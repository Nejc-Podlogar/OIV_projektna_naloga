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
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;

-- Dumping data for table oivprojekt.answers: ~140 rows (approximately)
DELETE FROM `answers`;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` (`ID`, `answer`, `isCorrect`, `fk_question`) VALUES
	(1, 'Zaupnost, neokrnjenost, razpoložljivost.', 1, 1),
	(2, 'Zaupnost, razširljivost, razpoložljivost.', 0, 1),
	(3, 'Posredovanje, razširljivost ,dostopnost.', 0, 1),
	(4, 'Posredovanje, neokrnjenost, dostopnost.', 0, 1),
	(5, 'Doslednost informacij', 0, 2),
	(6, 'Zaupne informacije', 0, 2),
	(7, 'Zasebnost informacij', 1, 2),
	(8, 'Natančnost informacij', 0, 2),
	(9, 'Kreditna kartica', 0, 3),
	(10, 'Telefon', 0, 3),
	(11, 'INCOTERM', 0, 3),
	(12, 'Prstni odtis', 1, 3),
	(13, 'Kontrolna vsota ali cheksum', 1, 4),
	(14, 'Varnostna kopija ali backup', 0, 4),
	(15, 'Avtentikacija', 0, 4),
	(16, 'Enkripcija', 0, 4),
	(17, 'Enkripcija podatkov', 0, 5),
	(18, 'Nadzor različic', 1, 5),
	(19, 'Uporabniško ime in geslo', 0, 5),
	(20, 'Dvofaktorski nadzor avtentikacije.', 0, 5),
	(21, 'Notranji uporabniki lahko dostopajo do infrastrukturnih naprav prek interneta.', 0, 6),
	(22, 'Notranji uporabniki lahko dostopajo do poslovnih podatkov brez avtentikacije.', 0, 6),
	(23, 'Notranji uporabniki imajo neposreden dostop do infrastrukturnih naprav.', 1, 6),
	(24, 'Notranji uporabniki imajo boljše hekerske sposobnosti', 0, 6),
	(25, 'Skrije se v mirujočem stanju, dokler ga napadalec ne potrebuje.', 0, 7),
	(26, 'Potuje v nove racunalnike brez kakršnega koli posredovanja ali vedenja uporabnika.', 1, 7),
	(27, 'Okuži računalnike s pritrditvijo na programsko kodo.', 0, 7),
	(28, 'Se izvaja, ko se programska oprema zažene v računalniku.', 0, 7),
	(29, 'Nmap', 1, 8),
	(30, 'ping', 0, 8),
	(31, 'Whois', 0, 8),
	(32, 'Tracert', 0, 8),
	(33, 'Socialni inženiring', 0, 9),
	(34, 'Zavrnitev storitve', 0, 9),
	(35, 'Vohanje paketov oz. packet sniffing', 0, 9),
	(36, 'Razbijanje gesel oz. password cracking', 1, 9),
	(37, 'Za lažji dostop do zunanjih omrežij.', 0, 10),
	(38, 'Da ciljnemu strežniku preprečite, da bi lahko obdelal dodatne zahteve.', 1, 10),
	(39, 'Za pridobitev vseh naslovov v imeniku strežnika.', 0, 10),
	(40, 'Za skeniranje podatkov v ciljnem strežniku.', 0, 10),
	(41, 'Da se razmnožuje neodvisno od drugih programov.', 0, 11),
	(42, 'Za pridobitev privilegiranega dostopa do naprave, medtem ko se skriva.', 1, 11),
	(43, 'Za prikazovanje oglasov brez privolitve uporabnika.', 0, 11),
	(44, 'Da se prikrije kot legitimen program.', 0, 11),
	(45, 'Gre za zlonamerno oblikovane segmente kode, ki se uporablja za nadomeščanje zakonitih aplikacij.', 0, 12),
	(46, 'V skupini računalnikov iščejo odprta vrata, da bi ugotovili, katere storitve se izvajajo.', 0, 12),
	(47, 'Ciljajo na določene posameznike, da bi pridobili poslovne ali osebne podatke.', 0, 12),
	(48, 'To so okuženi računalniki, ki izvajajo napade DDoS.', 1, 12),
	(49, 'Da bi nekoga prevarali, da namesti zlonamerno programsko opremo ali razkrije osebne podatke.', 0, 13),
	(50, 'Ustvariti botnet zombijev.', 0, 13),
	(51, 'Preobremenitev omrežne naprave z zlonamerno oblikovanimi paketi.', 0, 13),
	(52, 'Povečanje spletnega prometa na zlonamernih spletnih mestih.', 1, 13),
	(53, 'Omogoča povezljivost med gostitelji v lokalnem omrežju (LAN).', 0, 14),
	(54, 'Switchi posredujejo okvirje na podlagi podatkov o lokaciji naslovov MAC.', 0, 14),
	(55, 'Okvirji so naslovljeni na fizični naslov naprave (MAC).', 0, 14),
	(56, 'Ethernet ni najbolj popularno lokalno omrežje na svetu.', 1, 14),
	(57, 'Požarni zid', 1, 15),
	(58, 'botnet', 0, 15),
	(59, 'PGP', 0, 15),
	(60, 'Server', 0, 15),
	(61, '5', 1, 16),
	(62, '4', 0, 16),
	(63, '10', 0, 16),
	(64, '8', 0, 16),
	(65, 'Uporabnik mora podatki dovoljenja.', 0, 17),
	(66, 'Privzeto nimajo dostopa do datotečnega sistema, komponent strojne opreme, ipd.', 0, 17),
	(67, 'Ni razlik med mobilnimi in tradicionalnimi operacijskimi sistemi.', 1, 17),
	(68, 'Vsaka se izvaja v ločenem izvajalnem okolju.', 0, 17),
	(69, 'Ikee', 1, 18),
	(70, 'Zitmo', 0, 18),
	(71, 'droidDream', 0, 18),
	(72, 'ExoBot', 0, 18),
	(73, 'Določitev, vpostavitev, konsistenca.', 0, 19),
	(74, 'Vpostavitev, spremljanje, izboljševanje.', 1, 19),
	(75, 'Vpostavitev, delovanje, zaupnost.', 0, 19),
	(76, 'Zaupnost, neokrnjenost, razpoložljivost.', 0, 19),
	(77, 'GET', 0, 20),
	(78, 'POST', 0, 20),
	(79, 'TOES', 1, 20),
	(80, 'HEAD', 0, 20),
	(81, 'Piškotki, nastavljeni s strani določene domene, se vedno pošljejo za vsako zahtevo do te domene.', 0, 21),
	(82, ' Piškotki, nastavljeni s strani določene domene, se pošljejo samo ob prvi zahtevi do te domene.', 1, 21),
	(83, 'Piškotek je majhen delček podatkov, ki ga strežnik pošlje spletnemu brskalniku.', 0, 21),
	(84, 'V piškotkih shranjujemo personalizacijo, vedenje uporabnika, in upraljamo seje.', 0, 21),
	(85, 'Kaj?', 0, 22),
	(86, 'Kdo?', 0, 22),
	(87, 'Kdaj?', 1, 22),
	(88, 'Kako?', 0, 22),
	(89, 'SOP preprečuje, da bi Javascript na spletnem mestu napadalec.com neposredno pregledoval odgovore HTTP.', 1, 23),
	(90, 'Preprečuje da nekdo, ki nima dovoljenja izvede zahtevek.', 0, 23),
	(91, 'Otroci oken in okvirjev lahko dostopajo do piškotkov in informacij staršev, ter jih prosto posredujejo naprej.', 0, 23),
	(92, ' SOP preprečuje, da bi Javascript lahko izvedel mrežne zahteve, ter naložil dodatno vsebino ali poslal obrazce.', 0, 23),
	(93, 'Vrivanjem, prestrezanjem, spreminjanjem.', 1, 24),
	(94, 'Vrivanjem, ugrabljanjem, spreminjanjem.', 0, 24),
	(95, 'Vrivanjem, prestrezanjem, sledenju.', 0, 24),
	(96, 'Socialnim inžinerstvom.', 0, 24),
	(97, 'Fizični/tehnični nivo ', 0, 25),
	(98, 'Nivo posameznika/uporabnika', 0, 25),
	(99, 'Nivo procesov/organizacijskih procesov', 0, 25),
	(100, 'Nivo omejevanja lokacije', 1, 25),
	(101, 'Pri napadu CSRF spletno mesto pošlje nepooblaščene ukaze kot uporabnik, ki mu žrtvena spletna aplikacija zaupa.', 1, 26),
	(102, 'V skupini računalnikov iščejo odprta vrata, da bi ugotovili, katere storitve se izvajajo.', 0, 26),
	(103, 'Pri napadu CSRF gre za preobremenitev omrežne naprave z laznimi zahtevki.', 0, 26),
	(104, 'Pri napadi CSRF gre za krajo podatkov iz piškotkov.', 0, 26),
	(105, 'Vrednost, starost informacije, ter podatek o tem ali je ta informacija morda že javna.', 1, 27),
	(106, 'Vrednost, prostodostopnost informacije, neokrnjenost.', 0, 27),
	(107, 'Zaupnost, neokrnjenost, razpoložljivost.', 0, 27),
	(108, 'Konsistenca, zaupnost, razpoložljivost.', 0, 27),
	(109, 'Piškotki ne označujejo, ali je pooblaščena prijava oddala zahtevo, saj so vključeni v vsako zahtevo (obseg).', 0, 28),
	(110, 'Piškotki z eksplicitnimi domenami se pošljejo glede na ujemanjein poddomene.', 0, 28),
	(111, 'Možnost, ki preprečuje, da bi brskalnik pošiljal piškotke pri zahtevah čez več strani (cross-site requests).', 1, 28),
	(112, 'Piškotki spraznimi ali implicitnimi domenami se pošljejo samo na domeno, ki se točno ujema (in ne tudi poddomene).', 0, 28),
	(113, 'Napadalec s škodljivo kodo.', 0, 29),
	(114, 'Zlonamerni zunanji vir.', 1, 29),
	(115, 'Zlonamerna spletna stran.', 0, 29),
	(116, 'Mrežni napadalec.', 0, 29),
	(117, 'Napad se zgodi, ko aplikacija prejme nezaupljive podatke in jih pošlje v spletni brskalnik brez ustreznega preverjanja.', 1, 30),
	(118, 'Napad se zgodi z mavričnimi tabelami.', 0, 30),
	(119, 'Napadalec shrani zlonamerno kodo v vir, ki ga upravlja spletna stran –npr. PB.', 0, 30),
	(120, 'Napadalec čaka, da se uporabnik prijavi, nato napadalec ukrade uporabnikov sejni žeton in s tem "ugrabi" sejo.', 0, 30),
	(121, 'Napad se zgodi, ko aplikacija prejme nezaupljive podatke in jih pošlje v spletni brskalnik brez ustreznega preverjanja.', 0, 31),
	(122, 'Napad se zgodi z mavričnimi tabelami.', 0, 31),
	(123, 'Napadalec shrani zlonamerno kodo v vir, ki ga upravlja spletna stran –npr. PB.', 0, 31),
	(124, 'Napadalec čaka, da se uporabnik prijavi, nato napadalec ukrade uporabnikov žeton. ', 1, 31),
	(125, 'Napad se zgodi, ko aplikacija prejme nezaupljive podatke in jih pošlje v spletni brskalnik brez ustreznega preverjanja.', 0, 32),
	(126, 'Napad se zgodi z mavričnimi tabelami.', 1, 32),
	(127, 'Napadalec shrani zlonamerno kodo v vir, ki ga upravlja spletna stran –npr. PB.', 0, 32),
	(128, 'Napadalec čaka, da se uporabnik prijavi, nato napadalec ukrade uporabnikov sejni žeton in s tem "ugrabi" sejo.', 0, 32),
	(129, 'Napad se zgodi, ko aplikacija prejme nezaupljive podatke in jih pošlje v spletni brskalnik brez ustreznega preverjanja.\n', 0, 33),
	(130, 'Napad se zgodi z mavričnimi tabelami.', 1, 33),
	(131, 'Napadalec shrani zlonamerno kodo v vir, ki ga upravlja spletna stran –npr. PB.', 0, 33),
	(132, 'Napadalec čaka, da se uporabnik prijavi, nato napadalec ukrade uporabnikov sejni žeton in s tem "ugrabi" sejo.', 0, 33),
	(133, 'Zgoščena gesla', 0, 34),
	(134, 'Hash', 0, 34),
	(135, 'Soljenje gesel', 0, 34),
	(136, 'Uporaba namenskih zgoščevalnih funkcij, ki se izvajajo počasi.', 1, 34),
	(137, 'Mora odkriti spremembe v podpisanem dokumentu.', 0, 35),
	(138, 'Pod pravimi pogoji ga lahko prenesemo na drug dokument.', 1, 35),
	(139, 'Ohranjanje celovitosti sporočila.', 0, 35),
	(140, 'Overjanje.', 0, 35);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;

-- Dumping structure for table oivprojekt.leaderboard
DROP TABLE IF EXISTS `leaderboard`;
CREATE TABLE IF NOT EXISTS `leaderboard` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_name` varchar(64) NOT NULL,
  `score` int(10) unsigned NOT NULL,
  `time` float unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table oivprojekt.leaderboard: ~2 rows (approximately)
DELETE FROM `leaderboard`;
/*!40000 ALTER TABLE `leaderboard` DISABLE KEYS */;
INSERT INTO `leaderboard` (`ID`, `player_name`, `score`, `time`) VALUES
	(1, 'Jakob Jošt', 100, 11.1),
	(2, 'David Kovač', 69, 54.6);
/*!40000 ALTER TABLE `leaderboard` ENABLE KEYS */;

-- Dumping structure for table oivprojekt.questions
DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(128) NOT NULL,
  `difficulty` int(10) unsigned NOT NULL,
  `description` varchar(512) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- Dumping data for table oivprojekt.questions: ~35 rows (approximately)
DELETE FROM `questions`;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`ID`, `question`, `difficulty`, `description`) VALUES
	(1, 'Kaj so osnovni principi informacijske varnosti?', 1, 'Principe informacijske varnosti, imenujemo tudi CIA Triada in so napotnice za informacijsko varnost v podjetju oz. organizaciji.'),
	(2, 'Kaj je drugo ime za zaupnost podatkov?', 1, ' Drug izraz za zaupnost podatkov je zasebnost informacij. Doslednost, natančnost in zaupnost informacije pa govorijo o celovitosti informacij oz. podatkov.'),
	(3, 'Katera varnostna implementacija uporablja biometrijo?', 1, 'Biometrija je proces zbiranja, proučevanja in shranjevanja podatkov o posameznikovih fizičnih lastnostih z namenom identifikacije in avtentikacije.'),
	(4, 'Katera metoda se uporablja za preverjanje celovitosti podatkov?', 2, 'Vrednost kontrolne vsote bloka podatkov se izračuna in prenese s podatki. Po prejemu podatkov se ponovno izvede zgoščevanje kontrolne vsote. Izračunana vrednost se primerja s poslano vrednostjo, da se preveri celovitost podatkov.'),
	(5, 'Kaj od naštetega ne moremo uporabiti da lahko zagotovimo zaupnost podatkov?', 1, 'Nadzor razlicic ne more zagotoviti zaupnosti podatkov, saj podatki niso odvisni od tega.'),
	(6, 'Kaj je razlog, da lahko notranje varnostne grožnje organizaciji povzročijo večjo škodo kot zunanje?', 2, 'Notranje grožnje lahko povzročijo večjo škodo kot zunanje, ker imajo notranji uporabniki neposreden dostop do stavbe in njenih infrastrukturnih naprav. Notranji uporabniki morda nimajo boljših hekerskih veščin kot zunanji napadalci.'),
	(7, 'Katera karakteristika opisuje črva (worm)?', 1, 'Računalniški črv je program, ki vsebuje zlonamerno programsko opremo in se razmožuje z namenom širjenja na druge računalnike. Pogosto uporablja računalniško omrežje za širjenje, pri čemer se za dostop do njega zanaša na varnostne napake.'),
	(8, 'Katero orodje se uporablja za pridobitev seznama odprtih vrat (ports) v omrežnih napravah?', 2, 'Orodje Nmap je optični bralnik vrat, ki se uporablja za določanje, katera vrata so odprta v določeni omrežni napravi. Uporabi se pred napadom.'),
	(9, 'Katera vrsta napada omogoča napadalcu uporabo surove sile?', 2, 'Razbijanje gesel je pogosta uporaba surove sile, saj napadalec vdira v račun s pomočjo večkratnih poskusov vnosa gesel iz slovarja.'),
	(10, 'Kaj je glavna naloga DoS napada?', 3, 'Cilj (D)DoS napada je onemogočiti veliko spletno stran z majhno porabo računske moči .Napadalec želi najti mehanizem, pri katerem ni treba vložiti veliko truda, toda zahteve so za žrtev težke/drage za obdelavo.'),
	(11, 'Kakšen je namen korenskega kompleta?', 4, 'Korenski komplet je skupek programov in kode, ki omogoča stalno ali dosledno neopazno prisotnost v računalniku. Cilji le teh so skriti zlonamerne vire (npr. procese, datoteke, vnose v register, ipd.) in dovoliti skrit dostop (zadnja vrata).'),
	(12, 'Kako so zombiji uporabljeni v varnostnih napadih?', 3, 'Zombiji so okuženi računalniki, ki sestavljajo botnet. Zombiji se uporabljajo za izvajanje porazdeljenega napada DDoS (distributed denial of service).'),
	(13, 'Kaj je najpogostejši cilj zastrupitve optimizacije iskalnikov?', 5, 'Zlonamerni uporabnik lahko ustvari optimizacijo iskalnika, tako da se zlonamerno spletno mesto prikaže višje v rezultatih iskanja. Zlonamerno spletno mesto običajno vsebuje zlonamerno programsko opremo ali pa se uporablja za pridobivanje informacij s tehnikami socialnega inženiringa.'),
	(14, 'Kaj ne velja za ethernet omrežja?', 3, 'Ethernet omogoča povezljivost med gostitelji v lokalnem omrežju (LAN). Okvirji so naslovljeni na fizični naslov naprave (MAC). Switchi posredujejo okvirje na podlagi podatkov o lokaciji naslovov MAC; ni garancije, da se ne pošlje drugim gostiteljem! Ni varnosti (zaupnost, overjanje ali celovitost).'),
	(15, ' Naprava, ki nadzoruje ali filtrira promet v omrežje ali iz njega, se imenuje?', 3, 'Požarni zid je omrežna naprava, ki se uporablja za filtriranje vhodnega, izhodnega prometa ali obojega.'),
	(16, 'Koliko razredov digitalnih potrdil poznamo?', 4, 'Pozamo 5 različnih razredov, ki jih pa označimo od 0. - 4.'),
	(17, 'Katera od trditev ne velja za mobilno škodljivo kodo?', 4, 'Mobilne aplikacije so izolirane. Vsaka se izvaja v ločenem izvajalnem okolju. Privzeto nimajo dostopa do datotečnega sistema, komponent strojne opreme, ipd.. Razlike napram tradicionalnim OS-om. Aplikacije nameščamo s pomočjo „App Storea“; tržnica: pod nadzorom proizvajalca (Apple) / odprta (Android).'),
	(18, 'Kaj od naštetega je primer škodljive kode za iOS?', 4, 'Ikee je črv, ki izkorišča privzeta gesla za SSH. Napad je bil s strani ranljvosti na rootanih iPhoneih.'),
	(19, ' Kaj od naštetega je namen standardiziranja sistemov upravljanja varovanja informacij - SUVI ?', 5, ' Sistem SUIV podaja model za določitev, vpostavitev, delovanje, spremljanje, pregled, vzdrževanje, izboljševanje. uporablja se procesni pristop.'),
	(20, 'Kaj ni metoda HTTP zahteve?', 5, 'Zahteve HTTP so sporočila, ki jih odjemalec pošlje za začetek dejanja v strežniku. Njihova začetna vrstica vsebuje tri elemente: metodo HTTP, glagol (kot je GET , PUT ali POST ) ali samostalnik (kot je HEAD ali OPTIONS ), ki opisuje dejanje, ki ga je treba izvesti.'),
	(21, 'Katero od vprašanj o piškotkih ne velja?', 5, 'HTTP piškotek je majhen delček podatkov, ki ga strežnik pošlje spletnemu brskalniku. Brskalnik ga lahko shrani in ga pošlje s prihodnjimi zahtevami spletnega mesta. Upravlja seje; prijave, nakupovalni vozički, rezultati iger ali katero koli drugo stanje seje. Skrbi za personalizacijo; uporabniške nastavitve, teme in druge nastavitve. Sledi, snemanja in analiza vedenja uporabnikov.'),
	(22, 'Kaj ni vprašanje Unix modela varnosti politike istega izvora?', 6, 'Pri Unix modelu varnosti nas zanima osebek (kdo?), predmeti (kaj?), in dostopne operacije (kako?).'),
	(23, 'Kaj je namen politike istega izvora za HTTP odgovre?', 6, 'SOP preprečuje, da bi Javascript na spletnem mestu napadalec.com neposredno pregledoval odgovore HTTP (tj. piksle v sliki), ne preprečuje pa, da nekdo izvede zahtevek.'),
	(24, 'Zakaj varujemo povezavo (HTTPS)?', 7, 'ovezavo varuemo pred vrivanjem, prestrezanjem in spreminjanjem.'),
	(25, 'Na katerem od naštetih nivojev se ne izvaja informacijska varnost?', 6, 'Informacijska varnost se izvaja na treh nivojih: Fizični/tehnični nivo (products - physical security), Nivo procesov/organizacijskih procesov (procedures - organizational security), Nivo posameznika/uporabnika (people - personal security).'),
	(26, 'Kako deluje lokacijsko prestopno ponarejanje (spletnih) zahtevkov(Cross-Site RequestForgery(CSRF)) ?', 8, 'V napadu CSRF je uporabnik prevaran, da na žrtvenemu spletnemu mestu posreduje spletno zahtevo „v svojem imenu“.'),
	(27, 'Kateri so dejavniki klasifikacije informacij?', 7, 'Dejavniki, ki vplivajo na to katero informacijo se označi kot zaupno, so: vrednost, starost informacije, ter podatek o tem ali je ta informacija morda že javna.'),
	(28, 'Kaj so piškotki same site?', 7, 'Preprečevanje napadov CSRF: Piškotki ne označujejo, ali je pooblaščena prijava oddala zahtevo, saj so vključeni v vsako zahtevo (obseg); Piškotki SOP: Piškotki z eksplicitnimi domenami se pošljejo glede na ujemanjein poddomene. Piškotki spraznimi ali implicitnimi domenami se pošljejo samo na domeno, ki se točno ujema (in ne tudi poddomene).\n'),
	(29, ' Kateri izmed naštetih modelov opiše SQL vrivanje ?', 9, 'SQL vrivanje deluje tako, da napadalec pošlje zlonamerno formo na žrtev, ki je v tem primeru strežnik. Ta izvede zlonamerno SQL poizvedbo na podatkovno bazo, ki posreduje naše podatke napadalcu.'),
	(30, 'Kaj je lokacijsko prestopno skriptiranje -Cross Site Scripting(XSS) ?', 10, 'Napad se zgodi, ko aplikacija prejme nezaupljive podatke in jih pošlje v spletni brskalnik brez ustreznega preverjanja.Napadalec lahko vrine skriptno kodo na strani, ki jih ustvari spletna aplikacija. Poznamo dva tipa napadov:Odsevni XSS; Napadalčeva skripta se uporabniku prikaže kot del „žrtvene“ spletne strani in Shranjen XSS; Napadalec zlonamerne kodo shrani v vir, ki ga upravlja spletna aplikacija, na primer v PB.'),
	(31, ' Kaj je ugrabitev seje?', 8, 'Napadalec čaka, da se uporabnik prijavinato napadalec ukrade uporabnikov sejni žeton in s tem "ugrabi" sejo⇒napadalec lahko v imenu uporabnika izda samovoljne zahteve.'),
	(32, 'Kako se zgodi napad na nivoju overjanja?', 9, 'Možni napadi na nivoju overjanja so napadi s slovarjem, surovo silo, mavričnimi tabelami, podaljškom, s stranskim kanalom, napad na bitno zapopolnjevanje.'),
	(33, 'Kako se zgodi shranjen napad XSS?', 8, 'Napad se zgodi, ko aplikacija prejme nezaupljive podatke in jih pošlje v spletni brskalnik brez ustreznega preverjanja.Napadalec lahko vrine skriptno kodo na strani, ki jih ustvari spletna aplikacija. Poznamo dva tipa napadov:Odsevni XSS; Napadalčeva skripta se uporabniku prikaže kot del „žrtvene“ spletne strani in Shranjen XSS; Napadalec zlonamerne kodo shrani v vir, ki ga upravlja spletna aplikacija, na primer v PB.'),
	(34, 'Kako varno shranjujemo gesla v spletnih sistemih da so le ti čim bolj varni pred napadi?', 9, 'Težava shranjevanja gesel: tipične zgoščevalne funkcije se izvajajo prehitro. Omogoča uporabo GPU-jev za napad s surovo silo. Rešitev: uporaba namenskih zgoščevalnih funkcij, ki se izvajajo počasi. Ti algoritmi vključujejo “delovni faktor (ang. Workfactor)“, ki zveča kompleksnost izračuna. scrypt tudi zahteva velike količine pomnilnika v izračunih, kar še dodatno otežuje napad s surovo silo.Primeri: bcrypt, scrypt, PBKDF2, Argon2.'),
	(35, 'Kaj ni cilj elektronskega podpisa?', 2, 'Cilji elektronskega podpisa so ohranjanje celovitosti sporočila, preverjanje identitete pošiljatelja (overjanje), preprečevanje pretvarjanja za drugo osebo, zagotavlja zaščito pred ponarejanjem, zagotavlja povezavo s podpisnikom, se ne da prenesti na drugi dokument, mora odkriti spremembe v podpisanem dokumentu.');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
