-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: hrms2.0
-- ------------------------------------------------------
-- Server version	5.6.25

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
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `manager` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `departments_manager_foreign` (`manager`),
  CONSTRAINT `departments_manager_foreign` FOREIGN KEY (`manager`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Development',NULL,NULL,2),(2,'Sales',NULL,NULL,NULL),(3,'Operations',NULL,NULL,NULL);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `EmpID` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Fname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Lname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pob` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `religion` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouseName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ID_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idExpiry` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visaNo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visaExpiry` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passportNo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passportIssue` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passportExpiry` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passportPOI` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `residence` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobNo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secNo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telNo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_id` int(10) unsigned DEFAULT NULL,
  `salary` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contractDate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doj` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `JobTitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_id` int(10) unsigned DEFAULT NULL,
  `profilePic` longtext COLLATE utf8mb4_unicode_ci,
  `Resume` longtext COLLATE utf8mb4_unicode_ci,
  `ResumeFile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IDCopy` longtext COLLATE utf8mb4_unicode_ci,
  `IDFile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PassportCopy` longtext COLLATE utf8mb4_unicode_ci,
  `PassportFile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EduCertificate` longtext COLLATE utf8mb4_unicode_ci,
  `EducationFile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OtherDocs` longtext COLLATE utf8mb4_unicode_ci,
  `OtherFile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_template_id_foreign` (`template_id`),
  KEY `employees_department_id_foreign` (`department_id`),
  KEY `employees_user_id_foreign` (`user_id`),
  CONSTRAINT `employees_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employees_template_id_foreign` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (2,'1435','Staffy','Manager','manager@ferius.com','1991-01-31','Male',NULL,NULL,NULL,NULL,NULL,'910110794',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-19 08:12:30','2019-01-19 08:12:31',12),(3,'2565','Staffy','HR','hr@ferius.com',NULL,'Male',NULL,NULL,NULL,NULL,NULL,'12345678',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,2,'data:image/png;base64,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',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-19 08:39:02','2019-01-19 08:39:03',13);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaves`
--

DROP TABLE IF EXISTS `leaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leaves` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_days` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `submission_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `done_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `done_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rejection_reason` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leaves_employee_id_foreign` (`employee_id`),
  CONSTRAINT `leaves_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaves`
--

LOCK TABLES `leaves` WRITE;
/*!40000 ALTER TABLE `leaves` DISABLE KEYS */;
INSERT INTO `leaves` VALUES (1,'Annual Leave','05/02/2019','07/02/2019','2','','',2,'02/02/2019','Approved','Staffy Manager','03/02/2019','',NULL,NULL),(2,'Sick Leave','27/01/2019','27/01/2019','1','','',2,'28/01/2019','Rejected','Staffy Manager','03/02/2019','Too many Sick Leaves',NULL,NULL),(3,'Annual Leave','27/02/2019','05/03/2019','7','','',2,'28/02/2019','Pending','','','',NULL,NULL);
/*!40000 ALTER TABLE `leaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (19,'2019_01_03_113452_create_permissions_table',1),(33,'2014_10_12_000000_create_users_table',2),(34,'2014_10_12_100000_create_password_resets_table',2),(35,'2014_10_12_200000_create_templates_table',2),(36,'2014_10_12_300000_create_departments_table',2),(37,'2014_10_12_400000_create_employees_table',2),(38,'2016_06_01_000001_create_oauth_auth_codes_table',2),(39,'2016_06_01_000002_create_oauth_access_tokens_table',2),(40,'2016_06_01_000003_create_oauth_refresh_tokens_table',2),(41,'2016_06_01_000004_create_oauth_clients_table',2),(42,'2016_06_01_000005_create_oauth_personal_access_clients_table',2),(43,'2018_11_03_072536_create_settings_table',2),(44,'2019_01_02_091323_add_employees_id_to_users_table',2),(45,'2019_01_02_091526_add_users_id_to_employees_table',2),(46,'2019_01_12_121624_add_manager_to_departments_table',2),(47,'2019_01_18_144737_create_permission_tables',3),(51,'2019_02_02_105745_create_leaves_table',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
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
INSERT INTO `model_has_roles` VALUES (1,'App\\User',1),(2,'App\\User',12);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
INSERT INTO `oauth_access_tokens` VALUES ('21cf03b6f6f1cb04c5fe6c4b3ae49e2471fa848cc9a5b2530caa798473656f3c7f0bb235bb84ac1a',12,1,'Personal Access Token','[]',1,'2019-01-19 08:16:38','2019-01-19 08:16:38','2019-01-26 11:16:38'),('2e063e1f79e3574dc8b19915acf52003e98931ea52d084451da37011f48123eefe35945804ffb642',1,1,'Personal Access Token','[]',1,'2019-01-19 08:05:16','2019-01-19 08:05:16','2019-01-26 11:05:17'),('2eb13213156525aed2f26c24598e08b8fee4ea75f22cb9877f26ffc4d32b4d3b4afc7661508862aa',13,1,'Personal Access Token','[]',1,'2019-01-19 09:31:15','2019-01-19 09:31:15','2019-01-26 12:31:16'),('2fa7cc6b19f71182baf9547eb524f71b4e149da47afa20b30902c3fede60114a5873170d1fc7c5b3',13,1,'Personal Access Token','[]',1,'2019-01-19 08:40:47','2019-01-19 08:40:47','2019-01-26 11:40:47'),('32791a3faec9b0e91a0d234b2580a5f1bf3423f63bdeb5ac04c3c23861a9e2f7ef3f3de05003c3c9',1,1,'Personal Access Token','[]',1,'2019-01-19 08:37:11','2019-01-19 08:37:11','2019-01-26 11:37:12'),('3681a287b544e664502f1ec9b892e317cf00a2381032a147d4285b2abd7753d286fbf4281ee17ee6',12,1,'Personal Access Token','[]',0,'2019-02-02 06:30:14','2019-02-02 06:30:14','2019-02-09 09:30:20'),('392def03230adb8265fa9fa2783dc03f6972868452664432a3d4332acac34cf080d3769fdd4c3d5e',2,1,'Personal Access Token','[]',1,'2019-01-19 07:21:34','2019-01-19 07:21:34','2019-01-26 10:21:35'),('51346632787a26dd2abbe9f3c7ed6fad4e7f473a97972c45d0c148d252f8a81e84fa439308b3b97e',12,1,'Personal Access Token','[]',0,'2019-01-25 12:21:45','2019-01-25 12:21:45','2019-02-01 15:21:46'),('532d932ce5639047faf173de644ad7375459ca4c64e394cb0d5a84452f32194c2a3318400f685d71',1,1,'Personal Access Token','[]',1,'2019-01-25 02:46:06','2019-01-25 02:46:06','2019-02-01 05:46:07'),('5936eb02e316b328fb2c3f90d1c8612fd4c4d065ef16049d67422cc92be30c5449f76147984ac315',12,1,'Personal Access Token','[]',1,'2019-01-26 05:41:06','2019-01-26 05:41:06','2019-02-02 08:41:07'),('5c10512ea2e31d31ef31cae9654f934ed89ec3c1258a31eddf9f858ec3908d1c6e1951429ae26cc1',12,1,'Personal Access Token','[]',0,'2019-01-19 09:34:33','2019-01-19 09:34:33','2019-01-26 12:34:34'),('6cb0811f8ea48959b63e2f44a4e984473f99a1b647e91626df4ece3c605c405a71440d297760e4b3',13,1,'Personal Access Token','[]',1,'2019-01-19 08:49:59','2019-01-19 08:49:59','2019-01-26 11:50:00'),('75b50ea1bafce4b20d551fbe1953327ca7edabd41a42535ded36595164acbfcbcfba9b2b8f614f5b',1,1,'Personal Access Token','[]',1,'2019-01-19 09:04:26','2019-01-19 09:04:26','2019-01-26 12:04:26'),('8103b6bdc1583eaa71482cf55cc74c7ce31f84ef7e3b40d3820a319dd2a92777aee6b1053f2160ac',2,1,'Personal Access Token','[]',1,'2019-01-19 06:46:07','2019-01-19 06:46:07','2019-01-26 09:46:09'),('8230d1889c72fe4a82bda468ce20902cb204f11ad754ccbf7157ab5384dcc514a2e107ecd0cd9cd0',1,1,'Personal Access Token','[]',0,'2019-01-26 05:42:24','2019-01-26 05:42:24','2019-02-02 08:42:25'),('9aeec89f66e3e561853d9aaa49b0435036c9bc702b896e3816d73dddd44ef976ffbde954dc5809ff',12,1,'Personal Access Token','[]',1,'2019-01-26 05:32:58','2019-01-26 05:32:58','2019-02-02 08:33:01'),('a20bc0205e6a6af17b097c0c123b0ecd843316467e47067970030b36384f1677c0d846da284595cb',12,1,'Personal Access Token','[]',1,'2019-01-19 09:04:09','2019-01-19 09:04:09','2019-01-26 12:04:10'),('a626b2a7f3c08d7859c8ef9a4d9b07aa394ac08d7a468efc01b30ee8be6222f6303898095c01cab5',12,1,'Personal Access Token','[]',1,'2019-02-02 06:43:14','2019-02-02 06:43:14','2019-02-09 09:43:15'),('a8ccb1611a40dee0f4e26c718882e8d5420d5e29ad4abbf0d0191838f8674bc5fda0653dd7aee22b',1,1,'Personal Access Token','[]',0,'2019-02-02 09:24:30','2019-02-02 09:24:30','2019-02-09 12:24:31'),('b11dead3eb3b496835b126e91880c474fe9450e0e2aedbd92810184a343072d778b204a646a7ba73',12,1,'Personal Access Token','[]',1,'2019-01-26 05:30:46','2019-01-26 05:30:46','2019-02-02 08:30:51'),('c1d3b9f875d2e786e0924946478869ba671ca6548e331c2091165f0086a8fee00b61156e30b4a943',12,1,'Personal Access Token','[]',1,'2019-01-19 09:11:22','2019-01-19 09:11:22','2019-01-26 12:11:22'),('c7e8742abf7759ec04b1052820bafd6c0af79a6619547f77532232726bc906c5827e2fb84d586110',1,1,'Personal Access Token','[]',1,'2019-01-19 07:22:06','2019-01-19 07:22:06','2019-01-26 10:22:07'),('c9bd6c82081986e845345cafbc61119f5dec18f4e0991399dfb74f28e65736a4fab6b2176a465b4e',2,1,'Personal Access Token','[]',1,'2019-01-19 07:52:02','2019-01-19 07:52:02','2019-01-26 10:52:03'),('cfee84564efb5aa72bf0d4806585832e5fa3e6202b57f598daaaa633ce04b48582f1cf65516a2999',12,1,'Personal Access Token','[]',0,'2019-01-26 08:37:29','2019-01-26 08:37:29','2019-02-02 11:37:30'),('d156eff3e135a4fb59a227824abb32bd1e93c373eb65e65ae1d352423f980a07a17212a0ba42e396',1,1,'Personal Access Token','[]',0,'2019-02-02 07:17:07','2019-02-02 07:17:07','2019-02-09 10:17:08'),('e2475916001e8a50622091aa5eff0372c44f79985ff0130aecd6d799c1afd33640c525fc5a550f81',1,1,'Personal Access Token','[]',1,'2019-01-18 12:04:12','2019-01-18 12:04:12','2019-01-25 15:04:16'),('e74abce83b7d49efe60fa38f31e22a1c1a6d580e03adfc826d5f3c422b2634554c9aaa987027e5b1',1,1,'Personal Access Token','[]',1,'2019-01-26 08:34:20','2019-01-26 08:34:20','2019-02-02 11:34:21'),('edb6a7ac1eab19fdb27aead6cef5736717f06d07bb4173b68f331957cdc51d8fb5f9189237cfa8bb',12,1,'Personal Access Token','[]',1,'2019-01-19 09:33:29','2019-01-19 09:33:29','2019-01-26 12:33:29'),('f1647af345db2cfe3f2ec378849f7a972dde18ba4c03138e36a895df6b7a63d2e2468b562f71c0b8',12,1,'Personal Access Token','[]',1,'2019-01-21 11:41:47','2019-01-21 11:41:47','2019-01-28 14:41:52'),('f2ef7678ea188ca6600ef1180587709aafdc05af21dcfd8a1258294996f0e6f280dd3b94974e92f7',13,1,'Personal Access Token','[]',1,'2019-01-26 05:41:54','2019-01-26 05:41:54','2019-02-02 08:41:57');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','SzYG2fvgYYWZy8Eg9rKy5V9t0Hk2lr3rUVNUZsuh','http://localhost',1,0,0,'2019-01-18 12:01:07','2019-01-18 12:01:07'),(2,NULL,'Laravel Password Grant Client','CdtJIoC0rbTDFLFDiPkaBOx8MlPmt0SHgzq0ZeuX','http://localhost',0,1,0,'2019-01-18 12:01:08','2019-01-18 12:01:08');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2019-01-18 12:01:08','2019-01-18 12:01:08');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'employees','web','2019-01-18 12:14:00','2019-01-18 12:14:00'),(2,'departments','web','2019-01-19 03:24:51','2019-01-19 03:24:51'),(3,'attendance','web','2019-01-19 05:41:33','2019-01-19 05:41:33'),(4,'payroll','web','2019-01-19 06:22:02','2019-01-19 06:22:02'),(5,'leaveManagement','web','2019-01-19 06:32:53','2019-01-19 06:32:53'),(6,'reports','web','2019-01-19 06:34:58','2019-01-19 06:34:58'),(7,'add employee','web','2019-01-19 07:08:47','2019-01-19 07:08:47'),(8,'my profile','web','2019-01-19 07:56:17','2019-01-19 07:56:17'),(9,'my employees','web','2019-01-25 02:40:58','2019-01-25 02:40:58');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
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
INSERT INTO `role_has_permissions` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,2),(9,2);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','web','2019-01-18 12:13:59','2019-01-18 12:13:59'),(2,'manager','web','2019-01-19 06:51:56','2019-01-19 06:51:56');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `app_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `app_color_secondary` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `app_color_accent` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `app_color_error` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `app_color_warning` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `app_color_info` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `app_color_success` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'Staffy','blue darken-3','blue darken-4','blue darken-1','red','yellow','blue','green',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templates`
--

DROP TABLE IF EXISTS `templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `temp` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templates`
--

LOCK TABLES `templates` WRITE;
/*!40000 ALTER TABLE `templates` DISABLE KEYS */;
INSERT INTO `templates` VALUES (1,'Full Time','Full Time Template','<!DOCTYPE html>\n<html>\n<head>\n</head>\n<body>\n<p style=\"line-height: 150%; margin: 0in 0in 10pt; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\">Date: $contractDate</span></p>\n<p style=\"text-align: center; line-height: 150%; margin: 0in 0in 10pt; font-size: 11pt; font-family: Calibri, sans-serif;\" align=\"center\"><strong><u><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\">Employment Contract</span></u></strong></p>\n<p style=\"line-height: 150%; margin: 0in 0in 10pt; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\">Agree on the contract made by and between:</span></p>\n<p style=\"margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\">1- <em><u>Al-Haddad Information Technology Services</u></em>, having its head office in the city of Manama. (First Party).</span></p>\n<p style=\"margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\">2- $Title $fullName, holding passport no. $passportNo, of $nationality nationality (Second Party).</span></p>\n<p style=\"margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\">&nbsp;</span></p>\n<p style=\"margin: 0in 0in 0.0001pt; text-align: center; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;\" align=\"center\"><strong><u><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\">Preamble</span></u></strong></p>\n<p style=\"margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\">This contract has been concluded between the two parties hereto for the purpose of performing the works specified below at the standard set by the <strong>First Party</strong> and shown in the attached description of the job to be filled by the <strong>Second Party</strong>.</span></p>\n<p style=\"margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\">&nbsp;</span></p>\n<p style=\"margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\">The <strong>Second Party</strong>, therefore, declares that it is fully cognizant of this fact and accepts to enter into this contract on the understanding that it feels fully capable of performing this work at the standards required by the<strong> First Party</strong> and, therefore, undertakes to fulfill the obligations contained herein.</span></p>\n<p style=\"margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\">&nbsp;</span></p>\n<p style=\"margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\">Both parties hereto agree and covenant as follows:</span></p>\n<p style=\"margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\">&nbsp;</span></p>\n<ol style=\"margin-bottom: 0in; margin-top: 0px;\" start=\"1\" type=\"a\">\n<li style=\"line-height: 150%; margin-top: 0in; margin-right: 0in; margin-bottom: 10pt; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\">The above Preamble forms an integral part of this contract.</span></li>\n<li style=\"line-height: 150%; margin-top: 0in; margin-right: 0in; margin-bottom: 10pt; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\">The <strong>First Party</strong> agrees to employ the <strong>Second Party</strong> as of </span></li>\n<ul style=\"margin-bottom: 0in; margin-top: 0px;\" type=\"disc\">\n<li style=\"line-height: 150%; margin-top: 0in; margin-right: 0in; margin-bottom: 10pt; font-size: 11pt; font-family: Calibri, sans-serif;\"><u><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\">Joining Date</span></u><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\">: $joiningDate</span></li>\n<li style=\"line-height: 150%; margin-top: 0in; margin-right: 0in; margin-bottom: 10pt; font-size: 11pt; font-family: Calibri, sans-serif;\"><u><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\">Job Role:</span></u><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\"> $jobRole</span></li>\n<li style=\"line-height: 150%; margin-top: 0in; margin-right: 0in; margin-bottom: 10pt; font-size: 11pt; font-family: Calibri, sans-serif;\"><u><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\">Conditions:</span></u><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\"> The <strong>First Party</strong> shall have the right to assign to the <strong>Second Party</strong> any related work (specified on the job description) within the nature of the <strong>Second Party</strong>&rsquo;s qualifications or which work he/her may become qualified for through experience and training by the <strong>First Party.</strong></span></li>\n</ul>\n<li style=\"line-height: 150%; margin-top: 0in; margin-right: 0in; margin-bottom: 10pt; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\">The <strong>First Party</strong> agrees to compensate the <strong>Second Party</strong> with the following benefits: </span></li>\n<ul style=\"margin-bottom: 0in; margin-top: 0px;\" type=\"disc\">\n<li style=\"line-height: 150%; margin-top: 0in; margin-right: 0in; margin-bottom: 10pt; font-size: 11pt; font-family: Calibri, sans-serif;\"><u><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\">Salary:</span></u><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\"> $salary BHD</span></li>\n<li style=\"line-height: 150%; margin-top: 0in; margin-right: 0in; margin-bottom: 10pt; font-size: 11pt; font-family: Calibri, sans-serif;\"><u><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\">Leaves:</span></u><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\"> 30 working days annually (Based on Bahrain Labor Law).</span></li>\n<li style=\"line-height: 150%; margin-top: 0in; margin-right: 0in; margin-bottom: 10pt; font-size: 11pt; font-family: Calibri, sans-serif;\"><u><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\">Conditions:</span></u><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\"> Salary to be reviewed basis performance and business growth. The <strong>First</strong> <strong>Party</strong> shall also deduct from such salary, including any supplemental allowance, all sums deductible by Law from the <strong>Second Party&rsquo;s</strong> salary including taxes, fees, contributions or any other levies imposed by Law on the <strong>Second Part</strong>.</span></li>\n</ul>\n<li style=\"line-height: 150%; margin-top: 0in; margin-right: 0in; margin-bottom: 10pt; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\">The <strong>Second Party</strong> shall be deemed to have been appointed under probation for <u>Three (3) months</u> during which or upon expiration thereof <strong>Either Party</strong> shall be entitled to terminate or cancel this contract by giving one day notice. Upon expiration of the probationary period and unless <strong>Either Party</strong> has used their right to cancel this contract, the Second Party shall be deemed to have been employed for an indefinite period effective employment date.</span></li>\n<li style=\"line-height: 150%; margin-top: 0in; margin-right: 0in; margin-bottom: 10pt; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\">The <strong>Second Party</strong> shall devote the whole time and attention to the<strong> first Party\'s</strong> business during the working hours as specified in Labor Law No.36 of 2012, or in any other subsequent law. The <strong>Second Party</strong> hereby acknowledges that the <strong>First Party</strong> is at liberty to modify at any time the working hours described in its By-Laws, provided that such modified hours will not exceed maximum working hours stipulated by law, and the <strong>Second Party</strong> may not claim any additional salary or compensation for any such working hours as work needs in the organization may require so long as such hours, if added to those provided for in the <strong>First Party\'s</strong> By-Laws, will not exceed in the aggregate the maximum hours provided for in the Law.</span></li>\n<li style=\"line-height: 150%; margin-top: 0in; margin-right: 0in; margin-bottom: 10pt; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\">The <strong>Second Party</strong> shall not without written permission from the company, engage in any work for a third party with or without remuneration even outside official working hours, or participate, directly or indirectly, in an activity or enterprise which is in direct conflict with the organization&rsquo;s interest, or in any concern having transactions with the organization.</span></li>\n<li style=\"line-height: 150%; margin-top: 0in; margin-right: 0in; margin-bottom: 10pt; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\">The <strong>Second Party</strong> undertakes to observe all orders and instructions issued to the <strong>Second Party</strong> by the organization&rsquo;s management and shall accurately implement the organization&rsquo;s regulations and always observe good conduct, behavior and reputation.</span></li>\n<li style=\"line-height: 150%; margin-top: 0in; margin-right: 0in; margin-bottom: 10pt; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\">The <strong>Second Party</strong> herby agrees to abide by a full confidentially of the <strong>First Party</strong> information.</span></li>\n<li style=\"line-height: 150%; margin-top: 0in; margin-right: 0in; margin-bottom: 10pt; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 12.0pt; line-height: 150%; font-family: \'Times New Roman\', serif;\">This contract is executed in duplicate, one copy per each party for necessary actions.</span></li>\n</ol>\n<div align=\"center\">\n<table class=\"MsoTableGrid\" style=\"border-collapse: collapse; border: none;\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td style=\"width: 176.1pt; border: solid windowtext 1.0pt; background: #EEECE1; padding: 0in 5.4pt 0in 5.4pt;\" colspan=\"2\" valign=\"top\" width=\"235\">\n<p style=\"margin: 0in 0in 0.0001pt; text-align: center; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;\" align=\"center\"><strong>First Party</strong></p>\n<p style=\"margin: 0in 0in 0.0001pt; text-align: center; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;\" align=\"center\"><strong><span dir=\"RTL\" style=\"font-family: Arial, sans-serif;\">الطرف الأول</span></strong></p>\n</td>\n<td style=\"width: 176.1pt; border: solid windowtext 1.0pt; border-left: none; background: #EEECE1; padding: 0in 5.4pt 0in 5.4pt;\" colspan=\"2\" valign=\"top\" width=\"235\">\n<p style=\"margin: 0in 0in 0.0001pt; text-align: center; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;\" align=\"center\"><strong>Second Party</strong></p>\n<p style=\"margin: 0in 0in 0.0001pt; text-align: center; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;\" align=\"center\"><strong><span dir=\"RTL\" style=\"font-family: Arial, sans-serif;\">الطرف الثاني</span></strong></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 65.85pt; border: solid windowtext 1.0pt; border-top: none; padding: 0in 5.4pt 0in 5.4pt;\" valign=\"top\" width=\"88\">\n<p style=\"margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;\">Name</p>\n</td>\n<td style=\"width: 110.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0in 5.4pt 0in 5.4pt;\" valign=\"top\" width=\"147\">\n<p style=\"margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;\">&nbsp;</p>\n</td>\n<td style=\"width: 56.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0in 5.4pt 0in 5.4pt;\" valign=\"top\" width=\"75\">\n<p style=\"margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;\">Name</p>\n</td>\n<td style=\"width: 119.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0in 5.4pt 0in 5.4pt;\" valign=\"top\" width=\"160\">\n<p style=\"margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 65.85pt; border: solid windowtext 1.0pt; border-top: none; padding: 0in 5.4pt 0in 5.4pt;\" valign=\"top\" width=\"88\">\n<p style=\"margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;\">Date</p>\n</td>\n<td style=\"width: 110.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0in 5.4pt 0in 5.4pt;\" valign=\"top\" width=\"147\">\n<p style=\"margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;\">&nbsp;</p>\n</td>\n<td style=\"width: 56.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0in 5.4pt 0in 5.4pt;\" valign=\"top\" width=\"75\">\n<p style=\"margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;\">Date</p>\n</td>\n<td style=\"width: 119.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0in 5.4pt 0in 5.4pt;\" valign=\"top\" width=\"160\">\n<p style=\"margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 65.85pt; border: solid windowtext 1.0pt; border-top: none; padding: 0in 5.4pt 0in 5.4pt;\" valign=\"top\" width=\"88\">\n<p style=\"margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;\">Signature</p>\n</td>\n<td style=\"width: 110.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0in 5.4pt 0in 5.4pt;\" valign=\"top\" width=\"147\">\n<p style=\"margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;\">&nbsp;</p>\n<p style=\"margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;\">&nbsp;</p>\n<p style=\"margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;\">&nbsp;</p>\n</td>\n<td style=\"width: 56.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0in 5.4pt 0in 5.4pt;\" valign=\"top\" width=\"75\">\n<p style=\"margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;\">Signature</p>\n</td>\n<td style=\"width: 119.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0in 5.4pt 0in 5.4pt;\" valign=\"top\" width=\"160\">\n<p style=\"margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;\">&nbsp;</p>\n</td>\n</tr>\n</tbody>\n</table>\n</div>\n<p style=\"line-height: 150%; margin: 0in 0in 10pt; font-size: 11pt; font-family: Calibri, sans-serif;\">&nbsp;</p>\n<div style=\"text-align: left;\">&nbsp;</div>\n</body>\n</html>','2019-01-19 07:05:28','2019-01-19 07:05:28');
/*!40000 ALTER TABLE `templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `employee_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_employee_id_foreign` (`employee_id`),
  CONSTRAINT `users_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@staffy.com',NULL,'$2y$10$BTZvDF1A27qwzGVNFdF6uOiuarLD7ymRC8oprFTpmMdmd9EUXlwVG','admin',NULL,NULL,NULL,NULL),(12,'Staffy Manager','manager@Staffy.com',NULL,'$2y$10$BTZvDF1A27qwzGVNFdF6uOiuarLD7ymRC8oprFTpmMdmd9EUXlwVG','employee',NULL,'2019-01-19 08:12:31','2019-01-19 08:12:31',2),(13,'Staffy HR','hr@Staffy.com',NULL,'$2y$10$BTZvDF1A27qwzGVNFdF6uOiuarLD7ymRC8oprFTpmMdmd9EUXlwVG','employee',NULL,'2019-01-19 08:39:03','2019-01-19 08:39:03',3);
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

-- Dump completed on 2019-02-02 16:03:16
