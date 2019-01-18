# ************************************************************
# Sequel Pro SQL dump
# Version 4540
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.23)
# Database: java
# Generation Time: 2019-01-18 03:00:13 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table frota
# ------------------------------------------------------------

DROP TABLE IF EXISTS `frota`;

CREATE TABLE `frota` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `matricula` varchar(30) NOT NULL DEFAULT '',
  `situacao` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `frota` WRITE;
/*!40000 ALTER TABLE `frota` DISABLE KEYS */;

INSERT INTO `frota` (`id`, `matricula`, `situacao`)
VALUES
	(59,'30-50-ZD','Na Revisão'),
	(61,'40-13-SZ','Em Trânsito'),
	(63,'56-12-PO','Avariado'),
	(68,'34-56-ZA','Avariado'),
	(70,'30-40-12','Na Revisão'),
	(71,'49-13-DX','Em Trânsito'),
	(73,'09-57-SX','Estancionado'),
	(74,'24-65-ZA','Estancionado'),
	(78,'24-65-ZA','Avariado'),
	(79,'24-65-ZA','Avariado'),
	(80,'24-65-ZA','Na Revisão'),
	(81,'24-65-ZA','Na Revisão');

/*!40000 ALTER TABLE `frota` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
