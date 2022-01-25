-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 25, 2022 at 02:14 AM
-- Server version: 5.7.33
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `romail-laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Acme Corporation', '2022-01-03 10:28:57', '2022-01-03 10:28:57');

-- --------------------------------------------------------

--
-- Table structure for table `bank_account_details`
--

CREATE TABLE `bank_account_details` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `day` varchar(50) DEFAULT NULL,
  `bf` double DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `cash_type` enum('in','out') DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bank_account_details`
--

INSERT INTO `bank_account_details` (`id`, `date`, `day`, `bf`, `title`, `cash_type`, `amount`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, '2022-01-14', NULL, -101, 'Tea', 'out', 101, '2022-01-13 16:11:19', '2022-01-13 16:11:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `first_name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `account_id`, `organization_id`, `first_name`, `last_name`, `email`, `phone`, `address`, `city`, `region`, `country`, `postal_code`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 27, 'Javon', 'Leffler', 'spinka.rudolph@example.com', '800-556-5078', '92083 Lea Extensions', 'North Santinoport', 'Delaware', 'US', '04960', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(2, 1, 88, 'Edwardo', 'Windler', 'pierce47@example.org', '1-866-650-4541', '7873 Camren Road Apt. 177', 'East Eulalia', 'Indiana', 'US', '71092', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(3, 1, 78, 'Avis', 'Yundt', 'dickens.kianna@example.net', '1-877-278-6665', '951 Cecilia Drive Apt. 948', 'South Jody', 'District of Columbia', 'US', '29049', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(4, 1, 79, 'Annamae', 'Hermiston', 'brown.maymie@example.net', '1-866-404-3837', '75089 Markus Pike Suite 270', 'South Manleyberg', 'Washington', 'US', '39719-9206', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(5, 1, 61, 'Violette', 'Bergstrom', 'pboehm@example.com', '1-844-213-0204', '6547 Hill Wells Apt. 254', 'Torptown', 'Maine', 'US', '99561', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(6, 1, 20, 'Monique', 'Kihn', 'fanny.swaniawski@example.org', '877-274-0968', '3823 Leo Cliff Suite 333', 'Keelychester', 'North Dakota', 'US', '08598', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(7, 1, 96, 'Brant', 'Haley', 'lang.antwan@example.com', '1-888-392-8365', '8136 Kessler Plains Apt. 085', 'Vellaview', 'Massachusetts', 'US', '99957', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(8, 1, 62, 'Sharon', 'Schinner', 'purdy.louisa@example.org', '1-800-495-9653', '581 Kihn Dam Suite 028', 'Bergstromtown', 'Colorado', 'US', '31425-0051', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(9, 1, 59, 'Destini', 'Wisoky', 'ebert.joe@example.net', '(888) 975-7978', '6821 Lesch Shoal', 'New Fletcher', 'Connecticut', 'US', '90883', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(10, 1, 36, 'Jayde', 'Trantow', 'gokon@example.net', '844.515.4430', '410 Amira Station Apt. 906', 'Julienberg', 'New Jersey', 'US', '30949-3361', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(11, 1, 60, 'Lauryn', 'Wilderman', 'ehermiston@example.com', '855.774.4777', '453 Madalyn Place Apt. 162', 'Gleasonhaven', 'Nevada', 'US', '72763', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(12, 1, 24, 'Laurianne', 'Gerhold', 'myles04@example.net', '(866) 523-3494', '48559 Kennedy Flats Apt. 142', 'West Esmeraldamouth', 'Nevada', 'US', '01834-4227', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(13, 1, 87, 'Mark', 'Morissette', 'xhomenick@example.com', '1-855-993-3541', '4644 Casper Tunnel Apt. 744', 'East Horace', 'New Jersey', 'US', '82370-8967', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(14, 1, 41, 'Conrad', 'Hessel', 'lauren88@example.org', '888-897-1529', '702 Enoch Knoll', 'Mrazton', 'Utah', 'US', '10644', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(15, 1, 12, 'Janis', 'Willms', 'percival62@example.net', '800-640-0662', '862 Watsica Avenue Suite 803', 'Port Minnie', 'South Dakota', 'US', '28148-9143', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(16, 1, 45, 'Nannie', 'Bins', 'satterfield.elda@example.com', '(800) 965-2966', '97202 Ziemann Inlet Apt. 652', 'Doyleborough', 'Arizona', 'US', '17291-3492', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(17, 1, 78, 'Ceasar', 'Bartoletti', 'jarred47@example.net', '855.979.2243', '785 Gerhold Green', 'Barrettbury', 'New Hampshire', 'US', '72906-5912', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(18, 1, 98, 'Sunny', 'Rohan', 'ethyl.bergstrom@example.net', '(855) 416-8607', '19869 Murazik Mall', 'Rutherfordchester', 'Virginia', 'US', '09499', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(19, 1, 91, 'Nola', 'Schinner', 'koss.dina@example.net', '866.918.7218', '3755 Joannie Road Apt. 086', 'Funkport', 'Georgia', 'US', '20874', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(20, 1, 14, 'Magali', 'Yost', 'ernser.landen@example.com', '(844) 590-7875', '19252 Mraz Squares', 'Monahanview', 'Tennessee', 'US', '57395', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(21, 1, 13, 'Nelda', 'Ebert', 'epfannerstill@example.com', '844.774.9047', '420 Aric Ford Apt. 053', 'Earlineside', 'Massachusetts', 'US', '52117-9587', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(22, 1, 56, 'Alva', 'Reynolds', 'okovacek@example.net', '(844) 313-6894', '814 Hessel Row', 'Lake Mariela', 'South Carolina', 'US', '24786', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(23, 1, 87, 'Madge', 'Schiller', 'koepp.myra@example.org', '800.312.3907', '8460 Brandyn Summit Apt. 250', 'South Maximillianhaven', 'Michigan', 'US', '82171', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(24, 1, 87, 'Cleora', 'Hintz', 'ortiz.erin@example.com', '844.447.5790', '27309 Adriel Estates Suite 855', 'Weimannmouth', 'Alabama', 'US', '59236', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(25, 1, 1, 'Colby', 'Ziemann', 'dmacejkovic@example.org', '(800) 891-7768', '380 Hirthe Walks Apt. 569', 'Lake Herminafurt', 'Oregon', 'US', '83630-7235', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(26, 1, 31, 'Jett', 'Purdy', 'gstanton@example.org', '800.671.9414', '35918 Adelbert Meadow', 'Jacquesmouth', 'West Virginia', 'US', '02324', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(27, 1, 77, 'Aubree', 'Grant', 'vernon.oreilly@example.com', '1-844-865-0043', '284 Evans Run', 'Murrayberg', 'Pennsylvania', 'US', '91243-6000', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(28, 1, 58, 'Adela', 'Considine', 'iokon@example.com', '855.635.1405', '3513 Schuppe Run Suite 721', 'South Cayla', 'Louisiana', 'US', '75684', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(29, 1, 76, 'Carolyne', 'Conn', 'ulittle@example.org', '888-305-4503', '694 Hayes Hill', 'Jacobsonstad', 'Maine', 'US', '72193-5689', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(30, 1, 79, 'Baby', 'Torp', 'erwin79@example.net', '1-800-560-7675', '21302 Jocelyn Summit Suite 011', 'Connellymouth', 'Arkansas', 'US', '18168-4674', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(31, 1, 76, 'Anthony', 'Howell', 'gottlieb.brandon@example.net', '855-667-6415', '49993 Dominic Mill Apt. 763', 'West Schuylermouth', 'New Jersey', 'US', '61561', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(32, 1, 36, 'Zachariah', 'Vandervort', 'schneider.gus@example.org', '877-730-3654', '25432 Kuphal Inlet', 'Grantton', 'California', 'US', '47793-3801', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(33, 1, 76, 'Meta', 'O\'Reilly', 'orpha62@example.org', '877-731-9677', '85046 Pouros Inlet', 'Funkside', 'Alaska', 'US', '79856', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(34, 1, 12, 'Palma', 'Daugherty', 'pansy.feest@example.com', '(855) 895-3219', '391 Upton Points', 'Lefflerview', 'Rhode Island', 'US', '48969-8148', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(35, 1, 37, 'Ariane', 'Tromp', 'liliane.lind@example.com', '(844) 417-8892', '6715 Candelario Plaza', 'Lake Milford', 'Maryland', 'US', '49803-3683', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(36, 1, 11, 'Willis', 'Gleichner', 'dmcdermott@example.org', '1-877-981-2668', '138 Icie Ranch', 'East Katelynstad', 'South Carolina', 'US', '25087-5399', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(37, 1, 68, 'Erica', 'Conroy', 'london.dicki@example.com', '866.348.9788', '61294 Willis Mountain Apt. 041', 'New Aliciabury', 'New Mexico', 'US', '58357', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(38, 1, 30, 'Norris', 'Cummerata', 'qdeckow@example.org', '866.902.5368', '340 Dach Terrace Suite 588', 'Lake Jailynborough', 'California', 'US', '70301', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(39, 1, 23, 'Roberta', 'Bernier', 'frami.karianne@example.net', '844.907.1343', '71308 Hauck Field Apt. 879', 'Carachester', 'Rhode Island', 'US', '49727', '2022-01-03 10:28:58', '2022-01-03 10:28:59', NULL),
(40, 1, 34, 'Nicolas', 'Bergstrom', 'norene04@example.com', '855.431.7738', '14395 Roob Bridge Apt. 826', 'Auerview', 'New Jersey', 'US', '79215', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(41, 1, 40, 'Jayden', 'Reynolds', 'runolfsdottir.dean@example.com', '(866) 818-4104', '47179 Grimes Drives', 'Kutchstad', 'Connecticut', 'US', '82320', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(42, 1, 53, 'Birdie', 'Heathcote', 'runolfsson.verda@example.net', '(844) 340-3706', '86582 Grady Islands Apt. 761', 'North Lillieland', 'Vermont', 'US', '55538-5655', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(43, 1, 49, 'David', 'Jerde', 'bonnie.goyette@example.org', '1-888-454-1612', '292 Wilmer Mountain Apt. 664', 'McKenzieburgh', 'Illinois', 'US', '83349-1298', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(44, 1, 92, 'Laverna', 'Sauer', 'jorge68@example.org', '1-866-246-8574', '78967 Tillman Pass', 'North Arnoldotown', 'Nebraska', 'US', '86596', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(45, 1, 67, 'Whitney', 'Gottlieb', 'brekke.ettie@example.com', '1-800-587-5986', '3937 Demetris Oval Suite 773', 'Considinehaven', 'Delaware', 'US', '62028-0648', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(46, 1, 92, 'Kyler', 'Hoeger', 'thiel.melissa@example.net', '877-758-9586', '15583 Lakin Squares', 'Port Scottie', 'Louisiana', 'US', '84171', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(47, 1, 92, 'Rogers', 'Harris', 'uwilkinson@example.net', '(844) 894-5968', '767 Doyle Square', 'North Lorainechester', 'Hawaii', 'US', '04504-1631', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(48, 1, 63, 'Dan', 'Konopelski', 'kacey.anderson@example.net', '(866) 447-5171', '293 Darwin Isle', 'Schulistville', 'Illinois', 'US', '69124', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(49, 1, 65, 'Elisha', 'Conroy', 'vkohler@example.org', '888-449-0302', '94842 Jazmyne Brooks Suite 246', 'Sauerview', 'Delaware', 'US', '08541', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(50, 1, 1, 'Bette', 'Grady', 'wkemmer@example.net', '844.647.7799', '32918 Julio Locks Suite 735', 'Gaylordberg', 'District of Columbia', 'US', '38643', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(51, 1, 94, 'Ava', 'McCullough', 'winfield90@example.com', '877.235.3814', '3509 Paucek Bridge Suite 127', 'Binsland', 'North Carolina', 'US', '48567-4467', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(52, 1, 49, 'Jayne', 'Pfeffer', 'joseph44@example.net', '877-432-6762', '241 Schmidt Shoal Suite 697', 'Rodricktown', 'Washington', 'US', '12576', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(53, 1, 69, 'Pascale', 'King', 'elisha44@example.org', '800.849.9615', '9025 Dustin Street Apt. 502', 'Lehnermouth', 'Tennessee', 'US', '71656', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(54, 1, 61, 'Delmer', 'DuBuque', 'wlegros@example.com', '888-812-1261', '2252 Romaguera Stream Suite 656', 'West Clara', 'Kentucky', 'US', '23717-1946', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(55, 1, 69, 'Trudie', 'Willms', 'grover12@example.org', '855-369-7236', '2444 Lockman Mill', 'Patrickville', 'Alaska', 'US', '39553-1797', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(56, 1, 89, 'Camren', 'Fadel', 'darion.mclaughlin@example.net', '800-499-8771', '3398 Wunsch Crossing Suite 040', 'Baileemouth', 'Alaska', 'US', '71221-4663', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(57, 1, 98, 'Hilma', 'Satterfield', 'syble.wiza@example.com', '1-888-534-5868', '29106 Pete Brooks', 'West Amelie', 'Nebraska', 'US', '10127-2177', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(58, 1, 46, 'Raegan', 'Parker', 'ayana.donnelly@example.com', '1-844-541-2211', '18999 Greenfelder Point Suite 536', 'Daughertyfort', 'West Virginia', 'US', '06092-7357', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(59, 1, 78, 'Jerod', 'Koss', 'botsford.marilie@example.net', '844.235.8022', '8894 Ezequiel Vista Suite 925', 'Port Madisyn', 'Michigan', 'US', '77061', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(60, 1, 76, 'Marisa', 'Dietrich', 'toy42@example.org', '844-736-0095', '48807 Stracke Lane', 'North Damion', 'Arizona', 'US', '91794-4382', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(61, 1, 25, 'Gregoria', 'Beahan', 'etorphy@example.com', '(877) 469-6333', '68913 Megane Burg', 'Pollichmouth', 'Utah', 'US', '95539-4450', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(62, 1, 26, 'Josie', 'Okuneva', 'gkertzmann@example.com', '888.587.0573', '4163 Gislason Stravenue Suite 509', 'Kattieland', 'Massachusetts', 'US', '99709-4414', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(63, 1, 3, 'Josianne', 'Schiller', 'ugutkowski@example.org', '888.683.2529', '62249 Johnston Lights Apt. 969', 'Kristyfurt', 'West Virginia', 'US', '02652', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(64, 1, 31, 'Maritza', 'Hyatt', 'virgie45@example.org', '(866) 408-2037', '52907 Hermina Rest', 'Abernathymouth', 'Wisconsin', 'US', '50968', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(65, 1, 24, 'Kaela', 'Heidenreich', 'herman.sophie@example.net', '(866) 239-8549', '587 Senger Village Suite 106', 'Annamariemouth', 'Delaware', 'US', '46405-1473', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(66, 1, 68, 'Kira', 'Larkin', 'gstreich@example.net', '877-319-0999', '976 Verla Underpass Apt. 287', 'Wehnerton', 'Massachusetts', 'US', '11490', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(67, 1, 49, 'Oda', 'Jaskolski', 'altenwerth.marlee@example.net', '(855) 765-1065', '18905 Cristian Oval', 'Aliyahtown', 'Arkansas', 'US', '95429-9119', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(68, 1, 16, 'Sabryna', 'Shields', 'cruz.fadel@example.org', '1-855-751-3351', '58560 Abbey Ports', 'West Idellborough', 'Florida', 'US', '03214', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(69, 1, 84, 'Stephan', 'Mann', 'kessler.melyna@example.org', '855-926-4881', '96073 Ullrich Station Apt. 935', 'Port Deanna', 'Tennessee', 'US', '07332', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(70, 1, 8, 'Aylin', 'Funk', 'mraz.helena@example.net', '855-347-0844', '331 Titus Plains', 'Ciceroburgh', 'Indiana', 'US', '86692-1008', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(71, 1, 14, 'Esteban', 'Keebler', 'myrtice26@example.com', '1-800-580-1002', '87868 Dina Avenue Apt. 378', 'Mozelleburgh', 'Oklahoma', 'US', '91814-2617', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(72, 1, 53, 'Jairo', 'Erdman', 'gibson.tiffany@example.net', '(800) 641-8394', '9938 Hauck Field', 'North Cristalborough', 'Hawaii', 'US', '08337', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(73, 1, 51, 'Eleanora', 'Adams', 'grayson93@example.com', '1-800-521-8057', '859 Bogan Ranch Apt. 603', 'Port Gerhardton', 'Alabama', 'US', '42192-7543', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(74, 1, 68, 'Felicita', 'Walter', 'kyler66@example.com', '1-888-312-7810', '457 Camron Cliffs Suite 247', 'Melvinaburgh', 'Nebraska', 'US', '55233-1979', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(75, 1, 39, 'Bertram', 'Gusikowski', 'dubuque.roy@example.org', '844-851-0962', '805 Erin Passage Apt. 366', 'Gonzaloport', 'Minnesota', 'US', '20653-1632', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(76, 1, 79, 'Kara', 'Mertz', 'jasper22@example.net', '1-844-991-7375', '24113 Rubie Ford', 'Pourostown', 'Georgia', 'US', '21939', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(77, 1, 42, 'Valerie', 'Reichel', 'okey16@example.com', '1-844-475-5614', '63173 Madilyn Cliffs Suite 236', 'Albertchester', 'Wisconsin', 'US', '54629-6716', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(78, 1, 39, 'Ettie', 'Murazik', 'tristin39@example.net', '1-800-378-3814', '857 Franecki Overpass Suite 311', 'Bergeville', 'North Carolina', 'US', '32440-0958', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(79, 1, 16, 'Alf', 'Gerhold', 'maude18@example.com', '1-855-279-4384', '42080 Pouros Locks', 'South Emeraldborough', 'Alabama', 'US', '21233', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(80, 1, 32, 'Herman', 'Fritsch', 'leonor66@example.net', '866-241-2286', '67765 Niko Fort', 'Schadenside', 'New Hampshire', 'US', '05837-8372', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(81, 1, 39, 'Sylvia', 'Baumbach', 'omann@example.com', '866.399.2629', '925 Quigley Motorway Suite 574', 'New Hosea', 'Nevada', 'US', '93562-0305', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(82, 1, 13, 'Everardo', 'Schuppe', 'viva.lemke@example.net', '844-450-0620', '909 Savannah Plains Suite 477', 'Lake Paxton', 'Vermont', 'US', '47556', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(83, 1, 64, 'Opal', 'McLaughlin', 'mosciski.graham@example.org', '(866) 542-6578', '77900 Klocko Island Suite 862', 'Hermannberg', 'New Hampshire', 'US', '37360', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(84, 1, 80, 'Paula', 'Lang', 'edwina69@example.org', '(877) 405-9614', '960 Gilberto Freeway Suite 204', 'Amiefurt', 'Alabama', 'US', '49464-1387', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(85, 1, 76, 'Tatyana', 'Smitham', 'ullrich.hunter@example.org', '800-618-0165', '38281 Anabelle Stream', 'Marksfort', 'Mississippi', 'US', '75869', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(86, 1, 96, 'Harold', 'Hackett', 'jast.ole@example.org', '800.684.7249', '7284 Kristoffer Trail Apt. 755', 'Giovanimouth', 'Kansas', 'US', '19254', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(87, 1, 14, 'Meghan', 'Vandervort', 'jo44@example.net', '877-317-4159', '82816 Darion Loaf Suite 017', 'Millerfurt', 'Delaware', 'US', '10432-1977', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(88, 1, 69, 'Gregory', 'Sanford', 'roob.weldon@example.net', '1-855-808-0942', '8983 Joanie Junctions Apt. 713', 'South Miracle', 'Oregon', 'US', '72043-4215', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(89, 1, 71, 'Guadalupe', 'Mertz', 'wwelch@example.net', '855-432-2985', '7928 Beatty Track Suite 778', 'Schneiderburgh', 'New Mexico', 'US', '28597-7644', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(90, 1, 23, 'Moriah', 'Connelly', 'stefanie07@example.org', '1-844-729-8574', '912 Jazmyn Flats', 'Phoebeville', 'Connecticut', 'US', '04434', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(91, 1, 38, 'Mervin', 'Beatty', 'zflatley@example.net', '(855) 561-4085', '170 Rempel Crossroad Suite 083', 'New Randi', 'Louisiana', 'US', '84184-1358', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(92, 1, 81, 'Salvatore', 'Wilkinson', 'huels.clay@example.com', '1-844-393-7242', '88963 Funk Extensions Suite 854', 'Alextown', 'Delaware', 'US', '03841', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(93, 1, 16, 'Kirk', 'Weber', 'dbeier@example.com', '866.536.8688', '89829 Zane Spur', 'South Trycia', 'Georgia', 'US', '62639-4988', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(94, 1, 94, 'Jaquelin', 'Goodwin', 'bbuckridge@example.com', '1-844-810-7259', '755 Jacobi Mountain Suite 997', 'North Helene', 'Wyoming', 'US', '91440', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(95, 1, 72, 'Roma', 'Bradtke', 'madge85@example.org', '844-775-4571', '2961 Pagac Mountain Apt. 966', 'North Arlene', 'Washington', 'US', '96148-2634', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(96, 1, 59, 'Samantha', 'Ratke', 'ucormier@example.com', '855-938-6324', '486 Anderson Roads Suite 458', 'New Theresahaven', 'Arizona', 'US', '01565', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(97, 1, 21, 'Fabian', 'Huels', 'nikolaus.dock@example.com', '(877) 384-0032', '2910 Cassandra Well Suite 199', 'South Matt', 'California', 'US', '59371-3091', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(98, 1, 16, 'Lucio', 'Torphy', 'beier.vaughn@example.com', '866-530-2223', '537 Sheldon Fords Suite 588', 'Hackettton', 'Texas', 'US', '55681', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(99, 1, 17, 'Crawford', 'Nienow', 'hackett.alec@example.org', '877-965-6497', '79691 Zola Parkways', 'North Rhoda', 'District of Columbia', 'US', '09544-3795', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL),
(100, 1, 64, 'Rocio', 'Nitzsche', 'marco51@example.net', '(888) 560-5130', '5161 Koelpin Rue', 'Schmittmouth', 'Missouri', 'US', '39619-9813', '2022-01-03 10:28:59', '2022-01-03 10:28:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `daily_cash_flow`
--

CREATE TABLE `daily_cash_flow` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `day` varchar(50) DEFAULT NULL,
  `cash_in_hand` double DEFAULT NULL,
  `bank_deposited` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `daily_cash_flow`
--

INSERT INTO `daily_cash_flow` (`id`, `date`, `day`, `cash_in_hand`, `bank_deposited`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2022-01-12 19:00:00', NULL, 401, 0, '2022-01-14 16:13:36', '2022-01-14 16:13:36', NULL),
(2, '2022-01-13 19:00:00', NULL, 351, 0, '2022-01-14 16:14:32', '2022-01-14 16:14:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_details`
--

CREATE TABLE `employee_details` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `time_in` time DEFAULT NULL,
  `time_out` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_details`
--

INSERT INTO `employee_details` (`id`, `date`, `user_id`, `time_in`, `time_out`, `created_at`, `updated_at`) VALUES
(1, '2022-01-13', 1, '02:37:00', NULL, '2022-01-13 16:37:45', '2022-01-13 16:37:45'),
(7, '2022-01-15', 1, NULL, NULL, '2022-01-14 15:54:35', '2022-01-14 15:54:35'),
(8, '2022-01-15', 8, NULL, NULL, '2022-01-14 15:54:35', '2022-01-14 15:54:35'),
(9, '2022-01-15', 7, NULL, NULL, '2022-01-14 15:54:35', '2022-01-14 15:54:35');

-- --------------------------------------------------------

--
-- Table structure for table `expense_details`
--

CREATE TABLE `expense_details` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `day` varchar(50) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `value` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `expense_details`
--

INSERT INTO `expense_details` (`id`, `date`, `day`, `field`, `value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, '2022-01-13', NULL, 'Tea', 50, '2022-01-12 17:42:54', '2022-01-12 17:42:54', NULL),
(5, '2022-01-13', NULL, 'Cup', 100, '2022-01-12 17:51:13', '2022-01-12 17:51:13', NULL),
(6, '2022-01-01', NULL, 'Tea', 101, '2021-12-31 16:22:38', '2022-01-13 16:22:38', NULL),
(7, '2022-01-14', NULL, 'Tea', 50, '2022-01-14 16:14:32', '2022-01-14 16:14:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2020_01_01_000001_create_password_resets_table', 1),
(3, '2020_01_01_000002_create_failed_jobs_table', 1),
(4, '2020_01_01_000003_create_accounts_table', 1),
(5, '2020_01_01_000004_create_users_table', 1),
(6, '2020_01_01_000005_create_organizations_table', 1),
(7, '2020_01_01_000006_create_contacts_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `organizations`
--

INSERT INTO `organizations` (`id`, `account_id`, `name`, `email`, `phone`, `address`, `city`, `region`, `country`, `postal_code`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Cartwright-Hamill', 'fhaley@ryan.com', '(800) 427-9233', '9777 Cole Estate Suite 394', 'North Gudrunmouth', 'Washington', 'US', '75239-6645', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(2, 1, 'Watsica-Larson', 'amurphy@anderson.org', '800.406.7355', '168 Ondricka Park Apt. 420', 'Reichelview', 'Arkansas', 'US', '36207-5141', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(3, 1, 'Harber, Kling and Larkin', 'cielo.bernier@parker.com', '855-246-7530', '71345 Orval Spring', 'North Kelly', 'Texas', 'US', '89983', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(4, 1, 'Rodriguez, Quitzon and Mante', 'lherzog@fay.com', '866-423-9907', '1189 Emmy Ramp Apt. 470', 'New Kurt', 'Wyoming', 'US', '64754', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(5, 1, 'Russel-Prohaska', 'verda16@pfeffer.info', '(855) 673-0888', '288 Greenfelder Courts Suite 382', 'South Elliehaven', 'Colorado', 'US', '93897', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(6, 1, 'Harber-Walker', 'wyman.micaela@jakubowski.com', '(844) 880-0134', '766 Randi Underpass', 'Port Kitty', 'Kansas', 'US', '99281', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(7, 1, 'Kutch Group', 'graham.kertzmann@kunde.com', '(844) 953-0688', '732 Monahan Coves Suite 511', 'South Jalon', 'Alabama', 'US', '72962-6362', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(8, 1, 'Rodriguez and Sons', 'margie.oreilly@heaney.com', '855-807-2100', '9042 Brandy Skyway', 'Dietrichmouth', 'South Carolina', 'US', '63229-4015', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(9, 1, 'Huels, McClure and Bins', 'ndavis@deckow.com', '844-279-6255', '948 Roman Divide', 'West Delmerbury', 'Vermont', 'US', '53929', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(10, 1, 'Okuneva Inc', 'heidenreich.gillian@goldner.info', '(866) 798-4246', '992 Rachel Field Suite 827', 'East Liana', 'Indiana', 'US', '17637', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(11, 1, 'Torphy PLC', 'schoen.chelsea@borer.info', '855.371.9229', '465 Lexie Circle Suite 454', 'Veummouth', 'New Mexico', 'US', '70293-6501', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(12, 1, 'Bernier-Little', 'feil.annamarie@cole.org', '(866) 672-6257', '60592 Labadie Parks Suite 163', 'East Vladimirport', 'Kansas', 'US', '64074-1007', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(13, 1, 'Kshlerin Inc', 'june18@ohara.biz', '800-229-4524', '90782 Cynthia Forges', 'New Raphael', 'South Carolina', 'US', '07056', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(14, 1, 'Braun-Blick', 'ssipes@powlowski.biz', '1-866-647-3589', '63417 Jackeline Hollow Apt. 440', 'Watersfurt', 'Iowa', 'US', '88863-9288', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(15, 1, 'Borer, Schulist and Gislason', 'jwilkinson@hammes.com', '(800) 310-9496', '7268 Devin Mission', 'Andersonfurt', 'Florida', 'US', '77223', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(16, 1, 'Yost Group', 'niko24@goldner.com', '888.970.2703', '211 Tremblay Crossroad', 'Skileschester', 'New Hampshire', 'US', '69236', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(17, 1, 'Collins-Schaden', 'zachery71@ryan.com', '(877) 620-0201', '2768 McKenzie Greens', 'West Ashley', 'Oklahoma', 'US', '26565', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(18, 1, 'Hackett, Trantow and Kilback', 'jenkins.carlotta@marquardt.com', '877-870-1699', '2353 Hanna Radial', 'Jaredport', 'District of Columbia', 'US', '62747-4832', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(19, 1, 'Kiehn, Parisian and Wisoky', 'swhite@berge.com', '800-337-3898', '9488 Franecki Tunnel Suite 081', 'New Dillanberg', 'South Carolina', 'US', '14359-8755', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(20, 1, 'Veum-O\'Hara', 'ilangosh@feest.com', '1-855-248-6905', '5784 Edison Way', 'Newellstad', 'Oregon', 'US', '47220-5572', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(21, 1, 'Wolff PLC', 'ward.rusty@grady.biz', '(866) 326-7278', '943 Margarett Knoll Suite 839', 'Stokesberg', 'North Dakota', 'US', '96010', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(22, 1, 'Bogisich, Spinka and Senger', 'johnson.maybell@carter.com', '(855) 584-2568', '3958 Eli Keys', 'Ornbury', 'Oregon', 'US', '29773-4659', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(23, 1, 'Considine PLC', 'zhudson@ward.com', '855-530-4572', '259 Arlene Isle', 'Bernierfort', 'Arkansas', 'US', '41984', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(24, 1, 'Russel and Sons', 'thompson.alena@goyette.net', '877-692-0695', '923 Kenna Islands', 'Mosciskiville', 'Minnesota', 'US', '60927', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(25, 1, 'Reynolds, Ratke and DuBuque', 'zhudson@bradtke.com', '1-855-245-4507', '113 Romaguera Shoal', 'Alleneburgh', 'District of Columbia', 'US', '49744-2758', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(26, 1, 'Little-Kozey', 'alessandra.hickle@champlin.biz', '888.909.4976', '54450 Rosendo Hollow Apt. 791', 'Altaberg', 'Delaware', 'US', '83195-3972', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(27, 1, 'Schroeder, Feeney and Schmidt', 'gerhold.marquis@ernser.com', '1-800-893-8774', '3984 Huel Plain', 'Lake Joshuah', 'Wisconsin', 'US', '96340', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(28, 1, 'Jakubowski LLC', 'haley32@parisian.com', '1-855-348-7164', '160 Weimann Plaza', 'Nikolauston', 'Pennsylvania', 'US', '52164-6597', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(29, 1, 'Veum LLC', 'tbernier@cassin.com', '866.750.9369', '96586 Oberbrunner Glen Apt. 620', 'Thompsonstad', 'Nevada', 'US', '50378-3636', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(30, 1, 'Jerde Group', 'thelma07@wuckert.com', '(800) 403-9788', '5828 Josiane Points', 'Greenfeldershire', 'Maryland', 'US', '85143-6891', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(31, 1, 'Kihn Group', 'psipes@hickle.net', '888-612-9784', '90840 Emmett Overpass Suite 840', 'East Gerard', 'Kentucky', 'US', '05016', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(32, 1, 'Robel-Schmidt', 'bret32@daugherty.com', '(855) 532-7201', '34918 Nikolaus Union', 'North Jacquelyn', 'Maine', 'US', '56195', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(33, 1, 'Sauer and Sons', 'kgulgowski@considine.com', '855.694.5792', '638 Gleason Forge Suite 022', 'North Briceberg', 'Montana', 'US', '98681-6716', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(34, 1, 'Strosin-Hintz', 'irogahn@huels.info', '866.262.1586', '3030 Mertz Ramp Apt. 870', 'North Grantshire', 'Michigan', 'US', '43813-3001', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(35, 1, 'Lindgren, Johnston and Sanford', 'cgusikowski@heaney.biz', '1-888-988-9134', '1030 Cassin Shore Suite 578', 'Effertzburgh', 'Illinois', 'US', '70443-5535', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(36, 1, 'Ritchie and Sons', 'stephanie03@lubowitz.com', '(855) 345-6301', '281 Runolfsson Light Suite 595', 'Windlerberg', 'New Mexico', 'US', '82400-3008', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(37, 1, 'Emmerich, Paucek and Conn', 'juanita.rosenbaum@franecki.com', '877.850.2354', '647 Deckow Prairie Apt. 142', 'Marjoryside', 'Montana', 'US', '66685', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(38, 1, 'Brown-Gleichner', 'darlene28@cartwright.org', '1-888-910-9135', '61990 Williamson Passage', 'Bashirianfort', 'Nebraska', 'US', '64332-6448', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(39, 1, 'Wiegand Group', 'rodrick72@cole.org', '1-855-423-7780', '23194 Leanna Camp Apt. 403', 'Lake Deshaunshire', 'North Carolina', 'US', '02914-4568', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(40, 1, 'Jenkins, Wiegand and Dietrich', 'mccullough.sally@heidenreich.org', '1-877-904-4777', '7500 Kristopher Ports Suite 847', 'Schaeferton', 'California', 'US', '33522', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(41, 1, 'Welch, Shanahan and Runolfsdottir', 'garfield.spencer@reilly.com', '800.801.1450', '1078 Camilla Stravenue', 'South Donside', 'New York', 'US', '50713-0540', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(42, 1, 'Dach-Halvorson', 'pearline48@sipes.com', '(888) 221-4080', '4244 Demond Run', 'Schoenview', 'Missouri', 'US', '11255-6369', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(43, 1, 'Doyle-Smith', 'davion.bednar@champlin.biz', '1-800-776-7584', '90368 Jerrold Landing Suite 643', 'Port Judsonmouth', 'Illinois', 'US', '54080', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(44, 1, 'Gottlieb, Littel and Stamm', 'lynn00@blick.org', '800.685.1684', '4546 Yadira Orchard Apt. 044', 'East Tracyhaven', 'Nevada', 'US', '66946', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(45, 1, 'White-Stoltenberg', 'cweber@kuvalis.org', '800-828-4465', '5853 O\'Kon Island Apt. 910', 'North Bretmouth', 'Delaware', 'US', '27016', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(46, 1, 'Weimann-Altenwerth', 'lysanne60@johnston.com', '866-576-3149', '334 Monserrat Street Apt. 439', 'Port Theresaview', 'Wisconsin', 'US', '19109-5589', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(47, 1, 'Brown-West', 'volson@daniel.com', '855-562-2574', '1455 Cheyenne Pine', 'Fisherbury', 'Connecticut', 'US', '00176', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(48, 1, 'Skiles PLC', 'amira.cartwright@zieme.info', '866.659.3325', '416 Eva Summit', 'Betteborough', 'Pennsylvania', 'US', '74478', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(49, 1, 'Graham Group', 'jaylin68@abernathy.com', '1-888-867-4043', '73931 Samantha Motorway', 'North Matteo', 'North Carolina', 'US', '04550-3519', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(50, 1, 'Parker-Walsh', 'abigayle.kunze@feil.org', '888-957-9685', '294 Okuneva Corners Suite 153', 'Johnstonview', 'Iowa', 'US', '75554-5014', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(51, 1, 'Swift Inc', 'tamara.welch@stoltenberg.com', '844.341.1265', '86189 McKenzie Mission Apt. 905', 'Lake Mohammad', 'Nevada', 'US', '23824', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(52, 1, 'Smitham-Kuhlman', 'kshlerin.abbey@mante.com', '(866) 309-2960', '4375 Koelpin Rapids', 'Brakusbury', 'Massachusetts', 'US', '19566-7594', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(53, 1, 'Moen and Sons', 'sammy37@bruen.org', '877-916-5266', '628 Graham Hills', 'Stantonport', 'Alaska', 'US', '64528-7069', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(54, 1, 'Wisoky-Gleichner', 'cheyanne.bednar@botsford.com', '877.659.7618', '689 Senger Crescent Suite 406', 'Laurelview', 'Colorado', 'US', '25300-6627', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(55, 1, 'Nienow-Berge', 'loyce.goyette@weissnat.com', '(866) 356-9099', '68964 West Ridges Suite 755', 'East Daisyborough', 'Vermont', 'US', '70832-5457', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(56, 1, 'Powlowski Group', 'leannon.davonte@parker.com', '1-844-702-8811', '820 McClure Points', 'New Kelli', 'Oklahoma', 'US', '07059', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(57, 1, 'Haley Group', 'manderson@nolan.com', '855.816.1419', '92398 Armstrong Rapid Apt. 496', 'New Jameyside', 'Oklahoma', 'US', '63911-3785', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(58, 1, 'Harris, Bernhard and Dach', 'larue94@crist.com', '(888) 690-4614', '323 Crist Hills', 'Elfriedaville', 'Louisiana', 'US', '75843', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(59, 1, 'King PLC', 'charity21@cummerata.com', '888.431.3314', '90453 Estell Camp Suite 603', 'Keenanburgh', 'Alaska', 'US', '60347', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(60, 1, 'Kessler-Schaden', 'elijah.hoeger@waelchi.com', '(844) 541-5052', '535 Mckenna Vista', 'North Luigi', 'Tennessee', 'US', '35214-1744', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(61, 1, 'Luettgen-Upton', 'eflatley@torp.com', '1-800-796-2508', '8113 Kelton Junction', 'Soledadview', 'Maine', 'US', '87305-0543', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(62, 1, 'Corkery-Parisian', 'dswift@king.com', '1-866-820-5039', '2713 Moen Curve', 'Emmyland', 'Illinois', 'US', '48801', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(63, 1, 'Funk, Sipes and Hilpert', 'qhermann@sauer.com', '877.868.8387', '3949 Murphy Lodge Suite 637', 'Leopoldoside', 'Michigan', 'US', '98021', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(64, 1, 'Ferry, Hettinger and Ullrich', 'schroeder.mafalda@gusikowski.org', '(877) 218-4028', '63690 Jeffery Ridge', 'New Daphnee', 'District of Columbia', 'US', '04807-3863', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(65, 1, 'Stiedemann PLC', 'brohan@kshlerin.com', '877-306-8735', '73717 Electa Locks Apt. 142', 'West Joanneburgh', 'Michigan', 'US', '28427-1618', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(66, 1, 'Willms, Weber and Lesch', 'claud43@pollich.com', '1-866-949-8519', '4235 Lexie Port Apt. 069', 'West Spencer', 'California', 'US', '71248-9357', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(67, 1, 'Boehm, Stark and Sanford', 'rex40@pollich.com', '1-844-367-3098', '3396 Therese Inlet', 'Walshview', 'Nebraska', 'US', '35365-0438', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(68, 1, 'Lindgren, Bauch and Beer', 'pfritsch@marks.com', '855-329-1188', '782 Patrick Place', 'Wittingstad', 'Nebraska', 'US', '38091', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(69, 1, 'Kshlerin-Kirlin', 'darrick.herman@gleichner.info', '888-313-7760', '670 Rozella Place Suite 258', 'North Rusty', 'Nebraska', 'US', '40322-5582', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(70, 1, 'Reynolds and Sons', 'cconsidine@hegmann.info', '(888) 621-1142', '408 Guadalupe Groves Apt. 235', 'New Oralburgh', 'Oregon', 'US', '10381-9899', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(71, 1, 'Kozey-Stokes', 'jolie32@beatty.com', '(800) 338-7763', '24553 Reilly Freeway', 'Corwinshire', 'New Mexico', 'US', '63653-1604', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(72, 1, 'Kuphal Ltd', 'linnie94@gleichner.com', '(855) 389-1292', '74287 Cremin Crest Suite 968', 'Walshbury', 'South Dakota', 'US', '26648', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(73, 1, 'Bosco PLC', 'natasha26@romaguera.org', '855.207.8888', '79509 Cullen Plains Apt. 002', 'Lake Casimerport', 'Georgia', 'US', '71880-3173', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(74, 1, 'Haag Inc', 'wdavis@keeling.com', '1-855-609-8403', '11935 Janis Port', 'Port Malachiberg', 'Utah', 'US', '41401', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(75, 1, 'Welch, Schimmel and Boehm', 'xschmeler@donnelly.com', '1-877-994-0018', '93037 Rudolph Skyway', 'East Shanyhaven', 'Washington', 'US', '79290-2581', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(76, 1, 'Halvorson Group', 'veum.andreanne@hammes.com', '855-543-2278', '3378 Mertz Springs Apt. 627', 'New Carliburgh', 'Michigan', 'US', '91730', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(77, 1, 'Marquardt-Hahn', 'uschimmel@hartmann.com', '(800) 247-9291', '916 Hammes Court Apt. 447', 'Rexchester', 'Montana', 'US', '72858', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(78, 1, 'Runolfsdottir Inc', 'presley.von@glover.com', '(877) 493-4889', '65487 Dawn Gardens Apt. 746', 'Port Dorotheaside', 'Arkansas', 'US', '32146-0371', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(79, 1, 'Keeling-Hahn', 'idaniel@welch.com', '877-495-9143', '50257 Reinger View Suite 519', 'Lake Melyna', 'Oregon', 'US', '53420-1391', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(80, 1, 'Willms Inc', 'hoppe.nettie@torphy.org', '(888) 385-2081', '905 Webster Lake Apt. 753', 'East Christopherbury', 'Rhode Island', 'US', '58539', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(81, 1, 'Ward, Zulauf and Howe', 'kfunk@reilly.com', '877.334.0006', '343 Boyer Street Apt. 287', 'O\'Harafurt', 'Iowa', 'US', '71190-1157', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(82, 1, 'Runolfsson-Rau', 'hand.clarissa@green.net', '800.713.8373', '108 Gilda Street', 'Nicklausview', 'New Jersey', 'US', '98942', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(83, 1, 'Effertz Group', 'willms.larissa@konopelski.org', '1-800-462-9487', '2919 Constance Flats Apt. 116', 'Ernserburgh', 'Virginia', 'US', '89603', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(84, 1, 'Haag LLC', 'murazik.sibyl@mann.com', '800-205-6409', '492 Marks Creek Suite 011', 'Lake Demarco', 'Pennsylvania', 'US', '08540', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(85, 1, 'Bergnaum Group', 'darius48@harvey.com', '1-877-998-8298', '7739 Miller Overpass', 'East Odell', 'New York', 'US', '86352-6468', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(86, 1, 'Torphy Group', 'barrows.hector@marks.com', '855.683.4624', '91064 Edwin Radial', 'Margarettton', 'New Hampshire', 'US', '32739-3229', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(87, 1, 'Blick, Mraz and VonRueden', 'vluettgen@nolan.com', '(844) 629-1332', '907 Abigail Manors Suite 734', 'East Lonzo', 'Nevada', 'US', '86786', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(88, 1, 'Graham, Kutch and Ferry', 'tlarkin@flatley.net', '(888) 596-5157', '19762 Grimes Shoals', 'Kaitlinborough', 'Hawaii', 'US', '37885-7949', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(89, 1, 'Hegmann, Zboncak and Beier', 'gideon.hilpert@welch.com', '(888) 713-7357', '636 McGlynn Underpass Suite 333', 'South Odessastad', 'Idaho', 'US', '49128', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(90, 1, 'Yost, Schulist and Larkin', 'pietro.breitenberg@swift.com', '888.441.3240', '4407 Paucek Ville Apt. 715', 'West Jessica', 'Washington', 'US', '95405', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(91, 1, 'Wolff-Schinner', 'ida02@kemmer.org', '888.869.0286', '951 Paris Loaf', 'Lemuelside', 'Oregon', 'US', '67648', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(92, 1, 'Denesik, Brakus and Bayer', 'espinka@hoeger.org', '866-678-3760', '3468 Strosin Gateway Apt. 780', 'West Destiny', 'Rhode Island', 'US', '64876', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(93, 1, 'Lebsack, Weber and Jast', 'christop02@kertzmann.com', '1-800-439-4217', '54486 Gaston Brook Suite 998', 'North Gregghaven', 'Idaho', 'US', '54285', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(94, 1, 'Quigley-Wolff', 'constance.murray@huels.org', '(888) 865-3591', '238 Rosella Curve Suite 293', 'Osinskishire', 'Iowa', 'US', '03208-0851', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(95, 1, 'Bauch LLC', 'jacklyn41@ebert.biz', '877.896.2661', '69727 Spencer Haven Apt. 188', 'Elisabethbury', 'Virginia', 'US', '18898-1700', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(96, 1, 'Block LLC', 'jaydon67@howell.org', '1-800-485-1035', '662 Khalil Light', 'East Maxieland', 'Idaho', 'US', '81005', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(97, 1, 'Walsh, Bergnaum and Zieme', 'layla81@kub.com', '1-866-571-0148', '938 Torp Mountains Suite 833', 'New Jacques', 'District of Columbia', 'US', '04508-2277', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(98, 1, 'Mohr and Sons', 'sanderson@smith.com', '(877) 329-8803', '973 Sterling Squares', 'Welchtown', 'Oklahoma', 'US', '92962', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(99, 1, 'Mills-Murazik', 'leanna.pouros@kerluke.com', '866-726-0626', '689 Marina Keys', 'Botsfordton', 'Missouri', 'US', '40389', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(100, 1, 'Strosin LLC', 'glover.myriam@kiehn.com', '877.672.8101', '4818 Waelchi Island', 'North Heather', 'Georgia', 'US', '43577-2781', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `parcel_details`
--

CREATE TABLE `parcel_details` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `day` varchar(50) DEFAULT NULL,
  `bf` double DEFAULT NULL,
  `bf_amount` double DEFAULT NULL,
  `current_orders` int(11) DEFAULT NULL,
  `cash_received` int(11) DEFAULT NULL,
  `returns` int(11) DEFAULT NULL,
  `current_orders_amount` double DEFAULT NULL,
  `cash_received_amount` double DEFAULT NULL,
  `returns_amount` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parcel_details`
--

INSERT INTO `parcel_details` (`id`, `date`, `day`, `bf`, `bf_amount`, `current_orders`, `cash_received`, `returns`, `current_orders_amount`, `cash_received_amount`, `returns_amount`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2022-01-12 19:00:00', NULL, 3, 311, 4, 1, 0, 862, 551, 862, '2022-01-12 16:02:01', '2022-01-14 15:58:41', NULL),
(2, '2022-01-12 19:00:00', NULL, NULL, NULL, 3, 1, 1, 862, 301, 862, '2022-01-12 16:08:33', '2022-01-12 16:08:33', NULL),
(3, '2022-01-12 19:00:00', NULL, NULL, NULL, 3, 1, 1, 862, 0, 862, '2022-01-12 16:28:35', '2022-01-12 16:28:35', NULL),
(4, '2022-01-12 19:00:00', NULL, NULL, NULL, 3, 1, 1, 862, 0, 862, '2022-01-12 16:29:59', '2022-01-12 16:29:59', NULL),
(5, '2022-01-12 19:00:00', NULL, NULL, NULL, 3, 1, 1, 862, 0, 862, '2022-01-12 16:30:23', '2022-01-12 16:30:23', NULL),
(6, '2022-01-12 19:00:00', NULL, NULL, NULL, 3, 1, 1, 862, 301, 862, '2022-01-12 16:59:03', '2022-01-12 16:59:03', NULL),
(7, '2022-01-12 19:00:00', NULL, NULL, NULL, 3, 1, 1, 862, 301, 862, '2022-01-12 16:59:35', '2022-01-12 16:59:35', NULL),
(8, '2022-01-12 19:00:00', NULL, NULL, NULL, 3, 1, 1, 862, 301, 862, '2022-01-12 16:59:54', '2022-01-12 16:59:54', NULL),
(9, '2022-01-12 19:00:00', NULL, NULL, NULL, 3, 1, 1, 862, 301, 862, '2022-01-12 17:13:14', '2022-01-12 17:13:14', NULL),
(10, '2022-01-12 19:00:00', NULL, NULL, NULL, 3, 1, 1, 862, 301, 862, '2022-01-12 17:13:34', '2022-01-12 17:13:34', NULL),
(11, '2022-01-12 19:00:00', NULL, NULL, NULL, 3, 1, 1, 862, 301, 862, '2022-01-12 17:13:41', '2022-01-12 17:13:41', NULL),
(12, '2022-01-12 19:00:00', NULL, NULL, NULL, 4, 1, 0, 862, 551, 862, '2022-01-12 17:39:04', '2022-01-12 17:39:04', NULL),
(13, '2022-01-12 19:00:00', NULL, NULL, NULL, 4, 1, 0, 862, 551, 862, '2022-01-12 17:40:33', '2022-01-12 17:40:33', NULL),
(14, '2022-01-12 19:00:00', NULL, NULL, NULL, 4, 1, 0, 862, 551, 862, '2022-01-12 17:40:53', '2022-01-12 17:40:53', NULL),
(15, '2022-01-12 19:00:00', NULL, NULL, NULL, 4, 1, 0, 862, 551, 862, '2022-01-12 17:41:07', '2022-01-12 17:41:07', NULL),
(16, '2022-01-12 19:00:00', NULL, NULL, NULL, 4, 1, 0, 862, 551, 862, '2022-01-12 17:41:51', '2022-01-12 17:41:51', NULL),
(17, '2022-01-12 19:00:00', NULL, NULL, NULL, 4, 1, 0, 862, 551, 862, '2022-01-12 17:42:54', '2022-01-12 17:42:54', NULL),
(18, '2022-01-12 19:00:00', NULL, NULL, NULL, 4, 1, 0, 862, 551, 862, '2022-01-12 17:51:13', '2022-01-12 17:51:13', NULL),
(19, '2022-01-13 19:00:00', NULL, 3, 311, 0, 0, 0, 0, 0, 0, '2022-01-13 16:09:36', '2022-01-14 16:03:09', NULL),
(20, '2022-01-13 19:00:00', NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, '2022-01-13 16:09:59', '2022-01-13 16:09:59', NULL),
(21, '2022-01-13 19:00:00', NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, '2022-01-13 16:10:25', '2022-01-13 16:10:25', NULL),
(22, '2022-01-13 19:00:00', NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, '2022-01-13 16:10:43', '2022-01-13 16:10:43', NULL),
(23, '2022-01-13 19:00:00', NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, '2022-01-13 16:11:19', '2022-01-13 16:11:19', NULL),
(24, '2022-01-13 19:00:00', NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, '2022-01-13 16:22:38', '2022-01-13 16:22:38', NULL),
(25, '2022-01-12 19:00:00', NULL, NULL, NULL, 4, 1, 0, 862, 551, 862, '2022-01-13 16:37:45', '2022-01-13 16:37:45', NULL),
(26, '2022-01-12 19:00:00', NULL, NULL, NULL, 4, 1, 0, 862, 551, 862, '2022-01-13 16:39:14', '2022-01-13 16:39:14', NULL),
(27, '2022-01-14 19:00:00', NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, '2022-01-14 15:54:28', '2022-01-14 15:54:28', NULL),
(28, '2022-01-14 19:00:00', NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, '2022-01-14 15:54:35', '2022-01-14 15:54:35', NULL),
(29, '2022-01-12 19:00:00', NULL, NULL, NULL, 4, 1, 0, 862, 551, 862, '2022-01-14 15:56:07', '2022-01-14 15:56:07', NULL),
(30, '2022-01-12 19:00:00', NULL, 3, 311, 4, 1, 0, 862, 551, 862, '2022-01-14 15:56:48', '2022-01-14 15:56:48', NULL),
(31, '2022-01-12 19:00:00', NULL, 3, 311, 4, 1, 0, 862, 551, 862, '2022-01-14 15:57:43', '2022-01-14 15:57:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `first_name` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner` tinyint(1) NOT NULL DEFAULT '0',
  `photo_path` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `account_id`, `first_name`, `last_name`, `email`, `email_verified_at`, `password`, `owner`, `photo_path`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'John', 'Doe', 'johndoe@example.com', '2022-01-03 10:28:58', '$2y$10$DC2qxFb7Tth823a/MYs9g.DUa2w1XO5IJgwONCTkTXsgybwvvS7IO', 1, NULL, 'RnDXutXRFm', '2022-01-03 10:28:58', '2022-01-03 10:28:58', NULL),
(7, 1, 'Suleman', 'Ahmed', 'suleman@example.com', '2022-01-03 10:28:58', '$2y$10$DC2qxFb7Tth823a/MYs9g.DUa2w1XO5IJgwONCTkTXsgybwvvS7IO', 1, NULL, 'RnDXutXRFm', '2022-01-03 10:28:58', '2022-01-14 15:53:29', NULL),
(8, 1, 'Romail', 'Khan', NULL, NULL, NULL, 0, NULL, NULL, '2022-01-14 15:54:09', '2022-01-14 15:54:09', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_account_details`
--
ALTER TABLE `bank_account_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_account_id_index` (`account_id`),
  ADD KEY `contacts_organization_id_index` (`organization_id`);

--
-- Indexes for table `daily_cash_flow`
--
ALTER TABLE `daily_cash_flow`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_details`
--
ALTER TABLE `employee_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_details`
--
ALTER TABLE `expense_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organizations_account_id_index` (`account_id`);

--
-- Indexes for table `parcel_details`
--
ALTER TABLE `parcel_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_account_id_index` (`account_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bank_account_details`
--
ALTER TABLE `bank_account_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `daily_cash_flow`
--
ALTER TABLE `daily_cash_flow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employee_details`
--
ALTER TABLE `employee_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `expense_details`
--
ALTER TABLE `expense_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `organizations`
--
ALTER TABLE `organizations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `parcel_details`
--
ALTER TABLE `parcel_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
