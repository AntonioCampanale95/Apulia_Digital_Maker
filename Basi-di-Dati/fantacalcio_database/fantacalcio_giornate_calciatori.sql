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
-- Table structure for table `giornate_calciatori`
--

DROP TABLE IF EXISTS `giornate_calciatori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giornate_calciatori` (
  `giornata_id` int NOT NULL,
  `calciatore_id` int NOT NULL,
  `voto` decimal(4,2) NOT NULL,
  PRIMARY KEY (`giornata_id`,`calciatore_id`),
  KEY `calciatore_id` (`calciatore_id`),
  CONSTRAINT `giornate_calciatori_ibfk_1` FOREIGN KEY (`giornata_id`) REFERENCES `giornate` (`Id`),
  CONSTRAINT `giornate_calciatori_ibfk_2` FOREIGN KEY (`calciatore_id`) REFERENCES `calciatori` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giornate_calciatori`
--

LOCK TABLES `giornate_calciatori` WRITE;
/*!40000 ALTER TABLE `giornate_calciatori` DISABLE KEYS */;
INSERT INTO `giornate_calciatori` VALUES (1,1,6.50),(1,2,6.00),(1,3,7.00),(1,4,5.50),(1,5,6.00),(1,6,7.50),(1,7,6.00),(1,8,6.50),(1,9,6.00),(1,10,7.00),(1,11,5.50),(1,12,7.00),(1,13,6.50),(1,14,6.00),(1,15,5.50),(1,16,6.00),(1,17,7.00),(1,18,6.00),(1,19,6.50),(1,20,5.50),(1,21,6.00),(1,22,6.50),(1,23,6.00),(1,24,5.50),(1,25,6.00),(1,26,7.00),(1,27,6.50),(1,28,6.00),(1,29,7.00),(1,30,5.50),(1,31,6.00),(1,32,6.50),(1,33,6.00),(1,34,5.50),(1,35,6.00),(1,36,7.00),(1,37,6.50),(1,38,6.00),(1,39,7.00),(1,40,5.50),(1,41,6.00),(1,42,6.50),(1,43,6.00),(1,44,5.50),(1,45,6.00),(1,46,7.00),(1,47,6.50),(1,48,6.00),(1,49,7.00),(1,50,5.50),(1,51,6.00),(1,52,6.50),(1,53,6.00),(1,54,5.50),(1,55,6.00),(1,70,7.50);
/*!40000 ALTER TABLE `giornate_calciatori` ENABLE KEYS */;
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
