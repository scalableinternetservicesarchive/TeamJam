-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: TeamUp_development
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

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
-- Table structure for table `course_skillsets`
--

DROP TABLE IF EXISTS `course_skillsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_skillsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `skill_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `min_rating` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_course_skillsets_on_course_id` (`course_id`),
  KEY `index_course_skillsets_on_skill_id` (`skill_id`),
  CONSTRAINT `fk_rails_400113bf6b` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `fk_rails_9448e02484` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_skillsets`
--

LOCK TABLES `course_skillsets` WRITE;
/*!40000 ALTER TABLE `course_skillsets` DISABLE KEYS */;
INSERT INTO `course_skillsets` VALUES (13,1,1,'2015-11-04 10:11:07','2015-11-04 10:11:07',2),(14,2,7,'2015-11-04 10:11:07','2015-11-04 10:11:07',1),(15,2,8,'2015-11-04 10:11:07','2015-11-04 10:11:07',1),(16,2,9,'2015-11-04 10:11:07','2015-11-04 10:11:07',1),(17,3,2,'2015-11-04 10:11:07','2015-11-04 10:11:07',2),(18,13,1,'2015-11-04 10:35:16','2015-11-04 10:35:16',3),(19,13,2,'2015-11-04 10:35:16','2015-11-04 10:35:16',1),(20,13,3,'2015-11-04 10:35:16','2015-11-04 10:35:16',2),(21,14,1,'2015-11-05 23:48:43','2015-11-05 23:48:43',2),(22,14,4,'2015-11-05 23:48:43','2015-11-05 23:48:43',1),(23,15,1,'2015-11-08 05:49:08','2015-11-08 05:49:08',2),(24,4,2,'2015-11-08 06:58:22','2015-11-08 06:58:22',3),(25,4,4,'2015-11-08 06:58:31','2015-11-08 06:58:31',3);
/*!40000 ALTER TABLE `course_skillsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `max_members` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `min_time_commitment` int(11) DEFAULT NULL,
  `instructor_id` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'CS143','Database Systems',2,'2015-10-26 02:59:55','2015-11-08 05:51:32',6,NULL,'2015-10-01 00:00:00','2015-12-01 00:00:00'),(2,'CS188','Scalable Internet Services',4,'2015-10-26 02:59:55','2015-11-08 05:51:32',6,NULL,'2015-10-01 00:00:00','2015-12-01 00:00:00'),(3,'CS118','Networking',2,'2015-10-26 02:59:55','2015-11-08 05:51:32',6,NULL,'2015-10-01 00:00:00','2015-12-01 00:00:00'),(4,'CS174A','Computer Graphics',5,'2015-10-26 02:59:55','2015-11-08 05:51:32',6,NULL,'2015-10-01 00:00:00','2015-12-01 00:00:00'),(5,'CS130','Software Engineering',4,'2015-10-26 02:59:55','2015-11-08 05:51:32',6,NULL,'2015-10-01 00:00:00','2015-12-01 00:00:00'),(6,'CS 131','Hell on earth',3,'2015-11-03 22:47:09','2015-11-08 05:51:32',12,NULL,'2015-10-01 00:00:00','2015-12-01 00:00:00'),(7,'CS 132','Compiler Constuction',3,'2015-11-03 22:48:42','2015-11-08 05:51:32',14,NULL,'2015-10-01 00:00:00','2015-12-01 00:00:00'),(13,'abc','dfd',3,'2015-11-04 10:35:16','2015-11-08 05:51:32',4,3,'2015-10-01 00:00:00','2015-12-01 00:00:00'),(14,'cs101','basics',3,'2015-11-05 23:48:43','2015-11-08 05:51:32',8,4,'2015-10-01 00:00:00','2015-12-01 00:00:00'),(15,'CS145 ','Data Mining',3,'2015-11-08 05:49:08','2015-11-08 05:53:07',9,3,'2015-10-01 00:00:00','2015-11-08 05:53:02');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollments`
--

DROP TABLE IF EXISTS `enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrollments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `time_committment` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `finish_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `time_commitment` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_enrollments_on_course_id` (`course_id`),
  KEY `index_enrollments_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_2e119501f4` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `fk_rails_e860e0e46b` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollments`
--

LOCK TABLES `enrollments` WRITE;
/*!40000 ALTER TABLE `enrollments` DISABLE KEYS */;
INSERT INTO `enrollments` VALUES (1,1,2,NULL,NULL,NULL,'2015-10-26 03:01:13','2015-10-29 08:19:31',2),(2,3,2,NULL,NULL,NULL,'2015-10-26 03:01:13','2015-10-29 08:19:31',2),(3,4,2,NULL,NULL,NULL,'2015-10-26 03:01:13','2015-10-29 08:19:31',2),(4,1,1,NULL,NULL,NULL,'2015-10-26 03:02:01','2015-10-30 08:23:18',5),(5,2,1,NULL,NULL,NULL,'2015-10-26 03:02:01','2015-10-30 07:38:14',8),(6,3,1,NULL,NULL,NULL,'2015-10-26 03:02:01','2015-10-30 07:38:07',6),(7,1,3,NULL,NULL,NULL,'2015-10-26 06:20:36','2015-11-11 10:05:10',8),(8,4,3,NULL,NULL,NULL,'2015-10-26 06:20:36','2015-10-29 08:19:31',2),(9,5,3,NULL,NULL,NULL,'2015-10-26 06:20:36','2015-10-29 08:19:31',2),(10,3,3,NULL,NULL,NULL,'2015-10-26 07:36:16','2015-10-29 08:19:31',2),(11,2,4,NULL,NULL,NULL,'2015-10-29 04:51:09','2015-10-29 08:19:31',2),(12,4,4,NULL,NULL,NULL,'2015-10-29 04:51:09','2015-10-29 08:19:31',2),(13,5,4,NULL,NULL,NULL,'2015-10-29 04:51:09','2015-10-29 08:19:31',2),(14,2,5,NULL,NULL,NULL,'2015-10-29 05:17:27','2015-10-29 08:19:31',2),(15,3,5,NULL,NULL,NULL,'2015-10-29 05:17:27','2015-10-29 08:19:31',2),(16,4,5,NULL,NULL,NULL,'2015-10-29 05:17:27','2015-10-29 08:40:21',1),(18,2,3,NULL,NULL,NULL,'2015-11-04 10:33:09','2015-11-04 10:33:09',2),(19,5,1,NULL,NULL,NULL,'2015-11-05 23:39:40','2015-11-05 23:44:40',5),(20,14,4,NULL,NULL,NULL,'2015-11-05 23:48:47','2015-11-05 23:48:47',2);
/*!40000 ALTER TABLE `enrollments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailboxer_conversation_opt_outs`
--

DROP TABLE IF EXISTS `mailboxer_conversation_opt_outs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailboxer_conversation_opt_outs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unsubscriber_id` int(11) DEFAULT NULL,
  `unsubscriber_type` varchar(255) DEFAULT NULL,
  `conversation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type` (`unsubscriber_id`,`unsubscriber_type`),
  KEY `index_mailboxer_conversation_opt_outs_on_conversation_id` (`conversation_id`),
  CONSTRAINT `mb_opt_outs_on_conversations_id` FOREIGN KEY (`conversation_id`) REFERENCES `mailboxer_conversations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailboxer_conversation_opt_outs`
--

LOCK TABLES `mailboxer_conversation_opt_outs` WRITE;
/*!40000 ALTER TABLE `mailboxer_conversation_opt_outs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailboxer_conversation_opt_outs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailboxer_conversations`
--

DROP TABLE IF EXISTS `mailboxer_conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailboxer_conversations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailboxer_conversations`
--

LOCK TABLES `mailboxer_conversations` WRITE;
/*!40000 ALTER TABLE `mailboxer_conversations` DISABLE KEYS */;
INSERT INTO `mailboxer_conversations` VALUES (1,'welcome','2015-11-02 09:08:57','2015-11-02 09:12:30'),(2,'hi','2015-11-05 23:46:12','2015-11-05 23:46:12');
/*!40000 ALTER TABLE `mailboxer_conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailboxer_notifications`
--

DROP TABLE IF EXISTS `mailboxer_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailboxer_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `body` text,
  `subject` varchar(255) DEFAULT '',
  `sender_id` int(11) DEFAULT NULL,
  `sender_type` varchar(255) DEFAULT NULL,
  `conversation_id` int(11) DEFAULT NULL,
  `draft` tinyint(1) DEFAULT '0',
  `notification_code` varchar(255) DEFAULT NULL,
  `notified_object_id` int(11) DEFAULT NULL,
  `notified_object_type` varchar(255) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `global` tinyint(1) DEFAULT '0',
  `expires` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_mailboxer_notifications_on_conversation_id` (`conversation_id`),
  KEY `index_mailboxer_notifications_on_type` (`type`),
  KEY `index_mailboxer_notifications_on_sender_id_and_sender_type` (`sender_id`,`sender_type`),
  KEY `index_mailboxer_notifications_on_notified_object_id_and_type` (`notified_object_id`,`notified_object_type`),
  CONSTRAINT `notifications_on_conversation_id` FOREIGN KEY (`conversation_id`) REFERENCES `mailboxer_conversations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailboxer_notifications`
--

LOCK TABLES `mailboxer_notifications` WRITE;
/*!40000 ALTER TABLE `mailboxer_notifications` DISABLE KEYS */;
INSERT INTO `mailboxer_notifications` VALUES (1,NULL,'Bill Gates has invited you to join his team P2P!','INVITE',2,'User',NULL,0,'3',NULL,NULL,'1','2015-10-26 07:25:25','2015-10-26 07:25:25',0,NULL),(2,NULL,'Akash has accepted your invitation  to join team P2P','SUCCESS',NULL,NULL,NULL,0,'5',NULL,NULL,NULL,'2015-10-26 07:25:40','2015-10-26 07:25:40',0,NULL),(3,NULL,'Mark Zuckerberg has invited you to join his team DashDash!','INVITE',3,'User',NULL,0,'3',NULL,NULL,'2','2015-10-29 04:52:38','2015-10-29 04:52:38',0,NULL),(4,NULL,'Itachi has accepted your invitation  to join team DashDash','SUCCESS',NULL,NULL,NULL,0,'5',NULL,NULL,NULL,'2015-10-29 05:14:12','2015-10-29 05:14:12',0,NULL),(5,NULL,'Sakura Haruno has invited you to join his team Losing Experience!','INVITE',5,'User',NULL,0,'3',NULL,NULL,'3','2015-10-29 05:19:13','2015-10-29 05:19:12',0,NULL),(6,NULL,'Sakura Haruno has invited you to join his team Losing Experience!','INVITE',5,'User',NULL,0,'3',NULL,NULL,'3','2015-10-29 05:19:16','2015-10-29 05:19:16',0,NULL),(7,NULL,'Bill has rejected your invitation  to join team Losing Experience','DENIED',NULL,NULL,NULL,0,'5',NULL,NULL,NULL,'2015-10-29 05:27:01','2015-10-29 05:27:01',0,NULL),(8,NULL,'Bill Gates has invited you to join his team Movie Browser!','INVITE',2,'User',NULL,0,'3',NULL,NULL,'4','2015-10-30 08:56:44','2015-10-30 08:56:44',0,NULL),(9,NULL,'Bill Gates has invited you to join his team Movie Browser!','INVITE',2,'User',NULL,0,'3',NULL,NULL,'4','2015-10-30 08:56:51','2015-10-30 08:56:51',0,NULL),(10,NULL,'Akash has accepted your invitation  to join team Movie Browser','SUCCESS',NULL,NULL,NULL,0,'5',NULL,NULL,NULL,'2015-10-30 09:37:37','2015-10-30 09:37:37',0,NULL),(11,NULL,'Akash Malik has invited you to join his team P2P!','INVITE',1,'User',NULL,0,'3',NULL,NULL,'1','2015-10-30 21:46:06','2015-10-30 21:46:06',0,NULL),(12,NULL,'Akash has rejected your invitation  to join team Movie Browser','DENIED',NULL,NULL,NULL,0,'5',NULL,NULL,NULL,'2015-11-02 06:33:25','2015-11-02 06:33:25',0,NULL),(13,NULL,'Akash has rejected your invitation  to join team P2P','DENIED',NULL,NULL,NULL,0,'5',NULL,NULL,NULL,'2015-11-02 06:33:35','2015-11-02 06:33:35',0,NULL),(14,NULL,'Bill has rejected your invitation  to join team Losing Experience','DENIED',NULL,NULL,NULL,0,'5',NULL,NULL,NULL,'2015-11-02 06:34:35','2015-11-02 06:34:35',0,NULL),(15,NULL,'Bill Gates has invited you to join his team Losing Experience!','INVITE',2,'User',NULL,0,'3',NULL,NULL,'3','2015-11-02 06:59:27','2015-11-02 06:59:27',0,NULL),(16,NULL,'Mark has rejected your invitation  to join team Losing Experience','DENIED',NULL,NULL,NULL,0,'6',NULL,NULL,NULL,'2015-11-02 07:06:14','2015-11-02 07:06:14',0,NULL),(17,NULL,'Mark has rejected your invitation  to join team P2P','DENIED',NULL,NULL,NULL,0,'6',NULL,NULL,NULL,'2015-11-02 07:06:17','2015-11-02 07:06:17',0,NULL),(18,NULL,'Mark has rejected your invitation  to join team Movie Browser','DENIED',NULL,NULL,NULL,0,'6',NULL,NULL,NULL,'2015-11-02 07:06:19','2015-11-02 07:06:19',0,NULL),(19,NULL,'Bill Gates has invited you to join his team Losing Experience!','INVITE',2,'User',NULL,0,'3',NULL,NULL,'3','2015-11-02 07:10:26','2015-11-02 07:10:26',0,NULL),(20,NULL,'Mark has accepted your invitation  to join team Losing Experience','SUCCESS',NULL,NULL,NULL,0,'5',NULL,NULL,NULL,'2015-11-02 07:11:10','2015-11-02 07:11:10',0,NULL),(21,NULL,'Bill Gates has invited you to join his team P2P!','INVITE',2,'User',NULL,0,'3',NULL,NULL,'1','2015-11-02 07:18:00','2015-11-02 07:18:00',0,NULL),(22,NULL,'Mark has rejected your invitation  to join team P2P','DENIED',NULL,NULL,NULL,0,'6',NULL,NULL,NULL,'2015-11-02 07:20:26','2015-11-02 07:20:26',0,NULL),(23,NULL,'Mark Zuckerberg has invited you to join his team Losing Experience!','INVITE',3,'User',NULL,0,'3',NULL,NULL,'3','2015-11-02 07:29:43','2015-11-02 07:29:43',0,NULL),(24,NULL,'Bill has rejected your invitation  to join team Losing Experience','DENIED',NULL,NULL,NULL,0,'6',NULL,NULL,NULL,'2015-11-02 07:37:40','2015-11-02 07:37:40',0,NULL),(25,NULL,'Mark Zuckerberg has invited you to join his team Losing Experience!','INVITE',3,'User',NULL,0,'3',NULL,NULL,'3','2015-11-02 07:42:13','2015-11-02 07:42:13',0,NULL),(26,NULL,'Bill has rejected your invitation  to join team Losing Experience','DENIED',NULL,NULL,NULL,0,'6',NULL,NULL,NULL,'2015-11-02 07:42:59','2015-11-02 07:42:59',0,NULL),(27,NULL,'Mark Zuckerberg has expressed interest in joining your team Losing Experience !','OFFER',3,'User',NULL,0,'1',NULL,NULL,'3','2015-11-02 08:00:34','2015-11-02 08:00:34',0,NULL),(28,NULL,'Sakura Haruno has invited you to join his team Losing Experience!','INVITE',5,'User',NULL,0,'3',NULL,NULL,'3','2015-11-02 08:02:26','2015-11-02 08:02:26',0,NULL),(29,NULL,' You were accepted to the team Losing Experience','SUCCESS',NULL,NULL,NULL,0,'5',NULL,NULL,NULL,'2015-11-02 08:02:49','2015-11-02 08:02:49',0,NULL),(30,NULL,'Bill has accepted the invitation  to join team Losing Experience','SUCCESS',NULL,NULL,NULL,0,'5',NULL,NULL,NULL,'2015-11-02 08:03:44','2015-11-02 08:03:44',0,NULL),(31,NULL,'Bill has accepted the invitation  to join team Losing Experience','SUCCESS',NULL,NULL,NULL,0,'5',NULL,NULL,NULL,'2015-11-02 08:03:44','2015-11-02 08:03:44',0,NULL),(32,NULL,'Itachi has rejected your invitation  to join team Losing Experience','DENIED',NULL,NULL,NULL,0,'6',NULL,NULL,NULL,'2015-11-02 08:04:45','2015-11-02 08:04:45',0,NULL),(33,NULL,'Itachi has rejected your invitation  to join team DashDash','DENIED',NULL,NULL,NULL,0,'6',NULL,NULL,NULL,'2015-11-02 08:04:48','2015-11-02 08:04:48',0,NULL),(34,NULL,'Itachi Uchiha has expressed interest in joining your team Losing Experience !','OFFER',4,'User',NULL,0,'1',NULL,NULL,'3','2015-11-02 08:04:57','2015-11-02 08:04:57',0,NULL),(35,NULL,' Itachi was successfully added to your team Losing Experience','SUCCESS',NULL,NULL,NULL,0,'5',NULL,NULL,NULL,'2015-11-02 08:05:40','2015-11-02 08:05:40',0,NULL),(36,NULL,' Itachi was successfully added to your team Losing Experience','SUCCESS',NULL,NULL,NULL,0,'5',NULL,NULL,NULL,'2015-11-02 08:05:40','2015-11-02 08:05:40',0,NULL),(37,NULL,' You were accepted to the team Losing Experience','SUCCESS',NULL,NULL,NULL,0,'5',NULL,NULL,NULL,'2015-11-02 08:05:40','2015-11-02 08:05:40',0,NULL),(38,'Mailboxer::Message','welcome to the team. lets start discussing ideas.','welcome',3,'User',1,0,NULL,NULL,NULL,NULL,'2015-11-02 09:08:57','2015-11-02 09:08:57',0,NULL),(39,'Mailboxer::Message','sure. I\'d like that !','welcome',2,'User',1,0,NULL,NULL,NULL,NULL,'2015-11-02 09:10:44','2015-11-02 09:10:44',0,NULL),(40,'Mailboxer::Message','Me too. I like everything !','welcome',5,'User',1,0,NULL,NULL,NULL,NULL,'2015-11-02 09:11:39','2015-11-02 09:11:39',0,NULL),(41,'Mailboxer::Message','ahaha i know','welcome',2,'User',1,0,NULL,NULL,NULL,NULL,'2015-11-02 09:12:30','2015-11-02 09:12:30',0,NULL),(42,NULL,'Sakura Haruno has invited you to join his team Losing Experience!','INVITE',5,'User',NULL,0,'3',NULL,NULL,'3','2015-11-05 05:57:58','2015-11-05 05:57:58',0,NULL),(43,NULL,'Mark has accepted the invitation  to join team Losing Experience','SUCCESS',NULL,NULL,NULL,0,'5',NULL,NULL,NULL,'2015-11-05 05:58:08','2015-11-05 05:58:08',0,NULL),(44,NULL,'Mark has accepted the invitation  to join team Losing Experience','SUCCESS',NULL,NULL,NULL,0,'5',NULL,NULL,NULL,'2015-11-05 05:58:08','2015-11-05 05:58:08',0,NULL),(45,NULL,'Mark has accepted the invitation  to join team Losing Experience','SUCCESS',NULL,NULL,NULL,0,'5',NULL,NULL,NULL,'2015-11-05 05:58:08','2015-11-05 05:58:08',0,NULL),(46,NULL,'Sakura Haruno has invited you to join his team Losing Experience!','INVITE',5,'User',NULL,0,'3',NULL,NULL,'3','2015-11-05 05:59:17','2015-11-05 05:59:17',0,NULL),(47,NULL,'Mark has accepted the invitation  to join team Losing Experience','SUCCESS',NULL,NULL,NULL,0,'5',NULL,NULL,NULL,'2015-11-05 05:59:31','2015-11-05 05:59:31',0,NULL),(48,NULL,'Mark has accepted the invitation  to join team Losing Experience','SUCCESS',NULL,NULL,NULL,0,'5',NULL,NULL,NULL,'2015-11-05 05:59:31','2015-11-05 05:59:31',0,NULL),(49,NULL,'Mark has accepted the invitation  to join team Losing Experience','SUCCESS',NULL,NULL,NULL,0,'5',NULL,NULL,NULL,'2015-11-05 05:59:31','2015-11-05 05:59:31',0,NULL),(50,NULL,'Mark has left your team Losing Experience','TREACHERY',NULL,NULL,NULL,0,'7',NULL,NULL,NULL,'2015-11-05 05:59:38','2015-11-05 05:59:38',0,NULL),(51,NULL,'Mark has left your team Losing Experience','TREACHERY',NULL,NULL,NULL,0,'7',NULL,NULL,NULL,'2015-11-05 05:59:38','2015-11-05 05:59:38',0,NULL),(52,NULL,'Mark has left your team Losing Experience','TREACHERY',NULL,NULL,NULL,0,'7',NULL,NULL,NULL,'2015-11-05 05:59:38','2015-11-05 05:59:38',0,NULL),(53,NULL,'Akash has left your team Movie Browser','TREACHERY',NULL,NULL,NULL,0,'7',NULL,NULL,NULL,'2015-11-05 23:39:26','2015-11-05 23:39:26',0,NULL),(54,NULL,'Akash Malik has expressed interest in joining your team DashDash !','OFFER',1,'User',NULL,0,'1',NULL,NULL,'2','2015-11-05 23:40:11','2015-11-05 23:40:11',0,NULL),(55,NULL,' Akash was successfully added to your team DashDash','SUCCESS',NULL,NULL,NULL,0,'5',NULL,NULL,NULL,'2015-11-05 23:40:55','2015-11-05 23:40:55',0,NULL),(56,NULL,' You were accepted to the team DashDash','SUCCESS',NULL,NULL,NULL,0,'5',NULL,NULL,NULL,'2015-11-05 23:40:55','2015-11-05 23:40:55',0,NULL),(57,NULL,'Mark has left your team DashDash','TREACHERY',NULL,NULL,NULL,0,'7',NULL,NULL,NULL,'2015-11-05 23:41:55','2015-11-05 23:41:55',0,NULL),(58,NULL,'Mark has left your team DashDash','TREACHERY',NULL,NULL,NULL,0,'7',NULL,NULL,NULL,'2015-11-05 23:41:55','2015-11-05 23:41:55',0,NULL),(59,NULL,'Mark Zuckerberg has expressed interest in joining your team Movie Browser !','OFFER',3,'User',NULL,0,'1',NULL,NULL,'4','2015-11-05 23:42:05','2015-11-05 23:42:05',0,NULL),(60,NULL,' You were accepted to the team Movie Browser','SUCCESS',NULL,NULL,NULL,0,'5',NULL,NULL,NULL,'2015-11-05 23:43:08','2015-11-05 23:43:08',0,NULL),(61,NULL,'Bill Gates has invited you to join his team Movie Browser!','INVITE',2,'User',NULL,0,'3',NULL,NULL,'4','2015-11-05 23:43:23','2015-11-05 23:43:23',0,NULL),(62,'Mailboxer::Message','lets staert working','hi',1,'User',2,0,NULL,NULL,NULL,NULL,'2015-11-05 23:46:12','2015-11-05 23:46:12',0,NULL),(63,NULL,'Mark has left your team Movie Browser','TREACHERY',NULL,NULL,NULL,0,'7',NULL,NULL,NULL,'2015-11-06 23:01:45','2015-11-06 23:01:45',0,NULL),(64,NULL,'Please rate Mark\'s skill performance in the team Losing Experience','RATING',3,'User',NULL,0,'10',NULL,NULL,'3','2015-11-08 06:49:43','2015-11-08 06:49:43',0,NULL),(65,NULL,'Please rate Itachi\'s skill performance in the team Losing Experience','RATING',4,'User',NULL,0,'10',NULL,NULL,'3','2015-11-08 06:49:43','2015-11-08 06:49:43',0,NULL),(66,NULL,'Please rate Sakura\'s skill performance in the team Losing Experience','RATING',5,'User',NULL,0,'10',NULL,NULL,'3','2015-11-08 06:49:43','2015-11-08 06:49:43',0,NULL),(67,NULL,'Please rate Bill\'s skill performance in the team Losing Experience','RATING',2,'User',NULL,0,'10',NULL,NULL,'3','2015-11-08 06:49:43','2015-11-08 06:49:43',0,NULL),(68,NULL,'Please rate Itachi\'s skill performance in the team Losing Experience','RATING',4,'User',NULL,0,'10',NULL,NULL,'3','2015-11-08 06:49:43','2015-11-08 06:49:43',0,NULL),(69,NULL,'Please rate Sakura\'s skill performance in the team Losing Experience','RATING',5,'User',NULL,0,'10',NULL,NULL,'3','2015-11-08 06:49:43','2015-11-08 06:49:43',0,NULL),(70,NULL,'Please rate Bill\'s skill performance in the team Losing Experience','RATING',2,'User',NULL,0,'10',NULL,NULL,'3','2015-11-08 06:49:43','2015-11-08 06:49:43',0,NULL),(71,NULL,'Please rate Mark\'s skill performance in the team Losing Experience','RATING',3,'User',NULL,0,'10',NULL,NULL,'3','2015-11-08 06:49:43','2015-11-08 06:49:43',0,NULL),(72,NULL,'Please rate Sakura\'s skill performance in the team Losing Experience','RATING',5,'User',NULL,0,'10',NULL,NULL,'3','2015-11-08 06:49:43','2015-11-08 06:49:43',0,NULL),(73,NULL,'Please rate Bill\'s skill performance in the team Losing Experience','RATING',2,'User',NULL,0,'10',NULL,NULL,'3','2015-11-08 06:49:43','2015-11-08 06:49:43',0,NULL),(74,NULL,'Please rate Mark\'s skill performance in the team Losing Experience','RATING',3,'User',NULL,0,'10',NULL,NULL,'3','2015-11-08 06:49:43','2015-11-08 06:49:43',0,NULL),(75,NULL,'Please rate Itachi\'s skill performance in the team Losing Experience','RATING',4,'User',NULL,0,'10',NULL,NULL,'3','2015-11-08 06:49:43','2015-11-08 06:49:43',0,NULL),(76,NULL,'Please rate Mark\'s skill performance in the team Losing Experience','RATING',3,'User',NULL,0,'10',NULL,NULL,'3','2015-11-11 10:34:21','2015-11-11 10:34:21',0,NULL),(77,NULL,'Please rate Itachi\'s skill performance in the team Losing Experience','RATING',4,'User',NULL,0,'10',NULL,NULL,'3','2015-11-11 10:34:21','2015-11-11 10:34:21',0,NULL),(78,NULL,'Please rate Sakura\'s skill performance in the team Losing Experience','RATING',5,'User',NULL,0,'10',NULL,NULL,'3','2015-11-11 10:34:21','2015-11-11 10:34:21',0,NULL),(79,NULL,'Please rate Bill\'s skill performance in the team Losing Experience','RATING',2,'User',NULL,0,'10',NULL,NULL,'3','2015-11-11 10:34:21','2015-11-11 10:34:21',0,NULL),(80,NULL,'Please rate Itachi\'s skill performance in the team Losing Experience','RATING',4,'User',NULL,0,'10',NULL,NULL,'3','2015-11-11 10:34:21','2015-11-11 10:34:21',0,NULL),(81,NULL,'Please rate Sakura\'s skill performance in the team Losing Experience','RATING',5,'User',NULL,0,'10',NULL,NULL,'3','2015-11-11 10:34:21','2015-11-11 10:34:21',0,NULL),(82,NULL,'Please rate Bill\'s skill performance in the team Losing Experience','RATING',2,'User',NULL,0,'10',NULL,NULL,'3','2015-11-11 10:34:21','2015-11-11 10:34:21',0,NULL),(83,NULL,'Please rate Mark\'s skill performance in the team Losing Experience','RATING',3,'User',NULL,0,'10',NULL,NULL,'3','2015-11-11 10:34:21','2015-11-11 10:34:21',0,NULL),(84,NULL,'Please rate Sakura\'s skill performance in the team Losing Experience','RATING',5,'User',NULL,0,'10',NULL,NULL,'3','2015-11-11 10:34:21','2015-11-11 10:34:21',0,NULL),(85,NULL,'Please rate Bill\'s skill performance in the team Losing Experience','RATING',2,'User',NULL,0,'10',NULL,NULL,'3','2015-11-11 10:34:21','2015-11-11 10:34:21',0,NULL),(86,NULL,'Please rate Mark\'s skill performance in the team Losing Experience','RATING',3,'User',NULL,0,'10',NULL,NULL,'3','2015-11-11 10:34:21','2015-11-11 10:34:21',0,NULL),(87,NULL,'Please rate Itachi\'s skill performance in the team Losing Experience','RATING',4,'User',NULL,0,'10',NULL,NULL,'3','2015-11-11 10:34:21','2015-11-11 10:34:21',0,NULL);
/*!40000 ALTER TABLE `mailboxer_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailboxer_receipts`
--

DROP TABLE IF EXISTS `mailboxer_receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailboxer_receipts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receiver_id` int(11) DEFAULT NULL,
  `receiver_type` varchar(255) DEFAULT NULL,
  `notification_id` int(11) NOT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `trashed` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  `mailbox_type` varchar(25) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_mailboxer_receipts_on_notification_id` (`notification_id`),
  KEY `index_mailboxer_receipts_on_receiver_id_and_receiver_type` (`receiver_id`,`receiver_type`),
  CONSTRAINT `receipts_on_notification_id` FOREIGN KEY (`notification_id`) REFERENCES `mailboxer_notifications` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailboxer_receipts`
--

LOCK TABLES `mailboxer_receipts` WRITE;
/*!40000 ALTER TABLE `mailboxer_receipts` DISABLE KEYS */;
INSERT INTO `mailboxer_receipts` VALUES (1,1,'User',1,0,0,1,NULL,'2015-10-26 07:25:25','2015-10-26 07:25:25'),(2,2,'User',2,0,0,1,NULL,'2015-10-26 07:25:40','2015-10-26 07:25:40'),(3,4,'User',3,0,0,1,NULL,'2015-10-29 04:52:38','2015-10-29 04:52:38'),(4,3,'User',4,0,0,1,NULL,'2015-10-29 05:14:12','2015-10-29 05:14:12'),(5,4,'User',5,0,0,1,NULL,'2015-10-29 05:19:12','2015-10-29 05:19:12'),(6,2,'User',6,0,0,1,NULL,'2015-10-29 05:19:16','2015-10-29 05:19:16'),(7,5,'User',7,0,0,1,NULL,'2015-10-29 05:27:01','2015-10-29 05:27:01'),(8,1,'User',8,0,0,1,NULL,'2015-10-30 08:56:44','2015-10-30 08:56:44'),(9,3,'User',9,0,0,1,NULL,'2015-10-30 08:56:51','2015-10-30 08:56:51'),(10,2,'User',10,0,0,1,NULL,'2015-10-30 09:37:37','2015-10-30 09:37:37'),(11,3,'User',11,0,0,1,NULL,'2015-10-30 21:46:06','2015-10-30 21:46:06'),(12,2,'User',12,0,0,1,NULL,'2015-11-02 06:33:25','2015-11-02 06:33:25'),(13,2,'User',13,0,0,1,NULL,'2015-11-02 06:33:35','2015-11-02 06:33:35'),(14,5,'User',14,0,0,1,NULL,'2015-11-02 06:34:35','2015-11-02 06:34:35'),(15,3,'User',15,0,0,1,NULL,'2015-11-02 06:59:27','2015-11-02 06:59:27'),(16,2,'User',16,0,0,1,NULL,'2015-11-02 07:06:14','2015-11-02 07:06:14'),(17,1,'User',17,0,0,1,NULL,'2015-11-02 07:06:17','2015-11-02 07:06:17'),(18,2,'User',18,0,0,1,NULL,'2015-11-02 07:06:19','2015-11-02 07:06:19'),(19,3,'User',19,0,0,1,NULL,'2015-11-02 07:10:26','2015-11-02 07:10:26'),(20,2,'User',20,0,0,1,NULL,'2015-11-02 07:11:10','2015-11-02 07:11:10'),(21,3,'User',21,0,0,1,NULL,'2015-11-02 07:18:00','2015-11-02 07:18:00'),(22,2,'User',22,0,0,1,NULL,'2015-11-02 07:20:26','2015-11-02 07:20:26'),(23,2,'User',23,0,0,1,NULL,'2015-11-02 07:29:43','2015-11-02 07:29:43'),(24,3,'User',24,0,0,1,NULL,'2015-11-02 07:37:40','2015-11-02 07:37:40'),(25,2,'User',25,0,0,1,NULL,'2015-11-02 07:42:13','2015-11-02 07:42:13'),(26,3,'User',26,0,0,1,NULL,'2015-11-02 07:42:59','2015-11-02 07:42:59'),(27,5,'User',27,0,0,1,NULL,'2015-11-02 08:00:34','2015-11-02 08:00:34'),(28,2,'User',28,0,0,1,NULL,'2015-11-02 08:02:26','2015-11-02 08:02:26'),(29,3,'User',29,0,0,1,NULL,'2015-11-02 08:02:49','2015-11-02 08:02:49'),(30,5,'User',30,0,0,1,NULL,'2015-11-02 08:03:44','2015-11-02 08:03:44'),(31,3,'User',31,0,0,1,NULL,'2015-11-02 08:03:44','2015-11-02 08:03:44'),(32,5,'User',32,0,0,1,NULL,'2015-11-02 08:04:45','2015-11-02 08:04:45'),(33,3,'User',33,0,0,1,NULL,'2015-11-02 08:04:48','2015-11-02 08:04:48'),(34,5,'User',34,0,0,1,NULL,'2015-11-02 08:04:57','2015-11-02 08:04:57'),(35,2,'User',35,0,0,1,NULL,'2015-11-02 08:05:40','2015-11-02 08:05:40'),(36,3,'User',36,0,0,1,NULL,'2015-11-02 08:05:40','2015-11-02 08:05:40'),(37,4,'User',37,0,0,1,NULL,'2015-11-02 08:05:40','2015-11-02 08:05:40'),(38,2,'User',38,1,0,0,'inbox','2015-11-02 09:08:57','2015-11-02 09:08:57'),(39,4,'User',38,0,0,0,'inbox','2015-11-02 09:08:57','2015-11-02 09:08:57'),(40,5,'User',38,1,0,0,'inbox','2015-11-02 09:08:57','2015-11-02 09:08:57'),(41,3,'User',38,1,0,0,'sentbox','2015-11-02 09:08:57','2015-11-02 09:08:57'),(42,4,'User',39,0,0,0,'inbox','2015-11-02 09:10:44','2015-11-02 09:10:44'),(43,5,'User',39,1,0,0,'inbox','2015-11-02 09:10:44','2015-11-02 09:10:44'),(44,3,'User',39,1,0,0,'inbox','2015-11-02 09:10:44','2015-11-02 09:10:44'),(45,2,'User',39,1,0,0,'sentbox','2015-11-02 09:10:44','2015-11-02 09:10:44'),(46,4,'User',40,0,0,0,'inbox','2015-11-02 09:11:39','2015-11-02 09:11:39'),(47,3,'User',40,1,0,0,'inbox','2015-11-02 09:11:39','2015-11-02 09:11:39'),(48,2,'User',40,1,0,0,'inbox','2015-11-02 09:11:39','2015-11-02 09:11:39'),(49,5,'User',40,1,0,0,'sentbox','2015-11-02 09:11:39','2015-11-02 09:11:39'),(50,4,'User',41,0,0,0,'inbox','2015-11-02 09:12:30','2015-11-02 09:12:30'),(51,3,'User',41,1,0,0,'inbox','2015-11-02 09:12:30','2015-11-02 09:12:30'),(52,5,'User',41,1,0,0,'inbox','2015-11-02 09:12:30','2015-11-02 09:12:30'),(53,2,'User',41,1,0,0,'sentbox','2015-11-02 09:12:30','2015-11-02 09:12:30'),(54,3,'User',42,0,0,1,NULL,'2015-11-05 05:57:58','2015-11-05 05:57:58'),(55,2,'User',43,0,0,1,NULL,'2015-11-05 05:58:08','2015-11-05 05:58:08'),(56,4,'User',44,0,0,1,NULL,'2015-11-05 05:58:08','2015-11-05 05:58:08'),(57,5,'User',45,0,0,1,NULL,'2015-11-05 05:58:08','2015-11-05 05:58:08'),(58,3,'User',46,0,0,1,NULL,'2015-11-05 05:59:17','2015-11-05 05:59:17'),(59,2,'User',47,0,0,1,NULL,'2015-11-05 05:59:31','2015-11-05 05:59:31'),(60,4,'User',48,0,0,1,NULL,'2015-11-05 05:59:31','2015-11-05 05:59:31'),(61,5,'User',49,0,0,1,NULL,'2015-11-05 05:59:31','2015-11-05 05:59:31'),(62,2,'User',50,0,0,1,NULL,'2015-11-05 05:59:38','2015-11-05 05:59:38'),(63,4,'User',51,0,0,1,NULL,'2015-11-05 05:59:38','2015-11-05 05:59:38'),(64,5,'User',52,0,0,1,NULL,'2015-11-05 05:59:38','2015-11-05 05:59:38'),(65,2,'User',53,0,0,1,NULL,'2015-11-05 23:39:26','2015-11-05 23:39:26'),(66,3,'User',54,0,0,1,NULL,'2015-11-05 23:40:11','2015-11-05 23:40:11'),(67,4,'User',55,0,0,1,NULL,'2015-11-05 23:40:55','2015-11-05 23:40:55'),(68,1,'User',56,0,0,1,NULL,'2015-11-05 23:40:55','2015-11-05 23:40:55'),(69,1,'User',57,0,0,1,NULL,'2015-11-05 23:41:55','2015-11-05 23:41:55'),(70,4,'User',58,0,0,1,NULL,'2015-11-05 23:41:55','2015-11-05 23:41:55'),(71,2,'User',59,0,0,1,NULL,'2015-11-05 23:42:05','2015-11-05 23:42:05'),(72,3,'User',60,0,0,1,NULL,'2015-11-05 23:43:08','2015-11-05 23:43:08'),(73,1,'User',61,0,0,1,NULL,'2015-11-05 23:43:23','2015-11-05 23:43:23'),(74,4,'User',62,1,0,0,'inbox','2015-11-05 23:46:12','2015-11-05 23:46:12'),(75,1,'User',62,1,0,0,'sentbox','2015-11-05 23:46:12','2015-11-05 23:46:12'),(76,2,'User',63,0,0,1,NULL,'2015-11-06 23:01:45','2015-11-06 23:01:45'),(77,2,'User',64,0,0,1,NULL,'2015-11-08 06:49:43','2015-11-08 06:49:43'),(78,2,'User',65,0,0,1,NULL,'2015-11-08 06:49:43','2015-11-08 06:49:43'),(79,2,'User',66,0,0,1,NULL,'2015-11-08 06:49:43','2015-11-08 06:49:43'),(80,3,'User',67,0,0,1,NULL,'2015-11-08 06:49:43','2015-11-08 06:49:43'),(81,3,'User',68,0,0,1,NULL,'2015-11-08 06:49:43','2015-11-08 06:49:43'),(82,3,'User',69,0,0,1,NULL,'2015-11-08 06:49:43','2015-11-08 06:49:43'),(83,4,'User',70,0,0,0,NULL,'2015-11-08 06:49:43','2015-11-08 06:49:43'),(84,4,'User',71,0,0,0,NULL,'2015-11-08 06:49:43','2015-11-08 06:49:43'),(85,4,'User',72,0,0,0,NULL,'2015-11-08 06:49:43','2015-11-08 06:49:43'),(86,5,'User',73,0,0,0,NULL,'2015-11-08 06:49:43','2015-11-08 06:49:43'),(87,5,'User',74,0,0,0,NULL,'2015-11-08 06:49:43','2015-11-08 06:49:43'),(88,5,'User',75,0,0,0,NULL,'2015-11-08 06:49:43','2015-11-08 06:49:43'),(89,2,'User',76,0,0,1,NULL,'2015-11-11 10:34:21','2015-11-11 10:34:21'),(90,2,'User',77,0,0,1,NULL,'2015-11-11 10:34:21','2015-11-11 10:34:21'),(91,2,'User',78,0,0,1,NULL,'2015-11-11 10:34:21','2015-11-11 10:34:21'),(92,3,'User',79,0,0,1,NULL,'2015-11-11 10:34:21','2015-11-11 10:34:21'),(93,3,'User',80,0,0,1,NULL,'2015-11-11 10:34:21','2015-11-11 10:34:21'),(94,3,'User',81,0,0,1,NULL,'2015-11-11 10:34:21','2015-11-11 10:34:21'),(95,4,'User',82,0,0,0,NULL,'2015-11-11 10:34:21','2015-11-11 10:34:21'),(96,4,'User',83,0,0,0,NULL,'2015-11-11 10:34:21','2015-11-11 10:34:21'),(97,4,'User',84,0,0,0,NULL,'2015-11-11 10:34:21','2015-11-11 10:34:21'),(98,5,'User',85,0,0,0,NULL,'2015-11-11 10:34:21','2015-11-11 10:34:21'),(99,5,'User',86,0,0,0,NULL,'2015-11-11 10:34:21','2015-11-11 10:34:21'),(100,5,'User',87,0,0,0,NULL,'2015-11-11 10:34:21','2015-11-11 10:34:21');
/*!40000 ALTER TABLE `mailboxer_receipts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20151016215913'),('20151016220142'),('20151016220606'),('20151017042558'),('20151017063200'),('20151020070902'),('20151020070903'),('20151020070904'),('20151020095649'),('20151024035144'),('20151024035441'),('20151024035738'),('20151027095431'),('20151029061104'),('20151029061632'),('20151029062058'),('20151029062420'),('20151029062617'),('20151101220614'),('20151102052906'),('20151102053741'),('20151102054758'),('20151105060728'),('20151108053048'),('20151108053432'),('20151108054307'),('20151108055531'),('20151108083720'),('20151111105132'),('20151111105506'),('20151111110928');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_ratings`
--

DROP TABLE IF EXISTS `skill_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `reviews` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_skill_ratings_on_skill_id` (`skill_id`),
  KEY `index_skill_ratings_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_4235ea9a82` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_bfc6e783d1` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_ratings`
--

LOCK TABLES `skill_ratings` WRITE;
/*!40000 ALTER TABLE `skill_ratings` DISABLE KEYS */;
INSERT INTO `skill_ratings` VALUES (1,1,1,3,'2015-10-26 02:56:48','2015-10-26 03:02:53',0),(2,2,1,1,'2015-10-26 02:56:48','2015-10-26 03:02:53',0),(3,3,1,3,'2015-10-26 02:56:48','2015-11-05 23:45:31',0),(4,4,1,0,'2015-10-26 02:56:48','2015-10-26 02:56:48',0),(5,5,1,0,'2015-10-26 02:56:48','2015-10-26 02:56:48',0),(6,6,1,1,'2015-10-26 02:56:48','2015-10-26 03:02:53',0),(7,7,1,3,'2015-10-26 02:56:48','2015-11-05 23:45:31',0),(8,8,1,1,'2015-10-26 02:56:48','2015-10-26 03:02:53',0),(9,9,1,0,'2015-10-26 02:56:49','2015-10-26 02:56:49',0),(10,1,2,3,'2015-10-26 02:57:50','2015-10-26 06:22:49',0),(11,2,2,0,'2015-10-26 02:57:50','2015-11-11 11:37:16',0),(12,3,2,3,'2015-10-26 02:57:50','2015-10-26 06:22:49',0),(13,4,2,3,'2015-10-26 02:57:50','2015-11-11 11:36:02',1),(14,5,2,0,'2015-10-26 02:57:50','2015-10-26 02:57:50',0),(15,6,2,0,'2015-10-26 02:57:50','2015-10-26 02:57:50',0),(16,7,2,0,'2015-10-26 02:57:50','2015-10-26 02:57:50',0),(17,8,2,0,'2015-10-26 02:57:50','2015-10-26 02:57:50',0),(18,9,2,0,'2015-10-26 02:57:50','2015-10-26 02:57:50',0),(19,1,3,3,'2015-10-26 06:20:28','2015-11-11 09:56:31',0),(20,2,3,0.25,'2015-10-26 06:20:28','2015-11-11 11:38:09',1),(21,3,3,0,'2015-10-26 06:20:28','2015-11-11 09:56:31',0),(22,4,3,0.75,'2015-10-26 06:20:28','2015-11-11 11:38:09',1),(23,5,3,0,'2015-10-26 06:20:28','2015-11-11 09:56:31',0),(24,6,3,0,'2015-10-26 06:20:28','2015-11-11 09:56:31',0),(25,7,3,0,'2015-10-26 06:20:28','2015-11-11 09:56:31',0),(26,8,3,0,'2015-10-26 06:20:28','2015-11-11 09:56:31',0),(27,9,3,0,'2015-10-26 06:20:28','2015-11-11 09:56:31',0),(28,1,4,3,'2015-10-29 04:50:35','2015-10-29 04:50:57',0),(29,2,4,2.1875,'2015-10-29 04:50:35','2015-11-11 11:38:20',2),(30,3,4,3,'2015-10-29 04:50:35','2015-10-29 04:50:57',0),(31,4,4,2.75,'2015-10-29 04:50:35','2015-11-11 11:38:20',2),(32,5,4,0,'2015-10-29 04:50:35','2015-10-29 04:50:35',0),(33,6,4,3,'2015-10-29 04:50:35','2015-10-29 04:50:57',0),(34,7,4,1,'2015-10-29 04:50:35','2015-10-29 04:50:57',0),(35,8,4,0,'2015-10-29 04:50:35','2015-10-29 04:50:35',0),(36,9,4,0,'2015-10-29 04:50:35','2015-10-29 04:50:35',0),(37,1,5,0,'2015-10-29 05:15:39','2015-10-29 05:15:39',0),(38,2,5,0,'2015-10-29 05:15:39','2015-11-11 11:38:39',3),(39,3,5,0,'2015-10-29 05:15:39','2015-10-29 05:15:39',0),(40,4,5,0.328125,'2015-10-29 05:15:39','2015-11-11 11:38:39',3),(41,5,5,0,'2015-10-29 05:15:39','2015-10-29 05:15:39',0),(42,6,5,0,'2015-10-29 05:15:39','2015-10-29 05:15:39',0),(43,7,5,0,'2015-10-29 05:15:39','2015-10-29 05:15:39',0),(44,8,5,0,'2015-10-29 05:15:39','2015-10-29 05:15:39',0),(45,9,5,1,'2015-10-29 05:15:39','2015-10-29 05:17:13',0);
/*!40000 ALTER TABLE `skill_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'C++','2015-10-26 02:49:14','2015-10-26 02:49:14'),(2,'Python','2015-10-26 02:49:14','2015-10-26 02:49:14'),(3,'C','2015-10-26 02:49:14','2015-10-26 02:49:14'),(4,'Java','2015-10-26 02:49:14','2015-10-26 02:49:14'),(5,'iOS','2015-10-26 02:49:14','2015-10-26 02:49:14'),(6,'Android','2015-10-26 02:49:14','2015-10-26 02:49:14'),(7,'JavaScript','2015-10-26 02:49:14','2015-10-26 02:49:14'),(8,'Backend','2015-10-26 02:49:14','2015-10-26 02:49:14'),(9,'Frontend','2015-10-26 02:49:14','2015-10-26 02:49:14');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachings`
--

DROP TABLE IF EXISTS `teachings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teachings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachings`
--

LOCK TABLES `teachings` WRITE;
/*!40000 ALTER TABLE `teachings` DISABLE KEYS */;
/*!40000 ALTER TABLE `teachings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_memberships`
--

DROP TABLE IF EXISTS `team_memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_memberships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `feedback` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_team_memberships_on_user_id` (`user_id`),
  KEY `index_team_memberships_on_team_id` (`team_id`),
  CONSTRAINT `fk_rails_5aba9331a7` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_61c29b529e` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_memberships`
--

LOCK TABLES `team_memberships` WRITE;
/*!40000 ALTER TABLE `team_memberships` DISABLE KEYS */;
INSERT INTO `team_memberships` VALUES (1,2,1,NULL,'2015-10-26 07:06:45','2015-10-26 07:06:45'),(2,1,1,NULL,'2015-10-26 07:25:40','2015-10-26 07:25:40'),(4,4,2,NULL,'2015-10-29 05:14:12','2015-10-29 05:14:12'),(5,5,3,NULL,'2015-10-29 05:18:59','2015-10-29 05:18:59'),(6,2,4,NULL,'2015-10-30 08:56:38','2015-10-30 08:56:38'),(11,2,3,NULL,'2015-11-02 08:03:44','2015-11-02 08:03:44'),(12,4,3,NULL,'2015-11-02 08:05:40','2015-11-02 08:05:40'),(13,1,2,NULL,'2015-11-05 23:40:55','2015-11-05 23:40:55'),(14,3,3,NULL,'2015-11-08 06:47:22','2015-11-08 06:47:22');
/*!40000 ALTER TABLE `team_memberships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `passcode` varchar(255) DEFAULT NULL,
  `team_owner_id` int(11) DEFAULT NULL,
  `github` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_teams_on_course_id` (`course_id`),
  CONSTRAINT `fk_rails_360501fe0e` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,3,'P2P','Bittorrent clone','2015-10-26 07:06:45','2015-10-26 07:06:45','join or die',2,NULL),(2,5,'DashDash','Autocomplete parallized BASH','2015-10-26 07:39:06','2015-11-05 23:41:55','join or die',4,'https://github.com/tsleeve/teamup2'),(3,4,'Losing Experience','Join this team so you can lose definitely. Thats what I\'m best at.. being a loser','2015-10-29 05:18:59','2015-10-29 05:18:59','join or die',5,NULL),(4,1,'Movie Browser','MovieActor Database','2015-10-30 08:56:38','2015-10-30 08:56:38','join or die',2,NULL);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `prof_pic_file_name` varchar(255) DEFAULT NULL,
  `prof_pic_content_type` varchar(255) DEFAULT NULL,
  `prof_pic_file_size` int(11) DEFAULT NULL,
  `prof_pic_updated_at` datetime DEFAULT NULL,
  `github` varchar(255) DEFAULT NULL,
  `prof` tinyint(1) DEFAULT '0',
  `dependability` double DEFAULT '10',
  `reviews` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'akash5malik@gmail.com','$2a$10$Ia0Op0tShf8q8jospAMK6OXdej/lecgDW3Y7qcZd6xhf4hqkPxsYO',NULL,NULL,NULL,11,'2015-11-05 23:43:47','2015-11-05 23:38:18','71.189.165.212','71.189.165.212','2015-10-26 02:46:14','2015-11-11 10:58:30','Akash','Malik',704332974,'Computer Science',3,NULL,NULL,NULL,NULL,NULL,0,10,0),(2,'billgates@hotmail.com','$2a$10$U.25YNugy9wWtoc0TVVMxOZ2gJbeR0ndccnzP3YWNadVB1JgXPtxa',NULL,NULL,NULL,23,'2015-11-11 11:36:55','2015-11-08 07:14:31','169.232.85.84','169.232.85.84','2015-10-26 02:57:50','2015-11-11 11:36:55','Bill','Gates',111222333,'Computer Science',4,'Young-Bill-Gates.jpg','image/jpeg',70394,'2015-10-27 10:16:55',NULL,0,10,1),(3,'zuckerberg@facebook.com','$2a$10$5p8JpkuN2glSBsm3sp5NGu3U/Oow7juSl5iYHCNAnRf0uQKKCGXaa',NULL,NULL,NULL,28,'2015-11-11 09:52:44','2015-11-09 09:21:15','169.232.85.84','169.232.85.84','2015-10-26 06:20:28','2015-11-11 11:38:09','Mark','Zuckerberg',555555555,'Computer Science',4,'mark.jpg','image/jpeg',43591,'2015-10-27 10:14:19',NULL,0,10,1),(4,'uchiha@naruto.com','$2a$10$H4hVnfGFeZ2emed9ItdMH.iOVaoPWS9ehqRvVN1fgxosnSaqU4raW',NULL,NULL,NULL,6,'2015-11-11 11:43:19','2015-11-05 23:46:33','169.232.85.84','71.189.165.212','2015-10-29 04:50:35','2015-11-11 11:43:19','Itachi','Uchiha',111111111,'Advanced Ninja Studies',3,NULL,NULL,NULL,NULL,NULL,0,10,2),(5,'sakura@naruto.com','$2a$10$./OfXSg2n2aLHdUbchU15.lidqATBm7pCO7WlXvErkPRL2jYELsPC',NULL,NULL,NULL,12,'2015-11-05 06:00:11','2015-11-05 05:59:03','169.232.85.84','169.232.85.84','2015-10-29 05:15:38','2015-11-11 11:38:39','Sakura','Haruno',123456789,'Sucking ',1,'Sakura_Haruno.PNG','image/png',89513,'2015-10-29 05:16:56',NULL,0,7,2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-18  9:50:00
