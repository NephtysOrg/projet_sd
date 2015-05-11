-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Dim 10 Mai 2015 à 22:29
-- Version du serveur: 5.5.43-0ubuntu0.14.04.1
-- Version de PHP: 5.5.9-1ubuntu4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `m1`
--

-- --------------------------------------------------------

--
-- Structure de la table `group`
--

CREATE TABLE IF NOT EXISTS `group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `user_id` int(10) unsigned NOT NULL COMMENT 'Owner',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `group`
--

INSERT INTO `group` (`id`, `name`, `description`, `user_id`) VALUES
(1, 'M1 TI (UPPA)', 'Groupe des Mater Technologies de l''Iternet de la faculté de Pau', 25),
(2, 'Groupe Basket UPPA', '', 26),
(3, 'Nos amis les betes', '', 29);

-- --------------------------------------------------------

--
-- Structure de la table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `label` (`label`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Contenu de la table `location`
--

INSERT INTO `location` (`id`, `label`) VALUES
(21, ''),
(20, 'Pau');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `location` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `user_id_2` (`id`),
  KEY `user_id` (`id`),
  KEY `user_id_3` (`id`),
  KEY `localisation` (`location`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `location`) VALUES
(25, 'cfollet', 'cfollet', 20),
(26, 'rbary', 'rbary', 20),
(29, 'Brigitte', 'solution', 21);

-- --------------------------------------------------------

--
-- Structure de la table `user_group`
--

CREATE TABLE IF NOT EXISTS `user_group` (
  `user_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `invited` tinyint(4) NOT NULL COMMENT '0 or 1 to indicate true or false',
  `subscribed` tinyint(4) NOT NULL COMMENT '0 or 1 to indicate true or false',
  `member_since` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `user_group`
--

INSERT INTO `user_group` (`user_id`, `group_id`, `invited`, `subscribed`, `member_since`) VALUES
(25, 1, 0, 0, '2015-05-09 09:04:02'),
(25, 3, 0, 0, '2015-05-09 13:18:40'),
(26, 2, 0, 0, '2015-05-09 09:06:32'),
(26, 3, 1, 0, '2015-05-09 13:18:16'),
(29, 3, 0, 0, '2015-05-09 12:50:11');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `group`
--
ALTER TABLE `group`
  ADD CONSTRAINT `group_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`location`) REFERENCES `location` (`id`);

--
-- Contraintes pour la table `user_group`
--
ALTER TABLE `user_group`
  ADD CONSTRAINT `user_group_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `user_group_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
