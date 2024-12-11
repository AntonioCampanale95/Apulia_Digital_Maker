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
-- Table structure for table `calciatori`
--

DROP TABLE IF EXISTS `calciatori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calciatori` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cognome` varchar(255) NOT NULL,
  `ruolo` varchar(50) NOT NULL,
  `squadra` varchar(255) NOT NULL,
  `quotazione` decimal(10,2) NOT NULL,
  `fantallenatore_id` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fantallenatore_id` (`fantallenatore_id`),
  CONSTRAINT `calciatori_ibfk_1` FOREIGN KEY (`fantallenatore_id`) REFERENCES `fantallenatore` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calciatori`
--

LOCK TABLES `calciatori` WRITE;
/*!40000 ALTER TABLE `calciatori` DISABLE KEYS */;
INSERT INTO `calciatori` VALUES (1,'Cristiano','Ronaldo','Attaccante','Juventus',50.00,1),(2,'Lorenzo','Insigne','Centrocampista','Napoli',40.00,2),(3,'Romelu','Lukaku','Attaccante','Inter',45.00,1),(4,'Dusan','Vlahovic','Attaccante','Fiorentina',30.00,1),(5,'Lautaro','Martínez','Attaccante','Inter',42.00,1),(6,'Nicolo','Barella','Centrocampista','Inter',38.00,1),(7,'Gianluigi','Donnarumma','Portiere','Paris Saint-Germain',35.00,1),(8,'Giorgio','Chiellini','Difensore','Juventus',25.00,1),(9,'Sergej','Milinkovic-Savic','Centrocampista','Lazio',32.00,1),(10,'Luis','Muriel','Attaccante','Atalanta',28.00,1),(11,'Leonardo','Bonucci','Difensore','Juventus',30.00,1),(12,'Josip','Ilicic','Attaccante','Atalanta',26.00,1),(13,'Domenico','Berardi','Attaccante','Sassuolo',24.00,1),(14,'Stefan','De Vrij','Difensore','Inter',28.00,1),(15,'Hakan','Calhanoglu','Centrocampista','Inter',32.00,1),(16,'Gianluigi','Buffon','Portiere','Parma',20.00,1),(17,'Marcelo','Brozovic','Centrocampista','Inter',30.00,1),(18,'Federico','Chiesa','Attaccante','Juventus',36.00,1),(19,'Luis','Alberto','Centrocampista','Lazio',28.00,1),(20,'Nikola','Milenkovic','Difensore','Fiorentina',22.00,1),(21,'Harry','Kane','Attaccante','Tottenham',55.00,1),(22,'Kevin','De Bruyne','Centrocampista','Manchester City',60.00,1),(23,'Mohamed','Salah','Attaccante','Liverpool',58.00,1),(24,'Bruno','Fernandes','Centrocampista','Manchester United',52.00,1),(25,'Jack','Grealish','Centrocampista','Manchester City',50.00,1),(26,'Raheem','Sterling','Attaccante','Manchester City',48.00,2),(27,'Virgil','van Dijk','Difensore','Liverpool',45.00,2),(28,'Trent','Alexander-Arnold','Difensore','Liverpool',42.00,2),(29,'Son','Heung-min','Attaccante','Tottenham',53.00,2),(30,'Jamie','Vardy','Attaccante','Leicester City',40.00,2),(31,'Marcus','Rashford','Attaccante','Manchester United',48.00,2),(32,'Paul','Pogba','Centrocampista','Manchester United',55.00,2),(33,'Riyad','Mahrez','Attaccante','Manchester City',50.00,2),(34,'Andrew','Robertson','Difensore','Liverpool',38.00,2),(35,'Ederson','Moraes','Portiere','Manchester City',30.00,2),(36,'Harry','Maguire','Difensore','Manchester United',40.00,2),(37,'Sadio','Mané','Attaccante','Liverpool',56.00,2),(38,'N Golo','Kanté','Centrocampista','Chelsea',58.00,2),(39,'Ben','Chilwell','Difensore','Chelsea',35.00,2),(40,'Wilfred','Ndidi','Centrocampista','Leicester City',32.00,2),(41,'Lionel','Messi','Centrocampista','Paris Saint-Germain',70.00,2),(42,'Karim','Benzema','Attaccante','Real Madrid',65.00,2),(43,'João','Félix','Attaccante','Atletico Madrid',48.00,2),(44,'Luis','Suárez','Attaccante','Atletico Madrid',45.00,2),(45,'Jordi','Alba','Difensore','Barcelona',38.00,2),(46,'Casemiro','Peppino','Centrocampista','Real Madrid',40.00,2),(47,'Marc-André','ter Stegen','Portiere','Barcelona',50.00,2),(48,'Gerard','Piqué','Difensore','Barcelona',32.00,2),(49,'Sergio','Ramos','Difensore','Paris Saint-Germain',35.00,2),(50,'Ansu','Fati','Attaccante','Barcelona',42.00,NULL),(51,'Frenkie','de Jong','Centrocampista','Barcelona',45.00,NULL),(52,'Vinícius','Júnior','Attaccante','Real Madrid',48.00,NULL),(53,'Thibaut','Courtois','Portiere','Real Madrid',40.00,NULL),(54,'Marco','Asensio','Attaccante','Real Madrid',38.00,NULL),(55,'Antoine','Griezmann','Attaccante','Atletico Madrid',50.00,NULL),(56,'Dani','Carvajal','Difensore','Real Madrid',30.00,NULL),(57,'Sergio','Busquets','Centrocampista','Barcelona',42.00,NULL),(58,'Jordi','Alba','Difensore','Barcelona',36.00,NULL),(59,'Toni','Kroos','Centrocampista','Real Madrid',55.00,NULL),(60,'Yannick','Carrasco','Centrocampista','Atletico Madrid',32.00,NULL),(61,'Erling','Haaland','Attaccante','Borussia Dortmund',52.00,NULL),(62,'Robert','Lewandowski','Attaccante','Bayern Monaco',68.00,NULL),(63,'Jadon','Sancho','Centrocampista','Borussia Dortmund',42.00,NULL),(64,'Thomas','Müller','Centrocampista','Bayern Monaco',50.00,NULL),(65,'Joshua','Kimmich','Centrocampista','Bayern Monaco',60.00,NULL),(66,'Manuel','Neuer','Portiere','Bayern Monaco',45.00,NULL),(67,'Matthijs','de Ligt','Difensore','Bayern Monaco',40.00,NULL),(68,'Erling','Haaland','Attaccante','Borussia Dortmund',55.00,NULL),(69,'Serge','Gnabry','Attaccante','Bayern Monaco',48.00,NULL),(70,'Dayot','Upamecano','Difensore','Bayern Monaco',38.00,NULL),(71,'Marcel','Sabitzer','Centrocampista','Bayern Monaco',35.00,NULL),(72,'Thorgan','Hazard','Attaccante','Borussia Dortmund',40.00,NULL),(73,'Leroy','Sané','Attaccante','Bayern Monaco',56.00,NULL),(74,'Giovanni','Reyna','Centrocampista','Borussia Dortmund',32.00,NULL),(75,'Axel','Witsel','Centrocampista','Borussia Dortmund',30.00,NULL),(76,'Lucas','Hernández','Difensore','Bayern Monaco',28.00,NULL),(77,'Marco','Reus','Attaccante','Borussia Dortmund',48.00,NULL),(78,'Jérôme','Boateng','Difensore','Bayern Monaco',25.00,NULL),(79,'Julian','Brandt','Centrocampista','Borussia Dortmund',38.00,NULL),(80,'Mats','Hummels','Difensore','Borussia Dortmund',32.00,NULL),(81,'Kylian','Mbappé','Attaccante','Paris Saint-Germain',72.00,NULL),(82,'Neymar','Jr','Centrocampista','Paris Saint-Germain',65.00,NULL),(83,'Memphis','Depay','Attaccante','Lione',35.00,NULL),(84,'Angel','Di Maria','Centrocampista','Paris Saint-Germain',45.00,NULL),(85,'Wissam','Ben Yedder','Attaccante','Monaco',42.00,NULL),(86,'Mauro','Icardi','Attaccante','Paris Saint-Germain',38.00,NULL),(87,'Keylor','Navas','Portiere','Paris Saint-Germain',30.00,NULL),(88,'Marco','Verratti','Centrocampista','Paris Saint-Germain',50.00,NULL),(89,'Eduardo','Camavinga','Centrocampista','Rennes',28.00,NULL),(90,'Jonathan','David','Attaccante','Lille',32.00,NULL),(91,'Renato','Sanches','Centrocampista','Lille',26.00,NULL),(92,'Thiago','Silva','Difensore','Paris Saint-Germain',38.00,NULL),(93,'Presnel','Kimpembe','Difensore','Paris Saint-Germain',32.00,NULL),(94,'Houssem','Aouar','Centrocampista','Lione',36.00,NULL),(95,'Lucas','Paquetá','Centrocampista','Lione',30.00,NULL),(96,'Burak','Yilmaz','Attaccante','Lille',40.00,NULL),(97,'Andy','Delort','Attaccante','Nizza',24.00,NULL),(98,'Jonathan','Ikone','Centrocampista','Lille',28.00,NULL),(99,'José','Fonte','Difensore','Lille',22.00,NULL),(100,'Jonathan','Bamba','Attaccante','Lilla',26.00,NULL);
/*!40000 ALTER TABLE `calciatori` ENABLE KEYS */;
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
