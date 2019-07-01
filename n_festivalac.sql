-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2019 at 02:58 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `n_festivalac`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `povecaj` (IN `vest_sifra` INT)  NO SQL
BEGIN

DECLARE Increment int;
SET Increment = 1;
UPDATE vest SET klik = klik + Increment WHERE sifra=vest_sifra;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `galerija`
--

CREATE TABLE `galerija` (
  `sifra_g` int(11) NOT NULL,
  `naziv_foldera` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `vest` int(11) NOT NULL,
  `autor` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `glavna`
--

CREATE TABLE `glavna` (
  `vest` int(11) NOT NULL,
  `datum` varchar(11) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `glavna`
--

INSERT INTO `glavna` (`vest`, `datum`) VALUES
(76, '2019-02-02'),
(82, '');

-- --------------------------------------------------------

--
-- Table structure for table `glavna_eng`
--

CREATE TABLE `glavna_eng` (
  `vest_eng` int(11) NOT NULL,
  `datum` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `glavna_eng`
--

INSERT INTO `glavna_eng` (`vest_eng`, `datum`) VALUES
(1, '2019-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `izdvajamo`
--

CREATE TABLE `izdvajamo` (
  `vest` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `izdvajamo`
--

INSERT INTO `izdvajamo` (`vest`) VALUES
(67),
(87);

-- --------------------------------------------------------

--
-- Table structure for table `izdvajamo_eng`
--

CREATE TABLE `izdvajamo_eng` (
  `vest` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `izdvajamo_eng`
--

INSERT INTO `izdvajamo_eng` (`vest`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `kategorija`
--

CREATE TABLE `kategorija` (
  `sifra` tinyint(10) NOT NULL,
  `naziv` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `kategorija`
--

INSERT INTO `kategorija` (`sifra`, `naziv`) VALUES
(4, 'Članka'),
(3, 'Intervju'),
(2, 'Izveštaj'),
(8, 'Koncerti'),
(7, 'Must-See'),
(1, 'Najava'),
(6, 'Top lista'),
(5, 'U fokusu');

-- --------------------------------------------------------

--
-- Table structure for table `komentari`
--

CREATE TABLE `komentari` (
  `sifra` int(11) NOT NULL,
  `vest` int(11) NOT NULL,
  `ime` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `sadrzaj` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `odobri` tinyint(1) NOT NULL,
  `datum` varchar(11) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `komentari_eng`
--

CREATE TABLE `komentari_eng` (
  `sifra` int(11) NOT NULL,
  `vest` int(11) NOT NULL,
  `ime` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `sadrzaj` varchar(2500) COLLATE utf8_unicode_ci NOT NULL,
  `odobrenje` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE `newsletter` (
  `sifra` int(11) NOT NULL,
  `ime` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `mail` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `newsletter`
--

INSERT INTO `newsletter` (`sifra`, `ime`, `mail`) VALUES
(1, 'Goca', 's_goca@yahoo.com');

-- --------------------------------------------------------

--
-- Table structure for table `novinar`
--

CREATE TABLE `novinar` (
  `sifra` int(11) NOT NULL,
  `ime` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `mail` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `master` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `novinar`
--

INSERT INTO `novinar` (`sifra`, `ime`, `password`, `mail`, `master`) VALUES
(1, 'Nemanja', '202cb962ac59075b964b07152d234b70', '1a744e97c7aafa4e66285f51d170213a', 1),
(15, 'Goca', 'd4bee4178e541ead84e88009efaf1582', '6a76f09513905d4754d241f85b9d4958', 1),
(36, 'Jovana', '456789', 'jovana@mail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `slike_galerija`
--

CREATE TABLE `slike_galerija` (
  `folder` int(11) NOT NULL,
  `naziv_slike` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `odakle` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `status_vesti`
--

CREATE TABLE `status_vesti` (
  `sifra` int(1) NOT NULL,
  `naziv` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `status_vesti`
--

INSERT INTO `status_vesti` (`sifra`, `naziv`) VALUES
(2, 'draft'),
(0, 'na_cekanju'),
(3, 'Obrisano'),
(1, 'Odobreno'),
(4, 'rasporedjeno');

-- --------------------------------------------------------

--
-- Table structure for table `tagovi`
--

CREATE TABLE `tagovi` (
  `sifra` int(10) NOT NULL,
  `imetaga` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tagovi`
--

INSERT INTO `tagovi` (`sifra`, `imetaga`) VALUES
(2, 'Subotica'),
(3, 'Lady Gaga'),
(5, 'Sziget'),
(6, 'Budapest'),
(7, 'NOFX'),
(8, 'Punk Rock Holiday'),
(9, 'Descendents'),
(10, 'Ignite'),
(11, 'OK Fest'),
(12, 'Love Fest'),
(13, 'Bajaga i Instruktori'),
(15, 'Buč Kesidi'),
(17, 'Antonio Gramentier'),
(28, 'Exit'),
(29, 'Shilpa Ray'),
(30, 'Southern Soul Festival'),
(31, 'Arsenal Fest'),
(32, 'INmusic festival'),
(33, 'Foals'),
(34, 'Suede'),
(35, 'The Cure'),
(36, 'Garbage'),
(37, 'Regius Festival'),
(38, 'Lollapalooza Berlin'),
(39, 'Kings of Leon'),
(40, 'UNCLE'),
(41, 'Le Guess Who?'),
(42, 'Deerhunter'),
(43, 'Cate Le Bon'),
(44, 'Gruff Rhys'),
(45, 'Pavement'),
(46, 'Primavera Sound'),
(47, 'NOS Primavera'),
(48, 'OK Fest'),
(49, 'Franz Ferdinand'),
(50, 'Lovefest'),
(51, 'Sziget'),
(52, 'Foo Fighters'),
(53, 'The National'),
(54, 'Dead Can Dance'),
(55, 'Garbage'),
(56, 'Autopark'),
(57, 'Terminal Music & Arts Festival'),
(58, 'Nneka'),
(59, 'Outhide Festival'),
(60, 'Svemirko'),
(61, 'Who See'),
(62, 'Belgrade Beer Fest'),
(63, 'Johnny Marr'),
(64, 'EXIT'),
(65, 'The Cure'),
(66, 'Skepta'),
(67, 'neki novi tag'),
(68, 'Algiers'),
(69, 'Ben Caplan'),
(70, 'Antonio Gramentiere'),
(71, 'Antionio'),
(72, 'Antionio');

-- --------------------------------------------------------

--
-- Table structure for table `tag_vest`
--

CREATE TABLE `tag_vest` (
  `vest` int(11) NOT NULL,
  `tag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tag_vest`
--

INSERT INTO `tag_vest` (`vest`, `tag`) VALUES
(79, 29),
(76, 30),
(33, 31),
(36, 32),
(36, 33),
(36, 34),
(36, 35),
(36, 36),
(39, 37),
(37, 38),
(37, 39),
(38, 40),
(45, 41),
(45, 42),
(45, 43),
(45, 44),
(35, 45),
(35, 46),
(35, 47),
(64, 48),
(64, 49),
(68, 50),
(66, 51),
(66, 52),
(66, 53),
(80, 54),
(81, 55),
(81, 56),
(82, 57),
(82, 58),
(83, 59),
(83, 60),
(83, 15),
(83, 61),
(85, 62),
(85, 63),
(87, 64),
(87, 65),
(87, 66);

-- --------------------------------------------------------

--
-- Table structure for table `tag_vest_eng`
--

CREATE TABLE `tag_vest_eng` (
  `tag` int(11) NOT NULL,
  `vest_eng` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tag_vest_eng`
--

INSERT INTO `tag_vest_eng` (`tag`, `vest_eng`) VALUES
(12, 1),
(69, 3),
(68, 2);

-- --------------------------------------------------------

--
-- Table structure for table `vest`
--

CREATE TABLE `vest` (
  `sifra` int(11) NOT NULL,
  `naslov` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `tekst` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `kategorija` tinyint(10) NOT NULL,
  `autor` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `vreme` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `klik` smallint(254) NOT NULL,
  `slika` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `vreme_objave` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vest`
--

INSERT INTO `vest` (`sifra`, `naslov`, `tekst`, `kategorija`, `autor`, `status`, `vreme`, `klik`, `slika`, `vreme_objave`) VALUES
(33, 'Poznat kompletan program Arsenal festa', '<p><strong>Deveto izdanje kragujevačkog Arsenal festa biće održano od 19. do 22. juna, a organizatori su otkrili kompletnu listu učesnika.</strong></p>\r\n\r\n<p>Prve večeri Arsenala 09, pre legendarnog američkog sastava <strong>Testament</strong> i folk metalaca iz grupe <strong>Pero Defformero</strong> program na Mejnu otvaraju death metalci <strong>Dead Joker</strong>, dok na Garden bini 19. juna pored čuvenog <strong>Atomskog skloni&scaron;ta</strong> basiste Brune Langera dolaze i gitarski pop bend <strong>Majda</strong>n, &ldquo;novajlije na beogradskoj sceni&rdquo; <strong>Lem Jem, Urban Instinkt</strong>, rok sastav <strong>Vesela ma&scaron;ina</strong> i tre&scaron;eri <strong>Alitor</strong>.</p>\r\n\r\n<p>Druge festivalske večeri zvezde su <strong>Darko Rundek i Ekipa, Little Steven</strong> i <strong>Vlatko Stefanovski</strong> koji će nastupati na glavnoj bini, dok će na Garden stejdžu svirati <strong>Ritam nereda</strong>, bluz-pank bend <strong>M.O.R.T.</strong> i beogradski pank <strong>Irci Scordisci</strong>, &ldquo;rokenrol iz srca &Scaron;umadije&rdquo; Nikom ni&scaron;ta, &ldquo;novi bend iz Beograda&rdquo; <strong>Turisti</strong>, kantautor <strong>Mile Kekin</strong>, kao i <strong>Dejan Cukić</strong>.</p>\r\n\r\n<p>Treće veče 21. juna, pored zakucavanja sa<strong> Eyesburnom, Dr. Neletom Karajlićem</strong> i <strong>Hladnim pivom</strong> na Mejnu, Arsenal nudi na Gardenu američke stonere <strong>Red Fang, Đorđa Miljenovića, Artan Lili</strong> i <strong>Autopark</strong>, kojima su se pridružili ska <strong>Samostalni referenti</strong>, grandžeri <strong>Stone Sliper </strong>i užički hardkor bend <strong>Brat</strong>.</p>\r\n\r\n<p>Četvrto, zavr&scaron;no, udaračko veče 22. juna na najvećoj festivalskoj bini proteći će u znaku legendarnih <strong>Partibrejkersa</strong>, pankera <strong>Goblina</strong> i američkog indi rokera <strong>Kurta Vilea</strong> i njegovih <strong>The Violators</strong>, a na Gardenu su uz repera <strong>Vojka V</strong> i <strong>Vizelj</strong>, stigli <strong>Dram</strong>, duo <strong>Buč Kesidi</strong>, kao i kultni pankeri <strong>Atheist Rap</strong> koji će jubilej 30 godina rada obeležiti i nastupom na Arsenalu.</p>\r\n\r\n<p>Garden, kao i festival, zatvara soul muzičar <strong>Marko Louis</strong>, povratnik na Arsenal, koji je i pro&scaron;le godine ovde sa brojnom publikom dočekao jutro. Publici će se predstaviti i mladi bendovi <strong>Mud Factory, Fluid Underground</strong> i <strong>Bohemija</strong>, kao i ni&scaron;ki post-rok sastav <strong>There</strong>.</p>\r\n\r\n<p>Komplet ulaznica za sva četiri dana Arsenala 09 ko&scaron;ta 2.300 dinara, dok je 1.000 za pojedinačan dan, preko Ticket Visiona.</p>\r\n\r\n<p>&lt;iframe width=&quot;560&quot; height=&quot;315&quot; src=&quot;https://www.youtube.com/embed/ifIMDw1mvQM&quot; frameborder=&quot;0&quot; allow=&quot;accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture&quot; allowfullscreen&gt;&lt;/iframe&gt;</p>', 1, 1, 1, '2019-06-07 14:10', 3, 'arsenal.jpg', '2019-06-01 12:00'),
(35, 'Primavera Sound najavljuje Pavement sledeće godine', '<p><strong>Organizatori jednog od najpopularnijih evropskih festivala, Primavera Sound, najavili su prvo ime za naredno dvadeseto izdanje, a u pitanju je američki indi-rok sastav Pavement.</strong></p>\r\n\r\n<p>Koncerti u Barseloni (<strong>Primavera Sound</strong>) odnosno Portu (<strong>NOS Primavera</strong>) biće jedini koji će članovi benda Pavement održati čime će prekinuti pauzu dugu vi&scaron;e od dve decenije. Sastav koji je predvodio <strong>Stephen Malkmus</strong>, oformljen je 1989. godine, ali nakon pet studijskih albuma i deset godina postojanja, neočekivano su prestali sa radom.</p>\r\n\r\n<p>Devetnaesto izdanje Primavere nedavno je okončano, a među glavnim zvezdama ovogodi&scaron;njeg programa bili su Tame Impala, Solange, Interpol, Erykah Badu i mnogi drugi.</p>\r\n\r\n<p>&lt;iframe width=&quot;560&quot; height=&quot;315&quot; src=&quot;https://www.youtube.com/embed/QTTgpTeb0Z8&quot; frameborder=&quot;0&quot; allow=&quot;accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture&quot; allowfullscreen&gt;&lt;/iframe&gt;</p>', 1, 1, 1, '2019-06-04', 24, 'Pavement.jpg', '2019-06-04'),
(36, 'The Cure, Foals i Suede su hedlajneri INmusic festivala', '<p><strong>Zagrebački INmusic festival, koji se ove godine održava od 24. do 26. juna na Jarunu, ugostiće mno&scaron;tvo poznatih i popularnih bendova, a kao glavne zvezde ističu se The Cure, Foals i Suede.</strong></p>\r\n\r\n<p>Prve festivalske večeri na glavnoj bini pored sastav <strong>Foals</strong>, nastupiće <strong>The Hives</strong>, zatim <strong>Kurt Vile &amp; the Violators</strong>, te <strong>Stephany Stefan</strong> i <strong>Infected</strong>. OTP World stejdž ugostiće imena kao &scaron;to su <strong>Johnny Marr</strong>, nekada&scaron;nji gitarista benda The Smiths, <strong>Skindred, Paul the Walrus</strong> i <strong>dno</strong>., a na Hidden stejdžu sviraće <strong>Siddharta, Fontaines D.C., Super Besse, Nord</strong> i <strong>Kevlar Bikini</strong>. <strong>Edi East Trance Blues</strong> bend sviraće na Balkan By Night bini.</p>\r\n\r\n<p>U utorak, 25. juna, Mejn stejdž je rezervisan za <strong>Suede</strong>, a tu su jo&scaron; i <strong>Garbage, Frank Turner &amp; the Sleeping Souls, Bang Bang</strong> i <strong>K&rsquo;s</strong>, dok će se na OTP World bini smenjivati <strong>Thievery Corporation, Gato Preto, Mel Camino</strong> i <strong>Gentleman</strong>. Na najudaljenijoj Hidden bini nastupaće <strong>Klinika Denisa Kataneca</strong>, <strong>Billie Joan, Black Honey, Lysitrata</strong> i <strong>Zeal &amp; Ardor</strong>, dok će <strong>Gatuzo</strong> gruvati na Balkan By Night stejdžu.</p>\r\n\r\n<p>Zavr&scaron;no festivalsko veče biće u znaku legendarnog sastav <strong>The Cure</strong>, koji će svirati preko dva sata, a pre njih nastupaće <strong>LP, JoyCut, Phantasmagoria</strong> i <strong>One Possible Option</strong>. Regionalne snage ophrvaće OTP World stejdž kada će svirati <strong>Kojoti, Mangroove, And The Kid</strong> i <strong>Ichabod</strong>, dok je natkriveni Hidden rezervisan za izvođače kao &scaron;to su <strong>Peter Bjorn And John, Run Sofa, The Ills, Tus Nua</strong> i <strong>The Black Room</strong>. <strong>Kandžija i Gole Žene</strong> su na Balkan By Night stejdžu.</p>\r\n\r\n<p>Nmusic festival #14 održaće se na već dobro poznatoj lokaciji jarunskih otoka u Zagrebu od 24. do 26. juna uz podr&scaron;ku OTP banke Hrvatska koja i u 2019. godini omogućuje beskontaktno plaćanje na festivalu.&nbsp;Ograničeni kontingent jednodnevnih ulaznica u prodaji je putem <a href="http://musicwebshop.com/" target="_blank">službenog festivalskog webshopa</a>. Jednodnevne ulaznice po ceni od 449 kuna (+ tro&scaron;kovi transakcije) za prvi i drugi dan festivala te za treći dan 499 kuna (+ tro&scaron;kovi transakcije) mogu se kupiti isključivo putem<a href="https://www.inmusicfestival.com/en/shop/tickets" target="_blank"> službenog INmusicovog webshopa</a>. U prodaji su i trodnevne ulaznice za 14. INmusic festival koje se mogu nabaviti u svim poslovnicama OTP banke Hrvatska, Dirty Old Shopu te putem&nbsp; <a href="http://musicwebshop.com/" target="_blank">službenog INmusic webshopa</a>&nbsp;po ceni od 549 kn (+ tro&scaron;kovi transakcije). Kamperske ulaznice za INmusic #14 dostupne su isključivo putem&nbsp;festivalskog webshopa&nbsp;po ceni od 250 kn (+ tro&scaron;kovi transakcije) do isteka zaliha.</p>\r\n\r\n<p>&lt;iframe width=&quot;560&quot; height=&quot;315&quot; src=&quot;https://www.youtube.com/embed/SND8xV_YFsw&quot; frameborder=&quot;0&quot; allow=&quot;accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture&quot; allowfullscreen&gt;&lt;/iframe&gt;</p>', 1, 1, 1, '2019-06-07 14:17', 8, 'The Cure.jpg', '2019-06-01 12:00'),
(37, 'Lollapalooza Berlin 2019  - kompletan muzički program', '<p><strong>Organizatori Lollapalooza festivala u Berlinu objavili su kompletan spisak izvođača ovogodi&scaron;njeg izdanja među kojima su Kings of Leon, Swedish House Mafia, Twenty One Pilots, Rita Ora, Martin Garrix i mnogi drugi.</strong><strong> Svet muzike, umetnosti, ukusne hrane, avantura i žurki čeka publiku i ove godine na Olimpijskom parku, a datumi održavanja ovogodi&scaron;njeg festivala su 7. i 8. septembar.</strong></p>\r\n\r\n<p><strong>Kings of Leon</strong>, bend sa vi&scaron;e od 21 miliona prodatih ploča i nekoliko Gremi nagrada, dolazi na berlinsku Lollu kako bi održao jedini koncert ove godine u Nemačkoj i prezentovao briljantni &scaron;ou prepun hitova sa prethodnih sedam studijskih izdanja. Takođe ekskluzivno biće pojavljivanje trija koga čine <strong>Axwell, Steve Angello</strong> i <strong>Sebastian Ingrosso</strong>. Zajedno formiraju supergrupu <strong>Swedish House Mafia</strong> koja je proteklih godina oblikovala svetsku dance music scenu, a sada nakon četiri godine pauze, u Berlinu ih očekuje nastup na glavnoj festivalskoj bini.</p>\r\n\r\n<p>Nastup od kojeg se mnogo očekuje jeste <strong>Kraftklu</strong>b, na op&scaron;tu radost lokalnih obožavalaca koji će horski pevati refrene pesama poput &ldquo;Chemie Chemie Ya&rdquo;, &ldquo;Sch&uuml;sse in die Luft&rdquo; ili &ldquo;Kein Liebeslied&rdquo;.</p>\r\n\r\n<p>Najveća festivalska pozornica &bdquo;Perry&acute;s Stage&ldquo; već je viđena za najveće festivalske zvezde: prvi put u istoriji, ova bina imaće svog DJ superstar kuratora. U nedelju, ni manje ni vi&scaron;e nego <strong>Martin Garrix</strong> preuzeće kormilo zajedno sa svojom STMPD etiketom, te će predstaviti imena kao &scaron;to su Loopers, TV Noise, Bart B More, dok će Don Diablo i Loud Luxury biti specijalni gosti. U subotu <strong>Alan Walker, Scooter</strong>, kao i legendarni elektro duo <strong>Underworld</strong> biće zaduženi za euforiju u Olimpijskom parku. Kapacitet će biti značajno pro&scaron;iren ove godine, nekoliko delova stadiona biće otvoreno za ovo plesno ludilo.</p>\r\n\r\n<p>Preko popa do panka, od ema do repa &ndash; žanrovska limitiranost ne poznaje sastav <strong>Twenty One Pilots</strong>. Njihovi zarazni hitovi &bdquo;Stressed Out&ldquo; i &bdquo;Heathens&ldquo; oriće se na glavnom stejdžu, a i zvezde mlađe generacije <strong>Billie Eilish</strong> i <strong>Khalid</strong> takođe će nastupati na ovoj bini.</p>\r\n\r\n<p>Ove godine, cr&egrave;me de la cr&egrave;me modernog nemačkog hip-hopa imaće predstavnike kao &scaron;to su <strong>Bausa</strong> i <strong>UFO361</strong>, a nastupaće i već etablirani reper <strong>Dendemann</strong> iz Hamburga.</p>\r\n\r\n<p>Indie-folk zvuk može se očekivati od irske muzičke zvezde koja nastupa pod imenom <strong>Hozier</strong>. Opremljen milionskim Spotify streamovima, dobitnik Gremija trenutno je u procesu rada na drugom albumu &bdquo;Wasteland, Baby&ldquo; koji se željno i&scaron;čekuje nakon četiri godine kreativne pauze.</p>\r\n\r\n<p>U duhu osnivača festivala Perija Ferela (Perry Farrell) internacionalni i lokalni izvođači imaće svoje mesto na Alternative i Weingarten binama. Među njima će se naći <strong>6LACK, Parcels, Rex Orange County, Courtney Barnett, Serpentwithfeet, Pip Bloom, Alli Neumann</strong> i <strong>Amilli</strong> koji će učiniti da srca muzičkih fanova kucaju brže.</p>\r\n\r\n<p>Činjenica da su <strong>Marteria &amp; Casper</strong> među najatraktivnijim live tačkama na kontinentu fanovi Lollapalooze su imali prilku da se uveri pre dve godine na Hoppegartenu, kada je publika na prostoru ispred najveće festivalske bine kolektivno stvorila gigantski moshpit koji je trajao nekoliko minuta. Ni ove godina neće biti izuzetak.</p>\r\n\r\n<p>Jo&scaron; jedna od miljenica evropske publike jeste i <strong>Rita Ora</strong>! Ona je dizajnerka, glumica, model i članica žirija u britanskom izdanju emisije The Voice &ndash; ali prvo i pre svega, muzičarka i pevačica. Godinama je neizostavni deo internacionalnih top-lista gde isporučuje jedan hit za drugim, bilo u solo izvedbi ili u duetu sa muzičarima kao &scaron;to su Cardi B, Calvin Harris, Avicii, One Direction, Liam Payne i Iggy Azalea. Ovo će biti njen premijerni koncert na Lollapaloozi.</p>\r\n\r\n<p>Ove godine dobrodo&scaron;licu na Olimpijskom stadionu u Berlinu imaće i francuski dj i producent <strong>Kungs</strong>, koji je odgovoran za neke od najvećih radio hitova i najzaraznijih ritmova u poslednje tri godine uključujući numeru &bdquo;This Girl&ldquo;. Naravno, Kungs će se naći za dj pultom na Perry&rsquo;s Stageu. Tamo će mu dru&scaron;tvo praviti i Matoma, Lari Luke, Skiy i Euxmar, koji su takođe najavljeni.</p>\r\n\r\n<p>Poslednje dve objave ovogodi&scaron;njeg izdanja uključuju australijski rok sastav <strong>The Faim</strong>, odnosno britanski pank trio <strong>Big Joanie</strong>, koga čine Stephanie Phillips, Estella Adeyeri i Chardine Taylor-Stone i koji će predstavio svoj debi album &bdquo;Sistahs&ldquo;.</p>\r\n\r\n<p>Cena dvodnevne ulaznice iznosi 149 &euro;, dok su dnevne ulaznice dostupne po ceni od 84 &euro;. Ukoliko želite da iskusite festival na jedan poseban način, to se može obezbediti putem Lolla Experience karte koja iznosti 249 &euro;. Od ove godine postoje i posebne tinejdžerske ulaznice koje pripadaju onima od 12 do 17 godina starosti, a koje se mogu kupiti po ceni od 79 &euro;. Sve ove ulaznice dostupne su na<a href="https://www.lollapalooza.com" target="_blank"> zvaničnom sajtu festivala.</a></p>\r\n\r\n<p>&lt;iframe width=&quot;560&quot; height=&quot;315&quot; src=&quot;https://www.youtube.com/embed/1y6smkh6c-0&quot; frameborder=&quot;0&quot; allow=&quot;accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture&quot; allowfullscreen&gt;&lt;/iframe&gt;</p>', 1, 1, 1, '2019-06-07 15:02', 13, 'Kings of Leon.jpg', '2019-06-01 12:00'),
(38, 'UNKLE dolazi na Summer3p festival 2019', '<p><strong>James Lavelle aka UNCLE biće glavna zvezda ovogodi&scaron;njeg Summer3p festivala koji se održava na Paliću od 25. do 28. jula.</strong></p>\r\n\r\n<p>Pored ovog prominentog autora, na 17. izdanju ove manifestacije mesta će naći i <strong>Matt Sassari</strong> iz Francuske, mađarski dj i producent <strong>Davko</strong>, odnosno njegov kolega iz Italije, <strong>Nick Reverse</strong>.</p>\r\n\r\n<p>Predstavnici elektronske muzike iz Srbije, <strong>Ascaloon, No Else, Hansol, Chrono aka Daltonist, Neomodern</strong> i <strong>Endy Dee</strong> takođe su na spisku učesnika. Pored muzičkog programa, organizatori najavljuju brojne umetničke instalacije i radionice, kao i sportske aktivnosti.</p>\r\n\r\n<p>Za dodatne informacije o cenama ulaznica možete posetiti <a href="http://summer3p.subotica.com/" target="_blank">zvanični festivalski sajt</a>.&nbsp;</p>\r\n\r\n<p>&lt;iframe width=&quot;560&quot; height=&quot;315&quot; src=&quot;https://www.youtube.com/embed/kUubW5szdwA&quot; frameborder=&quot;0&quot; allow=&quot;accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture&quot; allowfullscreen&gt;&lt;/iframe&gt;</p>\r\n\r\n<p>&nbsp;</p>', 1, 1, 3, '2019-06-07 15:04', 19, 'subotica.jpg', '2019-06-01 12:00'),
(39, 'Poznat kompletan line-up Regius festivala', '<p><strong>Novu festivalsku destinaciju u Dalmaciji &ndash; rt i plažu&nbsp;Martinska, otvara&nbsp;Regius festival&nbsp;i dovodi&nbsp;Električni orgazam, Eyesburn, Zoster, Sajsi MC, Stoka, Cold Snap, Them Moose Rush, Piknik Park&nbsp;i mnoge druge.</strong></p>\r\n\r\n<p>Osam bendova i pet DJ setova prodefilovaće tokom dva dana devetog izdanja Regius festivala koji je kroz godine opravdao status jednog od najboljih festivala alternativne muzike u Hrvatskoj te time stavio &Scaron;ibenik na mapu ljubitelja festivala takvog tipa. Ni&scaron;ta drukčije neće biti&nbsp;<strong>12. i 13. jula</strong>&nbsp;uz dosad najbogatiji i najraznovrsniji program. Regius je jedan od onih festivala koji gotovo nikad ne ponavlja izvođače, a organizatori se uz to trude dovesti bendove koji nikad nisu imali prilike svirati u &Scaron;ibeniku. Tako će ove godine čak &scaron;est od osam bendova imati premijerni nastup u tom gradu.</p>\r\n\r\n<p>Posebnost ovogodi&scaron;njeg izdanja Regiusa, osim muzičkog dela, je svakako i nova lokacija &ndash;&nbsp;<strong>čarobni rt Martinska</strong>&nbsp;koji se nalazi na početku &scaron;ibenskog kanala, a pruža sve ono &scaron;to zami&scaron;ljate od letnjeg festivala: more, predivnu prirodu, gustu borovu &scaron;umu, blizinu grada, a opet dovoljnu udaljenost. Radi se definitivno o jedinstvenoj festivalskoj lokaciji na kojoj će se ovog leta u sklopu projekta Martinska &Scaron;ibenik promeniti &scaron;est festivala različitih žanrova kroz &scaron;est nedelja, a čast da bude prvi među njima ima upravo Regius.</p>\r\n\r\n<p>Iako je&nbsp;<strong>Električni orgazam</strong>&nbsp;jedan od najvažnijih i najdugovječnijih rok bendova ovih prostora, u svojoj gotovo četrdesetgodi&scaron;njoj karijeri nikad nisu svirali u &Scaron;ibeniku, a zahvaljujući Regiusu to će se promeniti ovog leta. Na festival ne dolaze na krilima stare slave već na krilima aktuelnog pro&scaron;logodi&scaron;njeg albuma&nbsp;<em>Gde smo sad</em>&nbsp;kojeg je kritika proglasila njihovim najboljim u poslednjih 30 godina. Osim njih kao headlineri najavljeni su kultni beogradski hardcore/reggae sastav&nbsp;<strong>Eyesburn</strong>&nbsp;koji su pre dva meseca prekinuli vi&scaron;egodi&scaron;nju pauzu te su upravo &Scaron;ibenik izabrali kao prvi i zasad jedini nastup u Hrvatskoj gde stižu nakon Exita.</p>\r\n\r\n<p>Jedan od bendova kojeg su priželjkivali fanovi na dru&scaron;tvenim mrežama Regius festivala je svakako mostarski rock/reggae sastav&nbsp;<strong>Zoster</strong>&nbsp;čija je gotovo dvadesetogodi&scaron;nja karijera obeležena s četiri studijska albuma. Bend koji je poznat po svojim energičnim nastupima i melodičnim, lucidnim tekstovima, nastupao je na svim najvažnijim festivalima u regiji pa je logičan sled bio i Regius. Novi headlineri pridružili su se ranije najavljenima; beogradskoj reperki&nbsp;<strong>Sajsi MC</strong>&nbsp;i jednom od prvaka hrvatskog hip-hopa&nbsp;<strong>Marinu Ivanoviću Stoki</strong>.</p>\r\n\r\n<p>Osim njih, &scaron;ibensku publiku zabavljaće jo&scaron; bendovi&nbsp;<strong>Cold Snap</strong>&nbsp;koji su najdugovječniji hrvatski metal sastav, bjelovarski prog noise rock trio&nbsp;<strong>Them Moose Rush</strong>&nbsp;koje je ugledni Europavox uvrstio među najveće evropske rok nade 2018. godine i najpoznatiji Linkin Park tribute band &ndash;&nbsp;<strong>Piknik Park</strong>&nbsp;iz Mađarske koji ima simpatizere po celom svetu, a tako i u Hrvatskoj gde su redovno imali rasprodate koncerte. Međutim, muzika neće živeti samo u večernjim satima na Martinskoj. Svi oni koji će se smestiti u festivalskom kampu koji je besplatan, uživaće u dobroj muzici i tokom dana zahvaljujući DJ-evima koji će se smenjivati u dnevnom i večernjem programu, a to&nbsp;<strong>Daboo</strong>,&nbsp;<strong>Rofellos</strong>,&nbsp;<strong>Babilonska</strong>,&nbsp;<strong>Los Santos</strong>&nbsp;i rezidenti festivala&nbsp;<strong>&Scaron;kalja i Sokol</strong>.</p>\r\n\r\n<p>Za sve informacije u vezi sa cenama ulaznica možete posetiti <a href="https://www.entrio.hr/event/regius-festival-9-5658" target="_blank">ovu stranicu</a>.</p>\r\n\r\n<p>&lt;iframe width=&quot;560&quot; height=&quot;315&quot; src=&quot;https://www.youtube.com/embed/8KHvvktmeng&quot; frameborder=&quot;0&quot; allow=&quot;accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture&quot; allowfullscreen&gt;&lt;/iframe&gt;</p>\r\n\r\n<p>&nbsp;</p>', 1, 1, 1, '2019-06-07 20:38', 8, 'Električni orgazam.jpg', '2019-06-01 12:00'),
(45, 'Objavljen inicijalni program ovogodišnjeg Le Guess Who? Festivala', '<p><strong>Organizatori holandskog&nbsp;Le Guess Who? festivala&nbsp;predstavili su imena izvođača koja će ove godine od 7. do 10. novembra nastupati na raznim lokacijama u Utrehtu.</strong></p>\r\n\r\n<p>Ovaj festival svake godine poziva gostujuće kuratore, a za ovo izdanje to su&nbsp;<strong>Moon Duo</strong>,&nbsp;<strong>Dženi Hval</strong>&nbsp;(<strong>Jenny Hval</strong>),&nbsp;<strong>Fatoumata Diawara, The Bug, Iris van Herpen &amp; Salvador Brid (Breed)&nbsp;</strong>i gitarista i kompozitor&nbsp;<strong>Patrik Higins</strong>&nbsp;(<strong>Patrick Higgins)</strong>.</p>\r\n\r\n<p>Među imenima koje će Moon Duo predstaviti nalaze se&nbsp;&nbsp;<strong>Nivhek</strong>&nbsp;(novi projekat Liz Heris iz benda&nbsp;<strong>Grouper</strong>),&nbsp;<strong>Tr&auml;d, Sonic Boom, Gr&auml;s och Stenar</strong>&nbsp;i&nbsp;<strong>Idris Ackamoor &amp; The Pyramids</strong>&nbsp;i drugi, dok Dženi Hval predstavlja izvođače kao &scaron;to su&nbsp;&nbsp;<strong>Sarah Davachi</strong>,&nbsp;<strong>Lasse Marhaug</strong>,&nbsp;<strong>F&eacute;licia Atkinson</strong>&nbsp;i drugi.</p>\r\n\r\n<p>&lt;blockquote class=&quot;instagram-media&quot; data-instgrm-permalink=&quot;https://www.instagram.com/p/BxxAYAYDyn-/&quot; data-instgrm-version=&quot;12&quot; style=&quot; background:#FFF; border:0; border-radius:3px; box-shadow:0 0 1px 0 rgba(0,0,0,0.5),0 1px 10px 0 rgba(0,0,0,0.15); margin: 1px; max-width:540px; min-width:326px; padding:0; width:99.375%; width:-webkit-calc(100% - 2px); width:calc(100% - 2px);&quot;&gt;&lt;div style=&quot;padding:16px;&quot;&gt; &lt;a href=&quot;https://www.instagram.com/p/BxxAYAYDyn-/&quot; style=&quot; background:#FFFFFF; line-height:0; padding:0 0; text-align:center; text-decoration:none; width:100%;&quot; target=&quot;_blank&quot;&gt; &lt;div style=&quot; display: flex; flex-direction: row; align-items: center;&quot;&gt; &lt;div style=&quot;background-color: #F4F4F4; border-radius: 50%; flex-grow: 0; height: 40px; margin-right: 14px; width: 40px;&quot;&gt;&lt;/div&gt; &lt;div style=&quot;display: flex; flex-direction: column; flex-grow: 1; justify-content: center;&quot;&gt; &lt;div style=&quot; background-color: #F4F4F4; border-radius: 4px; flex-grow: 0; height: 14px; margin-bottom: 6px; width: 100px;&quot;&gt;&lt;/div&gt; &lt;div style=&quot; background-color: #F4F4F4; border-radius: 4px; flex-grow: 0; height: 14px; width: 60px;&quot;&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div style=&quot;padding: 19% 0;&quot;&gt;&lt;/div&gt; &lt;div style=&quot;display:block; height:50px; margin:0 auto 12px; width:50px;&quot;&gt;&lt;svg width=&quot;50px&quot; height=&quot;50px&quot; viewBox=&quot;0 0 60 60&quot; version=&quot;1.1&quot; xmlns=&quot;https://www.w3.org/2000/svg&quot; xmlns:xlink=&quot;https://www.w3.org/1999/xlink&quot;&gt;&lt;g stroke=&quot;none&quot; stroke-width=&quot;1&quot; fill=&quot;none&quot; fill-rule=&quot;evenodd&quot;&gt;&lt;g transform=&quot;translate(-511.000000, -20.000000)&quot; fill=&quot;#000000&quot;&gt;&lt;g&gt;&lt;path d=&quot;M556.869,30.41 C554.814,30.41 553.148,32.076 553.148,34.131 C553.148,36.186 554.814,37.852 556.869,37.852 C558.924,37.852 560.59,36.186 560.59,34.131 C560.59,32.076 558.924,30.41 556.869,30.41 M541,60.657 C535.114,60.657 530.342,55.887 530.342,50 C530.342,44.114 535.114,39.342 541,39.342 C546.887,39.342 551.658,44.114 551.658,50 C551.658,55.887 546.887,60.657 541,60.657 M541,33.886 C532.1,33.886 524.886,41.1 524.886,50 C524.886,58.899 532.1,66.113 541,66.113 C549.9,66.113 557.115,58.899 557.115,50 C557.115,41.1 549.9,33.886 541,33.886 M565.378,62.101 C565.244,65.022 564.756,66.606 564.346,67.663 C563.803,69.06 563.154,70.057 562.106,71.106 C561.058,72.155 560.06,72.803 558.662,73.347 C557.607,73.757 556.021,74.244 553.102,74.378 C549.944,74.521 548.997,74.552 541,74.552 C533.003,74.552 532.056,74.521 528.898,74.378 C525.979,74.244 524.393,73.757 523.338,73.347 C521.94,72.803 520.942,72.155 519.894,71.106 C518.846,70.057 518.197,69.06 517.654,67.663 C517.244,66.606 516.755,65.022 516.623,62.101 C516.479,58.943 516.448,57.996 516.448,50 C516.448,42.003 516.479,41.056 516.623,37.899 C516.755,34.978 517.244,33.391 517.654,32.338 C518.197,30.938 518.846,29.942 519.894,28.894 C520.942,27.846 521.94,27.196 523.338,26.654 C524.393,26.244 525.979,25.756 528.898,25.623 C532.057,25.479 533.004,25.448 541,25.448 C548.997,25.448 549.943,25.479 553.102,25.623 C556.021,25.756 557.607,26.244 558.662,26.654 C560.06,27.196 561.058,27.846 562.106,28.894 C563.154,29.942 563.803,30.938 564.346,32.338 C564.756,33.391 565.244,34.978 565.378,37.899 C565.522,41.056 565.552,42.003 565.552,50 C565.552,57.996 565.522,58.943 565.378,62.101 M570.82,37.631 C570.674,34.438 570.167,32.258 569.425,30.349 C568.659,28.377 567.633,26.702 565.965,25.035 C564.297,23.368 562.623,22.342 560.652,21.575 C558.743,20.834 556.562,20.326 553.369,20.18 C550.169,20.033 549.148,20 541,20 C532.853,20 531.831,20.033 528.631,20.18 C525.438,20.326 523.257,20.834 521.349,21.575 C519.376,22.342 517.703,23.368 516.035,25.035 C514.368,26.702 513.342,28.377 512.574,30.349 C511.834,32.258 511.326,34.438 511.181,37.631 C511.035,40.831 511,41.851 511,50 C511,58.147 511.035,59.17 511.181,62.369 C511.326,65.562 511.834,67.743 512.574,69.651 C513.342,71.625 514.368,73.296 516.035,74.965 C517.703,76.634 519.376,77.658 521.349,78.425 C523.257,79.167 525.438,79.673 528.631,79.82 C531.831,79.965 532.853,80.001 541,80.001 C549.148,80.001 550.169,79.965 553.369,79.82 C556.562,79.673 558.743,79.167 560.652,78.425 C562.623,77.658 564.297,76.634 565.965,74.965 C567.633,73.296 568.659,71.625 569.425,69.651 C570.167,67.743 570.674,65.562 570.82,62.369 C570.966,59.17 571,58.147 571,50 C571,41.851 570.966,40.831 570.82,37.631&quot;&gt;&lt;/path&gt;&lt;/g&gt;&lt;/g&gt;&lt;/g&gt;&lt;/svg&gt;&lt;/div&gt;&lt;div style=&quot;padding-top: 8px;&quot;&gt; &lt;div style=&quot; color:#3897f0; font-family:Arial,sans-serif; font-size:14px; font-style:normal; font-weight:550; line-height:18px;&quot;&gt; Погледајте ову објаву у апликацији Instagram&lt;/div&gt;&lt;/div&gt;&lt;div style=&quot;padding: 12.5% 0;&quot;&gt;&lt;/div&gt; &lt;div style=&quot;display: flex; flex-direction: row; margin-bottom: 14px; align-items: center;&quot;&gt;&lt;div&gt; &lt;div style=&quot;background-color: #F4F4F4; border-radius: 50%; height: 12.5px; width: 12.5px; transform: translateX(0px) translateY(7px);&quot;&gt;&lt;/div&gt; &lt;div style=&quot;background-color: #F4F4F4; height: 12.5px; transform: rotate(-45deg) translateX(3px) translateY(1px); width: 12.5px; flex-grow: 0; margin-right: 14px; margin-left: 2px;&quot;&gt;&lt;/div&gt; &lt;div style=&quot;background-color: #F4F4F4; border-radius: 50%; height: 12.5px; width: 12.5px; transform: translateX(9px) translateY(-18px);&quot;&gt;&lt;/div&gt;&lt;/div&gt;&lt;div style=&quot;margin-left: 8px;&quot;&gt; &lt;div style=&quot; background-color: #F4F4F4; border-radius: 50%; flex-grow: 0; height: 20px; width: 20px;&quot;&gt;&lt;/div&gt; &lt;div style=&quot; width: 0; height: 0; border-top: 2px solid transparent; border-left: 6px solid #f4f4f4; border-bottom: 2px solid transparent; transform: translateX(16px) translateY(-4px) rotate(30deg)&quot;&gt;&lt;/div&gt;&lt;/div&gt;&lt;div style=&quot;margin-left: auto;&quot;&gt; &lt;div style=&quot; width: 0px; border-top: 8px solid #F4F4F4; border-right: 8px solid transparent; transform: translateY(16px);&quot;&gt;&lt;/div&gt; &lt;div style=&quot; background-color: #F4F4F4; flex-grow: 0; height: 12px; width: 16px; transform: translateY(-4px);&quot;&gt;&lt;/div&gt; &lt;div style=&quot; width: 0; height: 0; border-top: 8px solid #F4F4F4; border-left: 8px solid transparent; transform: translateY(-4px) translateX(8px);&quot;&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt; &lt;div style=&quot;display: flex; flex-direction: column; flex-grow: 1; justify-content: center; margin-bottom: 24px;&quot;&gt; &lt;div style=&quot; background-color: #F4F4F4; border-radius: 4px; flex-grow: 0; height: 14px; margin-bottom: 6px; width: 224px;&quot;&gt;&lt;/div&gt; &lt;div style=&quot; background-color: #F4F4F4; border-radius: 4px; flex-grow: 0; height: 14px; width: 144px;&quot;&gt;&lt;/div&gt;&lt;/div&gt;&lt;/a&gt;&lt;p style=&quot; color:#c9c8cd; font-family:Arial,sans-serif; font-size:14px; line-height:17px; margin-bottom:0; margin-top:8px; overflow:hidden; padding:8px 0 7px; text-align:center; text-overflow:ellipsis; white-space:nowrap;&quot;&gt;&lt;a href=&quot;https://www.instagram.com/p/BxxAYAYDyn-/&quot; style=&quot; color:#c9c8cd; font-family:Arial,sans-serif; font-size:14px; font-style:normal; font-weight:normal; line-height:17px; text-decoration:none;&quot; target=&quot;_blank&quot;&gt;Објава коју дели Le Guess Who? (@le_guess_who)&lt;/a&gt; дана &lt;time style=&quot; font-family:Arial,sans-serif; font-size:14px; line-height:17px;&quot; datetime=&quot;2019-05-22T13:02:07+00:00&quot;&gt;22. Мај 2019. у 6:02 PDT&lt;/time&gt;&lt;/p&gt;&lt;/div&gt;&lt;/blockquote&gt; &lt;script async src=&quot;//www.instagram.com/embed.js&quot;&gt;&lt;/script&gt;</p>\r\n\r\n<p>The Bug, eksperimentalni muzički projekat iza koga stoji&nbsp;<strong>Kevin Martin,&nbsp;</strong>predstaviće, između ostalih,&nbsp;<strong>Godflesh</strong>&nbsp;i&nbsp;&nbsp;<strong>Hatis Noit</strong>, dok će Higins predstaviti izvođače kao &scaron;to su Tyondai Braxton,&nbsp;Mariel Roberst, Miranda Cuckson i druge.</p>\r\n\r\n<p>Otkriven je i deo generalnog programa, a tamo su&nbsp;<strong>Deerhunter, Cate Le Bon, Gruff Rhys, The Raincoats, Makaya McCraven, DJINN, Yves Jarvis, Acid Mothers Temple</strong>,&nbsp;<strong>Surfbort&nbsp;</strong>i drugi.</p>\r\n\r\n<p>Informacije o ulaznicama, kao i o načinu kupovine, možete posetiti&nbsp;<a href="https://www.leguesswho.nl/tickets" target="_blank">zvanični festivalski sajt</a><a href="https://www.leguesswho.nl">.</a></p>\r\n\r\n<p>&lt;iframe width=&quot;100%&quot; height=&quot;315&quot; src=&quot;https://www.youtube.com/embed/CFMPibNPHNo&quot; frameborder=&quot;0&quot; allow=&quot;accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture&quot; allowfullscreen&gt;&lt;/iframe&gt;</p>\r\n\r\n<p>&nbsp;</p>', 1, 1, 1, '2019-06-09 21:16', 7, 'Deerhunter.jpg', '2019-06-01 12:00'),
(64, 'Franz Ferdinand, Edo Maajka i Goblini na OK Festu 2019', '<p><strong>OK Fest održava se na Tjenti&scaron;tu od 12. do 14. jula, a glavne zvezde biće britanski sastav Franz Ferdinand, kome će se pridružiti čitav niz eminentnih izvođača iz regiona.</strong></p>\r\n\r\n<p>Na najvećoj festivalskoj bini, prvog dana nastupaće <strong>Brkovi, Nele Karajlić</strong> i <strong>Goblini</strong>, dok će na OK bini svirati <strong>M.O.R.T.</strong> i <strong>Iskaz</strong>. Za plesne, letnje ritmove biće zadužen <strong>Mladen Tomić</strong>, dok after party donosi <strong>SevdahBaby</strong>.</p>\r\n\r\n<p><img alt="" src="../festivalac/images/" style="width:100%" /><img alt="" src="../festivalac/images/OK Fest.jpg" style="width:100%" /><img alt="" src="../images/OK Fest.jpg" style="width:100%" /></p>\r\n\r\n<p>Drugi dan na glavnoj pozornici rezervisan je za bosanske izvođače, pa će tu biti <strong>Helem Nejse, Dubioza Kolektiv</strong> i <strong>Edo Maajka</strong>, dok će <strong>Đorđe Miljenović</strong> i <strong>Bjesovi </strong>nastupati na manjoj bini. Summer stage biće u znaku <strong>Nebs Jacka</strong>, dok je za after party zadužen sastav <strong>Nipplepeople</strong>.</p>\r\n\r\n<p>Festival će na Mejn stejdžu okončati <strong>Pips, Chips &amp; Videoclips, Partibrejkers</strong> i <strong>Franz Ferdinand</strong>, najzvučnije ime čitave manifestacije, dok su na OK stejdžu <strong>Vojko V</strong> i <strong>Let 3</strong>. <strong>Space Motion</strong> biće domaćin Summer stejdža, dok posetioce na finalnoj žurci očekuje <strong>Uro&scaron; Đurić</strong>.</p>\r\n\r\n<p>Pored celodnevnog muzičkog programa festivalci će moći da uživaju u adrenalinskom raftingu najdubljim evropskim kanjonom reke Tare, a biće organizovana avanturistička &scaron;etnja planinskim stazama po obroncima Maglića i Zelengore. Posetioci će ostati zadivljeni pogledom sa vidikovaca koji se protežu preko Perućice, jedine očuvane pra&scaron;ume u Evropi, poručuju organizatori.</p>\r\n\r\n<p>Sve informacije u vezi sa cenama ulaznica i kamp mestima možete pronaći na <a href="https://www.okfest.net/#about_us" target="_blank">zvaničnom festivalskom sajtu</a><a href="https://www.okfest.net/">.</a></p>\r\n\r\n<p>&lt;iframe width=&quot;560&quot; height=&quot;315&quot; src=&quot;https://www.youtube.com/embed/crjugtkXZN4&quot; frameborder=&quot;0&quot; allow=&quot;accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture&quot; allowfullscreen&gt;&lt;/iframe&gt;</p>', 1, 1, 1, '2019-06-09T22:18', 35, 'franz_ferdinand.jpg', '2019-06-11T19:15'),
(66, 'Foo Fighters, Florence + the Machine i The National predvode zvezde ovogodišnjeg Szigeta', '<p><strong>Jedan od najvećih i najpoplarnijih muzičkih manifestacija u Evropi, Sziget festival u Budimpe&scaron;ti, 27. put otvoriće svoja vrata velikom broju posetilaca iz svih krajeva sveta koji će od 7. do 13. avgusta uživati u provodu na preko 25 bina.</strong></p>\r\n\r\n<p>Zvezda prve festivalske večeri biće <strong>Ed Sheeran</strong>, trenutno jedan od najpopularnijih muzičara nove generacije, dok je hedlajnersko mesto naredne večeri rezervisano za sastav <strong>The 1975</strong>. Holandski DJ superstar <strong>Martin Garrix</strong> sprema zapaljive plesne ritmove u petak, dok će američki bend <strong>The National</strong> u subotu biti u glavnoj ulozi. Trep zvezda <strong>Post Malone</strong> nastupaće u nedelju, dok su za sledeću noć na glavnoj bini najavljeni <strong>Florence Welch + the Machine</strong>. Za sam kraj festivala, organizatori su spremili bombastičnu svirku benda <strong>Foo Fighters</strong>.</p>\r\n\r\n<p>&lt;blockquote class=&quot;instagram-media&quot; data-instgrm-permalink=&quot;https://www.instagram.com/p/BwoewDljogf/&quot; data-instgrm-version=&quot;12&quot; style=&quot; background:#FFF; border:0; border-radius:3px; box-shadow:0 0 1px 0 rgba(0,0,0,0.5),0 1px 10px 0 rgba(0,0,0,0.15); margin: 1px; max-width:540px; min-width:326px; padding:0; width:99.375%; width:-webkit-calc(100% - 2px); width:calc(100% - 2px);&quot;&gt;&lt;div style=&quot;padding:16px;&quot;&gt; &lt;a href=&quot;https://www.instagram.com/p/BwoewDljogf/&quot; style=&quot; background:#FFFFFF; line-height:0; padding:0 0; text-align:center; text-decoration:none; width:100%;&quot; target=&quot;_blank&quot;&gt; &lt;div style=&quot; display: flex; flex-direction: row; align-items: center;&quot;&gt; &lt;div style=&quot;background-color: #F4F4F4; border-radius: 50%; flex-grow: 0; height: 40px; margin-right: 14px; width: 40px;&quot;&gt;&lt;/div&gt; &lt;div style=&quot;display: flex; flex-direction: column; flex-grow: 1; justify-content: center;&quot;&gt; &lt;div style=&quot; background-color: #F4F4F4; border-radius: 4px; flex-grow: 0; height: 14px; margin-bottom: 6px; width: 100px;&quot;&gt;&lt;/div&gt; &lt;div style=&quot; background-color: #F4F4F4; border-radius: 4px; flex-grow: 0; height: 14px; width: 60px;&quot;&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div style=&quot;padding: 19% 0;&quot;&gt;&lt;/div&gt; &lt;div style=&quot;display:block; height:50px; margin:0 auto 12px; width:50px;&quot;&gt;&lt;svg width=&quot;50px&quot; height=&quot;50px&quot; viewBox=&quot;0 0 60 60&quot; version=&quot;1.1&quot; xmlns=&quot;https://www.w3.org/2000/svg&quot; xmlns:xlink=&quot;https://www.w3.org/1999/xlink&quot;&gt;&lt;g stroke=&quot;none&quot; stroke-width=&quot;1&quot; fill=&quot;none&quot; fill-rule=&quot;evenodd&quot;&gt;&lt;g transform=&quot;translate(-511.000000, -20.000000)&quot; fill=&quot;#000000&quot;&gt;&lt;g&gt;&lt;path d=&quot;M556.869,30.41 C554.814,30.41 553.148,32.076 553.148,34.131 C553.148,36.186 554.814,37.852 556.869,37.852 C558.924,37.852 560.59,36.186 560.59,34.131 C560.59,32.076 558.924,30.41 556.869,30.41 M541,60.657 C535.114,60.657 530.342,55.887 530.342,50 C530.342,44.114 535.114,39.342 541,39.342 C546.887,39.342 551.658,44.114 551.658,50 C551.658,55.887 546.887,60.657 541,60.657 M541,33.886 C532.1,33.886 524.886,41.1 524.886,50 C524.886,58.899 532.1,66.113 541,66.113 C549.9,66.113 557.115,58.899 557.115,50 C557.115,41.1 549.9,33.886 541,33.886 M565.378,62.101 C565.244,65.022 564.756,66.606 564.346,67.663 C563.803,69.06 563.154,70.057 562.106,71.106 C561.058,72.155 560.06,72.803 558.662,73.347 C557.607,73.757 556.021,74.244 553.102,74.378 C549.944,74.521 548.997,74.552 541,74.552 C533.003,74.552 532.056,74.521 528.898,74.378 C525.979,74.244 524.393,73.757 523.338,73.347 C521.94,72.803 520.942,72.155 519.894,71.106 C518.846,70.057 518.197,69.06 517.654,67.663 C517.244,66.606 516.755,65.022 516.623,62.101 C516.479,58.943 516.448,57.996 516.448,50 C516.448,42.003 516.479,41.056 516.623,37.899 C516.755,34.978 517.244,33.391 517.654,32.338 C518.197,30.938 518.846,29.942 519.894,28.894 C520.942,27.846 521.94,27.196 523.338,26.654 C524.393,26.244 525.979,25.756 528.898,25.623 C532.057,25.479 533.004,25.448 541,25.448 C548.997,25.448 549.943,25.479 553.102,25.623 C556.021,25.756 557.607,26.244 558.662,26.654 C560.06,27.196 561.058,27.846 562.106,28.894 C563.154,29.942 563.803,30.938 564.346,32.338 C564.756,33.391 565.244,34.978 565.378,37.899 C565.522,41.056 565.552,42.003 565.552,50 C565.552,57.996 565.522,58.943 565.378,62.101 M570.82,37.631 C570.674,34.438 570.167,32.258 569.425,30.349 C568.659,28.377 567.633,26.702 565.965,25.035 C564.297,23.368 562.623,22.342 560.652,21.575 C558.743,20.834 556.562,20.326 553.369,20.18 C550.169,20.033 549.148,20 541,20 C532.853,20 531.831,20.033 528.631,20.18 C525.438,20.326 523.257,20.834 521.349,21.575 C519.376,22.342 517.703,23.368 516.035,25.035 C514.368,26.702 513.342,28.377 512.574,30.349 C511.834,32.258 511.326,34.438 511.181,37.631 C511.035,40.831 511,41.851 511,50 C511,58.147 511.035,59.17 511.181,62.369 C511.326,65.562 511.834,67.743 512.574,69.651 C513.342,71.625 514.368,73.296 516.035,74.965 C517.703,76.634 519.376,77.658 521.349,78.425 C523.257,79.167 525.438,79.673 528.631,79.82 C531.831,79.965 532.853,80.001 541,80.001 C549.148,80.001 550.169,79.965 553.369,79.82 C556.562,79.673 558.743,79.167 560.652,78.425 C562.623,77.658 564.297,76.634 565.965,74.965 C567.633,73.296 568.659,71.625 569.425,69.651 C570.167,67.743 570.674,65.562 570.82,62.369 C570.966,59.17 571,58.147 571,50 C571,41.851 570.966,40.831 570.82,37.631&quot;&gt;&lt;/path&gt;&lt;/g&gt;&lt;/g&gt;&lt;/g&gt;&lt;/svg&gt;&lt;/div&gt;&lt;div style=&quot;padding-top: 8px;&quot;&gt; &lt;div style=&quot; color:#3897f0; font-family:Arial,sans-serif; font-size:14px; font-style:normal; font-weight:550; line-height:18px;&quot;&gt; Погледајте ову објаву у апликацији Instagram&lt;/div&gt;&lt;/div&gt;&lt;div style=&quot;padding: 12.5% 0;&quot;&gt;&lt;/div&gt; &lt;div style=&quot;display: flex; flex-direction: row; margin-bottom: 14px; align-items: center;&quot;&gt;&lt;div&gt; &lt;div style=&quot;background-color: #F4F4F4; border-radius: 50%; height: 12.5px; width: 12.5px; transform: translateX(0px) translateY(7px);&quot;&gt;&lt;/div&gt; &lt;div style=&quot;background-color: #F4F4F4; height: 12.5px; transform: rotate(-45deg) translateX(3px) translateY(1px); width: 12.5px; flex-grow: 0; margin-right: 14px; margin-left: 2px;&quot;&gt;&lt;/div&gt; &lt;div style=&quot;background-color: #F4F4F4; border-radius: 50%; height: 12.5px; width: 12.5px; transform: translateX(9px) translateY(-18px);&quot;&gt;&lt;/div&gt;&lt;/div&gt;&lt;div style=&quot;margin-left: 8px;&quot;&gt; &lt;div style=&quot; background-color: #F4F4F4; border-radius: 50%; flex-grow: 0; height: 20px; width: 20px;&quot;&gt;&lt;/div&gt; &lt;div style=&quot; width: 0; height: 0; border-top: 2px solid transparent; border-left: 6px solid #f4f4f4; border-bottom: 2px solid transparent; transform: translateX(16px) translateY(-4px) rotate(30deg)&quot;&gt;&lt;/div&gt;&lt;/div&gt;&lt;div style=&quot;margin-left: auto;&quot;&gt; &lt;div style=&quot; width: 0px; border-top: 8px solid #F4F4F4; border-right: 8px solid transparent; transform: translateY(16px);&quot;&gt;&lt;/div&gt; &lt;div style=&quot; background-color: #F4F4F4; flex-grow: 0; height: 12px; width: 16px; transform: translateY(-4px);&quot;&gt;&lt;/div&gt; &lt;div style=&quot; width: 0; height: 0; border-top: 8px solid #F4F4F4; border-left: 8px solid transparent; transform: translateY(-4px) translateX(8px);&quot;&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt; &lt;div style=&quot;display: flex; flex-direction: column; flex-grow: 1; justify-content: center; margin-bottom: 24px;&quot;&gt; &lt;div style=&quot; background-color: #F4F4F4; border-radius: 4px; flex-grow: 0; height: 14px; margin-bottom: 6px; width: 224px;&quot;&gt;&lt;/div&gt; &lt;div style=&quot; background-color: #F4F4F4; border-radius: 4px; flex-grow: 0; height: 14px; width: 144px;&quot;&gt;&lt;/div&gt;&lt;/div&gt;&lt;/a&gt;&lt;p style=&quot; color:#c9c8cd; font-family:Arial,sans-serif; font-size:14px; line-height:17px; margin-bottom:0; margin-top:8px; overflow:hidden; padding:8px 0 7px; text-align:center; text-overflow:ellipsis; white-space:nowrap;&quot;&gt;&lt;a href=&quot;https://www.instagram.com/p/BwoewDljogf/&quot; style=&quot; color:#c9c8cd; font-family:Arial,sans-serif; font-size:14px; font-style:normal; font-weight:normal; line-height:17px; text-decoration:none;&quot; target=&quot;_blank&quot;&gt;Објава коју дели Sziget Festival (@szigetofficial)&lt;/a&gt; дана &lt;time style=&quot; font-family:Arial,sans-serif; font-size:14px; line-height:17px;&quot; datetime=&quot;2019-04-24T09:01:29+00:00&quot;&gt;24. Апр 2019. у 2:01 PDT&lt;/time&gt;&lt;/p&gt;&lt;/div&gt;&lt;/blockquote&gt; &lt;script async src=&quot;//www.instagram.com/embed.js&quot;&gt;&lt;/script&gt;</p>\r\n\r\n<p>Pored njih, na najvećoj festivalskoj bini tokom sedam dana smenjivaće se jo&scaron; <strong>Michael Kiwanuka, Twenty One Pilots, Richard Ashcroft, Years &amp; Years, Macklemore, Franz Ferdinand, Jain, Tove Lo, Mura Masa, Frank Carter &amp; the Rattlesnakes, Big Thief, Johnny Marr, Catfish and the Bottleman, Honne, Tom Odell</strong> i drugi.</p>\r\n\r\n<p>Druga po veličini<strong>, A38 bina</strong>, biće domaćin imenima kao &scaron;to su <strong>Razorlight, Chrvches, James Blake, Gang of Youths, Broken Social Scene, Jungle, Idles, Black Mountain, Khruangbin, Frank Turner &amp; the Sleeping Souls, Of Mice &amp; Men, Xavier Rudd, Coheed and Cambria, Maribou State, Parcels</strong> i ostalima.</p>\r\n\r\n<p>Manje pozornice poput <strong>Europa stage, Petőfi Radio &ndash; Telekom Volt</strong> i <strong>Music Box</strong> nude, takođe, zanimljive nastupe, kao &scaron;to su <strong>Algiers, Jungle By Night, Whispering Sons, Phum Viphurit, The Inspector Cluzo, Rayland Baxter</strong>, a tu su svetski priznati i poznati di-džejevi koji će se smenjivati na <strong>Bacardi Areni</strong> i <strong>Colosseumu</strong>.</p>\r\n\r\n<p>Pored muzičkih, ono &scaron;to mami stotine hiljada festivalaca da se svakog leta sjate u prestonicu Mađarske, jesu umetničke instalacije, cirkuske i pozori&scaron;ne predstave, stand-up comedy nastupi i mnoge druge aktivnosti zbog kojih Sziget ima takvu reputaciju.</p>\r\n\r\n<p>Kada su cene karata u pitanju, možete se informisati na zvaničnom <a href="https://szigetfestival.com/en/tickets" target="_blank">festivalskom sajtu</a></p>\r\n\r\n<p><iframe frameborder="0" height="315" src="https://www.youtube.com/embed/5cn6dKy1rIc" width="560"></iframe></p>', 1, 1, 1, '2019-06-10T15:43', 49, 'foo fighters.jpg', '2019-06-15T14:45'),
(67, 'NOFX i Descendents dolaze na Punk Rock Holiday 2019', '<p><strong>Poznat je kompletan line-up slovenačkog Punk Rock Holiday festivala koji se ove godine održava od 5. do 9. avgusta u Tolminu. Najveće zvezde su bendovi iz Kalifornije, NOFX i Descendents, odnosno kanadski sastav Propagandhi.</strong></p>\r\n\r\n<p>Pored pomenutih bendova, spisak učesnika uključuje i izvođače kao &scaron;to su <strong>Less Than Jake, Pennywise, Frank Turner, Sick Of It All, Good Riddance, Ignite, Pulley, Pup, Iron Reagan, Teenage Bottlerocket, Booze &amp; Glory </strong>i mnoge druge.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><iframe frameborder="0" height="320" src="https://www.youtube.com/embed/yOfvPNaNEMA" width="100%"></iframe></p>\r\n\r\n<p>Tokom pet dana u Sloveniji smenjivaće se i niz regionalnih bendova poput Fakofbolan, One Step Away, The Mor(r)ons i mnogi drugi.</p>\r\n\r\n<p>Kompletnu listu učesnika, kao i satnicu možete pogledati na sledećem<a href="https://www.punkrockholiday.com/" target="_blank"> linku</a><a href="https://www.punkrockholiday.com/Line_up">.</a></p>\r\n\r\n<p>Kada je reč o ulaznicama i kamperskim mestima, možete se informisati na <a href="http://www.punkrockholiday.com/p42/festival-info">zvaničnom festivalskom sajtu</a><a href="https://www.punkrockholiday.com/" target="_blank">.</a></p>', 1, 15, 1, '2019-06-11', 4, 'Punk Rock Holiday.jpg', '2019-06-11'),
(68, 'Richie Hawtin, Joris Voorn i mnogi drugi na ovogodišnjem Lovefestu', '<p><strong>Novo izdanje Lovefesta na programu je od 1. do 3. avgusta u Vrnjačkoj Banji, a line-up je kombinacija izvođača elektronske muzike, bendova i predstavnika nove trep generacije.</strong></p>\r\n\r\n<p>Među najpopularnijim imenima koji će ove godine nastupati na Fire stejdžu biće <strong>Guy Gerber, Richie Hawtin, Jamie Jones, Jooris Vorn, Marco Carola</strong> i drugi.</p>\r\n\r\n<p>Energy bina ugostiće di-džejeve kao &scaron;to su <strong>Ben UFO, Seth Troxler, Joe Claussell, Boo Williams</strong> i drugi, dok će na H2O i 99 stejdževima biti neki od najpopularnijih regionalnih producenata elektronske muzike.</p>\r\n\r\n<p><iframe frameborder="0" height="335" src="https://www.youtube.com/embed/2iyI0dJ1ppw" width="100%"></iframe></p>\r\n\r\n<p>Kada je u pitanju Live pozornica tamo će nastupati <strong>Bajaga i Instruktori, Bojana Vunturi&scaron;ević, Fox, Dubioza Kolektiv, Senidah, Maika, Surreal, Kljuk$, Hazze, Elon</strong> i <strong>Viva Vops</strong>.</p>\r\n\r\n<p>Sve informacije u vezi sa cenama karata i sme&scaron;tajnim kapacitetima možete pronaći na <a href="https://lovefest.rs/" target="_blank">zvaničnom festivalskom sajtu. &nbsp;</a></p>', 1, 1, 1, '2019-06-13T16:07:26', 6, 'Lovefest 2019.jpg', '2019-06-13T16:07:26'),
(75, 'Regionalna muzička elita na Ferragosto Jam 2019', '<p><strong><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif">Dvanaesto izdanje Ferragosto Jam festivala biće održano od 1. do 5. avgusta na Orahovačkom jezeru i okupiće veliki broj nekih od najvećih muzičkih imena u regionu.</span></span></strong></p>\r\n\r\n<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif">Najveće zvezde biće neponovljiva <strong>Josipa Lisac</strong>, zatim <strong>Urban &amp; 4, Partibrejkers, Goran Bare i Majke</strong>, odnosno reperske superstarovi <strong>Edo Maajka</strong> i <strong>Vojko V</strong>.</span></span></p>\r\n\r\n<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif">Pored njih nastupaće <strong>Letu &scaron;tuke, Kries, Porto Morto, Brkovi, Nipplepeople, Them Moose Rush, Rezerve, Krank&scaron;vester</strong> i mnogi drugi.</span></span></p>\r\n\r\n<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif">Kompletan spisak učesnika, kao i informacije u vezi sa paketima ulaznica možete pronaći na <a href="http://ferragostojam.com/" style="color:#0563c1; text-decoration:underline" target="_blank">zvaničnom festivalskom sajtu</a>.</span></span></p>\r\n\r\n<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif">Kako je bilo pro&scaron;le godine, pogledajte u nastavku.</span></span></p>\r\n\r\n<p><iframe frameborder="0" height="315" src="https://www.youtube.com/embed/0u8LH-3v-aI" width="560"></iframe></p>', 1, 1, 1, '2019-06-22T15:33', 3, 'Ferragosto Jam.jpg', '2019-06-22T15:33'),
(76, 'Predstavljen konačan line-up Southern Soul Festivala 2019', '<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif">Sedmo izdanje <strong>Southern Soul Festivala</strong> biće održano od 26. juna do 1. jula na Velikoj plaži u Ulcinju. I ove godine organizatori su spremili sjajan spoj soula, džeza, fanka sa nekim od najprominentnijih di-džejeva dana&scaron;njice.</span></span></p>\r\n\r\n<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif">Među bendovima koji će nastupati nalaze se gosti iz Brazila, <strong>Airto Moreira &amp; Group with Flora Purim</strong>, zatim <strong>The Mauskovic Dance Band</strong> iz Amsterdama, <strong>Nu Guinea Live Band</strong> iz Napulja, te londonski sastav <strong>Nubiyan Twist</strong>. Tu su jo&scaron; i <strong>Josh Millan &amp; Band, EABS, Jan Kinčl &amp; Regis Katte</strong>, kao i <strong>Mayer&rsquo;s Indo-Jazz Fusion Band</strong>. </span></span></p>\r\n\r\n<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif">Među poznatim DJ imenima izdvajaju se Helena Guedes, Patrice Scott, Jake Holloway, Kornelia Binicewicz, Giovanni Damico i brojni drugi koji će početkom leta nastupati u Crnoj Gori. &nbsp;</span></span></p>\r\n\r\n<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif">Kompletan line-up, kao i informacije u vezi sa ulaznicama možete pronaći na <a href="https://www.southernsoulfestival.me/" style="color:#0563c1; text-decoration:underline" target="_blank">zvaničnom festivalskom sajtu</a>. </span></span></p>\r\n\r\n<p><iframe frameborder="0" height="315" src="https://www.youtube.com/embed/BG6oGImEuo4" width="560"></iframe></p>', 1, 1, 1, '2019-06-22', 4, 'nubiyan_twist.jpg', '2019-06-22T15:45');
INSERT INTO `vest` (`sifra`, `naslov`, `tekst`, `kategorija`, `autor`, `status`, `vreme`, `klik`, `slika`, `vreme_objave`) VALUES
(77, 'Objavljen konačan program za Wrong Fest 2019', '<p><strong><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif">Premijerno izdanje Wrong Festa u Pančevu biće održano od 19. do 21. jula na tri festivalske pozornice &scaron;irom grada. </span></span></strong></p>\r\n\r\n<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif">Festival će ugostiti niz potpuno žanrovski različitih bendova, a među najzvučnijim imenima su <strong>Dope D.O.D., God is an Astronaut, Dog Eat Dog, Delinquent Habits, The Underground Youth, The Black Swells, Bitipatibi, Deez Nuts, Ritam nereda</strong> i mnogi drugi. Specijalni performans upriličiće ni&scaron;ki <strong>EYOT</strong>, džez sastav koji stiče simpatije &scaron;irom sveta.</span></span></p>\r\n\r\n<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif">Ono &scaron;to izdvaja Wrong Fest osim zanimljive liste izvođača jeste i postavka mesta izvođenja koncerata na tri bine u tri različita kraja grada: <strong>Muzej, Reka (Wrong Stage)</strong> i <strong>Glavni (Right Stage)</strong>. Festival će po prvi put biti održan u Pančevu a do sada je kroz &scaron;est izdanja održavan u Bugarskoj.&nbsp; </span></span></p>\r\n\r\n<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif">Kompletan raspored nastupa, kao i informacije u vezi sa cenama ulaznica možete pronaći na <a href="http://www.wrong-fest.com/" style="color:#0563c1; text-decoration:underline" target="_blank">zvaničnom festivalskom sajtu</a>. </span></span></p>\r\n\r\n<p><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif">&lt;iframe width=&quot;560&quot; height=&quot;315&quot; src=&quot;https://www.youtube.com/embed/24dBEuglzxQ&quot; frameborder=&quot;0&quot; allow=&quot;accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture&quot; allowfullscreen&gt;&lt;/iframe&gt;</span></span></p>', 1, 1, 1, '2019-06-22', 2, 'Wrong Fest 2019.png', '2019-06-22T16:45'),
(79, 'Shilpa Ray premijerno u Srbiji', '<p><strong>Američka kantautorka čiji se muzički stil može opisati kao bluz pank na koji nije ostao imun ni veliki Nik Kejv (koji ju je poveo na evropsku turneju),&nbsp;&Scaron;ilpa Rej&nbsp;(Shilpa Ray)&nbsp;održaće koncert u Srbiji u&nbsp;sredu, 24. jula&nbsp;2019. godine u&nbsp;Firchie Think Tank Studiju&nbsp;u Novom Sadu u organizaciji koncertne agencije&nbsp;Rock Svirke&nbsp;sa početkom u 21 čas, odnosno dan kasnije,&nbsp;25. jula&nbsp;u&nbsp;Jazz kantini Lisabon&nbsp;u Beogradu.</strong></p>\r\n\r\n<p>&Scaron;ilpa Rej je američka kantautorka čiji se muzički stil može opisati kao bluz pank. Upravo ovaj stil porede sa izvođačima kao &scaron;to su Blondie, The Cramps i Screamin&rsquo; Jay Hawkins, dok njen vokal upoređuju sa&nbsp;Pati Smit (Patti Smith), Nikom Kejvom (Nick Cave) i Elom Ficdžerald (Ella Fitzgerald). Njen prvi projekat pod pseudonimom Beat the Devil objavljen je 2006. godine, ali je bend ubrzo raspu&scaron;ten nakon prvog i jedinog izdanja.</p>\r\n\r\n<p>Nakon toga, &Scaron;ilpa Rej je nastavila solo karijeru zajedno sa pratećim bendom Her Happy Hookers. Debi album novoformirane grupe&nbsp;<em>A Fish Hook An Open Eye</em>&nbsp;objavljen je 2009. godine, a jedan od producenata bio je i Džej Braun (Jay). Usledio je 7&rsquo;&rsquo; singl&nbsp;<em>Venus Shaver/Natural Selection</em>&nbsp;&scaron;to je prvo izdanje za Knitting Factory Records. Naredni dugosvirajući album sa bendom Her Happy Hookers&nbsp;<em>Teenage and Torture</em>&nbsp;u januaru 2011. je ugledao svetlost dana. Ova ploča omogućila je muzičarki iz Bruklina evropsku turneju sa Nikom Kejvom (Nick Cave), kao i objavljivanje EP izdanja za njegovu etiketu Bad Seed LTD.</p>\r\n\r\n<p>Kejv je 2013. godine objavio njen EP&nbsp;<em>It&rsquo;s All Self Fellatio, Shilpa Ray</em>&nbsp;nakon raspu&scaron;tanja Her Happy Hookers i turneja gde je &Scaron;ilpa nastupala sa Nick Cave and the Bad Seeds i Grinderman. Pored ovoga, njen bend je otvarao koncerte za Sharon Van Etten, Jon Spencer Blues Explosion i Nicole Atkins.</p>\r\n\r\n<p>Zatim, &Scaron;ilpa prelazi u Northern Spy Records za koje prvo objavljuje EP&nbsp;<em>Make Up/What a Diffrence a Day Makes</em>&nbsp;na kojem se nalaze obrade pesama&nbsp;Lu Rida&nbsp;(Lou Reed) i Dine Vo&scaron;ington (Dinah Washington), odnosno LP ploču&nbsp;<em>Last Year&rsquo;s Savage</em>. Naredni album&nbsp;<strong><em>Door Girl</em></strong>&nbsp;je objavila 2017. godine.</p>\r\n\r\n<p>Njeno aktuelno EP izdanje&nbsp;<strong><em>Nihilism</em></strong>&nbsp;objavljeno je sredinom maja pro&scaron;le godine. Inspirisana i napisana nakon gledanja Long Strange Trip, dokumentarne serije o bendu&nbsp;Grateful Dead, pesma&nbsp;<em>&bdquo;Shoot This Dying Horse&rdquo;</em>&nbsp;je valcer po ki&scaron;nom danu koja govori o tome kako se lo&scaron;e stvari mogu desiti bilo kome, u bilo koje vreme na najrazličitije i najbeznačajnije načine. Jo&scaron; direktinije, to je priča o tome kako si ostavljen u baru dva dana pre Božića.</p>\r\n\r\n<p>Dodatno, &Scaron;ilpa se odlučila na obradu pesme&nbsp;<em>&bdquo;Is It My Body&ldquo;</em>&nbsp;koju u originalu izvodi&nbsp;Alis Kuper&nbsp;(Alice Cooper). Ova pesma se u velikoj meri vrtela u kombiju tokom turneje na kojoj su promovisali&nbsp;<em>Door Girl</em>. Ona obja&scaron;njava: &bdquo;Kada sam podrobnije obratila pažnju na stihove pesme, shvatila sam da kad bi je otpevala žena, to bi mogla biti feministička himna. Ko bi rekao da je Alice Cooper pisao feminističke pesme?&ldquo;</p>\r\n\r\n<p><strong>Ulaznice za Novi Sad na prodajnim mestima Ticketvision-a, GIGS TIX-a i DD Tickets-a:</strong></p>\r\n\r\n<p>1000 RSD &ndash; promo (ograničen kontigent do 24. juna)<br />\r\n1200 RSD &ndash; pretprodajna cena (od 24. juna do 23. jula)<br />\r\n1500 RSD &ndash; na dan koncerta (24. jula)</p>\r\n\r\n<p><strong>Ulaznice za Beograd na prodajnim mestima blagajna Kombank dvorane, Ticketvision-a, GIGS TIX-a, DD Tickets-a, FELIX Shopa (TC Sremska, Beograd) i LOW &ndash; Alternative Bar (Tadeu&scaron;a Ko&scaron;ću&scaron;ka 28):</strong></p>\r\n\r\n<p>1200 RSD &ndash; promo (ograničen kontigent do 24. juna)<br />\r\n1500 RSD &ndash; pretprodajna cena (od 24. juna do 24. jula)<br />\r\n1800 RSD &ndash; na dan koncerta (25. jula)</p>\r\n\r\n<p>&lt;iframe width=&quot;560&quot; height=&quot;315&quot; src=&quot;https://www.youtube.com/embed/7eooBoAnSwQ&quot; frameborder=&quot;0&quot; allow=&quot;accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture&quot; allowfullscreen&gt;&lt;/iframe&gt;</p>\r\n\r\n<p>&nbsp;</p>', 8, 1, 1, '2019-06-22', 1, 'shilpa_ray.jpeg', '2019-06-22'),
(80, 'Dead Can Dance u Beogradu', '<p><strong>Neprevaziđeni svetski ambijent i world music projekat i grupa koja je uobličila muzički ukus generacija, Dead Can Dance&nbsp;nastupiće u Sava Centru, 28.juna 2019.godine!</strong></p>\r\n\r\n<p><strong>Lisa Gerrard</strong> i <strong>Brendan Perry</strong>&nbsp;preneće publici deo svoje magije koju zajedno stvaraju skoro četiri decenije! Od kada su započeli svoj zajednički put naziralo se da nikada nisu bili &ldquo;samo&rdquo; bend i nikada svoju muziku nisu ograničavali žanrovima ni pravilima-eksperimentisali su, otkrivali nove zvukove, istraživali različite kulture i epohe, pričali neispričane priče ljudskog duha, &scaron;etali se po muzičkim žanrovima i sklapali ih u jednu predivnu i smislenu celinu. Dead Can Dance&nbsp;ne stvaraju muziku, oni stvaraju magiju čiji je važan &bdquo;sastojak&ldquo; glas izuzetne Lise Gerrard, nesumnjivo jedne od najboljih svetskih vokala.&nbsp;<br />\r\nDo sada su izdali su devet studijskih i tri live albuma, imali nekoliko uspe&scaron;nih svetskih turneja, komponovali muziku za brojne&nbsp;filmove od kojih je verovatno najpoznatija njihova &bdquo;uloga&ldquo; u <em>Gladijatoru</em>.<br />\r\n&Scaron;est godina nakon poslednjeg studijskog izdanja albuma &quot;Anastasis&quot;, ovaj australijsko-britanski duo objavio je ploču <strong>&quot;Dionysus&quot;</strong>&nbsp; pa će tako publici u Sava Centru predstaviti nove pesme!&nbsp;Ovaj album u prvi plan stavlja obrede i rituale Dionisovog kulta koji su uprkos vi&scaron;evekovnom potiskivanju od strane Hri&scaron;ćanstva i Islama, opstali prvenstveno zahvaljujući ovim festivalima. Najavljen je vrhunskim video ostvarenjem za numeru &bdquo;The Mountain&ldquo; a početkom aprila objavili su jo&scaron; jedan video &bdquo;ACT II &ndash; The Invocation&ldquo;.</p>\r\n\r\n<p>Prodaja ulaznica na blagajni Sava Centra i prodajnim mestima Eventima, kao i online na&nbsp;<a href="http://www.eventim.rs/" rel="noopener noreferrer" target="_blank">www.eventim.rs</a></p>\r\n\r\n<p><iframe frameborder="0" height="315" src="https://www.youtube.com/embed/wjm5o0ZxLyg" width="560"></iframe></p>', 8, 1, 1, '2019-06-23T17:45', 0, 'Dead Can Dance.jpg', '2019-06-23T17:45'),
(81, 'Sastav Garbage ponovo u Beogradu', '<p><strong>Američki rok bend Garbage&nbsp;održaće 28. juna koncert na Bazenima &quot;11. april&quot; na Novom Beogradu.</strong></p>\r\n\r\n<p>Garbage je projekat muzičara i producenta&nbsp;Bača Viga (Butch Vig)<strong>,</strong>&nbsp;Djuka Eriksona (Duke Erikson) i Stiva Markera (Steve Marker) koji su jo&scaron; 1993. počeli raditi na zajedničkim pesmama, dok im se &Scaron;irli Menson&nbsp;(Shirley Manson)&nbsp;priključila 1994. godine nakon turneje sa svojim dotada&scaron;njim bendom.&nbsp;Garbage su 1995. godine počeli objavljivati singlove sa prvog istoimenog albuma, a pesme &ldquo;<strong>Stupid Girl</strong>&rdquo; i &ldquo;<strong>Only Happy When It Rains</strong>&rdquo; osvojile su svetske top liste te osigurale njihovom prvom albumu visoke pozicije na top listama i prve nominacije za čitav niz muzičkih nagrada, između ostalog i tri Grammy nominacije.</p>\r\n\r\n<p>Drugi album &ldquo;<strong>Version 2.0</strong>&rdquo;&nbsp;nastavio je sa osvajanjem top lista, krunisan je sa dve Grammy nominacije te progla&scaron;en jednim od najboljih albuma 1999. godine po sudu kritike. Garbage su radili i na soundtracku za 19. film o Jamesu Bondu te su objavili naslovnu pesmu &ldquo;<strong>The World Is Not Enough</strong>&rdquo; koja je postigla veliki svetski uspeh i&nbsp;bila je jedna od najprodavanijih singlova te&nbsp;godine. Svoj treći studijski album &ldquo;<strong>Beautiful Garbage</strong>&rdquo; objavili su 2001. godine, a nakon objave albuma &ldquo;<strong>Bleed Like Me</strong>&rdquo; 2005. godine bend je najavio kako se razilaze na neko&nbsp;vreme, no već 2007. godine uspe&scaron;na četvorka vratila se na scenu kompilacijom &ldquo;<strong>Absolute Garbage</strong>&ldquo;. Službeno su se ponovno okupili 2011. godine te su godinu kasnije objavili album &ldquo;<strong>Not Your Kind of People</strong>&ldquo;, a 2016. godine objavljuju <strong>&ldquo;Strange Little Birds&rdquo;</strong>. Kako su najavili, Garbage će ove godine objaviti sedmi studijski album.</p>\r\n\r\n<p>Kao predgrupa, nastupiće sastav <strong>Autopark</strong>, koga predvodi Ognjenka Lakićević, a u bendu su jo&scaron; i&nbsp;Nikola Berček, Miroslav Cakić, Srđan Popov&nbsp;i Lav Bratu&scaron;a.&nbsp;Smatraju ih predstavnicima &scaron;ugejz i dreampop pravca alternativne muzike. Njihov zvuk mogao bi da se opi&scaron;e kao spoj gitarske buke i pop melodije, natopljen uticajima američkih i engleskih bendova sa kraja osamdesetih i početka devedesetih godina pro&scaron;log veka. Muziku Autoparka čine promi&scaron;ljene i autentične gitarske vinjete, melanholične harmonije, kao i istovremena ranjivost i glasni stav žene koja preispituje koncept sveta, života, pravde, kao i ljubav, gubitke, razočaranja, ljutnju i tugu, ali prvenstveno i najvi&scaron;e samu sebe.</p>\r\n\r\n<p>Ulaznice su u prodaji putem Ticketvision-a i online na<a href="https://www.tickets.rs/program/garbage-792/4289" target="_blank">&nbsp;www.tickets.rs</a>.</p>\r\n\r\n<p><iframe frameborder="0" height="315" src="https://www.youtube.com/embed/ypr18UmxOas" width="560"></iframe></p>', 8, 1, 1, '2019-06-23T17:46', 0, 'Garbage.jpg', '2019-06-23T17:46'),
(82, 'Nneka i RY X glavne zvezde somborskog Terminala', '<p><strong>Terminal Music &amp; Arts Festival održaće se 28. i 29. juna u Somboru, a najzvučnija imena su soul, hip-hop<br />\r\ni reggae propovednica Nneka i kalifornijski kantautor RY X.</strong></p>\r\n\r\n<p><br />\r\nPrve festivalske večeri, pored zvezde iz Los Anđelesa nastupiće i beogradski &bdquo;tehno&ldquo; projekat <strong>Tapan</strong>,<br />\r\nizraelski muzičar <strong>Nadav Dagon</strong> i <strong>Glauco di Mambro</strong>, klasični pijanista koji je krenuo na muzičko<br />\r\nputovanje kroz svet organske i elektronske muzike.</p>\r\n\r\n<p><br />\r\nNaredna noć rezervisana je za <strong>Nneku</strong>, ali i belgijsko-francuski trio <strong>Nikitch &amp;&nbsp;Kuna Maze ft. Raph Stark</strong>, a<br />\r\npublici će se predstaviti i australijski dj i producent <strong>UONE</strong>, kao i njegov kolega iz Austrije, <strong>Megablast</strong>.</p>\r\n\r\n<p><br />\r\nUlaznice ko&scaron;taju u rasponu od 1300 do 2500 dinara, a za vi&scaron;e informacija posetite <a href="http://www.terminalfest.org/" target="_blank">zvanični festivalski sajt</a>.</p>\r\n\r\n<p><iframe frameborder="0" height="315" src="https://www.youtube.com/embed/uhTa48nd-jY" width="560"></iframe></p>', 1, 1, 1, '2019-06-23T17:47', 1, 'terminal.jpg', '2019-06-23T17:47'),
(83, 'Svemirko, Who See, Buč Kesidi i drugi dolaze na Outhide Festival 2019', '<p><strong>Četvrti po redu festival muzike i umetnosti &ndash; Outhide, održaće se 26. i 27. jula u Zaječaru u Park-&scaron;umi<br />\r\nKraljevica, a među najzvučnijim objavljenim učesnicima su regionalna plesna atrakcija Svemirko,<br />\r\ncrnogorski rep duo Who See, odnosno pančevački sastav Buč Kesidi.</strong></p>\r\n\r\n<p><br />\r\nPored njih, tokom dva dana na tri festivalske bine (Alt, Thsaheylu i Zalet) nastupaće <strong>Minilinija, Kristijan Molnar, Dimitrije Dimitrijević, Kablovi (MKDSL i Peđa Milutinović), Josip A Lisac, Coeus, Felver, Killo Killo, I Bee &amp; Taz, Infamous (I.R.S.) &amp; Naopak, Monosaccharide</strong> i drugi.</p>\r\n\r\n<p><br />\r\nSama tematika ovogodi&scaron;njeg izdanja festivala je &ndash; misticizam istočne Srbije. Pravo osveženje biće i dečji<br />\r\nprogram za roditelje i najmađe posetioce. Outhide Festić je nastao u saradnji sa Dečijim Centrom i<br />\r\ndrugim organizacijama i pojedincima koji svoju kreativnu energiju dele sa najmlađima. Neće izostati ni<br />\r\ngraffiti zona u skladu sa dugogodi&scaron;njom grafiterskom tradicijom Zaječara, kao ni gastronomska<br />\r\nmanifestacija za hedoniste.</p>\r\n\r\n<p><br />\r\nOno &scaron;to organizatori posebno nagla&scaron;avaju je da je za posetioce i ove godine obezbeđen besplatan kamp<br />\r\nmeđu četinarima na Kraljevici. Za informacije u vezi sa ulaznicama možete posetiti <a href="http://www.outhidefestival.com/" target="_blank">zvanični festivalski<br />\r\nsajt</a>.</p>\r\n\r\n<p>&lt;iframe width=&quot;560&quot; height=&quot;315&quot; src=&quot;https://www.youtube.com/embed/anidC6e9tJE&quot; frameborder=&quot;0&quot; allow=&quot;accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture&quot; allowfullscreen&gt;&lt;/iframe&gt;</p>', 1, 1, 1, '2019-06-23T17:49', 10, 'Outhide Festival.jpg', '2019-06-23T17:49'),
(85, 'Johnny Marr dolazi na Belgrade Beer Fest 2019', '<p><strong>Slavni gitarista i nekada&scaron;nji član benda&nbsp;The Smiths,&nbsp;Johnny Marr, novo je pojačanje muzičkog programa ovogodi&scaron;njeg&nbsp;Belgrade Beer Festa.</strong></p>\r\n\r\n<p>U svojoj bogatoj karijeri&nbsp;Marr je sarađivao sa najvećim svetskim muzičkim imenima poput benda&nbsp;Oasis&nbsp;ili&nbsp;Brajana Ferija, a njegovi snažni gitarski rifovi zaslužni su za proboj The Smithsa na svetskoj sceni.&nbsp;</p>\r\n\r\n<p>Nako izlaska iz grupe The Smiths 1987. godine nastavio je raditi sa brojnim kolegama, između ostalog i sa grupom Talking Heads, te je par godina kasnije s Bernardom Samnerom&nbsp; iz grupe New Order i Nilom Tenantom&nbsp;iz sastava Pet Shop Boys oformio alternativnu supergrupu Electronic.</p>\r\n\r\n<p>Nekoliko godina je bio ispod radara, objavio je album&nbsp;<em>Boomslang</em>&nbsp;2003. godine sa grupom The Healers na kojem prvi put peva te je sarađivao sa brojnim bendovima poput The The. Na albumu Modest Mousea je gostovao 2007. godine, a s njima je bio i na turneji kao punopravni član. Nakon projekta s Modest Mouse nastupao je i sa bendom The Cribs, a zatim se napokon odlučio na solo karijeru te je 2013. godine objavio album&nbsp;<em>The Messenger</em>.&nbsp;</p>\r\n\r\n<p><em>Playland</em>&nbsp;je usledio godinu kasnije, a&nbsp;<em>Call the Comet</em>&nbsp;je objavio pro&scaron;le godine. Brojni fanovi dobiće priliku da vide&nbsp;Marra na prvom&nbsp;nastupu u Srbiji na kojem će odsvirati presek hitova iz svoje bogate karijere, a publici će predstaviti i nove pesme.</p>\r\n\r\n<p>Marr se pridružuje već najavljenim učesnicima kao &scaron;to su Eyesburn, Atheist Rap, Vojko V, Negative i drugi.&nbsp;</p>\r\n\r\n<p>&lt;iframe width=&quot;560&quot; height=&quot;315&quot; src=&quot;https://www.youtube.com/embed/ihcf8-pXUp8&quot; frameborder=&quot;0&quot; allow=&quot;accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture&quot; allowfullscreen&gt;&lt;/iframe&gt;</p>', 1, 1, 1, '2019-06-23T18:02', 8, 'Johnny Marr.jpg', '2019-06-23T18:02'),
(86, 'Apgrade Festival 2019 kompletirao line-up', '<p><strong>Novo izdanje Apgrade festivala koje se ove godine održava od 12. do 15. septembra u Luci Beograd<br />\r\npredvode najtraženiji svetski hedlajneri - Tale Of Us, Laurent Garnier, David August, Mathew Jonson i<br />\r\nHelena Hauff.</strong></p>\r\n\r\n<p><br />\r\nNakon četiri izdanja u istorijskom ambijentu Beogradske Tvrđave, predstojeći Apgrade festival održaće se u prostorima produkcijski izazovnog i vizuelno impresivnog kompleksa Luke Beograd. Nove koordinate nisu samo lokacijske već i programske &ndash; Apgrade će se odvijati na vi&scaron;e bina, obuhvatiće i dnevne sadržaje, a trajanje je produženo na četiri dana. Na novom mestu, pod vedrim nebom i ispod industrijskih krovova, Apgrade postaje tačka na kojoj se u viziji nove elektronske budućnosti susreću Dunav i industrijsko okruženje betonskih hangara i čeličnih kranova.</p>\r\n\r\n<p>Novo, četvorodnevno izdanje Apgrade festivala 12. septembra otvara <strong>David August</strong>, jedan od najuzbudjivijih glasova elektronske muzike danas. Podr&scaron;ku za tehno &ldquo;wunderkinda&rdquo; pružiće italijanska DJ zvezda i zagovornica vinila <strong>Paquita Gordon</strong>, kao i jedan od miljenika domaće publike <strong>Kristijan Molnar.</strong><br />\r\n<br />\r\nEkskluzivnim nastupom u regionu petak predvodi miljenik beogradskih klabera svih generacija <strong>Laurent Garnier</strong>, ali i harizmatična tehno heroina <strong>Helena Hauff </strong>koja u Beograd dolazi na vrhuncu slave. Nosioci programa druge festivalske bine, za čiju selekciju je zadužen klub Drugstore, biće internet i muzička senzacija, popularni tehno boy band <strong>Fjaak</strong>, kao i Red Light Radio selektor <strong>Orpheu The Wizard</strong>.<br />\r\n<br />\r\nSubota je rezervisana za najtraženiji svetski DJ tandem i vodeće Afterlife protagoniste <strong>Tale Of Us</strong> pored kojih ce nastupiti i legendarni tehno multiinstrumentalista <strong>Mathew Jonson</strong>. Istog dana, na koordinatama drugog stejdža publiku očekuju misteriozni producent <strong>Skee Mask</strong>, autor jednog od najzapaženijih elektronskih albuma 2018. &ldquo;Compro&rdquo; i pariski mastermajnd elektronske eklektike <strong>Low Jack</strong>.<br />\r\n<br />\r\nFinale festivala sledi u nedelju 15. septembra uz nastup <strong>Moodymanna</strong>! Veče zatvaranja kreće već uz zalazak sunca, na posebnoj lokaciji i u programskoj režiji <strong>Tijane T</strong>, beogradske i svetske tehno dive koju ćemo na ovogodi&scaron;njem Apgrade festivalu slu&scaron;ati u dva muzički raznovrsna seta, obogaćena novim iskustvima koje donosi sa brojnih nastupa ovog leta koje je počelo na Ibici i čuvenoj žurci Solomun + 1. Uvod u ovo posebno veče napraviće <strong>Phillie P</strong> i <strong>DJ Brka</strong>.<br />\r\n<br />\r\nProgram tokom ova četiri uzbudljiva dana zaokružuju nastupi brojnih domaćih i internacionalnih imena &ndash; R.O.S.H., Regen, Ali G&uuml;ney i Phillie P su neki od njih - kompletan spisak izvođača po danima dostupan je na <a href="https://www.apgrade.org/" rel="nofollow noopener" target="_blank">Apgrade.org</a> i <a href="https://www.facebook.com/events/1201618103340816/" target="_blank">FB event strani</a>. Tamo možete pronaći i informacije u vezi sa cenama ulaznica.</p>\r\n\r\n<p>&lt;iframe width=&quot;560&quot; height=&quot;315&quot; src=&quot;https://www.youtube.com/embed/Etm2hKy-UXM&quot; frameborder=&quot;0&quot; allow=&quot;accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture&quot; allowfullscreen&gt;&lt;/iframe&gt;</p>', 1, 1, 1, '2019-06-23T18:58:29', 2, 'Tale Of Us.jpg', '2019-06-23T18:58:29'),
(87, 'Poznate sve zvezde ovogodišnjeg EXIT Festivala', '<p><strong>Zaokružen je spisak svih&nbsp;nekih od najvećih svetskih muzičkih zvezda koji će nastupati na EXIT Festivalu od 4. do 7. jula na Petrovaradinskoj tvrđavi.&nbsp;Na jednom mestu okupiće se legendarni umetnici koji i dalje suvereno vladaju svetskom scenom, ali i najpopularniji heroji novih generacija čiji globalni hitovi broje&nbsp;vi&scaron;e desetina milijardi Youtube pregleda!&nbsp;</strong></p>\r\n\r\n<p>Na&nbsp;EXIT&nbsp;dolazi &nbsp;jedan od najvećih rok bendova svih vreme&nbsp;<strong>The Cure </strong>(nastupaju i na <a href="http://localhost/festivalac/categories/selected-news.php?number=36" target="_self">INmusicu</a>), ali i mladi rokenrol bend o kome se trenutno najvi&scaron;e priča u celom svetu,&nbsp;<strong>Greta Van Fleet</strong>! Tu je jedan od najcenjenijih svetskih repera&nbsp;<strong>Skept</strong>a, ali i nova hip-hop princeza&nbsp;<strong>IAMDDB</strong>, te najčuveniji DJ svih vremena&nbsp;<strong>Carl Cox</strong>&nbsp;i danas najpopularnija DJ zvezda nove generacije&nbsp;<strong>Amelie Lens</strong>. Desetine i desetine najslu&scaron;anijih hitova dana&scaron;njice na EXIT&nbsp;lično donose njihovi autori kao &scaron;to je to trenutno veoma aktuelna američka grupa&nbsp;<strong>The Chainsmokers</strong>, ali i francuski genijalac čiji svaki singl broji stotine miliona, pa i milijarde YouTube pregleda,&nbsp;<strong>DJ Snake</strong>! Hitove za najveće svetske festivale donose i kraljevi Tomorrowlanda, DJ duo&nbsp;<strong>Dimitri Vegas &amp; Like Mike</strong>, ali i jo&scaron; jedan belgijski wunderkind sa vrhova svetskih top lista &ndash;&nbsp;<strong>Lost Frequencies</strong>! Najveći trap hit ikad donosi&nbsp;lucidni&nbsp;<strong>Desiigner</strong>, čiji nastupi uživo su apsolutni praznici pozitivne energije, dok će jednako zarazne melodije doneti i njujor&scaron;ki hit duo&nbsp;<strong>Sofi Tukker</strong>. Famozni kantautor moćnog glasa i vlasnik jednog od najboljih albuma ove godine&nbsp;<strong>Tom Walker</strong>&nbsp;nateraće ceo&nbsp;EXIT&nbsp;da peva njegovu himnu &ldquo;Leave a Light On&rdquo;, dok će bass heroji&nbsp;Chase&amp;Status&nbsp;i&nbsp;Dub FX&nbsp;sa publikom na glavnoj bini proslaviti desetogodi&scaron;njicu čuvene muzičke kuće UKF! Njima će se na glavnoj bini pridružiti i vi&scaron;estruko platinasti DJ duo&nbsp;Filatov &amp; Karas, elektronska zvezda koja svoj zvuk pakuje u &bdquo;future funk&ldquo; ruho i koja je nedavno objavila novi album,&nbsp;GriZ, dok na žurku stiže i misteriozna belgijska didžejica u usponu,&nbsp;MATTN.</p>\r\n\r\n<p>Ipak, najvi&scaron;e i najduže će se plesati uz ovogodi&scaron;nju All-Star postavu spektakularne mts Dance Arene na kojoj se uz Coxa i Amelie na spisku nalaze i praktično svi najtraženiji izvođači dana&scaron;nje elektronske scene kao &scaron;to su <strong>Paul Kalkbrenner,&nbsp;Solomun,&nbsp;Tale of Us,&nbsp;Charlotte De Witte,&nbsp;Boris Brejcha,&nbsp;Peggy Gou,&nbsp;Maceo Plex,&nbsp;Jeff Mills,&nbsp;Dax J,&nbsp;Monika Kruse</strong>&nbsp;i brojni drugi. I Addiko Fusion binu pome&scaron;aće nasleđe, dana&scaron;njicu i aktuelne tokove, od maestralnog &scaron;ansonjera&nbsp;<strong>Zvonka Bogdana</strong>&nbsp;i ska legendi&nbsp;<strong>The Selecter</strong>, preko metal dive&nbsp;<strong>Tarje</strong>&nbsp;i 30. godi&scaron;njice&nbsp;<strong>Atheist Rapa</strong>&nbsp;u originalnoj postavi, pa sve do regionalnih zvezda kao &scaron;to su&nbsp;Senidah, Fox i Surreal ili fascinantnog sastava&nbsp;<strong>Svemirko</strong>. Na peto izdanje No Sleep Novi Sad bine dolaze underground heroji kao &scaron;to su&nbsp;Lee Burridge, DVS1, I Hate Models, Giorgia Angiuli, Blawan, Sebastien Leger, 999999999, SDHW &amp; Obscure Shape, Boston 168&nbsp;i mnogi drugi. Žestoka Explosive bina, ove je godine podigla i sopstvenu lestvicu uz&nbsp;<strong>White Chappel,&nbsp;Arcturus,&nbsp;Soilwork,&nbsp;Entombed AD,&nbsp;Total Chaos,&nbsp;Peter and The Test Tube Babies</strong>&nbsp;i desetine drugih. Ipak, čak i sve to, samo je deo cele slike koju čini jo&scaron; preko hiljadu akreditovanih umetnika iz celog sveta, koji će se od 4. do 7. jula rasporediti na preko četrdeset bina i muzičkih zona &scaron;irom Petrovaradinske tvrđave u Novom Sadu!</p>\r\n\r\n<p>Za informacije u vezi sa ulaznicama i festivalskim kampom, možete posetiti njihov <a href="https://www.exitfest.org/" target="_blank">zvanični sajt</a>.</p>\r\n\r\n<p><iframe frameborder="0" height="315" src="https://www.youtube.com/embed/dcMplVgHoMA" width="560"></iframe></p>\r\n\r\n<p>&nbsp;</p>', 1, 1, 1, '2019-06-23T19:26:24', 10, 'EXIT.jpg', '2019-06-23T19:26:24');

-- --------------------------------------------------------

--
-- Table structure for table `vest_eng`
--

CREATE TABLE `vest_eng` (
  `sifra` int(11) NOT NULL,
  `naslov` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `tekst` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `kategorija` tinyint(10) NOT NULL,
  `autor` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `vreme` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `klik` smallint(254) NOT NULL,
  `slika` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `vreme_objave` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vest_eng`
--

INSERT INTO `vest_eng` (`sifra`, `naslov`, `tekst`, `kategorija`, `autor`, `status`, `vreme`, `klik`, `slika`, `vreme_objave`) VALUES
(1, 'Mother’s Cake – furious combination of psychodelic and prog rock', 'RS: Considering your name, do you like mother’s cake? What do you usually eat when on tour?\r\n\r\nYves: Sure, we like a good piece of cake, who doesn’t…  On tour, mostly meat and Greek yoghurt, you know the fat one.\r\n\r\nRS: What would you try, speaking of music, you haven’t tried yet? Maybe recording with some special producer or in some special studio?\r\n\r\nYves: We are happy kids, when we want to do something, we do it…at least try it. Last summer we want to do a live album and we looked for a special location to film the whole concert. Benni (bass player) said, hey lets go to the Bergisel Stadium in our hometown, first everybody laughed, cause its a huge ski jump arena – production was a nightmare, but you know what – in the end we did it!\r\n\r\nRS: This will be your first time in Serbia. What do you know about our country? Generally speaking, do you like discovering new places and playing in front of new audience?\r\n\r\nYves: Really looking forward to it! Part of the thrill being in a band is to travel and see all the places you never been and meeting the people there. I believe if everybody had to travel at least a year in his life, we would have far less racism and prejudices. Cause you see everywhere are awesome people and everywhere you get the chance to meet an asshole, it no matter of nationality. Many Serbians live in Austria and some are my friends, of course the civil war is still in the minds but, I hope especially in these days, when it seems that we don´t learn from our past, we find a way to live together.  Live and let live – that’s the way.\r\n\r\nRS: Can you tell me about new bands or new records from Austria which deserve to be mentioned in your opinion, sort of a music recommendation for our readers?\r\n\r\nYves: There are so many; Giant Ant Eater, Spiral Drive, The Fictionplay, Intra, Parasol Caravan, Blitzpop, Stuhl Gang, Bilderbuch, Von Seiten der Gemeinde, Rebel Music, Bug, 5KHD, Leya, Belphegor, Serenity, Wandl, Mavi  Phönix….to name a few, the scene is so rich – go and check it out.', 1, 1, 1, '2019-06-27T21:59', 0, 'Deerhunter.jpg', '2019-06-27T21:59'),
(2, 'Algiers: One of the most political moves we can make in this divided and increasingly digitalised world is to congregate together and share a sense of collectivity despite our differences.', '<p>The great american-british band&nbsp;<a href="https://www.facebook.com/Algierstheband/" rel="noopener" target="_blank">Algiers</a>&nbsp;is on tour promoting their latest, second album&nbsp;<em>The Underside of Power</em>. The tour includes 6 dates in our region, and we took the opportunity to have a little talk with the band.</p>\r\n\r\n<p><strong>Rock Svirke: We are very excited to have you here for the first time. You&rsquo;ll be performing in Croatia, Slovenia, Serbia, Macedonia and Kosovo. Be honest, what&rsquo;s your knowledge about our little countries?</strong></p>\r\n\r\n<p>WE CANNOT WAIT TO PLAY IN ZAGREB, RIJEKA, LJUBJLANA, BELGRADE, SKOPJE AND PRIZREN! The notion of place occupies a very important position in our collective worldview, hence why the name Algiers is so significant for us. It literally stands in for an allegiance to global solidarity in a time of resurgent fascist/right-wing nationalisms. Algiers was not only the epicentre of the Algerian revolution against French imperialism, but also a site of inspiration for peoples struggling against oppression worldwide. The Black Panthers, the Palestianian Liberation Organisation and many others had foreign offices phsyically located in Algiers in the early days of the revolution. So, in a long and winding way, the countries of former Yugoslavia fit within this imaginary space, particularly, however doomed, in their attempts to transcend nationalisms and form a transnational socialist state, and even more so in their solidarity in the fight against Nazism. Everyone who joined the partisans; everyone who has resisted fascist takeover, deserves our utmost respect.</p>\r\n\r\n<p><strong>Rock Svirke: A rapidly degenerating political situation is happening not only in the US or UK, but also here. We are all crying out, and music is often the answer that comes to our aid. What can we expect from your shows in the region?</strong></p>\r\n\r\n<p>One of the most political moves we can make in this divided and increasingly digitalised world is to congregate together and share a sense of collectivity despite our differences. Our show pulls from gospel, US hardcore, soul and other forms of music that bring people together to say &rdquo;No!&rdquo; to the current state of affairs and &rdquo;Yes!&rdquo; to something different. Also expect sweat and lots of movement &ndash; and maybe a bass solo or two.</p>', 1, 1, 1, '2019-06-28T00:12:18', 0, 'algiers.jpg', '2019-06-28T00:12:18'),
(3, 'Ben Caplan: “When somebody takes pride in their work and tries to do their best every time no matter what, then I think that’s something that’s deserving of respect.”', '<p>Ben Caplan &ndash; Interview, 19.10.2017 @Botel Marina, Rijeka</p>\r\n\r\n<p>The charismatic Canadian musician Ben Caplan and his band The Casual Smokers, held 2 concerts in Croatia this year within their European tour, one in Zagreb and one in Rijeka. We had the pleasure of attending the concert in Rijeka, in the unique atmosphere of the venue on the Botel Marina. After a great concert and in a relaxed atmosphere, we sat down with Ben and had a chat.</p>\r\n\r\n<p><strong>Rock Svirke: We love your roar. When was the first time you discovered it in you and what kind of a roar was it?</strong></p>\r\n\r\n<p>&ldquo;When I was 16 or 17 years old I had a band, it was called &ldquo;Ovenbird&rdquo;, we spelled it with two &ldquo;u&rsquo;s&rdquo; &ndash; Uvenburd &ndash; to be cool. It was me and one other friend. When I was in that band we played a lot of shows but there was one gig in particular where I was playing with a band that belonged to a friend of mine. They were a really really good band, everybody went to jazz school, they were all professional musicians, really hip you know. A couple of days later, we were at a party and I was talking to this girl who I&rsquo;ve never met before and I said I was from Hamilton, which is the city I grew up in, and she said &lsquo;Oh, my boyfriend just played a concert in Hamilton two days ago. He said that the band that they were opening for, the band that was the headliner of the concert, was sooo bad because they were performing at a full dynamic, as loud as they could, the whole show, and it was just the same thing for like 45, 50 minutes. It was just the worst thing that he&rsquo;s ever seen. He thought it was a joke at first and then it just kept going.&rsquo; And I was like: &lsquo;Oh, that was my band.&rsquo; So, I think that&rsquo;s when I discovered my roar, I think that moment right there. Because I think before that, I was trying to find out how much I could give to the audience and how much power I had with my voice that I could use, and then after that I began to think about how to use less. And I think by using less gave me more power.&rdquo;</p>\r\n\r\n<p><strong>Rock Svirke: You are a multi instrumentalist. Have you a favorite one and if so, for what reason?</strong></p>\r\n\r\n<p>&ldquo;Right now, my favorite instrument is the piano. I have a lot to learn on the piano and it&rsquo;s an instrument that is giving me a lot of challenges. And I love the feeling of sitting in front of the keyboard and just feeling the sound pouring off of it.&rdquo;</p>\r\n\r\n<p><strong>Rock Svirke: We understand that you don&rsquo;t like to put your music in labeled boxes, genre wise. We imagine you as a kind of a father that says to his songs &ldquo;Here, I made you, now go and be your beautiful selves in whatever form or shape you choose.&rdquo; Is the process of making songs for you similar to this or are we way off?</strong></p>\r\n\r\n<p>&ldquo;No, I think you&rsquo;re right, but I feel less like a father and more like a foster parent, or an adoptive parent. I feel like a child is been given to me and it&rsquo;s not my job to decide who the child is or should be. I don&rsquo;t know where the child comes from. My job is to try to honor the child the best I can.&rdquo;</p>\r\n\r\n<p><strong>Rock Svirke: There is a lot of talk in your interviews about the influence of gypsy music on your work. We read a book recently called &ldquo;Gypsy music: The Balkans and beyond&rdquo; by Alan Ashton Smith, where he stated, and we quote: &ldquo; The figure of the gypsy is simultaneously vilified and romanticized. Gypsies have for centuries been associated with criminality and dirt but also with colour, magic and music.&rdquo; How do you find yourself and your music, figuratively, in this statement?</strong></p>\r\n\r\n<p>&ldquo;Well, I think I try to avoid over romanticizing this archetype, this character of the gypsy &ndash;and I prefer to say Romani. I wind up referring to romani or gypsy music because it winds up being a touch stone that people can relate to, a common theme. But when I&rsquo;m here I prefer to say its Balkan music, its Romanian music, its Serbian music. I listen to Boban Marković&hellip;there&rsquo;s a lot of different artists that I listen to but also, primarily, my access to this style is through jewish music because that&rsquo;s my own heritage. And it was through listening to Balkan brass style that I recognized the connection of the jewish music that I already had, cos I&rsquo;d heard it from long time ago growing up, but I didn&rsquo;t connect with it as music, it was just this other thing. And it was really just when I heard Balkan brass style music I realized that&rsquo;s something that I&rsquo;m connected with but that I don&rsquo;t write with and so I started to explore it. So, I think that that&rsquo;s one thing I could say, and another thing is that communities that are pushed aside and are not allowed or not permitted for various reasons to interact with the wider society, wind up making great art. It&rsquo;s like injustice and inequality and all of this kinds of things and tight borders between communities make for great art. So, my project is about using the process of my own songwriting to connect different styles and different things, to take this things that had been built in isolated contexts and mixing them together now that the borders are starting to break down.&rdquo;</p>\r\n\r\n<p><strong>Rock Svirke: You mentioned Boban Marković already, what do you listen to at home when you&rsquo;re doing the dishes or something? Which bands or musicians you like at the moment?</strong></p>\r\n\r\n<p>&ldquo;I don&rsquo;t listen to that much music at home, but my favorite band right now is probably a great band called Le Fanfare Du Belgistan. And Geoff Berner is one of my favorites, he&rsquo;s a Canadian songwriter.&rdquo;</p>\r\n\r\n<p><strong>Rock Svirke: You have played both small and big venues, big festivals even, but have you ever held a concert on a boat that is also a hotel like this one?</strong></p>\r\n\r\n<p>&ldquo;Never. Well, on a boat yes actually. I played on a few canal boats in the Netherlands. But this is the biggest boat I played a concert on. And that is also a hotel, very cool.&rdquo;</p>\r\n\r\n<p><strong>Rock Svirke: Is there some new material you are working on, a new album maybe? When can we expect it?</strong></p>\r\n\r\n<p>&ldquo;Yes. I&rsquo;m gonna go into the studio in February or March. I made a play, a sort of concert/theater matchup and it tells the story of some jewish romanian refugees who left pogroms in 1908 and came to Canada. I made 10 songs for the show so this songs are going to be my next album. And I&rsquo;m also now starting to tour that play, performing in theaters with actors and doing that thing instead of music for a little while.&rdquo;</p>\r\n\r\n<p><strong>Rock Svirke: We just met a guy and girl from Germany earlier, and they said they drove for 14 hours to come and see you play here tonight. That&rsquo;s pretty amazing, what do you say about that?</strong></p>\r\n\r\n<p>&ldquo;Holly shit! (laughs) It&rsquo;s cool, yeah. I mean, it&rsquo;s not the first time this happened to me that I showed up in a venue and people have traveled ridiculous amount of time to come. It&rsquo;s flattering to a certain degree. What I do, I really love it, I enjoy what I do and I feel moments of magic on stage every night. But I don&rsquo;t think about what I do as being so special. I take pride in what I do, I try to do a really good job, I don&rsquo;t think I&rsquo;m more deserving of awe and respect then a great plumber. When somebody takes pride in their work and tries to do their best every time no matter what, then I think that&rsquo;s something that&rsquo;s deserving of respect. And that&rsquo;s what I aspire to. And so, the fact that some people connect with that and want to travel to be there it&rsquo;s really a very powerfully affirmative response. And it&rsquo;s very flattering, it makes me feel like I&rsquo;m on the right track.&rdquo;</p>\r\n\r\n<p><iframe frameborder="0" height="315" src="https://www.youtube.com/embed/kfzy08FSdS4" width="560"></iframe></p>', 1, 1, 1, '2019-06-28T00:22:30', 0, 'ben.jpg', '2019-06-28T00:22:30'),
(4, 'Don Antonio – the sound of modern Italija', '<p><strong>Antonio Gramentieri</strong>&nbsp;is one of the most personal and revered producers and guitar players of the new Italian scene. He mixes north and south, bluesy and jazzy atmospheres, Africa and Mediterranean, vintage soundtracks and folk music, and defines the sound of modern Italy as warm, elusive, intriguing, mysterious, mutant affair.</p>\n\n<p>He is well-known by his work with Sacri Cuori, but so far he collaborated with plenty of respectable artists such as Richard Buckner, Dan Stuart, Hugo Race, Terry Lee Hale, Alejandro Escovedo, Marc Ribot, David Hidalgo, JD Foster, Jim Keltner and many more. Last year in April, he released solo debut named&nbsp;<strong>&ldquo;Don Antonio&rdquo;</strong>.</p>\n\n<p>Currently, Gramentieri is on Eastern European tour, promoting his new record and today he will perform in Serbian capital of Belgrade, so we did a little interview with him about the new beginning, the music that inspires him, his work with Dan Stuart, and, of course, about his recent solo work.</p>\n\n<p><strong>Rock Svirke: At the very beginning, could you tell us, who is Don Antonio?</strong></p>\n\n<p><strong>Antonio:</strong>&nbsp;As a character he is the leader of an old style orchestra playing in cruise ships and country fair, somewhere south. A smiling man, with some charme and still some mystery. His music don&rsquo;t come from a specific place, it comes from ALL the places he&rsquo;s been to, at the same time.</p>\n\n<p><strong>Nemanja:&nbsp;You are well-known as a member of Sacri Cuori. How did you end up with an idea to start solo work?&nbsp;</strong></p>\n\n<p><strong>Antonio:</strong>&nbsp;Turned 45, decided that it was the time to put my face upfront, and develop some ideas with no other inteference/discussion. Bands, like most family, have only a certain amount of time to look forward, then it is mostly about preservation. In families it might work, in music it does not. At least for me.</p>\n\n<p><strong>Nemanja:&nbsp;What would you say are the main differences between Don Antonio and Sacri Cuori?</strong></p>\n\n<p><strong>Antonio:</strong>&nbsp;They are two different points in the same map. Sacri Cuori established a way to approach traditions, even the Italian one, with a cosmpolitan touch, without replicating postcards of the past. Don Antonio is diggin&rsquo; deeper in some of this sonic places, trying to reflect an idea of a new folklore, in the age where national cultures and traditions are melting one in to the other every second.</p>', 1, 1, 3, '2019-06-28T16:03:01', 0, 'DSCN1952-ConvertImage.jpg', '2019-06-28T16:03:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `galerija`
--
ALTER TABLE `galerija`
  ADD PRIMARY KEY (`sifra_g`);

--
-- Indexes for table `glavna`
--
ALTER TABLE `glavna`
  ADD KEY `ttr_idx` (`vest`);

--
-- Indexes for table `glavna_eng`
--
ALTER TABLE `glavna_eng`
  ADD KEY `tzzz_idx` (`vest_eng`);

--
-- Indexes for table `izdvajamo`
--
ALTER TABLE `izdvajamo`
  ADD KEY `fdf_idx` (`vest`);

--
-- Indexes for table `kategorija`
--
ALTER TABLE `kategorija`
  ADD PRIMARY KEY (`sifra`),
  ADD UNIQUE KEY `naziv_UNIQUE` (`naziv`);

--
-- Indexes for table `komentari`
--
ALTER TABLE `komentari`
  ADD PRIMARY KEY (`sifra`),
  ADD KEY `vest_s_idx` (`vest`);

--
-- Indexes for table `komentari_eng`
--
ALTER TABLE `komentari_eng`
  ADD PRIMARY KEY (`sifra`),
  ADD KEY ` cccxcxc_idx` (`vest`);

--
-- Indexes for table `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`sifra`),
  ADD UNIQUE KEY `mail_UNIQUE` (`mail`);

--
-- Indexes for table `novinar`
--
ALTER TABLE `novinar`
  ADD PRIMARY KEY (`sifra`),
  ADD UNIQUE KEY `password_UNIQUE` (`password`),
  ADD UNIQUE KEY `mail_UNIQUE` (`mail`),
  ADD KEY `ko_je_glavni_idx` (`master`);

--
-- Indexes for table `status_vesti`
--
ALTER TABLE `status_vesti`
  ADD PRIMARY KEY (`sifra`),
  ADD UNIQUE KEY `sifra_UNIQUE` (`sifra`),
  ADD UNIQUE KEY `naziv_UNIQUE` (`naziv`);

--
-- Indexes for table `tagovi`
--
ALTER TABLE `tagovi`
  ADD PRIMARY KEY (`sifra`);

--
-- Indexes for table `tag_vest`
--
ALTER TABLE `tag_vest`
  ADD KEY `prvi_idx` (`vest`),
  ADD KEY `drugi_idx` (`tag`);

--
-- Indexes for table `tag_vest_eng`
--
ALTER TABLE `tag_vest_eng`
  ADD KEY `ssssss_idx` (`tag`),
  ADD KEY `yyyyy_idx` (`vest_eng`);

--
-- Indexes for table `vest`
--
ALTER TABLE `vest`
  ADD PRIMARY KEY (`sifra`),
  ADD KEY `kategorija_idx` (`kategorija`),
  ADD KEY `autor_idx` (`autor`),
  ADD KEY `status_idx` (`status`);

--
-- Indexes for table `vest_eng`
--
ALTER TABLE `vest_eng`
  ADD PRIMARY KEY (`sifra`),
  ADD KEY `jh_idx` (`autor`),
  ADD KEY `hjjhj_idx` (`kategorija`),
  ADD KEY `nnnn_idx` (`status`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `galerija`
--
ALTER TABLE `galerija`
  MODIFY `sifra_g` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `komentari`
--
ALTER TABLE `komentari`
  MODIFY `sifra` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `komentari_eng`
--
ALTER TABLE `komentari_eng`
  MODIFY `sifra` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `sifra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `novinar`
--
ALTER TABLE `novinar`
  MODIFY `sifra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `tagovi`
--
ALTER TABLE `tagovi`
  MODIFY `sifra` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT for table `vest`
--
ALTER TABLE `vest`
  MODIFY `sifra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;
--
-- AUTO_INCREMENT for table `vest_eng`
--
ALTER TABLE `vest_eng`
  MODIFY `sifra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `glavna`
--
ALTER TABLE `glavna`
  ADD CONSTRAINT `ttr` FOREIGN KEY (`vest`) REFERENCES `vest` (`sifra`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `glavna_eng`
--
ALTER TABLE `glavna_eng`
  ADD CONSTRAINT `tzzz` FOREIGN KEY (`vest_eng`) REFERENCES `vest_eng` (`sifra`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `izdvajamo`
--
ALTER TABLE `izdvajamo`
  ADD CONSTRAINT `fdf` FOREIGN KEY (`vest`) REFERENCES `vest` (`sifra`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `komentari`
--
ALTER TABLE `komentari`
  ADD CONSTRAINT `s_kom` FOREIGN KEY (`vest`) REFERENCES `vest` (`sifra`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `komentari_eng`
--
ALTER TABLE `komentari_eng`
  ADD CONSTRAINT ` cccxcxc` FOREIGN KEY (`vest`) REFERENCES `vest_eng` (`sifra`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `novinar`
--
ALTER TABLE `novinar`
  ADD CONSTRAINT `ko_je_glavni` FOREIGN KEY (`master`) REFERENCES `novinar` (`sifra`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tag_vest`
--
ALTER TABLE `tag_vest`
  ADD CONSTRAINT `drugi` FOREIGN KEY (`tag`) REFERENCES `tagovi` (`sifra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `prvi` FOREIGN KEY (`vest`) REFERENCES `vest` (`sifra`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tag_vest_eng`
--
ALTER TABLE `tag_vest_eng`
  ADD CONSTRAINT `ssssss` FOREIGN KEY (`tag`) REFERENCES `tagovi` (`sifra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `yyyyy` FOREIGN KEY (`vest_eng`) REFERENCES `vest_eng` (`sifra`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `vest`
--
ALTER TABLE `vest`
  ADD CONSTRAINT `eng_autor` FOREIGN KEY (`autor`) REFERENCES `novinar` (`sifra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `eng_kat` FOREIGN KEY (`kategorija`) REFERENCES `kategorija` (`sifra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `eng_status` FOREIGN KEY (`status`) REFERENCES `status_vesti` (`sifra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `s_autor` FOREIGN KEY (`autor`) REFERENCES `novinar` (`sifra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `s_kat` FOREIGN KEY (`kategorija`) REFERENCES `kategorija` (`sifra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `s_status` FOREIGN KEY (`status`) REFERENCES `status_vesti` (`sifra`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `vest_eng`
--
ALTER TABLE `vest_eng`
  ADD CONSTRAINT `hjjhj` FOREIGN KEY (`kategorija`) REFERENCES `kategorija` (`sifra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `jh` FOREIGN KEY (`autor`) REFERENCES `novinar` (`sifra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `nnnn` FOREIGN KEY (`status`) REFERENCES `status_vesti` (`sifra`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
