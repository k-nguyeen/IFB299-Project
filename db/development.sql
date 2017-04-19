-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: david_database
-- ------------------------------------------------------
-- Server version	5.7.13-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookings` (
  `bookingID` int(11) NOT NULL AUTO_INCREMENT,
  `propertyID` int(11) NOT NULL,
  `startTime` time NOT NULL,
  `tenantID` int(11) DEFAULT NULL,
  `propertyGuide` int(11) NOT NULL,
  PRIMARY KEY (`bookingID`),
  KEY `tenantID` (`tenantID`),
  KEY `propertyGuide` (`propertyGuide`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`tenantID`) REFERENCES `tenant` (`tenantID`),
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`propertyGuide`) REFERENCES `employee` (`employeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `employeeID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `streetApartmentNo` varchar(255) NOT NULL,
  `suburb` varchar(255) NOT NULL,
  `postcode` int(4) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `phoneNumber` char(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `dateOfBirth` date NOT NULL,
  PRIMARY KEY (`employeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owner` (
  `ownerID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `streetApartmentNo` varchar(255) NOT NULL,
  `suburb` varchar(255) NOT NULL,
  `postcode` int(4) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `phoneNumber` char(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `dateOfBirth` date NOT NULL,
  PRIMARY KEY (`ownerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `property` (
  `propertyID` int(11) NOT NULL AUTO_INCREMENT,
  `street` varchar(255) NOT NULL,
  `streetApartmentNo` varchar(255) NOT NULL,
  `suburb` varchar(255) NOT NULL,
  `postcode` int(4) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `propertyType` varchar(255) DEFAULT NULL,
  `rent` int(11) DEFAULT NULL,
  `furbished` tinyint(1) DEFAULT NULL,
  `managerID` int(11) NOT NULL,
  PRIMARY KEY (`propertyID`),
  KEY `managerID` (`managerID`),
  CONSTRAINT `property_ibfk_1` FOREIGN KEY (`managerID`) REFERENCES `employee` (`employeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property`
--

LOCK TABLES `property` WRITE;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
/*!40000 ALTER TABLE `property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propertyowned`
--

DROP TABLE IF EXISTS `propertyowned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propertyowned` (
  `ownerID` int(11) NOT NULL,
  `propertyID` int(11) NOT NULL,
  PRIMARY KEY (`ownerID`,`propertyID`),
  KEY `propertyID` (`propertyID`),
  CONSTRAINT `propertyowned_ibfk_1` FOREIGN KEY (`ownerID`) REFERENCES `owner` (`ownerID`),
  CONSTRAINT `propertyowned_ibfk_2` FOREIGN KEY (`propertyID`) REFERENCES `property` (`propertyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propertyowned`
--

LOCK TABLES `propertyowned` WRITE;
/*!40000 ALTER TABLE `propertyowned` DISABLE KEYS */;
/*!40000 ALTER TABLE `propertyowned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propertyrented`
--

DROP TABLE IF EXISTS `propertyrented`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propertyrented` (
  `tenantID` int(11) NOT NULL,
  `propertyID` int(11) NOT NULL,
  PRIMARY KEY (`tenantID`,`propertyID`),
  KEY `propertyID` (`propertyID`),
  CONSTRAINT `propertyrented_ibfk_1` FOREIGN KEY (`tenantID`) REFERENCES `tenant` (`tenantID`),
  CONSTRAINT `propertyrented_ibfk_2` FOREIGN KEY (`propertyID`) REFERENCES `property` (`propertyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propertyrented`
--

LOCK TABLES `propertyrented` WRITE;
/*!40000 ALTER TABLE `propertyrented` DISABLE KEYS */;
/*!40000 ALTER TABLE `propertyrented` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant`
--

DROP TABLE IF EXISTS `tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenant` (
  `tenantID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `phoneNumber` char(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `dateOfBirth` date NOT NULL,
  PRIMARY KEY (`tenantID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant`
--

LOCK TABLES `tenant` WRITE;
/*!40000 ALTER TABLE `tenant` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-19 11:07:30
