-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 31 mars 2019 à 21:59
-- Version du serveur :  5.7.23
-- Version de PHP :  7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `festival`
--
DROP DATABASE IF EXISTS `festival`;
CREATE DATABASE IF NOT EXISTS `festival` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `festival`;

--
-- Utilisateur de la base de données :  `festival`
--

-- --------------------------------------------------------

--
-- Structure de la table `attribution`
--

DROP TABLE IF EXISTS `attribution`;
CREATE TABLE IF NOT EXISTS `attribution` (
  `idEtab` char(8) NOT NULL,
  `idTypeChambre` char(2) NOT NULL,
  `idGroupe` char(4) NOT NULL,
  `nombreChambres` int(11) NOT NULL,
  PRIMARY KEY (`idEtab`,`idTypeChambre`,`idGroupe`),
  KEY `idTypeChambre` (`idTypeChambre`),
  KEY `idGroupe` (`idGroupe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `attribution`
--

INSERT INTO `attribution` (`idEtab`, `idTypeChambre`, `idGroupe`, `nombreChambres`) VALUES
('0350773A', 'C2', 'g001', 3),
('0350773A', 'C2', 'g002', 2),
('0350773A', 'C2', 'g004', 5),
('0350773A', 'C3', 'g005', 1),
('0350785N', 'C1', 'g001', 1),
('0350785N', 'C1', 'g002', 2),
('0350785N', 'C1', 'g003', 2),
('0350785N', 'C2', 'g001', 2),
('0350785N', 'C2', 'g002', 1),
('0350785N', 'C3', 'g001', 2),
('0350785N', 'C3', 'g002', 1),
('0352072M', 'C1', 'g006', 1),
('0352072M', 'C2', 'g007', 3),
('0352072M', 'C3', 'g006', 3);

-- --------------------------------------------------------

--
-- Structure de la table `etablissement`
--

DROP TABLE IF EXISTS `etablissement`;
CREATE TABLE IF NOT EXISTS `etablissement` (
  `id` char(8) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `adresseRue` varchar(45) NOT NULL,
  `codePostal` char(5) NOT NULL,
  `ville` varchar(35) NOT NULL,
  `tel` varchar(13) NOT NULL,
  `adresseElectronique` varchar(70) DEFAULT NULL,
  `type` tinyint(4) NOT NULL,
  `civiliteResponsable` varchar(12) NOT NULL,
  `nomResponsable` varchar(25) NOT NULL,
  `prenomResponsable` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `etablissement`
--

INSERT INTO `etablissement` (`id`, `nom`, `adresseRue`, `codePostal`, `ville`, `tel`, `adresseElectronique`, `type`, `civiliteResponsable`, `nomResponsable`, `prenomResponsable`) VALUES
('0350773A', 'Collège Sainte-Jeanne d&#39;Arc', '3, avenue de la Borderie BP 32', '35404', 'Paramé', '0299560159', 'test4@test.com', 0, 'Madame', 'Lefort', 'Anne'),
('0350785N', 'Collège de Moka', '2 avenue Aristide Briand BP 6', '35401', 'Saint-Malo', '0299206990', 'test@test.com', 0, 'Monsieur', 'Dupont', 'Alain'),
('0352072M', 'Institution Saint-Malo Providence', '2 rue du collège BP 31863', '35418', 'Saint-Malo', '0299407474', NULL, 1, 'Monsieur', 'Durand', 'Pierre');

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

DROP TABLE IF EXISTS `groupe`;
CREATE TABLE IF NOT EXISTS `groupe` (
  `id` char(4) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `identiteResponsable` varchar(40) DEFAULT NULL,
  `adressePostale` varchar(120) DEFAULT NULL,
  `nombrePersonnes` int(11) NOT NULL,
  `nomPays` varchar(40) NOT NULL,
  `hebergement` char(1) NOT NULL,
  `Email` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `groupe`
--

INSERT INTO `groupe` (`id`, `nom`, `identiteResponsable`, `adressePostale`, `nombrePersonnes`, `nomPays`, `hebergement`, `Email`,) VALUES
('g001', 'Groupe folklorique du Bachkortostan', NULL, NULL, 40, 'Bachkirie', 'O', NULL,),
('g002', 'Marina Prudencio Chavez', NULL, NULL, 25, 'Bolivie', 'O', NULL,),
('g003', 'Nangola Bahia de Salvador', NULL, NULL, 34, 'Brésil', 'O', NULL,),
('g004', 'Bizone de Kawarma', NULL, NULL, 38, 'Bulgarie', 'O', NULL,),
('g005', 'Groupe folklorique camerounais', NULL, NULL, 22, 'Cameroun', 'O', NULL,),
('g006', 'Syoung Yaru Mask Dance Group', NULL, NULL, 29, 'Corée du Sud', 'O', NULL,),
('g007', 'Pipe Band', NULL, NULL, 19, 'Ecosse', 'O', NULL,),
('g008', 'Aira da Pedra', NULL, NULL, 5, 'Espagne', 'O', NULL,),
('g009', 'The Jersey Caledonian Pipe Band', NULL, NULL, 21, 'Jersey', 'O', NULL,),
('g010', 'Groupe folklorique des Émirats', NULL, NULL, 30, 'Emirats arabes unis', 'O', NULL,),
('g011', 'Groupe folklorique mexicain', NULL, NULL, 38, 'Mexique', 'O', NULL,),
('g012', 'Groupe folklorique de Panama', NULL, NULL, 22, 'Panama', 'O', NULL,),
('g013', 'Groupe folklorique papou', NULL, NULL, 13, 'Papouasie', 'O', NULL,),
('g014', 'Paraguay Ete', NULL, NULL, 26, 'Paraguay', 'O', NULL,),
('g015', 'La Tuque Bleue', NULL, NULL, 8, 'Québec', 'O', NULL,),
('g016', 'Ensemble Leissen de Oufa', NULL, NULL, 40, 'République de Bachkirie', 'O', NULL,),
('g017', 'Groupe folklorique turc', NULL, NULL, 40, 'Turquie', 'O', NULL,),
('g018', 'Groupe folklorique russe', NULL, NULL, 43, 'Russie', 'O', NULL,),
('g019', 'Ruhunu Ballet du village de Kosgoda', NULL, NULL, 27, 'Sri Lanka', 'O', NULL,),
('g020', 'L\'Alen', NULL, NULL, 34, 'France - Provence', 'O', NULL,),
('g021', 'L\'escolo Di Tourre', NULL, NULL, 40, 'France - Provence', 'O', NULL,),
('g022', 'Deloubes Kévin', NULL, NULL, 1, 'France - Bretagne', 'O', NULL,),
('g023', 'Daonie See', NULL, NULL, 5, 'France - Bretagne', 'O', NULL,),
('g024', 'Boxty', NULL, NULL, 5, 'France - Bretagne', 'O', NULL,),
('g025', 'Soeurs Chauvel', NULL, NULL, 2, 'France - Bretagne', 'O', NULL,),
('g026', 'Cercle Gwik Alet', NULL, NULL, 0, 'France - Bretagne', 'N', NULL,),
('g027', 'Bagad Quic En Groigne', NULL, NULL, 0, 'France - Bretagne', 'N', NULL,),
('g028', 'Penn Treuz', NULL, NULL, 0, 'France - Bretagne', 'N', NULL,),
('g029', 'Savidan Launay', NULL, NULL, 0, 'France - Bretagne', 'N', NULL,),
('g030', 'Cercle Boked Er Lann', NULL, NULL, 0, 'France - Bretagne', 'N', NULL,),
('g031', 'Bagad Montfortais', NULL, NULL, 0, 'France - Bretagne', 'N', NULL,),
('g032', 'Vent de Noroise', NULL, NULL, 0, 'France - Bretagne', 'N', NULL,),
('g033', 'Cercle Strollad', NULL, NULL, 0, 'France - Bretagne', 'N', NULL,),
('g034', 'Bagad An Hanternoz', NULL, NULL, 0, 'France - Bretagne', 'N', NULL,),
('g035', 'Cercle Ar Vro Melenig', NULL, NULL, 0, 'France - Bretagne', 'N', NULL,),
('g036', 'Cercle An Abadenn Nevez', NULL, NULL, 0, 'France - Bretagne', 'N', NULL,),
('g037', 'Kerc\'h Keltiek Roazhon', NULL, NULL, 0, 'France - Bretagne', 'N', NULL,),
('g038', 'Bagad Plougastel', NULL, NULL, 0, 'France - Bretagne', 'N', NULL,),
('g039', 'Bagad Nozeganed Bro Porh-Loeiz', NULL, NULL, 0, 'France - Bretagne', 'N', NULL,),
('g040', 'Bagad Nozeganed Bro Porh-Loeiz', NULL, NULL, 0, 'France - Bretagne', 'N', NULL,),
('g041', 'Jackie Molard Quartet', NULL, NULL, 0, 'France - Bretagne', 'N', NULL,),
('g042', 'Deomp', NULL, NULL, 0, 'France - Bretagne', 'N', NULL,);

-- --------------------------------------------------------

--
-- Structure de la table `offre`
--

DROP TABLE IF EXISTS `offre`;
CREATE TABLE IF NOT EXISTS `offre` (
  `idEtab` char(8) NOT NULL,
  `idTypeChambre` char(2) NOT NULL,
  `nombreChambres` int(11) NOT NULL,
  PRIMARY KEY (`idEtab`,`idTypeChambre`),
  KEY `idTypeChambre` (`idTypeChambre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `offre`
--

INSERT INTO `offre` (`idEtab`, `idTypeChambre`, `nombreChambres`) VALUES
('0350773A', 'C1', 10),
('0350773A', 'C2', 15),
('0350773A', 'C3', 1),
('0350785N', 'C1', 6),
('0350785N', 'C2', 10),
('0350785N', 'C3', 5),
('0352072M', 'C1', 5),
('0352072M', 'C2', 10),
('0352072M', 'C3', 3);

-- --------------------------------------------------------

--
-- Structure de la table `typechambre`
--

DROP TABLE IF EXISTS `typechambre`;
CREATE TABLE IF NOT EXISTS `typechambre` (
  `id` char(2) NOT NULL,
  `libelle` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `typechambre`
--

INSERT INTO `typechambre` (`id`, `libelle`) VALUES
('C1', '1 lit'),
('C2', '2 à 3 lits'),
('C3', '4 à 5 lits'),
('C4', '6 à 8 lits'),
('C5', '8 à 12 lits');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `attribution`
--
ALTER TABLE `attribution`
  ADD CONSTRAINT `fk1_Attribution` FOREIGN KEY (`idGroupe`) REFERENCES `groupe` (`id`),
  ADD CONSTRAINT `fk2_Attribution` FOREIGN KEY (`idEtab`,`idTypeChambre`) REFERENCES `offre` (`idEtab`, `idTypeChambre`);

--
-- Contraintes pour la table `offre`
--
ALTER TABLE `offre`
  ADD CONSTRAINT `fk1_Offre` FOREIGN KEY (`idEtab`) REFERENCES `etablissement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk2_Offre` FOREIGN KEY (`idTypeChambre`) REFERENCES `typechambre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;