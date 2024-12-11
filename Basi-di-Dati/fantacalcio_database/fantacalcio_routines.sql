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
-- Temporary view structure for view `somma_voti_giornata`
--

DROP TABLE IF EXISTS `somma_voti_giornata`;
/*!50001 DROP VIEW IF EXISTS `somma_voti_giornata`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `somma_voti_giornata` AS SELECT 
 1 AS `id`,
 1 AS `data`,
 1 AS `nome`,
 1 AS `fantallenatore_id`,
 1 AS `somma_voti_giornata`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `calciatori_quotazioni_decr`
--

DROP TABLE IF EXISTS `calciatori_quotazioni_decr`;
/*!50001 DROP VIEW IF EXISTS `calciatori_quotazioni_decr`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `calciatori_quotazioni_decr` AS SELECT 
 1 AS `calciatore_id`,
 1 AS `nome`,
 1 AS `cognome`,
 1 AS `ruolo`,
 1 AS `squadra`,
 1 AS `quotazione`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `classifica`
--

DROP TABLE IF EXISTS `classifica`;
/*!50001 DROP VIEW IF EXISTS `classifica`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `classifica` AS SELECT 
 1 AS `nome_squadra`,
 1 AS `punteggio_classifica`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `somma_voti_giornata`
--

/*!50001 DROP VIEW IF EXISTS `somma_voti_giornata`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `somma_voti_giornata` AS select `g`.`Id` AS `id`,`g`.`data` AS `data`,`g`.`nome` AS `nome`,`f`.`fantallenatore_id` AS `fantallenatore_id`,sum(`gc`.`voto`) AS `somma_voti_giornata` from ((`giornate` `g` join `formazioni_titolari` `f` on((`g`.`Id` = `f`.`giornata_id`))) join `giornate_calciatori` `gc` on((`f`.`calciatore_id` = `gc`.`calciatore_id`))) group by `g`.`Id`,`f`.`fantallenatore_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `calciatori_quotazioni_decr`
--

/*!50001 DROP VIEW IF EXISTS `calciatori_quotazioni_decr`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `calciatori_quotazioni_decr` AS select `calciatori`.`Id` AS `calciatore_id`,`calciatori`.`nome` AS `nome`,`calciatori`.`cognome` AS `cognome`,`calciatori`.`ruolo` AS `ruolo`,`calciatori`.`squadra` AS `squadra`,`calciatori`.`quotazione` AS `quotazione` from `calciatori` order by `calciatori`.`quotazione` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `classifica`
--

/*!50001 DROP VIEW IF EXISTS `classifica`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `classifica` AS select `fantallenatore`.`nome_squadra` AS `nome_squadra`,`fantallenatore`.`punteggio_classifica` AS `punteggio_classifica` from `fantallenatore` order by `fantallenatore`.`punteggio_classifica` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping routines for database 'fantacalcio'
--
/*!50003 DROP PROCEDURE IF EXISTS `AggiornaPunteggioClassifica` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AggiornaPunteggioClassifica`()
BEGIN
    DECLARE fine INT DEFAULT FALSE;
    DECLARE curr_id INT;
    DECLARE curr_sum DECIMAL(10,2);
    DECLARE cursore_fantallenatori CURSOR FOR 
        SELECT fantallenatore_id, SUM(somma_voti_giornata)
        FROM somma_voti_giornata
        GROUP BY fantallenatore_id;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fine = TRUE;

    OPEN cursore_fantallenatori;
    
    ciclo_lettura: LOOP
        FETCH cursore_fantallenatori INTO curr_id, curr_sum;
        IF fine THEN
            LEAVE ciclo_lettura;
        END IF;
        UPDATE Fantallenatore
        SET punteggio_classifica = curr_sum
        WHERE Id = curr_id;
    END LOOP;
    
    CLOSE cursore_fantallenatori;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AggiungiCalciatoreTitolare` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AggiungiCalciatoreTitolare`(
    IN p_fantallenatore_id INT,
    IN p_calciatore_id INT,
    IN p_giornata_id INT
)
BEGIN
    DECLARE v_count INT;
    
    -- Controlla se il calciatore appartiene al fantallenatore
    SELECT COUNT(*)
    INTO v_count
    FROM Calciatori
    WHERE id = p_calciatore_id
      AND fantallenatore_id = p_fantallenatore_id;
      
    IF v_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Il calciatore non appartiene al fantallenatore specificato.';
    END IF;
    
    -- Controlla se la giornata esiste
    SELECT COUNT(*)
    INTO v_count
    FROM Giornate
    WHERE id = p_giornata_id;
    
    IF v_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La giornata specificata non esiste.';
    END IF;
    
    -- Inserisce il calciatore nella formazione titolare
    INSERT INTO Formazioni_Titolari (giornata_id,fantallenatore_id, calciatore_id) VALUES (
     p_giornata_id,
    p_fantallenatore_id,
     p_calciatore_id);
    
    
   
    
    -- Informazione di successo
    SELECT 'Calciatore aggiunto alla formazione titolare con successo.' AS Messaggio;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AggiungiVotoCalciatore` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AggiungiVotoCalciatore`(
    IN p_giornata_id INT,
    IN p_calciatore_id INT,
    IN p_voto DECIMAL(4, 2)
)
BEGIN
    DECLARE v_count INT;
    
    -- Controlla se esiste già un voto per questo calciatore in questa giornata
    SELECT COUNT(*)
    INTO v_count
    FROM Giornate_Calciatori
    WHERE giornata_id = p_giornata_id
      AND calciatore_id = p_calciatore_id;
      
    -- Se il voto esiste, aggiorna il voto
    IF v_count > 0 THEN
        UPDATE Giornate_Calciatori
        SET voto = p_voto
        WHERE giornata_id = p_giornata_id
          AND calciatore_id = p_calciatore_id;
    ELSE
        -- Se il voto non esiste, inserisce un nuovo record
        INSERT INTO Giornate_Calciatori (giornata_id, calciatore_id, voto)
        VALUES (p_giornata_id, p_calciatore_id, p_voto);
    END IF;
    
    -- Informazione di successo
    SELECT 'Voto aggiunto/aggiornato con successo.' AS Messaggio;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Aggiungi_Calciatore_A_Fantallenatore` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Aggiungi_Calciatore_A_Fantallenatore`(
    IN p_calciatore_id INT,
    IN p_fantallenatore_id INT
)
BEGIN
    DECLARE v_calciatore_quotazione DECIMAL(10, 2);
    DECLARE v_fantallenatore_budget DECIMAL(10, 2);

    -- Verifica se il calciatore esiste e se è già assegnato a un altro fantallenatore
    SELECT quotazione INTO v_calciatore_quotazione
    FROM Calciatori
    WHERE Id = p_calciatore_id;

    IF v_calciatore_quotazione IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Calciatore non trovato';
    END IF;

    IF EXISTS (
        SELECT 1 FROM Calciatori
        WHERE Id = p_calciatore_id AND fantallenatore_id IS NOT NULL
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Il calciatore è già assegnato a un altro fantallenatore';
    END IF;

    -- Ottieni il budget attuale del fantallenatore
    SELECT budget INTO v_fantallenatore_budget
    FROM Fantallenatore
    WHERE Id = p_fantallenatore_id;

    -- Aggiorna il calciatore con il nuovo fantallenatore
    UPDATE Calciatori
    SET fantallenatore_id = p_fantallenatore_id
    WHERE Id = p_calciatore_id;

    -- Aggiorna il budget del fantallenatore decrementandolo della quotazione del calciatore
    UPDATE Fantallenatore
    SET budget = budget - v_calciatore_quotazione
    WHERE Id = p_fantallenatore_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-17 16:34:35
