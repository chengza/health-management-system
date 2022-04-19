-- MySQL dump 10.13  Distrib 5.7.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: health
-- ------------------------------------------------------
-- Server version	5.7.26

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add surgery news',7,'add_surgerynews'),(20,'Can change surgery news',7,'change_surgerynews'),(21,'Can delete surgery news',7,'delete_surgerynews'),(22,'Can add 用户',8,'add_user'),(23,'Can change 用户',8,'change_user'),(24,'Can delete 用户',8,'delete_user'),(25,'Can add person',9,'add_person'),(26,'Can change person',9,'change_person'),(27,'Can delete person',9,'delete_person'),(28,'Can add message',10,'add_message'),(29,'Can change message',10,'change_message'),(30,'Can delete message',10,'delete_message'),(31,'Can add surgery',11,'add_surgery'),(32,'Can change surgery',11,'change_surgery'),(33,'Can delete surgery',11,'delete_surgery'),(34,'Can add internal news',12,'add_internalnews'),(35,'Can change internal news',12,'change_internalnews'),(36,'Can delete internal news',12,'delete_internalnews'),(37,'Can add 管理员',13,'add_control'),(38,'Can change 管理员',13,'change_control'),(39,'Can delete 管理员',13,'delete_control'),(40,'Can add normal',14,'add_normal'),(41,'Can change normal',14,'change_normal'),(42,'Can delete normal',14,'delete_normal'),(43,'Can add internal',15,'add_internal'),(44,'Can change internal',15,'change_internal'),(45,'Can delete internal',15,'delete_internal');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$LMDcwTDcORcj$gO4Y3j22v08R1oQB8XmJMvw34ctkRknVZDlY1tZV2CI=',NULL,1,'admin','','','admin@admin.com',1,1,'2022-04-19 14:59:47.521000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'login','surgerynews'),(8,'login','user'),(9,'login','person'),(10,'login','message'),(11,'login','surgery'),(12,'login','internalnews'),(13,'login','control'),(14,'login','normal'),(15,'login','internal');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-04-19 10:54:42.694000'),(2,'auth','0001_initial','2022-04-19 10:54:43.520000'),(3,'admin','0001_initial','2022-04-19 10:54:43.699000'),(4,'admin','0002_logentry_remove_auto_add','2022-04-19 10:54:43.714000'),(5,'contenttypes','0002_remove_content_type_name','2022-04-19 10:54:43.815000'),(6,'auth','0002_alter_permission_name_max_length','2022-04-19 10:54:43.857000'),(7,'auth','0003_alter_user_email_max_length','2022-04-19 10:54:43.904000'),(8,'auth','0004_alter_user_username_opts','2022-04-19 10:54:43.916000'),(9,'auth','0005_alter_user_last_login_null','2022-04-19 10:54:43.951000'),(10,'auth','0006_require_contenttypes_0002','2022-04-19 10:54:43.953000'),(11,'auth','0007_alter_validators_add_error_messages','2022-04-19 10:54:43.963000'),(12,'auth','0008_alter_user_username_max_length','2022-04-19 10:54:44.002000'),(13,'login','0001_initial','2022-04-19 10:54:44.176000'),(14,'login','0002_auto_20210405_1737','2022-04-19 10:54:44.448000'),(15,'login','0003_auto_20210406_1636','2022-04-19 10:54:44.454000'),(16,'login','0004_control','2022-04-19 10:54:44.511000'),(17,'login','0005_auto_20210506_1603','2022-04-19 10:54:44.558000'),(18,'login','0006_internal_normal_surgery','2022-04-19 10:54:44.717000'),(19,'login','0007_auto_20210508_0924','2022-04-19 10:54:44.870000'),(20,'login','0008_auto_20210509_1443','2022-04-19 10:54:44.876000'),(21,'login','0009_internalnews_surgerynews','2022-04-19 10:54:44.970000'),(22,'login','0010_auto_20210511_1404','2022-04-19 10:54:45.136000'),(23,'sessions','0001_initial','2022-04-19 10:54:45.219000');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('zk923ejmii97j2zkjjpdtb0k2khg6vie','YzViZjE3NjVhMTdjNGU3ZTIxOGZiOWVhYzNhMzhmYzk2NTM0NDkxYzp7InVzZXJfbmFtZSI6ImFiYyIsInVzZXJfaWQiOjEsImlzX2xvZ2luIjp0cnVlfQ==','2022-05-03 10:55:21.582000'),('3sn358o5zvvt6wtrvc4j7qijyv5xnjc8','MzNlMWYxY2E4MjNlNjAxMjhjZWI2NDQwYzFmNzEyM2ViNGIyMzFmYzp7InVzZXJfbmFtZSI6InJvb3QiLCJ1c2VyX2lkIjoyLCJpc19sb2dpbiI6dHJ1ZSwiY29udHJvbF91c2VybmFtZSI6ImFkbWlucm9vdCJ9','2022-05-03 15:10:10.884000');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_control`
--

DROP TABLE IF EXISTS `login_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_control` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `email` varchar(254) NOT NULL,
  `sex` varchar(32) NOT NULL,
  `c_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_control`
--

LOCK TABLES `login_control` WRITE;
/*!40000 ALTER TABLE `login_control` DISABLE KEYS */;
INSERT INTO `login_control` VALUES (1,'adminroot','adminroot','adminroot@adminroot.com','female','2022-04-19 15:09:27.071000');
/*!40000 ALTER TABLE `login_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_internal`
--

DROP TABLE IF EXISTS `login_internal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_internal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `pulse` varchar(128) NOT NULL,
  `bloodpressure` varchar(128) NOT NULL,
  `heart` varchar(128) NOT NULL,
  `liver` int(11) NOT NULL,
  `spleen` int(11) NOT NULL,
  `kidney` int(11) NOT NULL,
  `abdomen` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_internal`
--

LOCK TABLES `login_internal` WRITE;
/*!40000 ALTER TABLE `login_internal` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_internal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_internalnews`
--

DROP TABLE IF EXISTS `login_internalnews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_internalnews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Publisher` varchar(128) NOT NULL,
  `Internaltitle` varchar(128) NOT NULL,
  `Internaldate` date NOT NULL,
  `Internalkeywords` varchar(128) NOT NULL,
  `Internalpreread` varchar(128) NOT NULL,
  `Internalarticle` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_internalnews`
--

LOCK TABLES `login_internalnews` WRITE;
/*!40000 ALTER TABLE `login_internalnews` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_internalnews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_message`
--

DROP TABLE IF EXISTS `login_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `item1` int(11) NOT NULL,
  `item2` int(11) NOT NULL,
  `item3` int(11) NOT NULL,
  `item4` int(11) NOT NULL,
  `item5` int(11) NOT NULL,
  `item6` int(11) NOT NULL,
  `item7` int(11) NOT NULL,
  `item8` int(11) NOT NULL,
  `item9` int(11) NOT NULL,
  `item10` int(11) NOT NULL,
  `item11` int(11) NOT NULL,
  `item12` int(11) NOT NULL,
  `item13` int(11) NOT NULL,
  `item14` int(11) NOT NULL,
  `item15` int(11) NOT NULL,
  `item16` int(11) NOT NULL,
  `item17` int(11) NOT NULL,
  `item18` int(11) NOT NULL,
  `item19` int(11) NOT NULL,
  `item20` int(11) NOT NULL,
  `item21` int(11) NOT NULL,
  `item22` int(11) NOT NULL,
  `item23` int(11) NOT NULL,
  `item24` int(11) NOT NULL,
  `item25` int(11) NOT NULL,
  `item26` int(11) NOT NULL,
  `item27` int(11) NOT NULL,
  `item28` int(11) NOT NULL,
  `item29` int(11) NOT NULL,
  `item30` int(11) NOT NULL,
  `item31` int(11) NOT NULL,
  `item32` int(11) NOT NULL,
  `item33` int(11) NOT NULL,
  `item34` int(11) NOT NULL,
  `item35` int(11) NOT NULL,
  `item36` int(11) NOT NULL,
  `item37` int(11) NOT NULL,
  `item38` int(11) NOT NULL,
  `item39` int(11) NOT NULL,
  `item40` int(11) NOT NULL,
  `item41` int(11) NOT NULL,
  `item42` int(11) NOT NULL,
  `item43` int(11) NOT NULL,
  `item44` int(11) NOT NULL,
  `item45` int(11) NOT NULL,
  `item46` int(11) NOT NULL,
  `item47` int(11) NOT NULL,
  `item48` int(11) NOT NULL,
  `item49` int(11) NOT NULL,
  `item50` int(11) NOT NULL,
  `item51` int(11) NOT NULL,
  `item52` int(11) NOT NULL,
  `item53` int(11) NOT NULL,
  `item54` int(11) NOT NULL,
  `item55` int(11) NOT NULL,
  `item56` int(11) NOT NULL,
  `item57` int(11) NOT NULL,
  `item58` int(11) NOT NULL,
  `item59` int(11) NOT NULL,
  `item60` int(11) NOT NULL,
  `item61` int(11) NOT NULL,
  `item62` int(11) NOT NULL,
  `item63` int(11) NOT NULL,
  `item64` int(11) NOT NULL,
  `item65` int(11) NOT NULL,
  `item66` int(11) NOT NULL,
  `item67` int(11) NOT NULL,
  `item68` int(11) NOT NULL,
  `item69` int(11) NOT NULL,
  `item70` int(11) NOT NULL,
  `item71` int(11) NOT NULL,
  `item72` int(11) NOT NULL,
  `item73` int(11) NOT NULL,
  `item74` int(11) NOT NULL,
  `item75` int(11) NOT NULL,
  `item76` int(11) NOT NULL,
  `item77` int(11) NOT NULL,
  `item78` int(11) NOT NULL,
  `item79` int(11) NOT NULL,
  `item80` int(11) NOT NULL,
  `item81` int(11) NOT NULL,
  `item82` int(11) NOT NULL,
  `item83` int(11) NOT NULL,
  `item84` int(11) NOT NULL,
  `item85` int(11) NOT NULL,
  `item86` int(11) NOT NULL,
  `item87` int(11) NOT NULL,
  `item88` int(11) NOT NULL,
  `item89` int(11) NOT NULL,
  `item90` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_message`
--

LOCK TABLES `login_message` WRITE;
/*!40000 ALTER TABLE `login_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_normal`
--

DROP TABLE IF EXISTS `login_normal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_normal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `height` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `right_vision` varchar(128) NOT NULL,
  `left_vision` varchar(128) NOT NULL,
  `pulmonary` varchar(128) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_normal`
--

LOCK TABLES `login_normal` WRITE;
/*!40000 ALTER TABLE `login_normal` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_normal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_person`
--

DROP TABLE IF EXISTS `login_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `height` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `sex` varchar(32) NOT NULL,
  `birthday` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_person`
--

LOCK TABLES `login_person` WRITE;
/*!40000 ALTER TABLE `login_person` DISABLE KEYS */;
INSERT INTO `login_person` VALUES (1,'123456','abc',128,52,20,'male','2022-04-14');
/*!40000 ALTER TABLE `login_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_surgery`
--

DROP TABLE IF EXISTS `login_surgery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_surgery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `thyroid` varchar(128) NOT NULL,
  `lymphgland` varchar(128) NOT NULL,
  `breast` varchar(128) NOT NULL,
  `spine` varchar(128) NOT NULL,
  `Limbjoints` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_surgery`
--

LOCK TABLES `login_surgery` WRITE;
/*!40000 ALTER TABLE `login_surgery` DISABLE KEYS */;
INSERT INTO `login_surgery` VALUES (1,'abc','25','24','420','14','10');
/*!40000 ALTER TABLE `login_surgery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_surgerynews`
--

DROP TABLE IF EXISTS `login_surgerynews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_surgerynews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Publisher` varchar(128) NOT NULL,
  `Surgerytitle` varchar(128) NOT NULL,
  `Surgerydate` date NOT NULL,
  `Surgerykeywords` varchar(128) NOT NULL,
  `Surgerypreread` varchar(128) NOT NULL,
  `Surgeryarticle` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_surgerynews`
--

LOCK TABLES `login_surgerynews` WRITE;
/*!40000 ALTER TABLE `login_surgerynews` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_surgerynews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_user`
--

DROP TABLE IF EXISTS `login_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `email` varchar(254) NOT NULL,
  `sex` varchar(32) NOT NULL,
  `c_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_user`
--

LOCK TABLES `login_user` WRITE;
/*!40000 ALTER TABLE `login_user` DISABLE KEYS */;
INSERT INTO `login_user` VALUES (1,'abc','123456','abc@abc.com','male','2022-04-19 10:54:52.007000'),(2,'root','123456','ROOT@ROOT.COM','male','2022-04-19 15:06:55.963000'),(3,'admin123','admin123','admin@admin.com','female','2022-04-19 15:08:01.822000');
/*!40000 ALTER TABLE `login_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-19 15:23:20
