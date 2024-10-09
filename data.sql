-- MySQL dump 10.13  Distrib 5.7.31, for Win64 (x86_64)
--
-- Host: localhost    Database: com
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add 社团',6,'add_community'),(22,'Can change 社团',6,'change_community'),(23,'Can delete 社团',6,'delete_community'),(24,'Can view 社团',6,'view_community'),(25,'Can add 用户信息',7,'add_userinfo'),(26,'Can change 用户信息',7,'change_userinfo'),(27,'Can delete 用户信息',7,'delete_userinfo'),(28,'Can view 用户信息',7,'view_userinfo'),(29,'Can add 社团分类',8,'add_community_type'),(30,'Can change 社团分类',8,'change_community_type'),(31,'Can delete 社团分类',8,'delete_community_type'),(32,'Can view 社团分类',8,'view_community_type'),(33,'Can add comment',9,'add_comment'),(34,'Can change comment',9,'change_comment'),(35,'Can delete comment',9,'delete_comment'),(36,'Can view comment',9,'view_comment'),(37,'Can add com_ shelf',10,'add_com_shelf'),(38,'Can change com_ shelf',10,'change_com_shelf'),(39,'Can delete com_ shelf',10,'delete_com_shelf'),(40,'Can view com_ shelf',10,'view_com_shelf'),(41,'Can add 申请记录',11,'add_apply'),(42,'Can change 申请记录',11,'change_apply'),(43,'Can delete 申请记录',11,'delete_apply'),(44,'Can view 申请记录',11,'view_apply'),(45,'Can add 申请记录',12,'add_active'),(46,'Can change 申请记录',12,'change_active'),(47,'Can delete 申请记录',12,'delete_active'),(48,'Can view 申请记录',12,'view_active');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_active`
--

DROP TABLE IF EXISTS `com_active`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `com_active` (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `desc` longtext,
  `community_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `com_active_community_id_3d94e564` (`community_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_active`
--

LOCK TABLES `com_active` WRITE;
/*!40000 ALTER TABLE `com_active` DISABLE KEYS */;
INSERT INTO `com_active` VALUES (1,1,'2024-10-07 20:30:22.000000','2023-03-24 20:30:22.062431',0,'联欢晚会','星期六，欢迎新生',1),(2,0,'2024-10-07 20:30:22.000000','2024-10-08 00:06:50.204458',0,'化妆晚会','星期五，欢迎新生',2),(3,1,'2024-10-07 20:30:22.000000','2023-03-24 20:30:22.097631',0,'滑板晚会','星期一，欢迎新生',3),(4,1,'2024-10-07 20:30:22.000000','2023-03-24 20:30:22.110889',0,'联欢晚会','星期六，欢迎新生',1),(5,0,'2024-10-07 20:30:22.000000','2024-10-08 00:06:36.232757',0,'化妆晚会','星期五，欢迎新生',2),(6,1,'2024-10-07 20:30:22.000000','2023-03-24 20:30:22.140045',0,'滑板晚会','星期一，欢迎新生',3),(7,1,'2024-10-07 20:30:22.000000','2023-03-24 20:30:22.156002',0,'联欢晚会','星期六，欢迎新生',1),(8,1,'2024-10-07 20:30:22.000000','2023-03-24 20:30:22.189200',0,'化妆晚会','星期五，欢迎新生',2),(9,0,'2024-10-07 20:30:22.000000','2024-10-08 00:06:25.399478',0,'滑板晚会','星期一，欢迎新生',3);
/*!40000 ALTER TABLE `com_active` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_apply`
--

DROP TABLE IF EXISTS `com_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `com_apply` (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `community_id` int DEFAULT NULL,
  `userinfo_id` int DEFAULT NULL,
  `apply_type` smallint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `com_apply_community_id_846e725a` (`community_id`),
  KEY `com_apply_userinfo_id_076b2076` (`userinfo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_apply`
--

LOCK TABLES `com_apply` WRITE;
/*!40000 ALTER TABLE `com_apply` DISABLE KEYS */;
INSERT INTO `com_apply` VALUES (1,1,'2024-10-07 18:52:19.000000','2024-10-07 22:00:23.000000',0,1,3,2),(2,1,'2024-10-07 15:54:12.000000','2024-10-07 16:11:07.000000',0,2,3,3),(3,1,'2024-10-07 17:25:45.000000','2024-10-07 17:26:17.000000',0,1,3,2),(4,1,'2024-10-07 22:00:06.000000','2024-10-07 22:00:06.000000',0,4,3,1),(5,1,'2024-09-18 20:41:13.441109','2024-10-07 20:41:13.000000',0,3,3,1),(6,1,'2024-10-07 01:01:29.157771','2024-10-07 01:01:29.157771',0,4,3,1),(7,1,'2024-10-08 01:13:47.030605','2024-10-08 01:13:47.030605',0,4,8,1);
/*!40000 ALTER TABLE `com_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_com_shelf`
--

DROP TABLE IF EXISTS `com_com_shelf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `com_com_shelf` (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `is_start` tinyint(1) NOT NULL,
  `community_id` int DEFAULT NULL,
  `userinfo_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `com_com_shelf_community_id_6528dd8e` (`community_id`),
  KEY `com_com_shelf_userinfo_id_82b81a63` (`userinfo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_com_shelf`
--

LOCK TABLES `com_com_shelf` WRITE;
/*!40000 ALTER TABLE `com_com_shelf` DISABLE KEYS */;
INSERT INTO `com_com_shelf` VALUES (1,1,'2024-10-07 15:26:24.000000','2024-10-07 15:54:04.000000',0,1,1,1),(2,1,'2024-10-07 19:15:46.000000','2024-10-07 22:00:04.000000',0,0,4,1),(3,1,'2024-10-07 15:54:10.000000','2024-10-07 15:54:10.000000',0,1,2,1),(4,1,'2024-10-07 15:18:20.000000','2024-10-07 15:18:44.000000',0,0,3,1),(5,1,'2024-10-07 17:25:43.000000','2024-10-07 17:25:43.000000',0,1,1,3),(6,1,'2024-10-07 20:41:08.000000','2024-10-07 20:41:08.000000',0,1,3,4);
/*!40000 ALTER TABLE `com_com_shelf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_comment`
--

DROP TABLE IF EXISTS `com_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `com_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `comment` varchar(225) DEFAULT NULL,
  `depth` int unsigned NOT NULL,
  `root` int unsigned DEFAULT NULL,
  `community_id` int NOT NULL,
  `reply_id` int DEFAULT NULL,
  `userinfo_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `com_comment_community_id_7d732d3a` (`community_id`),
  KEY `com_comment_reply_id_dffdec26` (`reply_id`),
  KEY `com_comment_userinfo_id_37e1f0a0` (`userinfo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_comment`
--

LOCK TABLES `com_comment` WRITE;
/*!40000 ALTER TABLE `com_comment` DISABLE KEYS */;
INSERT INTO `com_comment` VALUES (1,1,'2024-10-02 15:14:44.000000','2024-10-08 00:11:33.017960',0,'6',1,NULL,1,NULL,1),(2,0,'2024-10-02 15:14:44.000000','2024-10-07 20:44:15.000000',0,'5',1,NULL,1,NULL,1),(4,1,'2024-10-07 15:53:57.000000','2024-10-08 00:11:29.342271',0,'4',1,NULL,1,NULL,1),(5,1,'2024-10-07 15:18:15.000000','2024-10-07 18:07:31.000000',0,'3333',1,NULL,3,NULL,1),(6,1,'2024-10-07 20:40:53.000000','2024-10-08 00:11:23.239286',0,'2',1,NULL,2,NULL,4),(7,1,'2024-10-07 20:41:01.000000','2024-10-08 00:11:20.716362',0,'1',1,NULL,2,NULL,4),(8,1,'2024-10-08 01:08:57.620025','2024-10-08 01:08:57.620025',0,'我要添加',1,NULL,4,NULL,8);
/*!40000 ALTER TABLE `com_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_community`
--

DROP TABLE IF EXISTS `com_community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `com_community` (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(225) DEFAULT NULL,
  `com_img` varchar(100) NOT NULL,
  `desc` longtext,
  `hot` double NOT NULL,
  `community_type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `com_book_community_type_id_36333e19` (`community_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_community`
--

LOCK TABLES `com_community` WRITE;
/*!40000 ALTER TABLE `com_community` DISABLE KEYS */;
INSERT INTO `com_community` VALUES (1,1,'2023-03-23 20:33:48.552006','2024-10-07 15:54:44.002882',0,'银川能源学院操场','com/4.jpg','玩就完了',88.18938,5),(2,1,'2023-03-23 20:33:48.564974','2024-10-07 15:53:05.400103',0,'认知提升项目','com/3.jpg','进驻宁夏大学进行交流学习',19.21641,6),(3,1,'2023-03-23 20:33:48.577894','2024-10-07 15:37:05.696445',0,'python答疑班','com/2.png','方向：教育\r\n任务\r\n    python答疑老师\r\n    精通python语言，以及web框架django以flask,熟悉计算机底层',15.82528,7),(4,1,'2023-03-23 20:33:48.587973','2024-10-08 15:10:50.203192',0,'高定AI-私域AIGC解决方案领导者','com/1_V7ytpB8.jpg','方向：人工智能+教育\r\n任务安排\r\n        1.模型搭建 + 调优\r\n        2.录书\r\n        3.若依框架',68.70466,7);
/*!40000 ALTER TABLE `com_community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_community_type`
--

DROP TABLE IF EXISTS `com_community_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `com_community_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_community_type`
--

LOCK TABLES `com_community_type` WRITE;
/*!40000 ALTER TABLE `com_community_type` DISABLE KEYS */;
INSERT INTO `com_community_type` VALUES (5,1,'2023-03-23 20:26:25.579570','2023-03-23 20:26:25.579570',0,'商学院'),(6,1,'2023-03-23 20:26:25.596523','2023-03-23 20:26:25.596523',0,'机械学院'),(7,1,'2023-03-23 20:26:25.609490','2023-03-23 20:26:25.609490',0,'计算机学院'),(8,1,'2023-03-23 20:26:25.673280','2024-09-18 20:52:44.153394',0,'电力学院'),(9,1,'2023-03-23 20:26:25.688241','2023-03-27 18:05:10.324606',0,'外国语学院'),(10,0,'2023-03-24 21:15:31.373748','2023-03-24 21:16:07.910034',0,'幼师学院'),(11,0,'2024-09-18 20:52:37.511157','2024-09-18 20:52:39.272449',0,'文法学院');
/*!40000 ALTER TABLE `com_community_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_userinfo`
--

DROP TABLE IF EXISTS `com_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `com_userinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `user_type` smallint NOT NULL,
  `telephone` varchar(11) DEFAULT NULL,
  `avatar` varchar(100) NOT NULL,
  `addr` longtext,
  `community_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `com_userinfo_community_id_0a372571` (`community_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_userinfo`
--

LOCK TABLES `com_userinfo` WRITE;
/*!40000 ALTER TABLE `com_userinfo` DISABLE KEYS */;
INSERT INTO `com_userinfo` VALUES (1,'55e6faac56ac874595b13e61281f02f3',NULL,0,'测试1号','','','',0,0,'2023-03-23 16:12:05.945945',1,'19803630852','avatar/d_QZ5NSwN.gif','xxxxx学院xxxxx专业班级',NULL),(2,'36ef52f78e0d80846462d415d9384f4e',NULL,1,'admin','','','',0,1,'2023-03-23 20:19:39.107405',2,'15835623586','avatar/avatar.jpg','fsdf',3),(3,'55e6faac56ac874595b13e61281f02f3',NULL,0,'张三','','','',0,0,'2023-03-27 15:33:31.708252',1,NULL,'avatar/avatar.jpg',NULL,NULL),(4,'36ef52f78e0d80846462d415d9384f4e',NULL,1,'aaa','','','',0,0,'2024-09-18 20:40:22.010097',1,NULL,'avatar/avatar.jpg',NULL,NULL),(5,'36ef52f78e0d80846462d415d9384f4e',NULL,0,'高涛','','','',0,0,'2024-10-07 00:59:21.788475',1,NULL,'avatar/avatar.jpg',NULL,NULL),(6,'',NULL,0,'王党兵','','','',0,0,'2024-10-08 00:20:13.755667',1,'15869852547','avatar/avatar.jpg','大数据',4),(7,'',NULL,0,'马昌峰','','','',0,1,'2024-10-08 00:24:38.309981',1,'15869852547','avatar/avatar.jpg','df',4),(8,'36ef52f78e0d80846462d415d9384f4e',NULL,0,'王兵党','','','',0,1,'2024-10-08 00:57:13.469548',1,'15868569585','avatar/avatar.jpg','大数据',NULL);
/*!40000 ALTER TABLE `com_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_userinfo_groups`
--

DROP TABLE IF EXISTS `com_userinfo_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `com_userinfo_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userinfo_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `com_userinfo_groups_userinfo_id_group_id_0a378142_uniq` (`userinfo_id`,`group_id`),
  KEY `com_userinfo_groups_group_id_431a88e9_fk_auth_group_id` (`group_id`),
  CONSTRAINT `com_userinfo_groups_group_id_431a88e9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `com_userinfo_groups_userinfo_id_9fd1625f_fk_com_userinfo_id` FOREIGN KEY (`userinfo_id`) REFERENCES `com_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_userinfo_groups`
--

LOCK TABLES `com_userinfo_groups` WRITE;
/*!40000 ALTER TABLE `com_userinfo_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `com_userinfo_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_userinfo_user_permissions`
--

DROP TABLE IF EXISTS `com_userinfo_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `com_userinfo_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userinfo_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `com_userinfo_user_permis_userinfo_id_permission_i_3dc39d0d_uniq` (`userinfo_id`,`permission_id`),
  KEY `com_userinfo_user_pe_permission_id_25ba3052_fk_auth_perm` (`permission_id`),
  CONSTRAINT `com_userinfo_user_pe_permission_id_25ba3052_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `com_userinfo_user_pe_userinfo_id_1916b919_fk_com_useri` FOREIGN KEY (`userinfo_id`) REFERENCES `com_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_userinfo_user_permissions`
--

LOCK TABLES `com_userinfo_user_permissions` WRITE;
/*!40000 ALTER TABLE `com_userinfo_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `com_userinfo_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_com_userinfo_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_com_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `com_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(12,'com','active'),(11,'com','apply'),(10,'com','com_shelf'),(9,'com','comment'),(6,'com','community'),(8,'com','community_type'),(7,'com','userinfo'),(4,'contenttypes','contenttype'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-03-23 16:04:44.407241'),(2,'contenttypes','0002_remove_content_type_name','2023-03-23 16:04:44.617343'),(3,'auth','0001_initial','2023-03-23 16:04:44.877834'),(4,'auth','0002_alter_permission_name_max_length','2023-03-23 16:04:45.544243'),(5,'auth','0003_alter_user_email_max_length','2023-03-23 16:04:45.579149'),(6,'auth','0004_alter_user_username_opts','2023-03-23 16:04:45.635043'),(7,'auth','0005_alter_user_last_login_null','2023-03-23 16:04:45.660900'),(8,'auth','0006_require_contenttypes_0002','2023-03-23 16:04:45.690239'),(9,'auth','0007_alter_validators_add_error_messages','2023-03-23 16:04:45.726346'),(10,'auth','0008_alter_user_username_max_length','2023-03-23 16:04:45.758327'),(11,'auth','0009_alter_user_last_name_max_length','2023-03-23 16:04:45.787167'),(12,'auth','0010_alter_group_name_max_length','2023-03-23 16:04:45.835770'),(13,'auth','0011_update_proxy_permissions','2023-03-23 16:04:45.889634'),(14,'com','0001_initial','2023-03-23 16:04:46.498359'),(15,'admin','0001_initial','2023-03-23 16:04:47.141072'),(16,'admin','0002_logentry_remove_auto_add','2023-03-23 16:04:47.434769'),(17,'admin','0003_logentry_add_action_flag_choices','2023-03-23 16:04:47.473630'),(18,'sessions','0001_initial','2023-03-23 16:04:47.583932'),(19,'com','0002_community_type','2023-03-23 19:39:16.882084'),(20,'com','0003_community_community_type','2023-03-23 19:50:05.203299'),(21,'com','0004_auto_20230323_2048','2023-03-23 20:48:29.042737'),(22,'com','0005_comment','2023-03-24 15:13:57.424144'),(23,'com','0006_com_shelf','2023-03-24 15:17:17.777617'),(24,'com','0007_apply','2023-03-24 18:41:29.305928'),(25,'com','0008_apply_apply_type','2023-03-24 18:49:46.178241'),(26,'com','0009_auto_20230324_2027','2023-03-24 20:27:38.601723'),(27,'com','0010_auto_20230326_1610','2023-03-26 16:10:53.789179');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1820acno5hv9fufxdgippckt0s73dbeg','OTVkN2E5ZjZmMmQyMTIyMTc5Y2QyNDU2ODFlYjcwMDdkOTEwMjM3ZDp7InVzZXJfZGljIjp7ImlkIjoxLCJ1c2VybmFtZSI6Ilx1NmQ0Ylx1OGJkNTFcdTUzZjciLCJ1c2VyX3R5cGUiOjEsImF2YXRhciI6Ii9tZWRpYS9hdmF0YXIvZF9RWjVOU3dOLmdpZiIsImFkZHIiOiJ4eHh4eFx1NWI2Nlx1OTY2Mnh4eHh4XHU0ZTEzXHU0ZTFhXHU3M2VkXHU3ZWE3IiwidGVsZXBob25lIjoiMTk4MDM2MzA4NTIifX0=','2023-04-23 23:53:27.480384'),('7pag3rfaspivvee4l5121k7faytclxt3','NTVmM2I3ZjFmNTIwM2U1ZTQwMDkxMmE0MGNiNWNhYzQwM2MyYTRjNDp7InVzZXJfZGljIjp7ImlkIjoxLCJ1c2VybmFtZSI6Ilx1NmQ0Ylx1OGJkNTFcdTUzZjciLCJ1c2VyX3R5cGUiOjEsImF2YXRhciI6Ii9tZWRpYS9hdmF0YXIvYXZhdGFyLmpwZyIsInRlbGVwaG9uZSI6bnVsbH19','2023-04-06 16:12:14.050511'),('93i281xq2egry7n50k2qe0exu2st1etl','OTVkN2E5ZjZmMmQyMTIyMTc5Y2QyNDU2ODFlYjcwMDdkOTEwMjM3ZDp7InVzZXJfZGljIjp7ImlkIjoxLCJ1c2VybmFtZSI6Ilx1NmQ0Ylx1OGJkNTFcdTUzZjciLCJ1c2VyX3R5cGUiOjEsImF2YXRhciI6Ii9tZWRpYS9hdmF0YXIvZF9RWjVOU3dOLmdpZiIsImFkZHIiOiJ4eHh4eFx1NWI2Nlx1OTY2Mnh4eHh4XHU0ZTEzXHU0ZTFhXHU3M2VkXHU3ZWE3IiwidGVsZXBob25lIjoiMTk4MDM2MzA4NTIifX0=','2023-04-23 21:59:16.987297'),('atorgvthn7viydt5w149brrfjv6onrnr','OTVkN2E5ZjZmMmQyMTIyMTc5Y2QyNDU2ODFlYjcwMDdkOTEwMjM3ZDp7InVzZXJfZGljIjp7ImlkIjoxLCJ1c2VybmFtZSI6Ilx1NmQ0Ylx1OGJkNTFcdTUzZjciLCJ1c2VyX3R5cGUiOjEsImF2YXRhciI6Ii9tZWRpYS9hdmF0YXIvZF9RWjVOU3dOLmdpZiIsImFkZHIiOiJ4eHh4eFx1NWI2Nlx1OTY2Mnh4eHh4XHU0ZTEzXHU0ZTFhXHU3M2VkXHU3ZWE3IiwidGVsZXBob25lIjoiMTk4MDM2MzA4NTIifX0=','2023-04-23 18:34:39.104977'),('ed4t9gh0zplscmgin16xs6b02040i6ua','OTUyOGJjN2NlZTJhMGRiNmU1MGMxNjJjOTI4MWI2ZGQwMGMxZWMzNDp7InVzZXJfZGljIjp7ImlkIjozLCJ1c2VybmFtZSI6Ilx1NWYyMFx1NGUwOSIsInVzZXJfdHlwZSI6MSwiYXZhdGFyIjoiL21lZGlhL2F2YXRhci9hdmF0YXIuanBnIiwiYWRkciI6bnVsbCwidGVsZXBob25lIjpudWxsfX0=','2023-04-10 17:50:29.799191'),('m6j2l2blnyo2k660he9ru7xrlau7n0r3','YzAwNmYzMWZmMDk1Y2NiMTkxNjg5ODA2ZWU2YzllYmUxODNkNzllZTp7InVzZXJfZGljIjp7ImlkIjoyLCJ1c2VybmFtZSI6ImFkbWluIiwidXNlcl90eXBlIjoyLCJhdmF0YXIiOiIvbWVkaWEvYXZhdGFyL2F2YXRhci5qcGciLCJhZGRyIjpudWxsLCJ0ZWxlcGhvbmUiOm51bGx9fQ==','2023-04-23 18:17:45.066138'),('qa8jspbvpd7ek32r790iv8xe6xs9kwgh','MzdjZDBlNDljYjFhYmU0ZmQzNmMyZWUyODY3NzQzNjE3MWU4Zjg1Yzp7InVzZXJfZGljIjp7ImlkIjoxLCJ1c2VybmFtZSI6Ilx1NmQ0Ylx1OGJkNTFcdTUzZjciLCJ1c2VyX3R5cGUiOjEsImF2YXRhciI6Ii9tZWRpYS9hdmF0YXIvYXZhdGFyLmpwZyIsImFkZHIiOm51bGwsInRlbGVwaG9uZSI6bnVsbH19','2023-04-06 20:15:52.896814'),('tpfzzep88fbrm2v808le2t250np3ba59','YzAwNmYzMWZmMDk1Y2NiMTkxNjg5ODA2ZWU2YzllYmUxODNkNzllZTp7InVzZXJfZGljIjp7ImlkIjoyLCJ1c2VybmFtZSI6ImFkbWluIiwidXNlcl90eXBlIjoyLCJhdmF0YXIiOiIvbWVkaWEvYXZhdGFyL2F2YXRhci5qcGciLCJhZGRyIjpudWxsLCJ0ZWxlcGhvbmUiOm51bGx9fQ==','2023-04-09 23:40:39.452573'),('uaod4l2720j0cwocov47otfow694s7kl','Y2U0YjBjNzk3ZGYxNGM1NDRlZWJmNzQwOWQ4ZjRiOGU2OTg3ZGYyNTp7InVzZXJfZGljIjp7ImlkIjo0LCJ1c2VybmFtZSI6ImFhYSIsInVzZXJfdHlwZSI6MSwiYXZhdGFyIjoiL21lZGlhL2F2YXRhci9hdmF0YXIuanBnIiwiYWRkciI6bnVsbCwidGVsZXBob25lIjpudWxsfX0=','2024-10-02 21:42:04.776623'),('xcngzzp7iftshpfnfzvms34luc5tjxnp','NGRiOTkyMWIxOGRmZWM0OGVlNmMwNTNjYmU0ZDA5NTY4OWUwNGJjODp7fQ==','2023-04-09 16:16:00.899918'),('zrqk2gjwqhwwsg93p9smymgc2gy2qhlg','NGU4MzM0NzU3ODljNzNjMzE4YzhkZjJmZTczZDgzZTE4YmJiZTc2YTp7InVzZXJfZGljIjp7ImlkIjoyLCJ1c2VybmFtZSI6ImFkbWluIiwidXNlcl90eXBlIjoyLCJhdmF0YXIiOiIvbWVkaWEvYXZhdGFyL2F2YXRhci5qcGciLCJhZGRyIjoiZnNkZiIsInRlbGVwaG9uZSI6IjE1ODM1NjIzNTg2In19','2024-10-22 15:10:46.286165');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-08 15:47:23
