-- MySQL dump 10.13  Distrib 8.0.28, for macos12.2 (arm64)
--
-- Host: localhost    Database: report
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'amerka','2022-10-07 00:56:43','2022-10-07 00:56:43'),(2,'Rassiya','2022-10-07 00:56:51','2022-10-07 00:56:51'),(3,'gruziya','2022-10-07 00:56:58','2022-10-07 00:56:58'),(4,'gruziya','2022-10-12 00:07:40','2022-10-12 00:07:40');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` text COLLATE utf8mb4_unicode_ci,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int DEFAULT NULL,
  `folder` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `files_user_id_foreign` (`user_id`),
  CONSTRAINT `files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'Screenshot from 2021-05-20 15-24-21.png',NULL,'YneG0KedTpkfjlwsp6revtikT8EQeqQN','png','YneG0KedTpkfjlwsp6revtikT8EQeqQN.png','/2022/11/07/11/32/YneG0KedTpkfjlwsp6revtikT8EQeqQN.png',254252,'/Users/istore/Documents/work/report/storage/app/public/static/2022/11/07/11/32',1,'2022-11-07 06:32:35','2022-11-07 06:32:35'),(2,'Screenshot from 2021-05-20 15-24-21.png',NULL,'dJerZQP8nQ376COMx4GAlimDitiOhcUc','png','dJerZQP8nQ376COMx4GAlimDitiOhcUc.png','/2022/11/07/11/32/dJerZQP8nQ376COMx4GAlimDitiOhcUc.png',254252,'/Users/istore/Documents/work/report/storage/app/public/static/2022/11/07/11/32',1,'2022-11-07 06:32:36','2022-11-07 06:32:36'),(3,'Screenshot from 2021-05-20 15-24-21.png',NULL,'ZlNdqtlXDGZgUL895NJ71sbJcxop8FPe','png','ZlNdqtlXDGZgUL895NJ71sbJcxop8FPe.png','/2022/11/07/11/32/ZlNdqtlXDGZgUL895NJ71sbJcxop8FPe.png',254252,'/Users/istore/Documents/work/report/storage/app/public/static/2022/11/07/11/32',1,'2022-11-07 06:32:36','2022-11-07 06:32:36'),(4,'Screenshot from 2021-05-20 15-24-21.png',NULL,'QZttnBW5p6MNUamRARLMTa1HWmQY6kqT','png','QZttnBW5p6MNUamRARLMTa1HWmQY6kqT.png','/2022/11/07/11/32/QZttnBW5p6MNUamRARLMTa1HWmQY6kqT.png',254252,'/Users/istore/Documents/work/report/storage/app/public/static/2022/11/07/11/32',1,'2022-11-07 06:32:37','2022-11-07 06:32:37'),(5,'Screenshot from 2021-05-20 15-24-21.png',NULL,'80fQSRd6TPpRbSbtefCjWeYB73xcdpaK','png','80fQSRd6TPpRbSbtefCjWeYB73xcdpaK.png','/2022/11/07/11/32/80fQSRd6TPpRbSbtefCjWeYB73xcdpaK.png',254252,'/Users/istore/Documents/work/report/storage/app/public/static/2022/11/07/11/32',1,'2022-11-07 06:32:38','2022-11-07 06:32:38');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_uploads`
--

DROP TABLE IF EXISTS `image_uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image_uploads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `original` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_uploads`
--

LOCK TABLES `image_uploads` WRITE;
/*!40000 ALTER TABLE `image_uploads` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_object`
--

DROP TABLE IF EXISTS `ip_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_object` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ip_id` bigint unsigned NOT NULL,
  `object_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ip_object_ip_id_foreign` (`ip_id`),
  KEY `ip_object_object_id_foreign` (`object_id`),
  CONSTRAINT `ip_object_ip_id_foreign` FOREIGN KEY (`ip_id`) REFERENCES `ips` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ip_object_object_id_foreign` FOREIGN KEY (`object_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_object`
--

LOCK TABLES `ip_object` WRITE;
/*!40000 ALTER TABLE `ip_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ips`
--

DROP TABLE IF EXISTS `ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ips` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ips_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ips`
--

LOCK TABLES `ips` WRITE;
/*!40000 ALTER TABLE `ips` DISABLE KEYS */;
INSERT INTO `ips` VALUES (1,'bbbb',8,'2022-10-06 07:51:07','2022-10-06 07:51:07'),(5,'bbb',8,'2022-10-06 07:51:34','2022-10-06 07:51:34'),(7,'bbbuuuuuuuuu',8,'2022-10-06 07:51:48','2022-10-06 07:51:48'),(9,'bbbuuuuuuuuuoooo',9,'2022-10-06 07:57:43','2022-10-06 07:57:43');
/*!40000 ALTER TABLE `ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(6,'2016_06_01_000004_create_oauth_clients_table',1),(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(8,'2019_08_19_000000_create_failed_jobs_table',1),(9,'2022_09_03_054150_create_ips_table',1),(10,'2022_09_14_054013_create_countries_table',1),(11,'2022_09_14_054111_create_object_types_table',1),(12,'2022_09_14_054125_create_target_types_table',1),(13,'2022_09_14_054136_create_result_types_table',1),(14,'2022_09_14_054203_create_objects_table',1),(45,'2022_09_14_054213_create_targets_table',2),(46,'2022_09_14_061225_create_ip_object_table',2),(47,'2022_09_16_072055_create_image_uploads_table',2),(56,'2020_04_14_133145_create_files_table',3),(63,'2022_10_03_064410_create_tasks_table',4),(64,'2022_10_03_065940_create_results_table',4),(66,'2022_10_05_060343_create_task_items_table',5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('b1d1abfce1d3b8412c52981e373aa53ffa49505c55de158bae78589d69abffd7945a32179c38a61c',1,2,NULL,'[]',0,'2022-10-06 07:45:08','2022-10-06 07:45:08','2023-10-06 12:45:08');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','pOx91oGt0hrnLVli4snQ4IazNhJnMYDONcHdMhBE',NULL,'http://localhost',1,0,0,'2022-10-06 07:43:25','2022-10-06 07:43:25'),(2,NULL,'Laravel Password Grant Client','jefnrJAQRxTdGpjKYeaSjxf8HqSvrHhntRtczyyD','users','http://localhost',0,1,0,'2022-10-06 07:43:25','2022-10-06 07:43:25');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2022-10-06 07:43:25','2022-10-06 07:43:25');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
INSERT INTO `oauth_refresh_tokens` VALUES ('34dce8258c0546aaf83f029e356acccb6cdf701c6386b9b3e668ed2f2d507663a14f5ed658235dee','b1d1abfce1d3b8412c52981e373aa53ffa49505c55de158bae78589d69abffd7945a32179c38a61c',0,'2023-10-06 12:45:08');
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_types`
--

DROP TABLE IF EXISTS `object_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_types`
--

LOCK TABLES `object_types` WRITE;
/*!40000 ALTER TABLE `object_types` DISABLE KEYS */;
INSERT INTO `object_types` VALUES (1,'seryoz','2022-10-12 00:07:07','2022-10-26 23:59:59'),(2,'mulitpart','2022-11-16 05:55:05','2022-11-16 05:55:05'),(3,'mulitpart','2022-11-16 05:55:06','2022-11-16 05:55:06'),(4,'mulitpart','2022-11-16 05:55:06','2022-11-16 05:55:06'),(5,'mulitpart','2022-11-16 05:55:07','2022-11-16 05:55:07');
/*!40000 ALTER TABLE `object_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objects`
--

DROP TABLE IF EXISTS `objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `country_id` bigint unsigned DEFAULT NULL,
  `code` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_type_id` bigint unsigned DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `coordination` json NOT NULL,
  `phone` json DEFAULT NULL,
  `mails` json DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `objects_country_id_foreign` (`country_id`),
  KEY `objects_object_type_id_foreign` (`object_type_id`),
  CONSTRAINT `objects_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `objects_object_type_id_foreign` FOREIGN KEY (`object_type_id`) REFERENCES `object_types` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objects`
--

LOCK TABLES `objects` WRITE;
/*!40000 ALTER TABLE `objects` DISABLE KEYS */;
INSERT INTO `objects` VALUES (1,4,'test for code',1,'seryoz','filippine','[\"61.232312\"]','[\"3434\", \"dfdfdf\"]',NULL,'sdfsdfsdf','2022-10-12 00:40:49','2022-11-04 01:09:11'),(2,3,'test for code',2,'mulitpart','filippine','[\"61.232312\"]','[\"3434\", \"dfdfdf\"]',NULL,'sdfsdfsdf','2022-10-12 00:41:26','2022-11-16 05:55:29'),(3,4,'test for code',1,'mulitpart','filippine','[\"61.232312\"]','[\"3434\", \"dfdfdf\"]',NULL,'sdfsdfsdf','2022-10-12 00:44:41','2022-10-12 00:44:41'),(4,4,'test for code',1,'mulitpart','filippine','[\"61.232312\"]','[\"3434\", \"dfdfdf\"]',NULL,'sdfsdfsdf','2022-10-18 01:02:49','2022-10-18 01:02:49'),(5,4,'test for code',1,'mulitpart','filippine','[\"61.232312\"]','[\"3434\", \"dfdfdf\"]',NULL,'sdfsdfsdf','2022-10-18 01:04:55','2022-10-18 01:04:55'),(6,4,'test for code',1,'mulitpart','filippine','[\"61.232312\"]','[\"3434\", \"dfdfdf\"]',NULL,'sdfsdfsdf','2022-10-18 05:50:46','2022-10-18 05:50:46'),(7,4,'test for code',NULL,'mulitpart','filippine','[\"61.232312\"]','[\"3434\", \"dfdfdf\"]',NULL,'sdfsdfsdf','2022-10-18 06:57:55','2022-10-18 06:57:55'),(8,4,'test for code',NULL,'mulitpart','filippine','[\"61.232312\"]','[\"3434\", \"dfdfdf\"]',NULL,'sdfsdfsdf','2022-10-26 23:59:51','2022-10-26 23:59:51'),(9,1,'qwqwqw',1,'fdf','sdsdsd','[1]','[121212]',NULL,'wygiwys','2022-11-07 07:19:13','2022-11-07 07:19:13');
/*!40000 ALTER TABLE `objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result_types`
--

DROP TABLE IF EXISTS `result_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `result_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result_types`
--

LOCK TABLES `result_types` WRITE;
/*!40000 ALTER TABLE `result_types` DISABLE KEYS */;
INSERT INTO `result_types` VALUES (1,'mulitpart','2022-11-07 06:47:46','2022-11-07 06:47:46');
/*!40000 ALTER TABLE `result_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `results` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `task_item_id` bigint unsigned DEFAULT NULL,
  `result_type_id` bigint unsigned DEFAULT NULL,
  `creator` bigint unsigned NOT NULL,
  `target_id` bigint unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `files` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES (1,1,1,1,9,'seryoz','[1]','2022-11-21 01:08:35','2022-11-22 00:28:03'),(2,1,1,1,9,'wygswys','[1]','2022-11-21 07:01:42','2022-11-21 07:01:42'),(3,2,1,1,9,'seryoz','[1]','2022-11-22 00:22:27','2022-11-22 00:40:23'),(4,2,1,1,9,'wygswys','[1]','2022-11-22 00:42:30','2022-11-22 00:42:30'),(5,6,1,1,9,'wygswys','[1]','2022-11-23 03:25:27','2022-11-23 03:25:27'),(6,6,1,1,9,'wygswys','[1]','2022-11-24 05:53:59','2022-11-24 05:53:59');
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `target_types`
--

DROP TABLE IF EXISTS `target_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `target_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `target_types`
--

LOCK TABLES `target_types` WRITE;
/*!40000 ALTER TABLE `target_types` DISABLE KEYS */;
INSERT INTO `target_types` VALUES (2,'127.234.453','2022-10-12 05:39:27','2022-10-12 05:39:27'),(3,'127.234.453','2022-10-12 05:39:28','2022-10-12 05:39:28'),(4,'127.234.453','2022-10-12 05:39:29','2022-10-12 05:39:29'),(5,'127.234.453','2022-10-12 05:39:29','2022-10-12 05:39:29'),(6,'127.234.453','2022-10-12 05:39:30','2022-10-12 05:39:30'),(7,'127.234.453','2022-10-12 05:39:30','2022-10-12 05:39:30');
/*!40000 ALTER TABLE `target_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `targets`
--

DROP TABLE IF EXISTS `targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `targets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_type_id` bigint unsigned DEFAULT NULL,
  `object_type_id` bigint unsigned DEFAULT NULL,
  `object_id` bigint unsigned DEFAULT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `raw_name` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `targets_name_unique` (`name`),
  KEY `targets_target_type_id_foreign` (`target_type_id`),
  KEY `targets_object_type_id_foreign` (`object_type_id`),
  KEY `targets_object_id_foreign` (`object_id`),
  KEY `targets_parent_id_foreign` (`parent_id`),
  KEY `targets_country_id_foreign` (`country_id`),
  CONSTRAINT `targets_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `targets_object_id_foreign` FOREIGN KEY (`object_id`) REFERENCES `objects` (`id`) ON DELETE SET NULL,
  CONSTRAINT `targets_object_type_id_foreign` FOREIGN KEY (`object_type_id`) REFERENCES `object_types` (`id`) ON DELETE SET NULL,
  CONSTRAINT `targets_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `targets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `targets_target_type_id_foreign` FOREIGN KEY (`target_type_id`) REFERENCES `target_types` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `targets`
--

LOCK TABLES `targets` WRITE;
/*!40000 ALTER TABLE `targets` DISABLE KEYS */;
INSERT INTO `targets` VALUES (1,'https://savollar.islooml.uz/kkkkmmmmmgkjkgkggjjkjggjk',2,1,1,NULL,4,'[\"https://savollar.islooml.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.islooml.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.islooml.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.islooml.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.islooml.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.islooml.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.islooml.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.islooml.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.islooml.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.islooml.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.islooml.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.islooml.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.islooml.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.islooml.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.islooml.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.islooml.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.islooml.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.islooml.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.islooml.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.islooml.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.islooml.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.islooml.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.islooml.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.islooml.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.islooml.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.islooml.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.islooml.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.islooml.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.islooml.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.islooml.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.islooml.uz/kkkkmmmmmgkjkgkggjjkjggjk\"]','2022-10-06 10:17:44','2022-11-16 05:54:36'),(2,'isloom.uz',NULL,NULL,NULL,1,1,'[\"https://savollar.isloom.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.isloom.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.isloom.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.isloom.uz/kkkkmmmmmgkjkgkggjjkjggjk\"]','2022-10-07 01:03:06','2022-10-07 01:03:18'),(3,'islom.uz',NULL,NULL,NULL,1,1,'[\"https://savollar.islom.uz/kkkkmmmmmgkjkgkggjjkjggjk\", \"https://savollar.islom.uz/kkkkmmmmmgkjkgkggjjkjggjkjjjj\", \"https://savollar.islom.uz/kkkkmmmmmgkjkgkggjjkjggjkjjjj\", \"https://savollar.islom.uz/kkkkmmmmmgkjkgkggjjkjggjkjjjj\", \"https://savollar.islom.uz/kkkkmmmmmgkjkgkggjjkjggjkjjjj\", \"https://savollar.islom.uz/kkkkmmmmmgkjkgkggjjkjggjkjjjj\", \"https://savollar.islom.uz/kkkkmmmmmgkjkgkggjjkjggjkjjjj\"]','2022-10-07 01:10:32','2022-10-12 00:46:23'),(4,'dfdfdfdf',NULL,1,3,NULL,1,NULL,'2022-10-12 00:46:49','2022-10-12 00:46:49'),(5,'w3schools.com',NULL,1,3,NULL,1,'[\"https://www.w3schools.com/php/phptryit.asp?filename=tryphp_var\", \"https://www.admin.w3schools.com/php/phptryit.asp?filename=tryphp_var\", \"https://www.w3schools.com/php/phptryit.asp?filename=tryphp_var0o\"]','2022-10-12 00:56:32','2022-10-12 01:51:01'),(7,'admin.w3schools.com',NULL,1,3,5,1,'[\"https://www.admin.w3schools.com/php/phptryit.asp?filename=tryphp_var\", \"https://www.admin.w3schools.com/php/phptryit.asp?filename=tryphp_var0o\", \"https://www.admin.w3schools.com/php/phptryit.asp?filename=tryphp_var0o\"]','2022-10-12 01:49:13','2022-10-12 01:50:23'),(8,'ttttttt',NULL,1,3,NULL,1,NULL,'2022-10-12 01:51:20','2022-10-12 01:51:20'),(9,'qa.w3schools.com',NULL,1,3,5,1,'[\"https://www.qa.w3schools.com/php/phptryit.asp?filename=tryphp_var0o\", \"https://www.qa.w3schools.com/php/phptryit.asp?filename=tryphp_var0o\", \"https://www.qa.w3schools.com/php/phptryit.asp?filename=tryphp_var0o\", \"https://www.qa.w3schools.com/php/phptryit.asp?filename=tryphp_var0o\", \"https://www.qa.w3schools.com/php/phptryit.asp?filename=tryphp_var0o\", \"https://www.qa.w3schools.com/php/phptryit.asp?filename=tryphp_var0o\", \"https://www.qa.w3schools.com/php/phptryit.asp?filename=tryphp_var0o\", \"https://www.qa.w3schools.com/php/phptryit.asp?filename=tryphp_var0o\", \"https://www.qa.w3schools.com/php/phptryit.asp?filename=tryphp_var0o\", \"https://www.qa.w3schools.com/php/phptryit.asp?filename=tryphp_var0o\", \"https://www.qa.w3schools.com/php/phptryit.asp?filename=tryphp_var0o\", \"https://www.qa.w3schools.com/php/phptryit.asp?filename=tryphp_var0o\", \"https://www.qa.w3schools.com/php/phptryit.asp?filename=tryphp_var0o\", \"https://www.qa.w3schools.com/php/phptryit.asp?filename=tryphp_var0o\", \"https://www.qa.w3schools.com/php/phptryit.asp?filename=tryphp_var0o\", \"https://www.qa.w3schools.com/php/phptryit.asp?filename=tryphp_var0o\", \"https://www.qa.w3schools.com/php/phptryit.asp?filename=tryphp_var0o\", \"https://www.qa.w3schools.com/php/phptryit.asp?filename=tryphp_var0o\", \"https://www.qa.w3schools.com/php/phptryit.asp?filename=tryphp_var0o\", \"https://www.qa.w3schools.com/php/phptryit.asp?filename=tryphp_var0o\", \"https://www.qa.w3schools.com/php/phptryit.asp?filename=tryphp_var0o\", \"https://www.qa.w3schools.com/php/phptryit.asp?filename=tryphp_var0o\", \"https://www.qa.w3schools.com/php/phptryit.asp?filename=tryphp_var0o\", \"https://www.qa.w3schools.com/php/phptryit.asp?filename=tryphp_var0o\", \"https://www.qa.w3schools.com/php/phptryit.asp?filename=tryphp_var0o\", \"https://www.qa.w3schools.com/php/phptryit.asp?filename=tryphp_var0o\", \"https://www.qa.w3schools.com/php/phptryit.asp?filename=tryphp_var0o\"]','2022-10-12 01:51:50','2022-11-16 05:56:15'),(10,'127.234.453',2,1,1,NULL,1,NULL,'2022-10-12 06:07:46','2022-10-12 06:07:46'),(11,'ioioioi',2,2,2,2,3,NULL,'2022-11-16 05:56:24','2022-11-16 05:56:24');
/*!40000 ALTER TABLE `targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_items`
--

DROP TABLE IF EXISTS `task_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `object_id` bigint unsigned DEFAULT NULL,
  `task_id` bigint unsigned DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `target_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `start` date NOT NULL,
  `deadline` date NOT NULL,
  `files` json DEFAULT NULL,
  `definition` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'waiting',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_items_object_id_foreign` (`object_id`),
  KEY `task_items_task_id_foreign` (`task_id`),
  KEY `task_items_country_id_foreign` (`country_id`),
  KEY `task_items_target_id_foreign` (`target_id`),
  KEY `task_items_user_id_foreign` (`user_id`),
  CONSTRAINT `task_items_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `task_items_object_id_foreign` FOREIGN KEY (`object_id`) REFERENCES `objects` (`id`) ON DELETE SET NULL,
  CONSTRAINT `task_items_target_id_foreign` FOREIGN KEY (`target_id`) REFERENCES `targets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `task_items_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE SET NULL,
  CONSTRAINT `task_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_items`
--

LOCK TABLES `task_items` WRITE;
/*!40000 ALTER TABLE `task_items` DISABLE KEYS */;
INSERT INTO `task_items` VALUES (1,3,1,1,9,1,'2022-06-01','2022-07-10','[1]','sdsdsd','waiting','2022-11-23 00:10:35','2022-11-23 07:27:53'),(2,3,2,1,9,2,'2022-06-01','2022-07-10','[1]','wewewe','waiting','2022-11-23 00:10:58','2022-11-23 00:10:58'),(3,3,3,1,9,1,'2022-06-01','2022-07-10','[1]','wewewe','waiting','2022-11-23 00:11:11','2022-11-23 00:11:11'),(4,3,4,1,9,2,'2022-06-01','2022-07-10','[1]','wewewe','waiting','2022-11-23 00:11:12','2022-11-23 00:11:12'),(5,3,3,1,9,1,'2022-06-01','2022-07-10','[1]','wewewe','waiting','2022-11-23 00:11:13','2022-11-23 00:11:13'),(6,3,24,1,9,2,'2022-08-01','2022-09-10','[1]','wewewe','inprogress','2022-11-23 00:11:14','2022-11-23 03:25:27'),(7,3,13,1,9,2,'2022-08-01','2022-09-10','[1]','wewewe','inproggress','2022-11-23 00:11:14','2022-11-23 00:11:14'),(8,3,1,1,9,1,'2022-08-01','2022-08-01','[1]','wewewe','waiting','2022-11-23 07:12:04','2022-11-23 07:12:04'),(9,1,1,4,1,1,'2022-08-01','2022-08-01','[1]','wewewe','waiting','2022-11-23 07:12:18','2022-11-23 07:12:18');
/*!40000 ALTER TABLE `task_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` date NOT NULL,
  `deadline` date NOT NULL,
  `creator` bigint unsigned NOT NULL,
  `assigned` json NOT NULL,
  `assigned_role` json DEFAULT NULL,
  `files` json DEFAULT NULL,
  `object_id` bigint unsigned DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_creator_foreign` (`creator`),
  CONSTRAINT `tasks_creator_foreign` FOREIGN KEY (`creator`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(2,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(3,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(4,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(5,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(6,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(7,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(8,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(9,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(10,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(11,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(12,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(13,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(14,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(15,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(16,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(17,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(18,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(19,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(20,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(21,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(22,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(23,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(24,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Mr. Gavin Bartell Sr.','admin','uploads/avatars/default.jpg','bwindler@example.org','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','PSSJuBlWT3','2022-10-06 07:43:33','2022-10-06 07:43:33'),(2,'dfjgdfgo','admin','uploads/avatars/default.jpg','bwindler@dfd.org','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','PSSJuBlWT3','2022-10-25 06:31:48','2022-10-25 06:31:50');
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

-- Dump completed on 2022-11-24 17:39:46
