CREATE DATABASE  IF NOT EXISTS `TrainDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `TrainDB`;
-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: squaddb.c5gyqa9jnozq.us-east-2.rds.amazonaws.com    Database: TrainDB
-- ------------------------------------------------------
-- Server version	8.0.17

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `Bookings`
--

DROP TABLE IF EXISTS `Bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bookings` (
  `bid` varchar(10) NOT NULL,
  `date` datetime DEFAULT NULL,
  `userName` varchar(20) DEFAULT NULL,
  `rid` varchar(10) NOT NULL,
  PRIMARY KEY (`bid`),
  KEY `userName_idx` (`userName`),
  KEY `rid_idx` (`rid`),
  CONSTRAINT `rid` FOREIGN KEY (`rid`) REFERENCES `Reservations` (`rid`),
  CONSTRAINT `userName` FOREIGN KEY (`userName`) REFERENCES `Customers` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bookings`
--

LOCK TABLES `Bookings` WRITE;
/*!40000 ALTER TABLE `Bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `Bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer_Reps`
--

DROP TABLE IF EXISTS `Customer_Reps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer_Reps` (
  `ssn` varchar(11) NOT NULL,
  PRIMARY KEY (`ssn`),
  UNIQUE KEY `ssn_UNIQUE` (`ssn`),
  CONSTRAINT `ssn` FOREIGN KEY (`ssn`) REFERENCES `Employees` (`ssn`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_Reps`
--

LOCK TABLES `Customer_Reps` WRITE;
/*!40000 ALTER TABLE `Customer_Reps` DISABLE KEYS */;
/*!40000 ALTER TABLE `Customer_Reps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customers` (
  `userName` varchar(45) NOT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zipcode` varchar(20) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES ('abc','LabelMissing?','Looks fine','qwertyuiop','122 New St.','New Brunswick','CA','91210','dwang4211@gmail.com',NULL),('abcabcabc','Test','l','qwertyuiop','1393 k blvd','newark','NJ','23845','asldkfj@f.com',NULL),('dwang','David','Wing','qwertyuiop','123 Address Ave.','Newark','NJ','32498','dwang11@gmail.com',NULL),('jd123','John','Doe','123','123 some where','some city','nj','09901','jd@gmail.com',NULL),('John','John','John','John','999 John St','John','NJ','93842','john@john.com',NULL),('jpj2246','John Paul','Jones','qwertyuiop','89 Fifth Ave','New yrok','New York','34829','jpj2246@yahoo.com',NULL),('maile','Mai','Le','123','123','Rockford','Illinois','61102','maile@gmail.com',NULL),('mdl','mai','le','123','123','123','123','123','email@gmail.com',NULL),('n','n','nn','qwertyuiop','908 n dr.','nnnn','NJ','12312','n@n.com',NULL),('natalia','Natalia','Bryzhatenko','123','someaddress','city','state','12245','email','phone'),('t2','Test','Two','qwertyuiop','29 Test Ave.','Test City','Test','02929','testemail@test.com',NULL),('zzzz','zzz','zzz','zzzz','234 zz blvd','zz','NJ','12345','zz@z.com',NULL);
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employees`
--

DROP TABLE IF EXISTS `Employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employees` (
  `ssn` varchar(11) NOT NULL,
  `FirstName` varchar(20) DEFAULT NULL,
  `LastName` varchar(20) DEFAULT NULL,
  `userName` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ssn`),
  UNIQUE KEY `userName_UNIQUE` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employees`
--

LOCK TABLES `Employees` WRITE;
/*!40000 ALTER TABLE `Employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `Employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Messages`
--

DROP TABLE IF EXISTS `Messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Messages` (
  `customer_name` varchar(20) NOT NULL,
  `text` varchar(45) DEFAULT NULL,
  `sentAt` datetime NOT NULL,
  PRIMARY KEY (`customer_name`,`sentAt`),
  CONSTRAINT `customer_name` FOREIGN KEY (`customer_name`) REFERENCES `Customers` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Messages`
--

LOCK TABLES `Messages` WRITE;
/*!40000 ALTER TABLE `Messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `Messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `rep_ssn` varchar(11) NOT NULL,
  `bid` varchar(10) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  PRIMARY KEY (`rep_ssn`,`bid`,`user_name`),
  KEY `bid_idx` (`bid`),
  KEY `userName_idx` (`user_name`),
  CONSTRAINT `bid` FOREIGN KEY (`bid`) REFERENCES `Bookings` (`bid`),
  CONSTRAINT `rep_ssn` FOREIGN KEY (`rep_ssn`) REFERENCES `Customer_Reps` (`ssn`),
  CONSTRAINT `user_name` FOREIGN KEY (`user_name`) REFERENCES `Bookings` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reservations`
--

DROP TABLE IF EXISTS `Reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reservations` (
  `rid` varchar(10) NOT NULL,
  `bookingFee` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `class` varchar(5) DEFAULT NULL,
  `travelTime` int(11) DEFAULT NULL,
  `totalFare` double DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `weekly_fare` int(11) DEFAULT NULL,
  `monthly_fare` int(11) DEFAULT NULL,
  `originStop_id` varchar(10) NOT NULL,
  `destinationStop_id` varchar(10) NOT NULL,
  `message` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`rid`),
  UNIQUE KEY `rid_UNIQUE` (`rid`),
  KEY `originStop_id_idx` (`originStop_id`),
  KEY `destinationStop_id_idx` (`destinationStop_id`),
  CONSTRAINT `destinationStop_id` FOREIGN KEY (`destinationStop_id`) REFERENCES `Stops` (`stop_id`),
  CONSTRAINT `originStop_id` FOREIGN KEY (`originStop_id`) REFERENCES `Stops` (`stop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reservations`
--

LOCK TABLES `Reservations` WRITE;
/*!40000 ALTER TABLE `Reservations` DISABLE KEYS */;
/*!40000 ALTER TABLE `Reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Site_Manager`
--

DROP TABLE IF EXISTS `Site_Manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Site_Manager` (
  `manager_ssn` varchar(11) NOT NULL,
  PRIMARY KEY (`manager_ssn`),
  UNIQUE KEY `ssn_UNIQUE` (`manager_ssn`),
  CONSTRAINT `manager_ssn` FOREIGN KEY (`manager_ssn`) REFERENCES `Employees` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Site_Manager`
--

LOCK TABLES `Site_Manager` WRITE;
/*!40000 ALTER TABLE `Site_Manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `Site_Manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Stations`
--

DROP TABLE IF EXISTS `Stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Stations` (
  `station_id` varchar(10) NOT NULL,
  `station_name` varchar(50) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`station_id`),
  UNIQUE KEY `station_id_UNIQUE` (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stations`
--

LOCK TABLES `Stations` WRITE;
/*!40000 ALTER TABLE `Stations` DISABLE KEYS */;
/*!40000 ALTER TABLE `Stations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Stops`
--

DROP TABLE IF EXISTS `Stops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Stops` (
  `stop_id` varchar(10) NOT NULL,
  `transit_line` varchar(50) NOT NULL,
  `station_id` varchar(10) DEFAULT NULL,
  `arrive_time` datetime DEFAULT NULL,
  `nextStop_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`stop_id`,`transit_line`),
  KEY `transit_line_idx` (`transit_line`),
  KEY `station_id_idx` (`station_id`),
  KEY `nextStop_id_idx` (`nextStop_id`),
  CONSTRAINT `nextStop_id` FOREIGN KEY (`nextStop_id`) REFERENCES `Stops` (`stop_id`),
  CONSTRAINT `station_id` FOREIGN KEY (`station_id`) REFERENCES `Stations` (`station_id`),
  CONSTRAINT `transit_line` FOREIGN KEY (`transit_line`) REFERENCES `Transit_Lines` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stops`
--

LOCK TABLES `Stops` WRITE;
/*!40000 ALTER TABLE `Stops` DISABLE KEYS */;
/*!40000 ALTER TABLE `Stops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Trains`
--

DROP TABLE IF EXISTS `Trains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Trains` (
  `t_id` int(11) NOT NULL,
  `num_cars` int(11) DEFAULT NULL,
  `num_seats` int(11) DEFAULT NULL,
  `transitLine_Name` varchar(50) NOT NULL,
  PRIMARY KEY (`t_id`),
  UNIQUE KEY `t_id_UNIQUE` (`t_id`),
  KEY `transitLine_Name_idx` (`transitLine_Name`),
  CONSTRAINT `transitLine_Name` FOREIGN KEY (`transitLine_Name`) REFERENCES `Transit_Lines` (`name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Trains`
--

LOCK TABLES `Trains` WRITE;
/*!40000 ALTER TABLE `Trains` DISABLE KEYS */;
/*!40000 ALTER TABLE `Trains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transit_Lines`
--

DROP TABLE IF EXISTS `Transit_Lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transit_Lines` (
  `name` varchar(50) NOT NULL,
  `origin_id` varchar(10) NOT NULL,
  `destination_id` varchar(10) NOT NULL,
  `managerSSN` varchar(11) NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `managerSSN_idx` (`managerSSN`),
  KEY `origin_id_idx` (`origin_id`),
  KEY `destination_id_idx` (`destination_id`),
  CONSTRAINT `destination_id` FOREIGN KEY (`destination_id`) REFERENCES `Stations` (`station_id`),
  CONSTRAINT `managerSSN` FOREIGN KEY (`managerSSN`) REFERENCES `Site_Manager` (`manager_ssn`),
  CONSTRAINT `origin_id` FOREIGN KEY (`origin_id`) REFERENCES `Stations` (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transit_Lines`
--

LOCK TABLES `Transit_Lines` WRITE;
/*!40000 ALTER TABLE `Transit_Lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `Transit_Lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manages`
--

DROP TABLE IF EXISTS `manages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manages` (
  `employee_ssn` varchar(11) NOT NULL,
  `reservation_id` varchar(10) NOT NULL,
  PRIMARY KEY (`employee_ssn`,`reservation_id`),
  KEY `rid_idx` (`reservation_id`),
  CONSTRAINT `employee_ssn` FOREIGN KEY (`employee_ssn`) REFERENCES `Employees` (`ssn`),
  CONSTRAINT `reservation_id` FOREIGN KEY (`reservation_id`) REFERENCES `Reservations` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manages`
--

LOCK TABLES `manages` WRITE;
/*!40000 ALTER TABLE `manages` DISABLE KEYS */;
/*!40000 ALTER TABLE `manages` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-23 18:50:22
