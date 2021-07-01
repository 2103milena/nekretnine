-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 10, 2017 at 11:24 AM
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
-- Table structure for table `estate_ad`
--

CREATE TABLE IF NOT EXISTS `estate_ad` (
  `id_ad` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID oglasa',
  `unique_id` varchar(255) DEFAULT NULL COMMENT 'unique id of the ad',
  `local_id` varchar(255) DEFAULT NULL COMMENT 'id of the imported ad in his local database',
  `id_project` int(11) DEFAULT NULL COMMENT 'Povezani projekat',
  `ad_title` varchar(100) NOT NULL,
  `id_ad_type` int(11) NOT NULL DEFAULT '0' COMMENT 'Tip oglasa (FK ad_type)',
  `price` int(11) DEFAULT NULL COMMENT 'Cena',
  `surface` decimal(10,0) NOT NULL DEFAULT '0' COMMENT 'Povrsina',
  `nb_rooms` float NOT NULL COMMENT 'Broj soba',
  `nb_baths` int(11) NOT NULL COMMENT 'Broj kupatila',
  `nb_floors` int(3) DEFAULT NULL COMMENT 'Broj spratova u zgradi',
  `floor` varchar(2) DEFAULT NULL COMMENT 'Sprat',
  `id_type` int(11) NOT NULL DEFAULT '0' COMMENT 'Tip objekta (FK_ESTATE_TYPE)',
  `id_heating` int(11) NOT NULL COMMENT 'Tip grejanja (FK_HEATING)',
  `id_condition` int(11) DEFAULT NULL COMMENT 'Namestenost',
  `id_hood` int(11) NOT NULL DEFAULT '0' COMMENT 'Naselje (FK_HOOD)',
  `id_hood_part` int(11) NOT NULL,
  `lift` int(11) NOT NULL DEFAULT '0' COMMENT 'Zgrada sa liftom 0/1',
  `year_construction` varchar(8) DEFAULT NULL COMMENT 'Godina izgradnje',
  `completion_deadline` varchar(50) NOT NULL COMMENT 'Planirani datum zavrsetka',
  `cellar` int(11) NOT NULL DEFAULT '0' COMMENT 'Podrum - povrsina',
  `garage` int(11) NOT NULL DEFAULT '0' COMMENT 'Garaza - broj parking mesta',
  `parking` int(11) NOT NULL DEFAULT '0' COMMENT 'Parking - broj parking mesta',
  `yard` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Privatno dvoriste - da/ne',
  `land_surface` decimal(10,1) DEFAULT NULL,
  `description` text COMMENT 'Slobodan opis nekretnine',
  `street` varchar(50) DEFAULT NULL COMMENT 'Ulica',
  `number` varchar(10) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Broj',
  `id_country` int(2) NOT NULL,
  `id_city` int(11) NOT NULL DEFAULT '0' COMMENT 'Grad (FK_CITY)',
  `nb_views` int(11) NOT NULL DEFAULT '0' COMMENT 'Broj pregleda oglasa',
  `nb_contacts` int(11) NOT NULL DEFAULT '0' COMMENT 'broj pregleda kontakt informacija',
  `id_user` int(11) NOT NULL DEFAULT '0' COMMENT 'User koji je postavio oglas (FK_USER)',
  `id_user_parent` int(11) DEFAULT NULL COMMENT 'Parent usera koji je postavio oglas (FK_USER)',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT 'Prioritet oglasa: koristi se pri sortiranju oglasa',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT 'Status oglasa - aktivan/neaktivan',
  `status_inverse` int(2) NOT NULL DEFAULT '-1' COMMENT 'inverzna vrednost statusa oglasa - koristi se za index optimizaciju',
  `dat_sponsored` datetime NOT NULL COMMENT 'Datum sponzorisanja oglasa',
  `dat_upload` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Datum postavljanja oglasa',
  `dat_update` datetime NOT NULL COMMENT 'Datum obnove oglasa',
  `dat_sale` datetime DEFAULT NULL COMMENT 'Datum prodaje objekta',
  `dat_deleted` datetime NOT NULL,
  `in_construction` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Nekretnina u izgradnji',
  `recent` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Novogradnja',
  `legalized` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Sredjeni papiri',
  `terrace` int(11) NOT NULL DEFAULT '0' COMMENT 'Terasa',
  `internet` int(11) NOT NULL DEFAULT '0' COMMENT 'Internet',
  `cable` int(11) NOT NULL DEFAULT '0' COMMENT 'Kablovska',
  `price_square` float DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `twitted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'oglas oglasen na twitteru',
  `location_lat` varchar(20) DEFAULT NULL COMMENT 'Geo. sirina lokacije',
  `location_lng` varchar(20) DEFAULT NULL COMMENT 'Geo. duzina lokacije',
  `location_precise` tinyint(1) DEFAULT NULL COMMENT 'Preciznost: 1 - precizna lokacija / 0 - priblizna lokacija',
  `registered` int(11) NOT NULL DEFAULT '0',
  `phone` int(11) NOT NULL DEFAULT '0',
  `air_conditioner` int(11) NOT NULL DEFAULT '0',
  `intercom` int(11) NOT NULL DEFAULT '0',
  `legalization_complete` int(11) NOT NULL DEFAULT '0' COMMENT 'legalizovano',
  `act_user_flag` int(1) NOT NULL DEFAULT '0' COMMENT 'user activation of the ad',
  `dat_user_activation` datetime DEFAULT NULL COMMENT 'Date of SMS activation',
  `act_mod_flag` int(1) NOT NULL DEFAULT '0' COMMENT 'moderator activation of the ad',
  `dat_mod_activation` datetime DEFAULT NULL COMMENT 'date of moderator activation',
  `act_state_flag` int(1) NOT NULL DEFAULT '0' COMMENT 'ad status 0 - unconfirmed,\r\n1 - pending,\r\n2 - activated,\r\n-1 - declined',
  `act_sms_code` varchar(4) DEFAULT NULL COMMENT 'SMS code for SMS activation',
  `dat_sponsored_pause` datetime DEFAULT NULL COMMENT 'This field is set when sponsored is deactivated',
  `activation_report` int(1) NOT NULL DEFAULT '0' COMMENT '0 - do not- report ad,\r\n1 - report ad as activated,\r\n2 - report ad is deactivated',
  `banned` int(1) NOT NULL DEFAULT '0',
  `search_index_sr` text COMMENT 'sr index used for fulltext searches',
  `search_index_en` text COMMENT 'en index used for fulltext searches',
  `search_index_fr` text COMMENT 'fr index used for fulltext searches',
  `search_index_de` text COMMENT 'de index used for fulltext searches',
  `message_present` tinyint(4) NOT NULL,
  `3d_present` tinyint(4) NOT NULL,
  `video_present` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_ad`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `id_type` (`id_type`),
  KEY `id_heating` (`id_heating`),
  KEY `id_hood` (`id_hood`),
  KEY `id_city` (`id_city`),
  KEY `id_user` (`id_user`),
  KEY `price` (`price`),
  KEY `surface` (`surface`),
  KEY `iduser_parent` (`id_user_parent`),
  KEY `sort_date_desc` (`status`,`dat_update`),
  KEY `sort_price_desc` (`status`,`price`),
  KEY `sort_surface_desc` (`status`,`surface`),
  KEY `sort_nb_rooms_desc` (`status`,`nb_rooms`),
  KEY `sort_date_asc` (`status_inverse`,`dat_update`),
  KEY `sort_price_asc` (`status_inverse`,`price`),
  KEY `sort_surface_asc` (`status_inverse`,`surface`),
  KEY `sort_nb_rooms_asc` (`status_inverse`,`nb_rooms`),
  KEY `id_country` (`id_country`),
  FULLTEXT KEY `ad_title` (`ad_title`,`description`),
  FULLTEXT KEY `search_index_sr` (`search_index_sr`),
  FULLTEXT KEY `search_index_en` (`search_index_en`),
  FULLTEXT KEY `search_index_fr` (`search_index_fr`),
  FULLTEXT KEY `search_index_de` (`search_index_de`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Oglasi' AUTO_INCREMENT=347860 ;

--
-- Dumping data for table `estate_ad`
--

INSERT INTO `estate_ad` (`id_ad`, `ad_title`, `id_ad_type`, `price`, `surface`, `nb_rooms`, `id_type`, `id_hood`, `id_hood_part`, `land_surface`, `description`, `street`, `id_country`, `id_city`, `dat_deleted`, `deleted`) VALUES
(347859, 'aaa', 1, 1, '123', 0, 1, 0, 0, '0.0', '', '', 0, 11, '2017-09-08 15:18:24', 1),
(347858, '123', 1, 99999, '99', 0, 1, 16530, 0, '0.0', '', '', 1, 1506, '0000-00-00 00:00:00', 0),
(347857, 'Plac', 1, 0, '34', 0, 1, 0, 0, '0.0', '', '', 0, 307, '0000-00-00 00:00:00', 0),
(347856, 'aaa', 1, 0, '77', 0, 1, 0, 0, '0.0', '', '', 0, 311, '2017-06-30 15:35:41', 1),
(347855, 'Plac', 2, 0, '67', 0, 1, 0, 0, '0.0', '', '', 0, 5, '0000-00-00 00:00:00', 0),
(347854, 'Plac', 1, 0, '45', 0, 1, 0, 0, '0.0', '', '', 0, 261, '0000-00-00 00:00:00', 0),
(347853, '123213', 1, 0, '300', 0, 1, 0, 0, '0.0', '', '', 0, 301, '0000-00-00 00:00:00', 0),
(347852, '13', 2, 0, '2', 0, 1, 0, 0, '0.0', '', '', 0, 1, '0000-00-00 00:00:00', 0),
(347851, '213', 2, 0, '21', 0, 1, 0, 0, '0.0', '', '', 0, 280, '0000-00-00 00:00:00', 0),
(347850, 'test3', 2, 0, '123', 0, 1, 0, 0, '0.0', '', '', 0, 311, '0000-00-00 00:00:00', 0),
(347849, '123', 3, 1231, '123', 0, 1, 0, 0, '0.0', '', '', 0, 280, '0000-00-00 00:00:00', 1),
(347848, 'test4', 2, 350, '300', 0, 1, 0, 0, '0.0', '', '', 0, 8, '0000-00-00 00:00:00', 0),
(347847, 'asd', 2, 0, '213', 0, 1, 0, 0, '0.0', '', '', 0, 259, '0000-00-00 00:00:00', 0),
(347846, 'asd', 1, 0, '33', 0, 1, 0, 0, '0.0', '', '', 0, 1, '0000-00-00 00:00:00', 0),
(347845, 'STAN uknjizen, renoviran, RAKOVICA MILJAKOVAC 25m2 30000e', 1, 30000, '25', 0, 2, 9, 0, '0.0', '<p><strong>uknjizena garsonjera na I spratu stambene zgrade u</strong> ul. Dimitrija Koturovica, terasa, eg, bez ulaganja, Stan se moze kupiti iz kredita banke. - - Na sledecem link-u mozete pogledati video prikaz stana: https://youtu. be/ROFoi_aSNnQ 064/308-3957 1/3 Dimitrija Koturovica</p>\r\n<p><em>Kontakt: 064/308-3957</em></p>', 'Dimitrija Koturovica', 0, 1, '0000-00-00 00:00:00', 0),
(347844, 'STAN uknjizen, renoviran, RAKOVICA MILJAKOVAC 25m2 30000e', 1, 30000, '25', 0.5, 2, 9, 0, '0.0', '<p>uknjizena garsonjera na I spratu stambene zgrade u ul. Dimitrija Koturovica, terasa, eg, bez ulaganja, Stan se moze kupiti iz kredita banke. -  - Na sledecem link-u mozete  pogledati video prikaz stana: https://youtu. be/ROFoi_aSNnQ  064/308-3957 1/3 Dimitrija Koturovica<p>Kontakt: 064/308-3957</p></p>', 'Dimitrija Koturovica', 0, 1, '0000-00-00 00:00:00', 0),
(347843, 'Stan, Mlaka, 60m2, 2-soban', 1, 60000, '60', 0, 2, 16603, 0, '0.0', '<p>Mlaka, na ponudi je stan od 60m2 koji se nalazi na 3 katu u manjoj zgradi. Sastoji se od većeg hodnika, kuhinje s dnevnim boravkom, dvije sobe, kupaonice i odvojeno malog wc-a. U stanu je započeta adaptacija, a prodaje se u postojećem stanju. &#10;Pozicija dobra za iznajmljivanje, blizina autobusa, Ztc-a, osnovne i srednje škole. &#10;&#10;Šifra objekta: 3350</p>', '', 1, 1511, '0000-00-00 00:00:00', 0),
(347842, '234', 2, 0, '65', 0, 1, 0, 0, '0.0', '', '', 0, 1, '0000-00-00 00:00:00', 0),
(347841, '123', 1, 0, '123', 0, 1, 0, 0, '0.0', '', '', 0, 279, '0000-00-00 00:00:00', 0),
(347840, 'Izdavanje, Stan, 30m2 , Beograd', 3, 1, '30', 0, 2, 0, 0, '0.0', '', '', 0, 1, '2017-06-15 11:00:44', 0),
(347839, 'Izdavanje, Stan, 30m2 , Beograd', 2, 30000, '30', 0, 2, 0, 0, '0.0', '', '', 0, 1, '2017-06-15 11:03:45', 1),
(347838, 'Izdavanje, Stan, 30m2 , Beograd', 2, 30000, '30', 0, 2, 0, 0, '0.0', '', '', 0, 1, '2017-06-15 11:03:48', 1),
(347837, 'Izdavanje, Stan, 30m2 , Beograd', 2, 30000, '30', 0, 2, 0, 0, '0.0', '', '', 0, 1, '2017-06-15 11:03:44', 1),
(347836, 'Izdavanje, Stan, 30m2 , Beograd', 2, 30000, '30', 0, 2, 0, 0, '0.0', '', '', 0, 1, '2017-06-15 11:03:43', 1),
(347835, 'Izdavanje, Stan, 30m2 , Beograd', 2, 30000, '30', 0, 2, 0, 0, '0.0', '', '', 0, 1, '2017-06-15 11:03:41', 1),
(347834, 'Izdavanje, Stan, 200m2 , Beograd', 2, 3000, '200', 0, 2, 0, 0, '0.0', '', '', 0, 1, '2017-06-15 11:03:47', 1),
(347833, 'Lux nov stan na Mirijevu!', 1, 43000, '51', 1.5, 2, 17, 324, '0.0', '<p>Zvezdara - Novo Mirijevo - Ljubiše Miodragovića. Nov, tek završen lux parket, tehnike moleraja, italijanska keramika. EG, 1. sprat od 3, klima, telefon, ktv, parking, terasa, interfon, internet. Retko u ponudi! Hitno!</p>', 'Ljubiše Miodragovića', 0, 1, '2017-05-08 13:54:19', 1),
(347832, 'Lux nov stan na Mirijevu!', 1, 43000, '51', 1.5, 2, 17, 324, '0.0', '<p>Zvezdara - Novo Mirijevo - Ljubiše Miodragovića. Nov, tek završen lux parket, tehnike moleraja, italijanska keramika. EG, 1. sprat od 3, klima, telefon, ktv, parking, terasa, interfon, internet. Retko u ponudi! Hitno!</p>', 'Ljubiše Miodragovića', 0, 1, '2017-05-08 13:54:21', 1),
(347831, '3333333', 1, 65340, '66', 0, 2, 14, 0, '0.0', '', '', 0, 1, '0000-00-00 00:00:00', 0),
(347830, '1233333', 1, 0, '0', 0, 12, 14, 0, '0.0', '', '', 0, 1, '0000-00-00 00:00:00', 0),
(347829, '12333', 1, 0, '33', 0, 1, 0, 0, '0.0', '', '', 1, 1400, '0000-00-00 00:00:00', 0),
(347828, '1', 1, 0, '213', 0, 1, 0, 0, '0.0', '', '', 0, 279, '0000-00-00 00:00:00', 0),
(347827, 'Izdavanje, Stan, 30m2 , Beograd', 2, 60000, '30', 0, 2, 0, 0, '0.0', '', '', 0, 1, '0000-00-00 00:00:00', 0),
(347826, 'asd', 3, 22, '33', 0, 1, 0, 0, '0.0', '', '', 0, 14, '0000-00-00 00:00:00', 0),
(347825, 'prodaja 4', 1, 52000, '220', 0, 1, 0, 0, '0.0', '', '', 0, 5, '0000-00-00 00:00:00', 0),
(347824, 'prodaja 3', 1, 15000, '15', 0, 6, 0, 0, '0.0', '', '', 0, 282, '0000-00-00 00:00:00', 0),
(347823, 'prodaja 2', 1, 39000, '65', 0, 1, 12, 181, '0.0', '', '', 0, 1, '0000-00-00 00:00:00', 0),
(347822, 'prodaja 1', 1, 120500, '200', 0, 2, 0, 0, '0.0', '', 'Vojvode Stepe', 0, 301, '0000-00-00 00:00:00', 0),
(347821, '68 m2 Stan kod Delmaxa - Jagodin mala', 1, 31000, '68', 1, 2, 824, 0, '0.0', '<p>Prodaje se stan u Jagodin Mali, iznad delmaxa, površine 68 m2. </p>', '', 0, 3, '0000-00-00 00:00:00', 0),
(347820, 'Nov brzo useljiv, moze kredit, povrat PDV-a!', 1, 52970, '69', 3.5, 2, 0, 0, '0.0', '<p>Nov troiposoban stan, Telep-Adice. Grejanje na toplotne pumpe, što znatno smanjuje troškove življenja. Uz stan se dobija gratis parking mesto. Povrat PDV-a. (Kodeks i Dunav Nekretnine-Đorđević Nekretnine DOO Novi Sad upisan u Reg. Pos. Broj 183)Zorica 0631326879</p>', '', 0, 2, '0000-00-00 00:00:00', 0),
(347819, 'Dorcol - Gundulicev venac  - 80m2', 1, 120000, '80', 3.5, 2, 12, 179, '0.0', '<p><strong>Agenc. provizija 2% </strong></p>\r\n<p><strong>Agent: Uroš Jovanović  069/ 581-55-56 br. licence 594</strong></p>\r\n<p>UKNJIŽEN, izvorno stanje, dvorišna zgrada, 3 spavaće, CG, nema lift. </p>\r\n<p><strong>Agent: Uroš Jovanović 069/581-55-56 </strong><strong>br. licence 594</strong></p>\r\n<p><strong><em> </em></strong></p>\r\n<p><strong><em>“Art nekretnine“ d. o. o. Beograd. </em></strong></p>\r\n<p><strong><em>Reg. br. 339. </em></strong></p>\r\n<p><strong><em>011/24-13-063</em></strong></p>\r\n<p><strong> </strong></p>\r\n<p> </p>', 'Gundulicev venac', 0, 1, '0000-00-00 00:00:00', 0),
(347818, 'LUX KUĆA BRANKO BIJEGOVIĆ 270 M2', 1, 80000, '270', 0, 1, 66, 0, '0.0', '<p>Hitno se prodaje kuća u naselju Branko Bijegović. Kuća je na 3 nivoa, površine 270 m2, na 2 ari placa. Papiri su sređeni. Hitno se prodaje zbog hipoteke. </p>', '', 0, 3, '0000-00-00 00:00:00', 0),
(347817, 'GRBAVICA-TROSOBAN STAN, LEPOG RASPOREDA ', 1, 83500, '73', 0, 2, 0, 0, '0.0', '<p>AGENCIJSKA OZNAKA STANA 1043735, NOVI SAD, GRBAVICA, 73M2, TROSOBAN STAN, PRVI SPRAT Oglašavamo prodaju odličnog trosobnog stana, 73m2. Starija gradnja, stan je u odličnom stanju, ima dve terase, dvostrano orijentisan. Cena odlična. Lokacija idealna. Kontakt 021/546-645, (House nekretnine, Novi Sad, Reg. br. 200). </p>', '', 0, 2, '0000-00-00 00:00:00', 0),
(347816, 'Zlatibor Kuca Plac 7 ari', 1, 550000, '380', 0, 1, 0, 0, '7.0', '<p>Plac pogodan za izgradnju stanova, apartmana... </p>\r\n<p>100 metara od centra</p>\r\n<p>Blizu buduce gondole</p>\r\n<p>Za vise informacija pozovite</p>', 'Obudovica', 0, 53, '0000-00-00 00:00:00', 0),
(347815, '3. 0 Stan na Bulevaru Nemanjića - povoljno [ VREDI POGLEDATI ]', 1, 47000, '70', 3, 2, 817, 0, '0.0', '<p>Prodaje se stan na Bulevaru Nemanjica, povrsine 70 m2. Po strukturi je trosoban + Podrum. Nalazi se na drugom spratu zgrade sa 2 lifta. Sastoji se od ulaznog hodnika, dnevne sobe sa trpezarijom, kuhinje, 2 spavace sobe i 2 terase. [ VREDI POGLEDATI ]</p>', '', 0, 3, '0000-00-00 00:00:00', 0),
(347814, 'TELEP-NOV JEDNOIPOSOBAN STAN, MOZE KREDIT ', 1, 39950, '41', 0, 2, 0, 0, '0.0', '<p>AGENCIJSKA OZNAKA STANA JE 1043622, NOVI SAD, TELEP, JEDNOIPOSOBAN, 41M2, TREĆI SPRAT. Stambeni objekat se nalazi u mirnom delu, slaba frekvencija saobraćaja, brzo useljiv. PVC profili…energetski efikasan objekat…kalorimetri, plaćanje grejanja prema utošku. Odličan raspored stana, sa blagim kosinama koje ne smanjuju prostor. Cena sa PDV-om. Mogućnost kupovine putem stambenog kredita. Kontakt osoba Svetlana, telefon 069/23-698-23, House nekretnine, Novi Sad, reg. br. 200</p>', '', 0, 2, '0000-00-00 00:00:00', 0),
(347813, 'LUX 2. 5, PANTELEJ, TA, PARKING MESTO. ', 1, 39000, '61', 2.5, 2, 835, 0, '0.0', '<p>Prodaje se stan na Panteleju povrsine 61m2, novije gradnje, nalazi se u blizini Pantelejske crkve, po strukturi je dvoiposoban. Nalazi se na prvom spratu. Sastoji se od ulaznog hodnika, dnevne sobe, kuhinje, spavace sobe, kupatila, terase Uz stan ide i parking mesto. VREDI POGLEDATI</p>', '', 0, 3, '0000-00-00 00:00:00', 0),
(347812, 'Kluz - Živka Davidovića 60kvm(L)', 2, 300, '60', 2.5, 2, 17, 334, '0.0', '<p>Novogradnja iz 2008. godine, stan od 60kvm, dvoiposoban po strukturi, na IV/IV sprata, lift, cg, telefon, ktv, internet, interfon, parket, pvc stolarija sa roletnama, klima, ostava, lođa, podrum, parking, video nadzor. Dvostran, u blizini TC "Aviv park", kompletno namešten, plaćanje na mesečnom nivou... </p>', 'Živka Davidovića', 0, 1, '0000-00-00 00:00:00', 0),
(347811, 'Nov, povoljno, moze kredit - direktno od investitora!', 1, 40400, '50', 3, 2, 0, 0, '0.0', '<p>Direktno od investitora, bez agencijske provizije!!! Odličan, funkcionalan, trosoban stan u urbanoj vili. Idealan za porodične ljude!!!U blizini je osnovna škola, vrtić, gradski prevoz, sportski centar. Grejanje je na toplotne pumpe, što znatno smanjuje troškove čna oprema, Obezbeđeno parking mesta uz stan !!! Uredna dokumentacija, knjiženje 1/1, moguć povrat PDV-a Agencijska šifra: 1035040 (Kodeks i Dunav Nekretnine-Đorđević Nekretnine DOO Novi Sad upisan u Reg. Pos. Broj 183)Zorica 0631326879</p>', '', 0, 2, '0000-00-00 00:00:00', 0),
(347810, 'Nov 1. 5 Stan u Jagodin mali', 1, 38000, '48', 1.5, 2, 824, 0, '0.0', '<p>Prodaju se 2 stana u novogradnji, kod Idee u Jagodin mali, povrsine 48 m2. Po strukturi su jednoiposobni. Nalaze se na prvom i trecem spratu zgrade. Sastoje se od ulaznog hodnika, dnevne sobe sa kuhinjom, spavace sobe, kupatila i terase. Za ozbiljne kupce moguća korekcija cene. Moguca kupovina na kredit. [ VREDI POGLEDATI ]</p>', '', 0, 3, '0000-00-00 00:00:00', 0),
(347809, 'STANICA, GARSONJERA NA ODLICNOJ LOKACIJI ', 1, 23700, '22', 0, 2, 0, 0, '0.0', '<p>AGENCIJSKA OZNAKA STANA 1043718, Stanica. Oglasavamo prodaju garsonjere na dobroj lokaciji, blizina stanice, bulevara, Sup-a. UKNJIZENA nekretnina, 22m2, IV sprat, ima terasu, dvorisno orjentisan u mirnom okruzenju. Kontakt Bojana 063/ 84 403 84(House nekretnine, Novi Sad, Reg. br. 200)</p>', '', 0, 2, '0000-00-00 00:00:00', 0),
(347808, '1. 5 na Paliluli ( povraćaj PDV-a )', 1, 25000, '36', 1.5, 2, 834, 0, '0.0', '<p>Prodaje se stan u novogradnji, u blizini hotela Aleksandar. povrsine 36 m2. Po strukturi je jednoiposoban. Nalazi se u visokom prizemlju zgrade. Sastoji se od ulaznog hodnika, dnevne sobe sa kuhinjom, spavace sobe i kupatila. Struja pojacana na 25A sa programerima za automatsko podesavanje. [ VREDI POGLEDATI ]</p>', '', 0, 3, '0000-00-00 00:00:00', 0),
(347807, ' Višenamjenski poslovni prostor Stup Tibra 2', 1, 29897, '31', 1, 3, 34483, 0, '0.0', '<p align="center">Agencija za nekretnine Vaša 4zida nekretnine</p>\r\n<p align="center">ID broj <strong>100448</strong></p>\r\n<p align="center">Kontakt: 062550024</p>\r\n<p align="center">Kontakt: 033862777</p>\r\n<p align="center">E-mail: info@4zida. ba</p>\r\n<p align="center">Web: www. 4zida. ba</p>\r\n<p align="center">Želite saznati više o ovoj nekretnini? Za više fotografija i dodatne informacije posjetite:</p>\r\n<p align="center">4zida. ba/poslovni-prostor/visenamjenski-poslovni-prostor-stup-tibra-2</p>\r\n<p align="center"><strong>OPIS:</strong></p>\r\n<p align="center">Poslovni prostor se nalazi u Sarajevu, opština Ilidža, naselje stup, Tibra 2. </p>\r\n<p align="center">Višenamjenski, jednoetažni poslovni prostor ukupne površine 31 m2 pozicioniran je na prizemlju stambeno-poslovne zgrade od trinaest spratova u novogradnji. </p>\r\n<p align="center">Sastoji se od jedne prostorije, čajne kuhinje i WC-a. </p>\r\n<p align="center">Vanjska i unutrašnja stolarija je aluminijska, na podu postavljene pločice. </p>\r\n<p align="center">Na uzlazu su postavljena rolo vrata na daljinsko upravljanje. </p>\r\n<p align="center">Na predmetni poslovni prostor se plaća 5% poreza na promet nekretninama. </p>', '100448', 3, 3084, '0000-00-00 00:00:00', 0),
(347806, 'STRAHINJIĆA BANA, 4. 0, 120m2 - LUX - NOVO - SAM NA SPRATU - DORĆOL !!', 2, 1050, '120', 4, 2, 12, 196, '0.0', '<p>KOMPLETNO NAMEŠTEN KLIMATIZOVAN STAN U NOVOJ ZGRADI SA NOVIM NAMEŠTAJEM .... </p><p>LUX, nov, sam na spratu, 2 ulaza, 2 terase, 3 mokra čvora, 2 klime, roletne na daljinski. </p><p>Full, moderno namešten, klavir, pogled na Kalemegdan, 2 mirne spavaće celine, svaka sa kupatilom, salon na SB, interfon, internet, lift, SBB, parking 2 zona. </p>', 'STRAHINJIĆA BANA', 0, 1, '0000-00-00 00:00:00', 0),
(347805, 'DURMITORSKA, 4. 0, 92m2 - LUX - NOVO + GARAŽA !!', 2, 1200, '92', 4, 2, 10, 226, '0.0', '<p>KOMPLETNO NAMEŠTEN KLIMATIZOVAN STAN U NOVOJ ZGRADI SA NOVIM NAMEŠTAJEM I GARAŽOM ... </p><p>Luksuzan stan, nova zgrada, u mirnoj ulici sa drvoredom, u izuzetno kvalitetno urađenoj zgradi. </p><p>Stan se nalazi na drugom spratu do koga se dolazi modernim hidrauličnim liftom. </p><p>Iza sigurnosnih vrata nalazi se antre i hodnik iz koga se ulazi u 2 spavaće sobe i ekstremno veliku dnevnu sobu sa dvoja vrata (postoji mogućnost podele na 2 funkcionalne sobe), 2 kompletna kupatila (prvo sa tus/đakuzi kabinom a drugo sa klasičnom kadom), moderna kuhinja sa šankom i trpezarija sa stolom za 6 osoba. </p><p>Mnoštvo extra detalja u enterijeru (mermer, granit, gipsani elementi... ) </p><p>Pvc stolarija u celom stanu i na zastakljenoj terasi. Centralno grejanje i klima inverter uređaji u svim sobama. </p><p>Američki plakari u svim sobama, hrastov parket, granit u kuhinji. </p><p>Prozračan, svetao stan, miran komšiluk, u blizini doma zdravlja, apoteka, supermarketa, škola, obdaništa.... </p><p>Mogućnost  garaže u zgradi (extra).. </p>', 'DURMITORSKA', 0, 1, '0000-00-00 00:00:00', 0),
(347804, 'DURMITORSKA, 4. 0, 92m2 - LUX - NOVO + GARAŽA  - UKNJIŽEN !!', 1, 179500, '92', 4, 2, 10, 226, '0.0', '<p>Luksuzan stan, nova zgrada, u mirnoj ulici sa drvoredom, u izuzetno kvalitetno urađenoj zgradi, vlasništvo 1/1. </p><p>Stan se nalazi na drugom spratu do koga se dolazi modernim hidrauličnim liftom. </p><p>Iza sigurnosnih vrata nalazi se antre i hodnik iz koga se ulazi u 2 spavaće sobe i ekstremno veliku dnevnu sobu sa dvoja vrata (postoji mogućnost podele na 2 funkcionalne sobe), 2 kompletna kupatila (prvo sa tus/đakuzi kabinom a drugo sa klasičnom kadom), moderna kuhinja sa šankom i trpezarija sa stolom za 6 osoba. </p><p>Mnoštvo extra detalja u enterijeru (mermer, granit, gipsani elementi... ) </p><p>Pvc stolarija u celom stanu i na zastakljenoj terasi. Centralno grejanje i klima inverter uređaji u svim sobama. </p><p>Američki plakari u svim sobama, hrastov parket, granit u kuhinji. </p><p>Prozračan, svetao stan, miran komšiluk, u blizini doma zdravlja, apoteka, supermarketa, škola, obdaništa.... </p><p>Mogućnost kupovine garaže u zgradi (extra).. </p>', 'DURMITORSKA', 0, 1, '0000-00-00 00:00:00', 0),
(347803, 'Nov, brzo useljiv direktno od investitora!', 1, 50650, '63', 4, 2, 0, 0, '0.0', '<p>Direktno od investitora, bez agencijske provizije!!! Odličan, funkcionalan četvorosoban stan stan u urbanoj vili. Idealan za porodične ljude!!!U blizini je osnovna škola, vrtić, gradski prevoz, sportski centar. Grejanje je na toplotne pumpe, što znatno smanjuje troškove čna oprema, Obezbeđeno parking mesta uz stan !!! Uredna dokumentacija, knjiženje 1/1, moguć povrat PDV-a Agencijska šifra:1035053(Kodeks i Dunav Nekretnine-Đorđević Nekretnine DOO Novi Sad upisan u Reg. Pos. Broj 183)Zorica 0631326879</p>', '', 0, 2, '0000-00-00 00:00:00', 0),
(347802, 'Batajnica, Šangajska, 126m2, 62000', 1, 62000, '126', 6, 1, 16, 283, '4.0', '\r\n\r\n\r\nSTART-SMART prodaje: kuća se nalazi na 4 ara placa+pomoćna prostorija 30m2+pušnica za dimljenje mesa. Grejanje na struju-cg, mogućnost grejanja i na čvrsta goriva. Blizina prevoza i prodavnica. Agencijska provizija 2%. \r\n\r\n\r\n', 'Šangajska', 0, 1, '0000-00-00 00:00:00', 0),
(347801, 'Lux 76 m2 stan kod doma zdravlja EG', 1, 64000, '76', 2, 2, 846, 0, '0.0', '<p>Prodaje se lux komforan stan novije gradnje kod doma zdravlja, površine 76 m2, po strukturi je dvosoban. Grejanje je etažno. Nalazi se na drugom spratu zgrade. Sastoji se od: ulaznog hodnika, velike dnevne sobe, kuhinje sa trpezarijom, spavaće sobe, kupatila i wc-a. U stanu ostaje kuhinja bez tehnike, šank, 2 američka plakara. Uknjizen, uredna dokumentacija. VREDI POGLEDATI. Mogućnost kupovine istog stana u potkrovlju iste zgrade, 70 mr2, cena 53000 eur. </p>', '', 0, 3, '0000-00-00 00:00:00', 0),
(347800, 'GRBAVICA-ODLICAN DVOSOBAN STAN, ULICNO ORIJENTISAN ', 1, 48400, '44', 0, 2, 0, 0, '0.0', '<p>AGENCIJSKA OZNAKA STANA 1043476 Novi Sad, Grbavica. Oglasavamo prodaju dvosobnog stana na grbavici u novijoj zgradi na drugom spratu. Iz hodnika se ulazi u svaku prostoriju, kuhinja ima prorodnu ventilaciju, ulicno orjentisan. Kontakt Bojana 063/ 84 403 84(House nekretnine, Novi Sad, Reg. br. 200)</p>', '', 0, 2, '0000-00-00 00:00:00', 0),
(347799, 'DETELINARA, ODLICAN DVOSOBAN STAN, RENOVIRAN ', 1, 37400, '47', 0, 2, 0, 0, '0.0', '<p>Agencijska oznaka 1042940. Odlican dvosoban stan u ulici Konelija Stankovica. Stan je renoviran (kupatilo , podovi , sve osvezeno), uknjizen . Orjentisan je ka dvoristu, mirna strana , sa pogledom na zelenilo. Iza objekta ima parking. Oko cene ima dogovorea . Vise informacija na 064/170-9-174 MILA (House nekretnine, Novi Sad, Reg. br. 200)</p>', '', 0, 2, '0000-00-00 00:00:00', 0),
(347798, 'Odlicanj manji dvosoban stan u samom centru grada!', 2, 130, '40', 2, 2, 71, 0, '0.0', '<p>Izdaje se odlican manji stan u samom centru grada u jako mirnoj ulici na svega dva minuta od same pesacke zone. </p>\r\n<p>Stan se nalazi u stambenoj zgradi na II-spratu bez lifta, povrsine od 40m2 sa cg-grejanjem. </p>\r\n<p>Sastoji se od jedne dnevne sobe sa trpezarijom, spavace sobe, kuhinje, hodnika, kupatila i terase. </p>\r\n<p>Stan se izdaje namesten i poseduje sve od tehnike!</p>\r\n<p>Izdaje se iskljucivo na duzi vremenski period ozbiljnim zakupcima!</p>\r\n<p>Za više informacija slobodno pozovite: 060/054-44-01 - www. izdavanjestanovanis. rs Ps. Ovo je samo deo naše ponude, više možete pogledati na sajtu: www. bulevarnekretnine. rs, možete nas kontaktirati i putem e-maila info@bulevarnekretnine. rs. Radno vreme agencije je: 09-19h radnim danima I subotom, nedeljom ne radimo. Čekamo vas, agencija Bulevar Nekretnine Niš Reg. Br. 519, usluga besplatna</p>', 'Ucitelj Tasina', 0, 3, '0000-00-00 00:00:00', 0),
(347797, 'Novi Beograd - Tosin bunar - 75m2', 1, 65000, '75', 2.5, 2, 6, 111, '0.0', '<p><strong>Agenc. provizija 2% </strong></p>\r\n<p><strong>Agent: Uroš Jovanović  069/ 581-55-56 br. licence 594</strong></p>\r\n<p>UKNJIŽEN, odličan, 2 spavaće, galerija 25m2 – dečija soba, kod ulice Prilaz, bez ulaganja, EG, nema lođu, nema lift. </p>\r\n<p><strong>Agent: Uroš Jovanović 069/581-55-56 </strong><strong>br. licence 594</strong></p>\r\n<p><strong><em> </em></strong></p>\r\n<p><strong><em>“Art nekretnine“ d. o. o. Beograd. </em></strong></p>\r\n<p><strong><em>Reg. br. 339. </em></strong></p>\r\n<p><strong><em>011/24-13-063</em></strong></p>\r\n<p><strong> </strong></p>', 'Tošin bunar', 0, 1, '0000-00-00 00:00:00', 0),
(347796, ' Trosoban stan prodaja Alipašino', 1, 46340, '67', 3, 2, 34484, 0, '0.0', '<p align="center">Agencija za nekretnine Vaša 4zida nekretnine</p>\r\n<p align="center">ID broj <strong>100244</strong></p>\r\n<p align="center">Kontakt: 062550024</p>\r\n<p align="center">Kontakt: 033862777</p>\r\n<p align="center">E-mail: info@4zida. ba</p>\r\n<p align="center">Web: www. 4zida. ba</p>\r\n<p align="center">Želite saznati više o ovoj nekretnini? Za više fotografija i dodatne informacije posjetite:</p>\r\n<p align="center">4zida. ba/stan/trosoban-stan-prodaja-alipasino</p>\r\n<p align="center"><strong>OPIS:</strong></p>\r\n<p align="center">Stan se nalazi u Sarajevu, opština Novi Grad, naselje Alipašino Polje. </p>\r\n<p align="center">Trosoban, ukupne površine  ZK 67 m2, stvarna 71, 70 m2 pozicioniran je na jedanaestom spratu stambene zgrade sa dva lifta i ukupno četranest spratova. </p>\r\n<p align="center">Sastoji se od ulaznog hodnika, dnevnog boravka, izdvojene kuhinje sa trpezarijom i lodžom, dvije spavaće sobe i kupatila. </p>\r\n<p align="center">Vanjska i unutrašnja stolarija je drvena, na podovima je postavljen parket. </p>\r\n<p align="center">Na predmetni stan se plaća 5% poreza na promet nekretninama. </p>', '100244', 3, 3084, '0000-00-00 00:00:00', 0),
(347795, 'Odlican, povoljno, nov moze kredit!', 1, 31550, '38', 1.5, 2, 0, 0, '0.0', '<p>Jednoiposoban stan 39m2 sa povratom PDV-a. Rok za useljenje je April 2017. Grejanje je na toplotne pumpe (princip voda vazduh) sto znatno smanjuje troskove. Stan poseduje svoje parking mesto. KNJIZENJE 1/1 !!!(Kodeks i Dunav Nekretnine-Đorđević Nekretnine DOO Novi Sad upisan u Reg. Pos. Broj 183)Zorica 0631326879</p>', '', 0, 2, '0000-00-00 00:00:00', 0),
(347794, '2. 5 PRELEP NOV LUX STAN U CENTRU. ', 2, 400, '70', 2.5, 2, 71, 0, '0.0', '<p>Izdaje se luksuzan stan u centru grada ul. Jovana Skerlića. Stan se nalazi na III-spratu nove stambene zgrade, površine od 72m2. Poseduje spavaću sobu sa  francuskim ležajem, veliki dnevni boravak sa kuhinjom i trpezarijom, hodnik, kupatilo i još jednu manju spavaću sobu. Sve je stvar dogovora. Kompleto je opremljen novim nameštajem kao i tehnikom!.   Za više informacija slobodno nazovite: 060/054-44-74. Ps. Ovo je samo deo naše ponude, više možete pogledati na sajtu: www. bulevarnekretnine. rs, možete nas kontaktirati i putem e-maila info@bulevarnekretnine. rs. Radno vreme agencije je: 09-19h radnim danima I subotom, nedeljom ne radimo. Čekamo vas, agencija Bulevar Nekretnine Niš.   reg. br. 519. usluge su besplatne. </p>', 'Jovana Skerlića', 0, 3, '0000-00-00 00:00:00', 0),
(347793, 'KLISA-ODLICNA HALA, SLEPERSKI PRILAZ ', 2, 1600, '950', 0, 9, 0, 0, '0.0', '<p>Agencijska oznaka objekta je 9101907, Novi Sad, Klisa, INDUSTRIJSKA ZONA, oglašavamo izdavanje hale površine 950 m2, u sklopu hale kancelarijski prostor od 100 m2, na ograđenoj parceli površine 2500 m2, šleperski prilaz, visina 6-8 m. Kontakt osoba Ružica 061/172 65 22 ili 021/546-645, 021/546-282, (House nekretnine, Novi Sad, Reg. br. 200)</p>', '', 0, 2, '0000-00-00 00:00:00', 0),
(347792, 'Nov dvoiposban stan sa povratom PDV-a!!!', 1, 61500, '54', 2.5, 2, 871, 0, '0.0', '\r\n\r\n\r\n\r\nNov dvoiposoban stan kod Somborskog Bulevara i Bulevara Evrope, izgradnja sa pdv-om. , (Kodeks i Dunav Nekretnine-Đorđević Nekretnine DOO Novi Sad upisan u Reg. Pos. Broj 183)\r\n\r\n\r\n\r\n\r\n<p>Tel: (+381 21) 42-60-10, 42-60-20, 065/8118-018 i 065/8118-019</p>', '', 0, 2, '0000-00-00 00:00:00', 0),
(347791, 'SOMBORSKI BULEVAR, LEP ULICNI LOKAL, POVOLJNO ', 1, 18600, '24', 0, 9, 0, 0, '0.0', '<p>Agencijska oznaka lokala je 8090968, Novi Sad, Somborski Bulevar, izuzetno povoljno prodajemo lep ulični lokal površine 23 m2, sanitarni čvor je u suterenu, gleda na Somborski Bulevar, kontakt osoba Ružica 061/172 65 22 (House nekretnine, Novi Sad, Reg. br. 200)</p>', '', 0, 2, '0000-00-00 00:00:00', 0),
(347790, 'Izdavanje, Stan, 79m2 , Profesorska Kolonija', 2, 550, '79', 2.5, 2, 8, 145, '0.0', '<p>Izdaje se lux 3. 0 stan u kvalitetnoj novogradnji sa termo i zvucnom izolacijom.  Stan je kompletno opremljen novim i modernim namestajem i opremom. Klimatizovan, centralno grejanje, interfon, lift, terasa. </p>', '', 0, 1, '0000-00-00 00:00:00', 0),
(347789, 'NOVA DETELINARA-JEDNOIPOSOBAN STAN, POVOLJNO, POVRAT PDV-A ', 1, 47900, '41', 0, 2, 0, 0, '0.0', '<p>Agencijska oznaka nekretnine je 1043634. Novi Sad, Nova Detelinara. Oglasavamo prodaju optimalnog jednoiposobnog stana idealnog rasporeda i povrsine cca 41m2. I sprat, zgrada poseduje lift. Spavaca soba preko 9m2, sirine 2. 2m. optimalna terasa 2. 6m2. bez izgubljenog prostora. Orijentisan ka svetloj suncanoj strani – jug. Oprema - kupatilske sanitarije I klase, unutrašnja stolarija – medijapan, sigurnosna ulazna vrata, stolarija – petokomorni PVC profili…energetski efikasan objekat… … placanje grejanja prema utrosku. Moze kupovina na kredit, mogucnost povrata PDV-a. Kompletna ponuda stanova na www. house-nekretnine. com (House nekretnine, Novi Sad, Reg. br. 200) kontakt osoba Sasa 064/820-7228</p>', '', 0, 2, '0000-00-00 00:00:00', 0),
(347788, 'Odličan održavan dvosoban stan na Grbavici!!!', 1, 71070, '53', 2, 2, 113, 0, '0.0', '\r\n\r\n\r\n\r\nOdličan dvosoban stan na top lokaciji, dobro održavan, blizina škole, vrtića, supermarketa. U cenu je uračunata i garaža. Agencijska šifra stana je 1036695(Kodeks i Dunav Nekretnine-Đorđević Nekretnine DOO Novi Sad upisan u Reg. Pos. Broj 183)\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nTel: (+381 21) 42-60-10, 42-60-20, 065/8118-018 i 065/8118-019\r\n\r\n\r\n\r\n\r\n<p> </p>', '', 0, 2, '0000-00-00 00:00:00', 0),
(347787, 'PODBARA-ODLICNA GARSONJERA, KVALITETNA GRADNJA, LEPOG RASPOREDA ', 1, 37000, '28', 0, 2, 0, 0, '0.0', '<p>AGENCIJSKA OZNAKA STANA 1043307, PODBARA, NOVI SAD. Oglašavamo prodaju odlične garsonjere u novoj zgradi. Objekat je u izgradnji. Stan se nalazi na visokom prizemlju, dvorišno je orijentisan i iz njega se pruža pogled na dvorište objekta koje je ograđeno, osvetljeno, pokriveno kamerama, lepo uređeno i pristup imaju samo stanari zgrade.   Kuhinja I kupatilo sa prirodnom ventilacijom. U stanu će biti sigurnosna vrata, hrastova parket, PVC stolarija, Plaćanje po utrošku I podešavanje temperature. Ulazi pokriveni kamerama. Useljenje u prvoj polovini 2018. godine. Kontakt osoba Dragana 064/540-73-89. (House nekretnine, Novi Sad, Br. Reg. 200)</p>', '', 0, 2, '0000-00-00 00:00:00', 0),
(347786, '1. 0 40m2+T Slavija - Deligradska', 2, 300, '40', 1, 2, 15, 4, '0.0', '<p>Stan apartmanskog tipa, opremljena kuhinja sa prozorom, odlično kupatilo, kombinovana soba sa izlaskom na terasu. Dvorišno orijentisan, odlična infrastruktura, blizina Kliničkog centra, ambasada... Cena 300evra+ depozit. AGENCIJSKA PROVIZIJA 50% OD MESEČNE CENE ZAKUPA. </p>', 'Deligradska', 0, 1, '0000-00-00 00:00:00', 0),
(347785, 'PODBARA-TROSOBAN STAN, ODLICNA CENA, MOZE KREDIT ', 1, 72200, '56', 0, 2, 0, 0, '0.0', '<p>AGENCIJSKA OZNAKA STANA JE 1043602, NOVI SAD, PODBARA, TROSOBAN, 56M2, CETVRTI SPRAT. Stan je u izgradnji, sa rokom useljenja do kraja juna. Objekat se nalazi u mirnom kvartu grada, a u neposrednoj blizini samog centra. Blizina Temerinske ulice daje mu dobru vezu sa ostalim delovima grada. Takođe blizina Riblje pijace je jedan od važnih faktora za snabdevanje stanara životnim namirnicama. Objekat je vrhunskog kvaliteta, fasadna stolarija je PVC-e, unutrašnja drvena. Plaćene komunalije u celosti, papiri uredni. Postoji mogućnost kupovine putem kredita. Odlična cena, u koju je uračunat PDV-e. Mogućnost kupovine putem stambenog kredita. Kontakt osoba Svetlana, telefon 069/23-698-23, House nekretnine, Novi Sad, reg. br. 200</p>', '', 0, 2, '0000-00-00 00:00:00', 0),
(347784, 'PODBARA-TROSOBAN STAN, ODLICNA CENA, MOZE KREDIT ', 1, 72200, '56', 0, 2, 0, 0, '0.0', '<p>AGENCIJSKA OZNAKA STANA JE 1043602, NOVI SAD, PODBARA, TROSOBAN, 56M2, CETVRTI SPRAT. Stan je u izgradnji, sa rokom useljenja do kraja juna. Objekat se nalazi u mirnom kvartu grada, a u neposrednoj blizini samog centra. Blizina Temerinske ulice daje mu dobru vezu sa ostalim delovima grada. Takođe blizina Riblje pijace je jedan od važnih faktora za snabdevanje stanara životnim namirnicama. Objekat je vrhunskog kvaliteta, fasadna stolarija je PVC-e, unutrašnja drvena. Plaćene komunalije u celosti, papiri uredni. Postoji mogućnost kupovine putem kredita. Odlična cena, u koju je uračunat PDV-e. Mogućnost kupovine putem stambenog kredita. Kontakt osoba Svetlana, telefon 069/23-698-23, House nekretnine, Novi Sad, reg. br. 200</p>', '', 0, 2, '0000-00-00 00:00:00', 0),
(347783, '3. 5 PARK SVETOG SAVE, IV SPRAT, DVE TERASE							 							', 1, 65000, '86', 3.5, 2, 815, 0, '0.0', '  \r\n\r\n\r\nNa prodaju troiposoban stan kod Parka Svetog Save I Zone 1,   na IV spratu.  \r\n\r\n\r\nStan je po strukturi troiposoban,   površine 86m2, sastoji se od hodnika, kupatila, toaleta, dnevne sobe, trpezarije, kuhinje , tri spavaće sobe i dve terase. Nalazi se na IV spratu u zgradi sa liftom. \r\n\r\n\r\nStan je u izvornom stanju, ali dobro očuvan, parket i stolarija vrlo korektni tako da ne zahteva nikakva urgentna ulaganja. Sve sobe su odlične veličine. Kupatilo i toalet su odvojeni.  \r\n\r\n\r\nCena stana je 65. 000 EUR. uknjiženje stana je u toku. Za više informacija javite se na telefon: 060/054-44-18\r\n\r\n\r\nOvo je samo deo naše ponude, ovaj kao i druge stanove sa  većim brojem fotografija možete pogledati na našem sajtu: bulevarnekretnine. rs, kontakt: info@bulevarnekretnine. rs, čekamo Vas, Agencija Bulevar Nekretnine, reg. br. 519, usluga besplatna!\r\n\r\n\r\n', 'Vizantijski Bulevar', 0, 3, '0000-00-00 00:00:00', 0),
(347782, 'nov trosoban sa povratom PDV-a', 1, 64540, '57', 3, 2, 0, 0, '0.0', '<p>Zgrada vrhunskog kvaliteta rađenja po svetskim standardima na atraktivnoj lokaciji, blizu škole i vrtića, cena je sa pdv-om, (Kodeks i Dunav Nekretnine-Đorđević Nekretnine DOO Novi Sad upisan u Reg. Pos. Broj 183)</p>\r\n<p> </p>\r\n<strong>Poslovni telefon:021/426-010, 021/426-020</strong>\r\n<strong>Mobilni telefon:0658118018, 0658118019</strong>', '', 0, 2, '0000-00-00 00:00:00', 0),
(347781, 'LIMAN I-ODLICAN KVALITETAN LOKAL,  ZA VISE DELATNOSTI', 2, 1500, '96', 0, 9, 0, 0, '0.0', '<p>Agencijska oznaka lokala je 9105833, Novi Sad, Liman I. Izdajemo potpuno renoviran ulični lokal u prizemlju stambene zgrade, površine 96m2, trostrano orijentisan, na uglu, širok front na dve ulice. Centralno grejanje. Idealno za prodavnicu ili ugostiteljstvo i druge delatnosti Ima dva ulaza. Odmah useljiv. Kontakt 061/172 65 22 ili 021/546 645 i 021/546 282(House nekretnine, Novi Sad, Reg. br. 200)</p>\r\n<p> </p>', '', 0, 2, '0000-00-00 00:00:00', 0),
(347780, 'PODBARA-POSLOVNI OBJEKAT, U TRI NIVOA, UKNJIZEN ', 1, 990000, '1400', 0, 9, 0, 0, '0.0', '<p>Agencijska oznaka objekta je 8091195, Novi Sad, Podbara-blizina centra, oglašavamo prodaju poslovnog objekta u tri nivoa trenutno u funkciji prodajnog salona, površine 1400 m2, u sklopu objekta je i izložbeni salon , kancelarijski prostor, uknjižen, vlasništvo 1/1. idealan za veće kompanije, predstavništva i dr. Kontakt osoba Ružica 061/172 65 22, 021/546-645, 021/546-282(House nekretnine, Novi Sad, Reg. br. 200)</p>', '', 0, 2, '0000-00-00 00:00:00', 0),
(347779, 'NOVA DETELINARA-ODLICAN, LEPO ODRZAVAN CETVOROSOBAN STAN ', 1, 74200, '90', 0, 2, 0, 0, '0.0', '<p>AGENCIJSKA OZNAKA STANA 1043473, Novi Sad, Nova Detelinara. Oglasavamo prodaju cetvoroiposobnog, UKNJIZENOG, dupleksa na Novoj Detelinari. U donjoj etazi je kuhinja, dnevna soba, toalet i jos jedna soba a na gornjoj su tri sobe i kupatilo. U dvoristu zgrade postoje parking mesta za stanare. Lepo odrzavan stan, bez ulaganja! Kontakt Bojana 063/ 84 403 84(House nekretnine, Novi Sad, Reg. br. 200)</p>', '', 0, 2, '0000-00-00 00:00:00', 0),
(347778, 'Poljoprivredno zemljiste u Vojvodini u Backoj', 1, 10000, '0', 0, 5, 0, 0, '0.0', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nVrsta nekretnine\r\nPoljoprivredno Zemljište\r\n\r\n\r\nPovršina\r\n2. 9 ha\r\n\r\n\r\nVlasništvo\r\nuknjiženo 1/1\r\n\r\n\r\n\r\n\r\n\r\n\r\nMesto\r\n \r\n\r\n\r\nLokacija\r\nSrbobran,  Vrbas\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nDodatne informacije\r\nNema dodatnih informacija\r\n\r\n\r\n<em><strong>Prodaja poljoprivrednog zemljišta u Vojvodini iz ponude Real House nekretnina. </strong></em>\r\n<p>U prilici smo da Vam ponudimo poljoprivredno zemljište u Vojvodini kao odličnu mogućnost za ulagenje novca. </p>\r\n<p>Raspolažemo sa dve lokacije:</p>\r\n<em><strong>Poljoprivredno zemljište u Vrbasu</strong></em>\r\n<em>Poljoprivredno zemljište u Vrbasu se nalazi na autoputu E 75 na oko 1km od motela Mandić u pravcu Novog Sada. Radi se o površini od 5 jutara (oko 2. 9 hektara). Poljoprivredno zemljište prve klase koje se obrađuje. Cena zemljišta je 50000€. </em>\r\n<strong><em>Poljoprivredno zemljište u Srbobranu</em></strong>\r\n<em>Poljoprivredno zemljište u Srbobranu se nalazi na putu prema Turiji uz asfaltni put, radi se o površini od 4 jutra u komadu (oko 2. 3 hektara). Poljoprivredno zemljište druge klase koje se obrađuje. Cena za 4 jutra zemlje je 40000€. </em>\r\n<p>Obe lokacije karateriše odličan prilaz i pristup, radi se o uređenom poljoprivrednom zemljištu. </p>\r\n<p>Imajući u vidu konstantnu potražnju za poljoprivrednim zemljištem i stalnim rastom cena ulaganjem u ovu vrstu nekretnina možete biti sigurni da radite dobar posao jer ulaganje u zemlju je najsigurnije ulaganje. </p>\r\n<p>Za sve dodatne informacije o prodaji ovog zemljišta kontaktirajte real House doo, licencirani posrednik za promet i zakup nepokretnosti reg. br, 177, </p>\r\n', '', 0, 277, '0000-00-00 00:00:00', 0),
(347777, 'CENTAR-LEP JEDNOIPOSOBAN STAN, LEPOG RASPOREDA, UKNJIZEN ', 1, 61800, '39', 0, 2, 0, 0, '0.0', '<p>AGENCIJKSA OZNAKA STANA 104366, Novi Sad, Centar. Oglasavamo prodaju odlicnog jednoiposobnog stana u centru grada, 39m2, UKNJIZEN, na petom spratu u zgradi novije kvalitetne gradnje, na atraktivnoj lokaciji! Stan se prodaje sa namestajem ili bez, po dogovoru!Kontak Bojana 063/ 84 403 84(House nekretnine, Novi Sad, Reg. br. 200)</p>', '', 0, 2, '0000-00-00 00:00:00', 0),
(347776, 'Povoljno jednosoban stan renoviran!', 1, 24720, '33', 1, 2, 0, 0, '0.0', '<p>Kompletno renoviran jednosoban stan, vredi pogledati, uknjiženo!!, (Kodeks i Dunav Nekretnine-Đorđević Nekretnine DOO Novi Sad upisan u Reg. Pos. Broj 183) Poslovni telefon:021/426-010, 021/426-020 Mobilni telefon:0658118018, 0658118019</p>', '', 0, 2, '0000-00-00 00:00:00', 0),
(347775, '3. 5 PARK SVETOG SAVE, VII SPRAT, DVE TERASE							 							', 1, 60000, '86', 3.5, 2, 815, 0, '0.0', '  \r\n\r\n\r\nNa prodaju troiposoban stan kod Parka Svetog Save I Zone 1,   na VII spratu.  \r\n\r\n\r\nStan je po strukturi troiposoban,   površine 86m2, sastoji se od hodnika, kupatila, toaleta, dnevne sobe, trpezarije, kuhinje , tri spavaće sobe i dve terase. Nalazi se na VII spratu u zgradi sa liftom. \r\n\r\n\r\nStan je u izvornom stanju, ali dobro očuvan, parket i stolarija vrlo korektni tako da ne zahteva nikakva urgentna ulaganja. Sve sobe su odlične veličine. Kupatilo i toalet su odvojeni.  \r\n\r\n\r\nCena stana je 60. 000 EUR. uknjiženje stana je u toku. Za više informacija javite se na telefon: 060/054-44-18\r\n\r\n\r\nOvo je samo deo naše ponude, ovaj kao i druge stanove sa  većim brojem fotografija možete pogledati na našem sajtu: bulevarnekretnine. rs, kontakt: info@bulevarnekretnine. rs, čekamo Vas, Agencija Bulevar Nekretnine, reg. br. 519, usluga besplatna!\r\n\r\n\r\n', 'Vizantijski Bulevar', 0, 3, '0000-00-00 00:00:00', 0),
(347774, 'Kod Aviv parka Zvezdara, Vladimira Gortana, 63m2, 1 sprat, trosoban, lift, uknjizen', 1, 78750, '63', 3, 2, 17, 328, '0.0', '<p>Stan od 63m2 u novijoj zgradi iz 2012 godine, 30 metara udaljen od Aviv soping centra na Konjarniku, 50 metara od Bulevara Kralja Aleksandra i okrenice tramvaja, na 1 spratu sa liftom, po strukturi trosoban, sa dve spavace sobe, ostavom, kupatilom, velikim dnevnim boravkom sa izlaskom na terasu, izdvojenom trepezarijom i kuhinjom sa prirodnom ventilacijom, iz stana se prostire pogled na soping centar Aviv, veoma svetao, visokog kvalitet gradnje, demit fasada 10cm, pvc stolarija sa roletnama, hrastov parket, italijanska keramika, kada, sigurnostna vrata, centralno grejanje po utrosku, klima, interfon, video nadzor, kablovska, interent</p>\r\n<p>061/617-0239</p>', 'Vladimira Gortana', 0, 1, '0000-00-00 00:00:00', 0),
(347773, 'Izdavanje Poslovnog prostora-Vracar, Hram Svetog Save', 2, 500, '130', 3, 3, 15, 8, '0.0', '<p>Odlican poslovni prostor na dva nivoa, opremljena kuhinja, parking mesto, mali troskovi. 069/3755500</p>', '', 0, 1, '0000-00-00 00:00:00', 0),
(347772, 'Trosoban stan na Bubnju - 33000 eura', 1, 33000, '44', 3, 2, 35, 0, '0.0', '<p>Dnevni boravak sa kuhinjom, dve spavaće sobe, kupatilo, podrum. </p>', '', 0, 4, '0000-00-00 00:00:00', 0),
(347771, 'Ulcinjska, Lion, Zvezdara, Beograd, 36m2', 1, 65000, '36', 1.5, 2, 17, 340, '0.0', '\r\n<p>Prodajemo odličan jednoiposoban stan sa garažnim mestom u novogradnji iz 2013. godine. Sastoji se od predsoblja, kuhinje, dnevnog boravka sa izlaskom na terasu, spavaće sobe, hodnika i kupatila. U stanu je oprema i materijali visokog kvaliteta, bukov parket, alu stolarija, video nadzor. Stan se prodaje kompletno namešten i garažno mesto je uračunato u cenu. Istočno je orijentisan, okrenut ka lepo uređenom dvorištu(ne postoji mogućnost izgradnje zgrade u blizini koja bi zaklonila pogled ili svetlost). Stan se prodaje sa svim ugradnim ormarima od punog drveta i kuhinjom.   Stan nije uknjižen. </p>\r\n', 'Ulcinjska, Lion, Zvezdara, Beograd', 0, 1, '0000-00-00 00:00:00', 0),
(347770, 'Novi Sad, Novo naselje, dvoiposoban, 72 m2', 1, 66800, '72', 2.5, 2, 125, 0, '0.0', '<p>Šifra stana je 1032030, Novi Sad, Novo naselje, dvoiposoban, 72 m2. Oglašavamo prodaju prelepog dvoiposobnog stana na Šonsiju u zgradi od crvene fasadne cigle. Objekat je useljen 1991. godine, stan je dobro održavan i ne zahteva velikih ulaganja. Prostor je vrlo dobro projektovan, tako da se u sve prostorije ulazi iz predsoblja. Vrlo lako se može dobiti još jedna soba, pregrađivanjem trpezarije. </p>\r\n<p>Za više informacija pozovite. Kontakt: Vujadin, tel/viber: 064/941-00-75, licenca br. 1887 (Solis nekretnine, Novi Sad, upisan u Registar posrednika br. 544, tel: 021/520-231)</p>', '', 0, 2, '0000-00-00 00:00:00', 0),
(347769, 'POPOVICA vikendica 60m Artiljevio plac 1600m pogled NS', 1, 37000, '60', 2, 6, 140, 0, '1600.0', 'Popovica- Artiljevo VIKENDICA 60m plac 1600m pogled na NS\r\n\r\n\r\n\r\nLokacija:\r\nPopovica (Srbija, Novi Sad, Sremska Kamenica)\r\n\r\n\r\nKvadratura:\r\n60m2\r\n\r\n\r\nPovršina zemljišta:\r\n1600m2\r\n\r\n\r\nUlica i broj:\r\nPopovica - Artiljevo\r\n\r\n\r\nBroj soba:\r\n2 sobe\r\n\r\n\r\nSpratnost:\r\nJedan sprat\r\n\r\n\r\nGrejanje:\r\nKombinovano\r\n\r\n\r\nVlasništvo:\r\nUknjižen\r\n\r\n\r\n\r\nDodatne informacije\r\n<p>Terasa, Podrum, ostava, Tavan, Pogled na grad, Pogled na planinu</p>\r\nTekst oglasa\r\n<p>063518546  prodaje se odlična vikendica na Fruškoj gori, na Popovici- Artiljevo , površine 60m, dvosobna , plac 1600m, ograđen, sa fenomenalnim pogledom na Novi Sad, dosta zelenila, ima struju, voda sa hidroforom iz bunara . .. cena  37000 e . . sve je uknjiženo. Odmah useljivo, + VINOGRAD  U PUNOM RODU , NA SUNČANOJ PADINI, DOSTA BOROVA . . .. </p>', 'Popovica -ARTILJEVO', 0, 2, '0000-00-00 00:00:00', 0),
(347768, 'JEDNOIPOSOBAN 38m FUTOŠKI PUT IV sp useljiv uknjižen', 1, 30400, '38', 1.5, 2, 125, 0, '0.0', 'Novi Sad, Futoški put Jednoiposoban 38m IV sp useljiv uknjižen\r\n\r\n\r\n\r\nLokacija:\r\nNovo naselje (Srbija, Novi Sad, Novi Sad)\r\n\r\n\r\nKvadratura:\r\n38m2\r\n\r\n\r\nSobnost:\r\nJednoiposoban\r\n\r\n\r\nUlica i broj:\r\nFutoški put\r\n\r\n\r\nGrejanje:\r\nGradsko\r\n\r\n\r\nNivo u zgradi:\r\n4. sprat\r\n\r\n\r\nVlasništvo:\r\nUknjižen\r\n\r\n\r\n\r\nDodatne informacije\r\n<p>Terasa, Podrum, ostava, Internet, Telefon, Satelitska, kablovska TV</p>\r\nTekst oglasa\r\n<p>063518546  Ekskluzivna prodaja .. . . jednoiposoban stan 38m na IV spratu bez lifta, sa malom terasom, odvojenom kuhinjom, ulica Futoški put, novije zgrade  , stan je prazan, odmah useljiv . . cena  800 eura/m</p>', 'Futoški put', 0, 2, '0000-00-00 00:00:00', 0),
(347767, 'Trosoban stan na Podbari, u novogradnji, cena sa pravom na povrat pdv-a!', 1, 65170, '53', 3, 2, 129, 0, '0.0', '<p>Nov trosoban stan u širem centru grada, sa povratom pdv-a. , (Kodeks i Dunav Nekretnine-Đorđević Nekretnine DOO Novi Sad upisan u Reg. Pos. Broj 183)</p>\r\n<p>Tel: (+381 21) 42-60-10, 42-60-20, 065/8118-018 i 065/8118-019</p>', '', 0, 2, '0000-00-00 00:00:00', 0),
(347766, 'HITNO, Novi Sad, trosoban stan 89m2 ', 1, 63900, '89', 2.5, 2, 104, 0, '0.0', '<p>Šifra: 1028767... HITNO, Novi Sad, trosoban stan 89m2 u zgradi kvalitetno rađenoj 80-tih godina se prodaje komforan trosoban stan, koji uz adaptaciju lako može biti i četvorosoban. Održavan, dvostrano orijentisan, sa dve prostrane terase za uživanje, dovoljno mesta za parking, u blizini marketa, gradskog prevoza, obdaništa i osnovne škole, predstavlja idealan stan za porodični život. Za više informacija i razgledanje nekretnine pozovite... </p>\r\n<p>KONTAKT: 065/55-31-204 Davor Šajin licenca br. 2115, Solis nekretnine, Novi Sad, upisan u Registar posrednika br. 544</p>', '', 0, 2, '0000-00-00 00:00:00', 0),
(347765, 'Noviji uknjizen stan na Somborskom bulevaru! VEOMA POVOLJNO!', 1, 38320, '38', 1.5, 2, 871, 0, '0.0', '<p>NOVIJI UKNJIZEN ODLICAN!!!, (Kodeks i Dunav Nekretnine-Đorđević Nekretnine DOO Novi Sad upisan u Reg. Pos. Broj 183)</p>\r\n<p>Tel: (+381 21) 42-60-10, 42-60-20, 065/8118-018 i 065/8118-019</p>', '', 0, 2, '0000-00-00 00:00:00', 0),
(347764, 'Novi Beograd - Tosin bunar - 33m2', 1, 39000, '33', 1.5, 2, 6, 111, '0.0', '<p><strong>Agenc. provizija 2% </strong></p>\r\n<p><strong>Agent: Uroš Jovanović  069/ 581-55-56 br. licence 594</strong></p>\r\n<p>UKNJIŽEN, odličan, kod ulice Prilaz, bez ulaganja, EG, prostorije: dnevna sa trpezarijom, spavaća soba, kupatilo, nema lođu, nema lift. </p>\r\n<p><strong>Agent: Uroš Jovanović 069/581-55-56 </strong><strong>br. licence 594</strong></p>\r\n<p><strong><em> </em></strong></p>\r\n<p><strong><em>“Art nekretnine“ d. o. o. Beograd. </em></strong></p>\r\n<p><strong><em>Reg. br. 339. </em></strong></p>\r\n<p><strong><em>011/24-13-063</em></strong></p>\r\n<p><strong> </strong></p>', 'Tošin bunar', 0, 1, '0000-00-00 00:00:00', 0),
(347763, 'Odlican, jednoiposoban stan, noviji, uknjizen na Novom Naselju!', 1, 41200, '41', 1.5, 2, 125, 0, '0.0', '<p>jednoiposoban stan na Novom Naselju, 41m2 41200e. , (Kodeks i Dunav Nekretnine-Đorđević Nekretnine DOO Novi Sad upisan u Reg. Pos. Broj 183)</p>\r\n<p>Tel: (+381 21) 42-60-10, 42-60-20, 065/8118-018 i 065/8118-019</p>', '', 0, 2, '0000-00-00 00:00:00', 0),
(347762, 'Izdavanje  stana u novogradnji-Vracar, Crveni Krst', 2, 500, '59', 2.5, 2, 15, 10, '0.0', '<p>Lep namesten stan u novogradnji, mirna ulica, moderno opremljen, izdaje se na duzi period. 069/3755500</p>', '', 0, 1, '0000-00-00 00:00:00', 0),
(347761, 'Novi Sad, strogi centar u blizini Zmaj Jovine gimnazije, dvosoban stan 51 m2 ', 1, 52500, '51', 2, 2, 110, 0, '0.0', '<p>Šifra: 1032050... Novi Sad, strogi centar u blizini Zmaj Jovine gimnazije, dvosoban stan 51 m2 salonske visine sa nus prostorijom u dvorištu. Idealna nekretnina kako za stanovanje tako i za poslovanje ili rentiranje. Za više informacija i razgledanje nekretnine pozovite... </p>\r\n<p>KONTAKT: 065/55-31-204 Davor Šajin licenca br. 2115, Solis nekretnine, Novi Sad, upisan u Registar posrednika br. 544</p>', '', 0, 2, '0000-00-00 00:00:00', 0),
(347760, 'Kuca na prodaju', 1, 85000, '150', 0, 1, 105, 0, '500.0', '<p>Novija moderna kuća u blizini centra Bačkog Jarka. St. površine 150m2 na placu od 500m2. Uredna kuća, lepo održavana, građena sendvič zidom sa izolacijom, čisto vlasništvo, uknjižena 1/1. Sastoji se od prizemnog dela gde je garaža i letnja kuhinja sa podrumom. Na glavnom ulazu je kuhinja sa trpezarijom i dnevnim boravkom sa wc-om. Na prvoj poluetaži su dve spavaće sobe i kupatilo. Tavanski prostor uređen sa pregradnim zidovima, izvučenim instalacijama, moguće završiti kao stanbeni prostor. Lepo ozelenjeno, uredno dvorište sa voćkama, jabuke, višnja i smokva. Kvalitetna, održavana, bez ulaganja. </p>', '', 0, 274, '0000-00-00 00:00:00', 0);

--
-- Triggers `estate_ad`
--
DROP TRIGGER IF EXISTS `search_index_rebuild_insert`;
DELIMITER //
CREATE TRIGGER `search_index_rebuild_insert` BEFORE INSERT ON `estate_ad`
 FOR EACH ROW set new.search_index_sr = CONCAT_WS( ' ',replace(upper(new.ad_title), 'Đ', 'DJ'),
                                replace(upper(new.description), 'Đ', 'DJ'),
                                replace(upper(new.street), 'Đ', 'DJ'),
                                (select CONCAT_WS(' ',name,plural_name,tags) from estate_type_languages ty where ty.id_type = new.id_type and language = 'sr'),
                                (select CONCAT_WS(' ',name,plural_name,tags) from p_condition_languages pcl where pcl.id_condition = new.id_condition and language = 'sr'),
                                (select CONCAT_WS(' ',name,tags) from city_languages cl where cl.id_city = new.id_city and language = 'sr'),
                                (select CONCAT_WS(' ',name,hood_tags) from hood h where h.id_hood = new.id_hood),
                                (select CONCAT_WS(' ',hood_part_name,hood_part_tags) from hood_part hp where hp.id_hood_part = new.id_hood_part),
                                (select CONCAT_WS(' ',structure_name,structure_tags) from estate_structure es where es.structure_value = new.nb_rooms),
                                IF(new.recent = 1,(select CONCAT_WS(' ',tags) from features_labels fl where fl.id_feature = 'NOVOG' and language = 'sr'),'')
                            ),
        new.search_index_en = CONCAT_WS( ' ',replace(upper(new.ad_title), 'Đ', 'DJ'),
                                replace(upper(new.description), 'Đ', 'DJ'),
                                replace(upper(new.street), 'Đ', 'DJ'),
                                (select CONCAT_WS(' ',name,plural_name,tags) from estate_type_languages ty where ty.id_type = new.id_type and language = 'en'),
								(select CONCAT_WS(' ',name,plural_name,tags) from p_condition_languages pcl where pcl.id_condition = new.id_condition and language = 'en'),
                                (select CONCAT_WS(' ',name,tags) from city_languages cl where cl.id_city = new.id_city and language = 'sr'),
                                (select CONCAT_WS(' ',name,hood_tags) from hood h where h.id_hood = new.id_hood),
                                (select CONCAT_WS(' ',hood_part_name,hood_part_tags) from hood_part hp where hp.id_hood_part = new.id_hood_part),
                                (select CONCAT_WS(' ',structure_name,structure_tags) from estate_structure es where es.structure_value = new.nb_rooms),
                                IF(new.recent = 1,(select CONCAT_WS(' ',tags) from features_labels fl where fl.id_feature = 'NOVOG' and language = 'en'),'')
                            ),
        new.search_index_fr = CONCAT_WS( ' ',replace(upper(new.ad_title), 'Đ', 'DJ'),
                                replace(upper(new.description), 'Đ', 'DJ'),
                                replace(upper(new.street), 'Đ', 'DJ'),
                                (select CONCAT_WS(' ',name,plural_name,tags) from estate_type_languages ty where ty.id_type = new.id_type and language = 'fr'),
								(select CONCAT_WS(' ',name,plural_name,tags) from p_condition_languages pcl where pcl.id_condition = new.id_condition and language = 'fr'),
                                (select CONCAT_WS(' ',name,tags) from city_languages cl where cl.id_city = new.id_city and language = 'sr'),
                                (select CONCAT_WS(' ',name,hood_tags) from hood h where h.id_hood = new.id_hood),
                                (select CONCAT_WS(' ',hood_part_name,hood_part_tags) from hood_part hp where hp.id_hood_part = new.id_hood_part),
                                (select CONCAT_WS(' ',structure_name,structure_tags) from estate_structure es where es.structure_value = new.nb_rooms),
                                IF(new.recent = 1,(select CONCAT_WS(' ',tags) from features_labels fl where fl.id_feature = 'NOVOG' and language = 'fr'),'')
                            ),
        new.search_index_de = CONCAT_WS( ' ',replace(upper(new.ad_title), 'Đ', 'DJ'),
                                replace(upper(new.description), 'Đ', 'DJ'),
                                replace(upper(new.street), 'Đ', 'DJ'),
                                (select CONCAT_WS(' ',name,plural_name,tags) from estate_type_languages ty where ty.id_type = new.id_type and language = 'de'),
								(select CONCAT_WS(' ',name,plural_name,tags) from p_condition_languages pcl where pcl.id_condition = new.id_condition and language = 'de'),
                                (select CONCAT_WS(' ',name,tags) from city_languages cl where cl.id_city = new.id_city and language = 'sr'),
                                (select CONCAT_WS(' ',name,hood_tags) from hood h where h.id_hood = new.id_hood),
                                (select CONCAT_WS(' ',hood_part_name,hood_part_tags) from hood_part hp where hp.id_hood_part = new.id_hood_part),
                                (select CONCAT_WS(' ',structure_name,structure_tags) from estate_structure es where es.structure_value = new.nb_rooms),
                                IF(new.recent = 1,(select CONCAT_WS(' ',tags) from features_labels fl where fl.id_feature = 'NOVOG' and language = 'de'),'')
                            ),    
        new.id_user_parent = (select CASE id_user_parent WHEN 0 THEN null ELSE id_user_parent END from users where users.id_user = new.id_user)
//
DELIMITER ;
DROP TRIGGER IF EXISTS `search_index_rebuild_update`;
DELIMITER //
CREATE TRIGGER `search_index_rebuild_update` BEFORE UPDATE ON `estate_ad`
 FOR EACH ROW begin
    if  old.ad_title != new.ad_title or
        old.description != new.description or
        old.street != new.street or
        old.id_city != new.id_city or
        old.id_hood != new.id_hood or
        old.id_hood_part != new.id_hood_part or
        old.id_type != new.id_type or
        old.nb_rooms != new.nb_rooms or
        old.recent != new.recent or
        old.status != new.status or
        old.id_user != new.id_user
    then
        set new.search_index_sr = CONCAT_WS( ' ',replace(upper(new.ad_title), 'Đ', 'DJ'),
                                replace(upper(new.description), 'Đ', 'DJ'),
                                replace(upper(new.street), 'Đ', 'DJ'),
                                (select CONCAT_WS(' ',name,plural_name,tags) from estate_type_languages ty where ty.id_type = new.id_type and language = 'sr'),
                                (select CONCAT_WS(' ',name,plural_name,tags) from p_condition_languages pcl where pcl.id_condition = new.id_condition and language = 'sr'),
                                (select CONCAT_WS(' ',name,tags) from city_languages cl where cl.id_city = new.id_city and language = 'sr'),
                                (select CONCAT_WS(' ',name,hood_tags) from hood h where h.id_hood = new.id_hood),
                                (select CONCAT_WS(' ',hood_part_name,hood_part_tags) from hood_part hp where hp.id_hood_part = new.id_hood_part),
                                (select CONCAT_WS(' ',structure_name,structure_tags) from estate_structure es where es.structure_value = new.nb_rooms),
                                IF(new.recent = 1,(select CONCAT_WS(' ',tags) from features_labels fl where fl.id_feature = 'NOVOG' and language = 'sr'),'')
                            ),
            new.search_index_en = CONCAT_WS( ' ',replace(upper(new.ad_title), 'Đ', 'DJ'),
                                replace(upper(new.description), 'Đ', 'DJ'),
                                replace(upper(new.street), 'Đ', 'DJ'),
                                (select CONCAT_WS(' ',name,plural_name,tags) from estate_type_languages ty where ty.id_type = new.id_type and language = 'en'),
								(select CONCAT_WS(' ',name,plural_name,tags) from p_condition_languages pcl where pcl.id_condition = new.id_condition and language = 'en'),
                                (select CONCAT_WS(' ',name,tags) from city_languages cl where cl.id_city = new.id_city and language = 'sr'),
                                (select CONCAT_WS(' ',name,hood_tags) from hood h where h.id_hood = new.id_hood),
                                (select CONCAT_WS(' ',hood_part_name,hood_part_tags) from hood_part hp where hp.id_hood_part = new.id_hood_part),
                                (select CONCAT_WS(' ',structure_name,structure_tags) from estate_structure es where es.structure_value = new.nb_rooms),
                                IF(new.recent = 1,(select CONCAT_WS(' ',tags) from features_labels fl where fl.id_feature = 'NOVOG' and language = 'en'),'')
                            ),
            new.search_index_fr = CONCAT_WS( ' ',replace(upper(new.ad_title), 'Đ', 'DJ'),
                                replace(upper(new.description), 'Đ', 'DJ'),
                                replace(upper(new.street), 'Đ', 'DJ'),
                                (select CONCAT_WS(' ',name,plural_name,tags) from estate_type_languages ty where ty.id_type = new.id_type and language = 'fr'),
								(select CONCAT_WS(' ',name,plural_name,tags) from p_condition_languages pcl where pcl.id_condition = new.id_condition and language = 'fr'),
                                (select CONCAT_WS(' ',name,tags) from city_languages cl where cl.id_city = new.id_city and language = 'sr'),
                                (select CONCAT_WS(' ',name,hood_tags) from hood h where h.id_hood = new.id_hood),
                                (select CONCAT_WS(' ',hood_part_name,hood_part_tags) from hood_part hp where hp.id_hood_part = new.id_hood_part),
                                (select CONCAT_WS(' ',structure_name,structure_tags) from estate_structure es where es.structure_value = new.nb_rooms),
                                IF(new.recent = 1,(select CONCAT_WS(' ',tags) from features_labels fl where fl.id_feature = 'NOVOG' and language = 'fr'),'')
                            ),
            new.search_index_de = CONCAT_WS( ' ',replace(upper(new.ad_title), 'Đ', 'DJ'),
                                replace(upper(new.description), 'Đ', 'DJ'),
                                replace(upper(new.street), 'Đ', 'DJ'),
                                (select CONCAT_WS(' ',name,plural_name,tags) from estate_type_languages ty where ty.id_type = new.id_type and language = 'de'),
								(select CONCAT_WS(' ',name,plural_name,tags) from p_condition_languages pcl where pcl.id_condition = new.id_condition and language = 'de'),
                                (select CONCAT_WS(' ',name,tags) from city_languages cl where cl.id_city = new.id_city and language = 'sr'),
                                (select CONCAT_WS(' ',name,hood_tags) from hood h where h.id_hood = new.id_hood),
                                (select CONCAT_WS(' ',hood_part_name,hood_part_tags) from hood_part hp where hp.id_hood_part = new.id_hood_part),
                                (select CONCAT_WS(' ',structure_name,structure_tags) from estate_structure es where es.structure_value = new.nb_rooms),
                                IF(new.recent = 1,(select CONCAT_WS(' ',tags) from features_labels fl where fl.id_feature = 'NOVOG' and language = 'de'),'')
                            ),
            new.status_inverse = new.status*-1,    
            new.id_user_parent = (select CASE id_user_parent WHEN 0 THEN null ELSE id_user_parent END from users where users.id_user = new.id_user);
    end if;
end
//
DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
