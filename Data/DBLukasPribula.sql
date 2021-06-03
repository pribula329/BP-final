-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: bakalarka
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adresa`
--

DROP TABLE IF EXISTS `adresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adresa` (
  `PSČ` varchar(5) NOT NULL,
  `Mesto` varchar(55) NOT NULL,
  `Ulica` varchar(100) NOT NULL,
  `Číslo` int NOT NULL,
  `id_adresa` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_adresa`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresa`
--

LOCK TABLES `adresa` WRITE;
/*!40000 ALTER TABLE `adresa` DISABLE KEYS */;
INSERT INTO `adresa` VALUES ('08271','Krivany','Hlavná',36,1),('08271','Lipany','Komenského',24,8),('08271','Rožkovany','Rožkovany',117,15),('08274','Brezovica','Brezovica',308,22),('08271','Krivany','Železničná',329,274);
/*!40000 ALTER TABLE `adresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `druzstvavlige`
--

DROP TABLE IF EXISTS `druzstvavlige`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `druzstvavlige` (
  `id_ligy` int DEFAULT NULL,
  `id_druzstva` int DEFAULT NULL,
  KEY `id_druzstvo` (`id_druzstva`),
  KEY `id_ligy` (`id_ligy`),
  CONSTRAINT `id_druzstvo` FOREIGN KEY (`id_druzstva`) REFERENCES `druzstvo` (`id_druzstvo`),
  CONSTRAINT `id_ligy` FOREIGN KEY (`id_ligy`) REFERENCES `liga` (`id_liga`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `druzstvavlige`
--

LOCK TABLES `druzstvavlige` WRITE;
/*!40000 ALTER TABLE `druzstvavlige` DISABLE KEYS */;
/*!40000 ALTER TABLE `druzstvavlige` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `druzstvo`
--

DROP TABLE IF EXISTS `druzstvo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `druzstvo` (
  `id_druzstvo` int NOT NULL AUTO_INCREMENT,
  `Nazov` varchar(105) NOT NULL,
  `Miestnosť` varchar(105) NOT NULL,
  `id_adresa` int DEFAULT NULL,
  `id_veduceho_druzstva` int DEFAULT NULL,
  PRIMARY KEY (`id_druzstvo`),
  KEY `idadresa_idx` (`id_adresa`),
  KEY `idVeducehoDruzstva_idx` (`id_veduceho_druzstva`),
  CONSTRAINT `id_adresa` FOREIGN KEY (`id_adresa`) REFERENCES `adresa` (`id_adresa`),
  CONSTRAINT `id_veduceho_druzstva` FOREIGN KEY (`id_veduceho_druzstva`) REFERENCES `osoba` (`id_osoba`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `druzstvo`
--

LOCK TABLES `druzstvo` WRITE;
/*!40000 ALTER TABLE `druzstvo` DISABLE KEYS */;
INSERT INTO `druzstvo` VALUES (3,'Družstvo A','Telocvičňa A',1,4),(10,'Družstvo B','Telocvičňa B',8,9),(17,'Družstvo C','Telocvičňa C',15,16),(24,'Družstvo D','Telocvičňa D',22,271);
/*!40000 ALTER TABLE `druzstvo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (279),(279),(279),(279),(279),(279);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequences`
--

DROP TABLE IF EXISTS `hibernate_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) NOT NULL,
  `next_val` bigint DEFAULT NULL,
  PRIMARY KEY (`sequence_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequences`
--

LOCK TABLES `hibernate_sequences` WRITE;
/*!40000 ALTER TABLE `hibernate_sequences` DISABLE KEYS */;
INSERT INTO `hibernate_sequences` VALUES ('default',1);
/*!40000 ALTER TABLE `hibernate_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liga`
--

DROP TABLE IF EXISTS `liga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `liga` (
  `id_liga` int NOT NULL AUTO_INCREMENT,
  `nazov_liga` varchar(100) DEFAULT NULL,
  `rocnik_liga` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_liga`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liga`
--

LOCK TABLES `liga` WRITE;
/*!40000 ALTER TABLE `liga` DISABLE KEYS */;
INSERT INTO `liga` VALUES (1,'Liga pre štyroch','2020/2021');
/*!40000 ALTER TABLE `liga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odohravaniezapasu`
--

DROP TABLE IF EXISTS `odohravaniezapasu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `odohravaniezapasu` (
  `id_domaci_team` int DEFAULT NULL,
  `id_hostujuci_team` int DEFAULT NULL,
  `id_zapas` int DEFAULT NULL,
  `datum` date DEFAULT NULL,
  `id_rozhodcu` int DEFAULT NULL,
  `id_kola` int DEFAULT NULL,
  KEY `idDomaciTeam_idx` (`id_domaci_team`),
  KEY `idHostujuciTeam_idx` (`id_hostujuci_team`),
  KEY `idZapas_idx` (`id_zapas`),
  KEY `idRozhodcu_idx` (`id_rozhodcu`),
  CONSTRAINT `id_domaci_team` FOREIGN KEY (`id_domaci_team`) REFERENCES `druzstvo` (`id_druzstvo`),
  CONSTRAINT `id_hostujuci_team` FOREIGN KEY (`id_hostujuci_team`) REFERENCES `druzstvo` (`id_druzstvo`),
  CONSTRAINT `id_rozhodcu` FOREIGN KEY (`id_rozhodcu`) REFERENCES `osoba` (`id_osoba`),
  CONSTRAINT `id_zapas` FOREIGN KEY (`id_zapas`) REFERENCES `zapas` (`id_zapasu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odohravaniezapasu`
--

LOCK TABLES `odohravaniezapasu` WRITE;
/*!40000 ALTER TABLE `odohravaniezapasu` DISABLE KEYS */;
INSERT INTO `odohravaniezapasu` VALUES (24,3,46,'2020-12-05',23,1),(17,10,80,'2020-12-04',18,1),(3,17,97,'2020-12-11',2,2),(10,24,114,'2020-12-11',9,2),(10,3,131,'2020-12-18',9,3),(24,17,148,'2020-12-18',23,3),(3,24,165,'2021-03-05',2,4),(10,17,199,'2021-03-05',9,4),(17,3,216,'2021-03-12',18,5),(24,10,233,'2021-03-12',23,5),(3,10,250,'2021-03-15',2,6),(17,24,267,'2021-03-15',18,6);
/*!40000 ALTER TABLE `odohravaniezapasu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `osoba`
--

DROP TABLE IF EXISTS `osoba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `osoba` (
  `id_osoba` int NOT NULL AUTO_INCREMENT,
  `Meno` varchar(45) NOT NULL,
  `Priezvisko` varchar(45) NOT NULL,
  `Datum_narodenia` date DEFAULT NULL,
  `TypH` tinyint(1) DEFAULT NULL,
  `TypR` tinyint(1) DEFAULT NULL,
  `TypT` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_osoba`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `osoba`
--

LOCK TABLES `osoba` WRITE;
/*!40000 ALTER TABLE `osoba` DISABLE KEYS */;
INSERT INTO `osoba` VALUES (2,'Jozef','Šťastný','1984-04-05',1,1,1),(4,'Janko','Mrkvička','1990-06-08',1,0,0),(5,'Lukáš','Malý','1998-12-03',1,0,0),(6,'Ján','Pestrý','1999-11-11',1,0,0),(7,'Martin','Obrovský','2004-02-03',1,0,0),(9,'Anton','Brzda','1989-08-03',1,1,1),(11,'Pavol','Brzda','2001-03-01',1,0,0),(12,'Michal','Rýchly','2002-02-20',1,0,0),(13,'Dávid','Múdry','2003-07-10',1,0,0),(14,'Štefan','Múdry','1999-10-10',1,0,0),(16,'František','Zelený','1995-09-14',1,0,1),(18,'Silvester','Dlhý','2000-04-06',1,1,0),(19,'Erik','Hronský','1995-08-18',1,0,0),(20,'Adam','Bohatý','2000-04-05',1,0,0),(21,'Maroš','Mucha','1998-10-23',1,0,0),(23,'Samuel','Pomaly','1986-12-28',1,1,1),(25,'Patrik','Slabý','1999-11-10',1,0,0),(26,'Adam','Bystrý','2000-05-05',1,0,0),(27,'Alexander','Veľký','1996-04-29',1,0,0),(28,'Marko','Slušný','2003-05-14',1,0,0),(271,'Jaroslav','Mištecko','1998-05-23',1,0,0);
/*!40000 ALTER TABLE `osoba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokuty`
--

DROP TABLE IF EXISTS `pokuty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokuty` (
  `idpokuty` int NOT NULL AUTO_INCREMENT,
  `id_druzstva` int DEFAULT NULL,
  `popis` varchar(255) DEFAULT NULL,
  `id_rozhodcu` int DEFAULT NULL,
  PRIMARY KEY (`idpokuty`),
  KEY `id_druzstvo_idxfk` (`id_druzstva`),
  KEY `id_rozhodcufk` (`id_rozhodcu`),
  CONSTRAINT `id_druzstvofk` FOREIGN KEY (`id_druzstva`) REFERENCES `druzstvo` (`id_druzstvo`),
  CONSTRAINT `id_rozhodcufk` FOREIGN KEY (`id_rozhodcu`) REFERENCES `osoba` (`id_osoba`)
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokuty`
--

LOCK TABLES `pokuty` WRITE;
/*!40000 ALTER TABLE `pokuty` DISABLE KEYS */;
INSERT INTO `pokuty` VALUES (270,3,'Pokuta 5€ za nedodržanie dresou',2),(272,10,'Pokuta 5€ za nedodržanie dresou',9),(273,17,'Pokuta 5€ za nedodržanie dresou',23);
/*!40000 ALTER TABLE `pokuty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'USER'),(2,'CREATOR'),(3,'EDITOR'),(4,'ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skorezapasov`
--

DROP TABLE IF EXISTS `skorezapasov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skorezapasov` (
  `idskorezapasov` int NOT NULL AUTO_INCREMENT,
  `id_domaci` int DEFAULT NULL,
  `id_hostujuci` int DEFAULT NULL,
  `skore` varchar(3) DEFAULT NULL,
  `vitaz` int DEFAULT NULL,
  `kolo` int DEFAULT NULL,
  PRIMARY KEY (`idskorezapasov`),
  KEY `id_domaci_hrac_idx` (`id_domaci`),
  KEY `id_hostujuci_hrac_idx` (`id_hostujuci`),
  CONSTRAINT `id_domaci_hrac` FOREIGN KEY (`id_domaci`) REFERENCES `osoba` (`id_osoba`),
  CONSTRAINT `id_hostujuci_hrac` FOREIGN KEY (`id_hostujuci`) REFERENCES `osoba` (`id_osoba`)
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skorezapasov`
--

LOCK TABLES `skorezapasov` WRITE;
/*!40000 ALTER TABLE `skorezapasov` DISABLE KEYS */;
INSERT INTO `skorezapasov` VALUES (30,23,2,'3:1',1,1),(31,25,4,'1:3',2,1),(32,26,5,'0:3',2,1),(33,27,6,'1:3',2,1),(34,23,4,'3:2',1,1),(35,25,5,'0:3',2,1),(36,26,6,'2:3',2,1),(37,27,2,'1:3',2,1),(38,23,5,'1:3',2,1),(39,25,6,'2:3',2,1),(40,26,2,'1:3',2,1),(41,28,4,'2:3',2,1),(42,23,6,'3:1',1,1),(43,25,2,'2:3',2,1),(44,26,4,'1:3',2,1),(45,28,5,'0:3',2,1),(64,16,9,'3:0',1,1),(65,18,11,'3:0',1,1),(66,19,12,'3:2',1,1),(67,20,13,'2:3',2,1),(68,16,11,'1:3',2,1),(69,18,12,'2:3',2,1),(70,19,13,'2:3',2,1),(71,21,9,'3:0',1,1),(72,16,12,'0:3',2,1),(73,18,13,'1:3',2,1),(74,19,9,'1:3',2,1),(75,21,11,'3:1',1,1),(76,16,13,'0:3',2,1),(77,18,9,'1:3',2,1),(78,19,11,'2:3',2,1),(79,21,12,'3:1',1,1),(81,2,16,'3:0',1,2),(82,4,18,'3:2',1,2),(83,5,19,'3:0',1,2),(84,6,20,'3:0',1,2),(85,2,18,'0:3',2,2),(86,4,19,'1:3',2,2),(87,5,21,'3:2',1,2),(88,6,16,'1:3',2,2),(89,2,19,'3:1',1,2),(90,4,21,'1:3',2,2),(91,5,16,'3:0',1,2),(92,6,18,'1:3',2,2),(93,2,21,'0:3',2,2),(94,4,16,'3:1',1,2),(95,5,18,'3:1',1,2),(96,6,19,'1:3',2,2),(98,9,23,'1:3',2,2),(99,11,25,'3:0',1,2),(100,12,26,'3:1',1,2),(101,13,27,'3:1',1,2),(102,9,25,'3:0',1,2),(103,11,26,'3:2',1,2),(104,12,27,'3:0',1,2),(105,13,23,'1:3',2,2),(106,9,26,'3:0',1,2),(107,11,27,'3:0',1,2),(108,12,23,'2:3',2,2),(109,13,25,'3:2',1,2),(110,9,27,'3:0',1,2),(111,11,23,'1:3',2,2),(112,12,25,'3:0',1,2),(113,13,26,'3:0',1,2),(115,9,2,'3:1',1,3),(116,11,4,'3:1',1,3),(117,12,5,'0:3',2,3),(118,13,6,'0:3',2,3),(119,9,4,'3:2',1,3),(120,11,5,'0:3',2,3),(121,12,6,'1:3',2,3),(122,13,2,'1:3',2,3),(123,9,5,'2:3',2,3),(124,11,6,'0:3',2,3),(125,12,2,'3:2',1,3),(126,13,4,'1:3',2,3),(127,9,6,'3:0',1,3),(128,11,2,'1:3',2,3),(129,12,4,'1:3',2,3),(130,13,5,'2:3',2,3),(132,23,16,'3:2',1,3),(133,25,18,'3:1',1,3),(134,26,19,'3:2',1,3),(135,27,20,'0:3',2,3),(136,23,18,'3:2',1,3),(137,25,19,'3:1',1,3),(138,26,20,'1:3',2,3),(139,27,16,'1:3',2,3),(140,23,19,'3:0',1,3),(141,25,20,'1:3',2,3),(142,26,16,'1:3',2,3),(143,28,18,'3:0',1,3),(144,23,20,'3:0',1,3),(145,25,16,'1:3',2,3),(146,26,18,'2:3',2,3),(147,28,19,'1:3',2,3),(149,2,23,'3:0',1,4),(150,4,25,'3:1',1,4),(151,5,26,'2:3',2,4),(152,6,28,'0:3',2,4),(153,2,25,'3:1',1,4),(154,4,26,'1:3',2,4),(155,5,28,'1:3',2,4),(156,6,23,'3:0',1,4),(157,2,26,'0:3',2,4),(158,4,28,'1:3',2,4),(159,5,23,'3:0',1,4),(160,6,25,'3:1',1,4),(161,2,28,'0:3',2,4),(162,4,23,'3:0',1,4),(163,5,25,'3:0',1,4),(164,6,26,'2:3',2,4),(183,9,16,'3:0',1,4),(184,11,18,'3:2',1,4),(185,12,19,'0:3',2,4),(186,13,20,'1:3',2,4),(187,9,18,'3:1',1,4),(188,11,19,'3:2',1,4),(189,12,20,'3:2',1,4),(190,13,16,'3:2',1,4),(191,9,19,'1:3',2,4),(192,11,20,'3:0',1,4),(193,12,16,'1:3',2,4),(194,13,18,'3:2',1,4),(195,9,20,'2:3',2,4),(196,11,16,'2:3',2,4),(197,12,18,'3:1',1,4),(198,13,19,'3:0',1,4),(200,16,2,'3:0',1,5),(201,18,4,'0:3',2,5),(202,19,5,'0:3',2,5),(203,20,6,'1:3',2,5),(204,16,4,'2:3',2,5),(205,18,5,'1:3',2,5),(206,19,6,'3:2',1,5),(207,20,2,'0:3',2,5),(208,16,5,'1:3',2,5),(209,18,6,'3:1',1,5),(210,19,2,'3:1',1,5),(211,21,4,'2:3',2,5),(212,16,6,'1:3',2,5),(213,18,2,'3:1',1,5),(214,19,4,'1:3',2,5),(215,21,5,'2:3',2,5),(217,23,9,'3:2',1,5),(218,25,11,'3:1',1,5),(219,26,12,'3:0',1,5),(220,28,13,'3:0',1,5),(221,23,11,'0:3',2,5),(222,25,12,'1:3',2,5),(223,26,13,'3:0',1,5),(224,28,9,'3:0',1,5),(225,23,12,'1:3',2,5),(226,25,13,'1:3',2,5),(227,26,9,'3:1',1,5),(228,28,11,'3:1',1,5),(229,23,13,'3:1',1,5),(230,25,9,'3:2',1,5),(231,26,11,'3:1',1,5),(232,28,12,'3:2',1,5),(234,2,9,'3:1',1,6),(235,4,11,'3:2',1,6),(236,5,12,'3:0',1,6),(237,7,13,'0:3',2,6),(238,2,11,'3:2',1,6),(239,4,12,'3:0',1,6),(240,5,13,'3:2',1,6),(241,7,9,'0:3',2,6),(242,2,12,'3:0',1,6),(243,4,13,'3:2',1,6),(244,5,9,'3:1',1,6),(245,7,11,'1:3',2,6),(246,2,13,'3:1',1,6),(247,4,9,'3:1',1,6),(248,5,11,'3:2',1,6),(249,7,12,'2:3',2,6),(251,16,23,'3:2',1,6),(252,18,25,'3:1',1,6),(253,19,26,'0:3',2,6),(254,20,28,'2:3',2,6),(255,16,25,'3:0',1,6),(256,18,26,'1:3',2,6),(257,19,28,'1:3',2,6),(258,20,23,'3:2',1,6),(259,16,26,'1:3',2,6),(260,18,28,'0:3',2,6),(261,19,23,'3:2',1,6),(262,20,25,'3:1',1,6),(263,16,28,'1:3',2,6),(264,18,23,'3:2',1,6),(265,19,25,'3:2',1,6),(266,20,26,'2:3',2,6);
/*!40000 ALTER TABLE `skorezapasov` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(64) NOT NULL,
  `enabled` tinyint DEFAULT NULL,
  `osoba_id` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`username`),
  KEY `users_osoba_id_osoba_fk` (`osoba_id`),
  CONSTRAINT `users_osoba_id_osoba_fk` FOREIGN KEY (`osoba_id`) REFERENCES `osoba` (`id_osoba`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'patrick','$2a$10$cTUErxQqYVyU2qmQGIktpup5chLEdhD2zpzNEyYqmxrHHJbSNDOG.',1,NULL),(2,'alex','$2a$10$.tP2OH3dEG0zms7vek4ated5AiQ.EGkncii0OpCcGq4bckS9NOULu',1,NULL),(3,'john','$2a$10$E2UPv7arXmp3q0LzVzCBNeb4B4AtbTAGjkefVDnSztOwE7Gix6kea',1,NULL),(4,'namhm','$2a$10$GQT8bfLMaLYwlyUysnGwDu6HMB5G.tin5MKT/uduv2Nez0.DmhnOq',1,NULL),(5,'admin','$2a$10$IqTJTjn39IU5.7sSCDQxzu3xug6z/LPU6IF0azE/8CkHCwYEnwBX.',1,2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  KEY `user_fk_idx` (`user_id`),
  KEY `role_fk_idx` (`role_id`),
  CONSTRAINT `role_fk` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  CONSTRAINT `user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,1),(2,2),(3,3),(4,2),(4,3),(5,4);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vybavenie`
--

DROP TABLE IF EXISTS `vybavenie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vybavenie` (
  `id_vybavenia` int NOT NULL AUTO_INCREMENT,
  `nazov_vybavenia` varchar(45) DEFAULT NULL,
  `typ` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_vybavenia`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vybavenie`
--

LOCK TABLES `vybavenie` WRITE;
/*!40000 ALTER TABLE `vybavenie` DISABLE KEYS */;
INSERT INTO `vybavenie` VALUES (29,'Donic table','Stôl');
/*!40000 ALTER TABLE `vybavenie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vybaveniedruzstva`
--

DROP TABLE IF EXISTS `vybaveniedruzstva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vybaveniedruzstva` (
  `id_druzstva` int DEFAULT NULL,
  `id_vybavenia` int DEFAULT NULL,
  `pocet` int DEFAULT NULL,
  KEY `id_teamu` (`id_druzstva`),
  KEY `id_vybavenia` (`id_vybavenia`),
  CONSTRAINT `id_teamu` FOREIGN KEY (`id_druzstva`) REFERENCES `druzstvo` (`id_druzstvo`),
  CONSTRAINT `id_vybavenia` FOREIGN KEY (`id_vybavenia`) REFERENCES `vybavenie` (`id_vybavenia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vybaveniedruzstva`
--

LOCK TABLES `vybaveniedruzstva` WRITE;
/*!40000 ALTER TABLE `vybaveniedruzstva` DISABLE KEYS */;
INSERT INTO `vybaveniedruzstva` VALUES (3,29,2);
/*!40000 ALTER TABLE `vybaveniedruzstva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zapas`
--

DROP TABLE IF EXISTS `zapas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zapas` (
  `id_zapasu` int NOT NULL AUTO_INCREMENT,
  `skore_domaci` int DEFAULT NULL,
  `skore_hostia` int DEFAULT NULL,
  `skore1` int DEFAULT NULL,
  `skore2` int DEFAULT NULL,
  `skore3` int DEFAULT NULL,
  `skore4` int DEFAULT NULL,
  `skore5` int DEFAULT NULL,
  `skore6` int DEFAULT NULL,
  `skore7` int DEFAULT NULL,
  `skore8` int DEFAULT NULL,
  `skore9` int DEFAULT NULL,
  `skore10` int DEFAULT NULL,
  `skore11` int DEFAULT NULL,
  `skore12` int DEFAULT NULL,
  `skore13` int DEFAULT NULL,
  `skore14` int DEFAULT NULL,
  `skore15` int DEFAULT NULL,
  `skore16` int DEFAULT NULL,
  PRIMARY KEY (`id_zapasu`),
  KEY `id_skore1_idx` (`skore1`),
  KEY `id_skore2_idx` (`skore2`),
  KEY `id_skore3_idx` (`skore3`),
  KEY `id_skore4_idx` (`skore4`),
  KEY `id_skore5_idx` (`skore5`),
  KEY `id_skore6_idx` (`skore6`),
  KEY `id_skore7_idx` (`skore7`),
  KEY `id_skore8_idx` (`skore8`),
  KEY `id_skore9_idx` (`skore9`),
  KEY `id_skore10_idx` (`skore10`),
  KEY `id_skore11_idx` (`skore11`),
  KEY `id_skore12_idx` (`skore12`),
  KEY `id_skore13_idx` (`skore13`),
  KEY `id_skore14_idx` (`skore14`),
  KEY `id_skore15_idx` (`skore15`),
  KEY `id_skore16_idx` (`skore16`),
  CONSTRAINT `id_skore1` FOREIGN KEY (`skore1`) REFERENCES `skorezapasov` (`idskorezapasov`),
  CONSTRAINT `id_skore10` FOREIGN KEY (`skore10`) REFERENCES `skorezapasov` (`idskorezapasov`),
  CONSTRAINT `id_skore11` FOREIGN KEY (`skore11`) REFERENCES `skorezapasov` (`idskorezapasov`),
  CONSTRAINT `id_skore12` FOREIGN KEY (`skore12`) REFERENCES `skorezapasov` (`idskorezapasov`),
  CONSTRAINT `id_skore13` FOREIGN KEY (`skore13`) REFERENCES `skorezapasov` (`idskorezapasov`),
  CONSTRAINT `id_skore14` FOREIGN KEY (`skore14`) REFERENCES `skorezapasov` (`idskorezapasov`),
  CONSTRAINT `id_skore15` FOREIGN KEY (`skore15`) REFERENCES `skorezapasov` (`idskorezapasov`),
  CONSTRAINT `id_skore16` FOREIGN KEY (`skore16`) REFERENCES `skorezapasov` (`idskorezapasov`),
  CONSTRAINT `id_skore2` FOREIGN KEY (`skore2`) REFERENCES `skorezapasov` (`idskorezapasov`),
  CONSTRAINT `id_skore3` FOREIGN KEY (`skore3`) REFERENCES `skorezapasov` (`idskorezapasov`),
  CONSTRAINT `id_skore4` FOREIGN KEY (`skore4`) REFERENCES `skorezapasov` (`idskorezapasov`),
  CONSTRAINT `id_skore5` FOREIGN KEY (`skore5`) REFERENCES `skorezapasov` (`idskorezapasov`),
  CONSTRAINT `id_skore6` FOREIGN KEY (`skore6`) REFERENCES `skorezapasov` (`idskorezapasov`),
  CONSTRAINT `id_skore7` FOREIGN KEY (`skore7`) REFERENCES `skorezapasov` (`idskorezapasov`),
  CONSTRAINT `id_skore8` FOREIGN KEY (`skore8`) REFERENCES `skorezapasov` (`idskorezapasov`),
  CONSTRAINT `id_skore9` FOREIGN KEY (`skore9`) REFERENCES `skorezapasov` (`idskorezapasov`)
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zapas`
--

LOCK TABLES `zapas` WRITE;
/*!40000 ALTER TABLE `zapas` DISABLE KEYS */;
INSERT INTO `zapas` VALUES (46,3,13,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45),(80,6,10,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79),(97,9,7,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96),(114,12,4,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113),(131,5,11,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130),(148,8,8,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147),(165,8,8,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164),(199,10,6,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198),(216,5,11,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215),(233,12,4,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232),(250,12,4,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249),(267,8,8,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266);
/*!40000 ALTER TABLE `zapas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zapishracadruzstvu`
--

DROP TABLE IF EXISTS `zapishracadruzstvu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zapishracadruzstvu` (
  `id_hraca` int DEFAULT NULL,
  `id_druzstva` int DEFAULT NULL,
  KEY `idHraca_idx` (`id_hraca`),
  KEY `idDruzstva_idx` (`id_druzstva`),
  CONSTRAINT `id_druzstva` FOREIGN KEY (`id_druzstva`) REFERENCES `druzstvo` (`id_druzstvo`),
  CONSTRAINT `id_hraca` FOREIGN KEY (`id_hraca`) REFERENCES `osoba` (`id_osoba`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zapishracadruzstvu`
--

LOCK TABLES `zapishracadruzstvu` WRITE;
/*!40000 ALTER TABLE `zapishracadruzstvu` DISABLE KEYS */;
INSERT INTO `zapishracadruzstvu` VALUES (4,3),(5,3),(6,3),(7,3),(2,3),(9,10),(11,10),(12,10),(13,10),(14,10),(16,17),(18,17),(19,17),(20,17),(21,17),(23,24),(25,24),(26,24),(27,24),(28,24),(271,24);
/*!40000 ALTER TABLE `zapishracadruzstvu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-03 13:53:06
