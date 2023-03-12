-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: ujikom_hotel
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','resepsionis') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'resepsionis',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Administrator','admin','admin','$2y$10$dP0kV/Wpa0yjwreP0zel5uNpqsgGPwV5qVqrQba9zai.PWnoNLOJW',NULL,'2022-06-02 06:12:05','2022-06-02 06:12:05'),(2,'Resepsionis','resepsionis','resepsionis','$2y$10$X/1hfoO4GMF.5aFD1C9A9OuWt25SoBZDL7oKXopOc4V83/Ld9v45y',NULL,'2022-06-02 06:12:06','2022-06-02 06:12:06'),(3,'Hayabusa','haya','resepsionis','$2y$10$HRP3LetnDjxowu9Wom0XK.Xg09G.QPKcOQLeKwuOpdta/iCHLykAy',NULL,'2022-06-02 06:12:06','2022-06-02 06:12:06');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fasilitas_hotels`
--

DROP TABLE IF EXISTS `fasilitas_hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fasilitas_hotels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama_fasilitas_hotel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto_fasilitas_hotel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi_fasilitas_hotel` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fasilitas_hotels`
--

LOCK TABLES `fasilitas_hotels` WRITE;
/*!40000 ALTER TABLE `fasilitas_hotels` DISABLE KEYS */;
INSERT INTO `fasilitas_hotels` VALUES (1,'Kolam Renang','469_1654425075.jpg','Non est quidem labore ut impedit distinctio et corrupti. Distinctio doloremque enim occaecati aut incidunt ad. Ab eos rerum et. Perspiciatis nesciunt laudantium officiis voluptate reprehenderit harum'),(2,'Restoran','182_1654425115.jpg','Non est quidem labore ut impedit distinctio et corrupti. Distinctio doloremque enim occaecati aut incidunt ad. Ab eos rerum et. Perspiciatis nesciunt laudantium officiis voluptate reprehenderit harum'),(3,'Parkir Luas','195_1654425134.jpg','Non est quidem labore ut impedit distinctio et corrupti. Distinctio doloremque enim occaecati aut incidunt ad. Ab eos rerum et. Perspiciatis nesciunt laudantium officiis voluptate reprehenderit harum'),(4,'Sarapan Pagi Gratis','646_1654425349.jpg','Non est quidem labore ut impedit distinctio et corrupti. Distinctio doloremque enim occaecati aut incidunt ad. Ab eos rerum et. Perspiciatis nesciunt laudantium officiis voluptate reprehenderit harum');
/*!40000 ALTER TABLE `fasilitas_hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fasilitas_kamars`
--

DROP TABLE IF EXISTS `fasilitas_kamars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fasilitas_kamars` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kamar_id` bigint(20) unsigned NOT NULL,
  `nama_fasilitas_kamar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fasilitas_kamars_kamar_id_foreign` (`kamar_id`),
  CONSTRAINT `fasilitas_kamars_kamar_id_foreign` FOREIGN KEY (`kamar_id`) REFERENCES `kamars` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fasilitas_kamars`
--

LOCK TABLES `fasilitas_kamars` WRITE;
/*!40000 ALTER TABLE `fasilitas_kamars` DISABLE KEYS */;
INSERT INTO `fasilitas_kamars` VALUES (1,1,'TV'),(2,1,'AC'),(3,2,'TV'),(4,2,'AC'),(5,1,'BALKON'),(6,1,'KULKAS'),(7,1,'PEMBUAT KOPI/TEH'),(8,2,'KULKAS'),(9,2,'BALKON'),(10,2,'PEMBUAT KOPI/TEH'),(11,3,'TV'),(12,3,'AC'),(13,3,'BALKON MENGHADAP LAUT'),(14,3,'KULKAS'),(15,3,'PEMBUAT KOPI/TEH');
/*!40000 ALTER TABLE `fasilitas_kamars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kamars`
--

DROP TABLE IF EXISTS `kamars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kamars` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama_kamar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto_kamar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jum_kamar` int(11) NOT NULL,
  `jum_kamar_kosong` int(11) NOT NULL DEFAULT 0,
  `jum_kamar_terisi` int(11) NOT NULL DEFAULT 0,
  `harga_kamar` int(11) DEFAULT NULL,
  `deskripsi_kamar` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kamars`
--

LOCK TABLES `kamars` WRITE;
/*!40000 ALTER TABLE `kamars` DISABLE KEYS */;
INSERT INTO `kamars` VALUES (1,'Deluxe Room','29_1654425690.jpg',10,10,0,850000,'Incidunt et numquam voluptatem ipsam soluta distinctio. Harum ex eos consequatur velit aspernatur. Blanditiis libero fuga saepe quaerat tempora.'),(2,'Family Room','490_1654426398.jpg',10,10,0,1000000,'Natus error id autem doloribus qui eum. Et possimus cumque ipsa quis reprehenderit neque provident. Qui voluptatibus eveniet sit est. Commodi odio accusamus magni ducimus.'),(3,'Superior Suite Room','763_1654427354.jpg',10,10,0,1350000,'Tempore quibusdam velit autem in illo ratione rerum. Sed aut quis autem nemo praesentium sint numquam. Sit nulla suscipit est et. Odio repellendus omnis est doloremque voluptatibus ipsum accusamus.');
/*!40000 ALTER TABLE `kamars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2019_12_14_000001_create_personal_access_tokens_table',1),(2,'2022_04_01_234445_create_admins_table',1),(3,'2022_04_07_074121_create_kamars_table',1),(4,'2022_04_09_015158_create_fasilitas_kamars_table',1),(5,'2022_04_09_093639_create_fasilitas_hotels_table',1),(6,'2022_04_10_232342_create_pemesanans_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pemesanans`
--

DROP TABLE IF EXISTS `pemesanans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pemesanans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kamar_id` bigint(20) unsigned DEFAULT NULL,
  `tgl_checkin` date NOT NULL,
  `tgl_checkout` date NOT NULL,
  `jum_kamar_dipesan` int(11) NOT NULL,
  `nama_pemesan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_pemesan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_tamu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pesan','checkin','checkout','batal') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pesan',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pemesanans_kamar_id_foreign` (`kamar_id`),
  CONSTRAINT `pemesanans_kamar_id_foreign` FOREIGN KEY (`kamar_id`) REFERENCES `kamars` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pemesanans`
--

LOCK TABLES `pemesanans` WRITE;
/*!40000 ALTER TABLE `pemesanans` DISABLE KEYS */;
INSERT INTO `pemesanans` VALUES (1,2,'2022-06-04','2022-06-05',1,'Nisa','annisaputrinurhidayah@gmail.com','082371912810','Nisa','pesan','2022-06-02 20:17:50','2022-06-02 20:17:50'),(2,2,'2022-06-06','2022-06-07',2,'puput','annisaputrinurhidayah@gmail.com','082371912810','puput','pesan','2022-06-05 03:24:46','2022-06-05 03:24:46');
/*!40000 ALTER TABLE `pemesanans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-05 19:16:15
