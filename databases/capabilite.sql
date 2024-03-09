-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 27 déc. 2022 à 09:01
-- Version du serveur :  5.7.31
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `capabilite`
--

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_01/12/2022-14:29:37`
--

DROP TABLE IF EXISTS `machine_1_capability_01/12/2022-14:29:37`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_01/12/2022-14:29:37` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_01/12/2022-14:29:37`
--

INSERT INTO `machine_1_capability_01/12/2022-14:29:37` (`id`, `value`) VALUES
('purpose', 'normality'),
('Khi2-measured', '11.613633946047'),
('Khi2-theoretical', '28.473255424004'),
('khi-probability', '0.001'),
('normality', '1'),
('LSCx', '10.054815'),
('LICx', '9.945185'),
('LSCe', '0.20083'),
('LICe', '0'),
('S', '0.041404106076572'),
('Means', '10.0116'),
('Ranges', '0.095'),
('stDev', '0.041404106076572'),
('Mean of means', '10.0116'),
('Mean of ranges', '0.095');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_01/12/2022-14:29:43`
--

DROP TABLE IF EXISTS `machine_1_capability_01/12/2022-14:29:43`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_01/12/2022-14:29:43` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_01/12/2022-14:29:43`
--

INSERT INTO `machine_1_capability_01/12/2022-14:29:43` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.04039'),
('LICx', '9.95961'),
('LSCe', '0.14798'),
('LICe', '0'),
('S', '0.032623611081546'),
('Means', '10.0124'),
('Ranges', '0.07'),
('stDev', '0.032623611081546'),
('Mean of means', '10.0124'),
('Mean of ranges', '0.07');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_01/12/2022-14:29:49`
--

DROP TABLE IF EXISTS `machine_1_capability_01/12/2022-14:29:49`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_01/12/2022-14:29:49` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_01/12/2022-14:29:49`
--

INSERT INTO `machine_1_capability_01/12/2022-14:29:49` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.019618'),
('LICx', '9.980382'),
('LSCe', '0.071876'),
('LICe', '0'),
('S', '0.012409673645991'),
('Means', '9.973'),
('Ranges', '0.034'),
('stDev', '0.012409673645991'),
('Mean of means', '9.973'),
('Mean of ranges', '0.034');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_01/12/2022-14:29:56`
--

DROP TABLE IF EXISTS `machine_1_capability_01/12/2022-14:29:56`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_01/12/2022-14:29:56` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_01/12/2022-14:29:56`
--

INSERT INTO `machine_1_capability_01/12/2022-14:29:56` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.04616'),
('LICx', '9.95384'),
('LSCe', '0.16912'),
('LICe', '0'),
('S', '0.030177806414649'),
('Means', '9.9942'),
('Ranges', '0.08'),
('stDev', '0.030177806414649'),
('Mean of means', '9.9942'),
('Mean of ranges', '0.08');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_01/12/2022-14:30:03`
--

DROP TABLE IF EXISTS `machine_1_capability_01/12/2022-14:30:03`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_01/12/2022-14:30:03` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_01/12/2022-14:30:03`
--

INSERT INTO `machine_1_capability_01/12/2022-14:30:03` (`id`, `value`) VALUES
('purpose', 'CalcCp'),
('Cp', '0.5325895280266'),
('Cpk', '0.52033996888199'),
('Cpm', '0.094213146749173'),
('LSCx', '10.04039'),
('LICx', '9.95961'),
('LSCe', '0.14798'),
('LICe', '0'),
('S', '0.032736829412758'),
('Means', '10.0158'),
('Ranges', '0.07'),
('stDev', '0.032736829412758'),
('Mean of means', '10.0158'),
('Mean of ranges', '0.07');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_01/12/2022-14:31:23`
--

DROP TABLE IF EXISTS `machine_1_capability_01/12/2022-14:31:23`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_01/12/2022-14:31:23` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_01/12/2022-14:31:23`
--

INSERT INTO `machine_1_capability_01/12/2022-14:31:23` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.040967'),
('LICx', '9.959033'),
('LSCe', '0.150094'),
('LICe', '0'),
('S', '0.033818633916822'),
('Means', '9.9978'),
('Ranges', '0.071'),
('stDev', '0.033818633916822'),
('Mean of means', '9.9978'),
('Mean of ranges', '0.071');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_01/12/2022-14:31:30`
--

DROP TABLE IF EXISTS `machine_1_capability_01/12/2022-14:31:30`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_01/12/2022-14:31:30` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_01/12/2022-14:31:30`
--

INSERT INTO `machine_1_capability_01/12/2022-14:31:30` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.031735'),
('LICx', '9.968265'),
('LSCe', '0.11627'),
('LICe', '0'),
('S', '0.023377339455122'),
('Means', '10.018'),
('Ranges', '0.055'),
('stDev', '0.023377339455122'),
('Mean of means', '10.018'),
('Mean of ranges', '0.055');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_01/12/2022-14:31:35`
--

DROP TABLE IF EXISTS `machine_1_capability_01/12/2022-14:31:35`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_01/12/2022-14:31:35` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_01/12/2022-14:31:35`
--

INSERT INTO `machine_1_capability_01/12/2022-14:31:35` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.041544'),
('LICx', '9.958456'),
('LSCe', '0.152208'),
('LICe', '0'),
('S', '0.032912003889158'),
('Means', '10.0022'),
('Ranges', '0.072'),
('stDev', '0.032912003889158'),
('Mean of means', '10.0022'),
('Mean of ranges', '0.072');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_01/12/2022-14:31:42`
--

DROP TABLE IF EXISTS `machine_1_capability_01/12/2022-14:31:42`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_01/12/2022-14:31:42` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_01/12/2022-14:31:42`
--

INSERT INTO `machine_1_capability_01/12/2022-14:31:42` (`id`, `value`) VALUES
('purpose', 'CalcCp'),
('Cp', '0.61276166297072'),
('Cpk', '0.51839636687323'),
('Cpm', '0.10094791123215'),
('LSCx', '10.027696'),
('LICx', '9.972304'),
('LSCe', '0.101472'),
('LICe', '0'),
('S', '0.02037645700312'),
('Means', '10.0128'),
('Ranges', '0.048'),
('stDev', '0.02037645700312'),
('Mean of means', '10.0128'),
('Mean of ranges', '0.048');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_01/12/2022-14:31:48`
--

DROP TABLE IF EXISTS `machine_1_capability_01/12/2022-14:31:48`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_01/12/2022-14:31:48` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_01/12/2022-14:31:48`
--

INSERT INTO `machine_1_capability_01/12/2022-14:31:48` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.04039'),
('LICx', '9.95961'),
('LSCe', '0.14798'),
('LICe', '0'),
('S', '0.027226825007702'),
('Means', '10.0136'),
('Ranges', '0.07'),
('stDev', '0.027226825007702'),
('Mean of means', '10.0136'),
('Mean of ranges', '0.07');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_01/12/2022-14:31:54`
--

DROP TABLE IF EXISTS `machine_1_capability_01/12/2022-14:31:54`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_01/12/2022-14:31:54` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_01/12/2022-14:31:54`
--

INSERT INTO `machine_1_capability_01/12/2022-14:31:54` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.04616'),
('LICx', '9.95384'),
('LSCe', '0.16912'),
('LICe', '0'),
('S', '0.036462309307009'),
('Means', '9.998'),
('Ranges', '0.08'),
('stDev', '0.036462309307009'),
('Mean of means', '9.998'),
('Mean of ranges', '0.08');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_01/12/2022-14:32:00`
--

DROP TABLE IF EXISTS `machine_1_capability_01/12/2022-14:32:00`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_01/12/2022-14:32:00` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_01/12/2022-14:32:00`
--

INSERT INTO `machine_1_capability_01/12/2022-14:32:00` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.053084'),
('LICx', '9.946916'),
('LSCe', '0.194488'),
('LICe', '0'),
('S', '0.040012498047485'),
('Means', '9.98'),
('Ranges', '0.092'),
('stDev', '0.040012498047485'),
('Mean of means', '9.98'),
('Mean of ranges', '0.092');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_01/12/2022-14:32:06`
--

DROP TABLE IF EXISTS `machine_1_capability_01/12/2022-14:32:06`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_01/12/2022-14:32:06` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_01/12/2022-14:32:06`
--

INSERT INTO `machine_1_capability_01/12/2022-14:32:06` (`id`, `value`) VALUES
('purpose', 'CalcCp,CalcPp'),
('Pp', '0.54962457789354'),
('Ppk', '0.54174662561041'),
('Ppm', '0.095709218358821'),
('Rr', '98.566666666669'),
('ZÃ©quivalent', '1.3454809666834'),
('Zprocessus', '2.8454809666834'),
('Cp', '0.51343425048407'),
('Cpk', '0.46825203644147'),
('Cpm', '0.092477764726943'),
('Rs', '107.04867806839'),
('LSCx', '10.034043'),
('LICx', '9.965957'),
('LSCe', '0.124726'),
('LICe', '0'),
('S', '0.024252834885844'),
('Means', '9.9908'),
('Ranges', '0.059'),
('stDev', '0.024252834885844'),
('Mean of means', '9.9908'),
('Mean of ranges', '0.059');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_02/12/2022-09:27:06`
--

DROP TABLE IF EXISTS `machine_1_capability_02/12/2022-09:27:06`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_02/12/2022-09:27:06` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_02/12/2022-09:27:06`
--

INSERT INTO `machine_1_capability_02/12/2022-09:27:06` (`id`, `value`) VALUES
('purpose', 'normality'),
('Khi2-measured', '7.0839030579219'),
('Khi2-theoretical', '28.473255424004'),
('khi-probability', '0.001'),
('normality', '1'),
('LSCx', '10.035197'),
('LICx', '9.964803'),
('LSCe', '0.128954'),
('LICe', '0'),
('S', '0.027824449680093'),
('Means', '9.9958'),
('Ranges', '0.061'),
('stDev', '0.027824449680093'),
('Mean of means', '9.9958'),
('Mean of ranges', '0.061');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_02/12/2022-09:27:16`
--

DROP TABLE IF EXISTS `machine_1_capability_02/12/2022-09:27:16`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_02/12/2022-09:27:16` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_02/12/2022-09:27:16`
--

INSERT INTO `machine_1_capability_02/12/2022-09:27:16` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.045583'),
('LICx', '9.954417'),
('LSCe', '0.167006'),
('LICe', '0'),
('S', '0.031807231882074'),
('Means', '10.0082'),
('Ranges', '0.079'),
('stDev', '0.031807231882074'),
('Mean of means', '10.0082'),
('Mean of ranges', '0.079');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_02/12/2022-09:27:23`
--

DROP TABLE IF EXISTS `machine_1_capability_02/12/2022-09:27:23`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_02/12/2022-09:27:23` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_02/12/2022-09:27:23`
--

INSERT INTO `machine_1_capability_02/12/2022-09:27:23` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.021926'),
('LICx', '9.978074'),
('LSCe', '0.080332'),
('LICe', '0'),
('S', '0.015388307249337'),
('Means', '10.0326'),
('Ranges', '0.038'),
('stDev', '0.015388307249337'),
('Mean of means', '10.0326'),
('Mean of ranges', '0.038');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_02/12/2022-09:27:30`
--

DROP TABLE IF EXISTS `machine_1_capability_02/12/2022-09:27:30`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_02/12/2022-09:27:30` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_02/12/2022-09:27:30`
--

INSERT INTO `machine_1_capability_02/12/2022-09:27:30` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.047891'),
('LICx', '9.952109'),
('LSCe', '0.175462'),
('LICe', '0'),
('S', '0.037771682514815'),
('Means', '10.0018'),
('Ranges', '0.083'),
('stDev', '0.037771682514815'),
('Mean of means', '10.0018'),
('Mean of ranges', '0.083');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_02/12/2022-09:29:41`
--

DROP TABLE IF EXISTS `machine_1_capability_02/12/2022-09:29:41`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_02/12/2022-09:29:41` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_02/12/2022-09:29:41`
--

INSERT INTO `machine_1_capability_02/12/2022-09:29:41` (`id`, `value`) VALUES
('purpose', 'CalcCp'),
('Cp', '0.61192746051293'),
('Cpk', '0.41427489076726'),
('Cpm', '0.10050896014889'),
('ZÃ©quivalent', '1.0280381336618'),
('Zprocessus', '2.5280381336618'),
('LSCx', '10.015579'),
('LICx', '9.984421'),
('LSCe', '0.057078'),
('LICe', '0'),
('S', '0.01144552314226'),
('Means', '10.022'),
('Ranges', '0.027'),
('stDev', '0.01144552314226'),
('Mean of means', '10.022'),
('Mean of ranges', '0.027');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_02/12/2022-09:29:51`
--

DROP TABLE IF EXISTS `machine_1_capability_02/12/2022-09:29:51`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_02/12/2022-09:29:51` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_02/12/2022-09:29:51`
--

INSERT INTO `machine_1_capability_02/12/2022-09:29:51` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.039813'),
('LICx', '9.960187'),
('LSCe', '0.145866'),
('LICe', '0'),
('S', '0.030186089511562'),
('Means', '10.0028'),
('Ranges', '0.069'),
('stDev', '0.030186089511562'),
('Mean of means', '10.0028'),
('Mean of ranges', '0.069');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_02/12/2022-09:29:59`
--

DROP TABLE IF EXISTS `machine_1_capability_02/12/2022-09:29:59`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_02/12/2022-09:29:59` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_02/12/2022-09:29:59`
--

INSERT INTO `machine_1_capability_02/12/2022-09:29:59` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.036928'),
('LICx', '9.963072'),
('LSCe', '0.135296'),
('LICe', '0'),
('S', '0.025304149857286'),
('Means', '9.9996'),
('Ranges', '0.064'),
('stDev', '0.025304149857286'),
('Mean of means', '9.9996'),
('Mean of ranges', '0.064');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_27/11/2022-00:03:52`
--

DROP TABLE IF EXISTS `machine_1_capability_27/11/2022-00:03:52`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_27/11/2022-00:03:52` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_27/11/2022-00:03:52`
--

INSERT INTO `machine_1_capability_27/11/2022-00:03:52` (`id`, `value`) VALUES
('purpose', 'normality'),
('S', '0.02781546332528'),
('LSCe', '0.141638'),
('LICe', '0'),
('normality', '1'),
('LSCx', '10.038659'),
('Khi2-theoretical', '9.4877290367812'),
('khi-probability', '5'),
('Khi2-measured', '7.0948597430212'),
('LICx', '9.961341'),
('Means', '9.9812'),
('Ranges', '0.067'),
('stDev', '0.02781546332528'),
('Mean of means', '9.9812'),
('Mean of ranges', '0.067');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_27/11/2022-00:04:02`
--

DROP TABLE IF EXISTS `machine_1_capability_27/11/2022-00:04:02`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_27/11/2022-00:04:02` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_27/11/2022-00:04:02`
--

INSERT INTO `machine_1_capability_27/11/2022-00:04:02` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.020772'),
('LICx', '9.979228'),
('LSCe', '0.076104'),
('LICe', '0'),
('S', '0.016994116628998'),
('Means', '9.9714'),
('Ranges', '0.036'),
('stDev', '0.016994116628998'),
('Mean of means', '9.9714'),
('Mean of ranges', '0.036');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_27/11/2022-00:04:06`
--

DROP TABLE IF EXISTS `machine_1_capability_27/11/2022-00:04:06`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_27/11/2022-00:04:06` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_27/11/2022-00:04:06`
--

INSERT INTO `machine_1_capability_27/11/2022-00:04:06` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.025388'),
('LICx', '9.974612'),
('LSCe', '0.093016'),
('LICe', '0'),
('S', '0.017426990560622'),
('Means', '9.9828'),
('Ranges', '0.044'),
('stDev', '0.017426990560622'),
('Mean of means', '9.9828'),
('Mean of ranges', '0.044');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_27/11/2022-00:04:13`
--

DROP TABLE IF EXISTS `machine_1_capability_27/11/2022-00:04:13`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_27/11/2022-00:04:13` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_27/11/2022-00:04:13`
--

INSERT INTO `machine_1_capability_27/11/2022-00:04:13` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.047314'),
('LICx', '9.952686'),
('LSCe', '0.173348'),
('LICe', '0'),
('S', '0.033741665637606'),
('Means', '9.995'),
('Ranges', '0.082'),
('stDev', '0.033741665637606'),
('Mean of means', '9.995'),
('Mean of ranges', '0.082');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_27/11/2022-00:04:16`
--

DROP TABLE IF EXISTS `machine_1_capability_27/11/2022-00:04:16`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_27/11/2022-00:04:16` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_27/11/2022-00:04:16`
--

INSERT INTO `machine_1_capability_27/11/2022-00:04:16` (`id`, `value`) VALUES
('purpose', 'CalcCp'),
('Cp', '0.60715070580664'),
('Cpk', '0.50757799005433'),
('Cpm', '0.10047115099605'),
('ZÃ©quivalent', '1.6959966080102'),
('Zprocessus', '3.1959966080102'),
('LSCx', '10.026542'),
('LICx', '9.973458'),
('LSCe', '0.097244'),
('LICe', '0'),
('S', '0.018867962264113'),
('Means', '10.018'),
('Ranges', '0.046'),
('stDev', '0.018867962264113'),
('Mean of means', '10.018'),
('Mean of ranges', '0.046');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_27/11/2022-00:04:20`
--

DROP TABLE IF EXISTS `machine_1_capability_27/11/2022-00:04:20`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_27/11/2022-00:04:20` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_27/11/2022-00:04:20`
--

INSERT INTO `machine_1_capability_27/11/2022-00:04:20` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.031735'),
('LICx', '9.968265'),
('LSCe', '0.11627'),
('LICe', '0'),
('S', '0.022483327155917'),
('Means', '9.988'),
('Ranges', '0.055'),
('stDev', '0.022483327155917'),
('Mean of means', '9.988'),
('Mean of ranges', '0.055');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_27/11/2022-00:04:23`
--

DROP TABLE IF EXISTS `machine_1_capability_27/11/2022-00:04:23`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_27/11/2022-00:04:23` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_27/11/2022-00:04:23`
--

INSERT INTO `machine_1_capability_27/11/2022-00:04:23` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.053661'),
('LICx', '9.946339'),
('LSCe', '0.196602'),
('LICe', '0'),
('S', '0.037665634204139'),
('Means', '10.0002'),
('Ranges', '0.093'),
('stDev', '0.037665634204139'),
('Mean of means', '10.0002'),
('Mean of ranges', '0.093');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_27/11/2022-00:04:27`
--

DROP TABLE IF EXISTS `machine_1_capability_27/11/2022-00:04:27`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_27/11/2022-00:04:27` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_27/11/2022-00:04:27`
--

INSERT INTO `machine_1_capability_27/11/2022-00:04:27` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.030004'),
('LICx', '9.969996'),
('LSCe', '0.109928'),
('LICe', '0'),
('S', '0.020995237555217'),
('Means', '10.0146'),
('Ranges', '0.052'),
('stDev', '0.020995237555217'),
('Mean of means', '10.0146'),
('Mean of ranges', '0.052');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_28/11/2022-00:01:28`
--

DROP TABLE IF EXISTS `machine_1_capability_28/11/2022-00:01:28`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_28/11/2022-00:01:28` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_28/11/2022-00:01:28`
--

INSERT INTO `machine_1_capability_28/11/2022-00:01:28` (`id`, `value`) VALUES
('purpose', 'normality'),
('LSCe', '0.12684'),
('LICx', '9.96538'),
('LSCx', '10.03462'),
('Khi2-theoretical', '9.4877290367812'),
('khi-probability', '5'),
('Khi2-measured', '4.4321967792093'),
('normality', '1'),
('LICe', '0'),
('S', '0.024943937139112'),
('Means', '9.9832'),
('Ranges', '0.06'),
('stDev', '0.024943937139112'),
('Mean of means', '9.9832'),
('Mean of ranges', '0.06');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_28/11/2022-00:01:35`
--

DROP TABLE IF EXISTS `machine_1_capability_28/11/2022-00:01:35`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_28/11/2022-00:01:35` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_28/11/2022-00:01:35`
--

INSERT INTO `machine_1_capability_28/11/2022-00:01:35` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.045583'),
('LICx', '9.954417'),
('LSCe', '0.167006'),
('LICe', '0'),
('S', '0.036629223305989'),
('Means', '9.9972'),
('Ranges', '0.079'),
('stDev', '0.036629223305989'),
('Mean of means', '9.9972'),
('Mean of ranges', '0.079');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_28/11/2022-00:01:39`
--

DROP TABLE IF EXISTS `machine_1_capability_28/11/2022-00:01:39`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_28/11/2022-00:01:39` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_28/11/2022-00:01:39`
--

INSERT INTO `machine_1_capability_28/11/2022-00:01:39` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.012117'),
('LICx', '9.987883'),
('LSCe', '0.044394'),
('LICe', '0'),
('S', '0.0083964278118734'),
('Means', '9.992'),
('Ranges', '0.021'),
('stDev', '0.0083964278118734'),
('Mean of means', '9.992'),
('Mean of ranges', '0.021');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_28/11/2022-00:01:47`
--

DROP TABLE IF EXISTS `machine_1_capability_28/11/2022-00:01:47`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_28/11/2022-00:01:47` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_28/11/2022-00:01:47`
--

INSERT INTO `machine_1_capability_28/11/2022-00:01:47` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.032889'),
('LICx', '9.967111'),
('LSCe', '0.120498'),
('LICe', '0'),
('S', '0.023794957449006'),
('Means', '9.9938'),
('Ranges', '0.057'),
('stDev', '0.023794957449006'),
('Mean of means', '9.9938'),
('Mean of ranges', '0.057');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_28/11/2022-00:01:53`
--

DROP TABLE IF EXISTS `machine_1_capability_28/11/2022-00:01:53`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_28/11/2022-00:01:53` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_28/11/2022-00:01:53`
--

INSERT INTO `machine_1_capability_28/11/2022-00:01:53` (`id`, `value`) VALUES
('purpose', 'CalcCp'),
('Cp', '0.658158667344'),
('Cpk', '0.61866914730334'),
('Cpm', '0.10471587249311'),
('ZÃ©quivalent', '1.4650132801343'),
('Zprocessus', '2.9650132801343'),
('LSCx', '10.044429'),
('LICx', '9.955571'),
('LSCe', '0.162778'),
('LICe', '0'),
('S', '0.030716445106815'),
('Means', '10.005'),
('Ranges', '0.077'),
('stDev', '0.030716445106815'),
('Mean of means', '10.005'),
('Mean of ranges', '0.077');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_28/11/2022-00:01:57`
--

DROP TABLE IF EXISTS `machine_1_capability_28/11/2022-00:01:57`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_28/11/2022-00:01:57` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_28/11/2022-00:01:57`
--

INSERT INTO `machine_1_capability_28/11/2022-00:01:57` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.04039'),
('LICx', '9.95961'),
('LSCe', '0.14798'),
('LICe', '0'),
('S', '0.026109385285755'),
('Means', '10.0112'),
('Ranges', '0.07'),
('stDev', '0.026109385285755'),
('Mean of means', '10.0112'),
('Mean of ranges', '0.07');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_28/11/2022-00:02:02`
--

DROP TABLE IF EXISTS `machine_1_capability_28/11/2022-00:02:02`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_28/11/2022-00:02:02` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_28/11/2022-00:02:02`
--

INSERT INTO `machine_1_capability_28/11/2022-00:02:02` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.034043'),
('LICx', '9.965957'),
('LSCe', '0.124726'),
('LICe', '0'),
('S', '0.025735189915756'),
('Means', '10.0106'),
('Ranges', '0.059'),
('stDev', '0.025735189915756'),
('Mean of means', '10.0106'),
('Mean of ranges', '0.059');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_28/11/2022-00:02:07`
--

DROP TABLE IF EXISTS `machine_1_capability_28/11/2022-00:02:07`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_28/11/2022-00:02:07` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_28/11/2022-00:02:07`
--

INSERT INTO `machine_1_capability_28/11/2022-00:02:07` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.043275'),
('LICx', '9.956725'),
('LSCe', '0.15855'),
('LICe', '0'),
('S', '0.036272579174909'),
('Means', '10.0022'),
('Ranges', '0.075'),
('stDev', '0.036272579174909'),
('Mean of means', '10.0022'),
('Mean of ranges', '0.075');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_28/11/2022-00:02:11`
--

DROP TABLE IF EXISTS `machine_1_capability_28/11/2022-00:02:11`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_28/11/2022-00:02:11` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_28/11/2022-00:02:11`
--

INSERT INTO `machine_1_capability_28/11/2022-00:02:11` (`id`, `value`) VALUES
('purpose', 'CalcCp'),
('Cp', '0.52477874554621'),
('Cpk', '0.46547874729949'),
('Cpm', '0.093474756104439'),
('ZÃ©quivalent', '1.0907449174259'),
('Zprocessus', '2.5907449174259'),
('LSCx', '10.051353'),
('LICx', '9.948647'),
('LSCe', '0.188146'),
('LICe', '0'),
('S', '0.044556705443738'),
('Means', '9.9986'),
('Ranges', '0.089'),
('stDev', '0.044556705443738'),
('Mean of means', '9.9986'),
('Mean of ranges', '0.089');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_28/11/2022-00:02:15`
--

DROP TABLE IF EXISTS `machine_1_capability_28/11/2022-00:02:15`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_28/11/2022-00:02:15` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_28/11/2022-00:02:15`
--

INSERT INTO `machine_1_capability_28/11/2022-00:02:15` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.046737'),
('LICx', '9.953263'),
('LSCe', '0.171234'),
('LICe', '0'),
('S', '0.032090497035727'),
('Means', '9.9876'),
('Ranges', '0.081'),
('stDev', '0.032090497035727'),
('Mean of means', '9.9876'),
('Mean of ranges', '0.081');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_28/11/2022-00:02:20`
--

DROP TABLE IF EXISTS `machine_1_capability_28/11/2022-00:02:20`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_28/11/2022-00:02:20` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_28/11/2022-00:02:20`
--

INSERT INTO `machine_1_capability_28/11/2022-00:02:20` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.039813'),
('LICx', '9.960187'),
('LSCe', '0.145866'),
('LICe', '0'),
('S', '0.028612934138253'),
('Means', '9.9928'),
('Ranges', '0.069'),
('stDev', '0.028612934138253'),
('Mean of means', '9.9928'),
('Mean of ranges', '0.069');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_28/11/2022-00:02:24`
--

DROP TABLE IF EXISTS `machine_1_capability_28/11/2022-00:02:24`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_28/11/2022-00:02:24` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_28/11/2022-00:02:24`
--

INSERT INTO `machine_1_capability_28/11/2022-00:02:24` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.018464'),
('LICx', '9.981536'),
('LSCe', '0.067648'),
('LICe', '0'),
('S', '0.013274034804836'),
('Means', '9.9918'),
('Ranges', '0.032'),
('stDev', '0.013274034804836'),
('Mean of means', '9.9918'),
('Mean of ranges', '0.032');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_28/11/2022-00:02:28`
--

DROP TABLE IF EXISTS `machine_1_capability_28/11/2022-00:02:28`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_28/11/2022-00:02:28` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_28/11/2022-00:02:28`
--

INSERT INTO `machine_1_capability_28/11/2022-00:02:28` (`id`, `value`) VALUES
('purpose', 'CalcCp,CalcPp'),
('Pp', '0.58339954634719'),
('Ppk', '0.56978689026572'),
('Ppm', '0.098604576635722'),
('Rr', '97.66666666666'),
('Cp', '0.58712443334171'),
('Cpk', '0.51490812804069'),
('Cpm', '0.098855382170435'),
('Rs', '99.365571115254'),
('ZÃ©quivalent', '1.1562783452824'),
('Zprocessus', '2.6562783452824'),
('LSCx', '10.050199'),
('LICx', '9.949801'),
('LSCe', '0.183918'),
('LICe', '0'),
('S', '0.040474683445334'),
('Means', '10.0032'),
('Ranges', '0.087'),
('stDev', '0.040474683445334'),
('Mean of means', '10.0032'),
('Mean of ranges', '0.087');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_29/11/2022-21:32:18`
--

DROP TABLE IF EXISTS `machine_1_capability_29/11/2022-21:32:18`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_29/11/2022-21:32:18` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_29/11/2022-21:32:18`
--

INSERT INTO `machine_1_capability_29/11/2022-21:32:18` (`id`, `value`) VALUES
('purpose', 'normality'),
('LICe', '0'),
('LSCe', '0.152208'),
('normality', '0'),
('LSCx', '10.041544'),
('Khi2-theoretical', '5.9886166940042'),
('khi-probability', '20'),
('Khi2-measured', '6.0316777210514'),
('LICx', '9.958456'),
('S', '0.028119388329052'),
('Means', '10.0192'),
('Ranges', '0.072'),
('stDev', '0.028119388329052'),
('Mean of means', '10.0192'),
('Mean of ranges', '0.072');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_29/11/2022-21:32:23`
--

DROP TABLE IF EXISTS `machine_1_capability_29/11/2022-21:32:23`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_29/11/2022-21:32:23` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_29/11/2022-21:32:23`
--

INSERT INTO `machine_1_capability_29/11/2022-21:32:23` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.025965'),
('LICx', '9.974035'),
('LSCe', '0.09513'),
('LICe', '0'),
('S', '0.016562004709575'),
('Means', '10.0184'),
('Ranges', '0.045'),
('stDev', '0.016562004709575'),
('Mean of means', '10.0184'),
('Mean of ranges', '0.045');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_29/11/2022-21:32:29`
--

DROP TABLE IF EXISTS `machine_1_capability_29/11/2022-21:32:29`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_29/11/2022-21:32:29` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_29/11/2022-21:32:29`
--

INSERT INTO `machine_1_capability_29/11/2022-21:32:29` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.043852'),
('LICx', '9.956148'),
('LSCe', '0.160664'),
('LICe', '0'),
('S', '0.034586124385366'),
('Means', '9.9898'),
('Ranges', '0.076'),
('stDev', '0.034586124385366'),
('Mean of means', '9.9898'),
('Mean of ranges', '0.076');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_29/11/2022-21:32:33`
--

DROP TABLE IF EXISTS `machine_1_capability_29/11/2022-21:32:33`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_29/11/2022-21:32:33` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_29/11/2022-21:32:33`
--

INSERT INTO `machine_1_capability_29/11/2022-21:32:33` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.052507'),
('LICx', '9.947493'),
('LSCe', '0.192374'),
('LICe', '0'),
('S', '0.03732961290986'),
('Means', '10'),
('Ranges', '0.091'),
('stDev', '0.03732961290986'),
('Mean of means', '10'),
('Mean of ranges', '0.091');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_29/11/2022-21:32:37`
--

DROP TABLE IF EXISTS `machine_1_capability_29/11/2022-21:32:37`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_29/11/2022-21:32:37` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_29/11/2022-21:32:37`
--

INSERT INTO `machine_1_capability_29/11/2022-21:32:37` (`id`, `value`) VALUES
('purpose', 'CalcCp'),
('Cp', '0.53683016270545'),
('Cpk', '0.47509469399433'),
('Cpm', '0.094539152441129'),
('ZÃ©quivalent', '1.794959010306'),
('Zprocessus', '3.294959010306'),
('LSCx', '10.013271'),
('LICx', '9.986729'),
('LSCe', '0.048622'),
('LICe', '0'),
('S', '0.010473776778221'),
('Means', '9.9688'),
('Ranges', '0.023'),
('stDev', '0.010473776778221'),
('Mean of means', '9.9688'),
('Mean of ranges', '0.023');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_29/11/2022-21:32:41`
--

DROP TABLE IF EXISTS `machine_1_capability_29/11/2022-21:32:41`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_29/11/2022-21:32:41` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_29/11/2022-21:32:41`
--

INSERT INTO `machine_1_capability_29/11/2022-21:32:41` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.036351'),
('LICx', '9.963649'),
('LSCe', '0.133182'),
('LICe', '0'),
('S', '0.02477296913977'),
('Means', '10.0102'),
('Ranges', '0.063'),
('stDev', '0.02477296913977'),
('Mean of means', '10.0102'),
('Mean of ranges', '0.063');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_29/11/2022-21:32:45`
--

DROP TABLE IF EXISTS `machine_1_capability_29/11/2022-21:32:45`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_29/11/2022-21:32:45` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_29/11/2022-21:32:45`
--

INSERT INTO `machine_1_capability_29/11/2022-21:32:45` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.047891'),
('LICx', '9.952109'),
('LSCe', '0.175462'),
('LICe', '0'),
('S', '0.039839678713564'),
('Means', '10.0072'),
('Ranges', '0.083'),
('stDev', '0.039839678713564'),
('Mean of means', '10.0072'),
('Mean of ranges', '0.083');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_capability_29/11/2022-21:32:49`
--

DROP TABLE IF EXISTS `machine_1_capability_29/11/2022-21:32:49`;
CREATE TABLE IF NOT EXISTS `machine_1_capability_29/11/2022-21:32:49` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_capability_29/11/2022-21:32:49`
--

INSERT INTO `machine_1_capability_29/11/2022-21:32:49` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.042698'),
('LICx', '9.957302'),
('LSCe', '0.156436'),
('LICe', '0'),
('S', '0.036500684925081'),
('Means', '10.0054'),
('Ranges', '0.074'),
('stDev', '0.036500684925081'),
('Mean of means', '10.0054'),
('Mean of ranges', '0.074');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_khitest_01/12/2022-14:29:37`
--

DROP TABLE IF EXISTS `machine_1_khitest_01/12/2022-14:29:37`;
CREATE TABLE IF NOT EXISTS `machine_1_khitest_01/12/2022-14:29:37` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Intervalle` text,
  `Min` text,
  `Max` text,
  `Centre` text,
  `Ni` text,
  `NiXi` text,
  `NiXi_XSQR` text,
  `Zmax` text,
  `P` text,
  `Npi` text,
  `Ni_Npi` text,
  `Ni_NpiSQR` text,
  `Ni_NpiSQRNpi` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_khitest_01/12/2022-14:29:37`
--

INSERT INTO `machine_1_khitest_01/12/2022-14:29:37` (`id`, `Intervalle`, `Min`, `Max`, `Centre`, `Ni`, `NiXi`, `NiXi_XSQR`, `Zmax`, `P`, `Npi`, `Ni_Npi`, `Ni_NpiSQR`, `Ni_NpiSQRNpi`) VALUES
(1, '[ 9.953 , 9.96671 [', '9.953', '9.96671', '9.95986', '7', '69.719', '0.01096', '-1.1204', '0.13127', '6.56362', '0.43638', '0.19042', '0.02901'),
(2, '[ 9.96671 , 9.98043 [', '9.96671', '9.98043', '9.97357', '9', '89.76214', '0.00601', '-0.65059', '0.25766', '6.31919', '2.68081', '7.18673', '1.13729'),
(3, '[ 9.98043 , 9.99414 [', '9.98043', '9.99414', '9.98729', '9', '89.88557', '0.00133', '-0.18078', '0.42827', '8.53072', '0.46928', '0.22023', '0.02582'),
(4, '[ 9.99414 , 10.00786 [', '9.99414', '10.00786', '10.001', '5', '50.005', '1.0E-5', '0.28903', '0.61372', '9.27251', '4.27251', '18.25432', '1.96865'),
(5, '[ 10.00786 , 10.02157 [', '10.00786', '10.02157', '10.01471', '5', '50.07357', '0.00117', '0.75884', '0.77603', '8.11524', '3.11524', '9.70474', '1.19587'),
(6, '[ 10.02157 , 10.03529 [', '10.02157', '10.03529', '10.02843', '7', '70.199', '0.00589', '1.22865', '0.8904', '5.71862', '1.28138', '1.64194', '0.28712'),
(7, '[ 10.03529 , 10.049 ]', '10.03529', '10.049', '10.04214', '8', '80.33714', '0.0146', '1.69846', '0.95529', '3.24456', '4.75544', '22.61421', '6.96988');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_khitest_02/12/2022-09:27:06`
--

DROP TABLE IF EXISTS `machine_1_khitest_02/12/2022-09:27:06`;
CREATE TABLE IF NOT EXISTS `machine_1_khitest_02/12/2022-09:27:06` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Intervalle` text,
  `Min` text,
  `Max` text,
  `Centre` text,
  `Ni` text,
  `NiXi` text,
  `NiXi_XSQR` text,
  `Zmax` text,
  `P` text,
  `Npi` text,
  `Ni_Npi` text,
  `Ni_NpiSQR` text,
  `Ni_NpiSQRNpi` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_khitest_02/12/2022-09:27:06`
--

INSERT INTO `machine_1_khitest_02/12/2022-09:27:06` (`id`, `Intervalle`, `Min`, `Max`, `Centre`, `Ni`, `NiXi`, `NiXi_XSQR`, `Zmax`, `P`, `Npi`, `Ni_Npi`, `Ni_NpiSQR`, `Ni_NpiSQRNpi`) VALUES
(1, '[ 9.95 , 9.964 [', '9.95', '9.964', '9.957', '3', '29.871', '0.00635', '-1.4162', '0.07836', '3.91792', '0.91792', '0.84258', '0.21506'),
(2, '[ 9.964 , 9.978 [', '9.964', '9.978', '9.971', '8', '79.768', '0.00819', '-0.90782', '0.18199', '5.1814', '2.8186', '7.94452', '1.53328'),
(3, '[ 9.978 , 9.992 [', '9.978', '9.992', '9.985', '8', '79.88', '0.00259', '-0.39944', '0.34478', '8.13989', '0.13989', '0.01957', '0.0024'),
(4, '[ 9.992 , 10.006 [', '9.992', '10.006', '9.999', '8', '79.992', '0.00013', '0.10894', '0.54337', '9.92952', '1.92952', '3.72303', '0.37495'),
(5, '[ 10.006 , 10.02 [', '10.006', '10.02', '10.013', '6', '60.078', '0.0006', '0.61732', '0.73149', '9.40566', '3.40566', '11.59852', '1.23314'),
(6, '[ 10.02 , 10.034 [', '10.02', '10.034', '10.027', '10', '100.27', '0.00576', '1.1257', '0.86985', '6.91828', '3.08172', '9.49699', '1.37274'),
(7, '[ 10.034 , 10.048 ]', '10.034', '10.048', '10.041', '7', '70.287', '0.01011', '1.63408', '0.94888', '3.95127', '3.04873', '9.29473', '2.35234');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_khitest_27/11/2022-00:03:52`
--

DROP TABLE IF EXISTS `machine_1_khitest_27/11/2022-00:03:52`;
CREATE TABLE IF NOT EXISTS `machine_1_khitest_27/11/2022-00:03:52` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Intervalle` text,
  `Min` text,
  `Max` text,
  `Centre` text,
  `Ni` text,
  `NiXi` text,
  `NiXi_XSQR` text,
  `Zmax` text,
  `P` text,
  `Npi` text,
  `Ni_Npi` text,
  `Ni_NpiSQR` text,
  `Ni_NpiSQRNpi` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_khitest_27/11/2022-00:03:52`
--

INSERT INTO `machine_1_khitest_27/11/2022-00:03:52` (`id`, `Intervalle`, `Min`, `Max`, `Centre`, `Ni`, `NiXi`, `NiXi_XSQR`, `Zmax`, `P`, `Npi`, `Ni_Npi`, `Ni_NpiSQR`, `Ni_NpiSQRNpi`) VALUES
(1, '[ 9.951 , 9.96514 [', '9.951', '9.96514', '9.95807', '10', '99.58071', '0.01331', '-1.0746', '0.14128', '7.06389', '2.93611', '8.62074', '1.2204'),
(2, '[ 9.96514 , 9.97929 [', '9.96514', '9.97929', '9.97221', '10', '99.72214', '0.00499', '-0.55796', '0.28843', '7.35784', '2.64216', '6.981', '0.94878'),
(3, '[ 9.97929 , 9.99343 [', '9.97929', '9.99343', '9.98636', '4', '39.94543', '0.00027', '-0.04133', '0.48352', '9.75407', '5.75407', '33.10935', '3.39441'),
(4, '[ 9.99343 , 10.00757 [', '9.99343', '10.00757', '10.0005', '9', '90.0045', '0.00032', '0.4753', '0.68271', '9.9599', '0.9599', '0.92142', '0.09251'),
(5, '[ 10.00757 , 10.02171 [', '10.00757', '10.02171', '10.01464', '7', '70.1025', '0.00282', '0.99193', '0.83939', '7.83356', '0.83356', '0.69482', '0.0887'),
(6, '[ 10.02171 , 10.03586 [', '10.02171', '10.03586', '10.02879', '7', '70.2015', '0.0082', '1.50857', '0.9343', '4.7455', '2.2545', '5.08278', '1.07107'),
(7, '[ 10.03586 , 10.05 ]', '10.03586', '10.05', '10.04293', '3', '30.12879', '0.00702', '2.0252', '0.97858', '2.21407', '0.78593', '0.61769', '0.27898');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_khitest_28/11/2022-00:01:28`
--

DROP TABLE IF EXISTS `machine_1_khitest_28/11/2022-00:01:28`;
CREATE TABLE IF NOT EXISTS `machine_1_khitest_28/11/2022-00:01:28` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Intervalle` text,
  `Min` text,
  `Max` text,
  `Centre` text,
  `Ni` text,
  `NiXi` text,
  `NiXi_XSQR` text,
  `Zmax` text,
  `P` text,
  `Npi` text,
  `Ni_Npi` text,
  `Ni_NpiSQR` text,
  `Ni_NpiSQRNpi` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_khitest_28/11/2022-00:01:28`
--

INSERT INTO `machine_1_khitest_28/11/2022-00:01:28` (`id`, `Intervalle`, `Min`, `Max`, `Centre`, `Ni`, `NiXi`, `NiXi_XSQR`, `Zmax`, `P`, `Npi`, `Ni_Npi`, `Ni_NpiSQR`, `Ni_NpiSQRNpi`) VALUES
(1, '[ 9.951 , 9.96514 [', '9.951', '9.96514', '9.95807', '10', '99.58071', '0.01328', '-0.99801', '0.15914', '7.95684', '2.04316', '4.17449', '0.52464'),
(2, '[ 9.96514 , 9.97929 [', '9.96514', '9.97929', '9.97221', '8', '79.77771', '0.00398', '-0.51755', '0.30239', '7.16255', '0.83745', '0.70132', '0.09792'),
(3, '[ 9.97929 , 9.99343 [', '9.97929', '9.99343', '9.98636', '7', '69.9045', '0.00047', '-0.03708', '0.48521', '9.14117', '2.14117', '4.58459', '0.50153'),
(4, '[ 9.99343 , 10.00757 [', '9.99343', '10.00757', '10.0005', '7', '70.0035', '0.00025', '0.44339', '0.67126', '9.30231', '2.30231', '5.30065', '0.56982'),
(5, '[ 10.00757 , 10.02171 [', '10.00757', '10.02171', '10.01464', '7', '70.1025', '0.00283', '0.92385', '0.82222', '7.54808', '0.54808', '0.30039', '0.0398'),
(6, '[ 10.02171 , 10.03586 [', '10.02171', '10.03586', '10.02879', '6', '60.17271', '0.00704', '1.40432', '0.91989', '4.88347', '1.11653', '1.24665', '0.25528'),
(7, '[ 10.03586 , 10.05 ]', '10.03586', '10.05', '10.04293', '5', '50.21464', '0.01172', '1.88479', '0.97027', '2.51912', '2.48088', '6.15475', '2.44321');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_khitest_29/11/2022-21:32:18`
--

DROP TABLE IF EXISTS `machine_1_khitest_29/11/2022-21:32:18`;
CREATE TABLE IF NOT EXISTS `machine_1_khitest_29/11/2022-21:32:18` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Intervalle` text,
  `Min` text,
  `Max` text,
  `Centre` text,
  `Ni` text,
  `NiXi` text,
  `NiXi_XSQR` text,
  `Zmax` text,
  `P` text,
  `Npi` text,
  `Ni_Npi` text,
  `Ni_NpiSQR` text,
  `Ni_NpiSQRNpi` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_khitest_29/11/2022-21:32:18`
--

INSERT INTO `machine_1_khitest_29/11/2022-21:32:18` (`id`, `Intervalle`, `Min`, `Max`, `Centre`, `Ni`, `NiXi`, `NiXi_XSQR`, `Zmax`, `P`, `Npi`, `Ni_Npi`, `Ni_NpiSQR`, `Ni_NpiSQRNpi`) VALUES
(1, '[ 9.952 , 9.966 [', '9.952', '9.966', '9.959', '5', '49.795', '0.00883', '-1.22691', '0.10993', '5.49639', '0.49639', '0.2464', '0.04483'),
(2, '[ 9.966 , 9.98 [', '9.966', '9.98', '9.973', '8', '79.784', '0.00628', '-0.73643', '0.23074', '6.04037', '1.95963', '3.84016', '0.63575'),
(3, '[ 9.98 , 9.994 [', '9.98', '9.994', '9.987', '9', '89.883', '0.00177', '-0.24594', '0.40286', '8.6064', '0.3936', '0.15492', '0.018'),
(4, '[ 9.994 , 10.008 [', '9.994', '10.008', '10.001', '8', '80.008', '0', '0.24454', '0.59659', '9.68655', '1.68655', '2.84446', '0.29365'),
(5, '[ 10.008 , 10.022 [', '10.008', '10.022', '10.015', '5', '50.075', '0.00098', '0.73503', '0.76884', '8.6122', '3.6122', '13.04802', '1.51506'),
(6, '[ 10.022 , 10.036 [', '10.022', '10.036', '10.029', '9', '90.261', '0.00705', '1.22551', '0.88981', '6.04851', '2.95149', '8.71129', '1.44024'),
(7, '[ 10.036 , 10.05 ]', '10.036', '10.05', '10.043', '6', '60.258', '0.01057', '1.716', '0.95692', '3.3555', '2.6445', '6.99337', '2.08415');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_01/12/2022-14:29:37`
--

DROP TABLE IF EXISTS `machine_1_values_01/12/2022-14:29:37`;
CREATE TABLE IF NOT EXISTS `machine_1_values_01/12/2022-14:29:37` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_01/12/2022-14:29:37`
--

INSERT INTO `machine_1_values_01/12/2022-14:29:37` (`id`, `value`) VALUES
('1:1', '9.985'),
('1:2', '10.026'),
('1:3', '9.953'),
('1:4', '10.046'),
('1:5', '10.048'),
('1:6', '10.01'),
('1:7', '9.977'),
('1:8', '9.962'),
('1:9', '10.007'),
('1:10', '10.022'),
('1:11', '10.01'),
('1:12', '10.038'),
('1:13', '10.013'),
('1:14', '10.014'),
('1:15', '9.98'),
('1:16', '9.968'),
('1:17', '9.957'),
('1:18', '9.969'),
('1:19', '9.988'),
('1:20', '10.042'),
('1:21', '10.027'),
('1:22', '10.031'),
('1:23', '10.033'),
('1:24', '9.961'),
('1:25', '10.008'),
('1:26', '9.973'),
('1:27', '9.995'),
('1:28', '10.026'),
('1:29', '10.005'),
('1:30', '9.993'),
('1:31', '9.983'),
('1:32', '10.048'),
('1:33', '9.967'),
('1:34', '9.987'),
('1:35', '9.996'),
('1:36', '10.045'),
('1:37', '9.959'),
('1:38', '9.961'),
('1:39', '9.976'),
('1:40', '9.97'),
('1:41', '10.038'),
('1:42', '9.992'),
('1:43', '9.962'),
('1:44', '10.03'),
('1:45', '9.988'),
('1:46', '9.979'),
('1:47', '9.996'),
('1:48', '9.984'),
('1:49', '9.994'),
('1:50', '10.049');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_01/12/2022-14:29:43`
--

DROP TABLE IF EXISTS `machine_1_values_01/12/2022-14:29:43`;
CREATE TABLE IF NOT EXISTS `machine_1_values_01/12/2022-14:29:43` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_01/12/2022-14:29:43`
--

INSERT INTO `machine_1_values_01/12/2022-14:29:43` (`id`, `value`) VALUES
('1:1', '10.048'),
('1:2', '10.043'),
('1:3', '9.983'),
('1:4', '9.978'),
('1:5', '10.01');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_01/12/2022-14:29:49`
--

DROP TABLE IF EXISTS `machine_1_values_01/12/2022-14:29:49`;
CREATE TABLE IF NOT EXISTS `machine_1_values_01/12/2022-14:29:49` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_01/12/2022-14:29:49`
--

INSERT INTO `machine_1_values_01/12/2022-14:29:49` (`id`, `value`) VALUES
('1:1', '9.975'),
('1:2', '9.973'),
('1:3', '9.977'),
('1:4', '9.953'),
('1:5', '9.987');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_01/12/2022-14:29:56`
--

DROP TABLE IF EXISTS `machine_1_values_01/12/2022-14:29:56`;
CREATE TABLE IF NOT EXISTS `machine_1_values_01/12/2022-14:29:56` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_01/12/2022-14:29:56`
--

INSERT INTO `machine_1_values_01/12/2022-14:29:56` (`id`, `value`) VALUES
('1:1', '9.99'),
('1:2', '9.978'),
('1:3', '10.039'),
('1:4', '9.959'),
('1:5', '10.005');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_01/12/2022-14:30:03`
--

DROP TABLE IF EXISTS `machine_1_values_01/12/2022-14:30:03`;
CREATE TABLE IF NOT EXISTS `machine_1_values_01/12/2022-14:30:03` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_01/12/2022-14:30:03`
--

INSERT INTO `machine_1_values_01/12/2022-14:30:03` (`id`, `value`) VALUES
('1:1', '10.024'),
('1:2', '9.986'),
('1:3', '10.047'),
('1:4', '9.977'),
('1:5', '10.045');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_01/12/2022-14:31:23`
--

DROP TABLE IF EXISTS `machine_1_values_01/12/2022-14:31:23`;
CREATE TABLE IF NOT EXISTS `machine_1_values_01/12/2022-14:31:23` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_01/12/2022-14:31:23`
--

INSERT INTO `machine_1_values_01/12/2022-14:31:23` (`id`, `value`) VALUES
('1:1', '9.958'),
('1:2', '10.012'),
('1:3', '9.965'),
('1:4', '10.029'),
('1:5', '10.025');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_01/12/2022-14:31:30`
--

DROP TABLE IF EXISTS `machine_1_values_01/12/2022-14:31:30`;
CREATE TABLE IF NOT EXISTS `machine_1_values_01/12/2022-14:31:30` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_01/12/2022-14:31:30`
--

INSERT INTO `machine_1_values_01/12/2022-14:31:30` (`id`, `value`) VALUES
('1:1', '9.997'),
('1:2', '10.046'),
('1:3', '9.991'),
('1:4', '10.024'),
('1:5', '10.032');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_01/12/2022-14:31:35`
--

DROP TABLE IF EXISTS `machine_1_values_01/12/2022-14:31:35`;
CREATE TABLE IF NOT EXISTS `machine_1_values_01/12/2022-14:31:35` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_01/12/2022-14:31:35`
--

INSERT INTO `machine_1_values_01/12/2022-14:31:35` (`id`, `value`) VALUES
('1:1', '10.024'),
('1:2', '10.036'),
('1:3', '9.97'),
('1:4', '10.017'),
('1:5', '9.964');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_01/12/2022-14:31:42`
--

DROP TABLE IF EXISTS `machine_1_values_01/12/2022-14:31:42`;
CREATE TABLE IF NOT EXISTS `machine_1_values_01/12/2022-14:31:42` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_01/12/2022-14:31:42`
--

INSERT INTO `machine_1_values_01/12/2022-14:31:42` (`id`, `value`) VALUES
('1:1', '9.982'),
('1:2', '10.026'),
('1:3', '10.03'),
('1:4', '10.024'),
('1:5', '10.002');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_01/12/2022-14:31:48`
--

DROP TABLE IF EXISTS `machine_1_values_01/12/2022-14:31:48`;
CREATE TABLE IF NOT EXISTS `machine_1_values_01/12/2022-14:31:48` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_01/12/2022-14:31:48`
--

INSERT INTO `machine_1_values_01/12/2022-14:31:48` (`id`, `value`) VALUES
('1:1', '9.998'),
('1:2', '10.03'),
('1:3', '10.049'),
('1:4', '10.012'),
('1:5', '9.979');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_01/12/2022-14:31:54`
--

DROP TABLE IF EXISTS `machine_1_values_01/12/2022-14:31:54`;
CREATE TABLE IF NOT EXISTS `machine_1_values_01/12/2022-14:31:54` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_01/12/2022-14:31:54`
--

INSERT INTO `machine_1_values_01/12/2022-14:31:54` (`id`, `value`) VALUES
('1:1', '9.966'),
('1:2', '10.033'),
('1:3', '10.01'),
('1:4', '10.028'),
('1:5', '9.953');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_01/12/2022-14:32:00`
--

DROP TABLE IF EXISTS `machine_1_values_01/12/2022-14:32:00`;
CREATE TABLE IF NOT EXISTS `machine_1_values_01/12/2022-14:32:00` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_01/12/2022-14:32:00`
--

INSERT INTO `machine_1_values_01/12/2022-14:32:00` (`id`, `value`) VALUES
('1:1', '10.043'),
('1:2', '9.951'),
('1:3', '9.956'),
('1:4', '9.997'),
('1:5', '9.953');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_01/12/2022-14:32:06`
--

DROP TABLE IF EXISTS `machine_1_values_01/12/2022-14:32:06`;
CREATE TABLE IF NOT EXISTS `machine_1_values_01/12/2022-14:32:06` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_01/12/2022-14:32:06`
--

INSERT INTO `machine_1_values_01/12/2022-14:32:06` (`id`, `value`) VALUES
('1:1', '9.993'),
('1:2', '10.026'),
('1:3', '9.999'),
('1:4', '9.969'),
('1:5', '9.967');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_02/12/2022-09:27:06`
--

DROP TABLE IF EXISTS `machine_1_values_02/12/2022-09:27:06`;
CREATE TABLE IF NOT EXISTS `machine_1_values_02/12/2022-09:27:06` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_02/12/2022-09:27:06`
--

INSERT INTO `machine_1_values_02/12/2022-09:27:06` (`id`, `value`) VALUES
('1:1', '10.018'),
('1:2', '9.97'),
('1:3', '9.97'),
('1:4', '9.99'),
('1:5', '10.031'),
('1:6', '10.035'),
('1:7', '9.986'),
('1:8', '10.029'),
('1:9', '10.034'),
('1:10', '10.029'),
('1:11', '9.982'),
('1:12', '10.043'),
('1:13', '10.03'),
('1:14', '10.033'),
('1:15', '9.992'),
('1:16', '9.95'),
('1:17', '9.964'),
('1:18', '9.976'),
('1:19', '10.019'),
('1:20', '10.039'),
('1:21', '10.001'),
('1:22', '9.974'),
('1:23', '10.048'),
('1:24', '9.972'),
('1:25', '10.01'),
('1:26', '10.016'),
('1:27', '9.978'),
('1:28', '10'),
('1:29', '9.996'),
('1:30', '9.98'),
('1:31', '10.003'),
('1:32', '10.031'),
('1:33', '9.952'),
('1:34', '10.047'),
('1:35', '10.029'),
('1:36', '10'),
('1:37', '9.987'),
('1:38', '10.007'),
('1:39', '10.002'),
('1:40', '10.02'),
('1:41', '10.026'),
('1:42', '10.018'),
('1:43', '10.028'),
('1:44', '9.979'),
('1:45', '9.954'),
('1:46', '10.002'),
('1:47', '9.979'),
('1:48', '9.976'),
('1:49', '9.974'),
('1:50', '10.041');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_02/12/2022-09:27:16`
--

DROP TABLE IF EXISTS `machine_1_values_02/12/2022-09:27:16`;
CREATE TABLE IF NOT EXISTS `machine_1_values_02/12/2022-09:27:16` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_02/12/2022-09:27:16`
--

INSERT INTO `machine_1_values_02/12/2022-09:27:16` (`id`, `value`) VALUES
('1:1', '9.963'),
('1:2', '10.02'),
('1:3', '10.042'),
('1:4', '9.989'),
('1:5', '10.027');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_02/12/2022-09:27:23`
--

DROP TABLE IF EXISTS `machine_1_values_02/12/2022-09:27:23`;
CREATE TABLE IF NOT EXISTS `machine_1_values_02/12/2022-09:27:23` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_02/12/2022-09:27:23`
--

INSERT INTO `machine_1_values_02/12/2022-09:27:23` (`id`, `value`) VALUES
('1:1', '10.044'),
('1:2', '10.033'),
('1:3', '10.04'),
('1:4', '10.006'),
('1:5', '10.04');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_02/12/2022-09:27:30`
--

DROP TABLE IF EXISTS `machine_1_values_02/12/2022-09:27:30`;
CREATE TABLE IF NOT EXISTS `machine_1_values_02/12/2022-09:27:30` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_02/12/2022-09:27:30`
--

INSERT INTO `machine_1_values_02/12/2022-09:27:30` (`id`, `value`) VALUES
('1:1', '9.962'),
('1:2', '10.033'),
('1:3', '10.045'),
('1:4', '9.966'),
('1:5', '10.003');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_02/12/2022-09:29:41`
--

DROP TABLE IF EXISTS `machine_1_values_02/12/2022-09:29:41`;
CREATE TABLE IF NOT EXISTS `machine_1_values_02/12/2022-09:29:41` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_02/12/2022-09:29:41`
--

INSERT INTO `machine_1_values_02/12/2022-09:29:41` (`id`, `value`) VALUES
('1:1', '10.01'),
('1:2', '10.015'),
('1:3', '10.031'),
('1:4', '10.017'),
('1:5', '10.037');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_02/12/2022-09:29:51`
--

DROP TABLE IF EXISTS `machine_1_values_02/12/2022-09:29:51`;
CREATE TABLE IF NOT EXISTS `machine_1_values_02/12/2022-09:29:51` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_02/12/2022-09:29:51`
--

INSERT INTO `machine_1_values_02/12/2022-09:29:51` (`id`, `value`) VALUES
('1:1', '10.025'),
('1:2', '9.979'),
('1:3', '10.015'),
('1:4', '10.032'),
('1:5', '9.963');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_02/12/2022-09:29:59`
--

DROP TABLE IF EXISTS `machine_1_values_02/12/2022-09:29:59`;
CREATE TABLE IF NOT EXISTS `machine_1_values_02/12/2022-09:29:59` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_02/12/2022-09:29:59`
--

INSERT INTO `machine_1_values_02/12/2022-09:29:59` (`id`, `value`) VALUES
('1:1', '10.019'),
('1:2', '9.995'),
('1:3', '10'),
('1:4', '10.024'),
('1:5', '9.96');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_27/11/2022-00:03:52`
--

DROP TABLE IF EXISTS `machine_1_values_27/11/2022-00:03:52`;
CREATE TABLE IF NOT EXISTS `machine_1_values_27/11/2022-00:03:52` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_27/11/2022-00:03:52`
--

INSERT INTO `machine_1_values_27/11/2022-00:03:52` (`id`, `value`) VALUES
('1:1', '10.019'),
('1:2', '9.952'),
('1:3', '9.961'),
('1:4', '9.974'),
('1:5', '10'),
('1:6', '9.963'),
('1:7', '10.028'),
('1:8', '10.039'),
('1:9', '9.963'),
('1:10', '10.039'),
('1:11', '9.964'),
('1:12', '9.963'),
('1:13', '10.015'),
('1:14', '9.953'),
('1:15', '9.999'),
('1:16', '9.974'),
('1:17', '9.978'),
('1:18', '9.992'),
('1:19', '10'),
('1:20', '10.027'),
('1:21', '10.016'),
('1:22', '9.964'),
('1:23', '10.007'),
('1:24', '10.035'),
('1:25', '9.967'),
('1:26', '10.05'),
('1:27', '10.034'),
('1:28', '10.024'),
('1:29', '10.004'),
('1:30', '10.009'),
('1:31', '9.958'),
('1:32', '10.016'),
('1:33', '10.013'),
('1:34', '9.972'),
('1:35', '10.003'),
('1:36', '9.97'),
('1:37', '9.997'),
('1:38', '10.031'),
('1:39', '10.011'),
('1:40', '9.951'),
('1:41', '9.988'),
('1:42', '9.968'),
('1:43', '10.004'),
('1:44', '9.976'),
('1:45', '9.991'),
('1:46', '10.005'),
('1:47', '9.979'),
('1:48', '10.024'),
('1:49', '9.992'),
('1:50', '9.966');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_27/11/2022-00:04:02`
--

DROP TABLE IF EXISTS `machine_1_values_27/11/2022-00:04:02`;
CREATE TABLE IF NOT EXISTS `machine_1_values_27/11/2022-00:04:02` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_27/11/2022-00:04:02`
--

INSERT INTO `machine_1_values_27/11/2022-00:04:02` (`id`, `value`) VALUES
('1:1', '9.951'),
('1:2', '9.983'),
('1:3', '9.981'),
('1:4', '9.987'),
('1:5', '9.955');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_27/11/2022-00:04:06`
--

DROP TABLE IF EXISTS `machine_1_values_27/11/2022-00:04:06`;
CREATE TABLE IF NOT EXISTS `machine_1_values_27/11/2022-00:04:06` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_27/11/2022-00:04:06`
--

INSERT INTO `machine_1_values_27/11/2022-00:04:06` (`id`, `value`) VALUES
('1:1', '9.975'),
('1:2', '10.012'),
('1:3', '9.985'),
('1:4', '9.968'),
('1:5', '9.974');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_27/11/2022-00:04:13`
--

DROP TABLE IF EXISTS `machine_1_values_27/11/2022-00:04:13`;
CREATE TABLE IF NOT EXISTS `machine_1_values_27/11/2022-00:04:13` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_27/11/2022-00:04:13`
--

INSERT INTO `machine_1_values_27/11/2022-00:04:13` (`id`, `value`) VALUES
('1:1', '9.95'),
('1:2', '10.005'),
('1:3', '10.032'),
('1:4', '9.971'),
('1:5', '10.017');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_27/11/2022-00:04:16`
--

DROP TABLE IF EXISTS `machine_1_values_27/11/2022-00:04:16`;
CREATE TABLE IF NOT EXISTS `machine_1_values_27/11/2022-00:04:16` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_27/11/2022-00:04:16`
--

INSERT INTO `machine_1_values_27/11/2022-00:04:16` (`id`, `value`) VALUES
('1:1', '10.02'),
('1:2', '9.986'),
('1:3', '10.032'),
('1:4', '10.032'),
('1:5', '10.02');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_27/11/2022-00:04:20`
--

DROP TABLE IF EXISTS `machine_1_values_27/11/2022-00:04:20`;
CREATE TABLE IF NOT EXISTS `machine_1_values_27/11/2022-00:04:20` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_27/11/2022-00:04:20`
--

INSERT INTO `machine_1_values_27/11/2022-00:04:20` (`id`, `value`) VALUES
('1:1', '9.957'),
('1:2', '10.012'),
('1:3', '9.982'),
('1:4', '9.981'),
('1:5', '10.008');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_27/11/2022-00:04:23`
--

DROP TABLE IF EXISTS `machine_1_values_27/11/2022-00:04:23`;
CREATE TABLE IF NOT EXISTS `machine_1_values_27/11/2022-00:04:23` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_27/11/2022-00:04:23`
--

INSERT INTO `machine_1_values_27/11/2022-00:04:23` (`id`, `value`) VALUES
('1:1', '10.015'),
('1:2', '10.015'),
('1:3', '10.047'),
('1:4', '9.97'),
('1:5', '9.954');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_27/11/2022-00:04:27`
--

DROP TABLE IF EXISTS `machine_1_values_27/11/2022-00:04:27`;
CREATE TABLE IF NOT EXISTS `machine_1_values_27/11/2022-00:04:27` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_27/11/2022-00:04:27`
--

INSERT INTO `machine_1_values_27/11/2022-00:04:27` (`id`, `value`) VALUES
('1:1', '10.03'),
('1:2', '10.034'),
('1:3', '9.982'),
('1:4', '10.02'),
('1:5', '10.007');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_28/11/2022-00:01:28`
--

DROP TABLE IF EXISTS `machine_1_values_28/11/2022-00:01:28`;
CREATE TABLE IF NOT EXISTS `machine_1_values_28/11/2022-00:01:28` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_28/11/2022-00:01:28`
--

INSERT INTO `machine_1_values_28/11/2022-00:01:28` (`id`, `value`) VALUES
('1:1', '10.017'),
('1:2', '9.961'),
('1:3', '9.996'),
('1:4', '9.985'),
('1:5', '9.957'),
('1:6', '10.021'),
('1:7', '9.977'),
('1:8', '10.002'),
('1:9', '9.981'),
('1:10', '9.959'),
('1:11', '10.05'),
('1:12', '9.982'),
('1:13', '9.968'),
('1:14', '10.025'),
('1:15', '9.973'),
('1:16', '9.952'),
('1:17', '9.966'),
('1:18', '10.02'),
('1:19', '10.039'),
('1:20', '9.961'),
('1:21', '9.954'),
('1:22', '10.031'),
('1:23', '9.999'),
('1:24', '10.049'),
('1:25', '10.018'),
('1:26', '9.981'),
('1:27', '9.959'),
('1:28', '9.987'),
('1:29', '9.984'),
('1:30', '9.955'),
('1:31', '9.995'),
('1:32', '10.018'),
('1:33', '9.975'),
('1:34', '9.975'),
('1:35', '10.016'),
('1:36', '9.966'),
('1:37', '10.016'),
('1:38', '9.986'),
('1:39', '10.005'),
('1:40', '10.036'),
('1:41', '9.951'),
('1:42', '9.957'),
('1:43', '10.031'),
('1:44', '10.041'),
('1:45', '10.003'),
('1:46', '10.022'),
('1:47', '9.994'),
('1:48', '10.035'),
('1:49', '10.022'),
('1:50', '9.973');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_28/11/2022-00:01:35`
--

DROP TABLE IF EXISTS `machine_1_values_28/11/2022-00:01:35`;
CREATE TABLE IF NOT EXISTS `machine_1_values_28/11/2022-00:01:35` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_28/11/2022-00:01:35`
--

INSERT INTO `machine_1_values_28/11/2022-00:01:35` (`id`, `value`) VALUES
('1:1', '10.036'),
('1:2', '9.957'),
('1:3', '10.031'),
('1:4', '9.998'),
('1:5', '9.964');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_28/11/2022-00:01:39`
--

DROP TABLE IF EXISTS `machine_1_values_28/11/2022-00:01:39`;
CREATE TABLE IF NOT EXISTS `machine_1_values_28/11/2022-00:01:39` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_28/11/2022-00:01:39`
--

INSERT INTO `machine_1_values_28/11/2022-00:01:39` (`id`, `value`) VALUES
('1:1', '9.988'),
('1:2', '9.989'),
('1:3', '9.998'),
('1:4', '10.003'),
('1:5', '9.982');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_28/11/2022-00:01:47`
--

DROP TABLE IF EXISTS `machine_1_values_28/11/2022-00:01:47`;
CREATE TABLE IF NOT EXISTS `machine_1_values_28/11/2022-00:01:47` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_28/11/2022-00:01:47`
--

INSERT INTO `machine_1_values_28/11/2022-00:01:47` (`id`, `value`) VALUES
('1:1', '10.026'),
('1:2', '9.976'),
('1:3', '9.969'),
('1:4', '9.988'),
('1:5', '10.01');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_28/11/2022-00:01:53`
--

DROP TABLE IF EXISTS `machine_1_values_28/11/2022-00:01:53`;
CREATE TABLE IF NOT EXISTS `machine_1_values_28/11/2022-00:01:53` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_28/11/2022-00:01:53`
--

INSERT INTO `machine_1_values_28/11/2022-00:01:53` (`id`, `value`) VALUES
('1:1', '10.016'),
('1:2', '10.017'),
('1:3', '10.013'),
('1:4', '10.028'),
('1:5', '9.951');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_28/11/2022-00:01:57`
--

DROP TABLE IF EXISTS `machine_1_values_28/11/2022-00:01:57`;
CREATE TABLE IF NOT EXISTS `machine_1_values_28/11/2022-00:01:57` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_28/11/2022-00:01:57`
--

INSERT INTO `machine_1_values_28/11/2022-00:01:57` (`id`, `value`) VALUES
('1:1', '10.047'),
('1:2', '10.024'),
('1:3', '9.977'),
('1:4', '10.006'),
('1:5', '10.002');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_28/11/2022-00:02:02`
--

DROP TABLE IF EXISTS `machine_1_values_28/11/2022-00:02:02`;
CREATE TABLE IF NOT EXISTS `machine_1_values_28/11/2022-00:02:02` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_28/11/2022-00:02:02`
--

INSERT INTO `machine_1_values_28/11/2022-00:02:02` (`id`, `value`) VALUES
('1:1', '9.991'),
('1:2', '10.033'),
('1:3', '9.982'),
('1:4', '10.006'),
('1:5', '10.041');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_28/11/2022-00:02:07`
--

DROP TABLE IF EXISTS `machine_1_values_28/11/2022-00:02:07`;
CREATE TABLE IF NOT EXISTS `machine_1_values_28/11/2022-00:02:07` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_28/11/2022-00:02:07`
--

INSERT INTO `machine_1_values_28/11/2022-00:02:07` (`id`, `value`) VALUES
('1:1', '9.959'),
('1:2', '10.034'),
('1:3', '10.02'),
('1:4', '10.031'),
('1:5', '9.967');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_28/11/2022-00:02:11`
--

DROP TABLE IF EXISTS `machine_1_values_28/11/2022-00:02:11`;
CREATE TABLE IF NOT EXISTS `machine_1_values_28/11/2022-00:02:11` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_28/11/2022-00:02:11`
--

INSERT INTO `machine_1_values_28/11/2022-00:02:11` (`id`, `value`) VALUES
('1:1', '9.963'),
('1:2', '10.05'),
('1:3', '9.975'),
('1:4', '9.961'),
('1:5', '10.044');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_28/11/2022-00:02:15`
--

DROP TABLE IF EXISTS `machine_1_values_28/11/2022-00:02:15`;
CREATE TABLE IF NOT EXISTS `machine_1_values_28/11/2022-00:02:15` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_28/11/2022-00:02:15`
--

INSERT INTO `machine_1_values_28/11/2022-00:02:15` (`id`, `value`) VALUES
('1:1', '10.003'),
('1:2', '9.953'),
('1:3', '9.983'),
('1:4', '9.965'),
('1:5', '10.034');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_28/11/2022-00:02:20`
--

DROP TABLE IF EXISTS `machine_1_values_28/11/2022-00:02:20`;
CREATE TABLE IF NOT EXISTS `machine_1_values_28/11/2022-00:02:20` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_28/11/2022-00:02:20`
--

INSERT INTO `machine_1_values_28/11/2022-00:02:20` (`id`, `value`) VALUES
('1:1', '10.031'),
('1:2', '10.006'),
('1:3', '9.967'),
('1:4', '9.998'),
('1:5', '9.962');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_28/11/2022-00:02:24`
--

DROP TABLE IF EXISTS `machine_1_values_28/11/2022-00:02:24`;
CREATE TABLE IF NOT EXISTS `machine_1_values_28/11/2022-00:02:24` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_28/11/2022-00:02:24`
--

INSERT INTO `machine_1_values_28/11/2022-00:02:24` (`id`, `value`) VALUES
('1:1', '9.98'),
('1:2', '9.982'),
('1:3', '9.998'),
('1:4', '10.012'),
('1:5', '9.987');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_28/11/2022-00:02:28`
--

DROP TABLE IF EXISTS `machine_1_values_28/11/2022-00:02:28`;
CREATE TABLE IF NOT EXISTS `machine_1_values_28/11/2022-00:02:28` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_28/11/2022-00:02:28`
--

INSERT INTO `machine_1_values_28/11/2022-00:02:28` (`id`, `value`) VALUES
('1:1', '9.957'),
('1:2', '10.044'),
('1:3', '10.033'),
('1:4', '9.963'),
('1:5', '10.019');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_29/11/2022-21:32:18`
--

DROP TABLE IF EXISTS `machine_1_values_29/11/2022-21:32:18`;
CREATE TABLE IF NOT EXISTS `machine_1_values_29/11/2022-21:32:18` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_29/11/2022-21:32:18`
--

INSERT INTO `machine_1_values_29/11/2022-21:32:18` (`id`, `value`) VALUES
('1:1', '10.05'),
('1:2', '9.978'),
('1:3', '10.005'),
('1:4', '10.029'),
('1:5', '10.034'),
('1:6', '10.027'),
('1:7', '10.017'),
('1:8', '10.033'),
('1:9', '9.989'),
('1:10', '10.026'),
('1:11', '9.994'),
('1:12', '10.003'),
('1:13', '9.972'),
('1:14', '10.048'),
('1:15', '10.041'),
('1:16', '10.031'),
('1:17', '9.981'),
('1:18', '9.993'),
('1:19', '10.019'),
('1:20', '9.984'),
('1:21', '10.003'),
('1:22', '9.981'),
('1:23', '9.977'),
('1:24', '10.035'),
('1:25', '10.02'),
('1:26', '9.968'),
('1:27', '9.972'),
('1:28', '9.985'),
('1:29', '9.957'),
('1:30', '9.952'),
('1:31', '9.995'),
('1:32', '10.034'),
('1:33', '9.994'),
('1:34', '9.979'),
('1:35', '9.954'),
('1:36', '9.975'),
('1:37', '9.997'),
('1:38', '9.952'),
('1:39', '10.043'),
('1:40', '9.984'),
('1:41', '10.021'),
('1:42', '10.014'),
('1:43', '9.953'),
('1:44', '10.039'),
('1:45', '9.98'),
('1:46', '10.037'),
('1:47', '10.007'),
('1:48', '10.028'),
('1:49', '9.979'),
('1:50', '9.982');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_29/11/2022-21:32:23`
--

DROP TABLE IF EXISTS `machine_1_values_29/11/2022-21:32:23`;
CREATE TABLE IF NOT EXISTS `machine_1_values_29/11/2022-21:32:23` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_29/11/2022-21:32:23`
--

INSERT INTO `machine_1_values_29/11/2022-21:32:23` (`id`, `value`) VALUES
('1:1', '10.026'),
('1:2', '10.039'),
('1:3', '10.019'),
('1:4', '10.014'),
('1:5', '9.994');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_29/11/2022-21:32:29`
--

DROP TABLE IF EXISTS `machine_1_values_29/11/2022-21:32:29`;
CREATE TABLE IF NOT EXISTS `machine_1_values_29/11/2022-21:32:29` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_29/11/2022-21:32:29`
--

INSERT INTO `machine_1_values_29/11/2022-21:32:29` (`id`, `value`) VALUES
('1:1', '9.97'),
('1:2', '10.022'),
('1:3', '9.956'),
('1:4', '10.032'),
('1:5', '9.969');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_29/11/2022-21:32:33`
--

DROP TABLE IF EXISTS `machine_1_values_29/11/2022-21:32:33`;
CREATE TABLE IF NOT EXISTS `machine_1_values_29/11/2022-21:32:33` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_29/11/2022-21:32:33`
--

INSERT INTO `machine_1_values_29/11/2022-21:32:33` (`id`, `value`) VALUES
('1:1', '9.996'),
('1:2', '10.048'),
('1:3', '10.026'),
('1:4', '9.973'),
('1:5', '9.957');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_29/11/2022-21:32:37`
--

DROP TABLE IF EXISTS `machine_1_values_29/11/2022-21:32:37`;
CREATE TABLE IF NOT EXISTS `machine_1_values_29/11/2022-21:32:37` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_29/11/2022-21:32:37`
--

INSERT INTO `machine_1_values_29/11/2022-21:32:37` (`id`, `value`) VALUES
('1:1', '9.964'),
('1:2', '9.979'),
('1:3', '9.958'),
('1:4', '9.962'),
('1:5', '9.981');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_29/11/2022-21:32:41`
--

DROP TABLE IF EXISTS `machine_1_values_29/11/2022-21:32:41`;
CREATE TABLE IF NOT EXISTS `machine_1_values_29/11/2022-21:32:41` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_29/11/2022-21:32:41`
--

INSERT INTO `machine_1_values_29/11/2022-21:32:41` (`id`, `value`) VALUES
('1:1', '9.981'),
('1:2', '10.023'),
('1:3', '9.993'),
('1:4', '10.01'),
('1:5', '10.044');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_29/11/2022-21:32:45`
--

DROP TABLE IF EXISTS `machine_1_values_29/11/2022-21:32:45`;
CREATE TABLE IF NOT EXISTS `machine_1_values_29/11/2022-21:32:45` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_29/11/2022-21:32:45`
--

INSERT INTO `machine_1_values_29/11/2022-21:32:45` (`id`, `value`) VALUES
('1:1', '10.045'),
('1:2', '10.039'),
('1:3', '10.023'),
('1:4', '9.962'),
('1:5', '9.967');

-- --------------------------------------------------------

--
-- Structure de la table `machine_1_values_29/11/2022-21:32:49`
--

DROP TABLE IF EXISTS `machine_1_values_29/11/2022-21:32:49`;
CREATE TABLE IF NOT EXISTS `machine_1_values_29/11/2022-21:32:49` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_1_values_29/11/2022-21:32:49`
--

INSERT INTO `machine_1_values_29/11/2022-21:32:49` (`id`, `value`) VALUES
('1:1', '10.022'),
('1:2', '9.967'),
('1:3', '10.034'),
('1:4', '10.039'),
('1:5', '9.965');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_capability_02/12/2022-10:44:57`
--

DROP TABLE IF EXISTS `machine_2_capability_02/12/2022-10:44:57`;
CREATE TABLE IF NOT EXISTS `machine_2_capability_02/12/2022-10:44:57` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_capability_02/12/2022-10:44:57`
--

INSERT INTO `machine_2_capability_02/12/2022-10:44:57` (`id`, `value`) VALUES
('purpose', 'normality'),
('Khi2-measured', '10.982045277308'),
('Khi2-theoretical', '9.4877290367812'),
('khi-probability', '5'),
('normality', '0'),
('LSCx', '10.02002'),
('LICx', '9.97998'),
('LSCe', '0.115505'),
('LICe', '0.014495'),
('S', '0.021136855647581'),
('Means', '10.0189'),
('Ranges', '0.065'),
('stDev', '0.021136855647581'),
('Mean of means', '10.0189'),
('Mean of ranges', '0.065');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_capability_02/12/2022-10:45:10`
--

DROP TABLE IF EXISTS `machine_2_capability_02/12/2022-10:45:10`;
CREATE TABLE IF NOT EXISTS `machine_2_capability_02/12/2022-10:45:10` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_capability_02/12/2022-10:45:10`
--

INSERT INTO `machine_2_capability_02/12/2022-10:45:10` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.022176'),
('LICx', '9.977824'),
('LSCe', '0.127944'),
('LICe', '0.016056'),
('S', '0.022075879245104'),
('Means', '10.0123'),
('Ranges', '0.072'),
('stDev', '0.022075879245104'),
('Mean of means', '10.0123'),
('Mean of ranges', '0.072');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_capability_02/12/2022-10:45:22`
--

DROP TABLE IF EXISTS `machine_2_capability_02/12/2022-10:45:22`;
CREATE TABLE IF NOT EXISTS `machine_2_capability_02/12/2022-10:45:22` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_capability_02/12/2022-10:45:22`
--

INSERT INTO `machine_2_capability_02/12/2022-10:45:22` (`id`, `value`) VALUES
('purpose', 'CalcCp'),
('Cp', '2.0831239655322'),
('Cpk', '1.9484152824278'),
('Cpm', '1.931371937022'),
('ZÃ©quivalent', '5.9535682934911'),
('Zprocessus', '7.4535682934911'),
('LSCx', '10.024948'),
('LICx', '9.975052'),
('LSCe', '0.143937'),
('LICe', '0.018063'),
('S', '0.026718491308039'),
('Means', '10.0071'),
('Ranges', '0.081'),
('stDev', '0.026718491308039'),
('Mean of means', '10.0071'),
('Mean of ranges', '0.081');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_capability_02/12/2022-10:45:53`
--

DROP TABLE IF EXISTS `machine_2_capability_02/12/2022-10:45:53`;
CREATE TABLE IF NOT EXISTS `machine_2_capability_02/12/2022-10:45:53` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_capability_02/12/2022-10:45:53`
--

INSERT INTO `machine_2_capability_02/12/2022-10:45:53` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.028644'),
('LICx', '9.971356'),
('LSCe', '0.165261'),
('LICe', '0.020739'),
('S', '0.034138443627871'),
('Means', '9.9919'),
('Ranges', '0.093'),
('stDev', '0.034138443627871'),
('Mean of means', '9.9919'),
('Mean of ranges', '0.093');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_capability_02/12/2022-10:46:09`
--

DROP TABLE IF EXISTS `machine_2_capability_02/12/2022-10:46:09`;
CREATE TABLE IF NOT EXISTS `machine_2_capability_02/12/2022-10:46:09` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_capability_02/12/2022-10:46:09`
--

INSERT INTO `machine_2_capability_02/12/2022-10:46:09` (`id`, `value`) VALUES
('purpose', 'CalcCp'),
('Cp', '1.5480641523386'),
('Cpk', '1.5341315749676'),
('Cpm', '1.5467136485739'),
('ZÃ©quivalent', '4.3098106001106'),
('Zprocessus', '5.8098106001106'),
('LSCx', '10.024332'),
('LICx', '9.975668'),
('LSCe', '0.140383'),
('LICe', '0.017617'),
('S', '0.028955137713366'),
('Means', '10.0108'),
('Ranges', '0.079'),
('stDev', '0.028955137713366'),
('Mean of means', '10.0108'),
('Mean of ranges', '0.079');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_capability_02/12/2022-10:46:34`
--

DROP TABLE IF EXISTS `machine_2_capability_02/12/2022-10:46:34`;
CREATE TABLE IF NOT EXISTS `machine_2_capability_02/12/2022-10:46:34` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_capability_02/12/2022-10:46:34`
--

INSERT INTO `machine_2_capability_02/12/2022-10:46:34` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.020328'),
('LICx', '9.979672'),
('LSCe', '0.117282'),
('LICe', '0.014718'),
('S', '0.021630482606215'),
('Means', '10.0129'),
('Ranges', '0.066'),
('stDev', '0.021630482606215'),
('Mean of means', '10.0129'),
('Mean of ranges', '0.066');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_capability_02/12/2022-10:46:52`
--

DROP TABLE IF EXISTS `machine_2_capability_02/12/2022-10:46:52`;
CREATE TABLE IF NOT EXISTS `machine_2_capability_02/12/2022-10:46:52` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_capability_02/12/2022-10:46:52`
--

INSERT INTO `machine_2_capability_02/12/2022-10:46:52` (`id`, `value`) VALUES
('purpose', 'CalcCp'),
('Cp', '2.0882094160354'),
('Cpk', '1.9775343169855'),
('Cpm', '1.9818257119254'),
('ZÃ©quivalent', '6.1393356831442'),
('Zprocessus', '7.6393356831442'),
('LSCx', '10.023408'),
('LICx', '9.976592'),
('LSCe', '0.135052'),
('LICe', '0.016948'),
('S', '0.026229754097208'),
('Means', '10.003'),
('Ranges', '0.076'),
('stDev', '0.026229754097208'),
('Mean of means', '10.003'),
('Mean of ranges', '0.076');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_capability_02/12/2022-10:47:01`
--

DROP TABLE IF EXISTS `machine_2_capability_02/12/2022-10:47:01`;
CREATE TABLE IF NOT EXISTS `machine_2_capability_02/12/2022-10:47:01` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_capability_02/12/2022-10:47:01`
--

INSERT INTO `machine_2_capability_02/12/2022-10:47:01` (`id`, `value`) VALUES
('purpose', 'CalcPp'),
('Pp', '1.8614362202135'),
('Ppk', '1.8022248204467'),
('Ppm', '1.8327456430405'),
('Rr', '96.819047619047'),
('LSCx', '10.025256'),
('LICx', '9.974744'),
('LSCe', '0.145714'),
('LICe', '0.018286'),
('S', '0.02650869878193'),
('Means', '9.9954'),
('Ranges', '0.082'),
('stDev', '0.02650869878193'),
('Mean of means', '9.9954'),
('Mean of ranges', '0.082');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_capability_27/11/2022-23:29:22`
--

DROP TABLE IF EXISTS `machine_2_capability_27/11/2022-23:29:22`;
CREATE TABLE IF NOT EXISTS `machine_2_capability_27/11/2022-23:29:22` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_capability_27/11/2022-23:29:22`
--

INSERT INTO `machine_2_capability_27/11/2022-23:29:22` (`id`, `value`) VALUES
('purpose', 'normality'),
('stDev', '0.031379398762033'),
('Means', '10.003'),
('Ranges', '0.086'),
('normality', '1'),
('LSCx', '10.026488'),
('LICx', '9.973512'),
('LSCe', '0.152822'),
('LICe', '0.019178'),
('Khi2-theoretical', '23.51274244499'),
('khi-probability', '0.01'),
('Khi2-measured', '22.987926004714'),
('S', '0.031379398762033'),
('Mean of means', '10.003'),
('Mean of ranges', '0.086');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_capability_27/11/2022-23:29:42`
--

DROP TABLE IF EXISTS `machine_2_capability_27/11/2022-23:29:42`;
CREATE TABLE IF NOT EXISTS `machine_2_capability_27/11/2022-23:29:42` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_capability_27/11/2022-23:29:42`
--

INSERT INTO `machine_2_capability_27/11/2022-23:29:42` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.018788'),
('LICx', '9.981212'),
('LSCe', '0.108397'),
('LICe', '0.013603'),
('S', '0.022276295323355'),
('Means', '9.9937'),
('Ranges', '0.061'),
('stDev', '0.022276295323355'),
('Mean of means', '9.9937'),
('Mean of ranges', '0.061');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_capability_27/11/2022-23:29:58`
--

DROP TABLE IF EXISTS `machine_2_capability_27/11/2022-23:29:58`;
CREATE TABLE IF NOT EXISTS `machine_2_capability_27/11/2022-23:29:58` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_capability_27/11/2022-23:29:58`
--

INSERT INTO `machine_2_capability_27/11/2022-23:29:58` (`id`, `value`) VALUES
('purpose', 'CalcCp'),
('Cp', '2.1523970347695'),
('Cpk', '1.9723131495271'),
('Cpm', '0.32694813982525'),
('ZÃ©quivalent', '5.5632300445018'),
('Zprocessus', '7.0632300445018'),
('LSCx', '10.022792'),
('LICx', '9.977208'),
('LSCe', '0.131498'),
('LICe', '0.016502'),
('S', '0.02358342167239'),
('Means', '9.9812'),
('Ranges', '0.074'),
('stDev', '0.02358342167239'),
('Mean of means', '9.9812'),
('Mean of ranges', '0.074');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_capability_27/11/2022-23:30:06`
--

DROP TABLE IF EXISTS `machine_2_capability_27/11/2022-23:30:06`;
CREATE TABLE IF NOT EXISTS `machine_2_capability_27/11/2022-23:30:06` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_capability_27/11/2022-23:30:06`
--

INSERT INTO `machine_2_capability_27/11/2022-23:30:06` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.018788'),
('LICx', '9.981212'),
('LSCe', '0.108397'),
('LICe', '0.013603'),
('S', '0.024344974384414'),
('Means', '10.0183'),
('Ranges', '0.061'),
('stDev', '0.024344974384414'),
('Mean of means', '10.0183'),
('Mean of ranges', '0.061');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_capability_27/11/2022-23:30:13`
--

DROP TABLE IF EXISTS `machine_2_capability_27/11/2022-23:30:13`;
CREATE TABLE IF NOT EXISTS `machine_2_capability_27/11/2022-23:30:13` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_capability_27/11/2022-23:30:13`
--

INSERT INTO `machine_2_capability_27/11/2022-23:30:13` (`id`, `value`) VALUES
('purpose', 'CalcCp'),
('Cp', '2.0772918920504'),
('Cpk', '1.866100549692'),
('Cpm', '0.32073455988299'),
('ZÃ©quivalent', '5.5805788469283'),
('Zprocessus', '7.0805788469283'),
('LSCx', '10.024024'),
('LICx', '9.975976'),
('LSCe', '0.138606'),
('LICe', '0.017394'),
('S', '0.024692778971459'),
('Means', '10.0122'),
('Ranges', '0.078'),
('stDev', '0.024692778971459'),
('Mean of means', '10.0122'),
('Mean of ranges', '0.078');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_capability_27/11/2022-23:30:19`
--

DROP TABLE IF EXISTS `machine_2_capability_27/11/2022-23:30:19`;
CREATE TABLE IF NOT EXISTS `machine_2_capability_27/11/2022-23:30:19` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_capability_27/11/2022-23:30:19`
--

INSERT INTO `machine_2_capability_27/11/2022-23:30:19` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.026488'),
('LICx', '9.973512'),
('LSCe', '0.152822'),
('LICe', '0.019178'),
('S', '0.027909377157746'),
('Means', '9.9964'),
('Ranges', '0.086'),
('stDev', '0.027909377157746'),
('Mean of means', '9.9964'),
('Mean of ranges', '0.086');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_capability_27/11/2022-23:30:26`
--

DROP TABLE IF EXISTS `machine_2_capability_27/11/2022-23:30:26`;
CREATE TABLE IF NOT EXISTS `machine_2_capability_27/11/2022-23:30:26` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_capability_27/11/2022-23:30:26`
--

INSERT INTO `machine_2_capability_27/11/2022-23:30:26` (`id`, `value`) VALUES
('purpose', 'CalcCp'),
('Cp', '1.8115466413868'),
('Cpk', '1.807923548104'),
('Cpm', '0.30096019124992'),
('ZÃ©quivalent', '5.1693316836232'),
('Zprocessus', '6.6693316836232'),
('LSCx', '10.025256'),
('LICx', '9.974744'),
('LSCe', '0.145714'),
('LICe', '0.018286'),
('S', '0.028204806524972'),
('Means', '10.0042'),
('Ranges', '0.082'),
('stDev', '0.028204806524972'),
('Mean of means', '10.0042'),
('Mean of ranges', '0.082');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_capability_27/11/2022-23:30:34`
--

DROP TABLE IF EXISTS `machine_2_capability_27/11/2022-23:30:34`;
CREATE TABLE IF NOT EXISTS `machine_2_capability_27/11/2022-23:30:34` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_capability_27/11/2022-23:30:34`
--

INSERT INTO `machine_2_capability_27/11/2022-23:30:34` (`id`, `value`) VALUES
('purpose', 'CalcPp'),
('Pp', '1.8507769895697'),
('Ppk', '1.8326217486244'),
('Ppm', '0.30418979895024'),
('Rr', '99.019047619048'),
('ZÃ©quivalent', '5.305260220561'),
('Zprocessus', '6.805260220561'),
('LSCx', '10.024024'),
('LICx', '9.975976'),
('LSCe', '0.138606'),
('LICe', '0.017394'),
('S', '0.027463308856242'),
('Means', '10.0043'),
('Ranges', '0.078'),
('stDev', '0.027463308856242'),
('Mean of means', '10.0043'),
('Mean of ranges', '0.078');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_capability_28/11/2022-00:02:51`
--

DROP TABLE IF EXISTS `machine_2_capability_28/11/2022-00:02:51`;
CREATE TABLE IF NOT EXISTS `machine_2_capability_28/11/2022-00:02:51` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_capability_28/11/2022-00:02:51`
--

INSERT INTO `machine_2_capability_28/11/2022-00:02:51` (`id`, `value`) VALUES
('purpose', 'normality'),
('stDev', '0.021679739645833'),
('Mean of means', '9.9913'),
('LSCe', '0.117282'),
('LICe', '0.014718'),
('S', '0.021679739645833'),
('Means', '9.9913'),
('khi-probability', '5'),
('normality', '1'),
('LSCx', '10.020328'),
('LICx', '9.979672'),
('Khi2-theoretical', '9.4877290367812'),
('Khi2-measured', '9.2193367441111'),
('Ranges', '0.066'),
('Mean of ranges', '0.066');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_capability_28/11/2022-00:02:56`
--

DROP TABLE IF EXISTS `machine_2_capability_28/11/2022-00:02:56`;
CREATE TABLE IF NOT EXISTS `machine_2_capability_28/11/2022-00:02:56` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_capability_28/11/2022-00:02:56`
--

INSERT INTO `machine_2_capability_28/11/2022-00:02:56` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.016324'),
('LICx', '9.983676'),
('LSCe', '0.094181'),
('LICe', '0.011819'),
('S', '0.019920954907947'),
('Means', '9.9968'),
('Ranges', '0.053'),
('stDev', '0.019920954907947'),
('Mean of means', '9.9968'),
('Mean of ranges', '0.053');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_capability_28/11/2022-00:02:59`
--

DROP TABLE IF EXISTS `machine_2_capability_28/11/2022-00:02:59`;
CREATE TABLE IF NOT EXISTS `machine_2_capability_28/11/2022-00:02:59` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_capability_28/11/2022-00:02:59`
--

INSERT INTO `machine_2_capability_28/11/2022-00:02:59` (`id`, `value`) VALUES
('purpose', 'CalcCp'),
('Cp', '2.1819820406804'),
('Cpk', '2.144161018642'),
('Cpm', '0.3302528226335'),
('ZÃ©quivalent', '5.6106898777542'),
('Zprocessus', '7.1106898777542'),
('LSCx', '10.020328'),
('LICx', '9.979672'),
('LSCe', '0.117282'),
('LICe', '0.014718'),
('S', '0.025237538178938'),
('Means', '10.0084'),
('Ranges', '0.066'),
('stDev', '0.025237538178938'),
('Mean of means', '10.0084'),
('Mean of ranges', '0.066');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_capability_28/11/2022-00:03:04`
--

DROP TABLE IF EXISTS `machine_2_capability_28/11/2022-00:03:04`;
CREATE TABLE IF NOT EXISTS `machine_2_capability_28/11/2022-00:03:04` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_capability_28/11/2022-00:03:04`
--

INSERT INTO `machine_2_capability_28/11/2022-00:03:04` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.026796'),
('LICx', '9.973204'),
('LSCe', '0.154599'),
('LICe', '0.019401'),
('S', '0.032254026449766'),
('Means', '9.9991'),
('Ranges', '0.087'),
('stDev', '0.032254026449766'),
('Mean of means', '9.9991'),
('Mean of ranges', '0.087');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_capability_28/11/2022-00:03:20`
--

DROP TABLE IF EXISTS `machine_2_capability_28/11/2022-00:03:20`;
CREATE TABLE IF NOT EXISTS `machine_2_capability_28/11/2022-00:03:20` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_capability_28/11/2022-00:03:20`
--

INSERT INTO `machine_2_capability_28/11/2022-00:03:20` (`id`, `value`) VALUES
('purpose', 'CalcCp'),
('Cp', '1.7161551480165'),
('Cpk', '1.6932730793763'),
('Cpm', '0.292909505247'),
('ZÃ©quivalent', '5.3594314045067'),
('Zprocessus', '6.8594314045067'),
('LSCx', '10.0231'),
('LICx', '9.9769'),
('LSCe', '0.133275'),
('LICe', '0.016725'),
('S', '0.027073767541458'),
('Means', '10.0049'),
('Ranges', '0.075'),
('stDev', '0.027073767541458'),
('Mean of means', '10.0049'),
('Mean of ranges', '0.075');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_capability_28/11/2022-00:03:26`
--

DROP TABLE IF EXISTS `machine_2_capability_28/11/2022-00:03:26`;
CREATE TABLE IF NOT EXISTS `machine_2_capability_28/11/2022-00:03:26` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_capability_28/11/2022-00:03:26`
--

INSERT INTO `machine_2_capability_28/11/2022-00:03:26` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.027412'),
('LICx', '9.972588'),
('LSCe', '0.158153'),
('LICe', '0.019847'),
('S', '0.030595751339034'),
('Means', '10.0099'),
('Ranges', '0.089'),
('stDev', '0.030595751339034'),
('Mean of means', '10.0099'),
('Mean of ranges', '0.089');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_capability_28/11/2022-03:18:38`
--

DROP TABLE IF EXISTS `machine_2_capability_28/11/2022-03:18:38`;
CREATE TABLE IF NOT EXISTS `machine_2_capability_28/11/2022-03:18:38` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_capability_28/11/2022-03:18:38`
--

INSERT INTO `machine_2_capability_28/11/2022-03:18:38` (`id`, `value`) VALUES
('purpose', 'CalcCp'),
('Cp', '1.7585929776442'),
('Cpk', '1.6354914692092'),
('Cpm', '0.29595608010577'),
('ZÃ©quivalent', '5.0067284990478'),
('Zprocessus', '6.5067284990478'),
('LSCx', '10.028336'),
('LICx', '9.971664'),
('LSCe', '0.163484'),
('LICe', '0.020516'),
('S', '0.027742666698707'),
('Means', '10.0111'),
('Ranges', '0.092'),
('stDev', '0.027742666698707'),
('Mean of means', '10.0111'),
('Mean of ranges', '0.092');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_khitest_02/12/2022-10:44:57`
--

DROP TABLE IF EXISTS `machine_2_khitest_02/12/2022-10:44:57`;
CREATE TABLE IF NOT EXISTS `machine_2_khitest_02/12/2022-10:44:57` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Intervalle` text,
  `Min` text,
  `Max` text,
  `Centre` text,
  `Ni` text,
  `NiXi` text,
  `NiXi_XSQR` text,
  `Zmax` text,
  `P` text,
  `Npi` text,
  `Ni_Npi` text,
  `Ni_NpiSQR` text,
  `Ni_NpiSQRNpi` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_khitest_02/12/2022-10:44:57`
--

INSERT INTO `machine_2_khitest_02/12/2022-10:44:57` (`id`, `Intervalle`, `Min`, `Max`, `Centre`, `Ni`, `NiXi`, `NiXi_XSQR`, `Zmax`, `P`, `Npi`, `Ni_Npi`, `Ni_NpiSQR`, `Ni_NpiSQRNpi`) VALUES
(1, '[ 9.951 , 9.96471 [', '9.951', '9.96471', '9.95786', '6', '59.74714', '0.01371', '-1.49409', '0.06758', '3.37883', '2.62117', '6.87051', '2.0334'),
(2, '[ 9.96471 , 9.97843 [', '9.96471', '9.97843', '9.97157', '2', '19.94314', '0.00232', '-0.99366', '0.16019', '4.63089', '2.63089', '6.92157', '1.49465'),
(3, '[ 9.97843 , 9.99214 [', '9.97843', '9.99214', '9.98529', '8', '79.88229', '0.00332', '-0.49323', '0.31092', '7.53648', '0.46352', '0.21485', '0.02851'),
(4, '[ 9.99214 , 10.00586 [', '9.99214', '10.00586', '9.999', '7', '69.993', '0.00031', '0.00719', '0.50287', '9.59729', '2.59729', '6.7459', '0.7029'),
(5, '[ 10.00586 , 10.01957 [', '10.00586', '10.01957', '10.01271', '7', '70.089', '0.00035', '0.50762', '0.69414', '9.56351', '2.56351', '6.57159', '0.68715'),
(6, '[ 10.01957 , 10.03329 [', '10.01957', '10.03329', '10.02643', '11', '110.29071', '0.00474', '1.00805', '0.84328', '7.45719', '3.54281', '12.5515', '1.68314'),
(7, '[ 10.03329 , 10.047 ]', '10.03329', '10.047', '10.04014', '9', '90.36129', '0.0107', '1.50847', '0.93428', '4.54997', '4.45003', '19.80281', '4.3523');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_khitest_27/11/2022-23:29:22`
--

DROP TABLE IF EXISTS `machine_2_khitest_27/11/2022-23:29:22`;
CREATE TABLE IF NOT EXISTS `machine_2_khitest_27/11/2022-23:29:22` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Intervalle` text,
  `Min` text,
  `Max` text,
  `Centre` text,
  `Ni` text,
  `NiXi` text,
  `NiXi_XSQR` text,
  `Zmax` text,
  `P` text,
  `Npi` text,
  `Ni_Npi` text,
  `Ni_NpiSQR` text,
  `Ni_NpiSQRNpi` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_khitest_27/11/2022-23:29:22`
--

INSERT INTO `machine_2_khitest_27/11/2022-23:29:22` (`id`, `Intervalle`, `Min`, `Max`, `Centre`, `Ni`, `NiXi`, `NiXi_XSQR`, `Zmax`, `P`, `Npi`, `Ni_Npi`, `Ni_NpiSQR`, `Ni_NpiSQRNpi`) VALUES
(1, '[ 9.953 , 9.96657 [', '9.953', '9.96657', '9.95979', '10', '99.59786', '0.01757', '-1.10705', '0.13414', '6.70686', '3.29314', '10.8448', '1.61697'),
(2, '[ 9.96657 , 9.98014 [', '9.96657', '9.98014', '9.97336', '7', '69.8135', '0.00562', '-0.67935', '0.24846', '5.71598', '1.28402', '1.64872', '0.28844'),
(3, '[ 9.98014 , 9.99371 [', '9.98014', '9.99371', '9.98693', '4', '39.94771', '0.00087', '-0.25166', '0.40065', '7.60971', '3.60971', '13.03004', '1.71229'),
(4, '[ 9.99371 , 10.00729 [', '9.99371', '10.00729', '10.0005', '4', '40.002', '1.0E-5', '0.17603', '0.56986', '8.46067', '4.46067', '19.89757', '2.35177'),
(5, '[ 10.00729 , 10.02086 [', '10.00729', '10.02086', '10.01407', '6', '60.08443', '0.00092', '0.60372', '0.72699', '7.85605', '1.85605', '3.4449', '0.4385'),
(6, '[ 10.02086 , 10.03443 [', '10.02086', '10.03443', '10.02764', '7', '70.1935', '0.00471', '1.03141', '0.84883', '6.09204', '0.90796', '0.82439', '0.13532'),
(7, '[ 10.03443 , 10.048 ]', '10.03443', '10.048', '10.04121', '12', '120.49457', '0.01874', '1.4591', '0.92773', '3.94528', '8.05472', '64.87858', '16.44463');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_khitest_28/11/2022-00:02:51`
--

DROP TABLE IF EXISTS `machine_2_khitest_28/11/2022-00:02:51`;
CREATE TABLE IF NOT EXISTS `machine_2_khitest_28/11/2022-00:02:51` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Intervalle` text,
  `Min` text,
  `Max` text,
  `Centre` text,
  `Ni` text,
  `NiXi` text,
  `NiXi_XSQR` text,
  `Zmax` text,
  `P` text,
  `Npi` text,
  `Ni_Npi` text,
  `Ni_NpiSQR` text,
  `Ni_NpiSQRNpi` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_khitest_28/11/2022-00:02:51`
--

INSERT INTO `machine_2_khitest_28/11/2022-00:02:51` (`id`, `Intervalle`, `Min`, `Max`, `Centre`, `Ni`, `NiXi`, `NiXi_XSQR`, `Zmax`, `P`, `Npi`, `Ni_Npi`, `Ni_NpiSQR`, `Ni_NpiSQRNpi`) VALUES
(1, '[ 9.952 , 9.966 [', '9.952', '9.966', '9.959', '12', '119.508', '0.0115', '-0.91679', '0.17963', '8.9813', '3.0187', '9.11256', '1.01461'),
(2, '[ 9.966 , 9.98 [', '9.966', '9.98', '9.973', '6', '59.838', '0.00173', '-0.3811', '0.35156', '8.59686', '2.59686', '6.7437', '0.78444'),
(3, '[ 9.98 , 9.994 [', '9.98', '9.994', '9.987', '9', '89.883', '8.0E-5', '0.15458', '0.56143', '10.49311', '1.49311', '2.22938', '0.21246'),
(4, '[ 9.994 , 10.008 [', '9.994', '10.008', '10.001', '12', '120.012', '0.00146', '0.69027', '0.75499', '9.67815', '2.32185', '5.39098', '0.55703'),
(5, '[ 10.008 , 10.022 [', '10.008', '10.022', '10.015', '6', '60.09', '0.00376', '1.22596', '0.88989', '6.74523', '0.74523', '0.55536', '0.08233'),
(6, '[ 10.022 , 10.036 [', '10.022', '10.036', '10.029', '1', '10.029', '0.00152', '1.76165', '0.96094', '3.55213', '2.55213', '6.51337', '1.83365'),
(7, '[ 10.036 , 10.05 ]', '10.036', '10.05', '10.043', '4', '40.172', '0.01125', '2.29734', '0.9892', '1.41323', '2.58677', '6.69138', '4.73481');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_values_02/12/2022-10:44:57`
--

DROP TABLE IF EXISTS `machine_2_values_02/12/2022-10:44:57`;
CREATE TABLE IF NOT EXISTS `machine_2_values_02/12/2022-10:44:57` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_values_02/12/2022-10:44:57`
--

INSERT INTO `machine_2_values_02/12/2022-10:44:57` (`id`, `value`) VALUES
('1:1', '9.996'),
('1:2', '10.007'),
('1:3', '10.038'),
('1:4', '10.044'),
('1:5', '9.979'),
('1:6', '10.031'),
('1:7', '10.01'),
('1:8', '10.03'),
('1:9', '10.039'),
('1:10', '10.015'),
('1:11', '10.031'),
('1:12', '10.03'),
('1:13', '10.04'),
('1:14', '9.977'),
('1:15', '10.047'),
('1:16', '10.003'),
('1:17', '10.038'),
('1:18', '9.978'),
('1:19', '10.01'),
('1:20', '9.979'),
('1:21', '10.026'),
('1:22', '10.026'),
('1:23', '10.025'),
('1:24', '10.038'),
('1:25', '10.015'),
('1:26', '9.982'),
('1:27', '9.951'),
('1:28', '9.998'),
('1:29', '10.035'),
('1:30', '9.984'),
('1:31', '9.956'),
('1:32', '10.022'),
('1:33', '9.964'),
('1:34', '10.013'),
('1:35', '9.998'),
('1:36', '9.996'),
('1:37', '9.98'),
('1:38', '10.041'),
('1:39', '10.004'),
('1:40', '10.009'),
('1:41', '9.955'),
('1:42', '10.022'),
('1:43', '9.986'),
('1:44', '9.995'),
('1:45', '9.96'),
('1:46', '9.955'),
('1:47', '10.022'),
('1:48', '10.031'),
('1:49', '9.985'),
('1:50', '9.987');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_values_02/12/2022-10:45:10`
--

DROP TABLE IF EXISTS `machine_2_values_02/12/2022-10:45:10`;
CREATE TABLE IF NOT EXISTS `machine_2_values_02/12/2022-10:45:10` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_values_02/12/2022-10:45:10`
--

INSERT INTO `machine_2_values_02/12/2022-10:45:10` (`id`, `value`) VALUES
('1:1', '10.006'),
('1:2', '10.013'),
('1:3', '10.039'),
('1:4', '10.029'),
('1:5', '10.045'),
('1:6', '10.012'),
('1:7', '10.016'),
('1:8', '9.987'),
('1:9', '9.973'),
('1:10', '10.003');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_values_02/12/2022-10:45:22`
--

DROP TABLE IF EXISTS `machine_2_values_02/12/2022-10:45:22`;
CREATE TABLE IF NOT EXISTS `machine_2_values_02/12/2022-10:45:22` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_values_02/12/2022-10:45:22`
--

INSERT INTO `machine_2_values_02/12/2022-10:45:22` (`id`, `value`) VALUES
('1:1', '10.003'),
('1:2', '9.98'),
('1:3', '10'),
('1:4', '9.957'),
('1:5', '10.024'),
('1:6', '10.038'),
('1:7', '10.031'),
('1:8', '9.987'),
('1:9', '10.036'),
('1:10', '10.015');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_values_02/12/2022-10:45:53`
--

DROP TABLE IF EXISTS `machine_2_values_02/12/2022-10:45:53`;
CREATE TABLE IF NOT EXISTS `machine_2_values_02/12/2022-10:45:53` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_values_02/12/2022-10:45:53`
--

INSERT INTO `machine_2_values_02/12/2022-10:45:53` (`id`, `value`) VALUES
('1:1', '10.034'),
('1:2', '10.003'),
('1:3', '10.043'),
('1:4', '9.968'),
('1:5', '9.963'),
('1:6', '9.998'),
('1:7', '9.95'),
('1:8', '9.968'),
('1:9', '9.963'),
('1:10', '10.029');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_values_02/12/2022-10:46:09`
--

DROP TABLE IF EXISTS `machine_2_values_02/12/2022-10:46:09`;
CREATE TABLE IF NOT EXISTS `machine_2_values_02/12/2022-10:46:09` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_values_02/12/2022-10:46:09`
--

INSERT INTO `machine_2_values_02/12/2022-10:46:09` (`id`, `value`) VALUES
('1:1', '10.038'),
('1:2', '9.959'),
('1:3', '10.022'),
('1:4', '10.004'),
('1:5', '10.002'),
('1:6', '10.035'),
('1:7', '10.032'),
('1:8', '10.032'),
('1:9', '10.021'),
('1:10', '9.963');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_values_02/12/2022-10:46:34`
--

DROP TABLE IF EXISTS `machine_2_values_02/12/2022-10:46:34`;
CREATE TABLE IF NOT EXISTS `machine_2_values_02/12/2022-10:46:34` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_values_02/12/2022-10:46:34`
--

INSERT INTO `machine_2_values_02/12/2022-10:46:34` (`id`, `value`) VALUES
('1:1', '10.027'),
('1:2', '10.026'),
('1:3', '10.025'),
('1:4', '10.03'),
('1:5', '9.986'),
('1:6', '9.997'),
('1:7', '9.999'),
('1:8', '9.977'),
('1:9', '10.019'),
('1:10', '10.043');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_values_02/12/2022-10:46:52`
--

DROP TABLE IF EXISTS `machine_2_values_02/12/2022-10:46:52`;
CREATE TABLE IF NOT EXISTS `machine_2_values_02/12/2022-10:46:52` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_values_02/12/2022-10:46:52`
--

INSERT INTO `machine_2_values_02/12/2022-10:46:52` (`id`, `value`) VALUES
('1:1', '10.036'),
('1:2', '10.015'),
('1:3', '10.03'),
('1:4', '10.008'),
('1:5', '10.007'),
('1:6', '9.992'),
('1:7', '9.98'),
('1:8', '9.96'),
('1:9', '9.972'),
('1:10', '10.03');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_values_02/12/2022-10:47:01`
--

DROP TABLE IF EXISTS `machine_2_values_02/12/2022-10:47:01`;
CREATE TABLE IF NOT EXISTS `machine_2_values_02/12/2022-10:47:01` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_values_02/12/2022-10:47:01`
--

INSERT INTO `machine_2_values_02/12/2022-10:47:01` (`id`, `value`) VALUES
('1:1', '9.964'),
('1:2', '10.013'),
('1:3', '10.046'),
('1:4', '9.978'),
('1:5', '10.017'),
('1:6', '9.968'),
('1:7', '9.993'),
('1:8', '9.977'),
('1:9', '10.016'),
('1:10', '9.982');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_values_27/11/2022-23:29:22`
--

DROP TABLE IF EXISTS `machine_2_values_27/11/2022-23:29:22`;
CREATE TABLE IF NOT EXISTS `machine_2_values_27/11/2022-23:29:22` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_values_27/11/2022-23:29:22`
--

INSERT INTO `machine_2_values_27/11/2022-23:29:22` (`id`, `value`) VALUES
('1:1', '10.028'),
('1:2', '9.99'),
('1:3', '10.003'),
('1:4', '10.035'),
('1:5', '10.011'),
('1:6', '9.967'),
('1:7', '9.968'),
('1:8', '10.03'),
('1:9', '10.042'),
('1:10', '9.956'),
('1:11', '10.036'),
('1:12', '9.984'),
('1:13', '10.041'),
('1:14', '10.011'),
('1:15', '10.009'),
('1:16', '9.996'),
('1:17', '9.96'),
('1:18', '10.002'),
('1:19', '10.048'),
('1:20', '10.035'),
('1:21', '10.011'),
('1:22', '9.953'),
('1:23', '9.973'),
('1:24', '10.031'),
('1:25', '9.999'),
('1:26', '10.026'),
('1:27', '10.023'),
('1:28', '9.97'),
('1:29', '9.975'),
('1:30', '9.981'),
('1:31', '9.963'),
('1:32', '9.96'),
('1:33', '9.965'),
('1:34', '9.988'),
('1:35', '10.01'),
('1:36', '9.955'),
('1:37', '9.962'),
('1:38', '10.031'),
('1:39', '9.96'),
('1:40', '9.971'),
('1:41', '10.037'),
('1:42', '10.047'),
('1:43', '9.973'),
('1:44', '10.036'),
('1:45', '10.043'),
('1:46', '10.037'),
('1:47', '10.013'),
('1:48', '10.044'),
('1:49', '10.034'),
('1:50', '9.962');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_values_27/11/2022-23:29:42`
--

DROP TABLE IF EXISTS `machine_2_values_27/11/2022-23:29:42`;
CREATE TABLE IF NOT EXISTS `machine_2_values_27/11/2022-23:29:42` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_values_27/11/2022-23:29:42`
--

INSERT INTO `machine_2_values_27/11/2022-23:29:42` (`id`, `value`) VALUES
('1:1', '9.982'),
('1:2', '10.017'),
('1:3', '9.977'),
('1:4', '10'),
('1:5', '9.961'),
('1:6', '9.984'),
('1:7', '9.968'),
('1:8', '10.006'),
('1:9', '10.02'),
('1:10', '10.022');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_values_27/11/2022-23:29:58`
--

DROP TABLE IF EXISTS `machine_2_values_27/11/2022-23:29:58`;
CREATE TABLE IF NOT EXISTS `machine_2_values_27/11/2022-23:29:58` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_values_27/11/2022-23:29:58`
--

INSERT INTO `machine_2_values_27/11/2022-23:29:58` (`id`, `value`) VALUES
('1:1', '10.028'),
('1:2', '9.977'),
('1:3', '9.985'),
('1:4', '9.997'),
('1:5', '9.969'),
('1:6', '9.954'),
('1:7', '9.986'),
('1:8', '9.954'),
('1:9', '10.002'),
('1:10', '9.96');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_values_27/11/2022-23:30:06`
--

DROP TABLE IF EXISTS `machine_2_values_27/11/2022-23:30:06`;
CREATE TABLE IF NOT EXISTS `machine_2_values_27/11/2022-23:30:06` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_values_27/11/2022-23:30:06`
--

INSERT INTO `machine_2_values_27/11/2022-23:30:06` (`id`, `value`) VALUES
('1:1', '10.04'),
('1:2', '10.046'),
('1:3', '10.022'),
('1:4', '9.986'),
('1:5', '9.99'),
('1:6', '10.018'),
('1:7', '10.045'),
('1:8', '10.013'),
('1:9', '10.038'),
('1:10', '9.985');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_values_27/11/2022-23:30:13`
--

DROP TABLE IF EXISTS `machine_2_values_27/11/2022-23:30:13`;
CREATE TABLE IF NOT EXISTS `machine_2_values_27/11/2022-23:30:13` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_values_27/11/2022-23:30:13`
--

INSERT INTO `machine_2_values_27/11/2022-23:30:13` (`id`, `value`) VALUES
('1:1', '10.015'),
('1:2', '10.042'),
('1:3', '10.033'),
('1:4', '10.018'),
('1:5', '10.049'),
('1:6', '9.971'),
('1:7', '9.984'),
('1:8', '9.998'),
('1:9', '10.006'),
('1:10', '10.006');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_values_27/11/2022-23:30:19`
--

DROP TABLE IF EXISTS `machine_2_values_27/11/2022-23:30:19`;
CREATE TABLE IF NOT EXISTS `machine_2_values_27/11/2022-23:30:19` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_values_27/11/2022-23:30:19`
--

INSERT INTO `machine_2_values_27/11/2022-23:30:19` (`id`, `value`) VALUES
('1:1', '9.958'),
('1:2', '9.963'),
('1:3', '10.026'),
('1:4', '9.989'),
('1:5', '9.989'),
('1:6', '9.97'),
('1:7', '10.012'),
('1:8', '10.01'),
('1:9', '10.003'),
('1:10', '10.044');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_values_27/11/2022-23:30:26`
--

DROP TABLE IF EXISTS `machine_2_values_27/11/2022-23:30:26`;
CREATE TABLE IF NOT EXISTS `machine_2_values_27/11/2022-23:30:26` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_values_27/11/2022-23:30:26`
--

INSERT INTO `machine_2_values_27/11/2022-23:30:26` (`id`, `value`) VALUES
('1:1', '9.958'),
('1:2', '10.013'),
('1:3', '9.97'),
('1:4', '10.037'),
('1:5', '10.01'),
('1:6', '10.04'),
('1:7', '9.985'),
('1:8', '10.002'),
('1:9', '10.034'),
('1:10', '9.993');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_values_27/11/2022-23:30:34`
--

DROP TABLE IF EXISTS `machine_2_values_27/11/2022-23:30:34`;
CREATE TABLE IF NOT EXISTS `machine_2_values_27/11/2022-23:30:34` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_values_27/11/2022-23:30:34`
--

INSERT INTO `machine_2_values_27/11/2022-23:30:34` (`id`, `value`) VALUES
('1:1', '10.003'),
('1:2', '10.044'),
('1:3', '10.019'),
('1:4', '9.977'),
('1:5', '9.966'),
('1:6', '10.043'),
('1:7', '10'),
('1:8', '10.02'),
('1:9', '9.973'),
('1:10', '9.998');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_values_28/11/2022-00:02:51`
--

DROP TABLE IF EXISTS `machine_2_values_28/11/2022-00:02:51`;
CREATE TABLE IF NOT EXISTS `machine_2_values_28/11/2022-00:02:51` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_values_28/11/2022-00:02:51`
--

INSERT INTO `machine_2_values_28/11/2022-00:02:51` (`id`, `value`) VALUES
('1:1', '9.959'),
('1:2', '10.025'),
('1:3', '9.967'),
('1:4', '10.004'),
('1:5', '9.977'),
('1:6', '9.999'),
('1:7', '9.969'),
('1:8', '10'),
('1:9', '10.007'),
('1:10', '10.006'),
('1:11', '10.001'),
('1:12', '9.994'),
('1:13', '9.989'),
('1:14', '9.96'),
('1:15', '9.978'),
('1:16', '10.021'),
('1:17', '9.988'),
('1:18', '10.013'),
('1:19', '9.975'),
('1:20', '9.965'),
('1:21', '10.037'),
('1:22', '10.046'),
('1:23', '10.037'),
('1:24', '9.989'),
('1:25', '9.992'),
('1:26', '9.983'),
('1:27', '9.992'),
('1:28', '9.961'),
('1:29', '10.05'),
('1:30', '9.958'),
('1:31', '10.007'),
('1:32', '10.013'),
('1:33', '9.983'),
('1:34', '9.952'),
('1:35', '9.998'),
('1:36', '10.006'),
('1:37', '10.015'),
('1:38', '9.954'),
('1:39', '9.954'),
('1:40', '9.966'),
('1:41', '10.009'),
('1:42', '9.96'),
('1:43', '9.952'),
('1:44', '10.003'),
('1:45', '9.984'),
('1:46', '9.983'),
('1:47', '10.015'),
('1:48', '9.953'),
('1:49', '9.994'),
('1:50', '9.955');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_values_28/11/2022-00:02:56`
--

DROP TABLE IF EXISTS `machine_2_values_28/11/2022-00:02:56`;
CREATE TABLE IF NOT EXISTS `machine_2_values_28/11/2022-00:02:56` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_values_28/11/2022-00:02:56`
--

INSERT INTO `machine_2_values_28/11/2022-00:02:56` (`id`, `value`) VALUES
('1:1', '10.009'),
('1:2', '10.011'),
('1:3', '9.982'),
('1:4', '9.97'),
('1:5', '9.974'),
('1:6', '10.023'),
('1:7', '10.016'),
('1:8', '9.979'),
('1:9', '10.015'),
('1:10', '9.989');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_values_28/11/2022-00:02:59`
--

DROP TABLE IF EXISTS `machine_2_values_28/11/2022-00:02:59`;
CREATE TABLE IF NOT EXISTS `machine_2_values_28/11/2022-00:02:59` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_values_28/11/2022-00:02:59`
--

INSERT INTO `machine_2_values_28/11/2022-00:02:59` (`id`, `value`) VALUES
('1:1', '9.982'),
('1:2', '10.026'),
('1:3', '10.045'),
('1:4', '9.987'),
('1:5', '9.993'),
('1:6', '9.979'),
('1:7', '9.991'),
('1:8', '10.018'),
('1:9', '10.045'),
('1:10', '10.018');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_values_28/11/2022-00:03:04`
--

DROP TABLE IF EXISTS `machine_2_values_28/11/2022-00:03:04`;
CREATE TABLE IF NOT EXISTS `machine_2_values_28/11/2022-00:03:04` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_values_28/11/2022-00:03:04`
--

INSERT INTO `machine_2_values_28/11/2022-00:03:04` (`id`, `value`) VALUES
('1:1', '9.974'),
('1:2', '9.984'),
('1:3', '9.955'),
('1:4', '10.037'),
('1:5', '9.956'),
('1:6', '10.003'),
('1:7', '9.998'),
('1:8', '10.006'),
('1:9', '10.036'),
('1:10', '10.042');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_values_28/11/2022-00:03:20`
--

DROP TABLE IF EXISTS `machine_2_values_28/11/2022-00:03:20`;
CREATE TABLE IF NOT EXISTS `machine_2_values_28/11/2022-00:03:20` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_values_28/11/2022-00:03:20`
--

INSERT INTO `machine_2_values_28/11/2022-00:03:20` (`id`, `value`) VALUES
('1:1', '10.024'),
('1:2', '9.967'),
('1:3', '10.021'),
('1:4', '10.001'),
('1:5', '9.975'),
('1:6', '10.004'),
('1:7', '10.024'),
('1:8', '10.041'),
('1:9', '9.966'),
('1:10', '10.026');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_values_28/11/2022-00:03:26`
--

DROP TABLE IF EXISTS `machine_2_values_28/11/2022-00:03:26`;
CREATE TABLE IF NOT EXISTS `machine_2_values_28/11/2022-00:03:26` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_values_28/11/2022-00:03:26`
--

INSERT INTO `machine_2_values_28/11/2022-00:03:26` (`id`, `value`) VALUES
('1:1', '9.992'),
('1:2', '10.03'),
('1:3', '10.05'),
('1:4', '9.961'),
('1:5', '9.993'),
('1:6', '10.015'),
('1:7', '10.016'),
('1:8', '10.025'),
('1:9', '10.048'),
('1:10', '9.969');

-- --------------------------------------------------------

--
-- Structure de la table `machine_2_values_28/11/2022-03:18:38`
--

DROP TABLE IF EXISTS `machine_2_values_28/11/2022-03:18:38`;
CREATE TABLE IF NOT EXISTS `machine_2_values_28/11/2022-03:18:38` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_2_values_28/11/2022-03:18:38`
--

INSERT INTO `machine_2_values_28/11/2022-03:18:38` (`id`, `value`) VALUES
('1:1', '10.004'),
('1:2', '10.012'),
('1:3', '10.044'),
('1:4', '10.024'),
('1:5', '10.017'),
('1:6', '9.952'),
('1:7', '10.002'),
('1:8', '10.027'),
('1:9', '10.044'),
('1:10', '9.985');

-- --------------------------------------------------------

--
-- Structure de la table `machine_3_capability_28/11/2022-22:21:43`
--

DROP TABLE IF EXISTS `machine_3_capability_28/11/2022-22:21:43`;
CREATE TABLE IF NOT EXISTS `machine_3_capability_28/11/2022-22:21:43` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_3_capability_28/11/2022-22:21:43`
--

INSERT INTO `machine_3_capability_28/11/2022-22:21:43` (`id`, `value`) VALUES
('purpose', 'normality'),
('LICe', '0.026372'),
('LSCe', '0.125628'),
('normality', '0'),
('LSCx', '10.016948'),
('Khi2-theoretical', '1.0636232167792'),
('khi-probability', '90'),
('Khi2-measured', '7.8614844283864'),
('LICx', '9.983052'),
('S', '0.023784348595142'),
('Means', '10.000466666667'),
('Ranges', '0.076'),
('stDev', '0.023784348595142'),
('Mean of means', '10.000466666667'),
('Mean of ranges', '0.076');

-- --------------------------------------------------------

--
-- Structure de la table `machine_3_capability_28/11/2022-22:21:50`
--

DROP TABLE IF EXISTS `machine_3_capability_28/11/2022-22:21:50`;
CREATE TABLE IF NOT EXISTS `machine_3_capability_28/11/2022-22:21:50` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_3_capability_28/11/2022-22:21:50`
--

INSERT INTO `machine_3_capability_28/11/2022-22:21:50` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.019847'),
('LICx', '9.980153'),
('LSCe', '0.147117'),
('LICe', '0.030883'),
('S', '0.030888894598606'),
('Means', '9.9951333333333'),
('Ranges', '0.089'),
('stDev', '0.030888894598606'),
('Mean of means', '9.9951333333333'),
('Mean of ranges', '0.089');

-- --------------------------------------------------------

--
-- Structure de la table `machine_3_capability_30/11/2022-03:23:48`
--

DROP TABLE IF EXISTS `machine_3_capability_30/11/2022-03:23:48`;
CREATE TABLE IF NOT EXISTS `machine_3_capability_30/11/2022-03:23:48` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_3_capability_30/11/2022-03:23:48`
--

INSERT INTO `machine_3_capability_30/11/2022-03:23:48` (`id`, `value`) VALUES
('purpose', 'normality'),
('Khi2-measured', '15.541508219002'),
('Khi2-theoretical', '1.0636232167792'),
('khi-probability', '90'),
('normality', '0'),
('LSCx', '10.018286'),
('LICx', '9.981714'),
('LSCe', '0.135546'),
('LICe', '0.028454'),
('S', '0.028377053103822'),
('Means', '9.9986'),
('Ranges', '0.082'),
('stDev', '0.028377053103822'),
('Mean of means', '9.9986'),
('Mean of ranges', '0.082');

-- --------------------------------------------------------

--
-- Structure de la table `machine_3_capability_30/11/2022-03:23:54`
--

DROP TABLE IF EXISTS `machine_3_capability_30/11/2022-03:23:54`;
CREATE TABLE IF NOT EXISTS `machine_3_capability_30/11/2022-03:23:54` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_3_capability_30/11/2022-03:23:54`
--

INSERT INTO `machine_3_capability_30/11/2022-03:23:54` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.018732'),
('LICx', '9.981268'),
('LSCe', '0.138852'),
('LICe', '0.029148'),
('S', '0.031883418589486'),
('Means', '9.9924666666667'),
('Ranges', '0.084'),
('stDev', '0.031883418589486'),
('Mean of means', '9.9924666666667'),
('Mean of ranges', '0.084');

-- --------------------------------------------------------

--
-- Structure de la table `machine_3_capability_30/11/2022-03:23:58`
--

DROP TABLE IF EXISTS `machine_3_capability_30/11/2022-03:23:58`;
CREATE TABLE IF NOT EXISTS `machine_3_capability_30/11/2022-03:23:58` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_3_capability_30/11/2022-03:23:58`
--

INSERT INTO `machine_3_capability_30/11/2022-03:23:58` (`id`, `value`) VALUES
('purpose', 'CalcCp'),
('Cp', '0.5767396461647'),
('Cpk', '0.55290107412324'),
('Cpm', '0.098035233218636'),
('LSCx', '10.018286'),
('LICx', '9.981714'),
('LSCe', '0.135546'),
('LICe', '0.028454'),
('S', '0.025480524775937'),
('Means', '10.0034'),
('Ranges', '0.082'),
('stDev', '0.025480524775937'),
('Mean of means', '10.0034'),
('Mean of ranges', '0.082');

-- --------------------------------------------------------

--
-- Structure de la table `machine_3_capability_30/11/2022-03:24:03`
--

DROP TABLE IF EXISTS `machine_3_capability_30/11/2022-03:24:03`;
CREATE TABLE IF NOT EXISTS `machine_3_capability_30/11/2022-03:24:03` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_3_capability_30/11/2022-03:24:03`
--

INSERT INTO `machine_3_capability_30/11/2022-03:24:03` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.019401'),
('LICx', '9.980599'),
('LSCe', '0.143811'),
('LICe', '0.030189'),
('S', '0.027930696545625'),
('Means', '10.000133333333'),
('Ranges', '0.087'),
('stDev', '0.027930696545625'),
('Mean of means', '10.000133333333'),
('Mean of ranges', '0.087');

-- --------------------------------------------------------

--
-- Structure de la table `machine_3_capability_30/11/2022-03:24:07`
--

DROP TABLE IF EXISTS `machine_3_capability_30/11/2022-03:24:07`;
CREATE TABLE IF NOT EXISTS `machine_3_capability_30/11/2022-03:24:07` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_3_capability_30/11/2022-03:24:07`
--

INSERT INTO `machine_3_capability_30/11/2022-03:24:07` (`id`, `value`) VALUES
('purpose', 'CalcCp'),
('Cp', '0.62526417601988'),
('Cpk', '0.60275466568317'),
('Cpm', '0.10207743658195'),
('LSCx', '10.018732'),
('LICx', '9.981268'),
('LSCe', '0.138852'),
('LICe', '0.029148'),
('S', '0.02618578312931'),
('Means', '10.003466666667'),
('Ranges', '0.084'),
('stDev', '0.02618578312931'),
('Mean of means', '10.003466666667'),
('Mean of ranges', '0.084');

-- --------------------------------------------------------

--
-- Structure de la table `machine_3_capability_30/11/2022-03:24:12`
--

DROP TABLE IF EXISTS `machine_3_capability_30/11/2022-03:24:12`;
CREATE TABLE IF NOT EXISTS `machine_3_capability_30/11/2022-03:24:12` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_3_capability_30/11/2022-03:24:12`
--

INSERT INTO `machine_3_capability_30/11/2022-03:24:12` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.018955'),
('LICx', '9.981045'),
('LSCe', '0.140505'),
('LICe', '0.029495'),
('S', '0.029516258635022'),
('Means', '9.9947333333333'),
('Ranges', '0.085'),
('stDev', '0.029516258635022'),
('Mean of means', '9.9947333333333'),
('Mean of ranges', '0.085');

-- --------------------------------------------------------

--
-- Structure de la table `machine_3_capability_30/11/2022-03:24:16`
--

DROP TABLE IF EXISTS `machine_3_capability_30/11/2022-03:24:16`;
CREATE TABLE IF NOT EXISTS `machine_3_capability_30/11/2022-03:24:16` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_3_capability_30/11/2022-03:24:16`
--

INSERT INTO `machine_3_capability_30/11/2022-03:24:16` (`id`, `value`) VALUES
('purpose', 'CalcCp'),
('Cp', '0.5411166243975'),
('Cpk', '0.53967364673245'),
('Cpm', '0.094966337199909'),
('LSCx', '10.020739'),
('LICx', '9.979261'),
('LSCe', '0.153729'),
('LICe', '0.032271'),
('S', '0.032209138011263'),
('Means', '10.005'),
('Ranges', '0.093'),
('stDev', '0.032209138011263'),
('Mean of means', '10.005'),
('Mean of ranges', '0.093');

-- --------------------------------------------------------

--
-- Structure de la table `machine_3_capability_30/11/2022-03:24:20`
--

DROP TABLE IF EXISTS `machine_3_capability_30/11/2022-03:24:20`;
CREATE TABLE IF NOT EXISTS `machine_3_capability_30/11/2022-03:24:20` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_3_capability_30/11/2022-03:24:20`
--

INSERT INTO `machine_3_capability_30/11/2022-03:24:20` (`id`, `value`) VALUES
('purpose', 'CalcPp'),
('Pp', '0.59656785721255'),
('Ppk', '0.58668187557875'),
('Ppm', '0.099712352768507'),
('Rr', '98.342857142859'),
('ZÃ©quivalent', '1.5534627001815'),
('Zprocessus', '3.0534627001815'),
('LSCx', '10.015164'),
('LICx', '9.984836'),
('LSCe', '0.112404'),
('LICe', '0.023596'),
('S', '0.023951737187221'),
('Means', '10.0066'),
('Ranges', '0.068'),
('stDev', '0.023951737187221'),
('Mean of means', '10.0066'),
('Mean of ranges', '0.068');

-- --------------------------------------------------------

--
-- Structure de la table `machine_3_khitest_28/11/2022-22:21:43`
--

DROP TABLE IF EXISTS `machine_3_khitest_28/11/2022-22:21:43`;
CREATE TABLE IF NOT EXISTS `machine_3_khitest_28/11/2022-22:21:43` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Intervalle` text,
  `Min` text,
  `Max` text,
  `Centre` text,
  `Ni` text,
  `NiXi` text,
  `NiXi_XSQR` text,
  `Zmax` text,
  `P` text,
  `Npi` text,
  `Ni_Npi` text,
  `Ni_NpiSQR` text,
  `Ni_NpiSQRNpi` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_3_khitest_28/11/2022-22:21:43`
--

INSERT INTO `machine_3_khitest_28/11/2022-22:21:43` (`id`, `Intervalle`, `Min`, `Max`, `Centre`, `Ni`, `NiXi`, `NiXi_XSQR`, `Zmax`, `P`, `Npi`, `Ni_Npi`, `Ni_NpiSQR`, `Ni_NpiSQRNpi`) VALUES
(1, '[ 9.956 , 9.96943 [', '9.956', '9.96943', '9.96271', '8', '79.70171', '0.01263', '-1.20879', '0.11337', '5.66855', '2.33145', '5.43566', '0.95892'),
(2, '[ 9.96943 , 9.98286 [', '9.96943', '9.98286', '9.97614', '5', '49.88071', '0.00346', '-0.71707', '0.23666', '6.16465', '1.16465', '1.35642', '0.22003'),
(3, '[ 9.98286 , 9.99629 [', '9.98286', '9.99629', '9.98957', '9', '89.90614', '0.00149', '-0.22535', '0.41085', '8.70939', '0.29061', '0.08445', '0.0097'),
(4, '[ 9.99629 , 10.00971 [', '9.99629', '10.00971', '10.003', '4', '40.012', '0', '0.26637', '0.60502', '9.70846', '5.70846', '32.58657', '3.35651'),
(5, '[ 10.00971 , 10.02314 [', '10.00971', '10.02314', '10.01643', '10', '100.16429', '0.00196', '0.75809', '0.7758', '8.53895', '1.46105', '2.13466', '0.24999'),
(6, '[ 10.02314 , 10.03657 [', '10.02314', '10.03657', '10.02986', '8', '80.23886', '0.00601', '1.24981', '0.89431', '5.92572', '2.07428', '4.30263', '0.72609'),
(7, '[ 10.03657 , 10.05 ]', '10.03657', '10.05', '10.04329', '6', '60.25971', '0.01001', '1.74153', '0.9592', '3.24448', '2.75552', '7.59288', '2.34025');

-- --------------------------------------------------------

--
-- Structure de la table `machine_3_khitest_30/11/2022-03:23:48`
--

DROP TABLE IF EXISTS `machine_3_khitest_30/11/2022-03:23:48`;
CREATE TABLE IF NOT EXISTS `machine_3_khitest_30/11/2022-03:23:48` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Intervalle` text,
  `Min` text,
  `Max` text,
  `Centre` text,
  `Ni` text,
  `NiXi` text,
  `NiXi_XSQR` text,
  `Zmax` text,
  `P` text,
  `Npi` text,
  `Ni_Npi` text,
  `Ni_NpiSQR` text,
  `Ni_NpiSQRNpi` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_3_khitest_30/11/2022-03:23:48`
--

INSERT INTO `machine_3_khitest_30/11/2022-03:23:48` (`id`, `Intervalle`, `Min`, `Max`, `Centre`, `Ni`, `NiXi`, `NiXi_XSQR`, `Zmax`, `P`, `Npi`, `Ni_Npi`, `Ni_NpiSQR`, `Ni_NpiSQRNpi`) VALUES
(1, '[ 9.952 , 9.96571 [', '9.952', '9.96571', '9.95886', '7', '69.712', '0.01553', '-1.38599', '0.08288', '4.14378', '2.85622', '8.158', '1.96873'),
(2, '[ 9.96571 , 9.97943 [', '9.96571', '9.97943', '9.97257', '6', '59.83543', '0.00669', '-0.91369', '0.18044', '4.87818', '1.12182', '1.25847', '0.25798'),
(3, '[ 9.97943 , 9.99314 [', '9.97943', '9.99314', '9.98629', '2', '19.97257', '0.00077', '-0.4414', '0.32946', '7.45116', '5.45116', '29.71512', '3.98799'),
(4, '[ 9.99314 , 10.00686 [', '9.99314', '10.00686', '10', '5', '50', '0.00018', '0.0309', '0.51232', '9.14307', '4.14307', '17.16502', '1.87738'),
(5, '[ 10.00686 , 10.02057 [', '10.00686', '10.02057', '10.01371', '9', '90.12343', '0.00054', '0.50319', '0.69258', '9.01304', '0.01304', '0.00017', '2.0E-5'),
(6, '[ 10.02057 , 10.03429 [', '10.02057', '10.03429', '10.02743', '13', '130.35657', '0.00599', '0.97548', '0.83534', '7.13776', '5.86224', '34.36583', '4.81465'),
(7, '[ 10.03429 , 10.048 ]', '10.03429', '10.048', '10.04114', '8', '80.32914', '0.0099', '1.44778', '0.92616', '4.54103', '3.45897', '11.96451', '2.63476');

-- --------------------------------------------------------

--
-- Structure de la table `machine_3_values_28/11/2022-22:21:43`
--

DROP TABLE IF EXISTS `machine_3_values_28/11/2022-22:21:43`;
CREATE TABLE IF NOT EXISTS `machine_3_values_28/11/2022-22:21:43` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_3_values_28/11/2022-22:21:43`
--

INSERT INTO `machine_3_values_28/11/2022-22:21:43` (`id`, `value`) VALUES
('1:1', '9.988'),
('1:2', '9.985'),
('1:3', '9.956'),
('1:4', '10.025'),
('1:5', '10.032'),
('1:6', '9.983'),
('1:7', '10.002'),
('1:8', '9.983'),
('1:9', '10.022'),
('1:10', '10.017'),
('1:11', '10'),
('1:12', '10.027'),
('1:13', '10.029'),
('1:14', '9.988'),
('1:15', '9.97'),
('1:16', '9.962'),
('1:17', '10.039'),
('1:18', '10.026'),
('1:19', '9.968'),
('1:20', '9.963'),
('1:21', '9.96'),
('1:22', '9.977'),
('1:23', '9.962'),
('1:24', '9.989'),
('1:25', '10.017'),
('1:26', '10.014'),
('1:27', '10.05'),
('1:28', '9.997'),
('1:29', '10.042'),
('1:30', '9.962'),
('1:31', '10.036'),
('1:32', '10.027'),
('1:33', '10.039'),
('1:34', '10.043'),
('1:35', '10.015'),
('1:36', '9.995'),
('1:37', '9.985'),
('1:38', '10.012'),
('1:39', '10.017'),
('1:40', '9.982'),
('1:41', '10.049'),
('1:42', '9.976'),
('1:43', '9.964'),
('1:44', '9.978'),
('1:45', '10.029'),
('1:46', '10.011'),
('1:47', '10.003'),
('1:48', '9.993'),
('1:49', '10.012'),
('1:50', '10.021');

-- --------------------------------------------------------

--
-- Structure de la table `machine_3_values_28/11/2022-22:21:50`
--

DROP TABLE IF EXISTS `machine_3_values_28/11/2022-22:21:50`;
CREATE TABLE IF NOT EXISTS `machine_3_values_28/11/2022-22:21:50` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_3_values_28/11/2022-22:21:50`
--

INSERT INTO `machine_3_values_28/11/2022-22:21:50` (`id`, `value`) VALUES
('1:1', '10.019'),
('1:2', '10.019'),
('1:3', '9.996'),
('1:4', '10.011'),
('1:5', '10.003'),
('1:6', '10.011'),
('1:7', '10.043'),
('1:8', '10.034'),
('1:9', '9.964'),
('1:10', '9.959'),
('1:11', '9.957'),
('1:12', '9.956'),
('1:13', '9.98'),
('1:14', '10.021'),
('1:15', '9.954');

-- --------------------------------------------------------

--
-- Structure de la table `machine_3_values_30/11/2022-03:23:48`
--

DROP TABLE IF EXISTS `machine_3_values_30/11/2022-03:23:48`;
CREATE TABLE IF NOT EXISTS `machine_3_values_30/11/2022-03:23:48` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_3_values_30/11/2022-03:23:48`
--

INSERT INTO `machine_3_values_30/11/2022-03:23:48` (`id`, `value`) VALUES
('1:1', '10.003'),
('1:2', '10.021'),
('1:3', '9.965'),
('1:4', '9.986'),
('1:5', '10.037'),
('1:6', '10.035'),
('1:7', '10.016'),
('1:8', '9.977'),
('1:9', '9.968'),
('1:10', '10.013'),
('1:11', '9.994'),
('1:12', '10.04'),
('1:13', '9.958'),
('1:14', '10.004'),
('1:15', '9.962'),
('1:16', '9.952'),
('1:17', '9.957'),
('1:18', '10.018'),
('1:19', '10.022'),
('1:20', '9.977'),
('1:21', '10.021'),
('1:22', '10.03'),
('1:23', '10.026'),
('1:24', '10.022'),
('1:25', '10.034'),
('1:26', '10.02'),
('1:27', '10.038'),
('1:28', '9.981'),
('1:29', '9.972'),
('1:30', '10.045'),
('1:31', '10.041'),
('1:32', '10.004'),
('1:33', '9.954'),
('1:34', '10.023'),
('1:35', '9.969'),
('1:36', '10.018'),
('1:37', '10.024'),
('1:38', '10.033'),
('1:39', '10.048'),
('1:40', '10.012'),
('1:41', '10.02'),
('1:42', '9.996'),
('1:43', '9.953'),
('1:44', '10.044'),
('1:45', '10.023'),
('1:46', '9.966'),
('1:47', '10.009'),
('1:48', '10.024'),
('1:49', '10.027'),
('1:50', '10.016');

-- --------------------------------------------------------

--
-- Structure de la table `machine_3_values_30/11/2022-03:23:54`
--

DROP TABLE IF EXISTS `machine_3_values_30/11/2022-03:23:54`;
CREATE TABLE IF NOT EXISTS `machine_3_values_30/11/2022-03:23:54` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_3_values_30/11/2022-03:23:54`
--

INSERT INTO `machine_3_values_30/11/2022-03:23:54` (`id`, `value`) VALUES
('1:1', '9.966'),
('1:2', '9.972'),
('1:3', '9.956'),
('1:4', '10.025'),
('1:5', '10.031'),
('1:6', '9.987'),
('1:7', '9.978'),
('1:8', '10.03'),
('1:9', '9.953'),
('1:10', '9.973'),
('1:11', '10.011'),
('1:12', '9.962'),
('1:13', '10.037'),
('1:14', '10.036'),
('1:15', '9.97');

-- --------------------------------------------------------

--
-- Structure de la table `machine_3_values_30/11/2022-03:23:58`
--

DROP TABLE IF EXISTS `machine_3_values_30/11/2022-03:23:58`;
CREATE TABLE IF NOT EXISTS `machine_3_values_30/11/2022-03:23:58` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_3_values_30/11/2022-03:23:58`
--

INSERT INTO `machine_3_values_30/11/2022-03:23:58` (`id`, `value`) VALUES
('1:1', '9.986'),
('1:2', '10.015'),
('1:3', '10.041'),
('1:4', '9.985'),
('1:5', '9.985'),
('1:6', '10.013'),
('1:7', '10.03'),
('1:8', '9.999'),
('1:9', '9.969'),
('1:10', '10.027'),
('1:11', '9.959'),
('1:12', '9.995'),
('1:13', '10.03'),
('1:14', '9.984'),
('1:15', '10.033');

-- --------------------------------------------------------

--
-- Structure de la table `machine_3_values_30/11/2022-03:24:03`
--

DROP TABLE IF EXISTS `machine_3_values_30/11/2022-03:24:03`;
CREATE TABLE IF NOT EXISTS `machine_3_values_30/11/2022-03:24:03` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_3_values_30/11/2022-03:24:03`
--

INSERT INTO `machine_3_values_30/11/2022-03:24:03` (`id`, `value`) VALUES
('1:1', '10.026'),
('1:2', '9.992'),
('1:3', '10.028'),
('1:4', '10.032'),
('1:5', '9.971'),
('1:6', '10.016'),
('1:7', '9.958'),
('1:8', '9.958'),
('1:9', '10.045'),
('1:10', '10.003'),
('1:11', '9.973'),
('1:12', '9.986'),
('1:13', '10.023'),
('1:14', '9.985'),
('1:15', '10.006');

-- --------------------------------------------------------

--
-- Structure de la table `machine_3_values_30/11/2022-03:24:07`
--

DROP TABLE IF EXISTS `machine_3_values_30/11/2022-03:24:07`;
CREATE TABLE IF NOT EXISTS `machine_3_values_30/11/2022-03:24:07` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_3_values_30/11/2022-03:24:07`
--

INSERT INTO `machine_3_values_30/11/2022-03:24:07` (`id`, `value`) VALUES
('1:1', '9.965'),
('1:2', '9.971'),
('1:3', '9.999'),
('1:4', '10.013'),
('1:5', '10.012'),
('1:6', '9.999'),
('1:7', '10.038'),
('1:8', '10.009'),
('1:9', '9.963'),
('1:10', '10.047'),
('1:11', '10.023'),
('1:12', '9.982'),
('1:13', '10.023'),
('1:14', '10.025'),
('1:15', '9.983');

-- --------------------------------------------------------

--
-- Structure de la table `machine_3_values_30/11/2022-03:24:12`
--

DROP TABLE IF EXISTS `machine_3_values_30/11/2022-03:24:12`;
CREATE TABLE IF NOT EXISTS `machine_3_values_30/11/2022-03:24:12` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_3_values_30/11/2022-03:24:12`
--

INSERT INTO `machine_3_values_30/11/2022-03:24:12` (`id`, `value`) VALUES
('1:1', '9.959'),
('1:2', '9.972'),
('1:3', '10.014'),
('1:4', '10.02'),
('1:5', '10.033'),
('1:6', '10.009'),
('1:7', '10.038'),
('1:8', '9.969'),
('1:9', '9.976'),
('1:10', '9.979'),
('1:11', '9.987'),
('1:12', '9.963'),
('1:13', '10.027'),
('1:14', '10.022'),
('1:15', '9.953');

-- --------------------------------------------------------

--
-- Structure de la table `machine_3_values_30/11/2022-03:24:16`
--

DROP TABLE IF EXISTS `machine_3_values_30/11/2022-03:24:16`;
CREATE TABLE IF NOT EXISTS `machine_3_values_30/11/2022-03:24:16` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_3_values_30/11/2022-03:24:16`
--

INSERT INTO `machine_3_values_30/11/2022-03:24:16` (`id`, `value`) VALUES
('1:1', '9.975'),
('1:2', '10.049'),
('1:3', '9.961'),
('1:4', '10.009'),
('1:5', '10.035'),
('1:6', '9.989'),
('1:7', '9.989'),
('1:8', '10.019'),
('1:9', '10.034'),
('1:10', '9.983'),
('1:11', '10.034'),
('1:12', '10.039'),
('1:13', '9.967'),
('1:14', '10.036'),
('1:15', '9.956');

-- --------------------------------------------------------

--
-- Structure de la table `machine_3_values_30/11/2022-03:24:20`
--

DROP TABLE IF EXISTS `machine_3_values_30/11/2022-03:24:20`;
CREATE TABLE IF NOT EXISTS `machine_3_values_30/11/2022-03:24:20` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_3_values_30/11/2022-03:24:20`
--

INSERT INTO `machine_3_values_30/11/2022-03:24:20` (`id`, `value`) VALUES
('1:1', '10.021'),
('1:2', '9.972'),
('1:3', '10.04'),
('1:4', '9.98'),
('1:5', '10.039'),
('1:6', '10.039'),
('1:7', '9.987'),
('1:8', '10.02'),
('1:9', '10.014'),
('1:10', '9.991'),
('1:11', '9.979'),
('1:12', '9.985'),
('1:13', '9.996'),
('1:14', '10.007'),
('1:15', '10.029');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_capability_01/12/2022-17:30:40`
--

DROP TABLE IF EXISTS `machine_4_capability_01/12/2022-17:30:40`;
CREATE TABLE IF NOT EXISTS `machine_4_capability_01/12/2022-17:30:40` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_capability_01/12/2022-17:30:40`
--

INSERT INTO `machine_4_capability_01/12/2022-17:30:40` (`id`, `value`) VALUES
('purpose', 'normality'),
('LSCe', '0.115505'),
('LICx', '9.97998'),
('LSCx', '10.02002'),
('Khi2-theoretical', '25.013342570383'),
('khi-probability', '0.005'),
('Khi2-measured', '17.75737765989'),
('normality', '1'),
('LICe', '0.014495'),
('S', '0.023485456492618'),
('Means', '10.0093'),
('Ranges', '0.065'),
('stDev', '0.023485456492618'),
('Mean of means', '10.0093'),
('Mean of ranges', '0.065');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_capability_01/12/2022-17:30:54`
--

DROP TABLE IF EXISTS `machine_4_capability_01/12/2022-17:30:54`;
CREATE TABLE IF NOT EXISTS `machine_4_capability_01/12/2022-17:30:54` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_capability_01/12/2022-17:30:54`
--

INSERT INTO `machine_4_capability_01/12/2022-17:30:54` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.020636'),
('LICx', '9.979364'),
('LSCe', '0.119059'),
('LICe', '0.014941'),
('S', '0.02327826835866'),
('Means', '9.9861'),
('Ranges', '0.067'),
('stDev', '0.02327826835866'),
('Mean of means', '9.9861'),
('Mean of ranges', '0.067');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_capability_01/12/2022-17:31:00`
--

DROP TABLE IF EXISTS `machine_4_capability_01/12/2022-17:31:00`;
CREATE TABLE IF NOT EXISTS `machine_4_capability_01/12/2022-17:31:00` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_capability_01/12/2022-17:31:00`
--

INSERT INTO `machine_4_capability_01/12/2022-17:31:00` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.026488'),
('LICx', '9.973512'),
('LSCe', '0.152822'),
('LICe', '0.019178'),
('S', '0.028891367415045'),
('Means', '9.9974'),
('Ranges', '0.086'),
('stDev', '0.028891367415045'),
('Mean of means', '9.9974'),
('Mean of ranges', '0.086');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_capability_01/12/2022-17:31:06`
--

DROP TABLE IF EXISTS `machine_4_capability_01/12/2022-17:31:06`;
CREATE TABLE IF NOT EXISTS `machine_4_capability_01/12/2022-17:31:06` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_capability_01/12/2022-17:31:06`
--

INSERT INTO `machine_4_capability_01/12/2022-17:31:06` (`id`, `value`) VALUES
('purpose', 'CalcCp'),
('Cp', '0.61780336419762'),
('Cpk', '0.6161558885597'),
('Cpm', '0.10147273501385'),
('LSCx', '10.018788'),
('LICx', '9.981212'),
('LSCe', '0.108397'),
('LICe', '0.013603'),
('S', '0.021408461463221'),
('Means', '10.0161'),
('Ranges', '0.061'),
('stDev', '0.021408461463221'),
('Mean of means', '10.0161'),
('Mean of ranges', '0.061');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_capability_01/12/2022-17:31:28`
--

DROP TABLE IF EXISTS `machine_4_capability_01/12/2022-17:31:28`;
CREATE TABLE IF NOT EXISTS `machine_4_capability_01/12/2022-17:31:28` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_capability_01/12/2022-17:31:28`
--

INSERT INTO `machine_4_capability_01/12/2022-17:31:28` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.026796'),
('LICx', '9.973204'),
('LSCe', '0.154599'),
('LICe', '0.019401'),
('S', '0.028899058039243'),
('Means', '10.0046'),
('Ranges', '0.087'),
('stDev', '0.028899058039243'),
('Mean of means', '10.0046'),
('Mean of ranges', '0.087');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_capability_01/12/2022-17:31:35`
--

DROP TABLE IF EXISTS `machine_4_capability_01/12/2022-17:31:35`;
CREATE TABLE IF NOT EXISTS `machine_4_capability_01/12/2022-17:31:35` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_capability_01/12/2022-17:31:35`
--

INSERT INTO `machine_4_capability_01/12/2022-17:31:35` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.02618'),
('LICx', '9.97382'),
('LSCe', '0.151045'),
('LICe', '0.018955'),
('S', '0.028852883545477'),
('Means', '9.9874'),
('Ranges', '0.085'),
('stDev', '0.028852883545477'),
('Mean of means', '9.9874'),
('Mean of ranges', '0.085');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_capability_01/12/2022-17:31:41`
--

DROP TABLE IF EXISTS `machine_4_capability_01/12/2022-17:31:41`;
CREATE TABLE IF NOT EXISTS `machine_4_capability_01/12/2022-17:31:41` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_capability_01/12/2022-17:31:41`
--

INSERT INTO `machine_4_capability_01/12/2022-17:31:41` (`id`, `value`) VALUES
('purpose', 'CalcCp'),
('Cp', '0.60296568418551'),
('Cpk', '0.52618805373253'),
('Cpm', '0.10017341282945'),
('LSCx', '10.02618'),
('LICx', '9.97382'),
('LSCe', '0.151045'),
('LICe', '0.018955'),
('S', '0.024342235814412'),
('Means', '9.9889'),
('Ranges', '0.085'),
('stDev', '0.024342235814412'),
('Mean of means', '9.9889'),
('Mean of ranges', '0.085');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_capability_01/12/2022-17:31:46`
--

DROP TABLE IF EXISTS `machine_4_capability_01/12/2022-17:31:46`;
CREATE TABLE IF NOT EXISTS `machine_4_capability_01/12/2022-17:31:46` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_capability_01/12/2022-17:31:46`
--

INSERT INTO `machine_4_capability_01/12/2022-17:31:46` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.025564'),
('LICx', '9.974436'),
('LSCe', '0.147491'),
('LICe', '0.018509'),
('S', '0.030930747018317'),
('Means', '10.0106'),
('Ranges', '0.083'),
('stDev', '0.030930747018317'),
('Mean of means', '10.0106'),
('Mean of ranges', '0.083');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_capability_01/12/2022-17:31:52`
--

DROP TABLE IF EXISTS `machine_4_capability_01/12/2022-17:31:52`;
CREATE TABLE IF NOT EXISTS `machine_4_capability_01/12/2022-17:31:52` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_capability_01/12/2022-17:31:52`
--

INSERT INTO `machine_4_capability_01/12/2022-17:31:52` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.029876'),
('LICx', '9.970124'),
('LSCe', '0.172369'),
('LICe', '0.021631'),
('S', '0.032539890049667'),
('Means', '10.0122'),
('Ranges', '0.097'),
('stDev', '0.032539890049667'),
('Mean of means', '10.0122'),
('Mean of ranges', '0.097');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_capability_01/12/2022-17:31:57`
--

DROP TABLE IF EXISTS `machine_4_capability_01/12/2022-17:31:57`;
CREATE TABLE IF NOT EXISTS `machine_4_capability_01/12/2022-17:31:57` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_capability_01/12/2022-17:31:57`
--

INSERT INTO `machine_4_capability_01/12/2022-17:31:57` (`id`, `value`) VALUES
('purpose', 'CalcCp'),
('Cp', '0.59056210255125'),
('Cpk', '0.47874901113489'),
('Cpm', '0.09905324440829'),
('LSCx', '10.022484'),
('LICx', '9.977516'),
('LSCe', '0.129721'),
('LICe', '0.016279'),
('S', '0.022901722400049'),
('Means', '10.0056'),
('Ranges', '0.073'),
('stDev', '0.022901722400049'),
('Mean of means', '10.0056'),
('Mean of ranges', '0.073');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_capability_01/12/2022-17:32:01`
--

DROP TABLE IF EXISTS `machine_4_capability_01/12/2022-17:32:01`;
CREATE TABLE IF NOT EXISTS `machine_4_capability_01/12/2022-17:32:01` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_capability_01/12/2022-17:32:01`
--

INSERT INTO `machine_4_capability_01/12/2022-17:32:01` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.024024'),
('LICx', '9.975976'),
('LSCe', '0.138606'),
('LICe', '0.017394'),
('S', '0.024818451916982'),
('Means', '9.9972'),
('Ranges', '0.078'),
('stDev', '0.024818451916982'),
('Mean of means', '9.9972'),
('Mean of ranges', '0.078');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_capability_01/12/2022-17:32:06`
--

DROP TABLE IF EXISTS `machine_4_capability_01/12/2022-17:32:06`;
CREATE TABLE IF NOT EXISTS `machine_4_capability_01/12/2022-17:32:06` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_capability_01/12/2022-17:32:06`
--

INSERT INTO `machine_4_capability_01/12/2022-17:32:06` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.016632'),
('LICx', '9.983368'),
('LSCe', '0.095958'),
('LICe', '0.012042'),
('S', '0.017746361129351'),
('Means', '10.0104'),
('Ranges', '0.054'),
('stDev', '0.017746361129351'),
('Mean of means', '10.0104'),
('Mean of ranges', '0.054');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_capability_01/12/2022-17:32:13`
--

DROP TABLE IF EXISTS `machine_4_capability_01/12/2022-17:32:13`;
CREATE TABLE IF NOT EXISTS `machine_4_capability_01/12/2022-17:32:13` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_capability_01/12/2022-17:32:13`
--

INSERT INTO `machine_4_capability_01/12/2022-17:32:13` (`id`, `value`) VALUES
('purpose', 'CalcCp'),
('Cp', '0.66411283424002'),
('Cpk', '0.60212896971092'),
('Cpm', '0.10516154509335'),
('LSCx', '10.025256'),
('LICx', '9.974744'),
('LSCe', '0.145714'),
('LICe', '0.018286'),
('S', '0.03157073187481'),
('Means', '10.0064'),
('Ranges', '0.082'),
('stDev', '0.03157073187481'),
('Mean of means', '10.0064'),
('Mean of ranges', '0.082');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_capability_01/12/2022-17:32:18`
--

DROP TABLE IF EXISTS `machine_4_capability_01/12/2022-17:32:18`;
CREATE TABLE IF NOT EXISTS `machine_4_capability_01/12/2022-17:32:18` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_capability_01/12/2022-17:32:18`
--

INSERT INTO `machine_4_capability_01/12/2022-17:32:18` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.0231'),
('LICx', '9.9769'),
('LSCe', '0.133275'),
('LICe', '0.016725'),
('S', '0.021582915053862'),
('Means', '10.0024'),
('Ranges', '0.075'),
('stDev', '0.021582915053862'),
('Mean of means', '10.0024'),
('Mean of ranges', '0.075');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_capability_01/12/2022-17:32:24`
--

DROP TABLE IF EXISTS `machine_4_capability_01/12/2022-17:32:24`;
CREATE TABLE IF NOT EXISTS `machine_4_capability_01/12/2022-17:32:24` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_capability_01/12/2022-17:32:24`
--

INSERT INTO `machine_4_capability_01/12/2022-17:32:24` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.022792'),
('LICx', '9.977208'),
('LSCe', '0.131498'),
('LICe', '0.016502'),
('S', '0.0244030963427'),
('Means', '10.0112'),
('Ranges', '0.074'),
('stDev', '0.0244030963427'),
('Mean of means', '10.0112'),
('Mean of ranges', '0.074');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_capability_01/12/2022-17:32:30`
--

DROP TABLE IF EXISTS `machine_4_capability_01/12/2022-17:32:30`;
CREATE TABLE IF NOT EXISTS `machine_4_capability_01/12/2022-17:32:30` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_capability_01/12/2022-17:32:30`
--

INSERT INTO `machine_4_capability_01/12/2022-17:32:30` (`id`, `value`) VALUES
('purpose', 'CalcCp'),
('Cp', '0.7778028903889'),
('Cpk', '0.75395026841701'),
('Cpm', '0.11385060076079'),
('LSCx', '10.012936'),
('LICx', '9.987064'),
('LSCe', '0.074634'),
('LICe', '0.009366'),
('S', '0.013792107243718'),
('Means', '9.991'),
('Ranges', '0.042'),
('stDev', '0.013792107243718'),
('Mean of means', '9.991'),
('Mean of ranges', '0.042');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_capability_01/12/2022-17:32:36`
--

DROP TABLE IF EXISTS `machine_4_capability_01/12/2022-17:32:36`;
CREATE TABLE IF NOT EXISTS `machine_4_capability_01/12/2022-17:32:36` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_capability_01/12/2022-17:32:36`
--

INSERT INTO `machine_4_capability_01/12/2022-17:32:36` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.028644'),
('LICx', '9.971356'),
('LSCe', '0.165261'),
('LICe', '0.020739'),
('S', '0.033039370454051'),
('Means', '9.9996'),
('Ranges', '0.093'),
('stDev', '0.033039370454051'),
('Mean of means', '9.9996'),
('Mean of ranges', '0.093');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_capability_01/12/2022-17:32:41`
--

DROP TABLE IF EXISTS `machine_4_capability_01/12/2022-17:32:41`;
CREATE TABLE IF NOT EXISTS `machine_4_capability_01/12/2022-17:32:41` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_capability_01/12/2022-17:32:41`
--

INSERT INTO `machine_4_capability_01/12/2022-17:32:41` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.02464'),
('LICx', '9.97536'),
('LSCe', '0.14216'),
('LICe', '0.01784'),
('S', '0.028318819812195'),
('Means', '10.0032'),
('Ranges', '0.08'),
('stDev', '0.028318819812195'),
('Mean of means', '10.0032'),
('Mean of ranges', '0.08');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_capability_01/12/2022-17:32:49`
--

DROP TABLE IF EXISTS `machine_4_capability_01/12/2022-17:32:49`;
CREATE TABLE IF NOT EXISTS `machine_4_capability_01/12/2022-17:32:49` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_capability_01/12/2022-17:32:49`
--

INSERT INTO `machine_4_capability_01/12/2022-17:32:49` (`id`, `value`) VALUES
('purpose', 'CalcCp'),
('Cp', '0.51421476637201'),
('Cpk', '0.51181509746225'),
('Cpm', '0.092575545962188'),
('LSCx', '10.02926'),
('LICx', '9.97074'),
('LSCe', '0.168815'),
('LICe', '0.021185'),
('S', '0.038294908277733'),
('Means', '9.9965'),
('Ranges', '0.095'),
('stDev', '0.038294908277733'),
('Mean of means', '9.9965'),
('Mean of ranges', '0.095');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_capability_01/12/2022-17:33:44`
--

DROP TABLE IF EXISTS `machine_4_capability_01/12/2022-17:33:44`;
CREATE TABLE IF NOT EXISTS `machine_4_capability_01/12/2022-17:33:44` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_capability_01/12/2022-17:33:44`
--

INSERT INTO `machine_4_capability_01/12/2022-17:33:44` (`id`, `value`) VALUES
('purpose', 'check'),
('LSCx', '10.028952'),
('LICx', '9.971048'),
('LSCe', '0.167038'),
('LICe', '0.020962'),
('S', '0.02869378562221'),
('Means', '9.995'),
('Ranges', '0.094'),
('stDev', '0.02869378562221'),
('Mean of means', '9.995'),
('Mean of ranges', '0.094');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_khitest_01/12/2022-17:30:40`
--

DROP TABLE IF EXISTS `machine_4_khitest_01/12/2022-17:30:40`;
CREATE TABLE IF NOT EXISTS `machine_4_khitest_01/12/2022-17:30:40` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Intervalle` text,
  `Min` text,
  `Max` text,
  `Centre` text,
  `Ni` text,
  `NiXi` text,
  `NiXi_XSQR` text,
  `Zmax` text,
  `P` text,
  `Npi` text,
  `Ni_Npi` text,
  `Ni_NpiSQR` text,
  `Ni_NpiSQRNpi` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_khitest_01/12/2022-17:30:40`
--

INSERT INTO `machine_4_khitest_01/12/2022-17:30:40` (`id`, `Intervalle`, `Min`, `Max`, `Centre`, `Ni`, `NiXi`, `NiXi_XSQR`, `Zmax`, `P`, `Npi`, `Ni_Npi`, `Ni_NpiSQR`, `Ni_NpiSQRNpi`) VALUES
(1, '[ 9.952 , 9.966 [', '9.952', '9.966', '9.959', '8', '79.672', '0.01382', '-1.10508', '0.13456', '6.72812', '1.27188', '1.61767', '0.24043'),
(2, '[ 9.966 , 9.98 [', '9.966', '9.98', '9.973', '9', '89.757', '0.00684', '-0.65742', '0.25546', '6.04464', '2.95536', '8.73416', '1.44494'),
(3, '[ 9.98 , 9.994 [', '9.98', '9.994', '9.987', '5', '49.935', '0.00092', '-0.20976', '0.41693', '8.0736', '3.0736', '9.44703', '1.17011'),
(4, '[ 9.994 , 10.008 [', '9.994', '10.008', '10.001', '8', '80.008', '0', '0.2379', '0.59402', '8.85465', '0.85465', '0.73043', '0.08249'),
(5, '[ 10.008 , 10.022 [', '10.008', '10.022', '10.015', '3', '30.045', '0.00063', '0.68556', '0.7535', '7.97421', '4.97421', '24.74273', '3.10285'),
(6, '[ 10.022 , 10.036 [', '10.022', '10.036', '10.029', '7', '70.203', '0.00566', '1.13322', '0.87144', '5.89672', '1.10328', '1.21724', '0.20643'),
(7, '[ 10.036 , 10.05 ]', '10.036', '10.05', '10.043', '10', '100.43', '0.01801', '1.58088', '0.94305', '3.58042', '6.41958', '41.21105', '11.51013');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_values_01/12/2022-17:30:40`
--

DROP TABLE IF EXISTS `machine_4_values_01/12/2022-17:30:40`;
CREATE TABLE IF NOT EXISTS `machine_4_values_01/12/2022-17:30:40` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_values_01/12/2022-17:30:40`
--

INSERT INTO `machine_4_values_01/12/2022-17:30:40` (`id`, `value`) VALUES
('1:1', '10'),
('1:2', '10.037'),
('1:3', '9.987'),
('1:4', '9.975'),
('1:5', '10.004'),
('1:6', '10.022'),
('1:7', '10.04'),
('1:8', '10.001'),
('1:9', '9.989'),
('1:10', '10.038'),
('1:11', '9.996'),
('1:12', '10.047'),
('1:13', '9.976'),
('1:14', '9.98'),
('1:15', '9.964'),
('1:16', '9.952'),
('1:17', '9.986'),
('1:18', '9.955'),
('1:19', '10.041'),
('1:20', '9.99'),
('1:21', '9.968'),
('1:22', '9.962'),
('1:23', '9.998'),
('1:24', '9.96'),
('1:25', '10.002'),
('1:26', '10.019'),
('1:27', '9.957'),
('1:28', '10.031'),
('1:29', '10.033'),
('1:30', '9.962'),
('1:31', '10.001'),
('1:32', '9.975'),
('1:33', '10.026'),
('1:34', '10.017'),
('1:35', '10.023'),
('1:36', '9.976'),
('1:37', '10.025'),
('1:38', '9.971'),
('1:39', '10.05'),
('1:40', '10.035'),
('1:41', '9.952'),
('1:42', '10.017'),
('1:43', '9.969'),
('1:44', '10.042'),
('1:45', '9.973'),
('1:46', '9.968'),
('1:47', '9.996'),
('1:48', '10.048'),
('1:49', '10.043'),
('1:50', '10.049');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_values_01/12/2022-17:30:54`
--

DROP TABLE IF EXISTS `machine_4_values_01/12/2022-17:30:54`;
CREATE TABLE IF NOT EXISTS `machine_4_values_01/12/2022-17:30:54` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_values_01/12/2022-17:30:54`
--

INSERT INTO `machine_4_values_01/12/2022-17:30:54` (`id`, `value`) VALUES
('1:1', '9.957'),
('1:2', '9.986'),
('1:3', '10.022'),
('1:4', '9.959'),
('1:5', '9.981'),
('1:6', '9.991'),
('1:7', '10.004'),
('1:8', '9.955'),
('1:9', '9.996'),
('1:10', '10.01');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_values_01/12/2022-17:31:00`
--

DROP TABLE IF EXISTS `machine_4_values_01/12/2022-17:31:00`;
CREATE TABLE IF NOT EXISTS `machine_4_values_01/12/2022-17:31:00` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_values_01/12/2022-17:31:00`
--

INSERT INTO `machine_4_values_01/12/2022-17:31:00` (`id`, `value`) VALUES
('1:1', '10.035'),
('1:2', '10.008'),
('1:3', '10.005'),
('1:4', '9.962'),
('1:5', '10.048'),
('1:6', '9.969'),
('1:7', '9.986'),
('1:8', '10.004'),
('1:9', '9.993'),
('1:10', '9.964');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_values_01/12/2022-17:31:06`
--

DROP TABLE IF EXISTS `machine_4_values_01/12/2022-17:31:06`;
CREATE TABLE IF NOT EXISTS `machine_4_values_01/12/2022-17:31:06` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_values_01/12/2022-17:31:06`
--

INSERT INTO `machine_4_values_01/12/2022-17:31:06` (`id`, `value`) VALUES
('1:1', '9.996'),
('1:2', '9.992'),
('1:3', '10.041'),
('1:4', '10.027'),
('1:5', '10.044'),
('1:6', '10.01'),
('1:7', '10.013'),
('1:8', '10.017'),
('1:9', '9.983'),
('1:10', '10.038');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_values_01/12/2022-17:31:28`
--

DROP TABLE IF EXISTS `machine_4_values_01/12/2022-17:31:28`;
CREATE TABLE IF NOT EXISTS `machine_4_values_01/12/2022-17:31:28` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_values_01/12/2022-17:31:28`
--

INSERT INTO `machine_4_values_01/12/2022-17:31:28` (`id`, `value`) VALUES
('1:1', '9.985'),
('1:2', '9.996'),
('1:3', '9.989'),
('1:4', '10.016'),
('1:5', '9.976'),
('1:6', '10.042'),
('1:7', '9.957'),
('1:8', '10.044'),
('1:9', '10.029'),
('1:10', '10.012');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_values_01/12/2022-17:31:35`
--

DROP TABLE IF EXISTS `machine_4_values_01/12/2022-17:31:35`;
CREATE TABLE IF NOT EXISTS `machine_4_values_01/12/2022-17:31:35` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_values_01/12/2022-17:31:35`
--

INSERT INTO `machine_4_values_01/12/2022-17:31:35` (`id`, `value`) VALUES
('1:1', '10.043'),
('1:2', '9.961'),
('1:3', '9.98'),
('1:4', '9.966'),
('1:5', '9.961'),
('1:6', '10.007'),
('1:7', '10.01'),
('1:8', '9.958'),
('1:9', '9.976'),
('1:10', '10.012');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_values_01/12/2022-17:31:41`
--

DROP TABLE IF EXISTS `machine_4_values_01/12/2022-17:31:41`;
CREATE TABLE IF NOT EXISTS `machine_4_values_01/12/2022-17:31:41` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_values_01/12/2022-17:31:41`
--

INSERT INTO `machine_4_values_01/12/2022-17:31:41` (`id`, `value`) VALUES
('1:1', '10'),
('1:2', '10.007'),
('1:3', '9.966'),
('1:4', '9.982'),
('1:5', '10.008'),
('1:6', '9.983'),
('1:7', '9.981'),
('1:8', '10.036'),
('1:9', '9.951'),
('1:10', '9.975');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_values_01/12/2022-17:31:46`
--

DROP TABLE IF EXISTS `machine_4_values_01/12/2022-17:31:46`;
CREATE TABLE IF NOT EXISTS `machine_4_values_01/12/2022-17:31:46` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_values_01/12/2022-17:31:46`
--

INSERT INTO `machine_4_values_01/12/2022-17:31:46` (`id`, `value`) VALUES
('1:1', '10.032'),
('1:2', '9.98'),
('1:3', '10.003'),
('1:4', '10.037'),
('1:5', '10.025'),
('1:6', '10.021'),
('1:7', '10.034'),
('1:8', '9.965'),
('1:9', '10.046'),
('1:10', '9.963');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_values_01/12/2022-17:31:52`
--

DROP TABLE IF EXISTS `machine_4_values_01/12/2022-17:31:52`;
CREATE TABLE IF NOT EXISTS `machine_4_values_01/12/2022-17:31:52` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_values_01/12/2022-17:31:52`
--

INSERT INTO `machine_4_values_01/12/2022-17:31:52` (`id`, `value`) VALUES
('1:1', '9.971'),
('1:2', '10.026'),
('1:3', '10.044'),
('1:4', '9.952'),
('1:5', '10.033'),
('1:6', '9.983'),
('1:7', '10.023'),
('1:8', '10.013'),
('1:9', '10.049'),
('1:10', '10.028');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_values_01/12/2022-17:31:57`
--

DROP TABLE IF EXISTS `machine_4_values_01/12/2022-17:31:57`;
CREATE TABLE IF NOT EXISTS `machine_4_values_01/12/2022-17:31:57` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_values_01/12/2022-17:31:57`
--

INSERT INTO `machine_4_values_01/12/2022-17:31:57` (`id`, `value`) VALUES
('1:1', '9.995'),
('1:2', '10.016'),
('1:3', '9.977'),
('1:4', '9.991'),
('1:5', '9.992'),
('1:6', '9.984'),
('1:7', '10.019'),
('1:8', '10.001'),
('1:9', '10.031'),
('1:10', '10.05');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_values_01/12/2022-17:32:01`
--

DROP TABLE IF EXISTS `machine_4_values_01/12/2022-17:32:01`;
CREATE TABLE IF NOT EXISTS `machine_4_values_01/12/2022-17:32:01` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_values_01/12/2022-17:32:01`
--

INSERT INTO `machine_4_values_01/12/2022-17:32:01` (`id`, `value`) VALUES
('1:1', '9.963'),
('1:2', '9.993'),
('1:3', '10.031'),
('1:4', '9.99'),
('1:5', '9.98'),
('1:6', '10.041'),
('1:7', '10.003'),
('1:8', '9.998'),
('1:9', '9.968'),
('1:10', '10.005');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_values_01/12/2022-17:32:06`
--

DROP TABLE IF EXISTS `machine_4_values_01/12/2022-17:32:06`;
CREATE TABLE IF NOT EXISTS `machine_4_values_01/12/2022-17:32:06` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_values_01/12/2022-17:32:06`
--

INSERT INTO `machine_4_values_01/12/2022-17:32:06` (`id`, `value`) VALUES
('1:1', '9.984'),
('1:2', '9.994'),
('1:3', '10.006'),
('1:4', '10.003'),
('1:5', '10.002'),
('1:6', '10.038'),
('1:7', '10.02'),
('1:8', '10.001'),
('1:9', '10.037'),
('1:10', '10.019');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_values_01/12/2022-17:32:13`
--

DROP TABLE IF EXISTS `machine_4_values_01/12/2022-17:32:13`;
CREATE TABLE IF NOT EXISTS `machine_4_values_01/12/2022-17:32:13` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_values_01/12/2022-17:32:13`
--

INSERT INTO `machine_4_values_01/12/2022-17:32:13` (`id`, `value`) VALUES
('1:1', '10.017'),
('1:2', '10.005'),
('1:3', '9.962'),
('1:4', '9.988'),
('1:5', '10.027'),
('1:6', '10.04'),
('1:7', '9.963'),
('1:8', '9.98'),
('1:9', '10.044'),
('1:10', '10.038');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_values_01/12/2022-17:32:18`
--

DROP TABLE IF EXISTS `machine_4_values_01/12/2022-17:32:18`;
CREATE TABLE IF NOT EXISTS `machine_4_values_01/12/2022-17:32:18` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_values_01/12/2022-17:32:18`
--

INSERT INTO `machine_4_values_01/12/2022-17:32:18` (`id`, `value`) VALUES
('1:1', '10.018'),
('1:2', '10.039'),
('1:3', '9.964'),
('1:4', '10'),
('1:5', '9.986'),
('1:6', '10.014'),
('1:7', '10.005'),
('1:8', '9.978'),
('1:9', '10.008'),
('1:10', '10.012');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_values_01/12/2022-17:32:24`
--

DROP TABLE IF EXISTS `machine_4_values_01/12/2022-17:32:24`;
CREATE TABLE IF NOT EXISTS `machine_4_values_01/12/2022-17:32:24` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_values_01/12/2022-17:32:24`
--

INSERT INTO `machine_4_values_01/12/2022-17:32:24` (`id`, `value`) VALUES
('1:1', '10.019'),
('1:2', '9.973'),
('1:3', '10'),
('1:4', '10.025'),
('1:5', '10'),
('1:6', '10.008'),
('1:7', '9.977'),
('1:8', '10.024'),
('1:9', '10.047'),
('1:10', '10.039');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_values_01/12/2022-17:32:30`
--

DROP TABLE IF EXISTS `machine_4_values_01/12/2022-17:32:30`;
CREATE TABLE IF NOT EXISTS `machine_4_values_01/12/2022-17:32:30` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_values_01/12/2022-17:32:30`
--

INSERT INTO `machine_4_values_01/12/2022-17:32:30` (`id`, `value`) VALUES
('1:1', '9.98'),
('1:2', '9.982'),
('1:3', '9.982'),
('1:4', '9.99'),
('1:5', '10.006'),
('1:6', '10.006'),
('1:7', '10.002'),
('1:8', '9.999'),
('1:9', '9.999'),
('1:10', '9.964');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_values_01/12/2022-17:32:36`
--

DROP TABLE IF EXISTS `machine_4_values_01/12/2022-17:32:36`;
CREATE TABLE IF NOT EXISTS `machine_4_values_01/12/2022-17:32:36` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_values_01/12/2022-17:32:36`
--

INSERT INTO `machine_4_values_01/12/2022-17:32:36` (`id`, `value`) VALUES
('1:1', '10.003'),
('1:2', '10.046'),
('1:3', '10.033'),
('1:4', '9.953'),
('1:5', '9.959'),
('1:6', '9.993'),
('1:7', '10.014'),
('1:8', '9.96'),
('1:9', '10.006'),
('1:10', '10.029');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_values_01/12/2022-17:32:41`
--

DROP TABLE IF EXISTS `machine_4_values_01/12/2022-17:32:41`;
CREATE TABLE IF NOT EXISTS `machine_4_values_01/12/2022-17:32:41` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_values_01/12/2022-17:32:41`
--

INSERT INTO `machine_4_values_01/12/2022-17:32:41` (`id`, `value`) VALUES
('1:1', '9.957'),
('1:2', '10.023'),
('1:3', '10.011'),
('1:4', '10.034'),
('1:5', '10.019'),
('1:6', '9.979'),
('1:7', '10.011'),
('1:8', '9.963'),
('1:9', '9.998'),
('1:10', '10.037');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_values_01/12/2022-17:32:49`
--

DROP TABLE IF EXISTS `machine_4_values_01/12/2022-17:32:49`;
CREATE TABLE IF NOT EXISTS `machine_4_values_01/12/2022-17:32:49` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_values_01/12/2022-17:32:49`
--

INSERT INTO `machine_4_values_01/12/2022-17:32:49` (`id`, `value`) VALUES
('1:1', '10.017'),
('1:2', '9.968'),
('1:3', '10.049'),
('1:4', '9.98'),
('1:5', '10.045'),
('1:6', '9.967'),
('1:7', '10.046'),
('1:8', '9.969'),
('1:9', '9.954'),
('1:10', '9.97');

-- --------------------------------------------------------

--
-- Structure de la table `machine_4_values_01/12/2022-17:33:44`
--

DROP TABLE IF EXISTS `machine_4_values_01/12/2022-17:33:44`;
CREATE TABLE IF NOT EXISTS `machine_4_values_01/12/2022-17:33:44` (
  `id` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine_4_values_01/12/2022-17:33:44`
--

INSERT INTO `machine_4_values_01/12/2022-17:33:44` (`id`, `value`) VALUES
('1:1', '10.005'),
('1:2', '9.964'),
('1:3', '10.028'),
('1:4', '10.005'),
('1:5', '9.992'),
('1:6', '9.95'),
('1:7', '10.003'),
('1:8', '10.044'),
('1:9', '9.989'),
('1:10', '9.97');

-- --------------------------------------------------------

--
-- Structure de la table `process_list`
--

DROP TABLE IF EXISTS `process_list`;
CREATE TABLE IF NOT EXISTS `process_list` (
  `id` text NOT NULL,
  `startTime` text NOT NULL,
  `endTime` text NOT NULL,
  `prodCadence` text NOT NULL,
  `normalitySample` text NOT NULL,
  `sampleSize` text NOT NULL,
  `measureTime` text NOT NULL,
  `sampelingCadence` text NOT NULL,
  `SamplesPerDay` text NOT NULL,
  `RemainingSamplesThisDay` text NOT NULL,
  `TS` text NOT NULL,
  `Cible` text NOT NULL,
  `TI` text NOT NULL,
  `samplesForCp` text NOT NULL,
  `Alpha` text NOT NULL,
  PRIMARY KEY (`id`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `process_list`
--

INSERT INTO `process_list` (`id`, `startTime`, `endTime`, `prodCadence`, `normalitySample`, `sampleSize`, `measureTime`, `sampelingCadence`, `SamplesPerDay`, `RemainingSamplesThisDay`, `TS`, `Cible`, `TI`, `samplesForCp`, `Alpha`) VALUES
('Machine_1', '05:30', '14:30', '6', '50', '5', '180', '0.5', '13', '13', '10.05', '10', '9.95', '4', '0.001'),
('Machine_3', '08:30', '16:30', '2', '50', '15', '1', '1', '8', '8', '10.05', '10', '9.95', '2', '90'),
('Machine_2', '16:00', '00:00', '5', '50', '10', '60', '1', '8', '8', '10.15', '10', '9.85', '2', '5'),
('Machine_4', '00:00', '00:00', '5', '50', '10', '30', '1', '24', '24', '10.05', '10', '9.95', '3', '0.005'),
('Machine_5', '14:30', '23:30', '5', '50', '12', '30', '1', '9', '9', '10.05', '10', '9.95', '4', '5');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
