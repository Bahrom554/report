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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'amerka','2022-10-07 00:56:43','2022-10-07 00:56:43'),(2,'Rassiya','2022-10-07 00:56:51','2022-10-07 00:56:51'),(3,'gruziya','2022-10-07 00:56:58','2022-10-07 00:56:58'),(4,'gruziya','2022-10-12 00:07:40','2022-10-12 00:07:40'),(5,'gruziya','2022-12-13 07:08:27','2022-12-13 07:08:27'),(6,'gruziya','2022-12-13 12:31:15','2022-12-13 12:31:15'),(7,'gruziya','2022-12-13 12:31:16','2022-12-13 12:31:16'),(8,'gruziyatestask','2022-12-14 15:39:08','2022-12-14 15:39:08'),(9,'tasktest','2022-12-14 15:41:17','2022-12-14 15:41:17');
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
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(6,'2016_06_01_000004_create_oauth_clients_table',1),(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(8,'2019_08_19_000000_create_failed_jobs_table',1),(9,'2022_09_03_054150_create_ips_table',1),(10,'2022_09_14_054013_create_countries_table',1),(11,'2022_09_14_054111_create_object_types_table',1),(12,'2022_09_14_054125_create_target_types_table',1),(13,'2022_09_14_054136_create_result_types_table',1),(14,'2022_09_14_054203_create_objects_table',1),(45,'2022_09_14_054213_create_targets_table',2),(46,'2022_09_14_061225_create_ip_object_table',2),(47,'2022_09_16_072055_create_image_uploads_table',2),(56,'2020_04_14_133145_create_files_table',3),(63,'2022_10_03_064410_create_tasks_table',4),(64,'2022_10_03_065940_create_results_table',4),(66,'2022_10_05_060343_create_task_items_table',5),(67,'2022_12_07_055531_create_permission_tables',6);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (37,'App\\Models\\User',1),(35,'App\\Models\\User',2),(36,'App\\Models\\User',9),(37,'App\\Models\\User',9),(36,'App\\Models\\User',13);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
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
INSERT INTO `oauth_access_tokens` VALUES ('0458f315a61e819208b4b84d25eb14d2278141688e260fd3465d21defd2e2db2920d9f812eea6ea2',14,2,NULL,'[]',0,'2022-12-13 07:10:36','2022-12-13 07:10:36','2023-12-13 12:10:36'),('1c796f571b4c74f646bc862886bb574cfea3c5567788c08cbc4a6b72a8c80130fe4c21b17f2aed8f',12,2,NULL,'[]',0,'2022-12-13 04:45:53','2022-12-13 04:45:53','2023-12-13 09:45:53'),('1c9421a69676419db675f3d09a186c91244c769ae410ff057c7769e3596676017dc362d2b0dc300b',14,2,NULL,'[]',0,'2022-12-13 12:48:12','2022-12-13 12:48:12','2023-12-13 17:48:12'),('26b514f2a53b907555ea50902fa842ae1da44e3568807e872a91111c6ee56c1b2ce25239c8dfc9e8',1,2,NULL,'[]',0,'2022-12-06 14:15:49','2022-12-06 14:15:49','2023-12-06 19:15:49'),('2f86ccdd9d78c820374f2c87cbfdeb3e0d11daec1c8ea60f017bd85ab18dc92ada951070987a7fb0',3,2,NULL,'[]',0,'2022-12-05 05:14:26','2022-12-05 05:14:26','2023-12-05 10:14:26'),('554ebe135574960b582ae3b4bb852ef809b9ec35258249d4d27dce1254ec66f6230eb34a9e7a44cf',1,2,NULL,'[]',0,'2022-12-13 04:21:18','2022-12-13 04:21:18','2023-12-13 09:21:18'),('7eacbb9163008dfdcf8bbec332ee3764d7a50260ccae260201c110373ba0b00b4fba1a9edec5a9a2',8,2,NULL,'[]',0,'2022-12-13 04:26:15','2022-12-13 04:26:15','2023-12-13 09:26:15'),('84d5b8384858931bd31844d12dd07633a724c2878f2b955b613d6e18856cfceaf9359a832e850f18',8,2,NULL,'[]',0,'2022-12-13 04:24:11','2022-12-13 04:24:11','2023-12-13 09:24:11'),('863cbd0a7b2223897b14d710f7c9a4346adca02c6a75b228c0512982dc9e58a5b3e9d151fd9c94f2',8,2,NULL,'[]',0,'2022-12-13 04:19:33','2022-12-13 04:19:33','2023-12-13 09:19:33'),('885877af473edb901cb12c625c709b2c8da0a6ef0c15126e38a2ff287ec3d9f34773cd0cfd2023ab',2,2,NULL,'[]',0,'2022-12-05 05:18:37','2022-12-05 05:18:37','2023-12-05 10:18:37'),('95d10b46a1252e1d7ea05ec51e8a7d1558f1e5b96d8a112fdd47f22e07b8236dac7e71e619483792',8,2,NULL,'[]',0,'2022-12-13 04:13:49','2022-12-13 04:13:49','2023-12-13 09:13:49'),('95e140e9867db692187db7b444fe8f2f35486bfd9280534c305388762ee5b803f31916c55071641e',1,2,NULL,'[]',0,'2022-12-13 17:28:41','2022-12-13 17:28:41','2023-12-13 22:28:41'),('9c029a219758958a06ba9afe7169284f638b9f4b7387c47ba9a149f1ec9d257b559625ddd27daff1',1,2,NULL,'[]',0,'2022-12-13 11:59:57','2022-12-13 11:59:57','2023-12-13 16:59:57'),('b1d1abfce1d3b8412c52981e373aa53ffa49505c55de158bae78589d69abffd7945a32179c38a61c',1,2,NULL,'[]',0,'2022-10-06 07:45:08','2022-10-06 07:45:08','2023-10-06 12:45:08'),('baa8bc5f577130e756e6f928a15e1ea830c1a9893628c1040514c66982ae66cbcd4c8a141e0b0323',11,2,NULL,'[]',0,'2022-12-13 04:44:23','2022-12-13 04:44:23','2023-12-13 09:44:23'),('bd85402ba59c2b7655506dd93b0e7dfb15ddf454d26d64309eef75a34947c41a2a0fdc721470dbe4',2,2,NULL,'[]',0,'2022-12-13 12:18:36','2022-12-13 12:18:36','2023-12-13 17:18:36'),('df488c596c00e1358e2fd1e233a5198bb05e747a55385aa51449b29f2ffb11eda3310cd6c6cc99fb',9,2,NULL,'[]',0,'2022-12-13 12:27:31','2022-12-13 12:27:31','2023-12-13 17:27:31'),('e2f245a4cb97b081df7309c36e1b90860199f7485120ec23b7b24c4f30a6bf9a0bd2d0b13f35f43b',1,2,NULL,'[]',0,'2022-12-06 14:06:42','2022-12-06 14:06:42','2023-12-06 19:06:42'),('efb40acb27b96af2bca4f98e2134e36c103ca06fa8fd3eae10dbab492b5d05d39e6d4d6c46f3dc2a',1,2,NULL,'[]',0,'2022-12-06 14:06:06','2022-12-06 14:06:06','2023-12-06 19:06:06'),('fc85d5b2cfbfef5359fef296616a526f5b65a881063f3b1ff7f99e0fef378820a4a3895c7f72b590',3,2,NULL,'[]',0,'2022-12-06 14:08:23','2022-12-06 14:08:23','2023-12-06 19:08:23');
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
INSERT INTO `oauth_refresh_tokens` VALUES ('34dce8258c0546aaf83f029e356acccb6cdf701c6386b9b3e668ed2f2d507663a14f5ed658235dee','b1d1abfce1d3b8412c52981e373aa53ffa49505c55de158bae78589d69abffd7945a32179c38a61c',0,'2023-10-06 12:45:08'),('3eec397b6531445befcbdf5e07d83b520c8491fd5b782c9f210cb5976e248e676602f6737089c5df','863cbd0a7b2223897b14d710f7c9a4346adca02c6a75b228c0512982dc9e58a5b3e9d151fd9c94f2',0,'2023-12-13 09:19:33'),('4823600cac92d674e9f1b128d1d1fda514c0c7d2d2eabbe002d8b176e85da652affc3a42e88b5c7b','fc85d5b2cfbfef5359fef296616a526f5b65a881063f3b1ff7f99e0fef378820a4a3895c7f72b590',0,'2023-12-06 19:08:23'),('4bc91a443e856a0141c8b4baf101e166a0339c592871b4911f17874d98dc837547c61695349aa824','0458f315a61e819208b4b84d25eb14d2278141688e260fd3465d21defd2e2db2920d9f812eea6ea2',0,'2023-12-13 12:10:36'),('4cbc1ad86dcdac27521306063dd5fca65d106006cb36d38accd9330278e10264476477bc7489ae5c','e2f245a4cb97b081df7309c36e1b90860199f7485120ec23b7b24c4f30a6bf9a0bd2d0b13f35f43b',0,'2023-12-06 19:06:42'),('51d1fd6f430ec8086f3094ff7e32eca243b07d90265f09a8dfb8a406bf0f11169581dfc4970aea09','554ebe135574960b582ae3b4bb852ef809b9ec35258249d4d27dce1254ec66f6230eb34a9e7a44cf',0,'2023-12-13 09:21:18'),('558e31bd59ef28d7805659359e0d8c8cf93de122c2060851694256e0d4e8aa26e27c7e9ab8dd50cd','2f86ccdd9d78c820374f2c87cbfdeb3e0d11daec1c8ea60f017bd85ab18dc92ada951070987a7fb0',0,'2023-12-05 10:14:26'),('69dc0e482640fc42cef1392f1332b6de742baeae536af0dcc643edddf07cddaf8cf28ece55208d6b','84d5b8384858931bd31844d12dd07633a724c2878f2b955b613d6e18856cfceaf9359a832e850f18',0,'2023-12-13 09:24:11'),('751941b15a006e741d5bf08e5e8198a02fcfcd8e2572c46a0314ed93060d0720db75e66f651e9822','baa8bc5f577130e756e6f928a15e1ea830c1a9893628c1040514c66982ae66cbcd4c8a141e0b0323',0,'2023-12-13 09:44:23'),('7f8b06dcb0e82614bc50ef15c2af03b3eb8ee53938b11603047865bd78e1df6578138fd3fa6f780f','bd85402ba59c2b7655506dd93b0e7dfb15ddf454d26d64309eef75a34947c41a2a0fdc721470dbe4',0,'2023-12-13 17:18:36'),('855405a00d0a32a5975bc074973bc2eb8025c25bfd73dc8fe17cb8ccebee65452266c49881100321','95d10b46a1252e1d7ea05ec51e8a7d1558f1e5b96d8a112fdd47f22e07b8236dac7e71e619483792',0,'2023-12-13 09:13:49'),('b293bde372af1595df66b4dec3f0a56152572ff424139108c7ac2f03d29cbff132d9160e70b5321c','95e140e9867db692187db7b444fe8f2f35486bfd9280534c305388762ee5b803f31916c55071641e',0,'2023-12-13 22:28:41'),('b32260f520bc8da84b80aa3c907e324ed8e28ada15caa488f081765f6e843efb46ad4d0cd731532b','1c796f571b4c74f646bc862886bb574cfea3c5567788c08cbc4a6b72a8c80130fe4c21b17f2aed8f',0,'2023-12-13 09:45:53'),('b4222afeb58e260523b0fb7324d6ed164104652fcde2c9d5f9e3ee3b9420b881ff3906da878bf8f2','9c029a219758958a06ba9afe7169284f638b9f4b7387c47ba9a149f1ec9d257b559625ddd27daff1',0,'2023-12-13 16:59:57'),('b8126f5f34a0ea7f24a3436771a497ef98521ded8d5df4a989815ce1fd36497324913d8cd159d5ba','26b514f2a53b907555ea50902fa842ae1da44e3568807e872a91111c6ee56c1b2ce25239c8dfc9e8',0,'2023-12-06 19:15:49'),('bc775bc5a89def5011fa2ad22b4246a8555c7233470c76ba8cd5dae788206a1f2fe166793e6aaafa','885877af473edb901cb12c625c709b2c8da0a6ef0c15126e38a2ff287ec3d9f34773cd0cfd2023ab',0,'2023-12-05 10:18:37'),('dcb1eb8ab6dc0272fd8d17bfc693b4f658224e21603fe17246815d27fa3c5743509ac649a59cf6f8','7eacbb9163008dfdcf8bbec332ee3764d7a50260ccae260201c110373ba0b00b4fba1a9edec5a9a2',0,'2023-12-13 09:26:15'),('e4b447b8d453c3fdd93383cf5cf904de7b59a73c6e5c1a78513e1d915c5da8e2690acd6baafdea77','1c9421a69676419db675f3d09a186c91244c769ae410ff057c7769e3596676017dc362d2b0dc300b',0,'2023-12-13 17:48:12'),('f33c8d50bba321c299268c854d57305e99b1e135e11eeb3953bbc408e7eb36c48dc2ceefd4c1ecf8','efb40acb27b96af2bca4f98e2134e36c103ca06fa8fd3eae10dbab492b5d05d39e6d4d6c46f3dc2a',0,'2023-12-06 19:06:06'),('fa90a818e5d0ca7ee19c932dead78c830256302fa5ce01aac5cece1eeafa6b312a72e30cb6948e41','df488c596c00e1358e2fd1e233a5198bb05e747a55385aa51449b29f2ffb11eda3310cd6c6cc99fb',0,'2023-12-13 17:27:31');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objects`
--

LOCK TABLES `objects` WRITE;
/*!40000 ALTER TABLE `objects` DISABLE KEYS */;
INSERT INTO `objects` VALUES (1,4,'test for code',1,'seryoz','filippine','[\"61.232312\"]','[\"3434\", \"dfdfdf\"]',NULL,'sdfsdfsdf','2022-10-12 00:40:49','2022-11-04 01:09:11'),(2,3,'test for code',2,'mulitpart','filippine','[\"61.232312\"]','[\"3434\", \"dfdfdf\"]',NULL,'sdfsdfsdf','2022-10-12 00:41:26','2022-11-16 05:55:29'),(3,4,'test for code',1,'mulitpart','filippine','[\"61.232312\"]','[\"3434\", \"dfdfdf\"]',NULL,'sdfsdfsdf','2022-10-12 00:44:41','2022-10-12 00:44:41'),(4,4,'test for code',1,'mulitpart','filippine','[\"61.232312\"]','[\"3434\", \"dfdfdf\"]',NULL,'sdfsdfsdf','2022-10-18 01:02:49','2022-10-18 01:02:49'),(5,4,'test for code',1,'mulitpart','filippine','[\"61.232312\"]','[\"3434\", \"dfdfdf\"]',NULL,'sdfsdfsdf','2022-10-18 01:04:55','2022-10-18 01:04:55'),(6,4,'test for code',1,'mulitpart','filippine','[\"61.232312\"]','[\"3434\", \"dfdfdf\"]',NULL,'sdfsdfsdf','2022-10-18 05:50:46','2022-10-18 05:50:46'),(7,4,'test for code',NULL,'mulitpart','filippine','[\"61.232312\"]','[\"3434\", \"dfdfdf\"]',NULL,'sdfsdfsdf','2022-10-18 06:57:55','2022-10-18 06:57:55'),(8,4,'test for code',NULL,'mulitpart','filippine','[\"61.232312\"]','[\"3434\", \"dfdfdf\"]',NULL,'sdfsdfsdf','2022-10-26 23:59:51','2022-10-26 23:59:51'),(9,1,'qwqwqw',1,'fdf','sdsdsd','[1]','[121212]',NULL,'wygiwys','2022-11-07 07:19:13','2022-11-07 07:19:13'),(11,1,'qwqwqw',1,'fdf','sdsdsd','[1]','[121212]','[\"sdfsdf2@ddsfs.com\"]','wygiwys','2022-11-30 05:15:24','2022-11-30 05:15:24'),(12,1,'qwqwqw',1,'fdf','sdsdsd','[1]','[121212]','[\"sdfsdf2@ddsfs.com\"]','wygiwys','2022-11-30 05:15:28','2022-11-30 05:15:28');
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
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES (1,1,1,1,9,'seryoz','[1]','2022-11-21 01:08:35','2022-11-22 00:28:03'),(2,1,1,1,9,'wygswys','[1]','2022-11-21 07:01:42','2022-11-21 07:01:42'),(3,2,1,1,9,'seryoz','[1]','2022-11-22 00:22:27','2022-11-22 00:40:23'),(4,2,1,1,9,'wygswys','[1]','2022-11-22 00:42:30','2022-11-22 00:42:30'),(5,6,1,1,9,'wygswys','[1]','2022-11-23 03:25:27','2022-11-23 03:25:27'),(6,6,1,1,9,'wygswys','[1]','2022-11-24 05:53:59','2022-11-24 05:53:59'),(7,6,1,1,9,'wygswys','[1]','2022-12-01 00:23:57','2022-12-01 00:23:57'),(8,6,1,1,9,'wygswys','[1]','2022-12-01 00:24:11','2022-12-01 00:24:11'),(9,6,1,1,9,'wygswys','[1]','2022-12-01 00:24:33','2022-12-01 00:24:33'),(10,6,1,1,9,'wygswys','[1]','2022-12-01 00:24:36','2022-12-01 00:24:36'),(11,6,1,1,9,'wygswys','[1]','2022-12-01 00:24:43','2022-12-01 00:24:43'),(12,NULL,1,1,7,'wygswys','[1]','2022-12-01 00:25:03','2022-12-01 00:25:03');
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (35,'admin','api','2022-12-13 04:44:10','2022-12-13 04:44:10'),(36,'manager','api','2022-12-13 04:44:10','2022-12-13 04:44:10'),(37,'developer','api','2022-12-13 04:44:10','2022-12-13 04:44:10'),(38,'pentester','api','2022-12-13 04:44:10','2022-12-13 04:44:10'),(39,'soceng','api','2022-12-13 04:44:10','2022-12-13 04:44:10');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_items`
--

LOCK TABLES `task_items` WRITE;
/*!40000 ALTER TABLE `task_items` DISABLE KEYS */;
INSERT INTO `task_items` VALUES (1,3,1,1,9,1,'2022-06-01','2022-07-10','[1]','sdsdsd','waiting','2022-11-23 00:10:35','2022-11-23 07:27:53'),(2,3,2,1,9,2,'2022-06-01','2022-07-10','[1]','wewewe','waiting','2022-11-23 00:10:58','2022-11-23 00:10:58'),(3,3,3,1,9,1,'2022-06-01','2022-07-10','[1]','wewewe','waiting','2022-11-23 00:11:11','2022-11-23 00:11:11'),(4,3,4,1,9,2,'2022-06-01','2022-07-10','[1]','wewewe','waiting','2022-11-23 00:11:12','2022-11-23 00:11:12'),(5,3,3,1,9,2,'2022-06-01','2022-07-10','[1]','wewewe','waiting','2022-11-23 00:11:13','2022-11-23 00:11:13'),(6,3,24,1,9,2,'2022-08-01','2022-09-10','[1]','wewewe','inprogress','2022-11-23 00:11:14','2022-11-23 03:25:27'),(7,3,13,1,9,2,'2022-08-01','2022-09-10','[1]','wewewe','inproggress','2022-11-23 00:11:14','2022-11-23 00:11:14'),(8,3,1,1,9,1,'2022-08-01','2022-08-01','[1]','wewewe','waiting','2022-11-23 07:12:04','2022-11-23 07:12:04'),(9,1,1,4,1,1,'2022-08-01','2022-08-01','[1]','wewewe','waiting','2022-11-23 07:12:18','2022-11-23 07:12:18'),(10,1,1,4,1,1,'2022-08-01','2022-08-01','[1]','wewewe','waiting','2022-12-13 07:08:43','2022-12-13 07:08:43'),(11,1,1,4,1,1,'2022-08-01','2022-08-01','[1]','wewewe','waiting','2022-12-13 07:11:47','2022-12-13 07:11:47');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(2,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(3,'required|string','2022-08-11','2022-09-11',1,'[2, 1, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(4,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(5,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(6,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(7,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(8,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(9,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(10,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(11,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(12,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(13,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(14,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(15,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(16,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(17,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(18,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(19,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(20,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(21,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(22,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(23,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(24,'required|string','2022-08-11','2022-09-11',1,'[2, 3]',NULL,'[1, 2, 3, 4]',NULL,NULL,'2022-11-21 01:08:07','2022-11-21 01:08:07'),(25,'required|string','2022-11-11','2022-11-11',9,'[1]','37','[1, 2, 3, 4]',NULL,NULL,'2022-12-13 23:57:15','2022-12-13 23:57:15');
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
  `role` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Mr. Gavin Bartell Sr.','admin','uploads/avatars/default.jpg','bwindler@example.org','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','PSSJuBlWT3','2022-10-06 07:43:33','2022-10-06 07:43:33'),(2,'dfjgdfgo','admin','uploads/avatars/default.jpg','bwindler@dfd.org','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','PSSJuBlWT3','2022-10-25 06:31:48','2022-10-25 06:31:50'),(9,'Baxrom',NULL,NULL,'Baxromuser5','$2y$10$zvqjUY0MEJhccDLCQrsdHeC0bu3zQdtGcEbB/rqOZ/kokRArz9Apa',NULL,'2022-12-13 04:20:03','2022-12-13 04:20:03'),(10,'Baxrom',NULL,NULL,'Baxromuser5uu','$2y$10$Egfx9frVQ9foDBvbZDXhxOGdbE/O3BZ4BercasVXRlb3ZG8EKE1iO',NULL,'2022-12-13 04:25:19','2022-12-13 04:25:19'),(11,'baxa',NULL,'uploads/avatars/default.jpg','userrname@gmail.com','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','mZhdFDigxi','2022-12-13 04:44:10','2022-12-13 04:46:53'),(12,'Baxrom',NULL,NULL,'Baxromuser5uue','$2y$10$miPKY0mDsxpsMD8M4b3ID.0xNfRagsczAaEKNgniQn/lO3w46QBhO',NULL,'2022-12-13 04:45:04','2022-12-13 04:45:04'),(13,'Baxrom',NULL,NULL,'Baxromuser5uuewew','$2y$10$AlMoNd3OSl4Wy0Z3Q7M6q.75WTtjvMk3S.ITQwbWI1HPZ4NFyyZdq',NULL,'2022-12-13 07:01:15','2022-12-13 07:01:15'),(14,'Baxrom',NULL,NULL,'testuser','$2y$10$P3puhKYGiT/HD2VcJW4g5eRAY4JQ1Dvpej22w5I5FumOKRDp0o7by',NULL,'2022-12-13 07:09:31','2022-12-13 07:09:31'),(15,'Baxrom',NULL,NULL,'testuserrt','$2y$10$1B8IPKAtrfcfLLj81P5WbOJqrgNvxQpnoK1FRUT7M7N0tbYPXtU7S',NULL,'2022-12-13 12:19:38','2022-12-13 12:19:38');
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

-- Dump completed on 2022-12-15 17:44:06
