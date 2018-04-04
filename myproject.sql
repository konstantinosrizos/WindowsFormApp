CREATE DATABASE  IF NOT EXISTS `myproject` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `myproject`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: myproject
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.28-MariaDB

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `customerId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Fname` varchar(45) NOT NULL,
  `Lname` varchar(45) NOT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customerId`),
  KEY `inxLname` (`Lname`(6))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Argiris','Tetteris','6958740253','tetteris@hotmail.com'),(2,'Maria','Mpekatorou','2105547236','maria@iekdelta.gr'),(3,'Giannis','Kalogiannakis','6974102589','john@iekdelta.com'),(4,'Sofia','Panagiotopolou','6954102589','sofi@hotmail.com'),(5,'Anastasia','Mpexraki','6984102365','anasta@gmail.com'),(6,'Konstantinos','Trelis','6951023579','trelis@gmail.gr'),(7,'Yen','Meriwether','6974012593','yen1@yahoo.com'),(8,'Dalton','Kail','6941025879','dal28@hotmail.com'),(9,'Kori','Parton','6905483652','kori@gmail.com'),(10,'Fey','Thacker','6954820147','fey0@ibm.com');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emps`
--

DROP TABLE IF EXISTS `emps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emps` (
  `empId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Lname` varchar(45) NOT NULL,
  `Fname` varchar(45) NOT NULL,
  PRIMARY KEY (`empId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emps`
--

LOCK TABLES `emps` WRITE;
/*!40000 ALTER TABLE `emps` DISABLE KEYS */;
INSERT INTO `emps` VALUES (1,'Kaczmarski','Danille'),(2,'Frase','Kimber'),(3,'Weaver','Sabrina'),(4,'Heckert','Dreama');
/*!40000 ALTER TABLE `emps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rdetails`
--

DROP TABLE IF EXISTS `rdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rdetails` (
  `servId` int(10) unsigned NOT NULL,
  `empId` int(10) unsigned NOT NULL,
  `rdate` datetime NOT NULL,
  `notes` varchar(100) NOT NULL,
  PRIMARY KEY (`rdate`,`empId`,`servId`),
  KEY `fk_rdetails_emps_idx` (`empId`),
  KEY `fk_rdetails_services1_idx` (`servId`),
  CONSTRAINT `fk_rdetails_emps` FOREIGN KEY (`empId`) REFERENCES `emps` (`empId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rdetails_services1` FOREIGN KEY (`servId`) REFERENCES `services` (`servId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rdetails`
--

LOCK TABLES `rdetails` WRITE;
/*!40000 ALTER TABLE `rdetails` DISABLE KEYS */;
INSERT INTO `rdetails` VALUES (10,1,'2017-12-07 00:00:00',''),(6,4,'2017-12-16 00:00:00',''),(9,3,'2017-12-22 00:00:00',''),(5,3,'2018-01-20 00:00:00',''),(4,2,'2018-02-05 00:00:00',''),(7,4,'2018-02-20 00:00:00',''),(3,4,'2018-03-02 00:00:00',''),(8,2,'2018-03-09 00:00:00',''),(2,1,'2018-03-17 00:00:00',''),(1,2,'2018-03-23 00:00:00','');
/*!40000 ALTER TABLE `rdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `servId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customerId` int(11) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `indate` datetime DEFAULT NULL,
  `outdate` datetime DEFAULT NULL,
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`servId`),
  KEY `fk_services_customers1_idx` (`customerId`),
  CONSTRAINT `fk_services_customers1` FOREIGN KEY (`customerId`) REFERENCES `customers` (`customerId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,1,'Laptop','2018-03-17 00:00:00',NULL,NULL),(2,6,'Mobile','2018-03-10 00:00:00',NULL,NULL),(3,2,'Tablet','2018-02-20 00:00:00',NULL,NULL),(4,3,'PC-Tower','2018-01-28 00:00:00',NULL,NULL),(5,5,'Laptop','2018-01-03 00:00:00',NULL,NULL),(6,4,'Mobile','2017-12-10 00:00:00',NULL,NULL),(7,7,'PC-Tower','2018-02-15 00:00:00',NULL,NULL),(8,10,'Tablet','2018-03-03 00:00:00',NULL,NULL),(9,8,'Laptop','2017-12-17 00:00:00',NULL,NULL),(10,9,'Mobile','2017-11-22 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-28 14:15:29
