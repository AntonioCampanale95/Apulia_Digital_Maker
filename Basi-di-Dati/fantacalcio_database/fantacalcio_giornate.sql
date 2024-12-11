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
-- Table structure for table `giornate`
--

DROP TABLE IF EXISTS `giornate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giornate` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giornate`
--

LOCK TABLES `giornate` WRITE;
/*!40000 ALTER TABLE `giornate` DISABLE KEYS */;
INSERT INTO `giornate` VALUES (1,'2024-08-24','Prima giornata'),(2,'2024-08-31','Seconda giornata'),(3,'2024-09-07','Terza giornata'),(4,'2024-09-14','Quarta giornata'),(5,'2024-09-21','Quinta giornata'),(6,'2024-09-28','Sesta giornata'),(7,'2024-10-05','Settima giornata'),(8,'2024-10-19','Ottava giornata'),(9,'2024-10-26','Nona giornata'),(10,'2024-11-02','Decima giornata'),(11,'2024-11-09','Undicesima giornata'),(12,'2024-11-23','Dodicesima giornata'),(13,'2024-11-30','Tredicesima giornata'),(14,'2024-12-07','Quattordicesima giornata'),(15,'2024-12-14','Quindicesima giornata'),(16,'2025-01-11','Sedicesima giornata'),(17,'2025-01-18','Diciassettesima giornata'),(18,'2025-01-25','Diciottesima giornata'),(19,'2025-02-01','Diciannovesima giornata'),(20,'2025-02-08','Ventesima giornata');
/*!40000 ALTER TABLE `giornate` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-17 16:34:34
