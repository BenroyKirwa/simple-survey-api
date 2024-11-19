-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: sky_survey_db
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
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
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `auth_permission` VALUES (1,'Can add question',1,'add_question'),(2,'Can change question',1,'change_question'),(3,'Can delete question',1,'delete_question'),(4,'Can view question',1,'view_question'),(5,'Can add response',2,'add_response'),(6,'Can change response',2,'change_response'),(7,'Can delete response',2,'delete_response'),(8,'Can view response',2,'view_response'),(9,'Can add survey',3,'add_survey'),(10,'Can change survey',3,'change_survey'),(11,'Can delete survey',3,'delete_survey'),(12,'Can view survey',3,'view_survey'),(13,'Can add option',4,'add_option'),(14,'Can change option',4,'change_option'),(15,'Can delete option',4,'delete_option'),(16,'Can view option',4,'view_option'),(17,'Can add certificate',5,'add_certificate'),(18,'Can change certificate',5,'change_certificate'),(19,'Can delete certificate',5,'delete_certificate'),(20,'Can view certificate',5,'view_certificate'),(21,'Can add response detail',6,'add_responsedetail'),(22,'Can change response detail',6,'change_responsedetail'),(23,'Can delete response detail',6,'delete_responsedetail'),(24,'Can view response detail',6,'view_responsedetail'),(25,'Can add log entry',7,'add_logentry'),(26,'Can change log entry',7,'change_logentry'),(27,'Can delete log entry',7,'delete_logentry'),(28,'Can view log entry',7,'view_logentry'),(29,'Can add permission',8,'add_permission'),(30,'Can change permission',8,'change_permission'),(31,'Can delete permission',8,'delete_permission'),(32,'Can view permission',8,'view_permission'),(33,'Can add group',9,'add_group'),(34,'Can change group',9,'change_group'),(35,'Can delete group',9,'delete_group'),(36,'Can view group',9,'view_group'),(37,'Can add user',10,'add_user'),(38,'Can change user',10,'change_user'),(39,'Can delete user',10,'delete_user'),(40,'Can view user',10,'view_user'),(41,'Can add content type',11,'add_contenttype'),(42,'Can change content type',11,'change_contenttype'),(43,'Can delete content type',11,'delete_contenttype'),(44,'Can view content type',11,'view_contenttype'),(45,'Can add session',12,'add_session'),(46,'Can change session',12,'change_session'),(47,'Can delete session',12,'delete_session'),(48,'Can view session',12,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$C9fVPoJvx1NwYV4B3Rjz6i$8XGsaxTyRqYzuoleEa2SnoV7KWKyCw51/WuxwvD/dNQ=','2024-11-19 08:34:32.104319',1,'benja','','','benja@gmail.com',1,1,'2024-11-13 08:50:34.337344'),(2,'pbkdf2_sha256$870000$R3JHm7krjNYrtivW8y6GH5$hbDasa7nZ0j4nxcnOaEwH/je22SGklbeoq0rC3yhWdY=','2024-11-15 09:56:19.655550',0,'july','','','',0,1,'2024-11-13 15:44:51.949978'),(3,'pbkdf2_sha256$870000$EzZzDmADXaDk9zguZSFXoM$Ip5ZOxJpkL4pdtZ+5eejcHz0W6kidcY5kbyxFAKcNCE=','2024-11-14 11:43:17.712605',0,'ken','','','',0,1,'2024-11-14 11:41:23.694314'),(4,'pbkdf2_sha256$870000$ZN12pJLKNREY7lzSPvMLqW$UQ2gsdYymZVMNOVhwhJ+bR5LOuofG3oEgfR6ELtbuIw=','2024-11-15 09:45:46.159245',1,'admin','','','admin@gmail.com',1,1,'2024-11-15 09:44:57.007377'),(5,'pbkdf2_sha256$870000$pJKEN0oHwzdELzV5MprZZ8$mbhM6OLIgtxbHIAshM6ynxiMtwurrWtslPFQGFeQLCw=','2024-11-16 08:53:44.930082',0,'lucy','','','',0,1,'2024-11-16 08:53:26.577636'),(6,'pbkdf2_sha256$870000$EQM8UyUkJYCthyzA5I9re3$89TM9VTDukjFTColaOUs15s1m46GEqhwZ/oZwcZXqXc=','2024-11-16 09:01:21.657196',0,'ted','','','',0,1,'2024-11-16 09:01:01.411560'),(7,'pbkdf2_sha256$870000$Hs3I9E5Ks898j507glizV9$dudKk3et0cq/5YsT58TT9hXb/MbjE0UoIBtct5nEJe0=','2024-11-16 09:34:58.136301',0,'purity','','','',0,1,'2024-11-16 09:34:21.151764'),(8,'pbkdf2_sha256$870000$EdrlSjyCRaeSB4qzoe2TxC$+CH7FgeZMq7mX0xhzCJV5CjOYB7zdJrvZpEjV56WTXM=','2024-11-18 14:05:24.718801',0,'abdi','','','',0,1,'2024-11-16 13:39:02.609577'),(9,'pbkdf2_sha256$870000$2uJ7w6dfvNiXFx5GiBB57R$N4hB0RDK9T8B5/uT5mgAkbcCY+yoY0np9etMg9p6TSM=','2024-11-19 07:34:33.577318',0,'waingo','','','',0,1,'2024-11-18 21:21:07.434901'),(10,'pbkdf2_sha256$870000$H5QWz5tCS5OXQx2X4Ucb37$weoF6VOYoN2Tg8uefcWsqm9o7YfgHiB1VhgHaeVsk5c=','2024-11-19 08:17:57.493969',0,'kirwa','','','',0,1,'2024-11-19 08:06:07.286014');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-11-13 14:34:29.494970','1','Developers',1,'[{\"added\": {}}, {\"added\": {\"name\": \"question\", \"object\": \"full_name\"}}, {\"added\": {\"name\": \"question\", \"object\": \"email_address\"}}, {\"added\": {\"name\": \"question\", \"object\": \"description\"}}, {\"added\": {\"name\": \"question\", \"object\": \"gender\"}}, {\"added\": {\"name\": \"question\", \"object\": \"programming_stack\"}}, {\"added\": {\"name\": \"question\", \"object\": \"certificates\"}}]',3,1),(2,'2024-11-13 14:35:23.945351','1','Male',1,'[{\"added\": {}}]',4,1),(3,'2024-11-13 14:35:46.806435','1','Male',2,'[]',4,1),(4,'2024-11-13 14:38:43.036283','2','Female',1,'[{\"added\": {}}]',4,1),(5,'2024-11-13 14:38:54.011120','3','Other',1,'[{\"added\": {}}]',4,1),(6,'2024-11-13 14:39:02.113427','1','Male',2,'[{\"changed\": {\"fields\": [\"Is multiple\"]}}]',4,1),(7,'2024-11-13 14:40:44.254846','4','REACT',1,'[{\"added\": {}}]',4,1),(8,'2024-11-13 15:44:59.790969','2','july',1,'[{\"added\": {}}]',10,1),(9,'2024-11-15 09:47:32.155810','1','benja',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',10,4),(10,'2024-11-15 09:49:20.038710','5','ANGULAR',1,'[{\"added\": {}}]',4,1),(11,'2024-11-15 09:49:43.590135','6','VUE',1,'[{\"added\": {}}]',4,1),(12,'2024-11-15 09:50:03.850272','7','SQlL',1,'[{\"added\": {}}]',4,1),(13,'2024-11-15 09:50:20.578134','8','POSTGRES',1,'[{\"added\": {}}]',4,1),(14,'2024-11-15 09:51:11.525835','9','MYSQL',1,'[{\"added\": {}}]',4,1),(15,'2024-11-15 09:51:33.285261','10','MSSQL',1,'[{\"added\": {}}]',4,1),(16,'2024-11-15 09:51:44.284073','11','GO',1,'[{\"added\": {}}]',4,1),(17,'2024-11-15 09:52:00.629074','12','JAVA',1,'[{\"added\": {}}]',4,1),(18,'2024-11-15 09:55:08.488288','15','ResponseDetail object (15)',3,'',6,1),(19,'2024-11-15 09:55:08.488288','14','ResponseDetail object (14)',3,'',6,1),(20,'2024-11-15 09:55:08.488288','13','ResponseDetail object (13)',3,'',6,1),(21,'2024-11-15 09:55:08.488288','12','ResponseDetail object (12)',3,'',6,1),(22,'2024-11-15 09:55:08.488288','11','ResponseDetail object (11)',3,'',6,1),(23,'2024-11-15 09:55:08.488288','10','ResponseDetail object (10)',3,'',6,1),(24,'2024-11-15 09:55:08.489257','9','ResponseDetail object (9)',3,'',6,1),(25,'2024-11-15 09:55:08.489257','8','ResponseDetail object (8)',3,'',6,1),(26,'2024-11-15 09:55:08.489257','7','ResponseDetail object (7)',3,'',6,1),(27,'2024-11-15 09:55:08.489257','6','ResponseDetail object (6)',3,'',6,1),(28,'2024-11-15 09:55:08.489257','5','ResponseDetail object (5)',3,'',6,1),(29,'2024-11-15 09:55:08.489257','4','ResponseDetail object (4)',3,'',6,1),(30,'2024-11-18 10:42:43.041954','4','REACT',2,'[]',4,1),(31,'2024-11-18 10:42:46.874737','4','REACT',2,'[]',4,1),(32,'2024-11-18 10:42:55.271315','5','ANGULAR',2,'[{\"changed\": {\"fields\": [\"Is multiple\"]}}]',4,1),(33,'2024-11-18 10:43:04.099663','6','VUE',2,'[{\"changed\": {\"fields\": [\"Is multiple\"]}}]',4,1),(34,'2024-11-18 10:43:17.344913','7','SQL',2,'[{\"changed\": {\"fields\": [\"Option text\", \"Is multiple\"]}}]',4,1),(35,'2024-11-18 10:43:30.783628','8','POSTGRES',2,'[{\"changed\": {\"fields\": [\"Is multiple\"]}}]',4,1),(36,'2024-11-18 10:43:38.240183','9','MYSQL',2,'[{\"changed\": {\"fields\": [\"Is multiple\"]}}]',4,1),(37,'2024-11-18 10:43:46.792150','10','MSSQL',2,'[{\"changed\": {\"fields\": [\"Is multiple\"]}}]',4,1),(38,'2024-11-18 10:43:56.714118','11','GO',2,'[{\"changed\": {\"fields\": [\"Is multiple\"]}}]',4,1),(39,'2024-11-18 10:44:04.381142','12','JAVA',2,'[{\"changed\": {\"fields\": [\"Is multiple\"]}}]',4,1),(40,'2024-11-18 12:00:08.902422','2','Movie Survey',1,'[{\"added\": {}}, {\"added\": {\"name\": \"question\", \"object\": \"What\'s your favorite movie genre?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"How often do you watch movies?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"Who\\u2019s your favorite movie director?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"Which movie streaming platform do you use the most?\"}}, {\"added\": {\"name\": \"question\", \"object\": \"What\\u2019s a movie you think everyone should watch?\"}}]',3,1),(41,'2024-11-18 12:00:58.760357','13','Action',1,'[{\"added\": {}}]',4,1),(42,'2024-11-18 12:01:14.532084','14','Comedy',1,'[{\"added\": {}}]',4,1),(43,'2024-11-18 12:01:27.092841','15','Drama',1,'[{\"added\": {}}]',4,1),(44,'2024-11-18 12:01:40.261954','16','Science Fiction',1,'[{\"added\": {}}]',4,1),(45,'2024-11-18 12:01:54.205176','17','Horror',1,'[{\"added\": {}}]',4,1),(46,'2024-11-18 12:02:05.795853','18','Other',1,'[{\"added\": {}}]',4,1),(47,'2024-11-18 12:02:18.939956','19','Daily',1,'[{\"added\": {}}]',4,1),(48,'2024-11-18 12:02:31.682885','20','Weekly',1,'[{\"added\": {}}]',4,1),(49,'2024-11-18 12:02:44.359887','21','Monthly',1,'[{\"added\": {}}]',4,1),(50,'2024-11-18 12:02:56.016774','22','Rarely',1,'[{\"added\": {}}]',4,1),(51,'2024-11-18 12:03:18.553986','23','Netflix',1,'[{\"added\": {}}]',4,1),(52,'2024-11-18 12:03:31.743036','24','Amazon Prime Video',1,'[{\"added\": {}}]',4,1),(53,'2024-11-18 12:03:44.442190','25','Disney+',1,'[{\"added\": {}}]',4,1),(54,'2024-11-18 12:03:56.449669','26','Hulu',1,'[{\"added\": {}}]',4,1),(55,'2024-11-18 12:04:11.005135','27','Other',1,'[{\"added\": {}}]',4,1),(56,'2024-11-19 08:37:54.759459','1','Developers',2,'[{\"changed\": {\"name\": \"question\", \"object\": \"what is your full name :\", \"fields\": [\"Question text\"]}}, {\"changed\": {\"name\": \"question\", \"object\": \"what is your email_address :\", \"fields\": [\"Question text\"]}}, {\"changed\": {\"name\": \"question\", \"object\": \"GIve your description :\", \"fields\": [\"Question text\"]}}, {\"changed\": {\"name\": \"question\", \"object\": \"What is your gender?\", \"fields\": [\"Question text\"]}}, {\"changed\": {\"name\": \"question\", \"object\": \"What programming stack do you often use?\", \"fields\": [\"Question text\"]}}, {\"changed\": {\"name\": \"question\", \"object\": \"Upload any certificates you have acquired :\", \"fields\": [\"Question text\"]}}]',3,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `django_content_type` VALUES (7,'admin','logentry'),(9,'auth','group'),(8,'auth','permission'),(10,'auth','user'),(11,'contenttypes','contenttype'),(12,'sessions','session'),(5,'survey','certificate'),(4,'survey','option'),(1,'survey','question'),(2,'survey','response'),(6,'survey','responsedetail'),(3,'survey','survey');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-11-13 08:42:48.012426'),(2,'auth','0001_initial','2024-11-13 08:43:29.519390'),(3,'admin','0001_initial','2024-11-13 08:43:34.919408'),(4,'admin','0002_logentry_remove_auto_add','2024-11-13 08:43:35.064383'),(5,'admin','0003_logentry_add_action_flag_choices','2024-11-13 08:43:35.280399'),(6,'contenttypes','0002_remove_content_type_name','2024-11-13 08:43:38.456399'),(7,'auth','0002_alter_permission_name_max_length','2024-11-13 08:43:41.185415'),(8,'auth','0003_alter_user_email_max_length','2024-11-13 08:43:41.683390'),(9,'auth','0004_alter_user_username_opts','2024-11-13 08:43:41.920403'),(10,'auth','0005_alter_user_last_login_null','2024-11-13 08:43:43.687397'),(11,'auth','0006_require_contenttypes_0002','2024-11-13 08:43:43.915394'),(12,'auth','0007_alter_validators_add_error_messages','2024-11-13 08:43:44.104395'),(13,'auth','0008_alter_user_username_max_length','2024-11-13 08:43:46.604399'),(14,'auth','0009_alter_user_last_name_max_length','2024-11-13 08:43:49.237392'),(15,'auth','0010_alter_group_name_max_length','2024-11-13 08:43:49.694393'),(16,'auth','0011_update_proxy_permissions','2024-11-13 08:43:49.913382'),(17,'auth','0012_alter_user_first_name_max_length','2024-11-13 08:43:52.472400'),(18,'sessions','0001_initial','2024-11-13 08:43:54.934387'),(19,'survey','0001_initial','2024-11-13 08:44:17.976393'),(20,'survey','0002_remove_survey_created_at_alter_option_question_and_more','2024-11-13 12:44:50.707810'),(21,'survey','0003_alter_question_type','2024-11-13 14:21:56.856840'),(22,'survey','0004_alter_responsedetail_response','2024-11-14 12:24:21.868094'),(23,'survey','0005_response_user','2024-11-15 08:59:04.417127'),(24,'survey','0006_remove_certificate_file_upload_certificate_question_and_more','2024-11-16 09:20:30.165125'),(25,'survey','0007_certificate_file_upload','2024-11-16 13:35:57.175810');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `django_session` VALUES ('4kltkse34sg62766rrsrrxkocgutqopr','.eJxVjEEOwiAQRe_C2hDGAgWX7nsGMsMMUjVtUtqV8e7apAvd_vfef6mE21rT1mRJI6uLAqNOvyNhfsi0E77jdJt1nqd1GUnvij5o08PM8rwe7t9BxVa_tWDuDJJzEbJkBB96RAQgCoUBztxHi6FDWyxbIhYTfaDYeSkmOGb1_gAvmjkU:1tDJQZ:6NMl47dWoAGrG4qRl9Z12R0amzdkLBXgOsCtEmq0sR4','2024-12-03 08:17:39.420172'),('ehsnd2pipel3d8xh6upvyh98ag7o2cc0','.eJxVjDsOwjAQBe_iGll2Ev8o6TmDtbte4wCypTipEHeHSCmgfTPzXiLCtpa4dV7inMRZaHH63RDowXUH6Q711iS1ui4zyl2RB-3y2hI_L4f7d1Cgl29tcUwKnEZjIXsYvB5TZtAcRgdE6I1l5xSQcpkGnJCzCyZP2oKnoLJ4fwABMzjC:1tDJgu:ybd0FmKAxZcOuckrEb6PccBIPJmL3xkBvYNVckABPBg','2024-12-03 08:34:32.203423'),('u2yyel8fo23iq09o85h7atpmzpgqd3vl','.eJxVjEEOwiAQRe_C2hDGAgWX7nsGMsMMUjVtUtqV8e7apAvd_vfef6mE21rT1mRJI6uLAqNOvyNhfsi0E77jdJt1nqd1GUnvij5o08PM8rwe7t9BxVa_tWDuDJJzEbJkBB96RAQgCoUBztxHi6FDWyxbIhYTfaDYeSkmOGb1_gAvmjkU:1tDJPd:fNbqMJRKyACK9uDFCr-DbkDP8oo5ji8bqc-UfCrA0E4','2024-12-03 08:16:41.847722'),('zq4lvgm5mao003ggjckc3k7e58pq3nkl','.eJxVjEEOwiAQRe_C2hCglAGX7j0DGTqDVA0kpV0Z765NutDtf-_9l4i4rSVunZc4kzgLL06_W8LpwXUHdMd6a3JqdV3mJHdFHrTLayN-Xg7376BgL98atTLIAOgdjtkoQq-dZhu0ARiscnYwQ4agHWckJAJiCxbGxM7rkMT7A8_5N3w:1tD1X5:nOPiIbEozksVJZeulckzIYwVYB1LFMTs1U0UovE-86Q','2024-12-02 13:11:11.347785');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_certificate`
--

DROP TABLE IF EXISTS `survey_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_certificate` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uploaded_at` datetime(6) NOT NULL,
  `response_id` bigint NOT NULL,
  `question_id` bigint DEFAULT NULL,
  `file_upload` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `survey_certificate_response_id_0b26979f_fk_survey_response_id` (`response_id`),
  KEY `survey_certificate_question_id_e13a2b58_fk_survey_question_id` (`question_id`),
  CONSTRAINT `survey_certificate_question_id_e13a2b58_fk_survey_question_id` FOREIGN KEY (`question_id`) REFERENCES `survey_question` (`id`),
  CONSTRAINT `survey_certificate_response_id_0b26979f_fk_survey_response_id` FOREIGN KEY (`response_id`) REFERENCES `survey_response` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_certificate`
--

LOCK TABLES `survey_certificate` WRITE;
/*!40000 ALTER TABLE `survey_certificate` DISABLE KEYS */;
INSERT INTO `survey_certificate` VALUES (1,'2024-11-16 13:51:44.515375',9,6,'certificates/SD_Completion_letter.pdf'),(2,'2024-11-18 22:33:31.916236',10,6,'certificates/Kirwa_Resume.pdf'),(3,'2024-11-19 08:25:07.691559',11,6,'certificates/SD_Completion_letter_P6DXcQQ.pdf');
/*!40000 ALTER TABLE `survey_certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_option`
--

DROP TABLE IF EXISTS `survey_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_option` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `option_text` varchar(100) NOT NULL,
  `is_multiple` tinyint(1) NOT NULL,
  `question_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `survey_option_question_id_7a935ab8_fk_survey_question_id` (`question_id`),
  CONSTRAINT `survey_option_question_id_7a935ab8_fk_survey_question_id` FOREIGN KEY (`question_id`) REFERENCES `survey_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_option`
--

LOCK TABLES `survey_option` WRITE;
/*!40000 ALTER TABLE `survey_option` DISABLE KEYS */;
INSERT INTO `survey_option` VALUES (1,'Male',0,4),(2,'Female',0,4),(3,'Other',0,4),(4,'REACT',1,5),(5,'ANGULAR',1,5),(6,'VUE',1,5),(7,'SQL',1,5),(8,'POSTGRES',1,5),(9,'MYSQL',1,5),(10,'MSSQL',1,5),(11,'GO',1,5),(12,'JAVA',1,5),(13,'Action',0,7),(14,'Comedy',0,7),(15,'Drama',0,7),(16,'Science Fiction',0,7),(17,'Horror',0,7),(18,'Other',0,7),(19,'Daily',0,8),(20,'Weekly',0,8),(21,'Monthly',0,8),(22,'Rarely',0,8),(23,'Netflix',0,10),(24,'Amazon Prime Video',0,10),(25,'Disney+',0,10),(26,'Hulu',0,10),(27,'Other',0,10);
/*!40000 ALTER TABLE `survey_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_question`
--

DROP TABLE IF EXISTS `survey_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_question` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question_text` longtext NOT NULL,
  `type` varchar(50) NOT NULL,
  `is_required` tinyint(1) NOT NULL,
  `description` longtext,
  `survey_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `survey_question_survey_id_aa755a68_fk_survey_survey_id` (`survey_id`),
  CONSTRAINT `survey_question_survey_id_aa755a68_fk_survey_survey_id` FOREIGN KEY (`survey_id`) REFERENCES `survey_survey` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_question`
--

LOCK TABLES `survey_question` WRITE;
/*!40000 ALTER TABLE `survey_question` DISABLE KEYS */;
INSERT INTO `survey_question` VALUES (1,'what is your full name :','short_text',1,'Write your full name',1),(2,'what is your email_address :','long_text',1,'Write the correct email format',1),(3,'GIve your description :','long_text',1,'what is your role currently',1),(4,'What is your gender?','choice',1,'',1),(5,'What programming stack do you often use?','choice',1,'',1),(6,'Upload any certificates you have acquired :','file',0,'',1),(7,'What\'s your favorite movie genre?','choice',1,'',2),(8,'How often do you watch movies?','choice',1,'',2),(9,'Who’s your favorite movie director?','short_text',1,'',2),(10,'Which movie streaming platform do you use the most?','choice',1,'',2),(11,'What’s a movie you think everyone should watch?','long_text',1,'Share the title and why you recommend it.',2);
/*!40000 ALTER TABLE `survey_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_response`
--

DROP TABLE IF EXISTS `survey_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_response` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `submitted_at` datetime(6) NOT NULL,
  `survey_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `survey_response_survey_id_be749458_fk_survey_survey_id` (`survey_id`),
  KEY `survey_response_user_id_3e2a2e81_fk_auth_user_id` (`user_id`),
  CONSTRAINT `survey_response_survey_id_be749458_fk_survey_survey_id` FOREIGN KEY (`survey_id`) REFERENCES `survey_survey` (`id`),
  CONSTRAINT `survey_response_user_id_3e2a2e81_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_response`
--

LOCK TABLES `survey_response` WRITE;
/*!40000 ALTER TABLE `survey_response` DISABLE KEYS */;
INSERT INTO `survey_response` VALUES (1,'2024-11-14 12:17:57.683921',1,1),(2,'2024-11-15 09:07:13.322705',1,2),(3,'2024-11-15 09:40:12.058964',1,2),(4,'2024-11-15 12:15:08.015424',1,2),(5,'2024-11-15 18:33:39.214350',1,2),(6,'2024-11-16 08:55:07.312111',1,5),(7,'2024-11-16 09:21:28.337754',1,6),(8,'2024-11-16 10:41:01.657841',1,7),(9,'2024-11-16 13:51:42.768525',1,8),(10,'2024-11-18 22:33:31.251611',1,9),(11,'2024-11-19 08:25:05.806091',1,10),(12,'2024-11-19 08:28:41.161739',2,10);
/*!40000 ALTER TABLE `survey_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_responsedetail`
--

DROP TABLE IF EXISTS `survey_responsedetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_responsedetail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `answer_text` longtext,
  `answer_option_id` bigint DEFAULT NULL,
  `question_id` bigint NOT NULL,
  `response_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `survey_responsedetai_answer_option_id_fbd8657f_fk_survey_op` (`answer_option_id`),
  KEY `survey_responsedetail_question_id_4939ae1d_fk_survey_question_id` (`question_id`),
  KEY `survey_responsedetail_response_id_fa9e9662_fk_survey_response_id` (`response_id`),
  CONSTRAINT `survey_responsedetai_answer_option_id_fbd8657f_fk_survey_op` FOREIGN KEY (`answer_option_id`) REFERENCES `survey_option` (`id`),
  CONSTRAINT `survey_responsedetail_question_id_4939ae1d_fk_survey_question_id` FOREIGN KEY (`question_id`) REFERENCES `survey_question` (`id`),
  CONSTRAINT `survey_responsedetail_response_id_fa9e9662_fk_survey_response_id` FOREIGN KEY (`response_id`) REFERENCES `survey_response` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_responsedetail`
--

LOCK TABLES `survey_responsedetail` WRITE;
/*!40000 ALTER TABLE `survey_responsedetail` DISABLE KEYS */;
INSERT INTO `survey_responsedetail` VALUES (1,'Ken Walibora',NULL,1,1),(2,'ken@gmail.com',NULL,2,1),(3,'full-stack developer',NULL,3,1),(16,'fbvg',NULL,1,4),(17,NULL,NULL,2,4),(18,NULL,NULL,3,4),(19,NULL,NULL,4,4),(20,NULL,NULL,5,4),(21,NULL,NULL,6,4),(22,'det',NULL,1,5),(23,NULL,NULL,2,5),(24,NULL,NULL,3,5),(25,NULL,NULL,4,5),(26,NULL,NULL,5,5),(27,NULL,NULL,6,5),(28,'lucy makerere',NULL,1,6),(29,'lucy@gmail.com',NULL,2,6),(30,'devops engineer',NULL,3,6),(31,'2',NULL,4,6),(32,'8',NULL,5,6),(33,'',NULL,6,6),(34,'ted johnson',NULL,1,7),(35,'ted@gmail.com',NULL,2,7),(36,'cloud engineer',NULL,3,7),(37,'1',NULL,4,7),(38,'6',NULL,5,7),(39,'',NULL,6,7),(40,'purity mlo',NULL,1,8),(41,'purity@gmail.com',NULL,2,8),(42,'web developer',NULL,3,8),(43,'Female',2,4,8),(44,'ANGULAR',5,5,8),(45,'abdi omar',NULL,1,9),(46,'abdi@gmail.com',NULL,2,9),(47,'cyber security',NULL,3,9),(48,'Male',1,4,9),(49,'GO',11,5,9),(50,'File uploaded: SD Completion letter.pdf',NULL,6,9),(51,'Waingo Wekesa',NULL,1,10),(52,'waingo@gmail.com\r\n',NULL,2,10),(53,'Software developer',NULL,3,10),(54,'Female',2,4,10),(55,'MSSQL',10,5,10),(56,'File uploaded: Kirwa Resume.pdf',NULL,6,10),(57,'Dev kirwa',NULL,1,11),(58,'kirwa@gmail.com',NULL,2,11),(59,'software developer\r\n',NULL,3,11),(60,'Male',1,4,11),(61,'VUE',6,5,11),(62,'File uploaded: SD Completion letter.pdf',NULL,6,11),(63,'Action',13,7,12),(64,'Weekly',20,8,12),(65,'christopher nolan',NULL,9,12),(66,'Netflix',23,10,12),(67,'Arcane',NULL,11,12);
/*!40000 ALTER TABLE `survey_responsedetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_survey`
--

DROP TABLE IF EXISTS `survey_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_survey` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_survey`
--

LOCK TABLES `survey_survey` WRITE;
/*!40000 ALTER TABLE `survey_survey` DISABLE KEYS */;
INSERT INTO `survey_survey` VALUES (1,'Developers','This is a survey to get a take on what are developers trends.'),(2,'Movie Survey','A survey about you favorite movies and how you often watch movies.');
/*!40000 ALTER TABLE `survey_survey` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-19 14:31:08
