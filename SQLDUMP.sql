-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: 127.0.0.1    Database: TechDB
-- ------------------------------------------------------
-- Server version	5.6.23

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
-- Table structure for table `Thread_followers`
--

DROP TABLE IF EXISTS `Thread_followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Thread_followers` (
  `thread_id` int(11) NOT NULL,
  `follower_email` varchar(50) NOT NULL,
  PRIMARY KEY (`thread_id`,`follower_email`),
  KEY `u_id` (`follower_email`),
  CONSTRAINT `thread_followers_ibfk_1` FOREIGN KEY (`thread_id`) REFERENCES `thread` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Thread_followers`
--

LOCK TABLES `Thread_followers` WRITE;
/*!40000 ALTER TABLE `Thread_followers` DISABLE KEYS */;
INSERT INTO `Thread_followers` VALUES (1,'example2@mail.ru'),(4,'example2@mail.ru'),(3,'example4@mail.ru'),(4,'example4@mail.ru'),(3,'example@mail.ru');
/*!40000 ALTER TABLE `Thread_followers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_followers`
--

DROP TABLE IF EXISTS `User_followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_followers` (
  `User` varchar(50) NOT NULL,
  `Followers` varchar(50) NOT NULL,
  PRIMARY KEY (`User`,`Followers`),
  KEY `u_to` (`Followers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_followers`
--

LOCK TABLES `User_followers` WRITE;
/*!40000 ALTER TABLE `User_followers` DISABLE KEYS */;
/*!40000 ALTER TABLE `User_followers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum`
--

DROP TABLE IF EXISTS `forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `short_name` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  KEY `user` (`user`),
  CONSTRAINT `forum_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum`
--

LOCK TABLES `forum` WRITE;
/*!40000 ALTER TABLE `forum` DISABLE KEYS */;
INSERT INTO `forum` VALUES (1,'Forum With Sufficiently Large Name','forumwithsufficientlylargename','richard.nixon@example.com'),(2,'Forum I','forum1','example4@mail.ru'),(3,'Forum II','forum2','example4@mail.ru'),(4,'Форум Три','forum3','example4@mail.ru');
/*!40000 ALTER TABLE `forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `thread` int(11) NOT NULL,
  `message` text NOT NULL,
  `user` varchar(255) NOT NULL,
  `forum` varchar(255) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `isApproved` tinyint(1) NOT NULL DEFAULT '0',
  `isHighlighted` tinyint(1) NOT NULL DEFAULT '0',
  `isEdited` tinyint(1) NOT NULL DEFAULT '0',
  `isSpam` tinyint(1) NOT NULL DEFAULT '0',
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `likes` int(11) NOT NULL DEFAULT '0',
  `dislikes` int(11) NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '0',
  `childs_count` int(11) NOT NULL DEFAULT '0',
  `points` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forum` (`forum`),
  KEY `thread` (`thread`),
  KEY `user` (`user`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`forum`) REFERENCES `forum` (`short_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`thread`) REFERENCES `thread` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post_ibfk_3` FOREIGN KEY (`user`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'2014-01-01 00:00:01',2,'my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1','example4@mail.ru','forumwithsufficientlylargename',NULL,1,1,1,0,0,0,0,'0',0,0),(2,'2014-01-01 00:02:01',2,'my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3my message 3','example3@mail.ru','forumwithsufficientlylargename',1,0,0,1,0,0,0,0,'0',0,0),(3,'2014-01-02 00:02:01',2,'my message 1','example3@mail.ru','forumwithsufficientlylargename',2,0,0,1,1,0,0,0,'0',0,0),(4,'2014-01-03 00:01:01',4,'my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1my message 1','example3@mail.ru','forum1',NULL,1,0,0,0,0,0,0,'0',0,0),(5,'2014-01-03 00:08:01',3,'my message 1','example2@mail.ru','forumwithsufficientlylargename',NULL,0,0,0,0,0,0,1,'0',0,-1);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thread`
--

DROP TABLE IF EXISTS `thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thread` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forum` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `isClosed` tinyint(1) NOT NULL DEFAULT '0',
  `user` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `likes` int(11) NOT NULL DEFAULT '0',
  `dislikes` int(11) NOT NULL DEFAULT '0',
  `posts` int(11) NOT NULL DEFAULT '0',
  `points` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forum` (`forum`),
  KEY `user` (`user`),
  CONSTRAINT `thread_ibfk_1` FOREIGN KEY (`forum`) REFERENCES `forum` (`short_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `thread_ibfk_2` FOREIGN KEY (`user`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thread`
--

LOCK TABLES `thread` WRITE;
/*!40000 ALTER TABLE `thread` DISABLE KEYS */;
INSERT INTO `thread` VALUES (1,'forum3','Thread With Sufficiently Large Title',1,'example3@mail.ru','2014-01-01 00:00:01','hey hey hey hey!','Threadwithsufficientlylargetitle',1,0,0,0,0),(2,'forumwithsufficientlylargename','Thread I',0,'example@mail.ru','2013-12-31 00:01:01','hey!','thread1',0,0,0,3,0),(3,'forumwithsufficientlylargename','Thread II',0,'richard.nixon@example.com','2013-12-30 00:01:01','hey hey!','newslug',0,0,0,1,0),(4,'forum1','Тред Три',0,'example2@mail.ru','2013-12-29 00:01:01','hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! hey hey hey! ','thread3',0,1,0,1,1);
/*!40000 ALTER TABLE `thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `about` text,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `isAnonymous` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'user1','hello im user1','John','example@mail.ru',0),(2,NULL,NULL,NULL,'richard.nixon@example.com',1),(3,'user2','Wowowowow','NewName','example2@mail.ru',0),(4,'user3','Wowowowow!!!','NewName2','example3@mail.ru',0),(5,'user4','hello im user4','Jim','example4@mail.ru',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-25 19:08:55
