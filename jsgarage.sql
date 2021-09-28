-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 28, 2021 at 09:57 AM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jsgarage`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210924123943', '2021-09-24 14:39:54', 110),
('DoctrineMigrations\\Version20210927105344', '2021-09-27 12:54:21', 44);

-- --------------------------------------------------------

--
-- Table structure for table `marque`
--

CREATE TABLE `marque` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `marque`
--

INSERT INTO `marque` (`id`, `libelle`) VALUES
(3, 'Toyota'),
(4, 'Peugeot');

-- --------------------------------------------------------

--
-- Table structure for table `modele`
--

CREATE TABLE `modele` (
  `id` int(11) NOT NULL,
  `marque_id` int(11) DEFAULT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix_moyen` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modele`
--

INSERT INTO `modele` (`id`, `marque_id`, `libelle`, `prix_moyen`, `image`) VALUES
(6, 3, 'Prius', 17000, 'modele1.jpg'),
(7, 3, 'Corolla', 15000, 'modele2.jpg'),
(8, 3, 'Camry', 21000, 'modele3.jpg'),
(9, 3, 'Yaris', 12000, 'modele4.jpg'),
(10, 3, 'Lexus', 45000, 'modele5.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `username`, `password`, `roles`) VALUES
(1, 'marc', 'toto', 'ROLE_USER'),
(2, 'top', '$2y$13$XarFUisyu8QFSYPzmoV9NuB2zel7Q1UX9UqfWZheSe.IFBlPWt13a', 'ROLE_USER'),
(3, 'tata', '$2y$13$jTQK5CXdKUI7pc9dhbpuFOOP0iN7qLdpvJqQg1xFMMdrP6yRaQmeu', 'ROLE_USER'),
(4, 'mat', '$2y$13$fNf4un3d6KL5VFACj14UEuAirhyhv.dcbwj/vSh/6rTtUwraHkfzW', 'ROLE_USER'),
(5, 'tac', '$2y$13$dhK/4D6p7dbwc0hNP8VAzOWd5m2d0IQ8qkdaoD2G.7pJ4XMaOk7Hi', 'ROLE_USER'),
(6, 'js', '$2y$13$jVoH6AvXElZlzaFs1Zs49uvcS2nJjhT3nQCGwkaQYOe1UA3Q2CnrW', 'ROLE_ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `voiture`
--

CREATE TABLE `voiture` (
  `id` int(11) NOT NULL,
  `modele_id` int(11) DEFAULT NULL,
  `immatriculation` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nb_portes` int(11) NOT NULL,
  `annee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `voiture`
--

INSERT INTO `voiture` (`id`, `modele_id`, `immatriculation`, `nb_portes`, `annee`) VALUES
(2, 6, 'GV8172CF', 3, 2014),
(3, 6, 'ZB8120JT', 3, 1993),
(4, 6, 'CN0869NQ', 3, 2021),
(5, 6, 'VU615RS', 3, 2019),
(6, 7, 'LD6545JL', 5, 2001),
(7, 7, 'BP349HX', 3, 2002),
(8, 7, 'MQ6852GP', 5, 2017),
(9, 7, 'IT1661MX', 3, 1995),
(10, 7, 'HO3521QH', 3, 1998),
(11, 8, 'VC310UI', 5, 2011),
(12, 8, 'AC0922BN', 5, 1999),
(13, 8, 'KW3196ME', 5, 1995),
(14, 9, 'NY0976HR', 3, 2002),
(15, 9, 'OO011ZZ', 5, 2021),
(16, 9, 'RH451KI', 5, 2015),
(17, 10, 'HO9374BT', 5, 2002),
(18, 10, 'CB7177CV', 5, 2003),
(19, 10, 'MA4123PL', 3, 1998),
(20, 10, 'AV568RF', 2, 2005);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `marque`
--
ALTER TABLE `marque`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modele`
--
ALTER TABLE `modele`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_100285584827B9B2` (`marque_id`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voiture`
--
ALTER TABLE `voiture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E9E2810FAC14B70A` (`modele_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `marque`
--
ALTER TABLE `marque`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `modele`
--
ALTER TABLE `modele`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `voiture`
--
ALTER TABLE `voiture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `modele`
--
ALTER TABLE `modele`
  ADD CONSTRAINT `FK_100285584827B9B2` FOREIGN KEY (`marque_id`) REFERENCES `marque` (`id`);

--
-- Constraints for table `voiture`
--
ALTER TABLE `voiture`
  ADD CONSTRAINT `FK_E9E2810FAC14B70A` FOREIGN KEY (`modele_id`) REFERENCES `modele` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
