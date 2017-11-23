CREATE DATABASE  IF NOT EXISTS `askwheels_updated` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `askwheels_updated`;
-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: 52.163.123.122    Database: askwheels_updated
-- ------------------------------------------------------
-- Server version	5.7.20

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
-- Table structure for table `db_bids`
--

DROP TABLE IF EXISTS `db_bids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_bids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `amount` double DEFAULT '0',
  `biddingStatus` int(11) DEFAULT '1',
  `dateCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `dateModified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_bids`
--

LOCK TABLES `db_bids` WRITE;
/*!40000 ALTER TABLE `db_bids` DISABLE KEYS */;
INSERT INTO `db_bids` VALUES (1,17,37,10000,2,'2017-11-23 12:06:06','2017-11-23 12:06:19'),(2,17,37,10000,2,'2017-11-23 12:06:19','2017-11-23 12:17:53'),(3,18,37,10000,1,'2017-11-23 12:07:06','2017-11-23 12:07:06'),(4,17,37,1500000,2,'2017-11-23 12:17:53','2017-11-23 12:18:16'),(5,17,37,1500000,2,'2017-11-23 12:18:16','2017-11-23 12:18:57'),(6,17,37,1500001,1,'2017-11-23 12:18:57','2017-11-23 12:18:57');
/*!40000 ALTER TABLE `db_bids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_dealer_wishlist`
--

DROP TABLE IF EXISTS `db_dealer_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_dealer_wishlist` (
  `dealerId` int(11) NOT NULL,
  `vehicleId` int(11) NOT NULL,
  KEY `dealerId` (`dealerId`),
  KEY `vehicleId` (`vehicleId`),
  CONSTRAINT `db_dealer_wishlist_ibfk_1` FOREIGN KEY (`dealerId`) REFERENCES `db_users` (`id`),
  CONSTRAINT `db_dealer_wishlist_ibfk_2` FOREIGN KEY (`vehicleId`) REFERENCES `db_vehicle_old` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_dealer_wishlist`
--

LOCK TABLES `db_dealer_wishlist` WRITE;
/*!40000 ALTER TABLE `db_dealer_wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_dealer_wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_user_in_roles`
--

DROP TABLE IF EXISTS `db_user_in_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_user_in_roles` (
  `roleId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  KEY `roleId` (`roleId`),
  KEY `userId` (`userId`),
  CONSTRAINT `db_user_in_roles_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `db_user_roles` (`id`),
  CONSTRAINT `db_user_in_roles_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `db_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_user_in_roles`
--

LOCK TABLES `db_user_in_roles` WRITE;
/*!40000 ALTER TABLE `db_user_in_roles` DISABLE KEYS */;
INSERT INTO `db_user_in_roles` VALUES (4,1),(1,2),(1,4),(1,5),(1,6),(3,7),(1,8),(1,9),(2,10),(2,12),(2,14),(2,15),(2,16),(2,17),(2,18),(1,19),(2,20),(2,21),(3,22),(2,23),(2,24),(2,25),(2,26),(2,27),(1,28),(1,29),(1,30),(2,31),(1,32),(1,33),(2,34),(2,35),(2,36),(3,37),(1,38),(2,39),(1,40),(2,42),(1,43),(1,44),(1,45),(1,46),(3,47),(1,48),(1,49),(3,50),(2,51),(2,52),(2,53),(2,54);
/*!40000 ALTER TABLE `db_user_in_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_user_roles`
--

DROP TABLE IF EXISTS `db_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_user_roles`
--

LOCK TABLES `db_user_roles` WRITE;
/*!40000 ALTER TABLE `db_user_roles` DISABLE KEYS */;
INSERT INTO `db_user_roles` VALUES (1,'Sub User'),(2,'User'),(3,'Dealer'),(4,'Admin');
/*!40000 ALTER TABLE `db_user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_users`
--

DROP TABLE IF EXISTS `db_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(200) NOT NULL,
  `lastName` varchar(200) NOT NULL,
  `sessionId` char(36) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `sellerId` int(11) DEFAULT NULL,
  `password` tinytext,
  `phone` varchar(25) DEFAULT NULL,
  `address` varchar(400) DEFAULT '',
  `biddingLimit` double DEFAULT '0',
  `isLive` tinyint(1) DEFAULT '0',
  `isDeleted` tinyint(1) DEFAULT '0',
  `dateCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `dateModified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deviceId` varchar(255) DEFAULT '',
  `imgUrl` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_users`
--

LOCK TABLES `db_users` WRITE;
/*!40000 ALTER TABLE `db_users` DISABLE KEYS */;
INSERT INTO `db_users` VALUES (1,'Test','Test','2806e8be-5f4c-407c-8e6a-a0d40c76ee98','super.admin@email.com',NULL,'b1b1d7942d833d1bd94fa321418430f2',NULL,'',0,1,0,'2017-09-22 00:05:48','2017-10-31 10:46:20','',NULL),(2,'Test','Test','dd5f9528-5977-4142-abe0-06134e08f9a6','super.admin@email1.com',NULL,'b1b1d7942d833d1bd94fa321418430f2',NULL,'',0,1,0,'2017-09-22 00:20:20','2017-09-22 00:20:20','',NULL),(4,'Swagata','Kundu','fc804858-361c-49bb-a66d-a3bd15796776','swagatakr.kundu@gmail.com',NULL,'34913d789b0f16083c9d844a974860ba',NULL,'',0,1,0,'2017-09-24 14:50:39','2017-11-07 12:40:23','test',NULL),(5,'Vikas','Verma','d7dc6409-7ef1-4c6b-be02-abf7bf592803','verma.vikas442@gmail.com',NULL,'1616874571a3caa644114f66f72e3f02',NULL,'Sector 40, Gurugram Haryana',0,0,0,'2017-09-25 09:38:35','2017-09-25 16:03:33','',NULL),(6,'Vikas','Verma','dfddf0a4-5f96-4383-a087-c9d5fec7f124','verma.vikas443@gmail.com',NULL,'b1b1d7942d833d1bd94fa321418430f2',NULL,'Gurgaon',0,0,0,'2017-09-25 10:09:53','2017-09-25 10:09:53','',NULL),(7,'Vikas','Verma','0782023a-33ed-498f-922e-6c71fa13f1dd','test.user@dealer.com',NULL,'b1b1d7942d833d1bd94fa321418430f2',NULL,'Sector 40, Gurgaon',0,0,0,'2017-09-25 16:04:45','2017-09-27 16:07:32','',NULL),(8,'Vikas','Verma','462cbef7-73c3-4079-bbd4-83060d961328','test.user@seller.com',NULL,'b1b1d7942d833d1bd94fa321418430f2',NULL,'Sector 18, Noida',0,0,0,'2017-09-25 16:11:41','2017-10-10 15:06:55','',NULL),(9,'Vikas','Verma','704f4dd8-3cdc-4972-bc42-abb3cad974bf','testuser@askwheels.com',NULL,'b1b1d7942d833d1bd94fa321418430f2',NULL,'Gurgaon',0,0,0,'2017-09-26 06:08:43','2017-09-26 06:08:43','',NULL),(10,'Sub','Seller','a78c4efd-d55a-4507-9254-c3c94af5eaa6','test.user@subseller.com',NULL,'b1b1d7942d833d1bd94fa321418430f2',NULL,'Delhi',0,0,0,'2017-09-26 08:35:19','2017-10-07 15:59:39','',NULL),(11,'Test','Test','a51a31f7-5455-49f4-96da-2e6686725d54','subseller@email2.com',4,'b1b1d7942d833d1bd94fa321418430f2',NULL,'',0,0,1,'2017-10-04 17:11:28','2017-10-07 15:59:48','',NULL),(12,'Vikas','Verma','09cbbc8f-b0bf-40d3-80a3-73ec10ae2a16','verma.vikas@gmail.com',4,'b1b1d7942d833d1bd94fa321418430f2','9582534866','Gurgaon',0,0,0,'2017-10-04 18:53:58','2017-10-07 16:01:10','',NULL),(13,'Vikas','Verma','891d214a-bda1-44e0-8a60-62603de38763','verma.vikas321@gmail.com',4,'b1b1d7942d833d1bd94fa321418430f2','9582534866','Gurgaon',0,0,1,'2017-10-04 18:54:55','2017-10-07 15:59:56','',NULL),(14,'Vikas','Verma','34cbea95-d516-4e27-bebd-e33204b764ee','verma.vikas322@gmail.com',8,'b1b1d7942d833d1bd94fa321418430f2','9582534866','Gurgaon',0,0,0,'2017-10-04 18:58:17','2017-10-04 18:58:17','',NULL),(15,'Vikas','Verma','115444e7-d617-4c84-ba64-64d008ff4e05','vikas.verma123@gmail.com',4,'b1b1d7942d833d1bd94fa321418430f2','9586523154','Gurgaon',0,0,0,'2017-10-04 19:04:08','2017-10-04 19:04:08','',NULL),(16,'Test','User','80cf59df-33ed-4343-9a37-89fe3ccf5321','test.user2@subseller.com',8,'b1b1d7942d833d1bd94fa321418430f2','9582385555','Gzdgxcyf',0,0,0,'2017-10-05 15:10:19','2017-10-08 16:19:56','',NULL),(17,'Test','User 2','0a82917a-74a2-4467-b95d-ba4d680134b5','test.user3@subseller.com',8,'b1b1d7942d833d1bd94fa321418430f2','9956565661','Hshshdhdhd',0,0,0,'2017-10-07 12:39:05','2017-10-07 12:39:05','',NULL),(18,'Test','User 3','90dbe3dc-1244-4a00-b894-085613c23bc5','test.user4@subseller.com',8,'b1b1d7942d833d1bd94fa321418430f2','3453356589','Hshhddhh',0,0,0,'2017-10-07 12:39:59','2017-10-07 12:39:59','',NULL),(19,'H','B','3da1ac30-b2fa-4a47-9a08-24920b675a8e','abc@abc.com',NULL,'74b87337454200d4d33f80c4663dc5e5','8757576469','Bzhsgsuhsjshjj',0,1,0,'2017-10-09 08:06:55','2017-10-16 11:26:51','',NULL),(20,'Nishant','Kataria','a556b056-c3c9-418a-8133-f1d17107451a','aa@vv.com',19,'b1b1d7942d833d1bd94fa321418430f2','9632145789','Gsgsgsg',0,0,0,'2017-10-09 12:54:29','2017-10-09 12:57:00','',NULL),(21,'Test','User5','e56d711e-1cfe-40bd-bdb4-157cc8baade3','test.user4@gmail.com',8,'b1b1d7942d833d1bd94fa321418430f2','6135554466','Gsgssggdgd',0,0,0,'2017-10-09 12:59:09','2017-10-09 12:59:09','',NULL),(22,'Nishant','Kataria','d4da7587-09b1-4a0b-85f6-832efad72b60','abc@cab.com',NULL,'74b87337454200d4d33f80c4663dc5e5','7894561232','Fagsgsvsb',0,0,0,'2017-10-09 13:05:39','2017-10-09 13:06:13','',NULL),(23,'Added','Swagata','46278728-d5f4-4a5d-809f-0a42530ca7c9','test.subseller@email.com',8,'b1b1d7942d833d1bd94fa321418430f2','8888888888','Bsbs',0,0,0,'2017-10-09 13:07:44','2017-10-09 13:07:44','',NULL),(24,'Test','User new','942c1b15-5eb9-49ef-ac8b-8b32a84ba1ce','test.subuser@subseller.com',8,'b1b1d7942d833d1bd94fa321418430f2','3544258566','Cccggg',0,0,0,'2017-10-09 13:25:15','2017-10-09 13:25:15','',NULL),(25,'A','B','a7877337-646f-4414-93a7-40d11427a1f6','aa@gg.com',19,'b1b1d7942d833d1bd94fa321418430f2','1234567890','Csgg',0,0,0,'2017-10-09 13:30:02','2017-10-09 13:30:02','',NULL),(26,'Trst','User','c1e4b1bd-c82a-4d00-bdb6-653ee7ede9e2','adc.asd@subseller.com',19,'b1b1d7942d833d1bd94fa321418430f2','6554689857','Gxvzgzg',0,0,0,'2017-10-09 13:32:05','2017-10-09 13:32:05','',NULL),(27,'Hello','Hi','de90b1a1-a704-4c49-908c-29d75e15b7aa','qq@rr.com',19,'b1b1d7942d833d1bd94fa321418430f2','1234567899','Afhsvhs',0,0,0,'2017-10-09 13:35:56','2017-10-09 13:35:56','',NULL),(28,'Qwerty','Klm','75f20d83-9667-49da-866c-7b552561a535','xyz@qwe.com',NULL,'74b87337454200d4d33f80c4663dc5e5','1234567890','fvirhfhbrjkfnvikrhfjbrj',0,1,0,'2017-10-09 18:16:37','2017-10-16 11:26:30','',NULL),(29,'Nishant','Kataria','e992ede3-cd3f-4c22-9d35-dd2f0fb89f80','qwe@rrr.com',NULL,'74b87337454200d4d33f80c4663dc5e5','1234567890','kkjhhedvjehdhjdbjbdjkcbjdbcjbjdkbcjbdjcbjdbcjvbdjcbjdcbjdbcjbdjcbjdbcjd',0,0,0,'2017-10-13 13:36:46','2017-10-13 13:36:46','',NULL),(30,'Swagata','Kumar','5eb16862-ff75-4fb1-b9da-debff72756d7','swagatakr.kundu1@gmail.com',NULL,'b1b1d7942d833d1bd94fa321418430f2','8874598865','dalmia hostel, room no 158, BHU,',0,0,0,'2017-10-14 17:08:57','2017-10-14 17:08:57','',NULL),(31,'Sub','User','2c18a26f-f81c-43aa-970c-ba4444249193','subuser@email.com',29,'b1b1d7942d833d1bd94fa321418430f2','9632145780','Qwert',0,0,0,'2017-10-14 17:32:40','2017-10-14 17:32:40','',NULL),(32,'Aa','Aa','dc427b06-c067-41d5-8df1-f4250970edeb','bshsy@hshs.com',NULL,'74b87337454200d4d33f80c4663dc5e5','2746755876','Vxvxvhx',0,1,0,'2017-10-15 10:59:01','2017-10-16 11:26:38','',NULL),(33,'Nishant','Kataria','92edd893-23fc-49db-a8de-f8cf6a8cd887','nishant@email.com',NULL,'74b87337454200d4d33f80c4663dc5e5','9999999999','Type your address here',0,0,0,'2017-10-15 11:16:40','2017-10-15 11:16:40','',NULL),(34,'Sub','User 1','f759e3bb-8e18-4cbb-8a29-030e2b2c8d4b','aa@bb.com',33,'b1b1d7942d833d1bd94fa321418430f2','9874563210','Gurgaon',0,0,0,'2017-10-15 14:16:56','2017-10-15 14:16:56','',NULL),(35,'Sub','User 2','f28b73ad-1ccb-4cee-b455-d5c903ff594a','aa@cc.com',33,'b1b1d7942d833d1bd94fa321418430f2','9874563210','Noida',0,0,0,'2017-10-15 14:17:25','2017-10-15 14:17:25','',NULL),(36,'Sub','User 3','4163bac7-2fa7-4f75-8d4a-411e18c4b0d7','aa@bbc.com',33,'b1b1d7942d833d1bd94fa321418430f2','1234567890','Panjab',0,0,0,'2017-10-15 14:18:04','2017-10-15 14:18:04','',NULL),(37,'Nancy','Drew','b5b1e309-ca46-41c5-973a-da417e9ee096','swagatakr.kundu2@gmail.com',NULL,'b1b1d7942d833d1bd94fa321418430f2','9958202792','Test',15000000,1,0,'2017-10-15 14:52:48','2017-11-23 11:40:52','',NULL),(38,'Aaa','Bbb','e59b1cde-8538-4b28-b213-c7b4654febcc','aaa@bbbc.com',NULL,'74b87337454200d4d33f80c4663dc5e5','1234567890','jnjcvnnncndicndjcnkndkcnidkncc',0,1,0,'2017-10-17 07:04:32','2017-10-31 11:48:47','',NULL),(39,'Zzz','Xxx','9fe8abf1-d570-4f21-8a80-bdb6f98e5f16','zzz@xxx.com',38,'b1b1d7942d833d1bd94fa321418430f2','1234567890','ffedfe',0,0,0,'2017-10-17 07:24:27','2017-10-17 07:24:27','',NULL),(40,'Aaa','Bbb','f6aee2a9-e844-4a8f-9549-6157a404949f','aaa@bbcd.com',NULL,'74b87337454200d4d33f80c4663dc5e5','9632145678','Ggg',0,0,0,'2017-11-04 12:10:40','2017-11-04 12:10:40','',NULL),(41,'Test','Test','d8ff2ad6-a0fd-4474-b30f-0275829d07cc','',8,'b1b1d7942d833d1bd94fa321418430f2','1111111111','',0,0,1,'2017-11-06 15:22:59','2017-11-15 19:28:53','',NULL),(42,'Aman','Talwar','8c86e217-a2bf-4920-b19d-58f6182ad09a','',8,'b1b1d7942d833d1bd94fa321418430f2','9671330507','',0,0,0,'2017-11-17 06:21:13','2017-11-17 06:21:13','',NULL),(43,'Nishant','K','cbf492b3-2c6d-4179-bc57-1d6afbe85a7c','aaa@rty.com',NULL,'b1b1d7942d833d1bd94fa321418430f2','1234567890','Gsgshsh',0,0,0,'2017-11-18 10:20:45','2017-11-18 10:20:45','',NULL),(44,'Ajay','Grover','6c5ac7d4-44fb-4915-9312-201c0fa505a0','ggg@111.com',NULL,'b1b1d7942d833d1bd94fa321418430f2','1234567890','Xfggh',0,0,0,'2017-11-18 10:30:33','2017-11-18 10:30:33','',NULL),(45,'Abhishek','Jain','259efdf1-4c79-4533-8522-4a5450fd7b2d','hsrabhishek@gmail.com',NULL,'827ccb0eea8a706c4c34a16891f84e7b','9992880000','Sector 19b',0,0,0,'2017-11-19 07:53:52','2017-11-19 07:53:52','',NULL),(46,'Rashmi','Jain','542cc971-97ce-4269-8085-646482442840','rjain2901@gmail.com',NULL,'827ccb0eea8a706c4c34a16891f84e7b','9992888899','Sector 19 b',0,0,0,'2017-11-19 08:27:29','2017-11-19 08:27:29','',NULL),(47,'Abhishek','Jain','d2e5b878-9c46-4cb4-9fe7-d28112fef751','hsrabhishek@hotmail.com',NULL,'827ccb0eea8a706c4c34a16891f84e7b','9992880000','Sec 19',0,0,0,'2017-11-19 08:39:07','2017-11-19 08:39:07','',NULL),(48,'Abhishek','Chhibber','91097466-b361-4697-a37b-21ed6f5e8aaf','abhishekchhibber50@gmail.com',NULL,'6b06f57bd694fe32039bfeff568b0e7a','9990002447','Tanish ford ',0,0,0,'2017-11-19 09:50:42','2017-11-19 09:50:42','',NULL),(49,'Hiten','Garg','2fb4e17a-2fbe-4075-ba11-0dbdcee3dc88','hiten06091999@gmail.com',NULL,'827ccb0eea8a706c4c34a16891f84e7b','9999108115','South city 1 Central avenue road gurugram',0,0,0,'2017-11-19 12:03:38','2017-11-19 12:03:38','',NULL),(50,'Prince','Sharma','011fc0ff-8f2f-4d11-83f3-fa2ae9d23c4d','info@askwheels.com',NULL,'4a05cc4d8908ceecfa9c7fbe3c745ba8','9992888844','T-12-15 3rd floor falcon Malhan. Plaza sec 12 dwarka new delhi',0,0,0,'2017-11-20 05:44:57','2017-11-20 05:44:57','',NULL),(51,'Test','Sasa','e05651a4-0f7b-4295-9421-152e7a32a251','',8,'8f06328174ec25b26f4c7d1fbf643dca','1234467891','',0,0,0,'2017-11-20 12:05:25','2017-11-20 12:05:25','',NULL),(52,'Swagata','Kumar','ccd79e1b-1be7-4084-b3fe-a49e35e8eb60','',8,'8f06328174ec25b26f4c7d1fbf643dca','1234567891','',0,0,0,'2017-11-20 12:06:26','2017-11-20 12:06:26','',NULL),(53,'Sasasa','Aasas','89ac481f-271c-4089-b371-fe0a8f35a7e3','',8,'8f06328174ec25b26f4c7d1fbf643dca','1234567893','',0,0,0,'2017-11-20 12:07:06','2017-11-20 12:07:06','',NULL),(54,'Sss','','eeacb4e1-2c8a-4a4d-a028-dc96d7b4d6b5','',8,'b1b1d7942d833d1bd94fa321418430f2','1234567898','',0,0,0,'2017-11-20 12:13:53','2017-11-20 12:13:53','',NULL);
/*!40000 ALTER TABLE `db_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_vehicle`
--

DROP TABLE IF EXISTS `db_vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_vehicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_name` varchar(250) DEFAULT NULL,
  `sellerId` int(11) DEFAULT NULL,
  `subsellerId` int(11) DEFAULT NULL,
  `start_bid` double DEFAULT NULL,
  `passengers` int(11) DEFAULT '0',
  `registration_number` varchar(250) DEFAULT NULL,
  `reg_date` date DEFAULT NULL,
  `insurance_validation` date DEFAULT NULL,
  `insurance_type` varchar(100) DEFAULT '',
  `hpa_status` varchar(100) DEFAULT '',
  `vin_number` varchar(250) DEFAULT NULL,
  `engine_number` varchar(250) DEFAULT NULL,
  `previous_owners` int(11) DEFAULT NULL,
  `fuel_type` varchar(250) DEFAULT NULL,
  `color` varchar(250) DEFAULT NULL,
  `model` varchar(250) DEFAULT NULL,
  `variant` varchar(250) DEFAULT NULL,
  `evaluation_date` date DEFAULT NULL,
  `manufacturing_year` int(11) DEFAULT NULL,
  `rc_status` varchar(250) DEFAULT NULL,
  `location` varchar(250) DEFAULT NULL,
  `transition_type` varchar(250) DEFAULT NULL,
  `transmission_type` varchar(250) DEFAULT '',
  `distance_travelled` double DEFAULT NULL,
  `inspection_report` json DEFAULT NULL,
  `auction_start_date` datetime DEFAULT NULL,
  `admin_live_date` datetime DEFAULT NULL,
  `vehicle_status` int(11) DEFAULT '1',
  `reject_reason` varchar(100) DEFAULT '',
  `isDeleted` tinyint(1) DEFAULT '0',
  `dateCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `dateModified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_vehicle`
--

LOCK TABLES `db_vehicle` WRITE;
/*!40000 ALTER TABLE `db_vehicle` DISABLE KEYS */;
INSERT INTO `db_vehicle` VALUES (17,'Shusudeuhshdh',8,NULL,1347774,5,'Hshsdudu','2017-11-14','2017-12-12','Third Party','Yes','HWHDUDUD','SHUSDUDU',1,'Hybrid','Red','','','2017-12-12',2017,'Sjjdxjh','Hshdhdhd','Dududuudududu','',1244,'{\"frame\": {\"chassis_ok\": {}, \"hole_without_scratches\": {}, \"no_crumpling_inside_trunk\": {}}, \"tyres\": {\"same_make\": {}, \"spare_tyre\": {}, \"thread_worn\": {}, \"no_cuts_cracks\": {}, \"spare_tyre_inflated\": {}}, \"breaks\": {\"vss\": {}, \"pbedf\": {}, \"wlaab\": {}, \"grinding_noise\": {}}, \"engine\": {\"no_odors\": {}, \"oil_filler\": {}, \"fluid_leaks\": {}, \"no_black_dark_oil\": {}, \"exhaust_pipe_emission\": {}, \"battery_terminals_corrision\": {}}, \"exterior\": {\"hood\": {\"value\": \"Original\", \"description\": \"Susudidi\"}, \"roof\": {}, \"body_type\": {\"value\": \"Sedan\", \"description\": \"Sehdhhd\"}, \"trunk_boot\": {}, \"boot_bumper\": {}, \"front_bumper\": {}, \"driver_side_apron\": {}, \"lights_functional\": {}, \"trunk_hood_aligned\": {}, \"bpiller_driver_side\": {}, \"door_fender_aligned\": {}, \"passanger_side_apron\": {}, \"windshield_no_cracks\": {}, \"rear_door_driver_side\": {}, \"bpiller_passanger_side\": {}, \"front_driver_side_door\": {}, \"wiper_blades_functional\": {}, \"front_driver_side_fender\": {}, \"rear_door_passanger_side\": {}, \"front_passanger_side_fender\": {}, \"front_passanger_side_piller\": {}, \"rear_driver_side_quarter_paner\": {}, \"rear_passanger_side_quarter_paner\": {}}, \"interior\": {\"ac_works\": {}, \"heater_works\": {}, \"stereo_works\": {}, \"all_gauge_works\": {}, \"car_alarm_works\": {}, \"seats_adjust_properly\": {}, \"seats_unworn_no_cracks\": {}, \"windshiels_wiper_works\": {}, \"doors_open_close_freely\": {}, \"seats_equipped_seatbelt\": {}, \"trunk_open_close_freely\": {}, \"lacks_air_freshner_scent\": {}, \"head_lights_work_properly\": {}, \"sunroof_open_close_properly\": {}, \"wiper_fluid_dispenses_properly\": {}, \"hazard_lights_function_properly\": {}, \"power_windows_operates_properly\": {}, \"trunk_driver_door_lock_with_key\": {}, \"no_warning_light_remian_illuminated\": {}}, \"steering\": {\"stable\": {}, \"clunking\": {}, \"no_drift\": {}, \"resistance\": {}}, \"suspension\": {\"same_bouncing\": {}, \"cracking_noise\": {}, \"vehicle_rest_levelly\": {}}, \"miscellaneous\": {\"car_manual\": {}, \"owner_title\": {}, \"instructions\": {}}, \"manual_transmission\": {\"grinding_noise\": {}, \"gear_shifts_smoothly\": {}}, \"automatic_tansmission\": {\"fluid_clean\": {}, \"no_slips_delays\": {}}}','2017-11-23 11:34:37','2017-11-16 11:54:46',2,'',0,'2017-11-14 19:26:35','2017-11-23 11:34:37'),(18,'Shusudeuhshdh',8,NULL,1347774,5,'Hshsdudu','2017-11-14','2017-12-12','Third Party','Yes','HWHDUDUD','SHUSDUDU',1,'Hybrid','Red','','','2017-12-12',2017,'Sjjdxjh','Hshdhdhd','Dududuudududu','',1244,'{\"frame\": {\"chassis_ok\": {}, \"hole_without_scratches\": {}, \"no_crumpling_inside_trunk\": {}}, \"tyres\": {\"same_make\": {}, \"spare_tyre\": {}, \"thread_worn\": {}, \"no_cuts_cracks\": {}, \"spare_tyre_inflated\": {}}, \"breaks\": {\"vss\": {}, \"pbedf\": {}, \"wlaab\": {}, \"grinding_noise\": {}}, \"engine\": {\"no_odors\": {}, \"oil_filler\": {}, \"fluid_leaks\": {}, \"no_black_dark_oil\": {}, \"exhaust_pipe_emission\": {}, \"battery_terminals_corrision\": {}}, \"exterior\": {\"hood\": {\"value\": \"Original\", \"description\": \"Susudidi\"}, \"roof\": {}, \"body_type\": {\"value\": \"Sedan\", \"description\": \"Sehdhhd\"}, \"trunk_boot\": {}, \"boot_bumper\": {}, \"front_bumper\": {}, \"driver_side_apron\": {}, \"lights_functional\": {}, \"trunk_hood_aligned\": {}, \"bpiller_driver_side\": {}, \"door_fender_aligned\": {}, \"passanger_side_apron\": {}, \"windshield_no_cracks\": {}, \"rear_door_driver_side\": {}, \"bpiller_passanger_side\": {}, \"front_driver_side_door\": {}, \"wiper_blades_functional\": {}, \"front_driver_side_fender\": {}, \"rear_door_passanger_side\": {}, \"front_passanger_side_fender\": {}, \"front_passanger_side_piller\": {}, \"rear_driver_side_quarter_paner\": {}, \"rear_passanger_side_quarter_paner\": {}}, \"interior\": {\"ac_works\": {}, \"heater_works\": {}, \"stereo_works\": {}, \"all_gauge_works\": {}, \"car_alarm_works\": {}, \"seats_adjust_properly\": {}, \"seats_unworn_no_cracks\": {}, \"windshiels_wiper_works\": {}, \"doors_open_close_freely\": {}, \"seats_equipped_seatbelt\": {}, \"trunk_open_close_freely\": {}, \"lacks_air_freshner_scent\": {}, \"head_lights_work_properly\": {}, \"sunroof_open_close_properly\": {}, \"wiper_fluid_dispenses_properly\": {}, \"hazard_lights_function_properly\": {}, \"power_windows_operates_properly\": {}, \"trunk_driver_door_lock_with_key\": {}, \"no_warning_light_remian_illuminated\": {}}, \"steering\": {\"stable\": {}, \"clunking\": {}, \"no_drift\": {}, \"resistance\": {}}, \"suspension\": {\"same_bouncing\": {}, \"cracking_noise\": {}, \"vehicle_rest_levelly\": {}}, \"miscellaneous\": {\"car_manual\": {}, \"owner_title\": {}, \"instructions\": {}}, \"manual_transmission\": {\"grinding_noise\": {}, \"gear_shifts_smoothly\": {}}, \"automatic_tansmission\": {\"fluid_clean\": {}, \"no_slips_delays\": {}}}','2017-11-19 15:34:08','2017-11-16 11:54:46',2,'',0,'2017-11-14 19:28:07','2017-11-19 15:34:08'),(19,'Shusudeuhshdh',8,NULL,1347774,5,'Hshsdudu','2017-11-14','2017-12-12','Third Party','Yes','HWHDUDUD','SHUSDUDU',1,'Hybrid','Red','','','2017-12-12',2017,'Sjjdxjh','Hshdhdhd','Dududuudududu','',1244,'{\"frame\": {\"chassis_ok\": {}, \"hole_without_scratches\": {}, \"no_crumpling_inside_trunk\": {}}, \"tyres\": {\"same_make\": {}, \"spare_tyre\": {}, \"thread_worn\": {}, \"no_cuts_cracks\": {}, \"spare_tyre_inflated\": {}}, \"breaks\": {\"vss\": {}, \"pbedf\": {}, \"wlaab\": {}, \"grinding_noise\": {}}, \"engine\": {\"no_odors\": {}, \"oil_filler\": {}, \"fluid_leaks\": {}, \"no_black_dark_oil\": {}, \"exhaust_pipe_emission\": {}, \"battery_terminals_corrision\": {}}, \"exterior\": {\"hood\": {\"value\": \"Original\", \"description\": \"Susudidi\"}, \"roof\": {}, \"body_type\": {\"value\": \"Sedan\", \"description\": \"Sehdhhd\"}, \"trunk_boot\": {}, \"boot_bumper\": {}, \"front_bumper\": {}, \"driver_side_apron\": {}, \"lights_functional\": {}, \"trunk_hood_aligned\": {}, \"bpiller_driver_side\": {}, \"door_fender_aligned\": {}, \"passanger_side_apron\": {}, \"windshield_no_cracks\": {}, \"rear_door_driver_side\": {}, \"bpiller_passanger_side\": {}, \"front_driver_side_door\": {}, \"wiper_blades_functional\": {}, \"front_driver_side_fender\": {}, \"rear_door_passanger_side\": {}, \"front_passanger_side_fender\": {}, \"front_passanger_side_piller\": {}, \"rear_driver_side_quarter_paner\": {}, \"rear_passanger_side_quarter_paner\": {}}, \"interior\": {\"ac_works\": {}, \"heater_works\": {}, \"stereo_works\": {}, \"all_gauge_works\": {}, \"car_alarm_works\": {}, \"seats_adjust_properly\": {}, \"seats_unworn_no_cracks\": {}, \"windshiels_wiper_works\": {}, \"doors_open_close_freely\": {}, \"seats_equipped_seatbelt\": {}, \"trunk_open_close_freely\": {}, \"lacks_air_freshner_scent\": {}, \"head_lights_work_properly\": {}, \"sunroof_open_close_properly\": {}, \"wiper_fluid_dispenses_properly\": {}, \"hazard_lights_function_properly\": {}, \"power_windows_operates_properly\": {}, \"trunk_driver_door_lock_with_key\": {}, \"no_warning_light_remian_illuminated\": {}}, \"steering\": {\"stable\": {}, \"clunking\": {}, \"no_drift\": {}, \"resistance\": {}}, \"suspension\": {\"same_bouncing\": {}, \"cracking_noise\": {}, \"vehicle_rest_levelly\": {}}, \"miscellaneous\": {\"car_manual\": {}, \"owner_title\": {}, \"instructions\": {}}, \"manual_transmission\": {\"grinding_noise\": {}, \"gear_shifts_smoothly\": {}}, \"automatic_tansmission\": {\"fluid_clean\": {}, \"no_slips_delays\": {}}}','2017-11-19 15:34:08','2017-11-16 11:54:46',2,'',0,'2017-11-14 19:30:59','2017-11-19 15:34:08'),(20,'Jsjdjdkd',8,NULL,455555,5,'Jdjdjdj','2017-11-05','2018-01-25','Zero Depth','Yes','NDJDJDJD','JDJDJDHSHJS',1,'Hybrid','Jxjdjddj','Jddjdjjd','Shhddjdhh','2017-11-16',2015,'Original','Jdjxjdjdjd','Automatic','',42555,'{\"frame\": {\"chassis_ok\": {}, \"hole_without_scratches\": {}, \"no_crumpling_inside_trunk\": {}}, \"tyres\": {\"same_make\": {}, \"spare_tyre\": {}, \"thread_worn\": {}, \"no_cuts_cracks\": {}, \"spare_tyre_inflated\": {}}, \"breaks\": {\"vss\": {}, \"pbedf\": {}, \"wlaab\": {}, \"grinding_noise\": {}}, \"engine\": {\"no_odors\": {}, \"oil_filler\": {}, \"fluid_leaks\": {}, \"no_black_dark_oil\": {}, \"exhaust_pipe_emission\": {}, \"battery_terminals_corrision\": {}}, \"exterior\": {\"hood\": {}, \"roof\": {}, \"body_type\": {}, \"trunk_boot\": {}, \"boot_bumper\": {}, \"front_bumper\": {}, \"driver_side_apron\": {}, \"lights_functional\": {}, \"trunk_hood_aligned\": {}, \"bpiller_driver_side\": {}, \"door_fender_aligned\": {}, \"passanger_side_apron\": {}, \"windshield_no_cracks\": {}, \"rear_door_driver_side\": {}, \"bpiller_passanger_side\": {}, \"front_driver_side_door\": {}, \"wiper_blades_functional\": {}, \"front_driver_side_fender\": {}, \"rear_door_passanger_side\": {}, \"front_passanger_side_fender\": {}, \"front_passanger_side_piller\": {}, \"rear_driver_side_quarter_paner\": {}, \"rear_passanger_side_quarter_paner\": {}}, \"interior\": {\"ac_works\": {}, \"heater_works\": {}, \"stereo_works\": {}, \"all_gauge_works\": {}, \"car_alarm_works\": {}, \"seats_adjust_properly\": {}, \"seats_unworn_no_cracks\": {}, \"windshiels_wiper_works\": {}, \"doors_open_close_freely\": {}, \"seats_equipped_seatbelt\": {}, \"trunk_open_close_freely\": {}, \"lacks_air_freshner_scent\": {}, \"head_lights_work_properly\": {}, \"sunroof_open_close_properly\": {}, \"wiper_fluid_dispenses_properly\": {}, \"hazard_lights_function_properly\": {}, \"power_windows_operates_properly\": {}, \"trunk_driver_door_lock_with_key\": {}, \"no_warning_light_remian_illuminated\": {}}, \"steering\": {\"stable\": {}, \"clunking\": {}, \"no_drift\": {}, \"resistance\": {}}, \"suspension\": {\"same_bouncing\": {}, \"cracking_noise\": {}, \"vehicle_rest_levelly\": {}}, \"miscellaneous\": {\"car_manual\": {}, \"owner_title\": {}, \"instructions\": {}}, \"manual_transmission\": {\"grinding_noise\": {}, \"gear_shifts_smoothly\": {}}, \"automatic_tansmission\": {\"fluid_clean\": {}, \"no_slips_delays\": {}}}','2017-11-19 15:34:08','2017-11-16 16:38:24',2,'hfcgfdcgh',0,'2017-11-16 05:02:58','2017-11-19 15:34:08'),(21,'Maruti - XYZ',NULL,NULL,25000,4,'Haryana','2017-11-18','2017-11-30','Third Party','Yes','00000','000000',1,'Petrol','White','2016','LZI','2017-11-18',2016,'Haryana','Gurgaon','Automatic','',5000,'{\"frame\": {\"chassis_ok\": {\"description\": \"Abc\"}, \"hole_without_scratches\": {}, \"no_crumpling_inside_trunk\": {}}, \"tyres\": {\"same_make\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"brand_name\": \"abc\", \"spare_tyre\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"thread_worn\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"no_cuts_cracks\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"spare_tyre_inflated\": {\"value\": \"No\", \"description\": \"Abc\"}}, \"breaks\": {\"vss\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"pbedf\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"wlaab\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"grinding_noise\": {\"value\": \"No\", \"description\": \"Abc\"}}, \"engine\": {\"no_odors\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"oil_filler\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"fluid_leaks\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"no_black_dark_oil\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"exhaust_pipe_emission\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"battery_terminals_corrision\": {\"value\": \"Yes\", \"description\": \"Abc\"}}, \"exterior\": {\"hood\": {\"value\": \"Original\", \"description\": \"Abc\"}, \"roof\": {\"value\": \"Original\", \"description\": \"Abc\"}, \"body_type\": {\"value\": \"Sedan\", \"description\": \"Abc\"}, \"trunk_boot\": {\"value\": \"Original\", \"description\": \"Qbc\"}, \"boot_bumper\": {\"value\": \"Original\", \"description\": \"Abc\"}, \"front_bumper\": {\"value\": \"Original\", \"description\": \"Abc\"}, \"driver_side_apron\": {\"value\": \"Repaired\", \"description\": \"Abc\"}, \"lights_functional\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"trunk_hood_aligned\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"bpiller_driver_side\": {\"value\": \"Original\", \"description\": \"Abc\"}, \"door_fender_aligned\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"passanger_side_apron\": {\"value\": \"Original\", \"description\": \"Abc\"}, \"windshield_no_cracks\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"rear_door_driver_side\": {\"value\": \"Original\", \"description\": \"Qbc\"}, \"bpiller_passanger_side\": {\"value\": \"Original\", \"description\": \"Abc\"}, \"front_driver_side_door\": {\"value\": \"Original\", \"description\": \"Abc\"}, \"wiper_blades_functional\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"front_driver_side_fender\": {\"value\": \"Original\", \"description\": \"Abc\"}, \"rear_door_passanger_side\": {\"value\": \"Original\", \"description\": \"Abc\"}, \"front_passanger_side_fender\": {\"value\": \"Original\", \"description\": \"Abc\"}, \"front_passanger_side_piller\": {\"value\": \"Original\", \"description\": \"Abc\"}, \"rear_driver_side_quarter_paner\": {\"value\": \"Original\", \"description\": \"Abc\"}, \"rear_passanger_side_quarter_paner\": {\"value\": \"Original\", \"description\": \"Abc\"}}, \"interior\": {\"ac_works\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"heater_works\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"stereo_works\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"all_gauge_works\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"car_alarm_works\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"seats_adjust_properly\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"seats_unworn_no_cracks\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"windshiels_wiper_works\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"doors_open_close_freely\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"seats_equipped_seatbelt\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"trunk_open_close_freely\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"lacks_air_freshner_scent\": {\"value\": \"Yes\", \"description\": \"Wbc\"}, \"head_lights_work_properly\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"sunroof_open_close_properly\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"wiper_fluid_dispenses_properly\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"hazard_lights_function_properly\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"power_windows_operates_properly\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"trunk_driver_door_lock_with_key\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"no_warning_light_remian_illuminated\": {\"value\": \"Yes\", \"description\": \"Abc\"}}, \"steering\": {\"stable\": {\"value\": \"No\", \"description\": \"Abc\"}, \"clunking\": {\"value\": \"No\", \"description\": \"Abc\"}, \"no_drift\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"resistance\": {\"value\": \"Yes\", \"description\": \"Abc\"}}, \"suspension\": {\"same_bouncing\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"cracking_noise\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"vehicle_rest_levelly\": {\"value\": \"Yes\", \"description\": \"Abc\"}}, \"miscellaneous\": {\"car_manual\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"owner_title\": {\"value\": \"Yes\", \"description\": \"Abc\"}, \"instructions\": {\"value\": \"No\", \"description\": \"Abc\"}}, \"manual_transmission\": {\"grinding_noise\": {}, \"gear_shifts_smoothly\": {}}, \"automatic_tansmission\": {\"fluid_clean\": {}, \"no_slips_delays\": {}}}','2017-11-19 15:34:08',NULL,1,'',0,'2017-11-18 10:52:16','2017-11-19 15:34:08'),(22,'Huyndai I20 Magna',45,NULL,500000,5,'Haryana','2017-02-22','2018-02-01','Comprehensive','No','123456','123456',1,'Petrol','White','I20','Magna','2017-11-19',2017,'Active ','Delhi','Manual','',20000,'{\"frame\": {\"chassis_ok\": {\"value\": \"No\"}, \"hole_without_scratches\": {\"value\": \"Yes\"}, \"no_crumpling_inside_trunk\": {\"value\": \"No\"}}, \"tyres\": {\"same_make\": {\"value\": \"Yes\"}, \"brand_name\": \"michelen \", \"spare_tyre\": {\"value\": \"Yes\"}, \"thread_worn\": {\"value\": \"Yes\"}, \"no_cuts_cracks\": {\"value\": \"Yes\"}, \"spare_tyre_inflated\": {\"value\": \"Yes\"}}, \"breaks\": {\"vss\": {\"value\": \"No\"}, \"pbedf\": {\"value\": \"Yes\"}, \"wlaab\": {\"value\": \"Yes\"}, \"grinding_noise\": {\"value\": \"No\"}}, \"engine\": {\"no_odors\": {\"value\": \"Yes\"}, \"oil_filler\": {\"value\": \"Yes\"}, \"fluid_leaks\": {\"value\": \"Yes\"}, \"no_black_dark_oil\": {\"value\": \"Yes\"}, \"exhaust_pipe_emission\": {\"value\": \"Yes\"}, \"battery_terminals_corrision\": {\"value\": \"Yes\"}}, \"exterior\": {\"hood\": {\"value\": \"Original\"}, \"roof\": {\"value\": \"Original\"}, \"body_type\": {\"value\": \"Other\", \"description\": \"Hatchback \"}, \"trunk_boot\": {\"value\": \"Original\"}, \"boot_bumper\": {\"value\": \"Original\"}, \"front_bumper\": {\"value\": \"Original\", \"description\": \"Need paint ,scratch pls refer photos\"}, \"driver_side_apron\": {\"value\": \"Original\"}, \"lights_functional\": {\"value\": \"Yes\"}, \"trunk_hood_aligned\": {\"value\": \"Yes\"}, \"bpiller_driver_side\": {\"value\": \"Original\"}, \"door_fender_aligned\": {\"value\": \"Yes\"}, \"passanger_side_apron\": {\"value\": \"Original\"}, \"windshield_no_cracks\": {\"value\": \"Yes\"}, \"rear_door_driver_side\": {\"value\": \"Original\"}, \"bpiller_passanger_side\": {\"value\": \"Original\"}, \"front_driver_side_door\": {\"value\": \"Original\"}, \"wiper_blades_functional\": {\"value\": \"Yes\"}, \"front_driver_side_fender\": {\"value\": \"Original\"}, \"rear_door_passanger_side\": {\"value\": \"Original\"}, \"front_passanger_side_fender\": {\"value\": \"Original\"}, \"front_passanger_side_piller\": {\"value\": \"Original\"}, \"rear_driver_side_quarter_paner\": {\"value\": \"Original\"}, \"rear_passanger_side_quarter_paner\": {\"value\": \"Original\"}}, \"interior\": {\"ac_works\": {\"value\": \"Yes\"}, \"heater_works\": {\"value\": \"Yes\"}, \"stereo_works\": {\"value\": \"Yes\"}, \"all_gauge_works\": {\"value\": \"Yes\"}, \"car_alarm_works\": {\"value\": \"Yes\"}, \"seats_adjust_properly\": {\"value\": \"Yes\"}, \"seats_unworn_no_cracks\": {\"value\": \"Yes\"}, \"windshiels_wiper_works\": {\"value\": \"Yes\"}, \"doors_open_close_freely\": {\"value\": \"Yes\"}, \"seats_equipped_seatbelt\": {\"value\": \"Yes\"}, \"trunk_open_close_freely\": {\"value\": \"Yes\"}, \"lacks_air_freshner_scent\": {\"value\": \"Yes\"}, \"head_lights_work_properly\": {\"value\": \"Yes\"}, \"sunroof_open_close_properly\": {}, \"wiper_fluid_dispenses_properly\": {\"value\": \"Yes\"}, \"hazard_lights_function_properly\": {\"value\": \"Yes\"}, \"power_windows_operates_properly\": {\"value\": \"Yes\"}, \"trunk_driver_door_lock_with_key\": {\"value\": \"Yes\"}, \"no_warning_light_remian_illuminated\": {\"value\": \"Yes\"}}, \"steering\": {\"stable\": {\"value\": \"No\"}, \"clunking\": {\"value\": \"No\"}, \"no_drift\": {\"value\": \"No\"}, \"resistance\": {\"value\": \"No\"}}, \"suspension\": {\"same_bouncing\": {\"value\": \"Yes\"}, \"cracking_noise\": {\"value\": \"Yes\"}, \"vehicle_rest_levelly\": {\"value\": \"Yes\"}}, \"miscellaneous\": {\"car_manual\": {\"value\": \"No\"}, \"owner_title\": {\"value\": \"Yes\"}, \"instructions\": {\"value\": \"Yes\"}}, \"manual_transmission\": {\"grinding_noise\": {\"value\": \"No\"}, \"gear_shifts_smoothly\": {\"value\": \"Yes\"}}, \"automatic_tansmission\": {\"fluid_clean\": {\"value\": \"Yes\"}, \"no_slips_delays\": {\"value\": \"No\"}}}','2017-11-19 15:34:08',NULL,1,'',0,'2017-11-19 08:22:35','2017-11-19 15:34:08'),(23,'Hyundai Santro',48,NULL,130000,4,'Hr','2011-11-16','2017-11-22','Comprehensive','No','638393)','39394)',1,'Petrol','Silver','2011','Gl+','2017-11-19',2011,'Available','Gurgaon','Manual','',49000,'{\"frame\": {\"chassis_ok\": {\"value\": \"No\"}, \"hole_without_scratches\": {\"value\": \"Yes\"}, \"no_crumpling_inside_trunk\": {\"value\": \"No\"}}, \"tyres\": {\"same_make\": {\"value\": \"Yes\"}, \"brand_name\": \"mrf\", \"spare_tyre\": {\"value\": \"Yes\"}, \"thread_worn\": {\"value\": \"Yes\"}, \"no_cuts_cracks\": {\"value\": \"Yes\"}, \"spare_tyre_inflated\": {\"value\": \"Yes\"}}, \"breaks\": {\"vss\": {\"value\": \"Yes\"}, \"pbedf\": {\"value\": \"Yes\"}, \"wlaab\": {}, \"grinding_noise\": {\"value\": \"No\"}}, \"engine\": {\"no_odors\": {\"value\": \"Yes\"}, \"oil_filler\": {\"value\": \"Yes\"}, \"fluid_leaks\": {\"value\": \"Yes\"}, \"no_black_dark_oil\": {\"value\": \"Yes\"}, \"exhaust_pipe_emission\": {\"value\": \"Yes\"}, \"battery_terminals_corrision\": {\"value\": \"Yes\"}}, \"exterior\": {\"hood\": {\"value\": \"Original\"}, \"roof\": {\"value\": \"Original\"}, \"body_type\": {\"value\": \"Other\"}, \"trunk_boot\": {\"value\": \"Original\"}, \"boot_bumper\": {\"value\": \"Original\"}, \"front_bumper\": {\"value\": \"Repaired\", \"description\": \"Need paint please refr photos\"}, \"driver_side_apron\": {\"value\": \"Original\", \"description\": \"Original\"}, \"lights_functional\": {\"value\": \"Yes\"}, \"trunk_hood_aligned\": {\"value\": \"Yes\"}, \"bpiller_driver_side\": {\"value\": \"Original\"}, \"door_fender_aligned\": {\"value\": \"Yes\"}, \"passanger_side_apron\": {\"value\": \"Original\"}, \"windshield_no_cracks\": {\"value\": \"No\"}, \"rear_door_driver_side\": {\"value\": \"Original\"}, \"bpiller_passanger_side\": {\"value\": \"Original\"}, \"front_driver_side_door\": {\"value\": \"Original\"}, \"wiper_blades_functional\": {\"value\": \"Yes\"}, \"front_driver_side_fender\": {\"value\": \"Original\"}, \"rear_door_passanger_side\": {\"value\": \"Original\"}, \"front_passanger_side_fender\": {\"value\": \"Repaired\", \"description\": \"Paint as well\"}, \"front_passanger_side_piller\": {\"value\": \"Original\"}, \"rear_driver_side_quarter_paner\": {\"value\": \"Original\"}, \"rear_passanger_side_quarter_paner\": {\"value\": \"Original\"}}, \"interior\": {\"ac_works\": {\"value\": \"Yes\"}, \"heater_works\": {\"value\": \"Yes\"}, \"stereo_works\": {\"value\": \"Yes\"}, \"all_gauge_works\": {\"value\": \"Yes\"}, \"car_alarm_works\": {\"value\": \"Yes\"}, \"seats_adjust_properly\": {\"value\": \"Yes\"}, \"seats_unworn_no_cracks\": {\"value\": \"No\"}, \"windshiels_wiper_works\": {\"value\": \"Yes\"}, \"doors_open_close_freely\": {\"value\": \"Yes\"}, \"seats_equipped_seatbelt\": {\"value\": \"Yes\"}, \"trunk_open_close_freely\": {\"value\": \"Yes\"}, \"lacks_air_freshner_scent\": {}, \"head_lights_work_properly\": {\"value\": \"Yes\"}, \"sunroof_open_close_properly\": {\"value\": \"No\"}, \"wiper_fluid_dispenses_properly\": {}, \"hazard_lights_function_properly\": {\"value\": \"Yes\"}, \"power_windows_operates_properly\": {\"value\": \"Yes\"}, \"trunk_driver_door_lock_with_key\": {\"value\": \"Yes\"}, \"no_warning_light_remian_illuminated\": {\"value\": \"No\"}}, \"steering\": {\"stable\": {\"value\": \"Yes\"}, \"clunking\": {\"value\": \"No\"}, \"no_drift\": {\"value\": \"Yes\"}, \"resistance\": {\"value\": \"No\"}}, \"suspension\": {\"same_bouncing\": {\"value\": \"No\"}, \"cracking_noise\": {\"value\": \"No\"}, \"vehicle_rest_levelly\": {\"value\": \"Yes\"}}, \"miscellaneous\": {\"car_manual\": {\"value\": \"No\"}, \"owner_title\": {\"value\": \"Yes\"}, \"instructions\": {\"value\": \"No\"}}, \"manual_transmission\": {\"grinding_noise\": {\"value\": \"No\"}, \"gear_shifts_smoothly\": {\"value\": \"Yes\"}}, \"automatic_tansmission\": {\"fluid_clean\": {\"value\": \"Yes\"}, \"no_slips_delays\": {\"value\": \"Yes\"}}}','2017-11-19 15:34:08',NULL,1,'',0,'2017-11-19 10:20:35','2017-11-19 15:34:08'),(24,'Huyndai I20',45,NULL,500000,5,'Haryana','2017-02-07','2018-02-01','Zero Depth','No','123456','123456',1,'Petrol','White','I20','Magna','2017-11-20',2017,'Available ','Delhi','Manual','',20000,'{\"frame\": {\"chassis_ok\": {\"value\": \"No\"}, \"hole_without_scratches\": {\"value\": \"No\"}, \"no_crumpling_inside_trunk\": {\"value\": \"No\"}}, \"tyres\": {\"same_make\": {\"value\": \"Yes\"}, \"brand_name\": \"yes mrf\", \"spare_tyre\": {\"value\": \"Yes\"}, \"thread_worn\": {\"value\": \"Yes\"}, \"no_cuts_cracks\": {\"value\": \"Yes\"}, \"spare_tyre_inflated\": {\"value\": \"Yes\"}}, \"breaks\": {\"vss\": {\"value\": \"No\"}, \"pbedf\": {\"value\": \"Yes\"}, \"wlaab\": {\"value\": \"Yes\"}, \"grinding_noise\": {\"value\": \"No\"}}, \"engine\": {\"no_odors\": {\"value\": \"Yes\"}, \"oil_filler\": {\"value\": \"No\"}, \"fluid_leaks\": {\"value\": \"Yes\"}, \"no_black_dark_oil\": {\"value\": \"No\"}, \"exhaust_pipe_emission\": {\"value\": \"Yes\"}, \"battery_terminals_corrision\": {\"value\": \"Yes\"}}, \"exterior\": {\"hood\": {\"value\": \"Original\"}, \"roof\": {\"value\": \"Original\"}, \"body_type\": {\"value\": \"Sedan\"}, \"trunk_boot\": {\"value\": \"Original\"}, \"boot_bumper\": {\"value\": \"Original\", \"description\": \"Scratches pls refer photo\'s \"}, \"front_bumper\": {\"value\": \"Original\", \"description\": \"Need paint pls refer photo\'s \"}, \"driver_side_apron\": {\"value\": \"Original\"}, \"lights_functional\": {\"value\": \"Yes\"}, \"trunk_hood_aligned\": {\"value\": \"Yes\"}, \"bpiller_driver_side\": {\"value\": \"Original\"}, \"door_fender_aligned\": {\"value\": \"Yes\"}, \"passanger_side_apron\": {\"value\": \"Original\"}, \"windshield_no_cracks\": {\"value\": \"Yes\"}, \"rear_door_driver_side\": {\"value\": \"Original\"}, \"bpiller_passanger_side\": {\"value\": \"Original\"}, \"front_driver_side_door\": {\"value\": \"Original\"}, \"wiper_blades_functional\": {\"value\": \"Yes\"}, \"front_driver_side_fender\": {\"value\": \"Original\"}, \"rear_door_passanger_side\": {\"value\": \"Original\"}, \"front_passanger_side_fender\": {\"value\": \"Original\"}, \"front_passanger_side_piller\": {\"value\": \"Original\"}, \"rear_driver_side_quarter_paner\": {\"value\": \"Original\"}, \"rear_passanger_side_quarter_paner\": {\"value\": \"Original\"}}, \"interior\": {\"ac_works\": {\"value\": \"Yes\"}, \"heater_works\": {\"value\": \"Yes\"}, \"stereo_works\": {\"value\": \"Yes\"}, \"all_gauge_works\": {\"value\": \"Yes\"}, \"car_alarm_works\": {\"value\": \"Yes\"}, \"seats_adjust_properly\": {\"value\": \"Yes\"}, \"seats_unworn_no_cracks\": {\"value\": \"Yes\"}, \"windshiels_wiper_works\": {\"value\": \"Yes\"}, \"doors_open_close_freely\": {\"value\": \"Yes\"}, \"seats_equipped_seatbelt\": {\"value\": \"Yes\"}, \"trunk_open_close_freely\": {\"value\": \"Yes\"}, \"lacks_air_freshner_scent\": {\"value\": \"Yes\"}, \"head_lights_work_properly\": {\"value\": \"Yes\"}, \"sunroof_open_close_properly\": {\"value\": \"Yes\"}, \"wiper_fluid_dispenses_properly\": {}, \"hazard_lights_function_properly\": {\"value\": \"Yes\"}, \"power_windows_operates_properly\": {\"value\": \"Yes\"}, \"trunk_driver_door_lock_with_key\": {\"value\": \"Yes\"}, \"no_warning_light_remian_illuminated\": {\"value\": \"Yes\"}}, \"steering\": {\"stable\": {\"value\": \"No\"}, \"clunking\": {\"value\": \"No\"}, \"no_drift\": {\"value\": \"Yes\"}, \"resistance\": {\"value\": \"No\"}}, \"suspension\": {\"same_bouncing\": {\"value\": \"Yes\"}, \"cracking_noise\": {\"value\": \"No\"}, \"vehicle_rest_levelly\": {\"value\": \"Yes\"}}, \"miscellaneous\": {\"car_manual\": {\"value\": \"Yes\"}, \"owner_title\": {}, \"instructions\": {\"value\": \"Yes\"}}, \"manual_transmission\": {\"grinding_noise\": {\"value\": \"No\"}, \"gear_shifts_smoothly\": {\"value\": \"Yes\"}}, \"automatic_tansmission\": {\"fluid_clean\": {\"value\": \"Yes\"}, \"no_slips_delays\": {\"value\": \"No\"}}}','2017-11-21 16:21:07',NULL,1,'',0,'2017-11-20 11:09:24','2017-11-20 11:09:24'),(25,'sfdghjkhjkg kjhg kj',8,NULL,3243454,5,'gjhgjhjhbghj','2017-11-21','2018-03-31','Zero Depth','Yes','hjgjhjgjg','ghfhjgjjkhjkhjkhkjhk',1,'Hybrid','gfdghfghhj','hgfhgjhg','ghfghjkh','2017-11-07',2017,'fdghfhjhjgjh','gurgaon','Automatic','',1233,'{\"frame\": {\"chassis_ok\": {}, \"hole_without_scratches\": {}, \"no_crumpling_inside_trunk\": {}}, \"tyres\": {\"same_make\": {}, \"spare_tyre\": {}, \"thread_worn\": {}, \"no_cuts_cracks\": {}, \"spare_tyre_inflated\": {}}, \"breaks\": {\"vss\": {}, \"pbedf\": {}, \"wlaab\": {}, \"grinding_noise\": {}}, \"engine\": {\"no_odors\": {}, \"oil_filler\": {}, \"fluid_leaks\": {}, \"no_black_dark_oil\": {}, \"exhaust_pipe_emission\": {}, \"battery_terminals_corrision\": {}}, \"exterior\": {\"hood\": {}, \"roof\": {}, \"body_type\": {}, \"trunk_boot\": {}, \"boot_bumper\": {}, \"front_bumper\": {}, \"driver_side_apron\": {}, \"lights_functional\": {}, \"trunk_hood_aligned\": {}, \"bpiller_driver_side\": {}, \"door_fender_aligned\": {}, \"passanger_side_apron\": {}, \"windshield_no_cracks\": {}, \"rear_door_driver_side\": {}, \"bpiller_passanger_side\": {}, \"front_driver_side_door\": {}, \"wiper_blades_functional\": {}, \"front_driver_side_fender\": {}, \"rear_door_passanger_side\": {}, \"front_passanger_side_fender\": {}, \"front_passanger_side_piller\": {}, \"rear_driver_side_quarter_paner\": {}, \"rear_passanger_side_quarter_paner\": {}}, \"interior\": {\"ac_works\": {}, \"heater_works\": {}, \"stereo_works\": {}, \"all_gauge_works\": {}, \"car_alarm_works\": {}, \"seats_adjust_properly\": {}, \"seats_unworn_no_cracks\": {}, \"windshiels_wiper_works\": {}, \"doors_open_close_freely\": {}, \"seats_equipped_seatbelt\": {}, \"trunk_open_close_freely\": {}, \"lacks_air_freshner_scent\": {}, \"head_lights_work_properly\": {}, \"sunroof_open_close_properly\": {}, \"wiper_fluid_dispenses_properly\": {}, \"hazard_lights_function_properly\": {}, \"power_windows_operates_properly\": {}, \"trunk_driver_door_lock_with_key\": {}, \"no_warning_light_remian_illuminated\": {}}, \"steering\": {\"stable\": {}, \"clunking\": {}, \"no_drift\": {}, \"resistance\": {}}, \"suspension\": {\"same_bouncing\": {}, \"cracking_noise\": {}, \"vehicle_rest_levelly\": {}}, \"miscellaneous\": {\"car_manual\": {}, \"owner_title\": {}, \"instructions\": {}}, \"manual_transmission\": {\"grinding_noise\": {}, \"gear_shifts_smoothly\": {}}, \"automatic_tansmission\": {\"fluid_clean\": {}, \"no_slips_delays\": {}}}','2017-11-24 11:00:38',NULL,1,'',0,'2017-11-22 16:39:25','2017-11-22 16:39:25');
/*!40000 ALTER TABLE `db_vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_vehicle_feature_braking`
--

DROP TABLE IF EXISTS `db_vehicle_feature_braking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_vehicle_feature_braking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(400) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_vehicle_feature_braking`
--

LOCK TABLES `db_vehicle_feature_braking` WRITE;
/*!40000 ALTER TABLE `db_vehicle_feature_braking` DISABLE KEYS */;
INSERT INTO `db_vehicle_feature_braking` VALUES (1,'Anti-Lock Braking System (ABS)',0),(2,'Electronic',0),(3,'Brake-force Distribution (EBD)',0),(4,'Brake Assist (BA)',0),(5,'Electronic Stability Program (ESP)',0),(6,'Four-Wheel- Drive',0),(7,'Hill Hold Control',0),(8,'Traction Control System (TC/TCS)',0),(9,'Ride Height Adjustment',0),(10,'Hill Descent Control',0),(11,'Limited Slip Differential (LSD)',0),(12,'Differential Lock',0);
/*!40000 ALTER TABLE `db_vehicle_feature_braking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_vehicle_feature_comfort`
--

DROP TABLE IF EXISTS `db_vehicle_feature_comfort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_vehicle_feature_comfort` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(400) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_vehicle_feature_comfort`
--

LOCK TABLES `db_vehicle_feature_comfort` WRITE;
/*!40000 ALTER TABLE `db_vehicle_feature_comfort` DISABLE KEYS */;
INSERT INTO `db_vehicle_feature_comfort` VALUES (6,'Air Conditioner',0),(7,'Rear AC',0),(8,'12V Power',0),(9,'Outlets',0),(10,'Steering',0),(11,'Adjustment',0),(12,'Keyless Start/ Button Start',0),(13,'Headlight off and ignition Key Off Reminder',0),(14,'Cruise Control',0),(15,'Parking Sensors',0),(16,'Parking Assist',0),(17,'Anti-glare Mirrors',0),(18,'Vanity',0),(19,'Mirrors on Sun Visors',0),(20,'Heater',0),(21,'Cabin-Boot Access',0);
/*!40000 ALTER TABLE `db_vehicle_feature_comfort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_vehicle_feature_doors`
--

DROP TABLE IF EXISTS `db_vehicle_feature_doors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_vehicle_feature_doors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(400) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_vehicle_feature_doors`
--

LOCK TABLES `db_vehicle_feature_doors` WRITE;
/*!40000 ALTER TABLE `db_vehicle_feature_doors` DISABLE KEYS */;
INSERT INTO `db_vehicle_feature_doors` VALUES (6,'Windows',0),(7,'Mirrors & Wipers',0),(8,'One-Touch –Down',0),(9,'One-Touch – Up',0),(10,'Power Windows',0),(11,'Outside Rear View Mirrors(ORVMs)',0),(12,'Adjustable ORVM',0),(13,'Turn Indicators on ORVM',0),(14,'Rear',0),(15,'Defogger',0),(16,'Rear Wiper',0),(17,'Exterior Door Handles',0),(18,'Interior Door Handles',0),(19,'Rain-sensing',0),(20,'Wipers',0),(21,'Door Pockets',0),(22,'Door Blinds',0),(23,'Rear Window Blind',0),(24,'Boot-lid Opener',0);
/*!40000 ALTER TABLE `db_vehicle_feature_doors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_vehicle_feature_entertainment`
--

DROP TABLE IF EXISTS `db_vehicle_feature_entertainment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_vehicle_feature_entertainment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(400) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_vehicle_feature_entertainment`
--

LOCK TABLES `db_vehicle_feature_entertainment` WRITE;
/*!40000 ALTER TABLE `db_vehicle_feature_entertainment` DISABLE KEYS */;
INSERT INTO `db_vehicle_feature_entertainment` VALUES (36,'Head Unit Size',0),(37,'Display',0),(38,'Screen for Rear Passengers',0),(39,'GPS Navigation System',0),(40,'Speakers',0),(41,'USB Compatibility',0),(42,'Aux Compatibility',0),(43,'Bluetooth Compatibility',0),(44,'MP3 Playback',0),(45,'CD Player',0),(46,'AM/FM Radio',0),(47,'iPod',0),(48,'Compatibility',0),(49,'Internal Hard-drive',0),(50,'Steering mounted controls',0),(51,'Voice Command',0),(52,'Music System',0),(53,'Music',0);
/*!40000 ALTER TABLE `db_vehicle_feature_entertainment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_vehicle_feature_exterior`
--

DROP TABLE IF EXISTS `db_vehicle_feature_exterior`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_vehicle_feature_exterior` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(400) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_vehicle_feature_exterior`
--

LOCK TABLES `db_vehicle_feature_exterior` WRITE;
/*!40000 ALTER TABLE `db_vehicle_feature_exterior` DISABLE KEYS */;
INSERT INTO `db_vehicle_feature_exterior` VALUES (6,'Sunroof ',0),(7,'Roof rails',0),(8,'Roof Mounted Antenna',0),(9,'Body-Coloured Bumpers',0),(10,'Chrome Finish Exhaust pipe',0),(11,'Body Kit',0),(12,'Rub –Strips',0);
/*!40000 ALTER TABLE `db_vehicle_feature_exterior` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_vehicle_feature_instrument`
--

DROP TABLE IF EXISTS `db_vehicle_feature_instrument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_vehicle_feature_instrument` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(400) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_vehicle_feature_instrument`
--

LOCK TABLES `db_vehicle_feature_instrument` WRITE;
/*!40000 ALTER TABLE `db_vehicle_feature_instrument` DISABLE KEYS */;
INSERT INTO `db_vehicle_feature_instrument` VALUES (6,'Instrument Cluster',0),(7,'Trip Meter',0),(8,'Average Fuel',0),(9,'Consumption',0),(10,'Average Speed',0),(11,'Distance to Empty',0),(12,'Clock, Low',0),(13,'Fuel Level Warning',0),(14,'Door Ajar Warning',0),(15,'Adjustable Cluster',0),(16,'Brightness',0),(17,'Gear Indicator',0),(18,'Shift Indicator',0),(19,'Heads Up Display(HUD)',0),(20,'Tachometer ',0),(21,'Instantaneous Consumption',0);
/*!40000 ALTER TABLE `db_vehicle_feature_instrument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_vehicle_feature_lighting`
--

DROP TABLE IF EXISTS `db_vehicle_feature_lighting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_vehicle_feature_lighting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(400) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_vehicle_feature_lighting`
--

LOCK TABLES `db_vehicle_feature_lighting` WRITE;
/*!40000 ALTER TABLE `db_vehicle_feature_lighting` DISABLE KEYS */;
INSERT INTO `db_vehicle_feature_lighting` VALUES (6,'Cornering Headlights',0),(7,'Headlamps',0),(8,'Automatic Head',0),(9,'Lamps',0),(10,'Follow me home headlamps',0),(11,'Daytime Running Lights',0),(12,'Fog Lamps',0),(13,'Tail Lamps',0),(14,'Cabin Lamps',0),(15,'Headlight Height Adjuster',0),(16,'Glove Box Lamp',0),(17,'Lights on Vanity Mirrors',0),(18,'Rear Reading Lamp',0);
/*!40000 ALTER TABLE `db_vehicle_feature_lighting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_vehicle_feature_safety`
--

DROP TABLE IF EXISTS `db_vehicle_feature_safety`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_vehicle_feature_safety` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(400) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_vehicle_feature_safety`
--

LOCK TABLES `db_vehicle_feature_safety` WRITE;
/*!40000 ALTER TABLE `db_vehicle_feature_safety` DISABLE KEYS */;
INSERT INTO `db_vehicle_feature_safety` VALUES (6,'Airbags',0),(7,'Dual-Stage Airbags',0),(8,'Middle rear three-point seatbelt',0),(9,'Middle Rear Head Rest',0),(10,'Tyre Pressure Monitoring',0),(11,'System (TPMS)',0),(12,'Child Seat Anchor Points',0),(13,'Seat Belt Warning',0);
/*!40000 ALTER TABLE `db_vehicle_feature_safety` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_vehicle_feature_seats`
--

DROP TABLE IF EXISTS `db_vehicle_feature_seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_vehicle_feature_seats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(400) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_vehicle_feature_seats`
--

LOCK TABLES `db_vehicle_feature_seats` WRITE;
/*!40000 ALTER TABLE `db_vehicle_feature_seats` DISABLE KEYS */;
INSERT INTO `db_vehicle_feature_seats` VALUES (6,'Seat Upholstery',0),(7,'Leather-wrapped Steering',0),(8,'Wheel',0),(9,'Leather-wrapped Gear Knob',0),(10,'Driver Seat Adjustment',0),(11,'Head-rests',0),(12,'Front Passenger Seat Adjustment',0),(13,'Lumbar Support',0),(14,'Adjustable Lumbar Support',0),(15,'Driver Armrest',0),(16,'Rear Passenger Seats',0),(17,'Rear Passenger Adjustable seats',0),(18,'3rd Row Seats',0),(19,'3rd Row Seat Adjustment',0),(20,'Ventilated Seats',0),(21,'Ventilated Seat Type',0),(22,'Interiors Rear Armrest',0),(23,'Folding Rear Seat',0),(24,'Split Rear Seat',0),(25,'Split Third Row Seat',0),(26,'Front Seat Pockets',0),(27,'Adjustable Head-rests',0),(28,'Electrically Adjustable Headrests',0);
/*!40000 ALTER TABLE `db_vehicle_feature_seats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_vehicle_feature_security`
--

DROP TABLE IF EXISTS `db_vehicle_feature_security`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_vehicle_feature_security` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(400) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_vehicle_feature_security`
--

LOCK TABLES `db_vehicle_feature_security` WRITE;
/*!40000 ALTER TABLE `db_vehicle_feature_security` DISABLE KEYS */;
INSERT INTO `db_vehicle_feature_security` VALUES (6,'Engine immobilizer',0),(7,'Central Locking',0),(8,'Speed',0),(9,'Sensing Door Lock',0),(10,'Child Safety Lock',0);
/*!40000 ALTER TABLE `db_vehicle_feature_security` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_vehicle_feature_storage`
--

DROP TABLE IF EXISTS `db_vehicle_feature_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_vehicle_feature_storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(400) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_vehicle_feature_storage`
--

LOCK TABLES `db_vehicle_feature_storage` WRITE;
/*!40000 ALTER TABLE `db_vehicle_feature_storage` DISABLE KEYS */;
INSERT INTO `db_vehicle_feature_storage` VALUES (6,'Cup Holders',0),(7,'Driver Armrest Storage',0),(8,'Cooled Glove Box',0),(9,'Sunglass Holder',0),(10,'Third Row Cup Holders',0);
/*!40000 ALTER TABLE `db_vehicle_feature_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_vehicle_images`
--

DROP TABLE IF EXISTS `db_vehicle_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_vehicle_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleId` int(11) DEFAULT NULL,
  `url` varchar(500) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_vehicle_images`
--

LOCK TABLES `db_vehicle_images` WRITE;
/*!40000 ALTER TABLE `db_vehicle_images` DISABLE KEYS */;
INSERT INTO `db_vehicle_images` VALUES (1,1,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(2,1,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(3,1,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(4,1,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(5,2,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(6,2,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(7,2,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(8,2,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(9,3,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(10,3,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(11,3,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(12,3,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(13,4,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(14,4,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(15,5,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(16,6,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(17,6,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(18,7,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(19,8,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(20,8,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(21,9,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(22,9,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(23,10,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(24,10,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(25,11,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(26,11,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(27,12,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(28,12,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(29,13,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(30,13,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(31,13,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(32,13,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(33,13,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(34,14,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(35,14,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(36,14,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(37,14,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(38,15,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(39,15,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(40,15,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(41,15,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(42,16,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(43,17,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(44,17,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(45,17,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(46,17,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(47,18,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(48,18,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(49,18,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(50,18,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(51,19,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(52,19,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(53,19,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(54,19,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(55,20,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(56,21,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(57,22,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(58,22,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(59,22,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(60,22,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(61,22,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(62,22,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(63,22,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(64,22,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(65,22,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(66,23,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(67,23,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(68,23,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(69,23,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(70,23,'http://www.goaholidayhomes.com/cars/images/honda-city-car-hire-in-goa.jpg',0),(71,24,'http://52.163.123.122:5000/uploads/1511176146171_1511176144244.jpg',0),(72,24,'http://52.163.123.122:5000/uploads/1511176146825_1511176144823.jpg',0),(73,24,'http://52.163.123.122:5000/uploads/1511176147439_1511176145531.jpg',0),(74,24,'http://52.163.123.122:5000/uploads/1511176148008_1511176146161.jpg',0),(75,24,'http://52.163.123.122:5000/uploads/1511176148545_1511176146701.jpg',0),(76,24,'http://52.163.123.122:5000/uploads/1511176148978_1511176147112.jpg',0),(77,24,'http://52.163.123.122:5000/uploads/1511176162538_1511176160686.jpg',0),(78,24,'http://52.163.123.122:5000/uploads/1511176162998_1511176161119.jpg',0),(79,24,'http://52.163.123.122:5000/uploads/1511176163505_1511176161621.jpg',0),(80,25,'http://52.163.123.122:5000/uploads/1511368763624_1511368763351.jpg',0),(81,25,'http://52.163.123.122:5000/uploads/1511368764206_1511368763977.jpg',0);
/*!40000 ALTER TABLE `db_vehicle_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_vehicle_old`
--

DROP TABLE IF EXISTS `db_vehicle_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_vehicle_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_name` varchar(250) DEFAULT NULL,
  `sellerId` int(11) DEFAULT NULL,
  `subsellerId` int(11) DEFAULT NULL,
  `start_bid` double DEFAULT NULL,
  `passengers` int(11) DEFAULT '0',
  `registration_number` varchar(250) DEFAULT NULL,
  `reg_date` date DEFAULT NULL,
  `insurance_validation` date DEFAULT NULL,
  `insurance_type` varchar(100) DEFAULT '',
  `hpa_status` varchar(100) DEFAULT '',
  `vin_number` varchar(250) DEFAULT NULL,
  `engine_number` varchar(250) DEFAULT NULL,
  `previous_owners` int(11) DEFAULT NULL,
  `fuel_type` varchar(250) DEFAULT NULL,
  `color` varchar(250) DEFAULT NULL,
  `model` varchar(250) DEFAULT NULL,
  `variant` varchar(250) DEFAULT NULL,
  `evaluation_date` date DEFAULT NULL,
  `manufacturing_year` int(11) DEFAULT NULL,
  `rc_status` varchar(250) DEFAULT NULL,
  `location` varchar(250) DEFAULT NULL,
  `transition_type` varchar(250) DEFAULT NULL,
  `distance_travelled` double DEFAULT NULL,
  `length` double DEFAULT NULL,
  `width` double DEFAULT NULL,
  `height` double DEFAULT NULL,
  `wheelbase` double DEFAULT NULL,
  `ground_clearance` double DEFAULT NULL,
  `doors` int(11) DEFAULT NULL,
  `seating_capacity` int(11) DEFAULT NULL,
  `seating_rows` int(11) DEFAULT NULL,
  `bootspace` int(11) DEFAULT NULL,
  `fuel_tank_capacity` int(11) DEFAULT NULL,
  `engine_type` varchar(250) DEFAULT NULL,
  `volve_cylinder` varchar(250) DEFAULT NULL,
  `displacement` double DEFAULT NULL,
  `mileage` double DEFAULT NULL,
  `turbocharger` tinyint(1) DEFAULT NULL,
  `drivetrain` varchar(250) DEFAULT NULL,
  `dual_clutch` tinyint(1) DEFAULT NULL,
  `sport_mode` tinyint(1) DEFAULT NULL,
  `alternate_fuel` varchar(250) DEFAULT NULL,
  `cylinders` varchar(250) DEFAULT NULL,
  `turbocharger_type` varchar(250) DEFAULT NULL,
  `number_of_gears` int(11) DEFAULT NULL,
  `transmission_type` varchar(250) DEFAULT NULL,
  `driving_modes` varchar(250) DEFAULT NULL,
  `manual_shifting` tinyint(1) DEFAULT NULL,
  `start_stop_function` tinyint(1) DEFAULT NULL,
  `suspension_front` varchar(250) DEFAULT NULL,
  `suspension_rear` varchar(250) DEFAULT NULL,
  `front_break_type` varchar(250) DEFAULT NULL,
  `rear_break_type` varchar(250) DEFAULT NULL,
  `minimum_turning_radius` int(11) DEFAULT NULL,
  `steering_type` varchar(250) DEFAULT NULL,
  `wheels` varchar(250) DEFAULT NULL,
  `spare_wheels` varchar(250) DEFAULT NULL,
  `front_tyres` varchar(250) DEFAULT NULL,
  `rear_tyres` varchar(250) DEFAULT NULL,
  `max_power_bhp` double DEFAULT NULL,
  `max_power_rpm` double DEFAULT NULL,
  `max_torque_nm` double DEFAULT NULL,
  `max_torque_rpm` double DEFAULT NULL,
  `years_left` int(11) DEFAULT NULL,
  `km_left` int(11) DEFAULT NULL,
  `feature_entertainment` varchar(250) DEFAULT '',
  `feature_instrument` varchar(250) DEFAULT '',
  `feature_light` varchar(250) DEFAULT '',
  `feature_exterior` varchar(250) DEFAULT '',
  `feature_doors` varchar(250) DEFAULT '',
  `feature_storage` varchar(250) DEFAULT '',
  `feature_seat` varchar(250) DEFAULT '',
  `feature_comfort` varchar(250) DEFAULT '',
  `feature_lock` varchar(250) DEFAULT '',
  `feature_break` varchar(250) DEFAULT '',
  `feature_safety` varchar(250) DEFAULT '',
  `inspection_report` json DEFAULT NULL,
  `auction_start_date` date DEFAULT NULL,
  `admin_live_date` datetime DEFAULT NULL,
  `isLive` tinyint(1) DEFAULT '0',
  `vehicle_status` int(11) DEFAULT '1',
  `reject_reason` varchar(100) DEFAULT '',
  `isDeleted` tinyint(1) DEFAULT '0',
  `dateCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `dateModified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_vehicle_old`
--

LOCK TABLES `db_vehicle_old` WRITE;
/*!40000 ALTER TABLE `db_vehicle_old` DISABLE KEYS */;
INSERT INTO `db_vehicle_old` VALUES (1,'',8,NULL,68999,0,'HC HXHCHF',NULL,NULL,'','','','URUFHCHCH',0,NULL,'','','','2017-09-25',2017,'Bc Vxhchc','Hcfyf If','GHchchc',0,6865,6565,575,68665,5885,8,68,56,6868,68,'Chchc','Hfhf',NULL,NULL,1,'',0,NULL,'','','',NULL,'','',1,0,'hcfh','yfhfuf','','',NULL,NULL,'','','','',998,9868,58,98688,25,542583,'','','','','','','','','','','','{\"frame\": {\"chassis_ok\": {\"value\": \"Yes\", \"description\": \"Jfuguv\"}, \"hole_without_scratches\": {}, \"no_crumpling_inside_trunk\": {}}, \"tyres\": {\"same_make\": {\"value\": \"Yes\", \"description\": \"Hch if\"}, \"brand_name\": \"hd gx\", \"spare_tyre\": {}, \"thread_worn\": {}, \"no_cuts_cracks\": {}, \"spare_tyre_inflated\": {}}, \"breaks\": {\"vss\": {\"value\": \"No\", \"description\": \"Jfugug if\"}, \"pbedf\": {}, \"wlaab\": {}, \"grinding_noise\": {}}, \"engine\": {\"no_odors\": {}, \"oil_filler\": {}, \"fluid_leaks\": {}, \"no_black_dark_oil\": {}, \"exhaust_pipe_emission\": {}, \"battery_terminals_corrision\": {}}, \"exterior\": {\"hood\": {}, \"roof\": {}, \"no_dents\": {}, \"body_type\": {\"value\": \"Sedan\", \"description\": \"Hd hc\"}, \"trunk_boot\": {}, \"boot_bumper\": {}, \"front_bumper\": {}, \"magnet_adheres\": {}, \"freah_paint_job\": {}, \"driver_side_apron\": {}, \"lights_functional\": {}, \"no_body_scratches\": {}, \"trunk_hood_aligned\": {}, \"bpiller_driver_side\": {}, \"door_fender_aligned\": {}, \"passanger_side_apron\": {}, \"windshield_no_cracks\": {}, \"rear_door_driver_side\": {}, \"body_panel_color_match\": {}, \"bpiller_passanger_side\": {}, \"front_driver_side_door\": {}, \"wiper_blades_functional\": {}, \"front_driver_side_fender\": {}, \"rear_door_passanger_side\": {}, \"front_passanger_side_fender\": {}, \"front_passanger_side_piller\": {}, \"rear_driver_side_quarter_paner\": {}, \"rear_passanger_side_quarter_paner\": {}}, \"interior\": {\"ac_works\": {}, \"heater_works\": {}, \"stereo_works\": {}, \"all_gauge_works\": {}, \"car_alarm_works\": {}, \"seats_adjust_properly\": {}, \"seats_unworn_no_cracks\": {\"value\": \"No\", \"description\": \"Jcc JV\"}, \"windshiels_wiper_works\": {}, \"doors_open_close_freely\": {}, \"seats_equipped_seatbelt\": {}, \"trunk_open_close_freely\": {}, \"lacks_air_freshner_scent\": {}, \"head_lights_work_properly\": {}, \"sunroof_open_close_properly\": {}, \"wiper_fluid_dispenses_properly\": {}, \"hazard_lights_function_properly\": {}, \"power_windows_operates_properly\": {}, \"trunk_driver_door_lock_with_key\": {}, \"no_warning_light_remian_illuminated\": {}}, \"steering\": {\"stable\": {}, \"clunking\": {}, \"no_drift\": {}, \"resistance\": {}}, \"suspension\": {\"same_bouncing\": {}, \"cracking_noise\": {}, \"vehicle_rest_levelly\": {}}, \"miscellaneous\": {\"car_manual\": {}, \"owner_title\": {}, \"instructions\": {}}, \"manual_transmission\": {\"grinding_noise\": {}, \"gear_shifts_smoothly\": {}}, \"automatic_tansmission\": {\"fluid_clean\": {}, \"no_slips_delays\": {}}}','2017-11-14','2017-11-14 09:42:16',1,2,'',0,'2017-10-07 12:24:46','2017-11-14 09:42:16'),(2,'',8,NULL,68999,0,'HC HXHCHF',NULL,NULL,'','','','URUFHCHCH',0,NULL,'','','',NULL,2017,'Bc Vxhchc','Hcfyf If','GHchchc',0,6865,6565,575,68665,5885,8,68,56,6868,68,'Chchc','Hfhf',NULL,NULL,1,'',0,NULL,'','','',NULL,'','',1,0,'hcfh','yfhfuf','','',NULL,NULL,'','','','',998,9868,58,98688,25,542583,'','','','','','','','','','','','{\"frame\": {\"chassis_ok\": {\"value\": \"Yes\", \"description\": \"Jfuguv\"}, \"hole_without_scratches\": {}, \"no_crumpling_inside_trunk\": {}}, \"tyres\": {\"same_make\": {\"value\": \"Yes\", \"description\": \"Hch if\"}, \"brand_name\": \"hd gx\", \"spare_tyre\": {}, \"thread_worn\": {}, \"no_cuts_cracks\": {}, \"spare_tyre_inflated\": {}}, \"breaks\": {\"vss\": {\"value\": \"No\", \"description\": \"Jfugug if\"}, \"pbedf\": {}, \"wlaab\": {}, \"grinding_noise\": {}}, \"engine\": {\"no_odors\": {}, \"oil_filler\": {}, \"fluid_leaks\": {}, \"no_black_dark_oil\": {}, \"exhaust_pipe_emission\": {}, \"battery_terminals_corrision\": {}}, \"exterior\": {\"hood\": {}, \"roof\": {}, \"no_dents\": {}, \"body_type\": {\"value\": \"Sedan\", \"description\": \"Hd hc\"}, \"trunk_boot\": {}, \"boot_bumper\": {}, \"front_bumper\": {}, \"magnet_adheres\": {}, \"freah_paint_job\": {}, \"driver_side_apron\": {}, \"lights_functional\": {}, \"no_body_scratches\": {}, \"trunk_hood_aligned\": {}, \"bpiller_driver_side\": {}, \"door_fender_aligned\": {}, \"passanger_side_apron\": {}, \"windshield_no_cracks\": {}, \"rear_door_driver_side\": {}, \"body_panel_color_match\": {}, \"bpiller_passanger_side\": {}, \"front_driver_side_door\": {}, \"wiper_blades_functional\": {}, \"front_driver_side_fender\": {}, \"rear_door_passanger_side\": {}, \"front_passanger_side_fender\": {}, \"front_passanger_side_piller\": {}, \"rear_driver_side_quarter_paner\": {}, \"rear_passanger_side_quarter_paner\": {}}, \"interior\": {\"ac_works\": {}, \"heater_works\": {}, \"stereo_works\": {}, \"all_gauge_works\": {}, \"car_alarm_works\": {}, \"seats_adjust_properly\": {}, \"seats_unworn_no_cracks\": {\"value\": \"No\", \"description\": \"Jcc JV\"}, \"windshiels_wiper_works\": {}, \"doors_open_close_freely\": {}, \"seats_equipped_seatbelt\": {}, \"trunk_open_close_freely\": {}, \"lacks_air_freshner_scent\": {}, \"head_lights_work_properly\": {}, \"sunroof_open_close_properly\": {}, \"wiper_fluid_dispenses_properly\": {}, \"hazard_lights_function_properly\": {}, \"power_windows_operates_properly\": {}, \"trunk_driver_door_lock_with_key\": {}, \"no_warning_light_remian_illuminated\": {}}, \"steering\": {\"stable\": {}, \"clunking\": {}, \"no_drift\": {}, \"resistance\": {}}, \"suspension\": {\"same_bouncing\": {}, \"cracking_noise\": {}, \"vehicle_rest_levelly\": {}}, \"miscellaneous\": {\"car_manual\": {}, \"owner_title\": {}, \"instructions\": {}}, \"manual_transmission\": {\"grinding_noise\": {}, \"gear_shifts_smoothly\": {}}, \"automatic_tansmission\": {\"fluid_clean\": {}, \"no_slips_delays\": {}}}',NULL,'2017-11-09 10:49:42',1,3,'Invalid value',0,'2017-10-07 12:30:22','2017-11-13 09:17:51'),(3,'',8,NULL,68999,0,'HC HXHCHF',NULL,NULL,'','','','URUFHCHCH',0,NULL,'','','',NULL,2017,'Bc Vxhchc','Hcfyf If','GHchchc',0,6865,6565,575,68665,5885,8,68,56,6868,68,'Chchc','Hfhf',NULL,NULL,1,'',0,NULL,'','','',NULL,'','',1,0,'hcfh','yfhfuf','','',NULL,NULL,'','','','',998,9868,58,98688,25,542583,'','','','','','','','','','','','{\"frame\": {\"chassis_ok\": {\"value\": \"Yes\", \"description\": \"Jfuguv\"}, \"hole_without_scratches\": {}, \"no_crumpling_inside_trunk\": {}}, \"tyres\": {\"same_make\": {\"value\": \"Yes\", \"description\": \"Hch if\"}, \"brand_name\": \"hd gx\", \"spare_tyre\": {}, \"thread_worn\": {}, \"no_cuts_cracks\": {}, \"spare_tyre_inflated\": {}}, \"breaks\": {\"vss\": {\"value\": \"No\", \"description\": \"Jfugug if\"}, \"pbedf\": {}, \"wlaab\": {}, \"grinding_noise\": {}}, \"engine\": {\"no_odors\": {}, \"oil_filler\": {}, \"fluid_leaks\": {}, \"no_black_dark_oil\": {}, \"exhaust_pipe_emission\": {}, \"battery_terminals_corrision\": {}}, \"exterior\": {\"hood\": {}, \"roof\": {}, \"no_dents\": {}, \"body_type\": {\"value\": \"Sedan\", \"description\": \"Hd hc\"}, \"trunk_boot\": {}, \"boot_bumper\": {}, \"front_bumper\": {}, \"magnet_adheres\": {}, \"freah_paint_job\": {}, \"driver_side_apron\": {}, \"lights_functional\": {}, \"no_body_scratches\": {}, \"trunk_hood_aligned\": {}, \"bpiller_driver_side\": {}, \"door_fender_aligned\": {}, \"passanger_side_apron\": {}, \"windshield_no_cracks\": {}, \"rear_door_driver_side\": {}, \"body_panel_color_match\": {}, \"bpiller_passanger_side\": {}, \"front_driver_side_door\": {}, \"wiper_blades_functional\": {}, \"front_driver_side_fender\": {}, \"rear_door_passanger_side\": {}, \"front_passanger_side_fender\": {}, \"front_passanger_side_piller\": {}, \"rear_driver_side_quarter_paner\": {}, \"rear_passanger_side_quarter_paner\": {}}, \"interior\": {\"ac_works\": {}, \"heater_works\": {}, \"stereo_works\": {}, \"all_gauge_works\": {}, \"car_alarm_works\": {}, \"seats_adjust_properly\": {}, \"seats_unworn_no_cracks\": {\"value\": \"No\", \"description\": \"Jcc JV\"}, \"windshiels_wiper_works\": {}, \"doors_open_close_freely\": {}, \"seats_equipped_seatbelt\": {}, \"trunk_open_close_freely\": {}, \"lacks_air_freshner_scent\": {}, \"head_lights_work_properly\": {}, \"sunroof_open_close_properly\": {}, \"wiper_fluid_dispenses_properly\": {}, \"hazard_lights_function_properly\": {}, \"power_windows_operates_properly\": {}, \"trunk_driver_door_lock_with_key\": {}, \"no_warning_light_remian_illuminated\": {}}, \"steering\": {\"stable\": {}, \"clunking\": {}, \"no_drift\": {}, \"resistance\": {}}, \"suspension\": {\"same_bouncing\": {}, \"cracking_noise\": {}, \"vehicle_rest_levelly\": {}}, \"miscellaneous\": {\"car_manual\": {}, \"owner_title\": {}, \"instructions\": {}}, \"manual_transmission\": {\"grinding_noise\": {}, \"gear_shifts_smoothly\": {}}, \"automatic_tansmission\": {\"fluid_clean\": {}, \"no_slips_delays\": {}}}',NULL,'2017-11-06 16:43:55',1,3,NULL,0,'2017-10-07 12:30:47','2017-11-09 10:50:09'),(4,'',8,NULL,8988,0,'BC HCHXHC',NULL,NULL,'','','','DYDGDDHD',0,NULL,'','','',NULL,2017,'Vxgxh','Hfhcj','Jvjvjjjvjjv',0,888577,868868,8685,9898,90986,5,86,6,988,98,'Bvhhchc','Hchc',NULL,NULL,1,'',0,NULL,'','','Hxhx',NULL,'','',1,1,'hxhdyjchc','yfhffh','','',NULL,NULL,'','','','',9865,86868,8686,868,15,59898,'','','','','','','','','','','','{\"frame\": {\"chassis_ok\": {\"value\": \"Yes\", \"description\": \"Cchc\"}, \"hole_without_scratches\": {\"value\": \"Yes\"}, \"no_crumpling_inside_trunk\": {\"value\": \"Yes\", \"description\": \"Uyufuffu\"}}, \"tyres\": {\"same_make\": {\"value\": \"Yes\", \"description\": \"Hdhfu\"}, \"brand_name\": \"bcc\", \"spare_tyre\": {}, \"thread_worn\": {}, \"no_cuts_cracks\": {}, \"spare_tyre_inflated\": {}}, \"breaks\": {\"vss\": {\"value\": \"No\", \"description\": \"Hfhf\"}, \"pbedf\": {}, \"wlaab\": {}, \"grinding_noise\": {}}, \"engine\": {\"no_odors\": {}, \"oil_filler\": {}, \"fluid_leaks\": {}, \"no_black_dark_oil\": {}, \"exhaust_pipe_emission\": {}, \"battery_terminals_corrision\": {}}, \"exterior\": {\"hood\": {}, \"roof\": {}, \"no_dents\": {}, \"body_type\": {\"value\": \"Coupe\", \"description\": \"Hxh\"}, \"trunk_boot\": {}, \"boot_bumper\": {}, \"front_bumper\": {}, \"magnet_adheres\": {}, \"freah_paint_job\": {}, \"driver_side_apron\": {}, \"lights_functional\": {}, \"no_body_scratches\": {}, \"trunk_hood_aligned\": {}, \"bpiller_driver_side\": {}, \"door_fender_aligned\": {}, \"passanger_side_apron\": {}, \"windshield_no_cracks\": {}, \"rear_door_driver_side\": {}, \"body_panel_color_match\": {}, \"bpiller_passanger_side\": {}, \"front_driver_side_door\": {}, \"wiper_blades_functional\": {}, \"front_driver_side_fender\": {}, \"rear_door_passanger_side\": {}, \"front_passanger_side_fender\": {}, \"front_passanger_side_piller\": {}, \"rear_driver_side_quarter_paner\": {}, \"rear_passanger_side_quarter_paner\": {}}, \"interior\": {\"ac_works\": {}, \"heater_works\": {}, \"stereo_works\": {}, \"all_gauge_works\": {}, \"car_alarm_works\": {}, \"seats_adjust_properly\": {}, \"seats_unworn_no_cracks\": {\"value\": \"No\", \"description\": \"Bcc\"}, \"windshiels_wiper_works\": {}, \"doors_open_close_freely\": {}, \"seats_equipped_seatbelt\": {}, \"trunk_open_close_freely\": {}, \"lacks_air_freshner_scent\": {}, \"head_lights_work_properly\": {}, \"sunroof_open_close_properly\": {}, \"wiper_fluid_dispenses_properly\": {}, \"hazard_lights_function_properly\": {}, \"power_windows_operates_properly\": {}, \"trunk_driver_door_lock_with_key\": {}, \"no_warning_light_remian_illuminated\": {}}, \"steering\": {\"stable\": {}, \"clunking\": {}, \"no_drift\": {}, \"resistance\": {}}, \"suspension\": {\"same_bouncing\": {}, \"cracking_noise\": {}, \"vehicle_rest_levelly\": {}}, \"miscellaneous\": {\"car_manual\": {}, \"owner_title\": {}, \"instructions\": {}}, \"manual_transmission\": {\"grinding_noise\": {}, \"gear_shifts_smoothly\": {}}, \"automatic_tansmission\": {\"fluid_clean\": {}, \"no_slips_delays\": {}}}','2017-11-14','2017-11-14 09:42:16',1,2,'',0,'2017-10-07 12:34:07','2017-11-14 09:42:16'),(5,'',19,NULL,123456,0,'QWER',NULL,NULL,'','','VSGS','VSGSH',4,'Diesel','','','','2017-10-10',2013,'Jsjd','Hdhd','Hdhd',65,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,0,'',0,NULL,'','','',NULL,'','',0,0,'','','','',NULL,NULL,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','','','{\"frame\": {\"chassis_ok\": {}, \"hole_without_scratches\": {}, \"no_crumpling_inside_trunk\": {}}, \"tyres\": {\"same_make\": {}, \"spare_tyre\": {}, \"thread_worn\": {}, \"no_cuts_cracks\": {}, \"spare_tyre_inflated\": {}}, \"breaks\": {\"vss\": {}, \"pbedf\": {}, \"wlaab\": {}, \"grinding_noise\": {}}, \"engine\": {\"no_odors\": {}, \"oil_filler\": {}, \"fluid_leaks\": {}, \"no_black_dark_oil\": {}, \"exhaust_pipe_emission\": {}, \"battery_terminals_corrision\": {}}, \"exterior\": {\"hood\": {}, \"roof\": {}, \"no_dents\": {}, \"body_type\": {}, \"trunk_boot\": {}, \"boot_bumper\": {}, \"front_bumper\": {}, \"magnet_adheres\": {}, \"freah_paint_job\": {}, \"driver_side_apron\": {}, \"lights_functional\": {}, \"no_body_scratches\": {}, \"trunk_hood_aligned\": {}, \"bpiller_driver_side\": {}, \"door_fender_aligned\": {}, \"passanger_side_apron\": {}, \"windshield_no_cracks\": {}, \"rear_door_driver_side\": {}, \"body_panel_color_match\": {}, \"bpiller_passanger_side\": {}, \"front_driver_side_door\": {}, \"wiper_blades_functional\": {}, \"front_driver_side_fender\": {}, \"rear_door_passanger_side\": {}, \"front_passanger_side_fender\": {}, \"front_passanger_side_piller\": {}, \"rear_driver_side_quarter_paner\": {}, \"rear_passanger_side_quarter_paner\": {}}, \"interior\": {\"ac_works\": {}, \"heater_works\": {}, \"stereo_works\": {}, \"all_gauge_works\": {}, \"car_alarm_works\": {}, \"seats_adjust_properly\": {}, \"seats_unworn_no_cracks\": {}, \"windshiels_wiper_works\": {}, \"doors_open_close_freely\": {}, \"seats_equipped_seatbelt\": {}, \"trunk_open_close_freely\": {}, \"lacks_air_freshner_scent\": {}, \"head_lights_work_properly\": {}, \"sunroof_open_close_properly\": {}, \"wiper_fluid_dispenses_properly\": {}, \"hazard_lights_function_properly\": {}, \"power_windows_operates_properly\": {}, \"trunk_driver_door_lock_with_key\": {}, \"no_warning_light_remian_illuminated\": {}}, \"steering\": {\"stable\": {}, \"clunking\": {}, \"no_drift\": {}, \"resistance\": {}}, \"suspension\": {\"same_bouncing\": {}, \"cracking_noise\": {}, \"vehicle_rest_levelly\": {}}, \"miscellaneous\": {\"car_manual\": {}, \"owner_title\": {}, \"instructions\": {}}, \"manual_transmission\": {\"grinding_noise\": {}, \"gear_shifts_smoothly\": {}}, \"automatic_tansmission\": {\"fluid_clean\": {}, \"no_slips_delays\": {}}}','2017-11-14','2017-11-14 09:42:16',1,2,'',0,'2017-10-10 06:51:09','2017-11-14 09:42:16'),(6,'Bsbs',19,NULL,153,0,'BXBZ',NULL,NULL,'','','BZB',' ZB',7,'Petrol','Behd','Hsh','Nxh','2017-10-10',2014,'Bdh','Hdh','Hsh',56,94,97,97,98,98,6,57,54,78,79,'Jd','Hxh',565,NULL,0,'X',1,NULL,'d\n','dd','Gxh',NULL,'bdb','jdd',1,0,'bdhd','djdd','dd','xd',55,NULL,'xd','xx','xx','dd',949,988,895,98,95,898,'','','','','','','','','','','','{\"frame\": {\"chassis_ok\": {\"description\": \"Hdjd\"}, \"hole_without_scratches\": {}, \"no_crumpling_inside_trunk\": {}}, \"tyres\": {\"same_make\": {}, \"brand_name\": \"bdhdhd\", \"spare_tyre\": {}, \"thread_worn\": {}, \"no_cuts_cracks\": {}, \"spare_tyre_inflated\": {}}, \"breaks\": {\"vss\": {\"description\": \"Bxh\"}, \"pbedf\": {}, \"wlaab\": {}, \"grinding_noise\": {}}, \"engine\": {\"no_odors\": {}, \"oil_filler\": {}, \"fluid_leaks\": {}, \"no_black_dark_oil\": {}, \"exhaust_pipe_emission\": {}, \"battery_terminals_corrision\": {}}, \"exterior\": {\"hood\": {}, \"roof\": {}, \"no_dents\": {}, \"body_type\": {\"value\": \"Coupe\"}, \"trunk_boot\": {}, \"boot_bumper\": {}, \"front_bumper\": {\"description\": \"Hdhd\"}, \"magnet_adheres\": {}, \"freah_paint_job\": {}, \"driver_side_apron\": {\"description\": \"Hxhd\"}, \"lights_functional\": {}, \"no_body_scratches\": {}, \"trunk_hood_aligned\": {}, \"bpiller_driver_side\": {}, \"door_fender_aligned\": {}, \"passanger_side_apron\": {\"description\": \"Gxhd\"}, \"windshield_no_cracks\": {}, \"rear_door_driver_side\": {}, \"body_panel_color_match\": {}, \"bpiller_passanger_side\": {}, \"front_driver_side_door\": {}, \"wiper_blades_functional\": {}, \"front_driver_side_fender\": {\"description\": \"Hxhdh\"}, \"rear_door_passanger_side\": {}, \"front_passanger_side_fender\": {\"description\": \"Hdu\"}, \"front_passanger_side_piller\": {\"value\": \"Original\"}, \"rear_driver_side_quarter_paner\": {}, \"rear_passanger_side_quarter_paner\": {}}, \"interior\": {\"ac_works\": {}, \"heater_works\": {}, \"stereo_works\": {}, \"all_gauge_works\": {}, \"car_alarm_works\": {}, \"seats_adjust_properly\": {}, \"seats_unworn_no_cracks\": {\"description\": \"Hdhd\"}, \"windshiels_wiper_works\": {}, \"doors_open_close_freely\": {}, \"seats_equipped_seatbelt\": {}, \"trunk_open_close_freely\": {}, \"lacks_air_freshner_scent\": {}, \"head_lights_work_properly\": {}, \"sunroof_open_close_properly\": {}, \"wiper_fluid_dispenses_properly\": {}, \"hazard_lights_function_properly\": {}, \"power_windows_operates_properly\": {}, \"trunk_driver_door_lock_with_key\": {}, \"no_warning_light_remian_illuminated\": {}}, \"steering\": {\"stable\": {}, \"clunking\": {}, \"no_drift\": {}, \"resistance\": {}}, \"suspension\": {\"same_bouncing\": {}, \"cracking_noise\": {}, \"vehicle_rest_levelly\": {}}, \"miscellaneous\": {\"car_manual\": {}, \"owner_title\": {}, \"instructions\": {}}, \"manual_transmission\": {\"grinding_noise\": {}, \"gear_shifts_smoothly\": {}}, \"automatic_tansmission\": {\"fluid_clean\": {}, \"no_slips_delays\": {}}}','2017-11-14','2017-11-14 09:42:16',1,2,'',0,'2017-10-10 06:56:05','2017-11-14 09:42:16'),(7,'Dhx',33,NULL,66,0,'XGSG',NULL,NULL,'','','XHXY','XHYX',4,'Petrol','Bdhd','Gzgs','Vzhz',NULL,2013,'Jdhd','Hdud','Hdhd',6868,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,0,'',0,NULL,'','','',NULL,'','',0,0,'','','','',NULL,NULL,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','','','{\"frame\": {\"chassis_ok\": {}, \"hole_without_scratches\": {}, \"no_crumpling_inside_trunk\": {}}, \"tyres\": {\"same_make\": {}, \"spare_tyre\": {}, \"thread_worn\": {}, \"no_cuts_cracks\": {}, \"spare_tyre_inflated\": {}}, \"breaks\": {\"vss\": {}, \"pbedf\": {}, \"wlaab\": {}, \"grinding_noise\": {}}, \"engine\": {\"no_odors\": {}, \"oil_filler\": {}, \"fluid_leaks\": {}, \"no_black_dark_oil\": {}, \"exhaust_pipe_emission\": {}, \"battery_terminals_corrision\": {}}, \"exterior\": {\"hood\": {}, \"roof\": {}, \"no_dents\": {}, \"body_type\": {\"value\": \"Coupe\"}, \"trunk_boot\": {}, \"boot_bumper\": {}, \"front_bumper\": {}, \"magnet_adheres\": {}, \"freah_paint_job\": {}, \"driver_side_apron\": {}, \"lights_functional\": {}, \"no_body_scratches\": {}, \"trunk_hood_aligned\": {}, \"bpiller_driver_side\": {}, \"door_fender_aligned\": {}, \"passanger_side_apron\": {}, \"windshield_no_cracks\": {}, \"rear_door_driver_side\": {}, \"body_panel_color_match\": {}, \"bpiller_passanger_side\": {}, \"front_driver_side_door\": {}, \"wiper_blades_functional\": {}, \"front_driver_side_fender\": {}, \"rear_door_passanger_side\": {}, \"front_passanger_side_fender\": {}, \"front_passanger_side_piller\": {}, \"rear_driver_side_quarter_paner\": {}, \"rear_passanger_side_quarter_paner\": {}}, \"interior\": {\"ac_works\": {}, \"heater_works\": {}, \"stereo_works\": {}, \"all_gauge_works\": {}, \"car_alarm_works\": {}, \"seats_adjust_properly\": {}, \"seats_unworn_no_cracks\": {}, \"windshiels_wiper_works\": {}, \"doors_open_close_freely\": {}, \"seats_equipped_seatbelt\": {}, \"trunk_open_close_freely\": {}, \"lacks_air_freshner_scent\": {}, \"head_lights_work_properly\": {}, \"sunroof_open_close_properly\": {}, \"wiper_fluid_dispenses_properly\": {}, \"hazard_lights_function_properly\": {}, \"power_windows_operates_properly\": {}, \"trunk_driver_door_lock_with_key\": {}, \"no_warning_light_remian_illuminated\": {}}, \"steering\": {\"stable\": {}, \"clunking\": {}, \"no_drift\": {}, \"resistance\": {}}, \"suspension\": {\"same_bouncing\": {}, \"cracking_noise\": {}, \"vehicle_rest_levelly\": {}}, \"miscellaneous\": {\"car_manual\": {}, \"owner_title\": {}, \"instructions\": {}}, \"manual_transmission\": {\"grinding_noise\": {}, \"gear_shifts_smoothly\": {}}, \"automatic_tansmission\": {\"fluid_clean\": {}, \"no_slips_delays\": {}}}','2017-11-14','2017-11-14 09:42:16',1,2,'',0,'2017-10-15 14:04:31','2017-11-14 09:42:16'),(8,'name',8,NULL,2344545235,0,'number',NULL,NULL,'','','dfgdg','sdgdfhd',3,'Petrol/Diesel','color name','model','variant',NULL,2017,'status','location','tt',214334,23423,12423,35345,124234,235345,2,21,21,21,12,'type','werwe',231321,123.34,0,'safsdf',1,0,'CNG','sdf','ewrwer',6,'sdfs','sdfsdf',0,1,'dsfgdsf','dsgg','dsf','dsg',213,'dsafsdf','dsfsd','asfsdf','dsff','asasd',123,21432,213,123,12,1200000909,'1,2','2','1','3,4','','','','','','','','{\"frame\": {\"chassis_ok\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"hole_without_scratches\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"no_crumpling_inside_trunk\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"tyres\": {\"same_make\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"brand_name\": \"sdfsdfsdf\", \"spare_tyre\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"thread_worn\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"no_cuts_cracks\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"spare_tyre_inflated\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"breaks\": {\"vss\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"pbedf\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"wlaab\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"grinding_noise\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"engine\": {\"no_odors\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"oil_filler\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"fluid_leaks\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"no_black_dark_oil\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"exhaust_pipe_emission\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"battery_terminals_corrision\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"exterior\": {\"hood\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"no_dents\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"body_type\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"trunk_boot\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"boot_bumper\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"front_bumper\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"magnet_adheres\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"freah_paint_job\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"driver_side_apron\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"lights_functional\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"no_body_scratches\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"trunk_hood_aligned\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"bpiller_driver_side\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"door_fender_aligned\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"passanger_side_apron\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"windshield_no_cracks\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"rear_door_driver_side\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"body_panel_color_match\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"bpiller_passanger_side\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"front_driver_side_door\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"wiper_blades_functional\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"front_driver_side_fender\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"front_driver_side_piller\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"rear_door_passanger_side\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"front_passanger_side_fender\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"front_passanger_side_piller\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"rear_driver_side_quarter_paner\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"rear_passanger_side_quarter_paner\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}}, \"interior\": {\"ac_works\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"heater_works\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"stereo_works\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"all_gauge_works\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"car_alarm_works\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"seats_adjust_properly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"seats_unworn_no_cracks\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"windshiels_wiper_works\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"doors_open_close_freely\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"seats_equipped_seatbelt\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"trunk_open_close_freely\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"lacks_air_freshner_scent\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"head_lights_work_properly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"sunroof_open_close_properly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"wiper_fluid_dispenses_properly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"hazard_lights_function_properly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"power_windows_operates_properly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"trunk_driver_door_lock_with_key\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"no_warning_light_remian_illuminated\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"steering\": {\"stable\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"clunking\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"no_drift\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"resistance\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"suspension\": {\"same_bouncing\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"cracking_noise\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"vehicle_rest_levelly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"miscellaneous\": {\"car_manual\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"owner_title\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"instructions\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"manual_transmission\": {\"grinding_noise\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"gear_shifts_smoothly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"automatic_tansmission\": {\"fluid_clean\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"no_slips_delays\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}}','2017-11-14','2017-11-14 09:42:16',0,2,'',0,'2017-11-06 16:55:59','2017-11-14 09:42:16'),(9,'name',8,NULL,2344545235,0,'number',NULL,NULL,'','','dfgdg','sdgdfhd',3,'Petrol/Diesel','color name','model','variant',NULL,2017,'status','location','tt',214334,23423,12423,35345,124234,235345,2,21,21,21,12,'type','werwe',231321,123.34,0,'safsdf',1,0,'CNG','sdf','ewrwer',6,'sdfs','sdfsdf',0,1,'dsfgdsf','dsgg','dsf','dsg',213,'dsafsdf','dsfsd','asfsdf','dsff','asasd',123,21432,213,123,12,1200000909,'1,2','2','1','3,4','','','','','','','','{\"frame\": {\"chassis_ok\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"hole_without_scratches\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"no_crumpling_inside_trunk\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"tyres\": {\"same_make\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"brand_name\": \"sdfsdfsdf\", \"spare_tyre\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"thread_worn\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"no_cuts_cracks\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"spare_tyre_inflated\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"breaks\": {\"vss\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"pbedf\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"wlaab\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"grinding_noise\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"engine\": {\"no_odors\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"oil_filler\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"fluid_leaks\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"no_black_dark_oil\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"exhaust_pipe_emission\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"battery_terminals_corrision\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"exterior\": {\"hood\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"no_dents\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"body_type\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"trunk_boot\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"boot_bumper\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"front_bumper\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"magnet_adheres\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"freah_paint_job\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"driver_side_apron\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"lights_functional\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"no_body_scratches\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"trunk_hood_aligned\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"bpiller_driver_side\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"door_fender_aligned\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"passanger_side_apron\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"windshield_no_cracks\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"rear_door_driver_side\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"body_panel_color_match\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"bpiller_passanger_side\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"front_driver_side_door\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"wiper_blades_functional\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"front_driver_side_fender\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"front_driver_side_piller\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"rear_door_passanger_side\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"front_passanger_side_fender\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"front_passanger_side_piller\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"rear_driver_side_quarter_paner\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"rear_passanger_side_quarter_paner\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}}, \"interior\": {\"ac_works\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"heater_works\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"stereo_works\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"all_gauge_works\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"car_alarm_works\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"seats_adjust_properly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"seats_unworn_no_cracks\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"windshiels_wiper_works\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"doors_open_close_freely\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"seats_equipped_seatbelt\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"trunk_open_close_freely\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"lacks_air_freshner_scent\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"head_lights_work_properly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"sunroof_open_close_properly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"wiper_fluid_dispenses_properly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"hazard_lights_function_properly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"power_windows_operates_properly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"trunk_driver_door_lock_with_key\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"no_warning_light_remian_illuminated\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"steering\": {\"stable\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"clunking\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"no_drift\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"resistance\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"suspension\": {\"same_bouncing\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"cracking_noise\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"vehicle_rest_levelly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"miscellaneous\": {\"car_manual\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"owner_title\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"instructions\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"manual_transmission\": {\"grinding_noise\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"gear_shifts_smoothly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"automatic_tansmission\": {\"fluid_clean\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"no_slips_delays\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}}','2017-11-14','2017-11-14 09:42:16',0,2,'',0,'2017-11-06 16:56:53','2017-11-14 09:42:16'),(10,'name',8,NULL,2344545235,0,'number',NULL,NULL,'','','dfgdg','sdgdfhd',3,'Petrol/Diesel','color name','model','variant',NULL,2017,'status','location','tt',214334,23423,12423,35345,124234,235345,2,21,21,21,12,'type','werwe',231321,123.34,0,'safsdf',1,0,'CNG','sdf','ewrwer',6,'sdfs','sdfsdf',0,1,'dsfgdsf','dsgg','dsf','dsg',213,'dsafsdf','dsfsd','asfsdf','dsff','asasd',123,21432,213,123,12,1200000909,'1,2','2','1','3,4','','','','','','','','{\"frame\": {\"chassis_ok\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"hole_without_scratches\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"no_crumpling_inside_trunk\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"tyres\": {\"same_make\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"brand_name\": \"sdfsdfsdf\", \"spare_tyre\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"thread_worn\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"no_cuts_cracks\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"spare_tyre_inflated\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"breaks\": {\"vss\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"pbedf\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"wlaab\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"grinding_noise\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"engine\": {\"no_odors\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"oil_filler\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"fluid_leaks\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"no_black_dark_oil\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"exhaust_pipe_emission\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"battery_terminals_corrision\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"exterior\": {\"hood\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"no_dents\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"body_type\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"trunk_boot\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"boot_bumper\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"front_bumper\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"magnet_adheres\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"freah_paint_job\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"driver_side_apron\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"lights_functional\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"no_body_scratches\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"trunk_hood_aligned\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"bpiller_driver_side\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"door_fender_aligned\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"passanger_side_apron\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"windshield_no_cracks\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"rear_door_driver_side\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"body_panel_color_match\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"bpiller_passanger_side\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"front_driver_side_door\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"wiper_blades_functional\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"front_driver_side_fender\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"front_driver_side_piller\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"rear_door_passanger_side\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"front_passanger_side_fender\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"front_passanger_side_piller\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"rear_driver_side_quarter_paner\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"rear_passanger_side_quarter_paner\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}}, \"interior\": {\"ac_works\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"heater_works\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"stereo_works\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"all_gauge_works\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"car_alarm_works\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"seats_adjust_properly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"seats_unworn_no_cracks\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"windshiels_wiper_works\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"doors_open_close_freely\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"seats_equipped_seatbelt\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"trunk_open_close_freely\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"lacks_air_freshner_scent\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"head_lights_work_properly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"sunroof_open_close_properly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"wiper_fluid_dispenses_properly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"hazard_lights_function_properly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"power_windows_operates_properly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"trunk_driver_door_lock_with_key\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"no_warning_light_remian_illuminated\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"steering\": {\"stable\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"clunking\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"no_drift\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"resistance\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"suspension\": {\"same_bouncing\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"cracking_noise\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"vehicle_rest_levelly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"miscellaneous\": {\"car_manual\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"owner_title\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"instructions\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"manual_transmission\": {\"grinding_noise\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"gear_shifts_smoothly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"automatic_tansmission\": {\"fluid_clean\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"no_slips_delays\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}}','2017-11-14','2017-11-14 09:42:16',0,2,'',0,'2017-11-06 16:56:53','2017-11-14 09:42:16'),(11,'name',8,NULL,2344545235,0,'number',NULL,NULL,'','','dfgdg','sdgdfhd',3,'Petrol/Diesel','color name','model','variant',NULL,2017,'status','location','tt',214334,23423,12423,35345,124234,235345,2,21,21,21,12,'type','werwe',231321,123.34,0,'safsdf',1,0,'CNG','sdf','ewrwer',6,'sdfs','sdfsdf',0,1,'dsfgdsf','dsgg','dsf','dsg',213,'dsafsdf','dsfsd','asfsdf','dsff','asasd',123,21432,213,123,12,1200000909,'1,2','2','1','3,4','','','','','','','','{\"frame\": {\"chassis_ok\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"hole_without_scratches\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"no_crumpling_inside_trunk\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"tyres\": {\"same_make\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"brand_name\": \"sdfsdfsdf\", \"spare_tyre\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"thread_worn\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"no_cuts_cracks\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"spare_tyre_inflated\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"breaks\": {\"vss\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"pbedf\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"wlaab\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"grinding_noise\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"engine\": {\"no_odors\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"oil_filler\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"fluid_leaks\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"no_black_dark_oil\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"exhaust_pipe_emission\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"battery_terminals_corrision\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"exterior\": {\"hood\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"no_dents\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"body_type\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"trunk_boot\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"boot_bumper\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"front_bumper\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"magnet_adheres\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"freah_paint_job\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"driver_side_apron\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"lights_functional\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"no_body_scratches\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"trunk_hood_aligned\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"bpiller_driver_side\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"door_fender_aligned\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"passanger_side_apron\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"windshield_no_cracks\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"rear_door_driver_side\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"body_panel_color_match\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"bpiller_passanger_side\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"front_driver_side_door\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"wiper_blades_functional\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"front_driver_side_fender\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"front_driver_side_piller\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"rear_door_passanger_side\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"front_passanger_side_fender\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"front_passanger_side_piller\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"rear_driver_side_quarter_paner\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"rear_passanger_side_quarter_paner\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}}, \"interior\": {\"ac_works\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"heater_works\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"stereo_works\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"all_gauge_works\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"car_alarm_works\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"seats_adjust_properly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"seats_unworn_no_cracks\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"windshiels_wiper_works\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"doors_open_close_freely\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"seats_equipped_seatbelt\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"trunk_open_close_freely\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"lacks_air_freshner_scent\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"head_lights_work_properly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"sunroof_open_close_properly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"wiper_fluid_dispenses_properly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"hazard_lights_function_properly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"power_windows_operates_properly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"trunk_driver_door_lock_with_key\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"no_warning_light_remian_illuminated\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"steering\": {\"stable\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"clunking\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"no_drift\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"resistance\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"suspension\": {\"same_bouncing\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"cracking_noise\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"vehicle_rest_levelly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"miscellaneous\": {\"car_manual\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"owner_title\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"instructions\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"manual_transmission\": {\"grinding_noise\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"gear_shifts_smoothly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"automatic_tansmission\": {\"fluid_clean\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"no_slips_delays\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}}','2017-11-14','2017-11-14 09:42:16',0,2,'',0,'2017-11-06 16:56:54','2017-11-14 09:42:16'),(12,'name',8,NULL,2344545235,0,'number',NULL,NULL,'','','dfgdg','sdgdfhd',3,'Petrol/Diesel','color name','model','variant',NULL,2017,'status','location','tt',214334,23423,12423,35345,124234,235345,2,21,21,21,12,'type','werwe',231321,123.34,0,'safsdf',1,0,'CNG','sdf','ewrwer',6,'sdfs','sdfsdf',0,1,'dsfgdsf','dsgg','dsf','dsg',213,'dsafsdf','dsfsd','asfsdf','dsff','asasd',123,21432,213,123,12,1200000909,'1,2','2','1','3,4','','','','','','','','{\"frame\": {\"chassis_ok\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"hole_without_scratches\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"no_crumpling_inside_trunk\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"tyres\": {\"same_make\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"brand_name\": \"sdfsdfsdf\", \"spare_tyre\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"thread_worn\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"no_cuts_cracks\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"spare_tyre_inflated\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"breaks\": {\"vss\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"pbedf\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"wlaab\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"grinding_noise\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"engine\": {\"no_odors\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"oil_filler\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"fluid_leaks\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"no_black_dark_oil\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"exhaust_pipe_emission\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"battery_terminals_corrision\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"exterior\": {\"hood\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"no_dents\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"body_type\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"trunk_boot\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"boot_bumper\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"front_bumper\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"magnet_adheres\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"freah_paint_job\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"driver_side_apron\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"lights_functional\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"no_body_scratches\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"trunk_hood_aligned\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"bpiller_driver_side\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"door_fender_aligned\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"passanger_side_apron\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"windshield_no_cracks\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"rear_door_driver_side\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"body_panel_color_match\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"bpiller_passanger_side\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"front_driver_side_door\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"wiper_blades_functional\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"front_driver_side_fender\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"front_driver_side_piller\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"rear_door_passanger_side\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"front_passanger_side_fender\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"front_passanger_side_piller\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"rear_driver_side_quarter_paner\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}, \"rear_passanger_side_quarter_paner\": {\"value\": \"option_selected\", \"description\": \"dsfsdfs\"}}, \"interior\": {\"ac_works\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"heater_works\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"stereo_works\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"all_gauge_works\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"car_alarm_works\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"seats_adjust_properly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"seats_unworn_no_cracks\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"windshiels_wiper_works\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"doors_open_close_freely\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"seats_equipped_seatbelt\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"trunk_open_close_freely\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"lacks_air_freshner_scent\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"head_lights_work_properly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"sunroof_open_close_properly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"wiper_fluid_dispenses_properly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"hazard_lights_function_properly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"power_windows_operates_properly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"trunk_driver_door_lock_with_key\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"no_warning_light_remian_illuminated\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"steering\": {\"stable\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"clunking\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"no_drift\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"resistance\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"suspension\": {\"same_bouncing\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"cracking_noise\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"vehicle_rest_levelly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"miscellaneous\": {\"car_manual\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"owner_title\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"instructions\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"manual_transmission\": {\"grinding_noise\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"gear_shifts_smoothly\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}, \"automatic_tansmission\": {\"fluid_clean\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}, \"no_slips_delays\": {\"value\": \"Yes/No/Empty\", \"description\": \"dsfsdfs\"}}}','2017-11-14','2017-11-14 09:42:16',0,2,'',0,'2017-11-06 16:56:55','2017-11-14 09:42:16'),(13,'Bmw',40,NULL,2000000,0,'sdef',NULL,NULL,'','','wdwdw','iiugdhgd',8,'Petrol','dwsd','s2013','vdi','2017-08-11',2008,'original','jhgcjhj\\s','wdhghwjd',35674653,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,0,'',0,NULL,'','','',NULL,'','',0,0,'','','','',NULL,NULL,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','','','{\"frame\": {\"chassis_ok\": {}, \"hole_without_scratches\": {}, \"no_crumpling_inside_trunk\": {}}, \"tyres\": {\"same_make\": {}, \"spare_tyre\": {}, \"thread_worn\": {}, \"no_cuts_cracks\": {}, \"spare_tyre_inflated\": {}}, \"breaks\": {\"vss\": {}, \"pbedf\": {}, \"wlaab\": {}, \"grinding_noise\": {}}, \"engine\": {\"no_odors\": {}, \"oil_filler\": {}, \"fluid_leaks\": {}, \"no_black_dark_oil\": {}, \"exhaust_pipe_emission\": {}, \"battery_terminals_corrision\": {}}, \"exterior\": {\"hood\": {\"value\": \"Repaired\"}, \"roof\": {}, \"no_dents\": {}, \"body_type\": {\"value\": \"Sedan\", \"description\": \"jgdvejsgdjsjxjajxvjavxvajvxjvajxvjavxjvajvxhavxhvajxvjavxhjvaasxjva\"}, \"trunk_boot\": {}, \"boot_bumper\": {}, \"front_bumper\": {}, \"magnet_adheres\": {}, \"freah_paint_job\": {}, \"driver_side_apron\": {}, \"lights_functional\": {}, \"no_body_scratches\": {}, \"trunk_hood_aligned\": {}, \"bpiller_driver_side\": {}, \"door_fender_aligned\": {}, \"passanger_side_apron\": {}, \"windshield_no_cracks\": {}, \"rear_door_driver_side\": {}, \"body_panel_color_match\": {}, \"bpiller_passanger_side\": {}, \"front_driver_side_door\": {}, \"wiper_blades_functional\": {}, \"front_driver_side_fender\": {}, \"rear_door_passanger_side\": {}, \"front_passanger_side_fender\": {}, \"front_passanger_side_piller\": {}, \"rear_driver_side_quarter_paner\": {}, \"rear_passanger_side_quarter_paner\": {}}, \"interior\": {\"ac_works\": {}, \"heater_works\": {}, \"stereo_works\": {}, \"all_gauge_works\": {}, \"car_alarm_works\": {}, \"seats_adjust_properly\": {}, \"seats_unworn_no_cracks\": {}, \"windshiels_wiper_works\": {}, \"doors_open_close_freely\": {}, \"seats_equipped_seatbelt\": {}, \"trunk_open_close_freely\": {}, \"lacks_air_freshner_scent\": {}, \"head_lights_work_properly\": {}, \"sunroof_open_close_properly\": {}, \"wiper_fluid_dispenses_properly\": {}, \"hazard_lights_function_properly\": {}, \"power_windows_operates_properly\": {}, \"trunk_driver_door_lock_with_key\": {}, \"no_warning_light_remian_illuminated\": {}}, \"steering\": {\"stable\": {}, \"clunking\": {}, \"no_drift\": {}, \"resistance\": {}}, \"suspension\": {\"same_bouncing\": {}, \"cracking_noise\": {}, \"vehicle_rest_levelly\": {}}, \"miscellaneous\": {\"car_manual\": {}, \"owner_title\": {}, \"instructions\": {}}, \"manual_transmission\": {\"grinding_noise\": {}, \"gear_shifts_smoothly\": {}}, \"automatic_tansmission\": {\"fluid_clean\": {}, \"no_slips_delays\": {}}}','2017-11-14','2017-11-14 09:42:16',0,2,'',0,'2017-11-07 19:24:27','2017-11-14 09:42:16'),(14,'Shusudeuhshdh',8,NULL,1347774,5,'Hshsdudu','2017-11-14','2017-12-12','Third Party','Yes','HWHDUDUD','SHUSDUDU',1,'Hybrid','Red','','','2017-12-12',2017,'Sjjdxjh','Hshdhdhd','Dududuudududu',1244,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','','','{\"frame\": {\"chassis_ok\": {}, \"hole_without_scratches\": {}, \"no_crumpling_inside_trunk\": {}}, \"tyres\": {\"same_make\": {}, \"spare_tyre\": {}, \"thread_worn\": {}, \"no_cuts_cracks\": {}, \"spare_tyre_inflated\": {}}, \"breaks\": {\"vss\": {}, \"pbedf\": {}, \"wlaab\": {}, \"grinding_noise\": {}}, \"engine\": {\"no_odors\": {}, \"oil_filler\": {}, \"fluid_leaks\": {}, \"no_black_dark_oil\": {}, \"exhaust_pipe_emission\": {}, \"battery_terminals_corrision\": {}}, \"exterior\": {\"hood\": {\"value\": \"Original\", \"description\": \"Susudidi\"}, \"roof\": {}, \"body_type\": {\"value\": \"Sedan\", \"description\": \"Sehdhhd\"}, \"trunk_boot\": {}, \"boot_bumper\": {}, \"front_bumper\": {}, \"driver_side_apron\": {}, \"lights_functional\": {}, \"trunk_hood_aligned\": {}, \"bpiller_driver_side\": {}, \"door_fender_aligned\": {}, \"passanger_side_apron\": {}, \"windshield_no_cracks\": {}, \"rear_door_driver_side\": {}, \"bpiller_passanger_side\": {}, \"front_driver_side_door\": {}, \"wiper_blades_functional\": {}, \"front_driver_side_fender\": {}, \"rear_door_passanger_side\": {}, \"front_passanger_side_fender\": {}, \"front_passanger_side_piller\": {}, \"rear_driver_side_quarter_paner\": {}, \"rear_passanger_side_quarter_paner\": {}}, \"interior\": {\"ac_works\": {}, \"heater_works\": {}, \"stereo_works\": {}, \"all_gauge_works\": {}, \"car_alarm_works\": {}, \"seats_adjust_properly\": {}, \"seats_unworn_no_cracks\": {}, \"windshiels_wiper_works\": {}, \"doors_open_close_freely\": {}, \"seats_equipped_seatbelt\": {}, \"trunk_open_close_freely\": {}, \"lacks_air_freshner_scent\": {}, \"head_lights_work_properly\": {}, \"sunroof_open_close_properly\": {}, \"wiper_fluid_dispenses_properly\": {}, \"hazard_lights_function_properly\": {}, \"power_windows_operates_properly\": {}, \"trunk_driver_door_lock_with_key\": {}, \"no_warning_light_remian_illuminated\": {}}, \"steering\": {\"stable\": {}, \"clunking\": {}, \"no_drift\": {}, \"resistance\": {}}, \"suspension\": {\"same_bouncing\": {}, \"cracking_noise\": {}, \"vehicle_rest_levelly\": {}}, \"miscellaneous\": {\"car_manual\": {}, \"owner_title\": {}, \"instructions\": {}}, \"manual_transmission\": {\"grinding_noise\": {}, \"gear_shifts_smoothly\": {}}, \"automatic_tansmission\": {\"fluid_clean\": {}, \"no_slips_delays\": {}}}',NULL,NULL,0,1,'',0,'2017-11-14 17:08:03','2017-11-14 17:08:03'),(15,'Shusudeuhshdh',8,NULL,1347774,5,'Hshsdudu','2017-11-14','2017-12-12','Third Party','Yes','HWHDUDUD','SHUSDUDU',1,'Hybrid','Red','','','2017-12-12',2017,'Sjjdxjh','Hshdhdhd','Dududuudududu',1244,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','','','{\"frame\": {\"chassis_ok\": {}, \"hole_without_scratches\": {}, \"no_crumpling_inside_trunk\": {}}, \"tyres\": {\"same_make\": {}, \"spare_tyre\": {}, \"thread_worn\": {}, \"no_cuts_cracks\": {}, \"spare_tyre_inflated\": {}}, \"breaks\": {\"vss\": {}, \"pbedf\": {}, \"wlaab\": {}, \"grinding_noise\": {}}, \"engine\": {\"no_odors\": {}, \"oil_filler\": {}, \"fluid_leaks\": {}, \"no_black_dark_oil\": {}, \"exhaust_pipe_emission\": {}, \"battery_terminals_corrision\": {}}, \"exterior\": {\"hood\": {\"value\": \"Original\", \"description\": \"Susudidi\"}, \"roof\": {}, \"body_type\": {\"value\": \"Sedan\", \"description\": \"Sehdhhd\"}, \"trunk_boot\": {}, \"boot_bumper\": {}, \"front_bumper\": {}, \"driver_side_apron\": {}, \"lights_functional\": {}, \"trunk_hood_aligned\": {}, \"bpiller_driver_side\": {}, \"door_fender_aligned\": {}, \"passanger_side_apron\": {}, \"windshield_no_cracks\": {}, \"rear_door_driver_side\": {}, \"bpiller_passanger_side\": {}, \"front_driver_side_door\": {}, \"wiper_blades_functional\": {}, \"front_driver_side_fender\": {}, \"rear_door_passanger_side\": {}, \"front_passanger_side_fender\": {}, \"front_passanger_side_piller\": {}, \"rear_driver_side_quarter_paner\": {}, \"rear_passanger_side_quarter_paner\": {}}, \"interior\": {\"ac_works\": {}, \"heater_works\": {}, \"stereo_works\": {}, \"all_gauge_works\": {}, \"car_alarm_works\": {}, \"seats_adjust_properly\": {}, \"seats_unworn_no_cracks\": {}, \"windshiels_wiper_works\": {}, \"doors_open_close_freely\": {}, \"seats_equipped_seatbelt\": {}, \"trunk_open_close_freely\": {}, \"lacks_air_freshner_scent\": {}, \"head_lights_work_properly\": {}, \"sunroof_open_close_properly\": {}, \"wiper_fluid_dispenses_properly\": {}, \"hazard_lights_function_properly\": {}, \"power_windows_operates_properly\": {}, \"trunk_driver_door_lock_with_key\": {}, \"no_warning_light_remian_illuminated\": {}}, \"steering\": {\"stable\": {}, \"clunking\": {}, \"no_drift\": {}, \"resistance\": {}}, \"suspension\": {\"same_bouncing\": {}, \"cracking_noise\": {}, \"vehicle_rest_levelly\": {}}, \"miscellaneous\": {\"car_manual\": {}, \"owner_title\": {}, \"instructions\": {}}, \"manual_transmission\": {\"grinding_noise\": {}, \"gear_shifts_smoothly\": {}}, \"automatic_tansmission\": {\"fluid_clean\": {}, \"no_slips_delays\": {}}}',NULL,NULL,0,1,'',0,'2017-11-14 17:13:25','2017-11-14 17:13:25'),(16,'Hehejeijdjdhd',8,NULL,1446663,2,'Heudufuruueyyr','2017-11-15','2017-11-30','Zero Depth','Yes','HEUDUFURRU','DUURURU',1,'Hybrid','','','','2017-11-15',2017,'Original','Jejdidirirjfjfjrj','Automatic',1245,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','','','{\"frame\": {\"chassis_ok\": {}, \"hole_without_scratches\": {}, \"no_crumpling_inside_trunk\": {}}, \"tyres\": {\"same_make\": {}, \"spare_tyre\": {}, \"thread_worn\": {}, \"no_cuts_cracks\": {}, \"spare_tyre_inflated\": {}}, \"breaks\": {\"vss\": {}, \"pbedf\": {}, \"wlaab\": {}, \"grinding_noise\": {}}, \"engine\": {\"no_odors\": {}, \"oil_filler\": {}, \"fluid_leaks\": {}, \"no_black_dark_oil\": {}, \"exhaust_pipe_emission\": {}, \"battery_terminals_corrision\": {}}, \"exterior\": {\"hood\": {}, \"roof\": {}, \"body_type\": {}, \"trunk_boot\": {}, \"boot_bumper\": {}, \"front_bumper\": {}, \"driver_side_apron\": {}, \"lights_functional\": {}, \"trunk_hood_aligned\": {}, \"bpiller_driver_side\": {}, \"door_fender_aligned\": {}, \"passanger_side_apron\": {}, \"windshield_no_cracks\": {}, \"rear_door_driver_side\": {}, \"bpiller_passanger_side\": {}, \"front_driver_side_door\": {}, \"wiper_blades_functional\": {}, \"front_driver_side_fender\": {}, \"rear_door_passanger_side\": {}, \"front_passanger_side_fender\": {}, \"front_passanger_side_piller\": {}, \"rear_driver_side_quarter_paner\": {}, \"rear_passanger_side_quarter_paner\": {}}, \"interior\": {\"ac_works\": {}, \"heater_works\": {}, \"stereo_works\": {}, \"all_gauge_works\": {}, \"car_alarm_works\": {}, \"seats_adjust_properly\": {}, \"seats_unworn_no_cracks\": {}, \"windshiels_wiper_works\": {}, \"doors_open_close_freely\": {}, \"seats_equipped_seatbelt\": {}, \"trunk_open_close_freely\": {}, \"lacks_air_freshner_scent\": {}, \"head_lights_work_properly\": {}, \"sunroof_open_close_properly\": {}, \"wiper_fluid_dispenses_properly\": {}, \"hazard_lights_function_properly\": {}, \"power_windows_operates_properly\": {}, \"trunk_driver_door_lock_with_key\": {}, \"no_warning_light_remian_illuminated\": {}}, \"steering\": {\"stable\": {}, \"clunking\": {}, \"no_drift\": {}, \"resistance\": {}}, \"suspension\": {\"same_bouncing\": {}, \"cracking_noise\": {}, \"vehicle_rest_levelly\": {}}, \"miscellaneous\": {\"car_manual\": {}, \"owner_title\": {}, \"instructions\": {}}, \"manual_transmission\": {\"grinding_noise\": {}, \"gear_shifts_smoothly\": {}}, \"automatic_tansmission\": {\"fluid_clean\": {}, \"no_slips_delays\": {}}}',NULL,NULL,0,1,'',0,'2017-11-14 18:51:51','2017-11-14 18:51:51');
/*!40000 ALTER TABLE `db_vehicle_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'askwheels_updated'
--

--
-- Dumping routines for database 'askwheels_updated'
--
/*!50003 DROP FUNCTION IF EXISTS `fnc_get_max_bid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fnc_get_max_bid`(vehicleId int) RETURNS double
    DETERMINISTIC
BEGIN

    DECLARE maxBid double default 0;
 
	SELECT 
    IFNULL(MAX(B.amount), 0)
INTO maxBid FROM
    db_bids B
WHERE
    B.vehicleId = vehicleId;
    
	RETURN (maxBid);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fnc_get_subseller_vehicle_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fnc_get_subseller_vehicle_count`(subsellerId int) RETURNS int(11)
    DETERMINISTIC
BEGIN

    DECLARE vehicle_count int default 0;
 
	SELECT COUNT(VEHICLE.id) INTO vehicle_count
	FROM db_vehicle VEHICLE
	WHERE VEHICLE.isDeleted=false
	AND VEHICLE.subsellerId=subsellerId;
 
	RETURN (vehicle_count);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fnc_get_user_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fnc_get_user_name`(userId int) RETURNS varchar(500) CHARSET utf8
    DETERMINISTIC
BEGIN

    DECLARE user_name varchar(500) default '';
 
	SELECT 
	CONCAT_WS(' ',
	IFNULL(USER.firstName,''),
	IFNULL(USER.lastName,'')) INTO user_name
	FROM db_users USER
	WHERE USER.id=userId;
 
	RETURN (user_name);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fnc_get_user_total_bid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fnc_get_user_total_bid`(userId int, vehicleId int) RETURNS double
    DETERMINISTIC
BEGIN

    DECLARE totalBid double default 0;
 
	SELECT 
    IFNULL(SUM(B.amount), 0)
INTO totalBid FROM
    db_bids B
WHERE
    B.biddingStatus = 1
        AND B.userId = userId
		AND B.vehicleId<>vehicleId;
    
	RETURN (totalBid);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fnc_get_vehicle_image` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fnc_get_vehicle_image`(vehicleId int) RETURNS varchar(250) CHARSET utf8
    DETERMINISTIC
BEGIN

    DECLARE image varchar(250);
 
	SELECT ifnull(V.url,'') INTO image
	from db_vehicle_images V WHERE V.vehicleId=vehicleId
	AND V.isDeleted=false
	limit 1;
 
	RETURN (image);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_add_bid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_add_bid`(IN vehicleId INT,IN dealerId INT, IN amount DOUBLE)
BEGIN
	
    UPDATE db_bids BID SET BID.biddingStatus=2 WHERE 
    BID.vehicleId=vehicleId 
    AND BID.userId=dealerId;
    
    INSERT INTO `db_bids`(`vehicleId`,`userId`,`amount`) values(vehicleId,dealerId,amount);
         
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_admin_dashboard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_admin_dashboard`()
BEGIN
         
	#Pending Auctions
	SELECT 
	COUNT(VEHICLE.id) AS pendingAuctions
	FROM db_vehicle VEHICLE

	WHERE

	VEHICLE.isDeleted=FALSE
	AND VEHICLE.vehicle_status=1
	AND (VEHICLE.admin_live_date IS NULL);

	#Pending Seller
	SELECT 
	COUNT(USERS.id) AS pendingSellers
	FROM db_users AS USERS
	JOIN db_user_in_roles UR ON USERS.id=UR.userId
	WHERE USERS.isLive=FALSE
	AND USERS.isDeleted=FALSE
	AND UR.roleId=1;

	#Pending Dealer
	SELECT 
	COUNT(USERS.id) AS pendingDealers
	FROM db_users AS USERS
	JOIN db_user_in_roles UR ON USERS.id=UR.userId
	WHERE USERS.isLive=FALSE
	AND USERS.isDeleted=FALSE
	AND UR.roleId=3;


	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dealer_auctions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_dealer_auctions`(
IN auctionType INT,
in pageNo INT,
in pageSize INT)
BEGIN
         
	DROP TEMPORARY TABLE IF EXISTS RESULT;
	CREATE TEMPORARY TABLE RESULT
         

	#Live Auctions
	
	SELECT 
	VEHICLE.id AS vehicleId,
	VEHICLE.vehicle_name,
	fnc_get_vehicle_image(VEHICLE.id) as imageUrl,
	VEHICLE.registration_number,
	VEHICLE.manufacturing_year,
	VEHICLE.rc_status,
	VEHICLE.location,
	VEHICLE.distance_travelled,
	VEHICLE.fuel_type,
	VEHICLE.transmission_type,
	VEHICLE.admin_live_date,
	0 AS highestBid,
	1 AS auctionType,
	0 AS lastBid,
	false AS isWatchList 

	FROM db_vehicle VEHICLE

	WHERE

	VEHICLE.isDeleted=FALSE
	AND VEHICLE.vehicle_status=2
	AND (auctionType=0 OR auctionType=1)
	AND (VEHICLE.admin_live_date is NOT NULL 
		AND DATE_ADD(VEHICLE.admin_live_date,INTERVAL 1 DAY)>=NOW())

	#Upcoming Auctions
	
	UNION

	SELECT 
	VEHICLE.id AS vehicleId,
	VEHICLE.vehicle_name,
	fnc_get_vehicle_image(VEHICLE.id) as imageUrl,
	VEHICLE.registration_number,
	VEHICLE.manufacturing_year,
	VEHICLE.rc_status,
	VEHICLE.location,
	VEHICLE.distance_travelled,
	VEHICLE.fuel_type,
	VEHICLE.transmission_type,
	VEHICLE.admin_live_date,
	0 AS highestBid,
	2 AS auctionType,
	0 AS lastBid,
	false AS isWatchList 	  
	
	FROM db_vehicle VEHICLE

	WHERE

	VEHICLE.isDeleted=FALSE
	AND VEHICLE.vehicle_status=2
	AND (auctionType=0 OR auctionType=2)
	AND VEHICLE.auction_start_date > DATE(now());
	

	SELECT 
    COUNT(vehicleId) AS totalRecords
	FROM
    RESULT;

	IF pageSize <> -1 AND pageNo <> -1 THEN
		BEGIN
			SELECT * FROM RESULT ORDER BY RESULT.auctionType ASC,RESULT.admin_live_date ASC LIMIT pageNo,pageSize;
		END;
	
    

    ELSE
		BEGIN
			SELECT * FROM RESULT ORDER BY RESULT.auctionType ASC,RESULT.admin_live_date ASC;
		END;
        
	END IF;

	DROP TABLE RESULT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dealer_auctions_new` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_dealer_auctions_new`(
IN auctionType INT,
IN minPrice double,
IN maxPrice double,
IN fuel_type varchar(50),
IN owner_type INT,
IN transition_type varchar(50),
in pageNo INT,
in pageSize INT)
BEGIN
         
	DROP TEMPORARY TABLE IF EXISTS RESULT;
	CREATE TEMPORARY TABLE RESULT
         
	
	SELECT 
	VEHICLE.id AS vehicleId,
	VEHICLE.vehicle_name,
	fnc_get_vehicle_image(VEHICLE.id) as imageUrl,
	VEHICLE.registration_number,
	VEHICLE.manufacturing_year,
	VEHICLE.rc_status,
	VEHICLE.location,
	VEHICLE.distance_travelled,
	VEHICLE.fuel_type,
	VEHICLE.transition_type,
	VEHICLE.admin_live_date,
	VEHICLE.auction_start_date,
	0 AS highestBid,
	0 AS lastBid,
	false AS isWatchList,
	CASE 
		WHEN (DATE_ADD(VEHICLE.auction_start_date,INTERVAL 1 DAY)>=NOW()
			AND VEHICLE.auction_start_date<NOW()) THEN 1
		WHEN (VEHICLE.auction_start_date > now()) THEN 2
	 
	END AS auctionType

	FROM db_vehicle VEHICLE

	WHERE

	VEHICLE.isDeleted=FALSE
	AND VEHICLE.vehicle_status=2 
	AND(auctionType=0 
	OR (auctionType=1 AND VEHICLE.admin_live_date is NOT NULL 
		AND DATE_ADD(VEHICLE.auction_start_date,INTERVAL 1 DAY)>=NOW()
		AND VEHICLE.auction_start_date<NOW())
	OR (auctionType=2 AND VEHICLE.auction_start_date > now()))
	AND (fuel_type='' OR VEHICLE.fuel_type=fuel_type)
	AND (transition_type='' OR VEHICLE.transition_type=transmission_type)
	AND (owner_type=-1 OR VEHICLE.previous_owners=owner_type)
	AND (minPrice=0 OR VEHICLE.start_bid>=minPrice)
	AND (maxPrice=0 OR VEHICLE.start_bid<=maxPrice);


	SELECT 
    COUNT(vehicleId) AS totalRecords
	FROM
    RESULT;

	IF pageSize <> -1 AND pageNo <> -1 THEN
		BEGIN
			SELECT * FROM RESULT ORDER BY RESULT.auctionType ASC,RESULT.admin_live_date ASC LIMIT pageNo,pageSize;
		END;
	
    

    ELSE
		BEGIN
			SELECT * FROM RESULT ORDER BY RESULT.auctionType ASC,RESULT.admin_live_date ASC;
		END;
        
	END IF;

	DROP TABLE RESULT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dealer_dashboard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_dealer_dashboard`()
BEGIN
         
	#Live Auctions
	
	SELECT 
	VEHICLE.id AS vehicleId,
	VEHICLE.vehicle_name,
	fnc_get_vehicle_image(VEHICLE.id) as imageUrl,
	VEHICLE.start_bid,
	VEHICLE.registration_number,
	VEHICLE.model,
	VEHICLE.variant,
	VEHICLE.location,
	VEHICLE.admin_live_date,
    VEHICLE.auction_start_date
	FROM db_vehicle VEHICLE

	WHERE

	VEHICLE.isDeleted=FALSE
	AND VEHICLE.vehicle_status=2
	AND (VEHICLE.admin_live_date is NOT NULL 
		AND DATE_ADD(VEHICLE.auction_start_date,INTERVAL 1 DAY)>=NOW()
		AND VEHICLE.auction_start_date<NOW());

	#Upcoming Auctions

	SELECT 
	VEHICLE.id AS vehicleId,
	VEHICLE.vehicle_name,
	fnc_get_vehicle_image(VEHICLE.id) as imageUrl,
	VEHICLE.start_bid,
	VEHICLE.registration_number,
	VEHICLE.model,
	VEHICLE.variant,
	VEHICLE.location,
	VEHICLE.admin_live_date,
	VEHICLE.auction_start_date
	FROM db_vehicle VEHICLE

	WHERE

	VEHICLE.isDeleted=FALSE
	AND VEHICLE.vehicle_status=2
	AND VEHICLE.auction_start_date > now();


	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dealer_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_dealer_list`(
in searchText VARCHAR(20),
in pageNo int,
in pageSize int,
in sortBy varchar(50),
in sortOrder varchar(50))
BEGIN	

		DECLARE searchPattern VARCHAR (30) DEFAULT '';
        
		SET searchPattern=LOWER(CONCAT('%', IFNULL(searchText,'') , '%'));

		DROP TEMPORARY TABLE IF EXISTS RESULT;
		CREATE TEMPORARY TABLE RESULT
         
        SELECT 
        USERS.firstName,
        USERS.lastName,
        USERS.email,
        USERS.phone,
        USERS.address,
        USERS.id AS userId,
        DATE(USERS.dateCreated) AS creationDate,
        USERS.isLive AS status,
		USERS.biddingLimit
        
        FROM db_users USERS
        JOIN db_user_in_roles UR ON UR.userId=USERS.id
        
		WHERE USERS.isDeleted=FALSE
        
        AND UR.roleId=3
        
		AND (searchText='' OR (LOWER(USERS.email) like searchPattern) 
						   OR (USERS.phone like searchPattern)
		OR (LOWER(CONCAT_WS(' ',IFNULL(USERS.firstName,''),IFNULL(USERS.lastName,''))) like searchPattern))
        
		ORDER BY 
        
		CASE WHEN sortOrder='ASC' THEN
			CASE
				WHEN sortBy='firstName' THEN  USERS.firstName
				WHEN sortBy='lastName' THEN  USERS.lastName
				WHEN sortBy='email' THEN USERS.email
				WHEN sortBy='status' THEN USERS.isLive
				ELSE USERS.dateModified
			END
		END ASC,
    
		CASE WHEN sortOrder<>'ASC' then
			CASE
				WHEN sortBy='firstName' THEN  USERS.firstName
				WHEN sortBy='lastName' THEN  USERS.lastName
				WHEN sortBy='email' THEN USERS.email
				WHEN sortBy='status' THEN USERS.isLive
				ELSE USERS.dateModified
			END
		END DESC;
        
SELECT 
    COUNT(userId) AS totalRecords
FROM
    RESULT;
    
		

	IF pageSize <> -1 AND pageNo <> -1 THEN
		BEGIN
			SELECT * FROM RESULT LIMIT pageNo,pageSize;
		END;
	
    

    ELSE
		BEGIN
			SELECT * FROM RESULT;
		END;
        
	END IF;

	DROP TABLE RESULT;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dealer_wishlist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_dealer_wishlist`(IN dealerId INT)
BEGIN
         	
	SELECT 
	VEHICLE.id AS vehicleId,
	VEHICLE.vehicle_name,
	fnc_get_vehicle_image(VEHICLE.id) as imageUrl,
	VEHICLE.start_bid,
	VEHICLE.registration_number,
	VEHICLE.model,
	VEHICLE.variant,
	VEHICLE.location,
	VEHICLE.admin_live_date	AS liveDate  
	FROM db_vehicle VEHICLE
	JOIN db_dealer_wishlist DW ON DW.vehicleId=VEHICLE.id

	WHERE
	VEHICLE.isDeleted=FALSE
	AND DW.dealerId=dealerId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dealer_wishlist_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_dealer_wishlist_add`(
IN dealerId INT,
IN vehicleId INT
)
BEGIN	

IF(SELECT COUNT(*) FROM db_dealer_wishlist DW 
	WHERE DW.dealerId=dealerId
	AND DW.vehicleId=vehicleId)>0 THEN
	
	DELETE DW FROM db_dealer_wishlist AS DW 
	WHERE DW.dealerId=dealerId
	AND DW.vehicleId=vehicleId;

ELSE

	INSERT INTO db_dealer_wishlist(`dealerId`,`vehicleId`)VALUES(dealerId,vehicleId);

END IF;

	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_user`(
IN userId INT)
BEGIN

DECLARE affectedRow INT DEFAULT 0;

UPDATE db_users USERS SET USERS.isDeleted=TRUE,USERS.isLive=FALSE WHERE USERS.id=userId AND USERS.isDeleted=FALSE;

SET affectedRow=(SELECT ROW_COUNT());

SELECT affectedRow;

IF (affectedRow>0) THEN 

	DELETE UR FROM db_user_in_roles UR  WHERE UR.userId=userId;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_seller_auctions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_seller_auctions`(
IN sellerId INT,
IN subsellerId INT,
IN auctionType INT,
IN sub_sellers varchar(100),
IN minPrice double,
IN maxPrice double,
IN fuel_type varchar(50),
IN owner_type varchar(50),
IN transmission_type varchar(50),
IN pageNo INT,
IN pageSize INT)
BEGIN
         
	DROP TEMPORARY TABLE IF EXISTS RESULT;
	CREATE TEMPORARY TABLE RESULT
         

	#Live Auctions
	
	SELECT 
	VEHICLE.id AS vehicleId,
	VEHICLE.vehicle_name,
	fnc_get_vehicle_image(VEHICLE.id) as imageUrl,
	VEHICLE.manufacturing_year,
	VEHICLE.rc_status,
	VEHICLE.location,
	VEHICLE.distance_travelled,
	VEHICLE.fuel_type,
	VEHICLE.transmission_type,
	VEHICLE.insurance_type,
	VEHICLE.admin_live_date,
	VEHICLE.auction_start_date,
	VEHICLE.reject_reason,
	0 AS highestBid,
	'' AS bidderName,
	1 AS auctionType

	FROM db_vehicle VEHICLE
	LEFT JOIN db_users U ON U.id=VEHICLE.subsellerId

	WHERE

	VEHICLE.isDeleted=FALSE
	AND VEHICLE.vehicle_status=2
	AND (auctionType=0 OR auctionType=1)
	AND (sellerId=0 OR VEHICLE.sellerId=sellerId OR U.sellerId=sellerId)
	AND (subsellerId=0 OR VEHICLE.subsellerId=subsellerId)
	AND (VEHICLE.admin_live_date is NOT NULL 
		AND DATE_ADD(VEHICLE.admin_live_date,INTERVAL 1 DAY)>=NOW())

	#Upcoming Auctions
	
	UNION

	SELECT 
	VEHICLE.id AS vehicleId,
	VEHICLE.vehicle_name,
	fnc_get_vehicle_image(VEHICLE.id) as imageUrl,
	VEHICLE.manufacturing_year,
	VEHICLE.rc_status,
	VEHICLE.location,
	VEHICLE.distance_travelled,
	VEHICLE.fuel_type,
	VEHICLE.transmission_type,
	VEHICLE.insurance_type,
	VEHICLE.admin_live_date,
	VEHICLE.auction_start_date,
	VEHICLE.reject_reason,
	0 AS highestBid,
	'' AS bidderName,
	2 AS auctionType	  
	FROM db_vehicle VEHICLE
	LEFT JOIN db_users U ON U.id=VEHICLE.subsellerId

	WHERE

	VEHICLE.isDeleted=FALSE
	AND VEHICLE.vehicle_status=2
	AND (auctionType=0 OR auctionType=2)
	AND (sellerId=0 OR VEHICLE.sellerId=sellerId OR U.sellerId=sellerId)
	AND (subsellerId=0 OR VEHICLE.subsellerId=subsellerId)
	AND VEHICLE.auction_start_date > DATE(now())

	UNION

	#Pending Auctions

	SELECT 
	VEHICLE.id AS vehicleId,
	VEHICLE.vehicle_name,
	fnc_get_vehicle_image(VEHICLE.id) as imageUrl,
	VEHICLE.manufacturing_year,
	VEHICLE.rc_status,
	VEHICLE.location,
	VEHICLE.distance_travelled,
	VEHICLE.fuel_type,
	VEHICLE.transmission_type,
	VEHICLE.insurance_type,
	VEHICLE.admin_live_date,
	VEHICLE.auction_start_date,
	VEHICLE.reject_reason,
	0 AS highestBid,
	'' AS bidderName,
	3 AS auctionType	  
	FROM db_vehicle VEHICLE
	LEFT JOIN db_users U ON U.id=VEHICLE.subsellerId

	WHERE

	VEHICLE.isDeleted=FALSE
	AND VEHICLE.vehicle_status=1
	AND (auctionType=0 OR auctionType=3)
	AND (sellerId=0 OR VEHICLE.sellerId=sellerId OR U.sellerId=sellerId)
	AND (subsellerId=0 OR VEHICLE.subsellerId=subsellerId)
	

	UNION
	#Rejected Auctions

	SELECT 
	VEHICLE.id AS vehicleId,
	VEHICLE.vehicle_name,
	fnc_get_vehicle_image(VEHICLE.id) as imageUrl,
	VEHICLE.manufacturing_year,
	VEHICLE.rc_status,
	VEHICLE.location,
	VEHICLE.distance_travelled,
	VEHICLE.fuel_type,
	VEHICLE.transmission_type,
	VEHICLE.insurance_type,
	VEHICLE.admin_live_date,
	VEHICLE.auction_start_date,
	VEHICLE.reject_reason,
	0 AS highestBid,
	'' AS bidderName,
	4 AS auctionType	  
	FROM db_vehicle VEHICLE
	LEFT JOIN db_users U ON U.id=VEHICLE.subsellerId

	WHERE

	VEHICLE.isDeleted=FALSE
	AND VEHICLE.vehicle_status=3
	AND (auctionType=0 OR auctionType=4)
	AND (sellerId=0 OR VEHICLE.sellerId=sellerId OR U.sellerId=sellerId)
	AND (subsellerId=0 OR VEHICLE.subsellerId=subsellerId);
	


	SELECT 
    COUNT(vehicleId) AS totalRecords
	FROM
    RESULT;

	IF pageSize <> -1 AND pageNo <> -1 THEN
		BEGIN
			SELECT * FROM RESULT ORDER BY RESULT.auctionType ASC,RESULT.admin_live_date ASC LIMIT pageNo,pageSize;
		END;
	
    

    ELSE
		BEGIN
			SELECT * FROM RESULT ORDER BY RESULT.auctionType ASC,RESULT.admin_live_date ASC;
		END;
        
	END IF;

	DROP TABLE RESULT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_seller_auctions_new` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_seller_auctions_new`(
IN sellerId INT,
IN subsellerId INT,
IN auctionType INT,
IN sub_sellers varchar(100),
IN minPrice double,
IN maxPrice double,
IN fuel_type varchar(50),
IN owner_type INT,
IN transition_type varchar(50),
IN pageNo INT,
IN pageSize INT)
BEGIN
         
	DROP TEMPORARY TABLE IF EXISTS RESULT;
	CREATE TEMPORARY TABLE RESULT
         

	#Live Auctions
	
	SELECT 
	VEHICLE.id AS vehicleId,
	VEHICLE.vehicle_name,
	fnc_get_vehicle_image(VEHICLE.id) as imageUrl,
	VEHICLE.manufacturing_year,
	VEHICLE.rc_status,
	VEHICLE.location,
	VEHICLE.distance_travelled,
	VEHICLE.fuel_type,
	VEHICLE.transition_type,
	VEHICLE.insurance_type,
	VEHICLE.admin_live_date,
	VEHICLE.auction_start_date,
	VEHICLE.reject_reason,
	fnc_get_user_name(IFNULL(VEHICLE.sellerId,VEHICLE.subsellerId)) AS uploadedBy,
	0 AS highestBid,
	'' AS bidderName,
	CASE 
		WHEN (VEHICLE.vehicle_status=2 AND DATE_ADD(VEHICLE.auction_start_date,INTERVAL 1 DAY)>=NOW()
				AND VEHICLE.auction_start_date<NOW()) THEN 1
		WHEN (VEHICLE.vehicle_status=2 AND VEHICLE.auction_start_date > now()) THEN 2
		WHEN (VEHICLE.vehicle_status=1) THEN 3
		WHEN (VEHICLE.vehicle_status=3) THEN 4
	END AS auctionType

	FROM db_vehicle VEHICLE
	LEFT JOIN db_users U ON U.id=VEHICLE.subsellerId

	WHERE

	VEHICLE.isDeleted=FALSE
	AND 
	(auctionType=0 
	OR (auctionType=1 AND VEHICLE.vehicle_status=2 AND VEHICLE.admin_live_date is NOT NULL 
		AND DATE_ADD(VEHICLE.auction_start_date,INTERVAL 1 DAY)>=NOW()
		AND VEHICLE.auction_start_date<NOW())

	OR (auctionType=2 AND VEHICLE.vehicle_status=2 AND VEHICLE.auction_start_date > now())
	OR (auctionType=3 AND VEHICLE.vehicle_status=1 )
	OR (auctionType=4 AND VEHICLE.vehicle_status=3))
	AND (sellerId=0 OR VEHICLE.sellerId=sellerId OR U.sellerId=sellerId)
	AND (subsellerId=0 OR VEHICLE.subsellerId=subsellerId)
	AND (fuel_type='' OR VEHICLE.fuel_type=fuel_type)
	AND (transition_type='' OR VEHICLE.transition_type=transition_type)
	AND (owner_type=-1 OR VEHICLE.previous_owners=owner_type)
	AND (sub_sellers='' OR FIND_IN_SET(CONVERT(VEHICLE.subsellerId,char),sub_sellers))
	AND (minPrice=0 OR VEHICLE.start_bid>=minPrice)
	AND (maxPrice=0 OR VEHICLE.start_bid<=maxPrice);

	SELECT 
    COUNT(vehicleId) AS totalRecords
	FROM
    RESULT;

	IF pageSize <> -1 AND pageNo <> -1 THEN
		BEGIN
			SELECT * FROM RESULT ORDER BY RESULT.auctionType ASC,RESULT.admin_live_date ASC LIMIT pageNo,pageSize;
		END;
	
    

    ELSE
		BEGIN
			SELECT * FROM RESULT ORDER BY RESULT.auctionType ASC,RESULT.admin_live_date ASC;
		END;
        
	END IF;

	DROP TABLE RESULT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_seller_dashboard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_seller_dashboard`(
IN sellerId INT,
IN subsellerId INT
)
BEGIN
         
	#Live Auctions
	
	SELECT 
	VEHICLE.id AS vehicleId,
	VEHICLE.vehicle_name,
	fnc_get_vehicle_image(VEHICLE.id) AS imageUrl,
	VEHICLE.start_bid,
	VEHICLE.registration_number,
	VEHICLE.model,
	VEHICLE.variant,
	VEHICLE.location,
	VEHICLE.admin_live_date,
	VEHICLE.auction_start_date,
	1 AS vehicle_status
	FROM db_vehicle VEHICLE

	WHERE

	VEHICLE.isDeleted=FALSE
	AND VEHICLE.vehicle_status=2
	AND (sellerId=0 OR VEHICLE.sellerId=sellerId)
	AND (subsellerId=0 OR VEHICLE.subsellerId=subsellerId)
	AND (VEHICLE.admin_live_date IS NOT NULL 
		AND DATE_ADD(VEHICLE.auction_start_date,INTERVAL 1 DAY)>=NOW()
		AND VEHICLE.auction_start_date<NOW());

	#Upcoming Auctions

	SELECT 
	VEHICLE.id AS vehicleId,
	VEHICLE.vehicle_name,
	fnc_get_vehicle_image(VEHICLE.id) AS imageUrl,
	VEHICLE.start_bid,
	VEHICLE.registration_number,
	VEHICLE.model,
	VEHICLE.variant,
	VEHICLE.location,
	VEHICLE.admin_live_date,
	VEHICLE.auction_start_date,
	2 AS vehicle_status 
	FROM db_vehicle VEHICLE

	WHERE

	VEHICLE.isDeleted=FALSE
	AND VEHICLE.vehicle_status=2
	AND (sellerId=0 OR VEHICLE.sellerId=sellerId)
	AND (subsellerId=0 OR VEHICLE.subsellerId=subsellerId)
	AND VEHICLE.auction_start_date > now();

	#Pending Auctions

	SELECT 
	VEHICLE.id AS vehicleId,
	VEHICLE.vehicle_name,
	fnc_get_vehicle_image(VEHICLE.id) AS imageUrl,
	VEHICLE.start_bid,
	VEHICLE.registration_number,
	VEHICLE.model,
	VEHICLE.variant,
	VEHICLE.location,
	VEHICLE.admin_live_date,
	VEHICLE.auction_start_date,
	3 AS vehicle_status
	  
	FROM db_vehicle VEHICLE

	WHERE

	VEHICLE.isDeleted=FALSE
	AND VEHICLE.vehicle_status=1
	AND (sellerId=0 OR VEHICLE.sellerId=sellerId)
	AND (subsellerId=0 OR VEHICLE.subsellerId=subsellerId);


	#Rejected Auctions

	SELECT 
	VEHICLE.id AS vehicleId,
	VEHICLE.vehicle_name,
	fnc_get_vehicle_image(VEHICLE.id) AS imageUrl,
	VEHICLE.start_bid,
	VEHICLE.registration_number,
	VEHICLE.model,
	VEHICLE.variant,
	VEHICLE.location,
	VEHICLE.admin_live_date,
	VEHICLE.auction_start_date,
	VEHICLE.reject_reason,
	4 AS vehicle_status

	FROM db_vehicle VEHICLE

	WHERE

	VEHICLE.isDeleted=FALSE
	AND VEHICLE.vehicle_status=3
	AND (sellerId=0 OR VEHICLE.sellerId=sellerId)
	AND (subsellerId=0 OR VEHICLE.subsellerId=subsellerId);
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_seller_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_seller_list`(
in searchText VARCHAR(20),
in pageNo int,
in pageSize int,
in sortBy varchar(50),
in sortOrder varchar(50))
BEGIN	

		DECLARE searchPattern VARCHAR (30) DEFAULT '';
        
		SET searchPattern=LOWER(CONCAT('%', IFNULL(searchText,'') , '%'));

		DROP TEMPORARY TABLE IF EXISTS RESULT;
		CREATE TEMPORARY TABLE RESULT
         
        SELECT 
        USERS.firstName,
        USERS.lastName,
        USERS.email,
        USERS.phone,
        USERS.address,
        USERS.id AS userId,
        DATE(USERS.dateCreated) AS creationDate,
        USERS.isLive AS status
        
        FROM db_users USERS
        JOIN db_user_in_roles UR ON UR.userId=USERS.id
        
		WHERE USERS.isDeleted=FALSE
        
        AND UR.roleId=1
        
		AND (searchText='' OR (LOWER(USERS.email) like searchPattern) 
						   OR (USERS.phone like searchPattern)
		OR (LOWER(CONCAT_WS(' ',IFNULL(USERS.firstName,''),IFNULL(USERS.lastName,''))) like searchPattern))
        
		ORDER BY 
        
		CASE WHEN sortOrder='ASC' THEN
			CASE
				WHEN sortBy='firstName' THEN  USERS.firstName
				WHEN sortBy='lastName' THEN  USERS.lastName
				WHEN sortBy='email' THEN USERS.email
				WHEN sortBy='status' THEN USERS.isLive
				ELSE USERS.dateModified
			END
		END ASC,
    
		CASE WHEN sortOrder<>'ASC' then
			CASE
				WHEN sortBy='firstName' THEN  USERS.firstName
				WHEN sortBy='lastName' THEN  USERS.lastName
				WHEN sortBy='email' THEN USERS.email
				WHEN sortBy='status' THEN USERS.isLive
				ELSE USERS.dateModified
			END
		END DESC;
        
SELECT 
    COUNT(userId) AS totalRecords
FROM
    RESULT;
    
		

	IF pageSize <> -1 AND pageNo <> -1 THEN
		BEGIN
			SELECT * FROM RESULT LIMIT pageNo,pageSize;
		END;
	
    

    ELSE
		BEGIN
			SELECT * FROM RESULT;
		END;
        
	END IF;

	DROP TABLE RESULT;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_special_list_admin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_special_list_admin`(
in stateId int,
in domainId int,
in businessId int,
in categoryId INT,
in repeatId INT,
in searchText VARCHAR(20),
in status INT,
in startDate DATE,
in endDate DATE,
in userId INT,
in pageNo int,
in pageSize int,
in sortBy varchar(50),
in sortOrder varchar(50))
begin
	
DROP TEMPORARY TABLE IF EXISTS RESULT;
CREATE TEMPORARY TABLE RESULT

	SELECT 
    SPECIALS.id,
    SPECIALS.title,
    SPECIALS.startDate,
    SPECIALS.isEnabled,
	SPECIALS.isApproved,
    SPECIALS.excludeNewsletter,
    date(SPECIALS.expireDate) AS expireDate,
	CASE WHEN DATE(SPECIALS.expireDate)>=DATE(CONVERT_TZ(now(),'+00:00',IFNULL(DOMAIN.timezone,'+00:00'))) THEN FALSE ELSE TRUE END AS isExpired,
	DATE(fnc_tz_conversion(SPECIALS.dateCreated,DOMAIN.timezone)) AS dateCreated,
    IFNULL(BUSINESS.title,'') AS businessTitle,
    SPECIALS.sortOrder,
    fnc_tz_conversion(SPECIALS.dateModified,DOMAIN.timezone) AS dateModified,
    DOMAIN.url
    
    FROM db_specials SPECIALS
    LEFT JOIN db_business BUSINESS ON BUSINESS.id=SPECIALS.businessId
	LEFT JOIN db_business_profile_linking BPL ON BPL.businessId=SPECIALS.businessId

    JOIN db_domains DOMAIN ON DOMAIN.id=SPECIALS.domainId
    JOIN db_cities CITY ON CITY.id= DOMAIN.cityId
    
    WHERE SPECIALS.isDeleted=FALSE
    AND (stateId=0 OR CITY.stateId=stateId)
    AND(domainId=0 OR SPECIALS.domainId=domainId)
    AND(businessId=0 OR (businessId=-1 AND SPECIALS.businessId IS NULL) OR SPECIALS.businessId=businessId)
    AND (searchText='' OR LOWER(SPECIALS.title) LIKE CONCAT('%',LOWER(searchText),'%'))
    AND (status=0 
		OR (status=1 AND SPECIALS.isEnabled=TRUE 
        AND DATE(SPECIALS.expireDate)>=DATE(CONVERT_TZ(now(),'+00:00',IFNULL(DOMAIN.timezone,'+00:00')))) 
        OR (status=2 AND SPECIALS.isEnabled=FALSE)
		OR (status=3 AND DATE(SPECIALS.expireDate)<DATE(CONVERT_TZ(now(),'+00:00',IFNULL(DOMAIN.timezone,'+00:00')))))
    AND (startDate IS NULL OR SPECIALS.startDate>=startDate)
	AND (endDate IS NULL OR  date(SPECIALS.expireDate)<=endDate)
    AND (categoryId =0 OR SPECIALS.categoryId1 = categoryId OR SPECIALS.categoryId2=categoryId OR SPECIALS.categoryId3=categoryId)
    AND (repeatId=0 OR SPECIALS.repeatId=repeatId)
    #AND (BPL.isDeleted IS NULL OR BPL.isDeleted=FALSE)
	AND (userId=0 OR (BPL.userId IS NOT NULL AND BPL.userId=userId));

    
    SELECT 
    COUNT(id) AS totalRecords
FROM
    RESULT;
    

        SET @sortOrder = sortOrder;
		SET @sort="";
		IF @sortOrder='ASC' THEN 
				IF sortBy='' THEN
					SET @sort = "ORDER BY dateModified";
				ELSE 
					SET @sort = CONCAT("ORDER BY ",sortBy);
				END IF;
			SET @sort=CONCAT(@sort," ASC");
		ELSE 
			IF sortBy='' THEN
					SET @sort = "ORDER BY dateModified";
				ELSE 
					SET @sort = CONCAT("ORDER BY ",sortBy);
				END IF;
			SET @sort=CONCAT(@sort," DESC");
		END IF;
		
		IF pageSize <> -1 AND pageNo <> -1 THEN
			SET @sort=CONCAT(@sort," LIMIT ",pageNo," , ",pageSize);
		END IF;
		
		SET @query = CONCAT('SELECT * FROM  RESULT ',@sort);
		PREPARE stmt FROM @query;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		DROP TEMPORARY TABLE  IF EXISTS RESULT;	
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_subseller_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_subseller_list`(
in sellerId int,
in searchText VARCHAR(20),
in pageNo int,
in pageSize int,
in sortBy varchar(50),
in sortOrder varchar(50))
BEGIN	

		DECLARE searchPattern VARCHAR (30) DEFAULT '';
        
		SET searchPattern=LOWER(CONCAT('%', IFNULL(searchText,'') , '%'));

		DROP TEMPORARY TABLE IF EXISTS RESULT;
		CREATE TEMPORARY TABLE RESULT
         
        SELECT 
        USERS.firstName,
        USERS.lastName,
        USERS.email,
        USERS.phone,
        USERS.address,
        USERS.id AS userId,
        DATE(USERS.dateCreated) AS creationDate,
		fnc_get_subseller_vehicle_count(USERS.id) AS vehicle_count,
        USERS.isLive AS status
        
        FROM db_users USERS
        JOIN db_user_in_roles UR ON UR.userId=USERS.id
        
		WHERE USERS.isDeleted=FALSE
        
        AND USERS.sellerId=sellerId
		AND UR.roleId=2
        
		AND (searchText='' OR (LOWER(USERS.email) like searchPattern) 
						   OR (USERS.phone like searchPattern)
		OR (LOWER(CONCAT_WS(' ',IFNULL(USERS.firstName,''),IFNULL(USERS.lastName,''))) like searchPattern))
        
		ORDER BY 
        
		CASE WHEN sortOrder='ASC' THEN
			CASE
				WHEN sortBy='firstName' THEN  USERS.firstName
				WHEN sortBy='lastName' THEN  USERS.lastName
				WHEN sortBy='email' THEN USERS.email
				WHEN sortBy='status' THEN USERS.isLive
				ELSE USERS.dateModified
			END
		END ASC,
    
		CASE WHEN sortOrder<>'ASC' then
			CASE
				WHEN sortBy='firstName' THEN  USERS.firstName
				WHEN sortBy='lastName' THEN  USERS.lastName
				WHEN sortBy='email' THEN USERS.email
				WHEN sortBy='status' THEN USERS.isLive
				ELSE USERS.dateModified
			END
		END DESC;
        
SELECT 
    COUNT(userId) AS totalRecords
FROM
    RESULT;
    
		

	IF pageSize <> -1 AND pageNo <> -1 THEN
		BEGIN
			SELECT * FROM RESULT LIMIT pageNo,pageSize;
		END;
	
    

    ELSE
		BEGIN
			SELECT * FROM RESULT;
		END;
        
	END IF;

	DROP TABLE RESULT;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_block` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_block`(
IN userId int,
IN flag BOOLEAN)
BEGIN

IF(flag=TRUE) THEN
	UPDATE db_users USERS SET USERS.isLive=false WHERE USERS.id=userId AND USERS.isDeleted=FALSE;
ELSE
	UPDATE db_users USERS SET USERS.isLive=true WHERE USERS.id=userId AND USERS.isDeleted=FALSE;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_check_token` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_user_check_token`(
in token char(36))
begin

	SELECT
    
	USER.id,
    ROLE.roleId as roleId,
    USER.email,
    USER.firstName,
    USER.lastName,
    USER.sessionId,
    IFNULL(USER.biddingLimit,0) AS biddingLimit
    from db_users USER
    join db_user_in_roles ROLE ON USER.id=ROLE.userId
    where 
		USER.isDeleted=false
		#and USER.isLive=true
		and USER.sessionId=token 
	LIMIT 1 ;
 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_detail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_detail`(
IN userId INT)
BEGIN

	SELECT 
	USERS.firstName,
	USERS.lastName,
	USERS.email,
	USERS.userName,
	USERS.phone,
	URI.roleId,
	USERS.id AS userId,
    USERS.isLive,
	IFNULL(SP.privilege,0) AS privilege,
	fnc_user_domainId(USERS.id,URI.roleId) AS domainId,
    CITY.id AS cityId,
	STATE.id AS stateId,
    CASE WHEN ((SELECT count(*) FROM db_business_profile_linking BPL WHERE BPL.userId=userId AND BPL.isDeleted=FALSE)>0) THEN
    TRUE ELSE FALSE END AS businessId
	FROM db_users USERS
	JOIN db_user_in_roles URI ON URI.userId=USERS.id
	LEFT JOIN db_sales_persons SP ON SP.userId= USERS.id
	LEFT JOIN db_licensee_profiles LP ON LP.userId= USERS.id
    LEFT JOIN db_domains DOMAIN ON DOMAIN.id=SP.domainId
    LEFT JOIN db_cities CITY ON CITY.id=DOMAIN.cityId
	LEFT JOIN db_states STATE ON STATE.id=CITY.stateId
	WHERE USERS.isDeleted=FALSE
	AND (SP.isDeleted IS NULL OR SP.isDeleted=FALSE)
	AND (LP.isDeleted IS NULL OR LP.isDeleted=FALSE)
	AND USERS.id=userId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_duplicate_registration` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_duplicate_registration`(
in emailId varchar(100),
in phone varchar(25))
BEGIN

SELECT 
COUNT(id) AS count
FROM db_users USERS
WHERE USERS.isDeleted=FALSE
AND(emailId=''OR USERS.email =emailId)
AND (phone=''OR USERS.phone=phone);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_login`(
in emailId varchar(100))
BEGIN 

	SELECT
	USER.id AS userId,
	ROLE.roleId,
    USER.*
    
    FROM db_users USER
    JOIN db_user_in_roles ROLE ON 	USER.id=ROLE.userId
	WHERE 
	USER.isDeleted=false
	AND(USER.email=emailId OR USER.phone=emailId) LIMIT 1;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_reset_password` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_reset_password`(
in emailId varchar(50),
in newPassword TEXT(200))
begin

DECLARE userExistance int;
	set userExistance=	(select count(*) 
    from db_users USERS
        where USERS.email=emailId
        and USERS.isDeleted=false);
        
	SELECT userExistance;
    
	if(userExistance>0) then
		select 
        concat(USERS.firstName,' ',USERS.lastName) as name
        from db_users USERS
        where USERS.email=emailId
		and USERS.isDeleted=false;

UPDATE db_users USERS 
SET 
    USERS.password = newPassword
WHERE
    USERS.email = emailId
        AND USERS.isDeleted = FALSE;
        
	end if;
    
 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_signup_failed` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_signup_failed`(
IN userId int)
BEGIN

UPDATE db_users SET db_users.isDeleted=true WHERE db_users.id=userId;
UPDATE db_business_profiles SET db_business_profiles.isDeleted=true WHERE db_business_profiles.userId=userId;
DELETE FROM  db_user_in_roles WHERE db_user_in_roles.userId=userId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_vehicle_bidding_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_vehicle_bidding_info`(IN vehicleId INT,IN dealerId INT)
BEGIN
         SELECT 
         V.auction_start_date,
         V.start_bid,
         fnc_get_max_bid(vehicleId) AS max_bid,
         fnc_get_user_total_bid(dealerId,vehicleId) AS dealer_total_bid
         FROM db_vehicle V
         WHERE V.id=vehicleId;
         
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_vehicle_detail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_vehicle_detail`(IN vehicleId INT)
BEGIN
         SELECT V.* 
         FROM db_vehicle V
         WHERE V.id=vehicleId;
         
         SELECT VI.url from db_vehicle_images VI
         where VI.vehicleId=vehicleId
         AND VI.isDeleted=FALSE;
         
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_vehicle_features` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_vehicle_features`()
BEGIN

	SELECT
	
	DV.id AS feature_id,
	DV.name AS feature_label
	
	FROM 
	db_vehicle_feature_braking DV
	WHERE DV.isDeleted=false;


	SELECT
	
	DV.id AS feature_id,
	DV.name AS feature_label
	
	FROM 
	db_vehicle_feature_comfort DV
	WHERE DV.isDeleted=false;

	SELECT
	
	DV.id AS feature_id,
	DV.name AS feature_label
	
	FROM 
	db_vehicle_feature_doors DV
	WHERE DV.isDeleted=false;


	SELECT
	
	DV.id AS feature_id,
	DV.name AS feature_label
	
	FROM 
	db_vehicle_feature_entertainment DV
	WHERE DV.isDeleted=false;

	SELECT
	
	DV.id AS feature_id,
	DV.name AS feature_label
	
	FROM 
	db_vehicle_feature_exterior DV
	WHERE DV.isDeleted=false;


	SELECT
	
	DV.id AS feature_id,
	DV.name AS feature_label
	
	FROM 
	db_vehicle_feature_instrument DV
	WHERE DV.isDeleted=false;

	SELECT
	
	DV.id AS feature_id,
	DV.name AS feature_label
	
	FROM 
	db_vehicle_feature_lighting DV
	WHERE DV.isDeleted=false;

	SELECT
	
	DV.id AS feature_id,
	DV.name AS feature_label
	
	FROM 
	db_vehicle_feature_safety DV
	WHERE DV.isDeleted=false;


	SELECT
	
	DV.id AS feature_id,
	DV.name AS feature_label
	
	FROM 
	db_vehicle_feature_seats DV
	WHERE DV.isDeleted=false;

	SELECT
	
	DV.id AS feature_id,
	DV.name AS feature_label
	
	FROM 
	db_vehicle_feature_security DV
	WHERE DV.isDeleted=false;

	SELECT
	
	DV.id AS feature_id,
	DV.name AS feature_label
	
	FROM 
	db_vehicle_feature_storage DV
	WHERE DV.isDeleted=false;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_vehicle_list_admin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_vehicle_list_admin`(
IN pageNo INT,
IN pageSize INT,
IN sortBy VARCHAR(50),
IN sortOrder VARCHAR(50))
BEGIN
	
DROP TEMPORARY TABLE IF EXISTS RESULT;
CREATE TEMPORARY TABLE RESULT

SELECT 

VEHICLE.`id` AS vehicleId,
VEHICLE.vehicle_name,
IFNULL(IFNULL(U1.email,U2.email),'') AS uploaded_by, 
VEHICLE.`registration_number`,
VEHICLE.`start_bid`,
VEHICLE.`model`,
VEHICLE.`evaluation_date`,
DATE(VEHICLE.`dateCreated`) AS creationDate,
VEHICLE.`dateModified`,
VEHICLE.vehicle_status

FROM 

`db_vehicle` VEHICLE

LEFT JOIN `db_users` U1 ON U1.id=VEHICLE.sellerId
LEFT JOIN `db_users` U2 ON U1.id=VEHICLE.subSellerId


WHERE 
VEHICLE.`isDeleted`=FALSE;

    
    SELECT 
    COUNT(vehicleId) AS totalRecords
FROM
    RESULT;
    

        SET @sortOrder = sortOrder;
		SET @sort="";
		IF @sortOrder='ASC' THEN 
				IF sortBy='' THEN
					SET @sort = "ORDER BY dateModified";
				ELSE 
					SET @sort = CONCAT("ORDER BY ",sortBy);
				END IF;
			SET @sort=CONCAT(@sort," ASC");
		ELSE 
			IF sortBy='' THEN
					SET @sort = "ORDER BY dateModified";
				ELSE 
					SET @sort = CONCAT("ORDER BY ",sortBy);
				END IF;
			SET @sort=CONCAT(@sort," DESC");
		END IF;
		
		IF pageSize <> -1 AND pageNo <> -1 THEN
			SET @sort=CONCAT(@sort," LIMIT ",pageNo," , ",pageSize);
		END IF;
		
		SET @query = CONCAT('SELECT * FROM  RESULT ',@sort);
		PREPARE stmt FROM @query;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		DROP TEMPORARY TABLE  IF EXISTS RESULT;	
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_vehicle_list_seller` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_vehicle_list_seller`(
in sellerId int,
in subsellerId int,
in pageNo int,
in pageSize int)
BEGIN

		DROP TEMPORARY TABLE IF EXISTS RESULT;
		CREATE TEMPORARY TABLE RESULT
         

	SELECT 

	VEHICLE.id AS vehicleId,
	VEHICLE.vehicle_name,
	fnc_get_vehicle_image(VEHICLE.id) as imageUrl,
	VEHICLE.start_bid,
	VEHICLE.registration_number,
	VEHICLE.vin_number,
	VEHICLE.engine_number,
	VEHICLE.previous_owners,
	VEHICLE.fuel_type,
	VEHICLE.color,
	VEHICLE.model,
	VEHICLE.variant,
	VEHICLE.evaluation_date,
	VEHICLE.manufacturing_year,
	VEHICLE.rc_status,
	VEHICLE.location,
	VEHICLE.distance_travelled,
	VEHICLE.transmission_type,
	VEHICLE.admin_live_date,
	CONCAT_WS(SELLER.firstName,SELLER.lastName) AS sellerName,
	VEHICLE.sellerId,
	CONCAT_WS(SUBSELLER.firstName,SUBSELLER.lastName) AS subSellerName,
	VEHICLE.subsellerId
	  
	FROM db_vehicle VEHICLE
	LEFT JOIN db_users SELLER ON SELLER.id=VEHICLE.sellerId
	LEFT JOIN db_users SUBSELLER ON SUBSELLER.id=VEHICLE.subsellerId

	WHERE

	VEHICLE.isDeleted=FALSE
	AND VEHICLE.isLive=TRUE
	AND (sellerId=0 OR VEHICLE.sellerId=sellerId OR SUBSELLER.sellerId=sellerId)
	AND (subsellerId=0 OR VEHICLE.subsellerId=subsellerId)
	AND (VEHICLE.admin_live_date is NOT NULL 
		AND DATE_ADD(VEHICLE.admin_live_date,INTERVAL 1 DAY)>=NOW());
	
	SELECT 
		COUNT(vehicleId) AS totalRecords
	FROM
		RESULT;
    
		

	IF pageSize <> -1 AND pageNo <> -1 THEN
		BEGIN
			SELECT * FROM RESULT LIMIT pageNo,pageSize;
		END;
	
    

    ELSE
		BEGIN
			SELECT * FROM RESULT;
		END;
        
	END IF;

	DROP TABLE RESULT;

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

-- Dump completed on 2017-11-23 17:51:59
