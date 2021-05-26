-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: table_settings
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `learning_records`
--

DROP TABLE IF EXISTS `learning_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `learning_records` (
  `Trip_Number` int NOT NULL AUTO_INCREMENT,
  `Trip_Result` int NOT NULL,
  `Travel_Time` time NOT NULL,
  PRIMARY KEY (`Trip_Number`),
  UNIQUE KEY `Trip_Number_UNIQUE` (`Trip_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_records`
--

LOCK TABLES `learning_records` WRITE;
/*!40000 ALTER TABLE `learning_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `learning_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `records`
--

DROP TABLE IF EXISTS `records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `records` (
  `Trip number` int NOT NULL,
  `Trip result` int NOT NULL,
  `Travel time` time NOT NULL,
  PRIMARY KEY (`Trip number`),
  UNIQUE KEY `Номер поездки_UNIQUE` (`Trip number`),
  KEY `Trip result_idx` (`Trip result`),
  CONSTRAINT `Trip result` FOREIGN KEY (`Trip result`) REFERENCES `results` (`ID_result`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records`
--

LOCK TABLES `records` WRITE;
/*!40000 ALTER TABLE `records` DISABLE KEYS */;
INSERT INTO `records` VALUES (1,1,'03:51:00'),(2,2,'01:21:00'),(3,2,'04:40:00');
/*!40000 ALTER TABLE `records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `results` (
  `ID_result` int NOT NULL,
  `Name_Result` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_result`),
  UNIQUE KEY `ID_result_UNIQUE` (`ID_result`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES (1,'Done'),(2,'Fail');
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `road`
--

DROP TABLE IF EXISTS `road`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `road` (
  `idRoad` int NOT NULL AUTO_INCREMENT,
  `Trip_Number` int NOT NULL,
  `Action_Number` int NOT NULL,
  `Object_Number` int NOT NULL,
  PRIMARY KEY (`idRoad`),
  UNIQUE KEY `idRoad_UNIQUE` (`idRoad`),
  KEY `Trip_Number_idx` (`Trip_Number`),
  KEY `Action_Number_idx` (`Action_Number`),
  KEY `Object_Number_idx` (`Object_Number`),
  CONSTRAINT `Action_Number` FOREIGN KEY (`Action_Number`) REFERENCES `run_record` (`Action number`),
  CONSTRAINT `Object_Number` FOREIGN KEY (`Object_Number`) REFERENCES `settings` (`Object number`),
  CONSTRAINT `Trip_Number` FOREIGN KEY (`Trip_Number`) REFERENCES `records` (`Trip number`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Совмещает в себе все таблицы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `road`
--

LOCK TABLES `road` WRITE;
/*!40000 ALTER TABLE `road` DISABLE KEYS */;
INSERT INTO `road` VALUES (1,1,1,1),(2,2,4,3),(3,3,3,2);
/*!40000 ALTER TABLE `road` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `run_record`
--

DROP TABLE IF EXISTS `run_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `run_record` (
  `Action number` int NOT NULL,
  `Transport action` varchar(10) NOT NULL,
  PRIMARY KEY (`Action number`),
  UNIQUE KEY `Номер действия_UNIQUE` (`Action number`),
  KEY `Transport Action_idx` (`Transport action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `run_record`
--

LOCK TABLES `run_record` WRITE;
/*!40000 ALTER TABLE `run_record` DISABLE KEYS */;
INSERT INTO `run_record` VALUES (1,'Running'),(4,'Stop'),(3,'Turn'),(2,'Waiting');
/*!40000 ALTER TABLE `run_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `Object number` int NOT NULL AUTO_INCREMENT,
  `Object type` varchar(15) DEFAULT NULL,
  `Object setting value` int DEFAULT NULL,
  PRIMARY KEY (`Object number`),
  UNIQUE KEY `Object number_UNIQUE` (`Object number`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'Transport',1),(2,'Transport',4),(3,'Transport',3);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-26 15:07:44
