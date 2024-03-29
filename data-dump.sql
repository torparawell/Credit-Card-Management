-- MySQL dump 10.13  Distrib 8.0.32, for macos13.0 (arm64)
--
-- Host: localhost    Database: creditapp
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Budgets`
--

DROP TABLE IF EXISTS `Budgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Budgets` (
  `budget_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `budget_period` year DEFAULT NULL,
  `budget_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`budget_id`),
  UNIQUE KEY `user_id` (`user_id`,`category_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `budgets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`),
  CONSTRAINT `budgets_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `Categories` (`categories_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Budgets`
--

LOCK TABLES `Budgets` WRITE;
/*!40000 ALTER TABLE `Budgets` DISABLE KEYS */;
INSERT INTO `Budgets` VALUES (1,1,1,'2023-04-01 07:00:00','2023-05-01 06:59:59',2023,500.00),(2,1,2,'2023-04-01 07:00:00','2023-05-01 06:59:59',2023,200.00),(3,2,1,'2023-04-01 07:00:00','2023-05-01 06:59:59',2023,600.00),(4,3,3,'2023-04-01 07:00:00','2023-05-01 06:59:59',2023,100.00),(5,4,4,'2023-04-01 07:00:00','2023-05-01 06:59:59',2023,300.00),(6,2,3,'2020-03-30 07:00:00','2021-03-30 07:00:00',2021,700.00),(7,2,4,'2021-03-30 07:00:00','2022-03-30 07:00:00',2021,300.00);
/*!40000 ALTER TABLE `Budgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categories`
--

DROP TABLE IF EXISTS `Categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categories` (
  `categories_id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(20) DEFAULT NULL,
  `description` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`categories_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categories`
--

LOCK TABLES `Categories` WRITE;
/*!40000 ALTER TABLE `Categories` DISABLE KEYS */;
INSERT INTO `Categories` VALUES (1,'Restaurant','Expenses for dining out at food establishments'),(2,'Other','Expenses that do not fit into any other specific category'),(3,'Transportation','Expenses related to transport'),(4,'Merchandise Supplies','Expenses for purchasing goods and supplies'),(5,'Business Services','Expenses for services provided by businesses'),(6,'Fees & Adjustments','Expenses related to fees'),(7,'','Expenses that have not been assigned a specific category'),(8,'Entertainment','Expenses for leisure activities'),(9,'Merchandise & Suppli',NULL);
/*!40000 ALTER TABLE `Categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Credit_Cards`
--

DROP TABLE IF EXISTS `Credit_Cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Credit_Cards` (
  `card_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `card_provider` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`card_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `credit_cards_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Credit_Cards`
--

LOCK TABLES `Credit_Cards` WRITE;
/*!40000 ALTER TABLE `Credit_Cards` DISABLE KEYS */;
INSERT INTO `Credit_Cards` VALUES (1,1,'Visa'),(2,2,'Mastercard'),(3,3,'American Express'),(4,4,'Discover'),(5,2,'FinanceExpress');
/*!40000 ALTER TABLE `Credit_Cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transactions`
--

DROP TABLE IF EXISTS `Transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transactions` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `card_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `merchant` varchar(200) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `card_id` (`card_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`card_id`) REFERENCES `Credit_Cards` (`card_id`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transactions`
--

LOCK TABLES `Transactions` WRITE;
/*!40000 ALTER TABLE `Transactions` DISABLE KEYS */;
INSERT INTO `Transactions` VALUES (1,3,2,95.11,'ORANGE CURRY ORANGE',1,'2023-04-24 07:00:00'),(2,3,2,14.44,'THE TACOORANGE',2,'2023-04-24 07:00:00'),(3,3,2,77.70,'CIRRUS DESIGN CORPOR',3,'2023-04-24 07:00:00'),(4,3,2,88.23,'STARBUCKS STORE 0667',1,'2023-04-24 07:00:00'),(5,3,2,3.43,'LEUCADIA PIZZA RESTA',1,'2023-04-23 07:00:00'),(6,3,2,41.47,'RAULS SHENCINITAS',1,'2023-04-22 07:00:00'),(7,3,2,68.55,'IN N OUT BURGORANGE',1,'2023-04-21 07:00:00'),(8,3,2,9.17,'MAJOR MARKET ESCONDI',9,'2023-04-21 07:00:00'),(9,3,2,27.62,'CORTINA S ORAORANGE',1,'2023-04-20 07:00:00'),(10,3,2,28.01,'TOWN AND COUNTRY HAN',5,'2023-04-19 07:00:00'),(11,3,2,96.46,'CVS PHARMACY ORANGE',9,'2023-04-18 07:00:00'),(12,3,2,36.46,'SGT. PEPPERONNewport',1,'2023-04-18 07:00:00'),(13,3,2,84.27,'THE TACOORANGE',2,'2023-04-18 07:00:00'),(14,3,2,73.56,'CHAPMANS AGORORANGE',9,'2023-04-17 07:00:00'),(15,3,2,75.92,'EINSTEIN BAGEORANGE',5,'2023-04-17 07:00:00'),(16,3,2,25.39,'CORNER CAFE SNewport',2,'2023-04-16 07:00:00'),(17,3,2,38.17,'WHOLEFDS NPT NEWPORT',9,'2023-04-15 07:00:00'),(18,3,2,87.41,'BOIL BAKCOSTA MESA',1,'2023-04-14 07:00:00'),(19,3,2,7.27,'CU CYBER CAFEORANGE',5,'2023-04-12 07:00:00'),(20,3,2,48.19,'MOTHERS MARKESANTA A',9,'2023-04-12 07:00:00'),(21,3,2,6.69,'TARGET ORANGE',9,'2023-04-12 07:00:00'),(22,3,2,64.52,'TRADER JOE S ORANGE',9,'2023-04-12 07:00:00'),(23,3,2,84.25,'Interest Charge on P',6,'2023-04-12 07:00:00'),(24,3,2,49.73,'CHICK-FIL-A #ORANGE',1,'2023-04-11 07:00:00'),(25,3,2,34.80,'EINSTEIN BAGEORANGE',5,'2023-04-11 07:00:00'),(26,3,2,64.93,'SUPERCUTS S MORANGE',5,'2023-04-11 07:00:00'),(27,3,2,54.31,'THAI TOWNE EAORANGE',1,'2023-04-11 07:00:00'),(28,3,2,30.32,'BLUE BOWL - OOrange',1,'2023-04-10 07:00:00'),(29,3,2,24.98,'THE TACOORANGE',2,'2023-04-10 07:00:00'),(30,3,2,6.00,'SPOTIFY USA NEW YORK',9,'2023-04-10 07:00:00'),(31,3,2,11.61,'MENDOCINO FARCOSTA M',1,'2023-04-09 07:00:00'),(32,3,2,0.61,'STARBUCKS STOORANGE',1,'2023-04-09 07:00:00'),(33,3,2,22.95,'ASADA TALAGUNA BEACH',1,'2023-04-08 07:00:00'),(34,3,2,10.56,'CUSTOMER SERVICE PAY',7,'2023-04-08 07:00:00'),(35,3,2,8.00,'HABIT CITY PLSANTA A',1,'2023-04-07 07:00:00'),(36,3,2,55.88,'SGT. PEPPERONNewport',1,'2023-04-07 07:00:00'),(37,3,2,93.69,'ORANGE COUNTY FLIGHT',3,'2023-04-07 07:00:00'),(38,3,2,43.30,'AFTERS ICE CROrange',1,'2023-04-06 07:00:00'),(39,3,2,26.38,'CHAPMANS AGORORANGE',9,'2023-04-06 07:00:00'),(40,3,2,17.80,'ONLINE PAYMENT - THA',7,'2023-04-06 07:00:00'),(41,3,2,80.65,'RETURNED CHECK/DECLI',6,'2023-04-06 07:00:00'),(42,3,2,10.17,'THE TACOORANGE',2,'2023-04-05 07:00:00'),(43,3,2,45.97,'NGUYEN\'S KITCORANGE',1,'2023-04-04 07:00:00'),(44,3,2,16.95,'THE TACOORANGE',2,'2023-04-04 07:00:00'),(45,3,2,50.15,'UBER',3,'2023-04-04 07:00:00'),(46,3,2,24.46,'CHICK-FIL-A #ORANGE',1,'2023-04-03 07:00:00'),(47,3,2,92.32,'SGT. PEPPERONNewport',1,'2023-04-03 07:00:00'),(48,3,2,5.21,'CAMELOT GOLFLAND ANA',8,'2023-04-03 07:00:00'),(49,3,2,71.92,'RAISING CANESORANGE',1,'2023-04-02 07:00:00'),(50,3,2,4.78,'UBER',3,'2023-04-02 07:00:00'),(51,3,2,26.54,'ALBERTSONS #3ORANGE',9,'2023-04-01 07:00:00'),(52,3,2,32.40,'UBER',3,'2023-04-01 07:00:00'),(53,3,2,91.07,'BUY RANCH DIRECT 641',9,'2023-04-01 07:00:00'),(54,3,2,11.28,'ROSEWOOD FARMS Santa',9,'2023-04-01 07:00:00'),(55,3,2,79.25,'SP VUORI CLOTHING EN',9,'2023-04-01 07:00:00'),(56,3,2,83.08,'IN N OUT BURGORANGE',1,'2023-03-31 07:00:00'),(57,3,2,74.89,'THE TACOORANGE',2,'2023-03-31 07:00:00'),(58,3,2,55.03,'FELIX 300589172VENIC',1,'2023-03-31 07:00:00'),(59,3,2,26.08,'CRUMBL* ORANGLINDON',9,'2023-03-29 07:00:00'),(60,3,2,89.70,'EINSTEIN BAGEORANGE',5,'2023-03-29 07:00:00'),(61,3,2,84.09,'TRADER JOE S ORANGE',9,'2023-03-29 07:00:00'),(62,3,2,84.37,'BEAR FLANEWPORT BEAC',1,'2023-03-27 07:00:00'),(63,3,2,43.09,'CVS PHARMACY ORANGE',9,'2023-03-26 07:00:00'),(64,3,2,78.14,'ORANGE COUNTYSANTA A',3,'2023-03-26 07:00:00'),(65,3,2,90.94,'THE TACOORANGE',2,'2023-03-26 07:00:00'),(66,3,2,68.55,'TRADER JOE\'S IRVINE',9,'2023-03-25 07:00:00'),(67,3,2,99.57,'GELATO 101 Encinitas',1,'2023-03-24 07:00:00'),(68,3,2,22.34,'TARGET ESCONDIDO',9,'2023-03-24 07:00:00'),(69,3,2,94.73,'RYAN BROSAN MARCOS',2,'2023-03-24 07:00:00'),(70,3,2,82.56,'BETTER BENCINITAS',1,'2023-03-23 07:00:00'),(71,3,2,98.86,'TOWNIE BPALM SPRINGS',2,'2023-03-23 07:00:00'),(72,3,2,10.62,'NONNA 0000 SAN DIEGO',1,'2023-03-23 07:00:00'),(73,3,2,86.68,'THE REAL ITALPALM SP',2,'2023-03-22 07:00:00'),(74,3,2,29.15,'JUANITA\'S TACO SHOP',1,'2023-03-22 07:00:00'),(75,3,2,50.47,'GREAT SHAKES PalmSpr',1,'2023-03-21 07:00:00'),(76,3,2,67.99,'O\'REILLY AUTOPALM SP',3,'2023-03-21 07:00:00'),(77,3,2,38.97,'TAC/QUILA PALM SPRIN',1,'2023-03-21 07:00:00'),(78,3,2,22.98,'CHEVRON 02075NORTH P',3,'2023-03-20 07:00:00'),(79,3,2,62.96,'GLF*NORMANGOLLA QUIN',8,'2023-03-20 07:00:00'),(80,3,2,30.65,'SP JUST FABULPALM SP',9,'2023-03-19 07:00:00'),(81,3,2,56.12,'THE REAL ITALPALM SP',2,'2023-03-19 07:00:00'),(82,3,2,27.95,'GIRL SCOUTS Menifee',9,'2023-03-18 07:00:00'),(83,3,2,78.95,'10058 CAVA COCOSTA M',1,'2023-03-17 07:00:00'),(84,3,2,22.52,'BROT COFFEE Orange',1,'2023-03-17 07:00:00'),(85,3,2,83.16,'GREEN TOORANGE',1,'2023-03-17 07:00:00'),(86,3,2,25.70,'PANDOR BAKERYORANGE',9,'2023-03-16 07:00:00'),(87,3,2,25.20,'CRUMBL* ORANGE LINDO',9,'2023-03-16 07:00:00'),(88,3,2,23.19,'THE TACOORANGE',2,'2023-03-15 07:00:00'),(89,3,2,34.83,'NGUYEN\'S KITCORANGE',1,'2023-03-14 07:00:00'),(90,3,2,22.93,'THE TACOORANGE',2,'2023-03-14 07:00:00'),(91,3,2,13.16,'DOLLYS DONUT 4368455',1,'2023-03-14 07:00:00'),(92,3,2,59.74,'BLUE BOWL - OOrange',1,'2023-03-13 07:00:00'),(93,3,2,6.97,'MEMBERSHIP FEE',6,'2023-03-13 07:00:00'),(94,3,2,62.37,'THAI TOWNE EATERY OR',1,'2023-03-13 07:00:00'),(95,3,2,91.79,'THE TACOORANGE',2,'2023-03-12 08:00:00'),(96,3,2,62.91,'CHIPOTLE SANTA ANA',1,'2023-03-11 08:00:00'),(97,3,2,15.42,'SESSIONS FASHNewport',1,'2023-03-11 08:00:00'),(98,3,2,20.65,'LAUREL HARDWARE WEST',1,'2023-03-11 08:00:00'),(99,3,2,34.11,'THE TACOORANGE',2,'2023-03-10 08:00:00'),(100,3,2,79.59,'GLF*TUSTINRANCHGOLFC',8,'2023-03-10 08:00:00'),(101,3,2,25.60,'GLF*TUSTINRANCHGOLFC',8,'2023-03-10 08:00:00'),(102,3,2,97.51,'HOOVE\'S LIQUOR 0242',9,'2023-03-10 08:00:00'),(103,3,2,49.27,'KONA CLEANERS 7 1089',5,'2023-03-10 08:00:00'),(104,3,2,30.99,'SPOTIFY USA NEW YORK',9,'2023-03-10 08:00:00'),(105,3,2,39.76,'NORDSTROM IRVINE',9,'2023-03-09 08:00:00'),(106,3,2,80.79,'THE COPPER DOOR SANT',1,'2023-03-09 08:00:00'),(107,3,2,13.09,'IN N OUT BURGORANGE',1,'2023-03-08 08:00:00'),(108,3,2,75.61,'TARGET ORANGE',9,'2023-03-08 08:00:00'),(109,3,2,41.97,'GREEN TOORANGE',1,'2023-03-08 08:00:00'),(110,3,2,71.52,'CHICK-FIL-A #04003 0',1,'2023-03-07 08:00:00'),(111,3,2,61.26,'ASADA TACOS & BLAGUN',1,'2023-03-07 08:00:00'),(112,3,2,71.87,'NGUYEN\'S KITCORANGE',1,'2023-03-06 08:00:00'),(113,3,2,70.97,'CANTALOUPE 2 MALVERN',9,'2023-03-05 08:00:00'),(114,3,2,61.67,'DONUT HUB ORANGE',9,'2023-03-05 08:00:00'),(115,3,2,92.52,'BEAR FLANEWPORT BEAC',1,'2023-03-05 08:00:00'),(116,3,2,49.13,'C EST SI BON NEWPORT',1,'2023-03-04 08:00:00'),(117,3,2,27.22,'SGT. PEPPERONNewport',1,'2023-03-04 08:00:00'),(118,3,2,70.19,'WHOLE FOODS MTUSTIN',9,'2023-03-04 08:00:00'),(119,3,2,89.43,'IN N OUT BURGMISSION',1,'2023-03-03 08:00:00'),(120,3,2,48.45,'ORANGE COUNTYSANTA A',3,'2023-03-03 08:00:00'),(121,3,2,69.88,'CHRISTOPHERTODDSTUIN',5,'2023-03-02 08:00:00'),(122,3,2,59.36,'CHAPMANS AGORORANGE',9,'2023-03-01 08:00:00'),(123,3,2,60.55,'EINSTEIN BAGEORANGE',5,'2023-03-01 08:00:00'),(124,3,2,96.10,'TRADER JOE S ORANGE',9,'2023-02-28 08:00:00');
/*!40000 ALTER TABLE `Transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'John','Doe','john.doe@example.com'),(2,'Jane','Smith','jane.smith@example.com'),(3,'Michael','Brown','michael.brown@example.com'),(4,'Emily','Johnson','emily.johnson@example.com'),(5,NULL,NULL,'torparawell@gmail.com'),(6,'Ivan','Kurkin','ivankurkin@gmail.com');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-01 12:11:02
