-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: clarolineconnect_moocplm
-- ------------------------------------------------------
-- Server version	5.5.32-0ubuntu7

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
-- Table structure for table `acl_classes`
--

DROP TABLE IF EXISTS `acl_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_classes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_69DD750638A36066` (`class_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_classes`
--

LOCK TABLES `acl_classes` WRITE;
/*!40000 ALTER TABLE `acl_classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_entries`
--

DROP TABLE IF EXISTS `acl_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_id` int(10) unsigned NOT NULL,
  `object_identity_id` int(10) unsigned DEFAULT NULL,
  `security_identity_id` int(10) unsigned NOT NULL,
  `field_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ace_order` smallint(5) unsigned NOT NULL,
  `mask` int(11) NOT NULL,
  `granting` tinyint(1) NOT NULL,
  `granting_strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `audit_success` tinyint(1) NOT NULL,
  `audit_failure` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_46C8B806EA000B103D9AB4A64DEF17BCE4289BF4` (`class_id`,`object_identity_id`,`field_name`,`ace_order`),
  KEY `IDX_46C8B806EA000B103D9AB4A6DF9183C9` (`class_id`,`object_identity_id`,`security_identity_id`),
  KEY `IDX_46C8B806EA000B10` (`class_id`),
  KEY `IDX_46C8B8063D9AB4A6` (`object_identity_id`),
  KEY `IDX_46C8B806DF9183C9` (`security_identity_id`),
  CONSTRAINT `FK_46C8B8063D9AB4A6` FOREIGN KEY (`object_identity_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_46C8B806DF9183C9` FOREIGN KEY (`security_identity_id`) REFERENCES `acl_security_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_46C8B806EA000B10` FOREIGN KEY (`class_id`) REFERENCES `acl_classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_entries`
--

LOCK TABLES `acl_entries` WRITE;
/*!40000 ALTER TABLE `acl_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_object_identities`
--

DROP TABLE IF EXISTS `acl_object_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_object_identities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_object_identity_id` int(10) unsigned DEFAULT NULL,
  `class_id` int(10) unsigned NOT NULL,
  `object_identifier` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entries_inheriting` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9407E5494B12AD6EA000B10` (`object_identifier`,`class_id`),
  KEY `IDX_9407E54977FA751A` (`parent_object_identity_id`),
  CONSTRAINT `FK_9407E54977FA751A` FOREIGN KEY (`parent_object_identity_id`) REFERENCES `acl_object_identities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_object_identities`
--

LOCK TABLES `acl_object_identities` WRITE;
/*!40000 ALTER TABLE `acl_object_identities` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_object_identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_object_identity_ancestors`
--

DROP TABLE IF EXISTS `acl_object_identity_ancestors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_object_identity_ancestors` (
  `object_identity_id` int(10) unsigned NOT NULL,
  `ancestor_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`object_identity_id`,`ancestor_id`),
  KEY `IDX_825DE2993D9AB4A6` (`object_identity_id`),
  KEY `IDX_825DE299C671CEA1` (`ancestor_id`),
  CONSTRAINT `FK_825DE2993D9AB4A6` FOREIGN KEY (`object_identity_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_825DE299C671CEA1` FOREIGN KEY (`ancestor_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_object_identity_ancestors`
--

LOCK TABLES `acl_object_identity_ancestors` WRITE;
/*!40000 ALTER TABLE `acl_object_identity_ancestors` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_object_identity_ancestors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_security_identities`
--

DROP TABLE IF EXISTS `acl_security_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_security_identities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `username` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8835EE78772E836AF85E0677` (`identifier`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_security_identities`
--

LOCK TABLES `acl_security_identities` WRITE;
/*!40000 ALTER TABLE `acl_security_identities` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_security_identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_activity`
--

DROP TABLE IF EXISTS `claro_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instruction` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `resourceNode_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E4A67CACB87FAB32` (`resourceNode_id`),
  CONSTRAINT `FK_E4A67CACB87FAB32` FOREIGN KEY (`resourceNode_id`) REFERENCES `claro_resource_node` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_activity`
--

LOCK TABLES `claro_activity` WRITE;
/*!40000 ALTER TABLE `claro_activity` DISABLE KEYS */;
INSERT INTO `claro_activity` VALUES (1,'ok',NULL,NULL,4);
/*!40000 ALTER TABLE `claro_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_announcement`
--

DROP TABLE IF EXISTS `claro_announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator_id` int(11) NOT NULL,
  `aggregate_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(1023) COLLATE utf8_unicode_ci NOT NULL,
  `announcer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `publication_date` datetime DEFAULT NULL,
  `visible` tinyint(1) NOT NULL,
  `visible_from` datetime DEFAULT NULL,
  `visible_until` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_778754E361220EA6` (`creator_id`),
  KEY `IDX_778754E3D0BBCCBE` (`aggregate_id`),
  CONSTRAINT `FK_778754E361220EA6` FOREIGN KEY (`creator_id`) REFERENCES `claro_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_778754E3D0BBCCBE` FOREIGN KEY (`aggregate_id`) REFERENCES `claro_announcement_aggregate` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_announcement`
--

LOCK TABLES `claro_announcement` WRITE;
/*!40000 ALTER TABLE `claro_announcement` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_announcement_aggregate`
--

DROP TABLE IF EXISTS `claro_announcement_aggregate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_announcement_aggregate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resourceNode_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_79BF2C8CB87FAB32` (`resourceNode_id`),
  CONSTRAINT `FK_79BF2C8CB87FAB32` FOREIGN KEY (`resourceNode_id`) REFERENCES `claro_resource_node` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_announcement_aggregate`
--

LOCK TABLES `claro_announcement_aggregate` WRITE;
/*!40000 ALTER TABLE `claro_announcement_aggregate` DISABLE KEYS */;
INSERT INTO `claro_announcement_aggregate` VALUES (1,5);
/*!40000 ALTER TABLE `claro_announcement_aggregate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_badge`
--

DROP TABLE IF EXISTS `claro_badge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_badge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` smallint(6) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expired_at` datetime DEFAULT NULL,
  `workspace_id` int(11) DEFAULT NULL,
  `automatic_award` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_74F39F0F82D40A1F` (`workspace_id`),
  CONSTRAINT `FK_74F39F0F82D40A1F` FOREIGN KEY (`workspace_id`) REFERENCES `claro_workspace` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_badge`
--

LOCK TABLES `claro_badge` WRITE;
/*!40000 ALTER TABLE `claro_badge` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_badge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_badge_claim`
--

DROP TABLE IF EXISTS `claro_badge_claim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_badge_claim` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `badge_id` int(11) NOT NULL,
  `claimed_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `badge_claim_unique` (`user_id`,`badge_id`),
  KEY `IDX_487A496AA76ED395` (`user_id`),
  KEY `IDX_487A496AF7A2C2FC` (`badge_id`),
  CONSTRAINT `FK_487A496AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_487A496AF7A2C2FC` FOREIGN KEY (`badge_id`) REFERENCES `claro_badge` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_badge_claim`
--

LOCK TABLES `claro_badge_claim` WRITE;
/*!40000 ALTER TABLE `claro_badge_claim` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_badge_claim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_badge_rule`
--

DROP TABLE IF EXISTS `claro_badge_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_badge_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `badge_id` int(11) NOT NULL,
  `occurrence` smallint(6) NOT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `result` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resultComparison` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_805FCB8FF7A2C2FC` (`badge_id`),
  CONSTRAINT `FK_805FCB8FF7A2C2FC` FOREIGN KEY (`badge_id`) REFERENCES `claro_badge` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_badge_rule`
--

LOCK TABLES `claro_badge_rule` WRITE;
/*!40000 ALTER TABLE `claro_badge_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_badge_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_badge_translation`
--

DROP TABLE IF EXISTS `claro_badge_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_badge_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `badge_id` int(11) DEFAULT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `criteria` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `badge_translation_unique_idx` (`locale`,`badge_id`),
  UNIQUE KEY `badge_name_translation_unique_idx` (`name`,`locale`,`badge_id`),
  UNIQUE KEY `badge_slug_translation_unique_idx` (`slug`,`locale`,`badge_id`),
  KEY `IDX_849BC831F7A2C2FC` (`badge_id`),
  CONSTRAINT `FK_849BC831F7A2C2FC` FOREIGN KEY (`badge_id`) REFERENCES `claro_badge` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_badge_translation`
--

LOCK TABLES `claro_badge_translation` WRITE;
/*!40000 ALTER TABLE `claro_badge_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_badge_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_content`
--

DROP TABLE IF EXISTS `claro_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `generated_content` longtext COLLATE utf8_unicode_ci,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_content`
--

LOCK TABLES `claro_content` WRITE;
/*!40000 ALTER TABLE `claro_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_content2region`
--

DROP TABLE IF EXISTS `claro_content2region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_content2region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  `next_id` int(11) DEFAULT NULL,
  `back_id` int(11) DEFAULT NULL,
  `size` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8D18942E84A0A3ED` (`content_id`),
  KEY `IDX_8D18942E98260155` (`region_id`),
  KEY `IDX_8D18942EAA23F6C8` (`next_id`),
  KEY `IDX_8D18942EE9583FF0` (`back_id`),
  CONSTRAINT `FK_8D18942E84A0A3ED` FOREIGN KEY (`content_id`) REFERENCES `claro_content` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_8D18942E98260155` FOREIGN KEY (`region_id`) REFERENCES `claro_region` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_8D18942EAA23F6C8` FOREIGN KEY (`next_id`) REFERENCES `claro_content2region` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_8D18942EE9583FF0` FOREIGN KEY (`back_id`) REFERENCES `claro_content2region` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_content2region`
--

LOCK TABLES `claro_content2region` WRITE;
/*!40000 ALTER TABLE `claro_content2region` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_content2region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_content2type`
--

DROP TABLE IF EXISTS `claro_content2type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_content2type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `next_id` int(11) DEFAULT NULL,
  `back_id` int(11) DEFAULT NULL,
  `size` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1A2084EF84A0A3ED` (`content_id`),
  KEY `IDX_1A2084EFC54C8C93` (`type_id`),
  KEY `IDX_1A2084EFAA23F6C8` (`next_id`),
  KEY `IDX_1A2084EFE9583FF0` (`back_id`),
  CONSTRAINT `FK_1A2084EF84A0A3ED` FOREIGN KEY (`content_id`) REFERENCES `claro_content` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_1A2084EFAA23F6C8` FOREIGN KEY (`next_id`) REFERENCES `claro_content2type` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_1A2084EFC54C8C93` FOREIGN KEY (`type_id`) REFERENCES `claro_type` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_1A2084EFE9583FF0` FOREIGN KEY (`back_id`) REFERENCES `claro_content2type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_content2type`
--

LOCK TABLES `claro_content2type` WRITE;
/*!40000 ALTER TABLE `claro_content2type` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_content2type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_directory`
--

DROP TABLE IF EXISTS `claro_directory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_directory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resourceNode_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_12EEC186B87FAB32` (`resourceNode_id`),
  CONSTRAINT `FK_12EEC186B87FAB32` FOREIGN KEY (`resourceNode_id`) REFERENCES `claro_resource_node` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_directory`
--

LOCK TABLES `claro_directory` WRITE;
/*!40000 ALTER TABLE `claro_directory` DISABLE KEYS */;
INSERT INTO `claro_directory` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `claro_directory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_event`
--

DROP TABLE IF EXISTS `claro_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workspace_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` int(11) DEFAULT NULL,
  `end_date` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `allday` tinyint(1) DEFAULT NULL,
  `priority` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B1ADDDB582D40A1F` (`workspace_id`),
  KEY `IDX_B1ADDDB5A76ED395` (`user_id`),
  CONSTRAINT `FK_B1ADDDB582D40A1F` FOREIGN KEY (`workspace_id`) REFERENCES `claro_workspace` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B1ADDDB5A76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_event`
--

LOCK TABLES `claro_event` WRITE;
/*!40000 ALTER TABLE `claro_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_file`
--

DROP TABLE IF EXISTS `claro_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `size` int(11) NOT NULL,
  `hash_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `resourceNode_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_EA81C80BE1F029B6` (`hash_name`),
  UNIQUE KEY `UNIQ_EA81C80BB87FAB32` (`resourceNode_id`),
  CONSTRAINT `FK_EA81C80BB87FAB32` FOREIGN KEY (`resourceNode_id`) REFERENCES `claro_resource_node` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_file`
--

LOCK TABLES `claro_file` WRITE;
/*!40000 ALTER TABLE `claro_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_forum`
--

DROP TABLE IF EXISTS `claro_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resourceNode_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F2869DFB87FAB32` (`resourceNode_id`),
  CONSTRAINT `FK_F2869DFB87FAB32` FOREIGN KEY (`resourceNode_id`) REFERENCES `claro_resource_node` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_forum`
--

LOCK TABLES `claro_forum` WRITE;
/*!40000 ALTER TABLE `claro_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_forum_message`
--

DROP TABLE IF EXISTS `claro_forum_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_forum_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6A49AC0E23EDC87` (`subject_id`),
  KEY `IDX_6A49AC0EA76ED395` (`user_id`),
  CONSTRAINT `FK_6A49AC0E23EDC87` FOREIGN KEY (`subject_id`) REFERENCES `claro_forum_subject` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_6A49AC0EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_forum_message`
--

LOCK TABLES `claro_forum_message` WRITE;
/*!40000 ALTER TABLE `claro_forum_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_forum_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_forum_notification`
--

DROP TABLE IF EXISTS `claro_forum_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_forum_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forum_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1330B0B629CCBAD0` (`forum_id`),
  KEY `IDX_1330B0B6A76ED395` (`user_id`),
  CONSTRAINT `FK_1330B0B629CCBAD0` FOREIGN KEY (`forum_id`) REFERENCES `claro_forum` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_1330B0B6A76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_forum_notification`
--

LOCK TABLES `claro_forum_notification` WRITE;
/*!40000 ALTER TABLE `claro_forum_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_forum_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_forum_options`
--

DROP TABLE IF EXISTS `claro_forum_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_forum_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjects` int(11) NOT NULL,
  `messages` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_forum_options`
--

LOCK TABLES `claro_forum_options` WRITE;
/*!40000 ALTER TABLE `claro_forum_options` DISABLE KEYS */;
INSERT INTO `claro_forum_options` VALUES (1,30,30);
/*!40000 ALTER TABLE `claro_forum_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_forum_subject`
--

DROP TABLE IF EXISTS `claro_forum_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_forum_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forum_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_273AA20B29CCBAD0` (`forum_id`),
  KEY `IDX_273AA20BA76ED395` (`user_id`),
  CONSTRAINT `FK_273AA20B29CCBAD0` FOREIGN KEY (`forum_id`) REFERENCES `claro_forum` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_273AA20BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_forum_subject`
--

LOCK TABLES `claro_forum_subject` WRITE;
/*!40000 ALTER TABLE `claro_forum_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_forum_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_group`
--

DROP TABLE IF EXISTS `claro_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_unique_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_group`
--

LOCK TABLES `claro_group` WRITE;
/*!40000 ALTER TABLE `claro_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_group_role`
--

DROP TABLE IF EXISTS `claro_group_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_group_role` (
  `group_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`group_id`,`role_id`),
  KEY `IDX_1CBA5A40FE54D947` (`group_id`),
  KEY `IDX_1CBA5A40D60322AC` (`role_id`),
  CONSTRAINT `FK_1CBA5A40D60322AC` FOREIGN KEY (`role_id`) REFERENCES `claro_role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_1CBA5A40FE54D947` FOREIGN KEY (`group_id`) REFERENCES `claro_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_group_role`
--

LOCK TABLES `claro_group_role` WRITE;
/*!40000 ALTER TABLE `claro_group_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_group_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_home_tab`
--

DROP TABLE IF EXISTS `claro_home_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_home_tab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `workspace_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A9744CCEA76ED395` (`user_id`),
  KEY `IDX_A9744CCE82D40A1F` (`workspace_id`),
  CONSTRAINT `FK_A9744CCE82D40A1F` FOREIGN KEY (`workspace_id`) REFERENCES `claro_workspace` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A9744CCEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_home_tab`
--

LOCK TABLES `claro_home_tab` WRITE;
/*!40000 ALTER TABLE `claro_home_tab` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_home_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_home_tab_config`
--

DROP TABLE IF EXISTS `claro_home_tab_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_home_tab_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `home_tab_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `workspace_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_visible` tinyint(1) NOT NULL,
  `is_locked` tinyint(1) NOT NULL,
  `tab_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `home_tab_config_unique_home_tab_user` (`home_tab_id`,`user_id`),
  UNIQUE KEY `home_tab_config_unique_home_tab_workspace` (`home_tab_id`,`workspace_id`),
  KEY `IDX_F530F6BE7D08FA9E` (`home_tab_id`),
  KEY `IDX_F530F6BEA76ED395` (`user_id`),
  KEY `IDX_F530F6BE82D40A1F` (`workspace_id`),
  CONSTRAINT `FK_F530F6BE7D08FA9E` FOREIGN KEY (`home_tab_id`) REFERENCES `claro_home_tab` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_F530F6BE82D40A1F` FOREIGN KEY (`workspace_id`) REFERENCES `claro_workspace` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_F530F6BEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_home_tab_config`
--

LOCK TABLES `claro_home_tab_config` WRITE;
/*!40000 ALTER TABLE `claro_home_tab_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_home_tab_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_license`
--

DROP TABLE IF EXISTS `claro_license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_license` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `acronym` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_license`
--

LOCK TABLES `claro_license` WRITE;
/*!40000 ALTER TABLE `claro_license` DISABLE KEYS */;
INSERT INTO `claro_license` VALUES (1,'public domain',NULL),(2,'all rights reserved',NULL),(3,'other',NULL);
/*!40000 ALTER TABLE `claro_license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_link`
--

DROP TABLE IF EXISTS `claro_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `resourceNode_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_50B267EAB87FAB32` (`resourceNode_id`),
  CONSTRAINT `FK_50B267EAB87FAB32` FOREIGN KEY (`resourceNode_id`) REFERENCES `claro_resource_node` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_link`
--

LOCK TABLES `claro_link` WRITE;
/*!40000 ALTER TABLE `claro_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_list_type_creation`
--

DROP TABLE IF EXISTS `claro_list_type_creation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_list_type_creation` (
  `resource_rights_id` int(11) NOT NULL,
  `resource_type_id` int(11) NOT NULL,
  PRIMARY KEY (`resource_rights_id`,`resource_type_id`),
  KEY `IDX_84B4BEBA195FBDF1` (`resource_rights_id`),
  KEY `IDX_84B4BEBA98EC6B7B` (`resource_type_id`),
  CONSTRAINT `FK_84B4BEBA195FBDF1` FOREIGN KEY (`resource_rights_id`) REFERENCES `claro_resource_rights` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_84B4BEBA98EC6B7B` FOREIGN KEY (`resource_type_id`) REFERENCES `claro_resource_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_list_type_creation`
--

LOCK TABLES `claro_list_type_creation` WRITE;
/*!40000 ALTER TABLE `claro_list_type_creation` DISABLE KEYS */;
INSERT INTO `claro_list_type_creation` VALUES (3,1),(3,2),(3,3),(3,4),(3,5),(3,6),(3,7),(3,8),(3,9),(3,10),(3,11),(3,12),(4,1),(4,2),(4,3),(4,4),(4,5),(4,6),(4,7),(4,8),(4,9),(4,10),(4,11),(4,12),(8,1),(8,2),(8,3),(8,4),(8,5),(8,6),(8,7),(8,8),(8,9),(8,10),(8,11),(8,12),(9,1),(9,2),(9,3),(9,4),(9,5),(9,6),(9,7),(9,8),(9,9),(9,10),(9,11),(9,12),(11,1),(11,2),(11,3),(11,4),(11,5),(11,6),(11,7),(11,8),(11,9),(11,10),(11,11),(11,12),(15,1),(15,2),(15,3),(15,4),(15,5),(15,6),(15,7),(15,8),(15,9),(15,10),(15,11),(15,12),(16,1),(16,2),(16,3),(16,4),(16,5),(16,6),(16,7),(16,8),(16,9),(16,10),(16,11),(16,12),(20,1),(20,2),(20,3),(20,4),(20,5),(20,6),(20,7),(20,8),(20,9),(20,10),(20,11),(20,12),(21,1),(21,2),(21,3),(21,4),(21,5),(21,6),(21,7),(21,8),(21,9),(21,10),(21,11),(21,12),(25,1),(25,2),(25,3),(25,4),(25,5),(25,6),(25,7),(25,8),(25,9),(25,10),(25,11),(25,12),(26,1),(26,2),(26,3),(26,4),(26,5),(26,6),(26,7),(26,8),(26,9),(26,10),(26,11),(26,12),(30,1),(30,2),(30,3),(30,4),(30,5),(30,6),(30,7),(30,8),(30,9),(30,10),(30,11),(30,12),(31,1),(31,2),(31,3),(31,4),(31,5),(31,6),(31,7),(31,8),(31,9),(31,10),(31,11),(31,12),(35,1),(35,2),(35,3),(35,4),(35,5),(35,6),(35,7),(35,8),(35,9),(35,10),(35,11),(35,12),(36,1),(36,2),(36,3),(36,4),(36,5),(36,6),(36,7),(36,8),(36,9),(36,10),(36,11),(36,12),(40,1),(40,2),(40,3),(40,4),(40,5),(40,6),(40,7),(40,8),(40,9),(40,10),(40,11),(40,12),(41,1),(41,2),(41,3),(41,4),(41,5),(41,6),(41,7),(41,8),(41,9),(41,10),(41,11),(41,12),(45,1),(45,2),(45,3),(45,4),(45,5),(45,6),(45,7),(45,8),(45,9),(45,10),(45,11),(45,12);
/*!40000 ALTER TABLE `claro_list_type_creation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_log`
--

DROP TABLE IF EXISTS `claro_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doer_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `receiver_group_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `workspace_id` int(11) DEFAULT NULL,
  `resource_type_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_log` datetime NOT NULL,
  `short_date_log` date NOT NULL,
  `details` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)',
  `doer_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `doer_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tool_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_displayed_in_admin` tinyint(1) NOT NULL,
  `is_displayed_in_workspace` tinyint(1) NOT NULL,
  `resourceNode_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_97FAB91F12D3860F` (`doer_id`),
  KEY `IDX_97FAB91FCD53EDB6` (`receiver_id`),
  KEY `IDX_97FAB91FC6F122B2` (`receiver_group_id`),
  KEY `IDX_97FAB91F7E3C61F9` (`owner_id`),
  KEY `IDX_97FAB91F82D40A1F` (`workspace_id`),
  KEY `IDX_97FAB91FB87FAB32` (`resourceNode_id`),
  KEY `IDX_97FAB91F98EC6B7B` (`resource_type_id`),
  KEY `IDX_97FAB91FD60322AC` (`role_id`),
  CONSTRAINT `FK_97FAB91F12D3860F` FOREIGN KEY (`doer_id`) REFERENCES `claro_user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_97FAB91F7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `claro_user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_97FAB91F82D40A1F` FOREIGN KEY (`workspace_id`) REFERENCES `claro_workspace` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_97FAB91F98EC6B7B` FOREIGN KEY (`resource_type_id`) REFERENCES `claro_resource_type` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_97FAB91FB87FAB32` FOREIGN KEY (`resourceNode_id`) REFERENCES `claro_resource_node` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_97FAB91FC6F122B2` FOREIGN KEY (`receiver_group_id`) REFERENCES `claro_group` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_97FAB91FCD53EDB6` FOREIGN KEY (`receiver_id`) REFERENCES `claro_user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_97FAB91FD60322AC` FOREIGN KEY (`role_id`) REFERENCES `claro_role` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_log`
--

LOCK TABLES `claro_log` WRITE;
/*!40000 ALTER TABLE `claro_log` DISABLE KEYS */;
INSERT INTO `claro_log` VALUES (1,NULL,1,NULL,NULL,1,NULL,7,'workspace-role-subscribe_user','2013-11-24 20:46:22','2013-11-24','{\"role\":{\"name\":\"manager\"},\"workspace\":{\"name\":\"Espace personnel\"},\"receiverUser\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\"}}','platform',NULL,NULL,0,1,NULL),(2,NULL,NULL,NULL,1,1,2,NULL,'resource-create','2013-11-24 20:46:22','2013-11-24','{\"resource\":{\"name\":\"Espace personnel - pernelle\",\"path\":\"Espace personnel - pernelle\"},\"workspace\":{\"name\":\"Espace personnel\"},\"owner\":{\"lastName\":\"pernelle\",\"firstName\":\"philippe\"}}','platform',NULL,NULL,0,1,1),(3,NULL,NULL,NULL,NULL,1,NULL,NULL,'workspace-create','2013-11-24 20:46:22','2013-11-24','{\"workspace\":{\"name\":\"Espace personnel\"}}','platform',NULL,NULL,1,0,NULL),(4,NULL,1,NULL,NULL,NULL,NULL,NULL,'user-create','2013-11-24 20:46:22','2013-11-24','{\"receiverUser\":{\"lastName\":\"pernelle\",\"firstName\":\"philippe\"}}','platform',NULL,NULL,1,0,NULL),(5,1,NULL,NULL,NULL,NULL,NULL,NULL,'user-login','2013-11-24 21:05:27','2013-11-24','{\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"31bk17scj6uooevcnntggk17m3\",\"platformRoles\":[\"user\",\"admin\"]}}','user','78.243.118.7',NULL,1,0,NULL),(6,1,NULL,NULL,NULL,NULL,NULL,NULL,'user-login','2013-11-25 09:27:22','2013-11-25','{\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"lsco749ob2a8jll1mqcs8ll4k3\",\"platformRoles\":[\"user\",\"admin\"]}}','user','78.243.118.7',NULL,1,0,NULL),(7,1,NULL,NULL,NULL,NULL,NULL,NULL,'user-login','2013-11-25 11:02:14','2013-11-25','{\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"khq4bod4lh523kfl5ekgdppi65\",\"platformRoles\":[\"user\",\"admin\"]}}','user','78.243.118.7',NULL,1,0,NULL),(8,1,1,NULL,NULL,2,NULL,10,'workspace-role-subscribe_user','2013-11-25 11:03:05','2013-11-25','{\"role\":{\"name\":\"manager\"},\"workspace\":{\"name\":\"test\"},\"receiverUser\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"khq4bod4lh523kfl5ekgdppi65\",\"platformRoles\":[\"user\",\"admin\"]}}','user','78.243.118.7',NULL,0,1,NULL),(9,1,NULL,NULL,1,2,2,NULL,'resource-create','2013-11-25 11:03:05','2013-11-25','{\"resource\":{\"name\":\"test - test\",\"path\":\"test - test\"},\"workspace\":{\"name\":\"test\"},\"owner\":{\"lastName\":\"pernelle\",\"firstName\":\"philippe\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"khq4bod4lh523kfl5ekgdppi65\",\"platformRoles\":[\"user\",\"admin\"]}}','user','78.243.118.7',NULL,0,1,2),(10,1,NULL,NULL,NULL,2,NULL,NULL,'workspace-create','2013-11-25 11:03:05','2013-11-25','{\"workspace\":{\"name\":\"test\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"khq4bod4lh523kfl5ekgdppi65\",\"platformRoles\":[\"user\",\"admin\"]}}','user','78.243.118.7',NULL,1,0,NULL),(11,1,NULL,NULL,NULL,2,NULL,NULL,'workspace-tool-read','2013-11-25 11:03:22','2013-11-25','{\"workspace\":{\"name\":\"test\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"khq4bod4lh523kfl5ekgdppi65\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','78.243.118.7','home',0,1,NULL),(12,1,NULL,NULL,NULL,2,NULL,NULL,'workspace-tool-read','2013-11-25 11:03:30','2013-11-25','{\"workspace\":{\"name\":\"test\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"khq4bod4lh523kfl5ekgdppi65\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','78.243.118.7','resource_manager',0,1,NULL),(13,1,NULL,NULL,1,2,2,NULL,'resource-read','2013-11-25 11:03:33','2013-11-25','{\"resource\":{\"name\":\"test - test\",\"path\":\"test - test\"},\"workspace\":{\"name\":\"test\"},\"owner\":{\"lastName\":\"pernelle\",\"firstName\":\"philippe\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"khq4bod4lh523kfl5ekgdppi65\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','78.243.118.7',NULL,0,1,2),(14,1,NULL,NULL,1,2,10,NULL,'resource-create','2013-11-25 11:03:53','2013-11-25','{\"resource\":{\"name\":\"test wiki\",\"path\":\"test - test \\/ test wiki\"},\"workspace\":{\"name\":\"test\"},\"owner\":{\"lastName\":\"pernelle\",\"firstName\":\"philippe\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"khq4bod4lh523kfl5ekgdppi65\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','78.243.118.7',NULL,0,1,3),(15,1,NULL,NULL,NULL,2,NULL,NULL,'workspace-tool-read','2013-11-25 11:04:02','2013-11-25','{\"workspace\":{\"name\":\"test\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"khq4bod4lh523kfl5ekgdppi65\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','78.243.118.7','claroline_activity_tool',0,1,NULL),(16,1,NULL,NULL,1,2,5,NULL,'resource-create','2013-11-25 11:04:48','2013-11-25','{\"resource\":{\"name\":\"test2\",\"path\":\"test - test \\/ test2\"},\"workspace\":{\"name\":\"test\"},\"owner\":{\"lastName\":\"pernelle\",\"firstName\":\"philippe\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"khq4bod4lh523kfl5ekgdppi65\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','78.243.118.7',NULL,0,1,4),(17,1,NULL,NULL,1,2,5,NULL,'resource-read','2013-11-25 11:04:51','2013-11-25','{\"resource\":{\"name\":\"test2\",\"path\":\"test - test \\/ test2\"},\"workspace\":{\"name\":\"test\"},\"owner\":{\"lastName\":\"pernelle\",\"firstName\":\"philippe\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"khq4bod4lh523kfl5ekgdppi65\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','78.243.118.7',NULL,0,1,4),(18,1,NULL,NULL,1,2,6,NULL,'resource-create','2013-11-25 11:06:05','2013-11-25','{\"resource\":{\"name\":\"essai\",\"path\":\"test - test \\/ essai\"},\"workspace\":{\"name\":\"test\"},\"owner\":{\"lastName\":\"pernelle\",\"firstName\":\"philippe\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"khq4bod4lh523kfl5ekgdppi65\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','78.243.118.7',NULL,0,1,5),(19,1,NULL,NULL,1,2,6,NULL,'resource-read','2013-11-25 11:06:07','2013-11-25','{\"resource\":{\"name\":\"essai\",\"path\":\"test - test \\/ essai\"},\"workspace\":{\"name\":\"test\"},\"owner\":{\"lastName\":\"pernelle\",\"firstName\":\"philippe\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"khq4bod4lh523kfl5ekgdppi65\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','78.243.118.7',NULL,0,1,5),(20,1,NULL,NULL,NULL,2,NULL,NULL,'workspace-tool-read','2013-11-25 11:06:56','2013-11-25','{\"workspace\":{\"name\":\"test\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"khq4bod4lh523kfl5ekgdppi65\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','78.243.118.7','agenda',0,1,NULL),(21,1,NULL,NULL,NULL,2,NULL,NULL,'workspace-tool-read','2013-11-25 11:07:14','2013-11-25','{\"workspace\":{\"name\":\"test\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"khq4bod4lh523kfl5ekgdppi65\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','78.243.118.7','logs',0,1,NULL),(22,1,NULL,NULL,NULL,2,NULL,NULL,'workspace-tool-read','2013-11-25 11:57:56','2013-11-25','{\"workspace\":{\"name\":\"test\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"khq4bod4lh523kfl5ekgdppi65\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','78.243.118.7','home',0,1,NULL),(23,1,NULL,NULL,NULL,2,NULL,NULL,'workspace-tool-read','2013-11-25 14:07:16','2013-11-25','{\"workspace\":{\"name\":\"test\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"khq4bod4lh523kfl5ekgdppi65\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','78.243.118.7','home',0,1,NULL),(24,1,NULL,NULL,NULL,2,NULL,NULL,'workspace-tool-read','2013-11-25 14:08:26','2013-11-25','{\"workspace\":{\"name\":\"test\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"khq4bod4lh523kfl5ekgdppi65\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','78.243.118.7','resource_manager',0,1,NULL),(25,1,NULL,NULL,1,2,2,NULL,'resource-read','2013-11-25 14:08:27','2013-11-25','{\"resource\":{\"name\":\"test - test\",\"path\":\"test - test\"},\"workspace\":{\"name\":\"test\"},\"owner\":{\"lastName\":\"pernelle\",\"firstName\":\"philippe\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"khq4bod4lh523kfl5ekgdppi65\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','78.243.118.7',NULL,0,1,2),(26,1,NULL,NULL,1,2,11,NULL,'resource-create','2013-11-25 14:08:45','2013-11-25','{\"resource\":{\"name\":\"essai3\",\"path\":\"test - test \\/ essai3\"},\"workspace\":{\"name\":\"test\"},\"owner\":{\"lastName\":\"pernelle\",\"firstName\":\"philippe\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"khq4bod4lh523kfl5ekgdppi65\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','78.243.118.7',NULL,0,1,6),(27,1,NULL,NULL,1,2,11,NULL,'resource-read','2013-11-25 14:08:48','2013-11-25','{\"resource\":{\"name\":\"essai3\",\"path\":\"test - test \\/ essai3\"},\"workspace\":{\"name\":\"test\"},\"owner\":{\"lastName\":\"pernelle\",\"firstName\":\"philippe\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"khq4bod4lh523kfl5ekgdppi65\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','78.243.118.7',NULL,0,1,6),(28,1,NULL,NULL,1,2,2,NULL,'resource-read','2013-11-25 14:24:45','2013-11-25','{\"resource\":{\"name\":\"test - test\",\"path\":\"test - test\"},\"workspace\":{\"name\":\"test\"},\"owner\":{\"lastName\":\"pernelle\",\"firstName\":\"philippe\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"khq4bod4lh523kfl5ekgdppi65\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','78.243.118.7',NULL,0,1,2),(29,1,NULL,NULL,1,2,12,NULL,'resource-create','2013-11-25 14:25:25','2013-11-25','{\"resource\":{\"name\":\"tt\",\"path\":\"test - test \\/ tt\"},\"workspace\":{\"name\":\"test\"},\"owner\":{\"lastName\":\"pernelle\",\"firstName\":\"philippe\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"khq4bod4lh523kfl5ekgdppi65\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','78.243.118.7',NULL,0,1,7),(30,1,NULL,NULL,1,2,12,NULL,'resource-read','2013-11-25 14:25:27','2013-11-25','{\"resource\":{\"name\":\"tt\",\"path\":\"test - test \\/ tt\"},\"workspace\":{\"name\":\"test\"},\"owner\":{\"lastName\":\"pernelle\",\"firstName\":\"philippe\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"khq4bod4lh523kfl5ekgdppi65\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','78.243.118.7',NULL,0,1,7),(31,1,NULL,NULL,1,2,2,NULL,'resource-read','2013-11-25 15:06:07','2013-11-25','{\"resource\":{\"name\":\"test - test\",\"path\":\"test - test\"},\"workspace\":{\"name\":\"test\"},\"owner\":{\"lastName\":\"pernelle\",\"firstName\":\"philippe\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"khq4bod4lh523kfl5ekgdppi65\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','78.243.118.7',NULL,0,1,2),(32,1,NULL,NULL,NULL,NULL,NULL,NULL,'user-login','2013-11-28 21:11:30','2013-11-28','{\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"mar7rai3imvu23fvhpdjdosap0\",\"platformRoles\":[\"user\",\"admin\"]}}','user','134.214.147.89',NULL,1,0,NULL),(33,1,NULL,NULL,1,2,2,NULL,'resource-read','2013-11-28 21:12:04','2013-11-28','{\"resource\":{\"name\":\"test - test\",\"path\":\"test - test\"},\"workspace\":{\"name\":\"test\"},\"owner\":{\"lastName\":\"pernelle\",\"firstName\":\"philippe\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"mar7rai3imvu23fvhpdjdosap0\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','134.214.147.89',NULL,0,1,2),(34,1,NULL,NULL,1,2,9,NULL,'resource-create','2013-11-28 21:12:28','2013-11-28','{\"resource\":{\"name\":\"eval\",\"path\":\"test - test \\/ eval\"},\"workspace\":{\"name\":\"test\"},\"owner\":{\"lastName\":\"pernelle\",\"firstName\":\"philippe\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"mar7rai3imvu23fvhpdjdosap0\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','134.214.147.89',NULL,0,1,8),(35,1,NULL,NULL,1,2,9,NULL,'resource-read','2013-11-28 21:12:30','2013-11-28','{\"resource\":{\"name\":\"eval\",\"path\":\"test - test \\/ eval\"},\"workspace\":{\"name\":\"test\"},\"owner\":{\"lastName\":\"pernelle\",\"firstName\":\"philippe\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"mar7rai3imvu23fvhpdjdosap0\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','134.214.147.89',NULL,0,1,8),(36,1,NULL,NULL,1,2,9,NULL,'resource-icap_dropzone-dropzone_configure','2013-11-28 21:12:59','2013-11-28','{\"resource\":{\"name\":\"eval\",\"path\":\"test - test \\/ eval\"},\"workspace\":{\"name\":\"test\"},\"owner\":{\"lastName\":\"pernelle\",\"firstName\":\"philippe\"},\"dropzone\":{\"id\":1,\"changeSet\":{\"editionState\":[1,2],\"instruction\":[null,\"\"],\"peerReview\":[false,0],\"expectedTotalCorrection\":[3,1],\"minimumScoreToPass\":[10,10],\"manualPlanning\":[true,1]}},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"mar7rai3imvu23fvhpdjdosap0\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','134.214.147.89',NULL,0,1,8),(37,1,NULL,NULL,NULL,2,NULL,NULL,'workspace-tool-read','2013-11-28 21:13:17','2013-11-28','{\"workspace\":{\"name\":\"test\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"mar7rai3imvu23fvhpdjdosap0\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','134.214.147.89','parameters',0,1,NULL),(38,1,NULL,NULL,NULL,2,NULL,NULL,'workspace-tool-read','2013-11-28 21:13:37','2013-11-28','{\"workspace\":{\"name\":\"test\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"mar7rai3imvu23fvhpdjdosap0\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','134.214.147.89','home',0,1,NULL),(39,1,NULL,NULL,NULL,2,NULL,NULL,'workspace-tool-read','2013-11-28 21:14:10','2013-11-28','{\"workspace\":{\"name\":\"test\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"mar7rai3imvu23fvhpdjdosap0\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','134.214.147.89','logs',0,1,NULL),(40,1,NULL,NULL,NULL,2,NULL,NULL,'workspace-tool-read','2013-11-28 21:14:13','2013-11-28','{\"workspace\":{\"name\":\"test\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"mar7rai3imvu23fvhpdjdosap0\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','134.214.147.89','claroline_activity_tool',0,1,NULL),(41,1,NULL,NULL,1,2,5,NULL,'resource-read','2013-11-28 21:14:18','2013-11-28','{\"resource\":{\"name\":\"test2\",\"path\":\"test - test \\/ test2\"},\"workspace\":{\"name\":\"test\"},\"owner\":{\"lastName\":\"pernelle\",\"firstName\":\"philippe\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"mar7rai3imvu23fvhpdjdosap0\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','134.214.147.89',NULL,0,1,4),(42,1,NULL,NULL,NULL,2,NULL,NULL,'workspace-tool-read','2013-11-28 21:14:44','2013-11-28','{\"workspace\":{\"name\":\"test\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"mar7rai3imvu23fvhpdjdosap0\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','134.214.147.89','resource_manager',0,1,NULL),(43,1,NULL,NULL,1,2,12,NULL,'resource-read','2013-11-28 21:14:58','2013-11-28','{\"resource\":{\"name\":\"tt\",\"path\":\"test - test \\/ tt\"},\"workspace\":{\"name\":\"test\"},\"owner\":{\"lastName\":\"pernelle\",\"firstName\":\"philippe\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"mar7rai3imvu23fvhpdjdosap0\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','134.214.147.89',NULL,0,1,7),(44,1,NULL,NULL,NULL,2,NULL,NULL,'workspace-tool-read','2013-11-28 21:26:24','2013-11-28','{\"workspace\":{\"name\":\"test\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"mar7rai3imvu23fvhpdjdosap0\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','134.214.147.89','home',0,1,NULL),(45,1,NULL,NULL,NULL,2,NULL,NULL,'workspace-tool-read','2013-11-28 21:26:30','2013-11-28','{\"workspace\":{\"name\":\"test\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"mar7rai3imvu23fvhpdjdosap0\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','134.214.147.89','resource_manager',0,1,NULL),(46,1,NULL,NULL,1,2,2,NULL,'resource-read','2013-11-28 21:26:30','2013-11-28','{\"resource\":{\"name\":\"test - test\",\"path\":\"test - test\"},\"workspace\":{\"name\":\"test\"},\"owner\":{\"lastName\":\"pernelle\",\"firstName\":\"philippe\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"mar7rai3imvu23fvhpdjdosap0\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','134.214.147.89',NULL,0,1,2),(47,1,NULL,NULL,NULL,2,NULL,NULL,'workspace-tool-read','2013-11-28 21:26:36','2013-11-28','{\"workspace\":{\"name\":\"test\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"mar7rai3imvu23fvhpdjdosap0\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','134.214.147.89','parameters',0,1,NULL),(48,1,NULL,NULL,NULL,2,NULL,NULL,'workspace-tool-read','2013-11-28 21:26:45','2013-11-28','{\"workspace\":{\"name\":\"test\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"mar7rai3imvu23fvhpdjdosap0\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','134.214.147.89','agenda',0,1,NULL),(49,1,NULL,NULL,1,2,11,NULL,'resource-create','2013-11-28 21:27:07','2013-11-28','{\"resource\":{\"name\":\"exo\",\"path\":\"test - test \\/ exo\"},\"workspace\":{\"name\":\"test\"},\"owner\":{\"lastName\":\"pernelle\",\"firstName\":\"philippe\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"mar7rai3imvu23fvhpdjdosap0\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','134.214.147.89',NULL,0,1,9),(50,1,NULL,NULL,1,2,11,NULL,'resource-read','2013-11-28 21:27:09','2013-11-28','{\"resource\":{\"name\":\"exo\",\"path\":\"test - test \\/ exo\"},\"workspace\":{\"name\":\"test\"},\"owner\":{\"lastName\":\"pernelle\",\"firstName\":\"philippe\"},\"doer\":{\"firstName\":\"philippe\",\"lastName\":\"pernelle\",\"sessionId\":\"mar7rai3imvu23fvhpdjdosap0\",\"platformRoles\":[\"user\",\"admin\"],\"workspaceRoles\":[\"manager\"]}}','user','134.214.147.89',NULL,0,1,9);
/*!40000 ALTER TABLE `claro_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_log_desktop_widget_config`
--

DROP TABLE IF EXISTS `claro_log_desktop_widget_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_log_desktop_widget_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4AE48D62A76ED395` (`user_id`),
  CONSTRAINT `FK_4AE48D62A76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_log_desktop_widget_config`
--

LOCK TABLES `claro_log_desktop_widget_config` WRITE;
/*!40000 ALTER TABLE `claro_log_desktop_widget_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_log_desktop_widget_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_log_doer_platform_roles`
--

DROP TABLE IF EXISTS `claro_log_doer_platform_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_log_doer_platform_roles` (
  `log_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`log_id`,`role_id`),
  KEY `IDX_706568A5EA675D86` (`log_id`),
  KEY `IDX_706568A5D60322AC` (`role_id`),
  CONSTRAINT `FK_706568A5D60322AC` FOREIGN KEY (`role_id`) REFERENCES `claro_role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_706568A5EA675D86` FOREIGN KEY (`log_id`) REFERENCES `claro_log` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_log_doer_platform_roles`
--

LOCK TABLES `claro_log_doer_platform_roles` WRITE;
/*!40000 ALTER TABLE `claro_log_doer_platform_roles` DISABLE KEYS */;
INSERT INTO `claro_log_doer_platform_roles` VALUES (5,1),(5,3),(6,1),(6,3),(7,1),(7,3),(8,1),(8,3),(9,1),(9,3),(10,1),(10,3),(11,1),(11,3),(12,1),(12,3),(13,1),(13,3),(14,1),(14,3),(15,1),(15,3),(16,1),(16,3),(17,1),(17,3),(18,1),(18,3),(19,1),(19,3),(20,1),(20,3),(21,1),(21,3),(22,1),(22,3),(23,1),(23,3),(24,1),(24,3),(25,1),(25,3),(26,1),(26,3),(27,1),(27,3),(28,1),(28,3),(29,1),(29,3),(30,1),(30,3),(31,1),(31,3),(32,1),(32,3),(33,1),(33,3),(34,1),(34,3),(35,1),(35,3),(36,1),(36,3),(37,1),(37,3),(38,1),(38,3),(39,1),(39,3),(40,1),(40,3),(41,1),(41,3),(42,1),(42,3),(43,1),(43,3),(44,1),(44,3),(45,1),(45,3),(46,1),(46,3),(47,1),(47,3),(48,1),(48,3),(49,1),(49,3),(50,1),(50,3);
/*!40000 ALTER TABLE `claro_log_doer_platform_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_log_doer_workspace_roles`
--

DROP TABLE IF EXISTS `claro_log_doer_workspace_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_log_doer_workspace_roles` (
  `log_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`log_id`,`role_id`),
  KEY `IDX_8A8D2F47EA675D86` (`log_id`),
  KEY `IDX_8A8D2F47D60322AC` (`role_id`),
  CONSTRAINT `FK_8A8D2F47D60322AC` FOREIGN KEY (`role_id`) REFERENCES `claro_role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_8A8D2F47EA675D86` FOREIGN KEY (`log_id`) REFERENCES `claro_log` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_log_doer_workspace_roles`
--

LOCK TABLES `claro_log_doer_workspace_roles` WRITE;
/*!40000 ALTER TABLE `claro_log_doer_workspace_roles` DISABLE KEYS */;
INSERT INTO `claro_log_doer_workspace_roles` VALUES (11,10),(12,10),(13,10),(14,10),(15,10),(16,10),(17,10),(18,10),(19,10),(20,10),(21,10),(22,10),(23,10),(24,10),(25,10),(26,10),(27,10),(28,10),(29,10),(30,10),(31,10),(33,10),(34,10),(35,10),(36,10),(37,10),(38,10),(39,10),(40,10),(41,10),(42,10),(43,10),(44,10),(45,10),(46,10),(47,10),(48,10),(49,10),(50,10);
/*!40000 ALTER TABLE `claro_log_doer_workspace_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_log_hidden_workspace_widget_config`
--

DROP TABLE IF EXISTS `claro_log_hidden_workspace_widget_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_log_hidden_workspace_widget_config` (
  `workspace_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`workspace_id`,`user_id`),
  KEY `IDX_BC83196EA76ED395` (`user_id`),
  CONSTRAINT `FK_BC83196EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_log_hidden_workspace_widget_config`
--

LOCK TABLES `claro_log_hidden_workspace_widget_config` WRITE;
/*!40000 ALTER TABLE `claro_log_hidden_workspace_widget_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_log_hidden_workspace_widget_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_log_widget_config`
--

DROP TABLE IF EXISTS `claro_log_widget_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_log_widget_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) NOT NULL,
  `restrictions` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:simple_array)',
  `widgetInstance_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C16334B2AB7B5A55` (`widgetInstance_id`),
  CONSTRAINT `FK_C16334B2AB7B5A55` FOREIGN KEY (`widgetInstance_id`) REFERENCES `claro_widget_instance` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_log_widget_config`
--

LOCK TABLES `claro_log_widget_config` WRITE;
/*!40000 ALTER TABLE `claro_log_widget_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_log_widget_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_log_workspace_widget_config`
--

DROP TABLE IF EXISTS `claro_log_workspace_widget_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_log_workspace_widget_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workspace_id` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL,
  `amount` int(11) NOT NULL,
  `restrictions` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:simple_array)',
  PRIMARY KEY (`id`),
  KEY `IDX_D301C70782D40A1F` (`workspace_id`),
  CONSTRAINT `FK_D301C70782D40A1F` FOREIGN KEY (`workspace_id`) REFERENCES `claro_workspace` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_log_workspace_widget_config`
--

LOCK TABLES `claro_log_workspace_widget_config` WRITE;
/*!40000 ALTER TABLE `claro_log_workspace_widget_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_log_workspace_widget_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_menu_action`
--

DROP TABLE IF EXISTS `claro_menu_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_menu_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_type_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `async` tinyint(1) DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL,
  `is_form` tinyint(1) NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1F57E52B98EC6B7B` (`resource_type_id`),
  CONSTRAINT `FK_1F57E52B98EC6B7B` FOREIGN KEY (`resource_type_id`) REFERENCES `claro_resource_type` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_menu_action`
--

LOCK TABLES `claro_menu_action` WRITE;
/*!40000 ALTER TABLE `claro_menu_action` DISABLE KEYS */;
INSERT INTO `claro_menu_action` VALUES (1,1,'download',1,0,0,'4'),(2,1,'rename',1,0,1,'8'),(3,1,'edit-properties',1,0,1,'8'),(4,1,'edit-rights',1,0,1,'8'),(5,1,'delete',1,0,0,'16'),(6,2,'download',1,0,0,'4'),(7,2,'rename',1,0,1,'8'),(8,2,'edit-properties',1,0,1,'8'),(9,2,'edit-rights',1,0,1,'8'),(10,2,'delete',1,0,0,'16'),(11,3,'download',1,0,0,'4'),(12,3,'rename',1,0,1,'8'),(13,3,'edit-properties',1,0,1,'8'),(14,3,'edit-rights',1,0,1,'8'),(15,3,'delete',1,0,0,'16'),(16,4,'download',1,0,0,'4'),(17,4,'rename',1,0,1,'8'),(18,4,'edit-properties',1,0,1,'8'),(19,4,'edit-rights',1,0,1,'8'),(20,4,'delete',1,0,0,'16'),(21,5,'download',1,0,0,'4'),(22,5,'rename',1,0,1,'8'),(23,5,'edit-properties',1,0,1,'8'),(24,5,'edit-rights',1,0,1,'8'),(25,5,'delete',1,0,0,'16'),(26,5,'compose',0,1,0,'64'),(27,6,'download',1,0,0,'4'),(28,6,'rename',1,0,1,'8'),(29,6,'edit-properties',1,0,1,'8'),(30,6,'edit-rights',1,0,1,'8'),(31,6,'delete',1,0,0,'16'),(32,7,'download',1,0,0,'4'),(33,7,'rename',1,0,1,'8'),(34,7,'edit-properties',1,0,1,'8'),(35,7,'edit-rights',1,0,1,'8'),(36,7,'delete',1,0,0,'16'),(37,8,'download',1,0,0,'4'),(38,8,'rename',1,0,1,'8'),(39,8,'edit-properties',1,0,1,'8'),(40,8,'edit-rights',1,0,1,'8'),(41,8,'delete',1,0,0,'16'),(42,8,'configure_blog',NULL,1,0,'8'),(43,9,'download',1,0,0,'4'),(44,9,'rename',1,0,1,'8'),(45,9,'edit-properties',1,0,1,'8'),(46,9,'edit-rights',1,0,1,'8'),(47,9,'delete',1,0,0,'16'),(48,9,'open_dropzone',NULL,1,0,'1'),(49,9,'edit_dropzone',NULL,1,0,'8'),(50,9,'list_dropzone',NULL,1,0,'8'),(51,10,'download',1,0,0,'4'),(52,10,'rename',1,0,1,'8'),(53,10,'edit-properties',1,0,1,'8'),(54,10,'edit-rights',1,0,1,'8'),(55,10,'delete',1,0,0,'16'),(56,11,'download',1,0,0,'4'),(57,11,'rename',1,0,1,'8'),(58,11,'edit-properties',1,0,1,'8'),(59,11,'edit-rights',1,0,1,'8'),(60,11,'delete',1,0,0,'16'),(61,12,'download',1,0,0,'4'),(62,12,'rename',1,0,1,'8'),(63,12,'edit-properties',1,0,1,'8'),(64,12,'edit-rights',1,0,1,'8'),(65,12,'delete',1,0,0,'16');
/*!40000 ALTER TABLE `claro_menu_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_message`
--

DROP TABLE IF EXISTS `claro_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `object` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `is_removed` tinyint(1) NOT NULL,
  `lft` int(11) NOT NULL,
  `lvl` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `root` int(11) DEFAULT NULL,
  `sender_username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `receiver_string` varchar(1023) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D6FE8DD8F624B39D` (`sender_id`),
  KEY `IDX_D6FE8DD8727ACA70` (`parent_id`),
  CONSTRAINT `FK_D6FE8DD8727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `claro_message` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_D6FE8DD8F624B39D` FOREIGN KEY (`sender_id`) REFERENCES `claro_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_message`
--

LOCK TABLES `claro_message` WRITE;
/*!40000 ALTER TABLE `claro_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_ordered_tool`
--

DROP TABLE IF EXISTS `claro_ordered_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_ordered_tool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workspace_id` int(11) DEFAULT NULL,
  `tool_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ordered_tool_unique_tool_ws_usr` (`tool_id`,`workspace_id`,`user_id`),
  UNIQUE KEY `ordered_tool_unique_name_by_workspace` (`workspace_id`,`name`),
  KEY `IDX_6CF1320E82D40A1F` (`workspace_id`),
  KEY `IDX_6CF1320E8F7B22CC` (`tool_id`),
  KEY `IDX_6CF1320EA76ED395` (`user_id`),
  CONSTRAINT `FK_6CF1320E82D40A1F` FOREIGN KEY (`workspace_id`) REFERENCES `claro_workspace` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_6CF1320E8F7B22CC` FOREIGN KEY (`tool_id`) REFERENCES `claro_tools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_6CF1320EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_ordered_tool`
--

LOCK TABLES `claro_ordered_tool` WRITE;
/*!40000 ALTER TABLE `claro_ordered_tool` DISABLE KEYS */;
INSERT INTO `claro_ordered_tool` VALUES (1,1,1,NULL,1,'home'),(2,1,3,NULL,2,'resource_manager'),(3,1,4,NULL,3,'agenda'),(4,1,2,NULL,4,'parameters'),(5,1,6,NULL,5,'users'),(6,1,5,NULL,6,'logs'),(7,1,8,NULL,7,'claroline_activity_tool'),(8,NULL,1,1,1,'home'),(9,NULL,3,1,2,'resource_manager'),(10,NULL,2,1,3,'parameters'),(11,2,1,NULL,1,'home'),(12,2,3,NULL,2,'resource_manager'),(13,2,4,NULL,3,'agenda'),(14,2,2,NULL,4,'parameters'),(15,2,6,NULL,5,'users'),(16,2,5,NULL,6,'logs'),(17,2,8,NULL,7,'claroline_activity_tool'),(18,2,7,NULL,8,'Badges');
/*!40000 ALTER TABLE `claro_ordered_tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_ordered_tool_role`
--

DROP TABLE IF EXISTS `claro_ordered_tool_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_ordered_tool_role` (
  `orderedtool_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`orderedtool_id`,`role_id`),
  KEY `IDX_9210497679732467` (`orderedtool_id`),
  KEY `IDX_92104976D60322AC` (`role_id`),
  CONSTRAINT `FK_9210497679732467` FOREIGN KEY (`orderedtool_id`) REFERENCES `claro_ordered_tool` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_92104976D60322AC` FOREIGN KEY (`role_id`) REFERENCES `claro_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_ordered_tool_role`
--

LOCK TABLES `claro_ordered_tool_role` WRITE;
/*!40000 ALTER TABLE `claro_ordered_tool_role` DISABLE KEYS */;
INSERT INTO `claro_ordered_tool_role` VALUES (1,5),(1,6),(1,7),(2,6),(2,7),(3,6),(3,7),(4,7),(5,7),(6,7),(7,6),(7,7),(11,8),(11,9),(11,10),(12,9),(12,10),(13,9),(13,10),(14,10),(15,10),(16,10),(17,9),(17,10);
/*!40000 ALTER TABLE `claro_ordered_tool_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_plugin`
--

DROP TABLE IF EXISTS `claro_plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_plugin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `short_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `has_options` tinyint(1) NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plugin_unique_name` (`vendor_name`,`short_name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_plugin`
--

LOCK TABLES `claro_plugin` WRITE;
/*!40000 ALTER TABLE `claro_plugin` DISABLE KEYS */;
INSERT INTO `claro_plugin` VALUES (1,'Claroline','ActivityToolBundle',0,'bundles/clarolinecore/images/resources/icons/res_default.png'),(2,'Claroline','AnnouncementBundle',0,'bundles/clarolinecore/images/resources/icons/res_default.png'),(3,'Claroline','ForumBundle',1,'bundles/clarolineforum/images/icons/res_forum.png'),(4,'Claroline','ImagePlayerBundle',0,'bundles/clarolinecore/images/resources/icons/res_default.png'),(5,'Claroline','PdfPlayerBundle',0,'bundles/clarolinecore/images/resources/icons/res_default.png'),(6,'Claroline','VideoPlayerBundle',0,'bundles/clarolinecore/images/resources/icons/res_default.png'),(7,'Icap','BlogBundle',0,'bundles/icapblog/images/icons/icap_blog_icon.png'),(8,'Icap','DropzoneBundle',0,'bundles/icapdropzone/images/icons/icap_eval_icon.png'),(9,'Icap','WikiBundle',0,'bundles/icapwiki/images/icons/icap_wiki_icon_admin.png'),(10,'UJM','ExoBundle',0,'bundles/ujmexo/images/icons/res_exo.png'),(11,'Claroline','RssReaderBundle',0,'bundles/clarolinecore/images/resources/icons/res_default.png'),(12,'Icap','LessonBundle',0,'bundles/icaplesson/images/icons/icap_lesson_icon.png');
/*!40000 ALTER TABLE `claro_plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_region`
--

DROP TABLE IF EXISTS `claro_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_region`
--

LOCK TABLES `claro_region` WRITE;
/*!40000 ALTER TABLE `claro_region` DISABLE KEYS */;
INSERT INTO `claro_region` VALUES (1,'header'),(2,'left'),(3,'content'),(4,'right'),(5,'footer');
/*!40000 ALTER TABLE `claro_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_rel_workspace_tag`
--

DROP TABLE IF EXISTS `claro_rel_workspace_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_rel_workspace_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workspace_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rel_workspace_tag_unique_combination` (`workspace_id`,`tag_id`),
  KEY `IDX_7883931082D40A1F` (`workspace_id`),
  KEY `IDX_78839310BAD26311` (`tag_id`),
  CONSTRAINT `FK_7883931082D40A1F` FOREIGN KEY (`workspace_id`) REFERENCES `claro_workspace` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_78839310BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `claro_workspace_tag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_rel_workspace_tag`
--

LOCK TABLES `claro_rel_workspace_tag` WRITE;
/*!40000 ALTER TABLE `claro_rel_workspace_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_rel_workspace_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_resource_activity`
--

DROP TABLE IF EXISTS `claro_resource_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_resource_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL,
  `sequence_order` int(11) DEFAULT NULL,
  `resourceNode_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resource_activity_unique_combination` (`activity_id`,`resourceNode_id`),
  KEY `IDX_DCF37C7E81C06096` (`activity_id`),
  KEY `IDX_DCF37C7EB87FAB32` (`resourceNode_id`),
  CONSTRAINT `FK_DCF37C7E81C06096` FOREIGN KEY (`activity_id`) REFERENCES `claro_activity` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_DCF37C7EB87FAB32` FOREIGN KEY (`resourceNode_id`) REFERENCES `claro_resource_node` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_resource_activity`
--

LOCK TABLES `claro_resource_activity` WRITE;
/*!40000 ALTER TABLE `claro_resource_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_resource_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_resource_icon`
--

DROP TABLE IF EXISTS `claro_resource_icon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_resource_icon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shortcut_id` int(11) DEFAULT NULL,
  `icon_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mimeType` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_shortcut` tinyint(1) NOT NULL,
  `relative_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_478C586179F0D498` (`shortcut_id`),
  CONSTRAINT `FK_478C586179F0D498` FOREIGN KEY (`shortcut_id`) REFERENCES `claro_resource_icon` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_resource_icon`
--

LOCK TABLES `claro_resource_icon` WRITE;
/*!40000 ALTER TABLE `claro_resource_icon` DISABLE KEYS */;
INSERT INTO `claro_resource_icon` VALUES (1,2,'/home/moocplm/public_html/app/../web/bundles/clarolinecore/images/resources/icons/res_default.png','custom/default',0,'bundles/clarolinecore/images/resources/icons/res_default.png'),(2,2,'/home/moocplm/public_html/app/../web/thumbnails/FD59922B-AC0A-4EB7-9A7E-42C9B7E110ED.png','custom/default',1,'thumbnails/FD59922B-AC0A-4EB7-9A7E-42C9B7E110ED.png'),(3,4,'/home/moocplm/public_html/app/../web/bundles/clarolinecore/images/resources/icons/res_default.png','custom/activity',0,'bundles/clarolinecore/images/resources/icons/res_default.png'),(4,4,'/home/moocplm/public_html/app/../web/thumbnails/ED3DA9D1-64F1-45DF-8670-0090E4B6D6D8.png','custom/activity',1,'thumbnails/ED3DA9D1-64F1-45DF-8670-0090E4B6D6D8.png'),(5,6,'/home/moocplm/public_html/app/../web/bundles/clarolinecore/images/resources/icons/res_file.png','custom/file',0,'bundles/clarolinecore/images/resources/icons/res_file.png'),(6,6,'/home/moocplm/public_html/app/../web/thumbnails/1EEF9F3B-33A2-47EC-9E14-ACA65739EC0E.png','custom/file',1,'thumbnails/1EEF9F3B-33A2-47EC-9E14-ACA65739EC0E.png'),(7,8,'/home/moocplm/public_html/app/../web/bundles/clarolinecore/images/resources/icons/res_folder.png','custom/directory',0,'bundles/clarolinecore/images/resources/icons/res_folder.png'),(8,8,'/home/moocplm/public_html/app/../web/thumbnails/B812F720-13D3-4304-9D15-2AC2D2CE0EAF.png','custom/directory',1,'thumbnails/B812F720-13D3-4304-9D15-2AC2D2CE0EAF.png'),(9,10,'/home/moocplm/public_html/app/../web/bundles/clarolinecore/images/resources/icons/res_text.png','text/plain',0,'bundles/clarolinecore/images/resources/icons/res_text.png'),(10,10,'/home/moocplm/public_html/app/../web/thumbnails/ED66B52F-F4BC-4A98-A428-778E03C3FD85.png','text/plain',1,'thumbnails/ED66B52F-F4BC-4A98-A428-778E03C3FD85.png'),(11,12,'/home/moocplm/public_html/app/../web/bundles/clarolinecore/images/resources/icons/res_text.png','custom/text',0,'bundles/clarolinecore/images/resources/icons/res_text.png'),(12,12,'/home/moocplm/public_html/app/../web/thumbnails/AA7DD0EC-A657-443B-B7C7-985F176B35F6.png','custom/text',1,'thumbnails/AA7DD0EC-A657-443B-B7C7-985F176B35F6.png'),(13,14,'/home/moocplm/public_html/app/../web/bundles/clarolinecore/images/resources/icons/res_url.png','custom/url',0,'bundles/clarolinecore/images/resources/icons/res_url.png'),(14,14,'/home/moocplm/public_html/app/../web/thumbnails/F810A2A4-44F2-4707-96BA-057163EE44C4.png','custom/url',1,'thumbnails/F810A2A4-44F2-4707-96BA-057163EE44C4.png'),(15,16,'/home/moocplm/public_html/app/../web/bundles/clarolinecore/images/resources/icons/res_exercice.png','custom/exercice',0,'bundles/clarolinecore/images/resources/icons/res_exercice.png'),(16,16,'/home/moocplm/public_html/app/../web/thumbnails/8E78AFCF-4AD2-4E69-A060-B10CEDEF8533.png','custom/exercice',1,'thumbnails/8E78AFCF-4AD2-4E69-A060-B10CEDEF8533.png'),(17,18,'/home/moocplm/public_html/app/../web/bundles/clarolinecore/images/resources/icons/res_video.png','video',0,'bundles/clarolinecore/images/resources/icons/res_video.png'),(18,18,'/home/moocplm/public_html/app/../web/thumbnails/D73BA414-24F7-44B2-809E-D119AFE0662C.png','video',1,'thumbnails/D73BA414-24F7-44B2-809E-D119AFE0662C.png'),(19,20,'/home/moocplm/public_html/app/../web/bundles/clarolinecore/images/resources/icons/res_msexcel.png','application/excel',0,'bundles/clarolinecore/images/resources/icons/res_msexcel.png'),(20,20,'/home/moocplm/public_html/app/../web/thumbnails/A99D9E2E-7FE6-4B12-A76F-4C3FA64EB849.png','application/excel',1,'thumbnails/A99D9E2E-7FE6-4B12-A76F-4C3FA64EB849.png'),(21,22,'/home/moocplm/public_html/app/../web/bundles/clarolinecore/images/resources/icons/res_mspowerpoint.png','application/powerpoint',0,'bundles/clarolinecore/images/resources/icons/res_mspowerpoint.png'),(22,22,'/home/moocplm/public_html/app/../web/thumbnails/AFC4D068-65AD-495F-93CE-61A4B6B7ACFE.png','application/powerpoint',1,'thumbnails/AFC4D068-65AD-495F-93CE-61A4B6B7ACFE.png'),(23,24,'/home/moocplm/public_html/app/../web/bundles/clarolinecore/images/resources/icons/res_msword.png','application/msword',0,'bundles/clarolinecore/images/resources/icons/res_msword.png'),(24,24,'/home/moocplm/public_html/app/../web/thumbnails/E4A14055-151E-45B7-AD88-0B4F20C7E809.png','application/msword',1,'thumbnails/E4A14055-151E-45B7-AD88-0B4F20C7E809.png'),(25,26,'/home/moocplm/public_html/app/../web/bundles/clarolinecore/images/resources/icons/res_msword.png','application/vnd.oasis.opendocument.text',0,'bundles/clarolinecore/images/resources/icons/res_msword.png'),(26,26,'/home/moocplm/public_html/app/../web/thumbnails/36CF036D-622D-4F6E-B948-AD70DBAF70BD.png','application/vnd.oasis.opendocument.text',1,'thumbnails/36CF036D-622D-4F6E-B948-AD70DBAF70BD.png'),(27,28,'/home/moocplm/public_html/app/../web/bundles/clarolinecore/images/resources/icons/res_pdf.png','application/pdf',0,'bundles/clarolinecore/images/resources/icons/res_pdf.png'),(28,28,'/home/moocplm/public_html/app/../web/thumbnails/44C74D49-B38E-43EA-957D-264515AD14C0.png','application/pdf',1,'thumbnails/44C74D49-B38E-43EA-957D-264515AD14C0.png'),(29,30,'/home/moocplm/public_html/app/../web/bundles/clarolinecore/images/resources/icons/res_image.png','image',0,'bundles/clarolinecore/images/resources/icons/res_image.png'),(30,30,'/home/moocplm/public_html/app/../web/thumbnails/2C733634-8E83-41E0-AA4E-6725C3FFB79B.png','image',1,'thumbnails/2C733634-8E83-41E0-AA4E-6725C3FFB79B.png'),(31,32,'/home/moocplm/public_html/app/../web/bundles/clarolinecore/images/resources/icons/res_default.png','custom/claroline_announcement_aggregate',0,'bundles/clarolinecore/images/resources/icons/res_default.png'),(32,32,'/home/moocplm/public_html/app/../web/thumbnails/38023628-0F9C-4F61-8F99-B51FC3A39873.png','custom/claroline_announcement_aggregate',1,'thumbnails/38023628-0F9C-4F61-8F99-B51FC3A39873.png'),(33,34,'/home/moocplm/public_html/app/../web/bundles/clarolineforum/images/icons/res_forum.png','custom/claroline_forum',0,'bundles/clarolineforum/images/icons/res_forum.png'),(34,34,'/home/moocplm/public_html/app/../web/thumbnails/D52546F3-DC2F-4576-B326-30BFD93C0978.png','custom/claroline_forum',1,'thumbnails/D52546F3-DC2F-4576-B326-30BFD93C0978.png'),(35,36,'/home/moocplm/public_html/app/../web/bundles/icapblog/images/icons/icap_blog_icon.png','custom/icap_blog',0,'bundles/icapblog/images/icons/icap_blog_icon.png'),(36,36,'/home/moocplm/public_html/app/../web/thumbnails/A6C95994-C7EA-4BA4-AB37-49E4280EFFEE.png','custom/icap_blog',1,'thumbnails/A6C95994-C7EA-4BA4-AB37-49E4280EFFEE.png'),(37,38,'/home/moocplm/public_html/app/../web/bundles/icapdropzone/images/icons/icap_eval_icon.png','custom/icap_dropzone',0,'bundles/icapdropzone/images/icons/icap_eval_icon.png'),(38,38,'/home/moocplm/public_html/app/../web/thumbnails/6DE85B64-93A8-449E-B81A-8355441712D1.png','custom/icap_dropzone',1,'thumbnails/6DE85B64-93A8-449E-B81A-8355441712D1.png'),(39,40,'/home/moocplm/public_html/app/../web/bundles/icapwiki/images/icons/icap_wiki_icon.png','custom/icap_wiki',0,'bundles/icapwiki/images/icons/icap_wiki_icon.png'),(40,40,'/home/moocplm/public_html/app/../web/thumbnails/FAADBDD4-6151-416E-BB09-4FB573E0F627.png','custom/icap_wiki',1,'thumbnails/FAADBDD4-6151-416E-BB09-4FB573E0F627.png'),(41,42,'/home/moocplm/public_html/app/../web/bundles/ujmexo/images/icons/res_exo.png','custom/ujm_exercise',0,'bundles/ujmexo/images/icons/res_exo.png'),(42,42,'/home/moocplm/public_html/app/../web/thumbnails/C1C062DF-C6A9-40AA-8A1F-5430FAE83177.png','custom/ujm_exercise',1,'thumbnails/C1C062DF-C6A9-40AA-8A1F-5430FAE83177.png'),(43,44,'/home/moocplm/public_html/app/../web/bundles/icaplesson/images/icons/icap_lesson_icon.png','custom/icap_lesson',0,'bundles/icaplesson/images/icons/icap_lesson_icon.png'),(44,44,'/home/moocplm/public_html/app/../web/thumbnails/598F4B30-977D-49C9-B310-7E3D3EB7098D.png','custom/icap_lesson',1,'thumbnails/598F4B30-977D-49C9-B310-7E3D3EB7098D.png');
/*!40000 ALTER TABLE `claro_resource_icon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_resource_mask_decoder`
--

DROP TABLE IF EXISTS `claro_resource_mask_decoder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_resource_mask_decoder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_type_id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_39D93F4298EC6B7B` (`resource_type_id`),
  CONSTRAINT `FK_39D93F4298EC6B7B` FOREIGN KEY (`resource_type_id`) REFERENCES `claro_resource_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_resource_mask_decoder`
--

LOCK TABLES `claro_resource_mask_decoder` WRITE;
/*!40000 ALTER TABLE `claro_resource_mask_decoder` DISABLE KEYS */;
INSERT INTO `claro_resource_mask_decoder` VALUES (1,1,1,'open'),(2,1,2,'copy'),(3,1,4,'export'),(4,1,8,'edit'),(5,1,16,'delete'),(6,2,1,'open'),(7,2,2,'copy'),(8,2,4,'export'),(9,2,8,'edit'),(10,2,16,'delete'),(11,3,1,'open'),(12,3,2,'copy'),(13,3,4,'export'),(14,3,8,'edit'),(15,3,16,'delete'),(16,4,1,'open'),(17,4,2,'copy'),(18,4,4,'export'),(19,4,8,'edit'),(20,4,16,'delete'),(21,5,1,'open'),(22,5,2,'copy'),(23,5,4,'export'),(24,5,8,'edit'),(25,5,16,'delete'),(26,5,64,'compose'),(27,3,64,'write'),(28,6,1,'open'),(29,6,2,'copy'),(30,6,4,'export'),(31,6,8,'edit'),(32,6,16,'delete'),(33,7,1,'open'),(34,7,2,'copy'),(35,7,4,'export'),(36,7,8,'edit'),(37,7,16,'delete'),(38,7,32,'post'),(39,7,64,'moderate'),(40,8,1,'open'),(41,8,2,'copy'),(42,8,4,'export'),(43,8,8,'edit'),(44,8,16,'delete'),(45,8,32,'post'),(46,9,1,'open'),(47,9,2,'copy'),(48,9,4,'export'),(49,9,8,'edit'),(50,9,16,'delete'),(51,10,1,'open'),(52,10,2,'copy'),(53,10,4,'export'),(54,10,8,'edit'),(55,10,16,'delete'),(56,11,1,'open'),(57,11,2,'copy'),(58,11,4,'export'),(59,11,8,'edit'),(60,11,16,'delete'),(61,12,1,'open'),(62,12,2,'copy'),(63,12,4,'export'),(64,12,8,'edit'),(65,12,16,'delete');
/*!40000 ALTER TABLE `claro_resource_mask_decoder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_resource_node`
--

DROP TABLE IF EXISTS `claro_resource_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_resource_node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license_id` int(11) DEFAULT NULL,
  `resource_type_id` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `icon_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `workspace_id` int(11) NOT NULL,
  `next_id` int(11) DEFAULT NULL,
  `previous_id` int(11) DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `modification_date` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lvl` int(11) DEFAULT NULL,
  `path` varchar(3000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mime_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A76799FFAA23F6C8` (`next_id`),
  UNIQUE KEY `UNIQ_A76799FF2DE62210` (`previous_id`),
  KEY `IDX_A76799FF460F904B` (`license_id`),
  KEY `IDX_A76799FF98EC6B7B` (`resource_type_id`),
  KEY `IDX_A76799FF61220EA6` (`creator_id`),
  KEY `IDX_A76799FF54B9D732` (`icon_id`),
  KEY `IDX_A76799FF727ACA70` (`parent_id`),
  KEY `IDX_A76799FF82D40A1F` (`workspace_id`),
  CONSTRAINT `FK_A76799FF2DE62210` FOREIGN KEY (`previous_id`) REFERENCES `claro_resource_node` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_A76799FF460F904B` FOREIGN KEY (`license_id`) REFERENCES `claro_license` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A76799FF54B9D732` FOREIGN KEY (`icon_id`) REFERENCES `claro_resource_icon` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A76799FF61220EA6` FOREIGN KEY (`creator_id`) REFERENCES `claro_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A76799FF727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `claro_resource_node` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A76799FF82D40A1F` FOREIGN KEY (`workspace_id`) REFERENCES `claro_workspace` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A76799FF98EC6B7B` FOREIGN KEY (`resource_type_id`) REFERENCES `claro_resource_type` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A76799FFAA23F6C8` FOREIGN KEY (`next_id`) REFERENCES `claro_resource_node` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_resource_node`
--

LOCK TABLES `claro_resource_node` WRITE;
/*!40000 ALTER TABLE `claro_resource_node` DISABLE KEYS */;
INSERT INTO `claro_resource_node` VALUES (1,NULL,2,1,7,NULL,1,NULL,NULL,'2013-11-24 20:46:22','2013-11-24 20:46:22','Espace personnel - pernelle',1,'Espace personnel - pernelle-1`','custom/directory','Claroline\\CoreBundle\\Entity\\Resource\\Directory'),(2,NULL,2,1,7,NULL,2,NULL,NULL,'2013-11-25 11:03:05','2013-11-25 11:03:05','test - test',1,'test - test-2`','custom/directory','Claroline\\CoreBundle\\Entity\\Resource\\Directory'),(3,NULL,10,1,39,2,2,4,NULL,'2013-11-25 11:03:53','2013-11-25 11:04:48','test wiki',2,'test - test-2`test wiki-3`','custom/icap_wiki','Icap\\WikiBundle\\Entity\\Wiki'),(4,NULL,5,1,3,2,2,5,3,'2013-11-25 11:04:47','2013-11-25 11:06:05','test2',2,'test - test-2`test2-4`','custom/activity','Claroline\\CoreBundle\\Entity\\Resource\\Activity'),(5,NULL,6,1,31,2,2,6,4,'2013-11-25 11:06:05','2013-11-25 14:08:45','essai',2,'test - test-2`essai-5`','custom/claroline_announcement_aggregate','Claroline\\AnnouncementBundle\\Entity\\AnnouncementAggregate'),(6,NULL,11,1,41,2,2,7,5,'2013-11-25 14:08:45','2013-11-25 14:25:25','essai3',2,'test - test-2`essai3-6`','custom/ujm_exercise','UJM\\ExoBundle\\Entity\\Exercise'),(7,NULL,12,1,43,2,2,8,6,'2013-11-25 14:25:25','2013-11-28 21:12:28','tt',2,'test - test-2`tt-7`','custom/icap_lesson','Icap\\LessonBundle\\Entity\\Lesson'),(8,NULL,9,1,37,2,2,9,7,'2013-11-28 21:12:28','2013-11-28 21:27:07','eval',2,'test - test-2`eval-8`','custom/icap_dropzone','Icap\\DropzoneBundle\\Entity\\Dropzone'),(9,NULL,11,1,41,2,2,NULL,8,'2013-11-28 21:27:07','2013-11-28 21:27:07','exo',2,'test - test-2`exo-9`','custom/ujm_exercise','UJM\\ExoBundle\\Entity\\Exercise');
/*!40000 ALTER TABLE `claro_resource_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_resource_rights`
--

DROP TABLE IF EXISTS `claro_resource_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_resource_rights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `mask` int(11) NOT NULL,
  `resourceNode_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resource_rights_unique_resource_role` (`resourceNode_id`,`role_id`),
  KEY `IDX_3848F483D60322AC` (`role_id`),
  KEY `IDX_3848F483B87FAB32` (`resourceNode_id`),
  CONSTRAINT `FK_3848F483B87FAB32` FOREIGN KEY (`resourceNode_id`) REFERENCES `claro_resource_node` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_3848F483D60322AC` FOREIGN KEY (`role_id`) REFERENCES `claro_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_resource_rights`
--

LOCK TABLES `claro_resource_rights` WRITE;
/*!40000 ALTER TABLE `claro_resource_rights` DISABLE KEYS */;
INSERT INTO `claro_resource_rights` VALUES (1,5,0,1),(2,6,5,1),(3,7,31,1),(4,3,31,1),(5,4,0,1),(6,8,0,2),(7,9,5,2),(8,10,31,2),(9,3,31,2),(10,4,0,2),(11,3,31,3),(12,4,0,3),(13,8,0,3),(14,9,5,3),(15,10,31,3),(16,3,31,4),(17,4,0,4),(18,8,0,4),(19,9,5,4),(20,10,31,4),(21,3,31,5),(22,4,0,5),(23,8,0,5),(24,9,5,5),(25,10,31,5),(26,3,31,6),(27,4,0,6),(28,8,0,6),(29,9,5,6),(30,10,31,6),(31,3,31,7),(32,4,0,7),(33,8,0,7),(34,9,5,7),(35,10,31,7),(36,3,31,8),(37,4,0,8),(38,8,0,8),(39,9,5,8),(40,10,31,8),(41,3,31,9),(42,4,0,9),(43,8,0,9),(44,9,5,9),(45,10,31,9);
/*!40000 ALTER TABLE `claro_resource_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_resource_shortcut`
--

DROP TABLE IF EXISTS `claro_resource_shortcut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_resource_shortcut` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_id` int(11) NOT NULL,
  `resourceNode_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5E7F4AB8B87FAB32` (`resourceNode_id`),
  KEY `IDX_5E7F4AB8158E0B66` (`target_id`),
  CONSTRAINT `FK_5E7F4AB8158E0B66` FOREIGN KEY (`target_id`) REFERENCES `claro_resource_node` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_5E7F4AB8B87FAB32` FOREIGN KEY (`resourceNode_id`) REFERENCES `claro_resource_node` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_resource_shortcut`
--

LOCK TABLES `claro_resource_shortcut` WRITE;
/*!40000 ALTER TABLE `claro_resource_shortcut` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_resource_shortcut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_resource_type`
--

DROP TABLE IF EXISTS `claro_resource_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_resource_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_exportable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_AEC626935E237E06` (`name`),
  KEY `IDX_AEC62693EC942BCF` (`plugin_id`),
  CONSTRAINT `FK_AEC62693EC942BCF` FOREIGN KEY (`plugin_id`) REFERENCES `claro_plugin` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_resource_type`
--

LOCK TABLES `claro_resource_type` WRITE;
/*!40000 ALTER TABLE `claro_resource_type` DISABLE KEYS */;
INSERT INTO `claro_resource_type` VALUES (1,NULL,'file',1),(2,NULL,'directory',1),(3,NULL,'text',1),(4,NULL,'resource_shortcut',0),(5,NULL,'activity',1),(6,2,'claroline_announcement_aggregate',0),(7,3,'claroline_forum',1),(8,7,'icap_blog',0),(9,8,'icap_dropzone',0),(10,9,'icap_wiki',0),(11,10,'ujm_exercise',0),(12,12,'icap_lesson',0);
/*!40000 ALTER TABLE `claro_resource_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_resource_type_custom_action`
--

DROP TABLE IF EXISTS `claro_resource_type_custom_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_resource_type_custom_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_type_id` int(11) DEFAULT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `async` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4A98967B98EC6B7B` (`resource_type_id`),
  CONSTRAINT `FK_4A98967B98EC6B7B` FOREIGN KEY (`resource_type_id`) REFERENCES `claro_resource_type` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_resource_type_custom_action`
--

LOCK TABLES `claro_resource_type_custom_action` WRITE;
/*!40000 ALTER TABLE `claro_resource_type_custom_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_resource_type_custom_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_role`
--

DROP TABLE IF EXISTS `claro_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workspace_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `translation_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_read_only` tinyint(1) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_317774715E237E06` (`name`),
  KEY `IDX_3177747182D40A1F` (`workspace_id`),
  CONSTRAINT `FK_3177747182D40A1F` FOREIGN KEY (`workspace_id`) REFERENCES `claro_workspace` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_role`
--

LOCK TABLES `claro_role` WRITE;
/*!40000 ALTER TABLE `claro_role` DISABLE KEYS */;
INSERT INTO `claro_role` VALUES (1,NULL,'ROLE_USER','user',1,1),(2,NULL,'ROLE_WS_CREATOR','ws_creator',1,1),(3,NULL,'ROLE_ADMIN','admin',1,1),(4,NULL,'ROLE_ANONYMOUS','anonymous',1,1),(5,1,'ROLE_WS_VISITOR_DEB59210-279B-4423-A538-9056D0448FD1','visitor',1,2),(6,1,'ROLE_WS_COLLABORATOR_DEB59210-279B-4423-A538-9056D0448FD1','collaborator',1,2),(7,1,'ROLE_WS_MANAGER_DEB59210-279B-4423-A538-9056D0448FD1','manager',1,2),(8,2,'ROLE_WS_VISITOR_35235C91-8ED9-4612-9AD0-09AD6CE610D8','visitor',1,2),(9,2,'ROLE_WS_COLLABORATOR_35235C91-8ED9-4612-9AD0-09AD6CE610D8','collaborator',1,2),(10,2,'ROLE_WS_MANAGER_35235C91-8ED9-4612-9AD0-09AD6CE610D8','manager',1,2);
/*!40000 ALTER TABLE `claro_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_rssreader_configuration`
--

DROP TABLE IF EXISTS `claro_rssreader_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_rssreader_configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `widgetInstance_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8D6D1C54AB7B5A55` (`widgetInstance_id`),
  CONSTRAINT `FK_8D6D1C54AB7B5A55` FOREIGN KEY (`widgetInstance_id`) REFERENCES `claro_widget_instance` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_rssreader_configuration`
--

LOCK TABLES `claro_rssreader_configuration` WRITE;
/*!40000 ALTER TABLE `claro_rssreader_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_rssreader_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_simple_text_widget_config`
--

DROP TABLE IF EXISTS `claro_simple_text_widget_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_simple_text_widget_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `widgetInstance_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C389EBCCAB7B5A55` (`widgetInstance_id`),
  CONSTRAINT `FK_C389EBCCAB7B5A55` FOREIGN KEY (`widgetInstance_id`) REFERENCES `claro_widget_instance` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_simple_text_widget_config`
--

LOCK TABLES `claro_simple_text_widget_config` WRITE;
/*!40000 ALTER TABLE `claro_simple_text_widget_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_simple_text_widget_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_subcontent`
--

DROP TABLE IF EXISTS `claro_subcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_subcontent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `father_id` int(11) NOT NULL,
  `child_id` int(11) NOT NULL,
  `next_id` int(11) DEFAULT NULL,
  `back_id` int(11) DEFAULT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D72E133C2055B9A2` (`father_id`),
  KEY `IDX_D72E133CDD62C21B` (`child_id`),
  KEY `IDX_D72E133CAA23F6C8` (`next_id`),
  KEY `IDX_D72E133CE9583FF0` (`back_id`),
  CONSTRAINT `FK_D72E133C2055B9A2` FOREIGN KEY (`father_id`) REFERENCES `claro_content` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D72E133CAA23F6C8` FOREIGN KEY (`next_id`) REFERENCES `claro_subcontent` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D72E133CDD62C21B` FOREIGN KEY (`child_id`) REFERENCES `claro_content` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D72E133CE9583FF0` FOREIGN KEY (`back_id`) REFERENCES `claro_subcontent` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_subcontent`
--

LOCK TABLES `claro_subcontent` WRITE;
/*!40000 ALTER TABLE `claro_subcontent` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_subcontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_text`
--

DROP TABLE IF EXISTS `claro_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL,
  `resourceNode_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5D9559DCB87FAB32` (`resourceNode_id`),
  CONSTRAINT `FK_5D9559DCB87FAB32` FOREIGN KEY (`resourceNode_id`) REFERENCES `claro_resource_node` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_text`
--

LOCK TABLES `claro_text` WRITE;
/*!40000 ALTER TABLE `claro_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_text_revision`
--

DROP TABLE IF EXISTS `claro_text_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_text_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `version` int(11) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F61948DE698D3548` (`text_id`),
  KEY `IDX_F61948DEA76ED395` (`user_id`),
  CONSTRAINT `FK_F61948DE698D3548` FOREIGN KEY (`text_id`) REFERENCES `claro_text` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_F61948DEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_text_revision`
--

LOCK TABLES `claro_text_revision` WRITE;
/*!40000 ALTER TABLE `claro_text_revision` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_text_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_theme`
--

DROP TABLE IF EXISTS `claro_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1D76301AEC942BCF` (`plugin_id`),
  CONSTRAINT `FK_1D76301AEC942BCF` FOREIGN KEY (`plugin_id`) REFERENCES `claro_plugin` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_theme`
--

LOCK TABLES `claro_theme` WRITE;
/*!40000 ALTER TABLE `claro_theme` DISABLE KEYS */;
INSERT INTO `claro_theme` VALUES (1,NULL,'Claroline','ClarolineCoreBundle:less:claroline/theme.html.twig'),(2,NULL,'Claroline Orange','ClarolineCoreBundle:less:claroline-orange/theme.html.twig'),(3,NULL,'Claroline Mint','ClarolineCoreBundle:less:claroline-mint/theme.html.twig'),(4,NULL,'Claroline Gold','ClarolineCoreBundle:less:claroline-gold/theme.html.twig'),(5,NULL,'Claroline Ruby','ClarolineCoreBundle:less:claroline-ruby/theme.html.twig'),(6,NULL,'Claroline Black','ClarolineCoreBundle:less:claroline-black/theme.html.twig'),(7,NULL,'Claroline Dark','ClarolineCoreBundle:less:claroline-dark/theme.html.twig'),(8,NULL,'Bootstrap Default','ClarolineCoreBundle:less:bootstrap-default/theme.html.twig');
/*!40000 ALTER TABLE `claro_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_tools`
--

DROP TABLE IF EXISTS `claro_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_tools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_workspace_required` tinyint(1) NOT NULL,
  `is_desktop_required` tinyint(1) NOT NULL,
  `is_displayable_in_workspace` tinyint(1) NOT NULL,
  `is_displayable_in_desktop` tinyint(1) NOT NULL,
  `is_exportable` tinyint(1) NOT NULL,
  `is_configurable_in_workspace` tinyint(1) NOT NULL,
  `is_configurable_in_desktop` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_60F909655E237E06` (`name`),
  KEY `IDX_60F90965EC942BCF` (`plugin_id`),
  CONSTRAINT `FK_60F90965EC942BCF` FOREIGN KEY (`plugin_id`) REFERENCES `claro_plugin` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_tools`
--

LOCK TABLES `claro_tools` WRITE;
/*!40000 ALTER TABLE `claro_tools` DISABLE KEYS */;
INSERT INTO `claro_tools` VALUES (1,NULL,'home',NULL,'icon-home',0,0,1,1,1,0,0),(2,NULL,'parameters',NULL,'icon-cog',0,0,1,1,0,0,0),(3,NULL,'resource_manager',NULL,'icon-folder-open',0,0,1,1,1,1,0),(4,NULL,'agenda',NULL,'icon-calendar',0,0,1,1,0,0,0),(5,NULL,'logs',NULL,'icon-list',0,0,1,0,0,0,0),(6,NULL,'users',NULL,'icon-user',1,0,1,0,0,0,0),(7,NULL,'badges',NULL,'icon-trophy',0,0,1,0,0,0,0),(8,1,'claroline_activity_tool',NULL,'icon-wrench',0,0,1,1,0,0,0),(9,10,'ujm_questions',NULL,'icon-wrench',0,0,0,1,0,0,0);
/*!40000 ALTER TABLE `claro_tools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_type`
--

DROP TABLE IF EXISTS `claro_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `max_content_page` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_type`
--

LOCK TABLES `claro_type` WRITE;
/*!40000 ALTER TABLE `claro_type` DISABLE KEYS */;
INSERT INTO `claro_type` VALUES (1,'home',100),(2,'menu',100);
/*!40000 ALTER TABLE `claro_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_user`
--

DROP TABLE IF EXISTS `claro_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workspace_id` int(11) DEFAULT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `administrative_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `reset_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hash_time` int(11) DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_EB8D2852F85E0677` (`username`),
  UNIQUE KEY `UNIQ_EB8D28525126AC48` (`mail`),
  UNIQUE KEY `UNIQ_EB8D285282D40A1F` (`workspace_id`),
  CONSTRAINT `FK_EB8D285282D40A1F` FOREIGN KEY (`workspace_id`) REFERENCES `claro_workspace` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_user`
--

LOCK TABLES `claro_user` WRITE;
/*!40000 ALTER TABLE `claro_user` DISABLE KEYS */;
INSERT INTO `claro_user` VALUES (1,1,'philippe','pernelle','pernelle','lAcXVmKpZdfGbGyyeSPw1lrQxoZPX/qRCYRNTxi1pb/fDzi2/zNLXc9fmkZCTV46mcqh+zCloqSefk15FebOmw==','3xm97u40w1c0ocos8g4wgw804o8csco',NULL,'philippe.pernelle@gmail.com',NULL,'2013-11-24 20:46:22',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `claro_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_user_badge`
--

DROP TABLE IF EXISTS `claro_user_badge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_user_badge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `badge_id` int(11) NOT NULL,
  `issuer_id` int(11) DEFAULT NULL,
  `issued_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_badge_unique` (`user_id`,`badge_id`),
  KEY `IDX_7EBB381FA76ED395` (`user_id`),
  KEY `IDX_7EBB381FF7A2C2FC` (`badge_id`),
  KEY `IDX_7EBB381FBB9D6FEE` (`issuer_id`),
  CONSTRAINT `FK_7EBB381FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_7EBB381FBB9D6FEE` FOREIGN KEY (`issuer_id`) REFERENCES `claro_user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_7EBB381FF7A2C2FC` FOREIGN KEY (`badge_id`) REFERENCES `claro_badge` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_user_badge`
--

LOCK TABLES `claro_user_badge` WRITE;
/*!40000 ALTER TABLE `claro_user_badge` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_user_badge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_user_group`
--

DROP TABLE IF EXISTS `claro_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_user_group` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `IDX_ED8B34C7A76ED395` (`user_id`),
  KEY `IDX_ED8B34C7FE54D947` (`group_id`),
  CONSTRAINT `FK_ED8B34C7A76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_ED8B34C7FE54D947` FOREIGN KEY (`group_id`) REFERENCES `claro_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_user_group`
--

LOCK TABLES `claro_user_group` WRITE;
/*!40000 ALTER TABLE `claro_user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_user_message`
--

DROP TABLE IF EXISTS `claro_user_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_user_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `is_removed` tinyint(1) NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `is_sent` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D48EA38AA76ED395` (`user_id`),
  KEY `IDX_D48EA38A537A1329` (`message_id`),
  CONSTRAINT `FK_D48EA38A537A1329` FOREIGN KEY (`message_id`) REFERENCES `claro_message` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D48EA38AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_user_message`
--

LOCK TABLES `claro_user_message` WRITE;
/*!40000 ALTER TABLE `claro_user_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_user_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_user_role`
--

DROP TABLE IF EXISTS `claro_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `IDX_797E43FFA76ED395` (`user_id`),
  KEY `IDX_797E43FFD60322AC` (`role_id`),
  CONSTRAINT `FK_797E43FFA76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_797E43FFD60322AC` FOREIGN KEY (`role_id`) REFERENCES `claro_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_user_role`
--

LOCK TABLES `claro_user_role` WRITE;
/*!40000 ALTER TABLE `claro_user_role` DISABLE KEYS */;
INSERT INTO `claro_user_role` VALUES (1,1),(1,3),(1,7),(1,10);
/*!40000 ALTER TABLE `claro_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_widget`
--

DROP TABLE IF EXISTS `claro_widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_widget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_configurable` tinyint(1) NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_exportable` tinyint(1) NOT NULL,
  `is_displayable_in_workspace` tinyint(1) NOT NULL,
  `is_displayable_in_desktop` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_76CA6C4F5E237E06` (`name`),
  KEY `IDX_76CA6C4FEC942BCF` (`plugin_id`),
  CONSTRAINT `FK_76CA6C4FEC942BCF` FOREIGN KEY (`plugin_id`) REFERENCES `claro_plugin` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_widget`
--

LOCK TABLES `claro_widget` WRITE;
/*!40000 ALTER TABLE `claro_widget` DISABLE KEYS */;
INSERT INTO `claro_widget` VALUES (1,NULL,'core_resource_logger',1,'fake/icon/path',0,1,1),(2,NULL,'simple_text',1,'fake/icon/path',0,1,1),(3,NULL,'my_workspaces',0,'fake/icon/path',0,0,1),(4,2,'claroline_announcement_widget',0,'bundles/clarolinecore/images/resources/icons/res_default.png',0,1,1),(5,11,'claroline_rssreader',1,'bundles/clarolinecore/images/resources/icons/res_default.png',1,1,1);
/*!40000 ALTER TABLE `claro_widget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_widget_display`
--

DROP TABLE IF EXISTS `claro_widget_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_widget_display` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `workspace_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `widget_id` int(11) NOT NULL,
  `is_locked` tinyint(1) NOT NULL,
  `is_visible` tinyint(1) NOT NULL,
  `is_desktop` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2D34DB3727ACA70` (`parent_id`),
  KEY `IDX_2D34DB382D40A1F` (`workspace_id`),
  KEY `IDX_2D34DB3A76ED395` (`user_id`),
  KEY `IDX_2D34DB3FBE885E2` (`widget_id`),
  CONSTRAINT `FK_2D34DB3727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `claro_widget_display` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_2D34DB382D40A1F` FOREIGN KEY (`workspace_id`) REFERENCES `claro_workspace` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2D34DB3A76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2D34DB3FBE885E2` FOREIGN KEY (`widget_id`) REFERENCES `claro_widget` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_widget_display`
--

LOCK TABLES `claro_widget_display` WRITE;
/*!40000 ALTER TABLE `claro_widget_display` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_widget_display` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_widget_home_tab_config`
--

DROP TABLE IF EXISTS `claro_widget_home_tab_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_widget_home_tab_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `home_tab_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `workspace_id` int(11) DEFAULT NULL,
  `widget_order` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_visible` tinyint(1) NOT NULL,
  `is_locked` tinyint(1) NOT NULL,
  `widget_instance_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D48CC23E7D08FA9E` (`home_tab_id`),
  KEY `IDX_D48CC23EA76ED395` (`user_id`),
  KEY `IDX_D48CC23E82D40A1F` (`workspace_id`),
  KEY `IDX_D48CC23E44BF891` (`widget_instance_id`),
  CONSTRAINT `FK_D48CC23E44BF891` FOREIGN KEY (`widget_instance_id`) REFERENCES `claro_widget_instance` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D48CC23E7D08FA9E` FOREIGN KEY (`home_tab_id`) REFERENCES `claro_home_tab` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D48CC23E82D40A1F` FOREIGN KEY (`workspace_id`) REFERENCES `claro_workspace` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D48CC23EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_widget_home_tab_config`
--

LOCK TABLES `claro_widget_home_tab_config` WRITE;
/*!40000 ALTER TABLE `claro_widget_home_tab_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_widget_home_tab_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_widget_instance`
--

DROP TABLE IF EXISTS `claro_widget_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_widget_instance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workspace_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `widget_id` int(11) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_desktop` tinyint(1) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5F89A38582D40A1F` (`workspace_id`),
  KEY `IDX_5F89A385A76ED395` (`user_id`),
  KEY `IDX_5F89A385FBE885E2` (`widget_id`),
  CONSTRAINT `FK_5F89A38582D40A1F` FOREIGN KEY (`workspace_id`) REFERENCES `claro_workspace` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_5F89A385A76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_5F89A385FBE885E2` FOREIGN KEY (`widget_id`) REFERENCES `claro_widget` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_widget_instance`
--

LOCK TABLES `claro_widget_instance` WRITE;
/*!40000 ALTER TABLE `claro_widget_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_widget_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_workspace`
--

DROP TABLE IF EXISTS `claro_workspace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_workspace` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `displayable` tinyint(1) DEFAULT NULL,
  `guid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `self_registration` tinyint(1) DEFAULT NULL,
  `self_unregistration` tinyint(1) DEFAULT NULL,
  `discr` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lft` int(11) DEFAULT NULL,
  `lvl` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `root` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D902854577153098` (`code`),
  UNIQUE KEY `UNIQ_D90285452B6FCFB2` (`guid`),
  KEY `IDX_D9028545A76ED395` (`user_id`),
  KEY `IDX_D9028545727ACA70` (`parent_id`),
  CONSTRAINT `FK_D9028545727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `claro_workspace` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_D9028545A76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_workspace`
--

LOCK TABLES `claro_workspace` WRITE;
/*!40000 ALTER TABLE `claro_workspace` DISABLE KEYS */;
INSERT INTO `claro_workspace` VALUES (1,NULL,NULL,'Espace personnel','pernelle',NULL,NULL,'DEB59210-279B-4423-A538-9056D0448FD1',NULL,NULL,'Claroline\\CoreBundle\\Entity\\Workspace\\SimpleWorkspace',1,0,2,1),(2,NULL,NULL,'test','test',NULL,0,'35235C91-8ED9-4612-9AD0-09AD6CE610D8',0,1,'Claroline\\CoreBundle\\Entity\\Workspace\\SimpleWorkspace',1,0,2,2);
/*!40000 ALTER TABLE `claro_workspace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_workspace_aggregation`
--

DROP TABLE IF EXISTS `claro_workspace_aggregation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_workspace_aggregation` (
  `aggregator_workspace_id` int(11) NOT NULL,
  `simple_workspace_id` int(11) NOT NULL,
  PRIMARY KEY (`aggregator_workspace_id`,`simple_workspace_id`),
  KEY `IDX_D012AF0FA08DFE7A` (`aggregator_workspace_id`),
  KEY `IDX_D012AF0F782B5A3F` (`simple_workspace_id`),
  CONSTRAINT `FK_D012AF0F782B5A3F` FOREIGN KEY (`simple_workspace_id`) REFERENCES `claro_workspace` (`id`),
  CONSTRAINT `FK_D012AF0FA08DFE7A` FOREIGN KEY (`aggregator_workspace_id`) REFERENCES `claro_workspace` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_workspace_aggregation`
--

LOCK TABLES `claro_workspace_aggregation` WRITE;
/*!40000 ALTER TABLE `claro_workspace_aggregation` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_workspace_aggregation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_workspace_favourite`
--

DROP TABLE IF EXISTS `claro_workspace_favourite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_workspace_favourite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workspace_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workspace_favourite_unique_combination` (`workspace_id`,`user_id`),
  KEY `IDX_711A30B82D40A1F` (`workspace_id`),
  KEY `IDX_711A30BA76ED395` (`user_id`),
  CONSTRAINT `FK_711A30B82D40A1F` FOREIGN KEY (`workspace_id`) REFERENCES `claro_workspace` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_711A30BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_workspace_favourite`
--

LOCK TABLES `claro_workspace_favourite` WRITE;
/*!40000 ALTER TABLE `claro_workspace_favourite` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_workspace_favourite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_workspace_tag`
--

DROP TABLE IF EXISTS `claro_workspace_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_workspace_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_unique_name_and_user` (`user_id`,`name`),
  KEY `IDX_C8EFD7EFA76ED395` (`user_id`),
  CONSTRAINT `FK_C8EFD7EFA76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_workspace_tag`
--

LOCK TABLES `claro_workspace_tag` WRITE;
/*!40000 ALTER TABLE `claro_workspace_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_workspace_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_workspace_tag_hierarchy`
--

DROP TABLE IF EXISTS `claro_workspace_tag_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_workspace_tag_hierarchy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `tag_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A46B159EA76ED395` (`user_id`),
  KEY `IDX_A46B159EBAD26311` (`tag_id`),
  KEY `IDX_A46B159E727ACA70` (`parent_id`),
  CONSTRAINT `FK_A46B159E727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `claro_workspace_tag` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A46B159EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A46B159EBAD26311` FOREIGN KEY (`tag_id`) REFERENCES `claro_workspace_tag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_workspace_tag_hierarchy`
--

LOCK TABLES `claro_workspace_tag_hierarchy` WRITE;
/*!40000 ALTER TABLE `claro_workspace_tag_hierarchy` DISABLE KEYS */;
/*!40000 ALTER TABLE `claro_workspace_tag_hierarchy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claro_workspace_template`
--

DROP TABLE IF EXISTS `claro_workspace_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claro_workspace_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_94D0CBDBD1B862B8` (`hash`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claro_workspace_template`
--

LOCK TABLES `claro_workspace_template` WRITE;
/*!40000 ALTER TABLE `claro_workspace_template` DISABLE KEYS */;
INSERT INTO `claro_workspace_template` VALUES (1,'default.zip','default');
/*!40000 ALTER TABLE `claro_workspace_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_clarolineannouncementbundle_versions`
--

DROP TABLE IF EXISTS `doctrine_clarolineannouncementbundle_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctrine_clarolineannouncementbundle_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_clarolineannouncementbundle_versions`
--

LOCK TABLES `doctrine_clarolineannouncementbundle_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_clarolineannouncementbundle_versions` DISABLE KEYS */;
INSERT INTO `doctrine_clarolineannouncementbundle_versions` VALUES ('20130909095120');
/*!40000 ALTER TABLE `doctrine_clarolineannouncementbundle_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_clarolinecorebundle_versions`
--

DROP TABLE IF EXISTS `doctrine_clarolinecorebundle_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctrine_clarolinecorebundle_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_clarolinecorebundle_versions`
--

LOCK TABLES `doctrine_clarolinecorebundle_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_clarolinecorebundle_versions` DISABLE KEYS */;
INSERT INTO `doctrine_clarolinecorebundle_versions` VALUES ('20130913134332'),('20130915175811'),('20130915203447'),('20131010151055'),('20131020200726');
/*!40000 ALTER TABLE `doctrine_clarolinecorebundle_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_clarolineforumbundle_versions`
--

DROP TABLE IF EXISTS `doctrine_clarolineforumbundle_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctrine_clarolineforumbundle_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_clarolineforumbundle_versions`
--

LOCK TABLES `doctrine_clarolineforumbundle_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_clarolineforumbundle_versions` DISABLE KEYS */;
INSERT INTO `doctrine_clarolineforumbundle_versions` VALUES ('20130906115738'),('20131112143038');
/*!40000 ALTER TABLE `doctrine_clarolineforumbundle_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_clarolinerssreaderbundle_versions`
--

DROP TABLE IF EXISTS `doctrine_clarolinerssreaderbundle_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctrine_clarolinerssreaderbundle_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_clarolinerssreaderbundle_versions`
--

LOCK TABLES `doctrine_clarolinerssreaderbundle_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_clarolinerssreaderbundle_versions` DISABLE KEYS */;
INSERT INTO `doctrine_clarolinerssreaderbundle_versions` VALUES ('20130805110005'),('20130925173308');
/*!40000 ALTER TABLE `doctrine_clarolinerssreaderbundle_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_icapblogbundle_versions`
--

DROP TABLE IF EXISTS `doctrine_icapblogbundle_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctrine_icapblogbundle_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_icapblogbundle_versions`
--

LOCK TABLES `doctrine_icapblogbundle_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_icapblogbundle_versions` DISABLE KEYS */;
INSERT INTO `doctrine_icapblogbundle_versions` VALUES ('20130820133717'),('20131107161234'),('20131113113444');
/*!40000 ALTER TABLE `doctrine_icapblogbundle_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_icapdropzonebundle_versions`
--

DROP TABLE IF EXISTS `doctrine_icapdropzonebundle_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctrine_icapdropzonebundle_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_icapdropzonebundle_versions`
--

LOCK TABLES `doctrine_icapdropzonebundle_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_icapdropzonebundle_versions` DISABLE KEYS */;
INSERT INTO `doctrine_icapdropzonebundle_versions` VALUES ('20130927143036');
/*!40000 ALTER TABLE `doctrine_icapdropzonebundle_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_icaplessonbundle_versions`
--

DROP TABLE IF EXISTS `doctrine_icaplessonbundle_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctrine_icaplessonbundle_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_icaplessonbundle_versions`
--

LOCK TABLES `doctrine_icaplessonbundle_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_icaplessonbundle_versions` DISABLE KEYS */;
INSERT INTO `doctrine_icaplessonbundle_versions` VALUES ('20130923155308'),('20131030165411'),('20131113154806'),('20131113190717');
/*!40000 ALTER TABLE `doctrine_icaplessonbundle_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_icapwikibundle_versions`
--

DROP TABLE IF EXISTS `doctrine_icapwikibundle_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctrine_icapwikibundle_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_icapwikibundle_versions`
--

LOCK TABLES `doctrine_icapwikibundle_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_icapwikibundle_versions` DISABLE KEYS */;
INSERT INTO `doctrine_icapwikibundle_versions` VALUES ('20131003164704'),('20131028142219'),('20131031085945'),('20131104140647');
/*!40000 ALTER TABLE `doctrine_icapwikibundle_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_ujmexobundle_versions`
--

DROP TABLE IF EXISTS `doctrine_ujmexobundle_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctrine_ujmexobundle_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_ujmexobundle_versions`
--

LOCK TABLES `doctrine_ujmexobundle_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_ujmexobundle_versions` DISABLE KEYS */;
INSERT INTO `doctrine_ujmexobundle_versions` VALUES ('20130906113029');
/*!40000 ALTER TABLE `doctrine_ujmexobundle_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icap__blog`
--

DROP TABLE IF EXISTS `icap__blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icap__blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `infos` longtext COLLATE utf8_unicode_ci,
  `resourceNode_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_FD75E6C4B87FAB32` (`resourceNode_id`),
  CONSTRAINT `FK_FD75E6C4B87FAB32` FOREIGN KEY (`resourceNode_id`) REFERENCES `claro_resource_node` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icap__blog`
--

LOCK TABLES `icap__blog` WRITE;
/*!40000 ALTER TABLE `icap__blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `icap__blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icap__blog_comment`
--

DROP TABLE IF EXISTS `icap__blog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icap__blog_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `publication_date` datetime DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_95EB616FA76ED395` (`user_id`),
  KEY `IDX_95EB616F4B89032C` (`post_id`),
  CONSTRAINT `FK_95EB616F4B89032C` FOREIGN KEY (`post_id`) REFERENCES `icap__blog_post` (`id`),
  CONSTRAINT `FK_95EB616FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icap__blog_comment`
--

LOCK TABLES `icap__blog_comment` WRITE;
/*!40000 ALTER TABLE `icap__blog_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `icap__blog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icap__blog_options`
--

DROP TABLE IF EXISTS `icap__blog_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icap__blog_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) DEFAULT NULL,
  `authorize_comment` tinyint(1) NOT NULL,
  `authorize_anonymous_comment` tinyint(1) NOT NULL,
  `post_per_page` smallint(6) NOT NULL,
  `auto_publish_post` tinyint(1) NOT NULL,
  `auto_publish_comment` tinyint(1) NOT NULL,
  `display_title` tinyint(1) NOT NULL,
  `banner_activate` tinyint(1) NOT NULL,
  `banner_background_color` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `banner_height` smallint(6) NOT NULL,
  `banner_background_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner_background_image_position` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `banner_background_image_repeat` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D1AAC984DAE07E97` (`blog_id`),
  CONSTRAINT `FK_D1AAC984DAE07E97` FOREIGN KEY (`blog_id`) REFERENCES `icap__blog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icap__blog_options`
--

LOCK TABLES `icap__blog_options` WRITE;
/*!40000 ALTER TABLE `icap__blog_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `icap__blog_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icap__blog_post`
--

DROP TABLE IF EXISTS `icap__blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icap__blog_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `blog_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `modification_date` datetime NOT NULL,
  `publication_date` datetime DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1B067922989D9B62` (`slug`),
  KEY `IDX_1B067922A76ED395` (`user_id`),
  KEY `IDX_1B067922DAE07E97` (`blog_id`),
  CONSTRAINT `FK_1B067922A76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`),
  CONSTRAINT `FK_1B067922DAE07E97` FOREIGN KEY (`blog_id`) REFERENCES `icap__blog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icap__blog_post`
--

LOCK TABLES `icap__blog_post` WRITE;
/*!40000 ALTER TABLE `icap__blog_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `icap__blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icap__blog_post_tag`
--

DROP TABLE IF EXISTS `icap__blog_post_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icap__blog_post_tag` (
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`),
  KEY `IDX_C3C6F4794B89032C` (`post_id`),
  KEY `IDX_C3C6F479BAD26311` (`tag_id`),
  CONSTRAINT `FK_C3C6F4794B89032C` FOREIGN KEY (`post_id`) REFERENCES `icap__blog_post` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C3C6F479BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `icap__blog_tag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icap__blog_post_tag`
--

LOCK TABLES `icap__blog_post_tag` WRITE;
/*!40000 ALTER TABLE `icap__blog_post_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `icap__blog_post_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icap__blog_tag`
--

DROP TABLE IF EXISTS `icap__blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icap__blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8BE678285E237E06` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icap__blog_tag`
--

LOCK TABLES `icap__blog_tag` WRITE;
/*!40000 ALTER TABLE `icap__blog_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `icap__blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icap__dropzonebundle_correction`
--

DROP TABLE IF EXISTS `icap__dropzonebundle_correction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icap__dropzonebundle_correction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `drop_id` int(11) DEFAULT NULL,
  `drop_zone_id` int(11) NOT NULL,
  `total_grade` decimal(10,2) DEFAULT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `valid` tinyint(1) NOT NULL,
  `start_date` datetime NOT NULL,
  `last_open_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `finished` tinyint(1) NOT NULL,
  `editable` tinyint(1) NOT NULL,
  `reporter` tinyint(1) NOT NULL,
  `reportComment` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_CDA81F40A76ED395` (`user_id`),
  KEY `IDX_CDA81F404D224760` (`drop_id`),
  KEY `IDX_CDA81F40A8C6E7BD` (`drop_zone_id`),
  CONSTRAINT `FK_CDA81F404D224760` FOREIGN KEY (`drop_id`) REFERENCES `icap__dropzonebundle_drop` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_CDA81F40A76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`),
  CONSTRAINT `FK_CDA81F40A8C6E7BD` FOREIGN KEY (`drop_zone_id`) REFERENCES `icap__dropzonebundle_dropzone` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icap__dropzonebundle_correction`
--

LOCK TABLES `icap__dropzonebundle_correction` WRITE;
/*!40000 ALTER TABLE `icap__dropzonebundle_correction` DISABLE KEYS */;
/*!40000 ALTER TABLE `icap__dropzonebundle_correction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icap__dropzonebundle_criterion`
--

DROP TABLE IF EXISTS `icap__dropzonebundle_criterion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icap__dropzonebundle_criterion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drop_zone_id` int(11) NOT NULL,
  `instruction` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F94B3BA7A8C6E7BD` (`drop_zone_id`),
  CONSTRAINT `FK_F94B3BA7A8C6E7BD` FOREIGN KEY (`drop_zone_id`) REFERENCES `icap__dropzonebundle_dropzone` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icap__dropzonebundle_criterion`
--

LOCK TABLES `icap__dropzonebundle_criterion` WRITE;
/*!40000 ALTER TABLE `icap__dropzonebundle_criterion` DISABLE KEYS */;
/*!40000 ALTER TABLE `icap__dropzonebundle_criterion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icap__dropzonebundle_document`
--

DROP TABLE IF EXISTS `icap__dropzonebundle_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icap__dropzonebundle_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_node_id` int(11) DEFAULT NULL,
  `drop_id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_744084241BAD783F` (`resource_node_id`),
  KEY `IDX_744084244D224760` (`drop_id`),
  CONSTRAINT `FK_744084241BAD783F` FOREIGN KEY (`resource_node_id`) REFERENCES `claro_resource_node` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_744084244D224760` FOREIGN KEY (`drop_id`) REFERENCES `icap__dropzonebundle_drop` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icap__dropzonebundle_document`
--

LOCK TABLES `icap__dropzonebundle_document` WRITE;
/*!40000 ALTER TABLE `icap__dropzonebundle_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `icap__dropzonebundle_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icap__dropzonebundle_drop`
--

DROP TABLE IF EXISTS `icap__dropzonebundle_drop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icap__dropzonebundle_drop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drop_zone_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hidden_directory_id` int(11) DEFAULT NULL,
  `drop_date` datetime NOT NULL,
  `reported` tinyint(1) NOT NULL,
  `finished` tinyint(1) NOT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_drop_for_user_in_drop_zone` (`drop_zone_id`,`user_id`),
  UNIQUE KEY `unique_drop_number_in_drop_zone` (`drop_zone_id`,`number`),
  UNIQUE KEY `UNIQ_3AD19BA65342CDF` (`hidden_directory_id`),
  KEY `IDX_3AD19BA6A8C6E7BD` (`drop_zone_id`),
  KEY `IDX_3AD19BA6A76ED395` (`user_id`),
  CONSTRAINT `FK_3AD19BA65342CDF` FOREIGN KEY (`hidden_directory_id`) REFERENCES `claro_resource_node` (`id`),
  CONSTRAINT `FK_3AD19BA6A76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`),
  CONSTRAINT `FK_3AD19BA6A8C6E7BD` FOREIGN KEY (`drop_zone_id`) REFERENCES `icap__dropzonebundle_dropzone` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icap__dropzonebundle_drop`
--

LOCK TABLES `icap__dropzonebundle_drop` WRITE;
/*!40000 ALTER TABLE `icap__dropzonebundle_drop` DISABLE KEYS */;
/*!40000 ALTER TABLE `icap__dropzonebundle_drop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icap__dropzonebundle_dropzone`
--

DROP TABLE IF EXISTS `icap__dropzonebundle_dropzone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icap__dropzonebundle_dropzone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hidden_directory_id` int(11) DEFAULT NULL,
  `edition_state` smallint(6) NOT NULL,
  `instruction` longtext COLLATE utf8_unicode_ci,
  `allow_workspace_resource` tinyint(1) NOT NULL,
  `allow_upload` tinyint(1) NOT NULL,
  `allow_url` tinyint(1) NOT NULL,
  `allow_rich_text` tinyint(1) NOT NULL,
  `peer_review` tinyint(1) NOT NULL,
  `expected_total_correction` smallint(6) NOT NULL,
  `display_notation_to_learners` tinyint(1) NOT NULL,
  `display_notation_message_to_learners` tinyint(1) NOT NULL,
  `minimum_score_to_pass` double NOT NULL,
  `manual_planning` tinyint(1) NOT NULL,
  `manual_state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_allow_drop` datetime DEFAULT NULL,
  `end_allow_drop` datetime DEFAULT NULL,
  `start_review` datetime DEFAULT NULL,
  `end_review` datetime DEFAULT NULL,
  `allow_comment_in_correction` tinyint(1) NOT NULL,
  `total_criteria_column` smallint(6) NOT NULL,
  `resourceNode_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6782FC235342CDF` (`hidden_directory_id`),
  UNIQUE KEY `UNIQ_6782FC23B87FAB32` (`resourceNode_id`),
  CONSTRAINT `FK_6782FC235342CDF` FOREIGN KEY (`hidden_directory_id`) REFERENCES `claro_resource_node` (`id`),
  CONSTRAINT `FK_6782FC23B87FAB32` FOREIGN KEY (`resourceNode_id`) REFERENCES `claro_resource_node` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icap__dropzonebundle_dropzone`
--

LOCK TABLES `icap__dropzonebundle_dropzone` WRITE;
/*!40000 ALTER TABLE `icap__dropzonebundle_dropzone` DISABLE KEYS */;
INSERT INTO `icap__dropzonebundle_dropzone` VALUES (1,NULL,2,'',0,1,0,0,0,1,1,0,10,1,'notStarted',NULL,NULL,NULL,NULL,0,4,8);
/*!40000 ALTER TABLE `icap__dropzonebundle_dropzone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icap__dropzonebundle_grade`
--

DROP TABLE IF EXISTS `icap__dropzonebundle_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icap__dropzonebundle_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `criterion_id` int(11) NOT NULL,
  `correction_id` int(11) NOT NULL,
  `value` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_grade_for_criterion_and_correction` (`criterion_id`,`correction_id`),
  KEY `IDX_B3C52D9397766307` (`criterion_id`),
  KEY `IDX_B3C52D9394AE086B` (`correction_id`),
  CONSTRAINT `FK_B3C52D9394AE086B` FOREIGN KEY (`correction_id`) REFERENCES `icap__dropzonebundle_correction` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B3C52D9397766307` FOREIGN KEY (`criterion_id`) REFERENCES `icap__dropzonebundle_criterion` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icap__dropzonebundle_grade`
--

LOCK TABLES `icap__dropzonebundle_grade` WRITE;
/*!40000 ALTER TABLE `icap__dropzonebundle_grade` DISABLE KEYS */;
/*!40000 ALTER TABLE `icap__dropzonebundle_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icap__lesson`
--

DROP TABLE IF EXISTS `icap__lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icap__lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `root_id` int(11) DEFAULT NULL,
  `resourceNode_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D9B3613079066886` (`root_id`),
  UNIQUE KEY `UNIQ_D9B36130B87FAB32` (`resourceNode_id`),
  CONSTRAINT `FK_D9B3613079066886` FOREIGN KEY (`root_id`) REFERENCES `icap__lesson_chapter` (`id`),
  CONSTRAINT `FK_D9B36130B87FAB32` FOREIGN KEY (`resourceNode_id`) REFERENCES `claro_resource_node` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icap__lesson`
--

LOCK TABLES `icap__lesson` WRITE;
/*!40000 ALTER TABLE `icap__lesson` DISABLE KEYS */;
INSERT INTO `icap__lesson` VALUES (1,1,7);
/*!40000 ALTER TABLE `icap__lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icap__lesson_chapter`
--

DROP TABLE IF EXISTS `icap__lesson_chapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icap__lesson_chapter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lesson_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8_unicode_ci,
  `lft` int(11) NOT NULL,
  `lvl` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `root` int(11) DEFAULT NULL,
  `slug` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_3D7E3C8C989D9B62` (`slug`),
  KEY `IDX_3D7E3C8CCDF80196` (`lesson_id`),
  KEY `IDX_3D7E3C8C727ACA70` (`parent_id`),
  CONSTRAINT `FK_3D7E3C8C727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `icap__lesson_chapter` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_3D7E3C8CCDF80196` FOREIGN KEY (`lesson_id`) REFERENCES `icap__lesson` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icap__lesson_chapter`
--

LOCK TABLES `icap__lesson_chapter` WRITE;
/*!40000 ALTER TABLE `icap__lesson_chapter` DISABLE KEYS */;
INSERT INTO `icap__lesson_chapter` VALUES (1,1,NULL,'root_1',NULL,1,0,2,1,'root-1');
/*!40000 ALTER TABLE `icap__lesson_chapter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icap__wiki`
--

DROP TABLE IF EXISTS `icap__wiki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icap__wiki` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `root_id` int(11) DEFAULT NULL,
  `resourceNode_id` int(11) DEFAULT NULL,
  `mode` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1FAD6B8179066886` (`root_id`),
  UNIQUE KEY `UNIQ_1FAD6B81B87FAB32` (`resourceNode_id`),
  CONSTRAINT `FK_1FAD6B8179066886` FOREIGN KEY (`root_id`) REFERENCES `icap__wiki_section` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_1FAD6B81B87FAB32` FOREIGN KEY (`resourceNode_id`) REFERENCES `claro_resource_node` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icap__wiki`
--

LOCK TABLES `icap__wiki` WRITE;
/*!40000 ALTER TABLE `icap__wiki` DISABLE KEYS */;
INSERT INTO `icap__wiki` VALUES (1,1,3,NULL);
/*!40000 ALTER TABLE `icap__wiki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icap__wiki_contribution`
--

DROP TABLE IF EXISTS `icap__wiki_contribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icap__wiki_contribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `section_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` longtext COLLATE utf8_unicode_ci,
  `creation_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_781E6502A76ED395` (`user_id`),
  KEY `IDX_781E6502D823E37A` (`section_id`),
  CONSTRAINT `FK_781E6502A76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`),
  CONSTRAINT `FK_781E6502D823E37A` FOREIGN KEY (`section_id`) REFERENCES `icap__wiki_section` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icap__wiki_contribution`
--

LOCK TABLES `icap__wiki_contribution` WRITE;
/*!40000 ALTER TABLE `icap__wiki_contribution` DISABLE KEYS */;
INSERT INTO `icap__wiki_contribution` VALUES (1,1,1,NULL,NULL,'2013-11-25 11:03:53');
/*!40000 ALTER TABLE `icap__wiki_contribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icap__wiki_section`
--

DROP TABLE IF EXISTS `icap__wiki_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icap__wiki_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `wiki_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL,
  `creation_date` datetime NOT NULL,
  `lft` int(11) NOT NULL,
  `lvl` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `root` int(11) DEFAULT NULL,
  `active_contribution_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `deletion_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_82904AAFE665925` (`active_contribution_id`),
  KEY `IDX_82904AAA76ED395` (`user_id`),
  KEY `IDX_82904AAAA948DBE` (`wiki_id`),
  KEY `IDX_82904AA727ACA70` (`parent_id`),
  CONSTRAINT `FK_82904AA727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `icap__wiki_section` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_82904AAA76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`),
  CONSTRAINT `FK_82904AAAA948DBE` FOREIGN KEY (`wiki_id`) REFERENCES `icap__wiki` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_82904AAFE665925` FOREIGN KEY (`active_contribution_id`) REFERENCES `icap__wiki_contribution` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icap__wiki_section`
--

LOCK TABLES `icap__wiki_section` WRITE;
/*!40000 ALTER TABLE `icap__wiki_section` DISABLE KEYS */;
INSERT INTO `icap__wiki_section` VALUES (1,1,1,NULL,1,'2013-11-25 11:03:53',1,0,2,1,1,0,NULL);
/*!40000 ALTER TABLE `icap__wiki_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_text_dekstop_widget_config`
--

DROP TABLE IF EXISTS `simple_text_dekstop_widget_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simple_text_dekstop_widget_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BAB9695A76ED395` (`user_id`),
  CONSTRAINT `FK_BAB9695A76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_text_dekstop_widget_config`
--

LOCK TABLES `simple_text_dekstop_widget_config` WRITE;
/*!40000 ALTER TABLE `simple_text_dekstop_widget_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `simple_text_dekstop_widget_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_text_workspace_widget_config`
--

DROP TABLE IF EXISTS `simple_text_workspace_widget_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simple_text_workspace_widget_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workspace_id` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_11925ED382D40A1F` (`workspace_id`),
  CONSTRAINT `FK_11925ED382D40A1F` FOREIGN KEY (`workspace_id`) REFERENCES `claro_workspace` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_text_workspace_widget_config`
--

LOCK TABLES `simple_text_workspace_widget_config` WRITE;
/*!40000 ALTER TABLE `simple_text_workspace_widget_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `simple_text_workspace_widget_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujm_category`
--

DROP TABLE IF EXISTS `ujm_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujm_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9FDB39F8A76ED395` (`user_id`),
  CONSTRAINT `FK_9FDB39F8A76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujm_category`
--

LOCK TABLES `ujm_category` WRITE;
/*!40000 ALTER TABLE `ujm_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujm_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujm_choice`
--

DROP TABLE IF EXISTS `ujm_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujm_choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interaction_qcm_id` int(11) DEFAULT NULL,
  `label` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ordre` int(11) NOT NULL,
  `weight` double DEFAULT NULL,
  `feedback` longtext COLLATE utf8_unicode_ci,
  `right_response` tinyint(1) DEFAULT NULL,
  `position_force` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D4BDFA959DBF539` (`interaction_qcm_id`),
  CONSTRAINT `FK_D4BDFA959DBF539` FOREIGN KEY (`interaction_qcm_id`) REFERENCES `ujm_interaction_qcm` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujm_choice`
--

LOCK TABLES `ujm_choice` WRITE;
/*!40000 ALTER TABLE `ujm_choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujm_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujm_coords`
--

DROP TABLE IF EXISTS `ujm_coords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujm_coords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interaction_graphic_id` int(11) DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shape` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `score_coords` double NOT NULL,
  `size` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CD7B49827876D500` (`interaction_graphic_id`),
  CONSTRAINT `FK_CD7B49827876D500` FOREIGN KEY (`interaction_graphic_id`) REFERENCES `ujm_interaction_graphic` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujm_coords`
--

LOCK TABLES `ujm_coords` WRITE;
/*!40000 ALTER TABLE `ujm_coords` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujm_coords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujm_document`
--

DROP TABLE IF EXISTS `ujm_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujm_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_41FEAA4FA76ED395` (`user_id`),
  CONSTRAINT `FK_41FEAA4FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujm_document`
--

LOCK TABLES `ujm_document` WRITE;
/*!40000 ALTER TABLE `ujm_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujm_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujm_document_interaction`
--

DROP TABLE IF EXISTS `ujm_document_interaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujm_document_interaction` (
  `interaction_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  PRIMARY KEY (`interaction_id`,`document_id`),
  KEY `IDX_FF792E7A886DEE8F` (`interaction_id`),
  KEY `IDX_FF792E7AC33F7837` (`document_id`),
  CONSTRAINT `FK_FF792E7A886DEE8F` FOREIGN KEY (`interaction_id`) REFERENCES `ujm_interaction` (`id`),
  CONSTRAINT `FK_FF792E7AC33F7837` FOREIGN KEY (`document_id`) REFERENCES `ujm_document` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujm_document_interaction`
--

LOCK TABLES `ujm_document_interaction` WRITE;
/*!40000 ALTER TABLE `ujm_document_interaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujm_document_interaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujm_document_question`
--

DROP TABLE IF EXISTS `ujm_document_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujm_document_question` (
  `question_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  PRIMARY KEY (`question_id`,`document_id`),
  KEY `IDX_52D4A3F11E27F6BF` (`question_id`),
  KEY `IDX_52D4A3F1C33F7837` (`document_id`),
  CONSTRAINT `FK_52D4A3F11E27F6BF` FOREIGN KEY (`question_id`) REFERENCES `ujm_question` (`id`),
  CONSTRAINT `FK_52D4A3F1C33F7837` FOREIGN KEY (`document_id`) REFERENCES `ujm_document` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujm_document_question`
--

LOCK TABLES `ujm_document_question` WRITE;
/*!40000 ALTER TABLE `ujm_document_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujm_document_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujm_exercise`
--

DROP TABLE IF EXISTS `ujm_exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujm_exercise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `shuffle` tinyint(1) DEFAULT NULL,
  `nb_question` int(11) NOT NULL,
  `date_create` datetime NOT NULL,
  `duration` int(11) NOT NULL,
  `nb_question_page` int(11) NOT NULL,
  `doprint` tinyint(1) DEFAULT NULL,
  `max_attempts` int(11) NOT NULL,
  `correction_mode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_correction` datetime DEFAULT NULL,
  `mark_mode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `use_date_end` tinyint(1) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `disp_button_interrupt` tinyint(1) DEFAULT NULL,
  `lock_attempt` tinyint(1) DEFAULT NULL,
  `resourceNode_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_374DF525B87FAB32` (`resourceNode_id`),
  CONSTRAINT `FK_374DF525B87FAB32` FOREIGN KEY (`resourceNode_id`) REFERENCES `claro_resource_node` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujm_exercise`
--

LOCK TABLES `ujm_exercise` WRITE;
/*!40000 ALTER TABLE `ujm_exercise` DISABLE KEYS */;
INSERT INTO `ujm_exercise` VALUES (1,'essai3',NULL,0,0,'2013-11-25 14:08:45',0,1,0,0,'1','2013-11-25 02:08:39','1','2013-11-25 02:08:39',0,'2013-11-25 02:08:39',0,0,6),(2,'exo',NULL,0,0,'2013-11-28 21:27:07',0,1,0,0,'1','2013-11-28 09:27:03','1','2013-11-28 09:27:03',0,'2013-11-28 09:27:03',0,0,9);
/*!40000 ALTER TABLE `ujm_exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujm_exercise_group`
--

DROP TABLE IF EXISTS `ujm_exercise_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujm_exercise_group` (
  `exercise_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`exercise_id`,`group_id`),
  KEY `IDX_78179004E934951A` (`exercise_id`),
  KEY `IDX_78179004FE54D947` (`group_id`),
  CONSTRAINT `FK_78179004E934951A` FOREIGN KEY (`exercise_id`) REFERENCES `ujm_exercise` (`id`),
  CONSTRAINT `FK_78179004FE54D947` FOREIGN KEY (`group_id`) REFERENCES `ujm_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujm_exercise_group`
--

LOCK TABLES `ujm_exercise_group` WRITE;
/*!40000 ALTER TABLE `ujm_exercise_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujm_exercise_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujm_exercise_question`
--

DROP TABLE IF EXISTS `ujm_exercise_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujm_exercise_question` (
  `exercise_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `ordre` int(11) NOT NULL,
  PRIMARY KEY (`exercise_id`,`question_id`),
  KEY `IDX_DB79F240E934951A` (`exercise_id`),
  KEY `IDX_DB79F2401E27F6BF` (`question_id`),
  CONSTRAINT `FK_DB79F2401E27F6BF` FOREIGN KEY (`question_id`) REFERENCES `ujm_question` (`id`),
  CONSTRAINT `FK_DB79F240E934951A` FOREIGN KEY (`exercise_id`) REFERENCES `ujm_exercise` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujm_exercise_question`
--

LOCK TABLES `ujm_exercise_question` WRITE;
/*!40000 ALTER TABLE `ujm_exercise_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujm_exercise_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujm_expertise`
--

DROP TABLE IF EXISTS `ujm_expertise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujm_expertise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujm_expertise`
--

LOCK TABLES `ujm_expertise` WRITE;
/*!40000 ALTER TABLE `ujm_expertise` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujm_expertise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujm_expertise_user`
--

DROP TABLE IF EXISTS `ujm_expertise_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujm_expertise_user` (
  `expertise_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`expertise_id`,`user_id`),
  KEY `IDX_F60D61B9D5B92F9` (`expertise_id`),
  KEY `IDX_F60D61BA76ED395` (`user_id`),
  CONSTRAINT `FK_F60D61B9D5B92F9` FOREIGN KEY (`expertise_id`) REFERENCES `ujm_expertise` (`id`),
  CONSTRAINT `FK_F60D61BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujm_expertise_user`
--

LOCK TABLES `ujm_expertise_user` WRITE;
/*!40000 ALTER TABLE `ujm_expertise_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujm_expertise_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujm_group`
--

DROP TABLE IF EXISTS `ujm_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujm_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujm_group`
--

LOCK TABLES `ujm_group` WRITE;
/*!40000 ALTER TABLE `ujm_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujm_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujm_hint`
--

DROP TABLE IF EXISTS `ujm_hint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujm_hint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interaction_id` int(11) DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `penalty` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B5FFCBE7886DEE8F` (`interaction_id`),
  CONSTRAINT `FK_B5FFCBE7886DEE8F` FOREIGN KEY (`interaction_id`) REFERENCES `ujm_interaction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujm_hint`
--

LOCK TABLES `ujm_hint` WRITE;
/*!40000 ALTER TABLE `ujm_hint` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujm_hint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujm_hole`
--

DROP TABLE IF EXISTS `ujm_hole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujm_hole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interaction_hole_id` int(11) DEFAULT NULL,
  `size` int(11) NOT NULL,
  `score` double NOT NULL,
  `position` int(11) NOT NULL,
  `orthography` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E9F4F52575EBD64D` (`interaction_hole_id`),
  CONSTRAINT `FK_E9F4F52575EBD64D` FOREIGN KEY (`interaction_hole_id`) REFERENCES `ujm_interaction_hole` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujm_hole`
--

LOCK TABLES `ujm_hole` WRITE;
/*!40000 ALTER TABLE `ujm_hole` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujm_hole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujm_interaction`
--

DROP TABLE IF EXISTS `ujm_interaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujm_interaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `invite` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ordre` int(11) DEFAULT NULL,
  `feedback` longtext COLLATE utf8_unicode_ci,
  `locked_expertise` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E7D801641E27F6BF` (`question_id`),
  CONSTRAINT `FK_E7D801641E27F6BF` FOREIGN KEY (`question_id`) REFERENCES `ujm_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujm_interaction`
--

LOCK TABLES `ujm_interaction` WRITE;
/*!40000 ALTER TABLE `ujm_interaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujm_interaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujm_interaction_graphic`
--

DROP TABLE IF EXISTS `ujm_interaction_graphic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujm_interaction_graphic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interaction_id` int(11) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9EBD442F886DEE8F` (`interaction_id`),
  KEY `IDX_9EBD442FC33F7837` (`document_id`),
  CONSTRAINT `FK_9EBD442F886DEE8F` FOREIGN KEY (`interaction_id`) REFERENCES `ujm_interaction` (`id`),
  CONSTRAINT `FK_9EBD442FC33F7837` FOREIGN KEY (`document_id`) REFERENCES `ujm_document` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujm_interaction_graphic`
--

LOCK TABLES `ujm_interaction_graphic` WRITE;
/*!40000 ALTER TABLE `ujm_interaction_graphic` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujm_interaction_graphic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujm_interaction_hole`
--

DROP TABLE IF EXISTS `ujm_interaction_hole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujm_interaction_hole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interaction_id` int(11) DEFAULT NULL,
  `html` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_7343FAC1886DEE8F` (`interaction_id`),
  CONSTRAINT `FK_7343FAC1886DEE8F` FOREIGN KEY (`interaction_id`) REFERENCES `ujm_interaction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujm_interaction_hole`
--

LOCK TABLES `ujm_interaction_hole` WRITE;
/*!40000 ALTER TABLE `ujm_interaction_hole` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujm_interaction_hole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujm_interaction_open`
--

DROP TABLE IF EXISTS `ujm_interaction_open`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujm_interaction_open` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interaction_id` int(11) DEFAULT NULL,
  `typeopenquestion_id` int(11) DEFAULT NULL,
  `orthography_correct` tinyint(1) NOT NULL,
  `scoreMaxLongResp` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_BFFE44F4886DEE8F` (`interaction_id`),
  KEY `IDX_BFFE44F46AFD3CF` (`typeopenquestion_id`),
  CONSTRAINT `FK_BFFE44F46AFD3CF` FOREIGN KEY (`typeopenquestion_id`) REFERENCES `ujm_type_open_question` (`id`),
  CONSTRAINT `FK_BFFE44F4886DEE8F` FOREIGN KEY (`interaction_id`) REFERENCES `ujm_interaction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujm_interaction_open`
--

LOCK TABLES `ujm_interaction_open` WRITE;
/*!40000 ALTER TABLE `ujm_interaction_open` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujm_interaction_open` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujm_interaction_qcm`
--

DROP TABLE IF EXISTS `ujm_interaction_qcm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujm_interaction_qcm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interaction_id` int(11) DEFAULT NULL,
  `type_qcm_id` int(11) DEFAULT NULL,
  `shuffle` tinyint(1) DEFAULT NULL,
  `score_right_response` double DEFAULT NULL,
  `score_false_response` double DEFAULT NULL,
  `weight_response` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_58C3D5A1886DEE8F` (`interaction_id`),
  KEY `IDX_58C3D5A1DCB52A9E` (`type_qcm_id`),
  CONSTRAINT `FK_58C3D5A1886DEE8F` FOREIGN KEY (`interaction_id`) REFERENCES `ujm_interaction` (`id`),
  CONSTRAINT `FK_58C3D5A1DCB52A9E` FOREIGN KEY (`type_qcm_id`) REFERENCES `ujm_type_qcm` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujm_interaction_qcm`
--

LOCK TABLES `ujm_interaction_qcm` WRITE;
/*!40000 ALTER TABLE `ujm_interaction_qcm` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujm_interaction_qcm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujm_link_hint_paper`
--

DROP TABLE IF EXISTS `ujm_link_hint_paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujm_link_hint_paper` (
  `hint_id` int(11) NOT NULL,
  `paper_id` int(11) NOT NULL,
  `view` tinyint(1) NOT NULL,
  PRIMARY KEY (`hint_id`,`paper_id`),
  KEY `IDX_B76F00F9519161AB` (`hint_id`),
  KEY `IDX_B76F00F9E6758861` (`paper_id`),
  CONSTRAINT `FK_B76F00F9519161AB` FOREIGN KEY (`hint_id`) REFERENCES `ujm_hint` (`id`),
  CONSTRAINT `FK_B76F00F9E6758861` FOREIGN KEY (`paper_id`) REFERENCES `ujm_paper` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujm_link_hint_paper`
--

LOCK TABLES `ujm_link_hint_paper` WRITE;
/*!40000 ALTER TABLE `ujm_link_hint_paper` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujm_link_hint_paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujm_lock_attempt`
--

DROP TABLE IF EXISTS `ujm_lock_attempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujm_lock_attempt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paper_id` int(11) DEFAULT NULL,
  `key_lock` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7A7CDF96E6758861` (`paper_id`),
  CONSTRAINT `FK_7A7CDF96E6758861` FOREIGN KEY (`paper_id`) REFERENCES `ujm_paper` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujm_lock_attempt`
--

LOCK TABLES `ujm_lock_attempt` WRITE;
/*!40000 ALTER TABLE `ujm_lock_attempt` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujm_lock_attempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujm_paper`
--

DROP TABLE IF EXISTS `ujm_paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujm_paper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `exercise_id` int(11) DEFAULT NULL,
  `num_paper` int(11) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `ordre_question` longtext COLLATE utf8_unicode_ci,
  `archive` tinyint(1) DEFAULT NULL,
  `date_archive` date DEFAULT NULL,
  `interupt` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_82972E4BA76ED395` (`user_id`),
  KEY `IDX_82972E4BE934951A` (`exercise_id`),
  CONSTRAINT `FK_82972E4BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`),
  CONSTRAINT `FK_82972E4BE934951A` FOREIGN KEY (`exercise_id`) REFERENCES `ujm_exercise` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujm_paper`
--

LOCK TABLES `ujm_paper` WRITE;
/*!40000 ALTER TABLE `ujm_paper` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujm_paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujm_planning`
--

DROP TABLE IF EXISTS `ujm_planning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujm_planning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4D0E9FCFFE54D947` (`group_id`),
  CONSTRAINT `FK_4D0E9FCFFE54D947` FOREIGN KEY (`group_id`) REFERENCES `ujm_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujm_planning`
--

LOCK TABLES `ujm_planning` WRITE;
/*!40000 ALTER TABLE `ujm_planning` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujm_planning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujm_question`
--

DROP TABLE IF EXISTS `ujm_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujm_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expertise_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `date_create` datetime NOT NULL,
  `date_modify` datetime DEFAULT NULL,
  `locked` tinyint(1) DEFAULT NULL,
  `model` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2F6069779D5B92F9` (`expertise_id`),
  KEY `IDX_2F606977A76ED395` (`user_id`),
  KEY `IDX_2F60697712469DE2` (`category_id`),
  CONSTRAINT `FK_2F60697712469DE2` FOREIGN KEY (`category_id`) REFERENCES `ujm_category` (`id`),
  CONSTRAINT `FK_2F6069779D5B92F9` FOREIGN KEY (`expertise_id`) REFERENCES `ujm_expertise` (`id`),
  CONSTRAINT `FK_2F606977A76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujm_question`
--

LOCK TABLES `ujm_question` WRITE;
/*!40000 ALTER TABLE `ujm_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujm_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujm_response`
--

DROP TABLE IF EXISTS `ujm_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujm_response` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paper_id` int(11) DEFAULT NULL,
  `interaction_id` int(11) DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mark` double NOT NULL,
  `nb_tries` int(11) NOT NULL,
  `response` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_A7EC2BC2E6758861` (`paper_id`),
  KEY `IDX_A7EC2BC2886DEE8F` (`interaction_id`),
  CONSTRAINT `FK_A7EC2BC2886DEE8F` FOREIGN KEY (`interaction_id`) REFERENCES `ujm_interaction` (`id`),
  CONSTRAINT `FK_A7EC2BC2E6758861` FOREIGN KEY (`paper_id`) REFERENCES `ujm_paper` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujm_response`
--

LOCK TABLES `ujm_response` WRITE;
/*!40000 ALTER TABLE `ujm_response` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujm_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujm_share`
--

DROP TABLE IF EXISTS `ujm_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujm_share` (
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `allowToModify` tinyint(1) NOT NULL,
  PRIMARY KEY (`user_id`,`question_id`),
  KEY `IDX_238BD307A76ED395` (`user_id`),
  KEY `IDX_238BD3071E27F6BF` (`question_id`),
  CONSTRAINT `FK_238BD3071E27F6BF` FOREIGN KEY (`question_id`) REFERENCES `ujm_question` (`id`),
  CONSTRAINT `FK_238BD307A76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujm_share`
--

LOCK TABLES `ujm_share` WRITE;
/*!40000 ALTER TABLE `ujm_share` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujm_share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujm_subscription`
--

DROP TABLE IF EXISTS `ujm_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujm_subscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `exercise_id` int(11) DEFAULT NULL,
  `creator` tinyint(1) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A17BA225A76ED395` (`user_id`),
  KEY `IDX_A17BA225E934951A` (`exercise_id`),
  CONSTRAINT `FK_A17BA225A76ED395` FOREIGN KEY (`user_id`) REFERENCES `claro_user` (`id`),
  CONSTRAINT `FK_A17BA225E934951A` FOREIGN KEY (`exercise_id`) REFERENCES `ujm_exercise` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujm_subscription`
--

LOCK TABLES `ujm_subscription` WRITE;
/*!40000 ALTER TABLE `ujm_subscription` DISABLE KEYS */;
INSERT INTO `ujm_subscription` VALUES (1,1,1,1,1),(2,1,2,1,1);
/*!40000 ALTER TABLE `ujm_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujm_type_open_question`
--

DROP TABLE IF EXISTS `ujm_type_open_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujm_type_open_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujm_type_open_question`
--

LOCK TABLES `ujm_type_open_question` WRITE;
/*!40000 ALTER TABLE `ujm_type_open_question` DISABLE KEYS */;
INSERT INTO `ujm_type_open_question` VALUES (1,'numerical'),(2,'long'),(3,'short'),(4,'oneWord');
/*!40000 ALTER TABLE `ujm_type_open_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujm_type_qcm`
--

DROP TABLE IF EXISTS `ujm_type_qcm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujm_type_qcm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujm_type_qcm`
--

LOCK TABLES `ujm_type_qcm` WRITE;
/*!40000 ALTER TABLE `ujm_type_qcm` DISABLE KEYS */;
INSERT INTO `ujm_type_qcm` VALUES (1,'Multiple response'),(2,'Unique response');
/*!40000 ALTER TABLE `ujm_type_qcm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujm_unit`
--

DROP TABLE IF EXISTS `ujm_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujm_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujm_unit`
--

LOCK TABLES `ujm_unit` WRITE;
/*!40000 ALTER TABLE `ujm_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujm_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujm_word_response`
--

DROP TABLE IF EXISTS `ujm_word_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujm_word_response` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interaction_open_id` int(11) DEFAULT NULL,
  `hole_id` int(11) DEFAULT NULL,
  `response` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `score` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4E1930C598DDBDFD` (`interaction_open_id`),
  KEY `IDX_4E1930C515ADE12C` (`hole_id`),
  CONSTRAINT `FK_4E1930C515ADE12C` FOREIGN KEY (`hole_id`) REFERENCES `ujm_hole` (`id`),
  CONSTRAINT `FK_4E1930C598DDBDFD` FOREIGN KEY (`interaction_open_id`) REFERENCES `ujm_interaction_open` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujm_word_response`
--

LOCK TABLES `ujm_word_response` WRITE;
/*!40000 ALTER TABLE `ujm_word_response` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujm_word_response` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-05 14:11:16
