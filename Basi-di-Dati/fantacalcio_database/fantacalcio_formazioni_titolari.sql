-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: fantacalcio
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `formazioni_titolari`
--

DROP TABLE IF EXISTS `formazioni_titolari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formazioni_titolari` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `giornata_id` int DEFAULT NULL,
  `fantallenatore_id` int DEFAULT NULL,
  `calciatore_id` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `giornata_id` (`giornata_id`),
  KEY `calciatore_id` (`calciatore_id`),
  KEY `fantallenatore_id` (`fantallenatore_id`),
  CONSTRAINT `formazioni_titolari_ibfk_1` FOREIGN KEY (`giornata_id`) REFERENCES `giornate` (`Id`),
  CONSTRAINT `formazioni_titolari_ibfk_2` FOREIGN KEY (`calciatore_id`) REFERENCES `calciatori` (`Id`),
  CONSTRAINT `formazioni_titolari_ibfk_3` FOREIGN KEY (`fantallenatore_id`) REFERENCES `fantallenatore` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formazioni_titolari`
--

LOCK TABLES `formazioni_titolari` WRITE;
/*!40000 ALTER TABLE `formazioni_titolari` DISABLE KEYS */;
INSERT INTO `formazioni_titolari` VALUES (1,1,1,3),(2,1,1,4),(3,1,1,1),(4,1,1,5),(5,1,1,6),(6,1,1,7),(7,1,1,8),(8,1,1,9),(9,1,1,10),(10,1,1,11),(11,1,1,12),(12,1,2,2),(13,1,2,26),(14,1,2,27),(15,1,2,28),(16,1,2,29),(17,1,2,30),(18,1,2,31),(19,1,2,32),(20,1,2,33),(21,1,2,34),(22,1,2,35);
/*!40000 ALTER TABLE `formazioni_titolari` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-17 16:34:35