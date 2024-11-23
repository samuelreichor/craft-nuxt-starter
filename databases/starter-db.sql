-- MySQL dump 10.13  Distrib 8.0.36, for Linux (aarch64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `addressLine3` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vjjljhaevqtyfqxjxibrmgzjlyqqkcqhmozm` (`primaryOwnerId`),
  CONSTRAINT `fk_tfpaoakmdqkihpivqpzcgbrpujzrmctpgpcg` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vjjljhaevqtyfqxjxibrmgzjlyqqkcqhmozm` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_warlfyzdqjrfidutkgjhnkihhttjehldifhk` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_yuiykipixbhutbdqyfltifhznbbwjwgtbyqi` (`dateRead`),
  KEY `fk_mebnsonszfeknjjpafmlgovsxxotopwfipnl` (`pluginId`),
  CONSTRAINT `fk_hbnzahhzzrgksqxgtzjgfcfsdtlsxiypuyhy` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mebnsonszfeknjjpafmlgovsxxotopwfipnl` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xaradsljidmwspidqkzgllqegcwsyuljssma` (`sessionId`,`volumeId`),
  KEY `idx_tuguixhgtudqkzkvbuwhqmjifdglhbfdrjjm` (`volumeId`),
  CONSTRAINT `fk_ewhszhddwctirvhhljzcfhkubzvgwlkwmkjw` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kuzbeveanuzjkyraytzgyasjoiolamvrzxlf` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_yvahoyysrdxwloofuzbepswarlgjxeskqsab` (`filename`,`folderId`),
  KEY `idx_woainrqujxibiqfoesaxvyagenhwhadxakap` (`folderId`),
  KEY `idx_voleyprqgqupnkrgfxdsyfrrubwbetgdeyll` (`volumeId`),
  KEY `fk_lebmtxuudnyugvuuqvafybgtwehtsqbsyfla` (`uploaderId`),
  CONSTRAINT `fk_jxznmnbfftortktgtitahcauwhbpbnqyrbtb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lebmtxuudnyugvuuqvafybgtwehtsqbsyfla` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tphwtscrfttpdnxvkkywdvdteievpbxjyryq` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xzufpennshodjsyvukvscximiqksjhpzfpkc` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets_sites`
--

DROP TABLE IF EXISTS `assets_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_sites` (
  `assetId` int NOT NULL,
  `siteId` int NOT NULL,
  `alt` text,
  PRIMARY KEY (`assetId`,`siteId`),
  KEY `fk_ehjbofeukczleyrfjsocompobqehypuybqvs` (`siteId`),
  CONSTRAINT `fk_ehjbofeukczleyrfjsocompobqehypuybqvs` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_oswylvfkzfvmxsdnezmqpfgromfyjskemzbk` FOREIGN KEY (`assetId`) REFERENCES `assets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `authenticator`
--

DROP TABLE IF EXISTS `authenticator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authenticator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `auth2faSecret` varchar(255) DEFAULT NULL,
  `oldTimestamp` int unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hqcvutaoshaitftpksjljrkqpkpfuurrmgda` (`userId`),
  CONSTRAINT `fk_hqcvutaoshaitftpksjljrkqpkpfuurrmgda` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_psqdofxkbizhjiirjcngnbkzxpfhdvsktmub` (`groupId`),
  KEY `fk_mkxyljcweuicuynahoxuhvrajrozmyqkptab` (`parentId`),
  CONSTRAINT `fk_mkxyljcweuicuynahoxuhvrajrozmyqkptab` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_qgwjeoujhosbzotnnybstfgzlehlpsdssvpl` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zuridjjjrstujzbnxqhplrktxtrsjrmvqvfs` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vexkfhrvxfzfgwgxzpbcofarksckihjgojgm` (`name`),
  KEY `idx_skmkqgbvtoxxodltbspsyhhgxpeauuwdnryw` (`handle`),
  KEY `idx_koefivzqwklcasdglwpgftxgbxbplmcgfrax` (`structureId`),
  KEY `idx_tqwkvpwquerrlecwjwfaopvqvrhhkybgaxyz` (`fieldLayoutId`),
  KEY `idx_hnrnllhifeocodmfocmuhexnbpqsbthkleyw` (`dateDeleted`),
  CONSTRAINT `fk_jzsbbmqsdkyuvorlqpvfnrfqbzltnjrpnwoo` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_lmjdhyhdchywydrjvrgkhrsbfynnhgnqunfe` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_djnnswbcaxbhuysrkqdlelcxsmgxueeurrzl` (`groupId`,`siteId`),
  KEY `idx_jhgelmjdzwiczjcjbzffcwpvajyjypwwnqjp` (`siteId`),
  CONSTRAINT `fk_uqyaetidlfvutggriokdketruxebrrezonwb` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wkrvlwbrpkasazdapypmbfqyslpvrsrunnom` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_xuyeuzbsyhxkbsiwehuvbxkvuevfjorthhos` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_glrvswshylebdyvogsivigqkacvswecdpqbo` (`siteId`),
  KEY `fk_rcoaeiqpzigplnssnclmzxscetzzxptmjqyn` (`userId`),
  CONSTRAINT `fk_glrvswshylebdyvogsivigqkacvswecdpqbo` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mgqqiqedxnlfmcrqsegqudxguemnixrdrafy` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rcoaeiqpzigplnssnclmzxscetzzxptmjqyn` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `layoutElementUid` char(36) NOT NULL DEFAULT '0',
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`,`layoutElementUid`),
  KEY `idx_xqpeheltqwabnbpmvcafpvmztbjlckeorlyt` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_oicuzqefkrfzmisiaypjmiihudjfetcfxair` (`siteId`),
  KEY `fk_sqccydvzbjnmrfjroxlptrckgaqqppbiccit` (`fieldId`),
  KEY `fk_ufccvxdezltkyyemmkihmfgybgkqqbjgokrx` (`userId`),
  CONSTRAINT `fk_oicuzqefkrfzmisiaypjmiihudjfetcfxair` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sqccydvzbjnmrfjroxlptrckgaqqppbiccit` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ufccvxdezltkyyemmkihmfgybgkqqbjgokrx` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_znsixkjxacfdkeuqcwjllbfugcrxgeruhufx` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_jjhrkpqwnkfibwsdtahyxwmtlxblflrydryj` (`userId`),
  CONSTRAINT `fk_jjhrkpqwnkfibwsdtahyxwmtlxblflrydryj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text,
  `traces` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gsqclcdgwqftwiaftqqlgkhegncbmnrzwvrt` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_vjdhrqxgzgocendinkxjpnmkgpnlzlclorux` (`creatorId`,`provisional`),
  KEY `idx_apqkaihmvfhqpgdhdtnvnkyifmrovkljqwqi` (`saved`),
  KEY `fk_ldvcbjvggdxetpxzjrouzrexoidcotokniir` (`canonicalId`),
  CONSTRAINT `fk_ldvcbjvggdxetpxzjrouzrexoidcotokniir` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_onyyhdhndkugohrlfjlvzyqcwotjldxsxgzx` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_cbxbcjswezusgiohhypgsptfvdribcjznxuo` (`elementId`,`timestamp`,`userId`),
  KEY `fk_oisqylpzrdqocerwthokvpfrcuwqslinitfu` (`userId`),
  KEY `fk_ghvcgdrlhhgrntvkaghfrjulkrbevxcqixjq` (`siteId`),
  KEY `fk_iypqfdzvhaggylxkmiwhxilfgmjweljfpkrf` (`draftId`),
  CONSTRAINT `fk_ghvcgdrlhhgrntvkaghfrjulkrbevxcqixjq` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_iypqfdzvhaggylxkmiwhxilfgmjweljfpkrf` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oisqylpzrdqocerwthokvpfrcuwqslinitfu` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zxeyjjuxxxekerndsoaweepnkweizuvzccaz` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ahffiuzuhgzuypvnwnalemkhdufgpwvqkgyr` (`dateDeleted`),
  KEY `idx_aqvbdwfhqartcoebcbrwskdiivkzmmggoiqy` (`fieldLayoutId`),
  KEY `idx_ortiduajccmsnotvyjkygpswqdoqnydbvavc` (`type`),
  KEY `idx_fftdkocsegyvizxpdbwpchxjvtwmuowipzkx` (`enabled`),
  KEY `idx_ugtwynnvecnzhfpzbbhusqbpbgbzeclhdhgh` (`canonicalId`),
  KEY `idx_csrzlfxvivqosyqlqzdpygdcfpxrxsdzqnsn` (`archived`,`dateCreated`),
  KEY `idx_ambbpmbusyrgcopbopocprkothvmidpsranu` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_rvfapgybqomobcvwmyxyfrnsmctakhmfvjtu` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_sdcahmfxuamjrdzoruwynnaijtgskmbctptp` (`draftId`),
  KEY `fk_cmhjpygxdaelzvvzzvrjsnftedrizrottbys` (`revisionId`),
  CONSTRAINT `fk_cmhjpygxdaelzvvzzvrjsnftedrizrottbys` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sdcahmfxuamjrdzoruwynnaijtgskmbctptp` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vwnuhfashwobjkvyhvlgkbljciiyigbdeyhh` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xlgeqmwiuueqepnrhtbzhmymkbjyejskbdqt` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_bulkops`
--

DROP TABLE IF EXISTS `elements_bulkops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_bulkops` (
  `elementId` int NOT NULL,
  `key` char(10) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`elementId`,`key`),
  KEY `idx_rzvzlpkneofhwzlgpxdjzmbwtkfeckbqpbzs` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_owners`
--

DROP TABLE IF EXISTS `elements_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_owners` (
  `elementId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`elementId`,`ownerId`),
  KEY `fk_svcbfqliatdlwujtggtgoavqwfyeieyznaxx` (`ownerId`),
  CONSTRAINT `fk_rbkycztfgutqidafgwhuqkzynjiiltpzasss` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_svcbfqliatdlwujtggtgoavqwfyeieyznaxx` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `content` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_klgjltflsukhuoghqzjsakslubaogtmckzeu` (`elementId`,`siteId`),
  KEY `idx_oqwhcrfdqgxilvtsgeecunovujppmfpqsmzo` (`siteId`),
  KEY `idx_fpqqguqbbqtxvpgpipvgczdphdehfgzmnvjs` (`title`,`siteId`),
  KEY `idx_voxmsbrukbfjrldqfkujkpimeoogxzkmadng` (`slug`,`siteId`),
  KEY `idx_ybraijsethwlpjygyngytswsbbqpctjefcgx` (`enabled`),
  KEY `idx_tfpxvcvohihobxmbvgdiydmnjddatysbowhy` (`uri`,`siteId`),
  CONSTRAINT `fk_eebkkvkjbpcighmqsqtszmzwiybztqelgevp` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_owgwvubxgwvxyqtpggazrfmzqsmjkyufnlfz` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int DEFAULT NULL,
  `parentId` int DEFAULT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ejfrtbqjejlgtkgvhndprjdjpokmgggqvqhh` (`postDate`),
  KEY `idx_hfygnnmizhfqpbcgopyeidppzgaxhelqnljx` (`expiryDate`),
  KEY `idx_mleiejnirvueqarjnmmkeejfztggktcjyizi` (`sectionId`),
  KEY `idx_bfopvfgtplfuzkblecixmzntscmyhnamfhgp` (`typeId`),
  KEY `idx_exkcttogdltqeehhqhlcqjkmgotsxpieolcl` (`primaryOwnerId`),
  KEY `idx_trrgkxvttrcnkbvctonwaxjkootisgimddsk` (`fieldId`),
  KEY `fk_zrqhcfigzlrtozutwiacrlmfkwkhsspqzkyl` (`parentId`),
  CONSTRAINT `fk_bdnwlpgineugypyfkvkzlxlqppcnvsykwcys` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ejaopydhpnkiwoyrcjolxvriwyxgocnforax` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mnwncztqlihaiptdmvyxsevbxjvjokhzopig` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ogyamhozevunaiwtqlgueelzrjwrwpztogpy` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tovajkcqvqmzfwhvakzknuhkfrgoqvazaltr` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zrqhcfigzlrtozutwiacrlmfkwkhsspqzkyl` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries_authors`
--

DROP TABLE IF EXISTS `entries_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries_authors` (
  `entryId` int NOT NULL,
  `authorId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`entryId`,`authorId`),
  KEY `idx_ldmruuiposqjfwtbzaupmuvsgvomgibcvcjz` (`authorId`),
  KEY `idx_zggtpsmewjyszlqlhqvoknhcbrjsegevjwrd` (`entryId`,`sortOrder`),
  CONSTRAINT `fk_twogozqblnptnxjrdfwtcnxceelatxyjzwjm` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zsorzorlcdsbifqtdtnumtnemyydrddvznms` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `showSlugField` tinyint(1) DEFAULT '1',
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text,
  `showStatusField` tinyint(1) DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zuvejjqtsoyxvnakbhxestbubjeuexbmggje` (`fieldLayoutId`),
  KEY `idx_navprhbrcdlvawiwqlhhgihrwogprfwwosnm` (`dateDeleted`),
  CONSTRAINT `fk_gplsvldpylzkbzbkxjvhsvdsgesembxxkeaq` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `config` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_onldavrzeywsykxnjmjgzucrsgjglosqqkgh` (`dateDeleted`),
  KEY `idx_nehgwkqctlvxyhiahzifxoihjszmilajfuly` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nerpuenbsbujlofizbzvhqnindjzvcmsoxby` (`handle`,`context`),
  KEY `idx_wleolznjqrteljhtdqjxjreczxxbbfgtjudb` (`context`),
  KEY `idx_fubpqosvmokiaaverslgnuodkeyujxapltil` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jyecjbeycdvlsyfoljnomtldjxpbenkpwqnh` (`name`),
  KEY `idx_ypbnamndxwauwmuecufmnfbokvetatllnmrl` (`handle`),
  KEY `idx_mmvjkiiexhqyspasffckeqkorvbwkqeekmab` (`fieldLayoutId`),
  KEY `idx_iugnwgulbyglgclyngrpzwxdatbqklktvxeu` (`sortOrder`),
  CONSTRAINT `fk_igydzuzsfqcjsxurjwnakgttsfcqeztrxhxt` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_sbolelgqgjfmvgefvroascmcmjrfyyuljlfw` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` json DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gisezajqaqsxkovyrtpohnlejfsktzrmcrru` (`accessToken`),
  UNIQUE KEY `idx_gqpsescbwlxhgttsguxlzydammjaqplnywos` (`name`),
  KEY `fk_wabnvpwlfwtoyirwjrjpbjdzrbgxrbzfzvww` (`schemaId`),
  CONSTRAINT `fk_wabnvpwlfwtoyirwjrjpbjdzrbgxrbzfzvww` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ltbfrgthzkhzepdumstqulszsijzbtwiyfzx` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rqqmysnwngijvxrvxzibtecicbwhljdtltso` (`name`),
  KEY `idx_ledxxcsjqqkukxgagcybzdllodzdhpxwdpqo` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fbhseqoneyqqthqgtcqwmlehxcnzjczytcco` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zgwngtkxqurbahyvmygunpiehbsmaxhgrcah` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `idx_jpxbrcpekbkszmgbeegbrjqtconwjhrhcnpm` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_glcjaokzywpqvrpkxxdnzqpsvfugtbnhlcdv` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recoverycodes`
--

DROP TABLE IF EXISTS `recoverycodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recoverycodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `recoveryCodes` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ntypkxgndnznjkqpassbervxzdafyotrjdwe` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_tghjubigbxngpcdchndrxcoidgwhkzszqimn` (`sourceId`),
  KEY `idx_xmgmoqbyjlvnwahitbryntnkahtkkpnlnsgl` (`targetId`),
  KEY `idx_mljzcimgiqcebjrnlrutnmtyclgeflbbpqpq` (`sourceSiteId`),
  CONSTRAINT `fk_bkdhxkkihhhvxmokfxiqpilcqmynfvwhhhgg` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ofszgdplaxlavhzpveogapkjifmvupzaynmr` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uajyhungpsgqxhrochfcqxksxhotxkawcovz` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dsmoaxnkdbujjdrikltdsbnowrtqieopvozi` (`canonicalId`,`num`),
  KEY `fk_sqvtwuvsfktyrxdjiqhmrrpaqlxpkwnabsoz` (`creatorId`),
  CONSTRAINT `fk_kxnonnergjswbsadcavbcbarnepzaxhxlroy` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sqvtwuvsfktyrxdjiqhmrrpaqlxpkwnabsoz` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_ydkdhfdqktcpsewulzbzkkkfvsuhyterdjek` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `maxAuthors` smallint unsigned NOT NULL DEFAULT '1',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_exhlyxrfgenumjwlxoxgfsbnrolfewnlqzfj` (`handle`),
  KEY `idx_ybqngbuftdlafvdrazdrxkdawvqyginkhscf` (`name`),
  KEY `idx_kpikeokwatzosnavsmvbqtnwabvvxjhrfhzu` (`structureId`),
  KEY `idx_njcwzvtpwpagpfrckeqfkzbimcavqvucgplv` (`dateDeleted`),
  CONSTRAINT `fk_tbcvckrrdpqokqwogufyihjpurmndvhzlbuh` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_entrytypes`
--

DROP TABLE IF EXISTS `sections_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_entrytypes` (
  `sectionId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`sectionId`,`typeId`),
  KEY `fk_jjcarudzotgdzrtcycawzsfolmkvqsyorzpq` (`typeId`),
  CONSTRAINT `fk_fcwyhubrnwzkszojcljadeggvubjlbqznjbk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jjcarudzotgdzrtcycawzsfolmkvqsyorzpq` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ejtxtlkmlxwtthtoqdwcoxcpgitzvnbafrbe` (`sectionId`,`siteId`),
  KEY `idx_ngslvxrsezfckreemygsjddtlbhsmwikaspv` (`siteId`),
  CONSTRAINT `fk_brqswdcvnhcbjeipzwrplsiqmgtfwvgzhsfp` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_jnrhnfnnnfznifcdyfgmwehsylizrotcfkus` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_izmjrcxomnjjofzhcvyrytzqampegueojnmu` (`uid`),
  KEY `idx_cmepxqlyfhwdfichqwzvhnxdxhjaxnthnlyw` (`token`),
  KEY `idx_uqwotasqdjqtzqpekzgtcdsqkejtnogvwdrl` (`dateUpdated`),
  KEY `idx_ywcvvsbsiezxkccqxsnquqvcqtbvmkvphjmb` (`userId`),
  CONSTRAINT `fk_dmlcowqucpzxxbmvzlwguiisetapntsimrad` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uopjwjzgmfqnfapcfsjchhcnanoxxsdevmhw` (`userId`,`message`),
  CONSTRAINT `fk_nukvraflopdemzksuomeeinolrpkwbkpuqnd` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wcqfqnyeojgclfsyzlmjcdrolqbcjskvxlbc` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dlrlkyrcgncqnnpgfbyobqcliptiamarpvqz` (`dateDeleted`),
  KEY `idx_ymyjgtjonutkzfkltvwuznyirmjnolynzien` (`handle`),
  KEY `idx_byfasxleeaafsyzyrsanraydamkhjkmnlrju` (`sortOrder`),
  KEY `fk_fpyuzjsdcsffkpdiwhgvfyoqubbbqnkxzgze` (`groupId`),
  CONSTRAINT `fk_fpyuzjsdcsffkpdiwhgvfyoqubbbqnkxzgze` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sso_identities`
--

DROP TABLE IF EXISTS `sso_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sso_identities` (
  `provider` varchar(255) NOT NULL,
  `identityId` varchar(255) NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`provider`,`identityId`,`userId`),
  KEY `fk_efqovhjbeqaivfvmisjqsoybwujfhfuocoxp` (`userId`),
  CONSTRAINT `fk_efqovhjbeqaivfvmisjqsoybwujfhfuocoxp` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ixyytidonhegawalhozuuosnxmcawkfdkels` (`structureId`,`elementId`),
  KEY `idx_cbrwhhqxafjtibqwmqksgfpuvakxovbjqxqk` (`root`),
  KEY `idx_snpgysywbvqyletrsyrdettloyiwpzezbgld` (`lft`),
  KEY `idx_nnseekfujrvurfojrzpcdsirrcpztmkhqdzv` (`rgt`),
  KEY `idx_dvztuzwiljfajwftgpwqshadxiftvfxoofkv` (`level`),
  KEY `idx_jbpczupakfcblphyirixtvkukucbwqupokig` (`elementId`),
  CONSTRAINT `fk_shfidthgoijefktbyxoetsukacgmfkeswkue` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jfnabnhiwzpdinxlkgrpsdupvqiovukggeoi` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sxumazxjwztjnpvmedqxumsstnohrxjllgvp` (`key`,`language`),
  KEY `idx_tjmspnsfxzceqccvqtvlhcduuybqrbqdduec` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jcuvtwafxcjhpueucewfkxzthxhjvoksdvmj` (`name`),
  KEY `idx_suuxuyuoyqxygdeucbxencmvaofpneylpazf` (`handle`),
  KEY `idx_uibvftrqsqbivavobjaetvwzyextfcvzqodi` (`dateDeleted`),
  KEY `fk_jcphbcghzvpkryrrvmiptmyqnydnzqcwxiws` (`fieldLayoutId`),
  CONSTRAINT `fk_jcphbcghzvpkryrrvmiptmyqnydnzqcwxiws` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jwvwkdzmdorieobcwyanofvathefiuhamviz` (`groupId`),
  CONSTRAINT `fk_hprytbjfbeebxafcyvrxqcerkjczvgukmnha` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lfyuusyvskblcvusaiuzwqifeijpcifhmtvc` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rigdwkszxdserayzmtwgvpldpkxarzllgmrc` (`token`),
  KEY `idx_rmjzyhyrjipiynvheszvmoomaaaabynmabfp` (`expiryDate`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jxqfkppgjslrvfxeuogrucfbsevbkhvjbtvu` (`handle`),
  KEY `idx_hhtwonixcrhjilwzhfziknctyynqnsivdzxr` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qrkbcswexmnfyqwlascycpyqpdxnbmhzuylj` (`groupId`,`userId`),
  KEY `idx_oxevwcdrqgkxamkxfjasqhtyxprivqllmybp` (`userId`),
  CONSTRAINT `fk_lhsiaspunfuzrwulekcxxvosjkljopfkdboe` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vqebzcktcwthgpibxovrhurfmmetpgxztafy` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bpxnhxhtuznlsrbazqrmzathubfpuvhmdwkv` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hxpsvapusnzkypnjnedtuorsgndbzlyzxdxj` (`permissionId`,`groupId`),
  KEY `idx_glnalyhgcabcvejtfzldhfedjkjttnhpdbcn` (`groupId`),
  CONSTRAINT `fk_gpfhxudhqqoptaoysprncgelqrvjesqwniya` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_matlefztdfkphqjvssudyfswkjjlfdaailpj` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gxwpsincrcetnvpcuorqosyeiuttfacoqtpy` (`permissionId`,`userId`),
  KEY `idx_edrzapsgcemrmbpczxydaaqcgvrjcwlrgiqu` (`userId`),
  CONSTRAINT `fk_cejwmahqapqbhckwyfygeecucjtqgaziqfdq` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_egiriepbglraecspetgcuglzyqirlhapdekq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` json DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_cklhqgrmyzqkaljtagahnwkbyfjraukdwqyi` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ikkgrdfrkbbxwoqbitfzgxxnbcetrkqlwmav` (`active`),
  KEY `idx_jnolxefjbddklmpqhlwmkdkhbgifvilzepav` (`locked`),
  KEY `idx_hwevuvgrakaimthlxbwcuocfxnbzjjphymik` (`pending`),
  KEY `idx_bywkqhypocrajpnhgdutvtzdcssgqzxclogo` (`suspended`),
  KEY `idx_sxaaqihxsscfyoyazppuxnpcctrzltpkimeb` (`verificationCode`),
  KEY `idx_qvijuducibzisccokkyzaxaeytggwqbsaoqe` (`email`),
  KEY `idx_fshqdwucyqqhjqacpwhvhwxumioyxvqrcknn` (`username`),
  KEY `fk_pxuagtqhwmpelwpymkdijuqguihkkmlnyhjw` (`photoId`),
  CONSTRAINT `fk_mqhbfhyifewrlanqqvcnnmriyzbhhepddqlt` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pxuagtqhwmpelwpymkdijuqguihkkmlnyhjw` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xxawtkgxutwlvvmijjwrrijhlssntojkdqdf` (`name`,`parentId`,`volumeId`),
  KEY `idx_mnuxslezdnqycwomwiihfdgvfdrkdrixgfjl` (`parentId`),
  KEY `idx_fcqjmwxnjqfhakqbmfuhtdgrwlbwbmzkafvs` (`volumeId`),
  CONSTRAINT `fk_dfngisyswnskkisdemxutmuspzteuvnsxfsn` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xyesxnwnnaawbamzamthjtqpgvloeapomjtn` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `subpath` varchar(255) DEFAULT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `altTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `altTranslationKeyFormat` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tbszqspitlvyevxsxpgzrvayswgeaqbcxyni` (`name`),
  KEY `idx_pbvnnrhgjgvzmlwfsvdfmqoectwksffnebie` (`handle`),
  KEY `idx_nyjqbuqbmmxtqvmktzsffvzgpyghtggtepcr` (`fieldLayoutId`),
  KEY `idx_ftjsrtbblnyzhonqkhhdneoqxlnxgprmubvt` (`dateDeleted`),
  CONSTRAINT `fk_isxylkxoswmtzulimclptxgqduhigzfodntx` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webauthn`
--

DROP TABLE IF EXISTS `webauthn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webauthn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `credentialId` varchar(255) DEFAULT NULL,
  `credential` text,
  `credentialName` varchar(255) DEFAULT NULL,
  `dateLastUsed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_qkifxbnthozearlupslbpxxotlaforqljjnw` (`userId`),
  CONSTRAINT `fk_qkifxbnthozearlupslbpxxotlaforqljjnw` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hovofiyytiwenwevthsqiaifarvxftmmgykk` (`userId`),
  CONSTRAINT `fk_irgpxmtmsdwblekyucvermhcvxnnivxubbxu` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-23 16:46:48
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (aarch64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets` VALUES (8,1,1,1,'jobrad-nh.png','image',NULL,1777,992,122434,NULL,0,0,'2024-11-07 16:44:53','2024-11-07 16:44:53','2024-11-07 16:44:53'),(16,1,1,1,'rotax.png','image',NULL,1777,992,829025,NULL,0,0,'2024-11-07 16:47:21','2024-11-07 16:47:21','2024-11-07 16:47:21'),(59,1,1,1,'cat.jpg','image',NULL,594,598,61089,NULL,NULL,NULL,'2024-11-21 21:38:10','2024-11-21 21:38:10','2024-11-21 21:38:10');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets_sites`
--

LOCK TABLES `assets_sites` WRITE;
/*!40000 ALTER TABLE `assets_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets_sites` VALUES (8,1,NULL),(16,1,NULL),(59,1,NULL);
/*!40000 ALTER TABLE `assets_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `authenticator`
--

LOCK TABLES `authenticator` WRITE;
/*!40000 ALTER TABLE `authenticator` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `authenticator` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (2,1,'title','2024-11-07 20:28:49',0,1),(21,1,'postDate','2024-11-07 19:59:55',0,1),(21,1,'slug','2024-11-07 19:59:52',0,1),(21,1,'title','2024-11-07 19:59:52',0,1),(21,1,'uri','2024-11-07 19:59:52',0,1),(47,1,'title','2024-11-07 20:28:32',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (2,1,1,'d124e445-a80b-469a-9b1f-2bd24c407c20','2024-11-21 21:38:30',0,1),(2,1,5,'a4fd9b77-7397-4ecd-b45b-0a09ea22433d','2024-11-21 21:40:41',0,1),(18,1,1,'34a577ab-a40d-4fdf-b455-5ccb218984f7','2024-11-07 16:49:22',0,1),(21,1,1,'d124e445-a80b-469a-9b1f-2bd24c407c20','2024-11-21 21:41:31',0,1),(21,1,5,'a4fd9b77-7397-4ecd-b45b-0a09ea22433d','2024-11-21 21:41:31',0,1),(27,1,3,'37de2a41-399a-4168-83fb-b9c15619da34','2024-11-07 20:19:34',0,1),(31,1,4,'8d5becbd-6782-4c7c-b333-0f3e009dca41','2024-11-07 20:24:15',0,1),(35,1,4,'8d5becbd-6782-4c7c-b333-0f3e009dca41','2024-11-07 20:24:21',0,1),(39,1,4,'8d5becbd-6782-4c7c-b333-0f3e009dca41','2024-11-07 20:24:26',0,1),(43,1,4,'8d5becbd-6782-4c7c-b333-0f3e009dca41','2024-11-07 20:24:35',0,1),(47,1,3,'156ec57c-8e05-4add-9226-687607ff28d1','2024-11-07 20:28:32',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elementactivity` VALUES (2,1,1,NULL,'edit','2024-11-21 21:40:39'),(2,1,1,NULL,'save','2024-11-21 21:40:41'),(21,1,1,NULL,'edit','2024-11-21 21:41:29'),(21,1,1,NULL,'save','2024-11-21 21:41:31');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2024-11-07 16:27:01','2024-11-07 16:27:01',NULL,NULL,NULL,'890d1af6-9cbf-4362-b9e0-92f12888e957'),(2,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2024-11-07 16:38:27','2024-11-21 21:40:41',NULL,NULL,NULL,'03d0c44e-fb62-4a1f-b024-c75f8469cc66'),(3,2,NULL,1,2,'craft\\elements\\Entry',1,0,'2024-11-07 16:38:27','2024-11-07 16:38:27',NULL,NULL,NULL,'d9c2037b-d9e1-4573-9b7d-b6f1866bdf8f'),(4,2,NULL,2,2,'craft\\elements\\Entry',1,0,'2024-11-07 16:39:28','2024-11-07 16:39:28',NULL,NULL,NULL,'d720cf18-50fe-47cd-bf59-bc377980ded5'),(8,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2024-11-07 16:44:53','2024-11-07 16:47:15',NULL,'2024-11-07 16:47:15',NULL,'e0192f57-feba-4dec-a9b1-b9380d6c0b76'),(9,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2024-11-07 16:45:05','2024-11-07 20:19:34',NULL,'2024-11-07 20:19:34',NULL,'f745c866-1ead-4dfa-b79d-b4683c4d310d'),(10,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2024-11-07 16:45:05','2024-11-07 16:49:22',NULL,'2024-11-07 16:49:22',NULL,'23c6e013-e97b-4ac7-a014-fe394601367c'),(11,2,NULL,3,2,'craft\\elements\\Entry',1,0,'2024-11-07 16:45:05','2024-11-07 16:45:05',NULL,NULL,NULL,'0983e784-c2f6-4c08-9808-b2d5e3d6fe4f'),(12,9,NULL,4,4,'craft\\elements\\Entry',1,0,'2024-11-07 16:45:05','2024-11-07 16:45:05',NULL,'2024-11-07 20:19:34',NULL,'e0d3091d-c378-425a-a6ac-e21b9c7b7a6c'),(13,10,NULL,5,3,'craft\\elements\\Entry',1,0,'2024-11-07 16:45:05','2024-11-07 16:45:05',NULL,'2024-11-07 16:49:22',NULL,'7311dc66-e581-468c-824b-ca49da2f83a6'),(15,2,NULL,6,2,'craft\\elements\\Entry',1,0,'2024-11-07 16:45:13','2024-11-07 16:45:13',NULL,NULL,NULL,'e2c35fb7-4c92-4405-b916-587979ad8077'),(16,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2024-11-07 16:47:21','2024-11-21 21:38:06',NULL,'2024-11-21 21:38:06',NULL,'44e15106-4976-4396-bbf1-99777ddcc4be'),(18,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2024-11-07 16:49:21','2024-11-07 20:28:32',NULL,'2024-11-07 20:28:32',NULL,'8527af4c-a74f-490b-82c6-4fc9c9312493'),(19,2,NULL,7,2,'craft\\elements\\Entry',1,0,'2024-11-07 16:49:22','2024-11-07 16:49:22',NULL,NULL,NULL,'f1f351d4-5e39-4fd9-bf6b-3b065132f506'),(20,18,NULL,8,3,'craft\\elements\\Entry',1,0,'2024-11-07 16:49:22','2024-11-07 16:49:22',NULL,'2024-11-07 20:28:32',NULL,'9aa00a2a-d970-4352-ad5f-08add8157067'),(21,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2024-11-07 19:59:41','2024-11-21 21:41:31',NULL,NULL,NULL,'d01d0f3d-e96f-4b07-aede-4f48df43b1a4'),(22,21,NULL,9,2,'craft\\elements\\Entry',1,0,'2024-11-07 19:59:55','2024-11-07 19:59:55',NULL,NULL,NULL,'0f9a8597-caa7-4214-9c7f-9b149d1fb64f'),(24,2,NULL,10,2,'craft\\elements\\Entry',1,0,'2024-11-07 20:17:14','2024-11-07 20:17:14',NULL,NULL,NULL,'81b43f2e-15b1-4dfc-a4c4-337d4a671918'),(25,2,NULL,11,2,'craft\\elements\\Entry',1,0,'2024-11-07 20:19:11','2024-11-07 20:19:11',NULL,NULL,NULL,'a1ee13af-990b-401a-8a72-2f5e80cd4589'),(27,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2024-11-07 20:19:27','2024-11-07 20:24:15',NULL,'2024-11-07 20:24:15',NULL,'d84c5e4f-a8d5-496d-924c-84e8a8679e71'),(28,2,NULL,12,2,'craft\\elements\\Entry',1,0,'2024-11-07 20:19:34','2024-11-07 20:19:34',NULL,NULL,NULL,'671636ed-ede8-4976-bef7-db2745a9c666'),(29,27,NULL,13,4,'craft\\elements\\Entry',1,0,'2024-11-07 20:19:34','2024-11-07 20:19:34',NULL,'2024-11-07 20:24:15',NULL,'5dcff55b-a09f-45b9-9595-8ce41ffaa913'),(31,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2024-11-07 20:24:14','2024-11-07 20:24:21',NULL,'2024-11-07 20:24:21',NULL,'91e2d1cb-de84-4a64-ac5e-7dceac682f77'),(32,2,NULL,14,2,'craft\\elements\\Entry',1,0,'2024-11-07 20:24:15','2024-11-07 20:24:15',NULL,NULL,NULL,'a4bd3884-bfc5-42c6-9bdf-802aed15b5af'),(33,31,NULL,15,4,'craft\\elements\\Entry',1,0,'2024-11-07 20:24:15','2024-11-07 20:24:15',NULL,'2024-11-07 20:24:21',NULL,'6e4e69c4-eeb9-4485-a412-70661508038f'),(35,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2024-11-07 20:24:20','2024-11-07 20:24:26',NULL,'2024-11-07 20:24:26',NULL,'8dcf4481-16b3-47dc-a690-dfd7d5f4594f'),(36,2,NULL,16,2,'craft\\elements\\Entry',1,0,'2024-11-07 20:24:21','2024-11-07 20:24:21',NULL,NULL,NULL,'eb43b4a6-9eea-46d9-9506-9db6a748cdd6'),(37,35,NULL,17,4,'craft\\elements\\Entry',1,0,'2024-11-07 20:24:21','2024-11-07 20:24:21',NULL,'2024-11-07 20:24:26',NULL,'f8a7d57b-88a0-4b8c-8c79-c855a6695a48'),(39,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2024-11-07 20:24:26','2024-11-07 20:24:35',NULL,'2024-11-07 20:24:35',NULL,'a17eb335-4e01-4b25-adf6-5b9fd86c04f4'),(40,2,NULL,18,2,'craft\\elements\\Entry',1,0,'2024-11-07 20:24:26','2024-11-07 20:24:26',NULL,NULL,NULL,'6357c210-e7b6-4204-8078-ca4960dad0c0'),(41,39,NULL,19,4,'craft\\elements\\Entry',1,0,'2024-11-07 20:24:26','2024-11-07 20:24:26',NULL,'2024-11-07 20:24:35',NULL,'eccd292a-07f7-4933-94ff-427265aa7175'),(43,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2024-11-07 20:24:34','2024-11-07 20:24:35',NULL,NULL,NULL,'a84c5411-11dd-4f3e-8dbd-122581c7f72b'),(44,2,NULL,20,2,'craft\\elements\\Entry',1,0,'2024-11-07 20:24:35','2024-11-07 20:24:35',NULL,NULL,NULL,'7889dbf2-4477-408d-96f2-b3d70ac12e25'),(45,43,NULL,21,4,'craft\\elements\\Entry',1,0,'2024-11-07 20:24:35','2024-11-07 20:24:35',NULL,NULL,NULL,'4e55e4e5-4c6e-486c-8f09-4328544e0e82'),(47,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2024-11-07 20:28:16','2024-11-21 21:40:41',NULL,'2024-11-21 21:40:41',NULL,'7b8cffd9-6bf2-4ab2-8c76-52e08431f956'),(48,2,NULL,22,2,'craft\\elements\\Entry',1,0,'2024-11-07 20:28:32','2024-11-07 20:28:32',NULL,NULL,NULL,'8d8167b4-75aa-45f3-96e4-87fdd80df839'),(49,47,NULL,23,3,'craft\\elements\\Entry',1,0,'2024-11-07 20:28:32','2024-11-07 20:28:32',NULL,'2024-11-21 21:40:41',NULL,'069eee45-53c5-4f9c-a9ea-0818fc498006'),(51,2,NULL,24,2,'craft\\elements\\Entry',1,0,'2024-11-07 20:28:49','2024-11-07 20:28:49',NULL,NULL,NULL,'9b6e09de-051c-4a24-9892-6abdca61256f'),(54,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-11-08 14:45:02','2024-11-08 14:45:02',NULL,NULL,NULL,'a201c417-5a37-47fa-a04b-0e653478d3b6'),(55,2,NULL,25,2,'craft\\elements\\Entry',1,0,'2024-11-08 14:45:02','2024-11-08 14:45:02',NULL,NULL,NULL,'995cf945-5ac8-42bc-b62c-e13d50d540d8'),(56,54,NULL,26,5,'craft\\elements\\Entry',1,0,'2024-11-08 14:45:02','2024-11-08 14:45:02',NULL,NULL,NULL,'b99a7e2d-2b98-45a6-a9a6-9a22635fb7f2'),(59,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2024-11-21 21:38:10','2024-11-21 21:38:10',NULL,NULL,NULL,'15e395e0-33f6-48be-81bc-cedcc934b9ec'),(60,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2024-11-21 21:38:30','2024-11-21 21:38:30',NULL,NULL,NULL,'cba8877b-52da-473e-bedb-9e8d7fb016cd'),(61,2,NULL,27,2,'craft\\elements\\Entry',1,0,'2024-11-21 21:38:30','2024-11-21 21:38:30',NULL,NULL,NULL,'e285754c-2b34-41be-bb8f-9d938ac15245'),(62,60,NULL,28,3,'craft\\elements\\Entry',1,0,'2024-11-21 21:38:30','2024-11-21 21:38:30',NULL,NULL,NULL,'d10e488e-e70a-457a-9079-e57a787ee8a7'),(63,2,NULL,29,2,'craft\\elements\\Entry',1,0,'2024-11-21 21:40:35','2024-11-21 21:40:35',NULL,NULL,NULL,'8312b1f0-77ef-4532-8426-cfe07474f91d'),(65,2,NULL,30,2,'craft\\elements\\Entry',1,0,'2024-11-21 21:40:41','2024-11-21 21:40:41',NULL,NULL,NULL,'8e8dd339-194c-4c6e-a850-6de902247a77'),(68,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2024-11-21 21:41:31','2024-11-21 21:41:31',NULL,NULL,NULL,'8d676bc3-4cce-459e-8419-ce215116e147'),(69,21,NULL,31,2,'craft\\elements\\Entry',1,0,'2024-11-21 21:41:31','2024-11-21 21:41:31',NULL,NULL,NULL,'829f9d94-26e2-46c4-9cc1-05da78a55edf'),(70,68,NULL,32,3,'craft\\elements\\Entry',1,0,'2024-11-21 21:41:31','2024-11-21 21:41:31',NULL,NULL,NULL,'8844ddba-05fe-439d-b63b-67d7bbd9a402');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_bulkops`
--

LOCK TABLES `elements_bulkops` WRITE;
/*!40000 ALTER TABLE `elements_bulkops` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elements_bulkops` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_owners`
--

LOCK TABLES `elements_owners` WRITE;
/*!40000 ALTER TABLE `elements_owners` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_owners` VALUES (9,2,2),(10,2,2),(12,11,1),(12,15,1),(12,19,1),(12,24,2),(12,25,2),(13,11,2),(13,15,2),(18,2,1),(20,19,2),(20,24,1),(20,25,1),(20,28,1),(20,32,1),(20,36,1),(20,40,1),(20,44,1),(27,2,2),(29,28,2),(31,2,2),(33,32,2),(35,2,2),(37,36,2),(39,2,2),(41,40,2),(43,2,1),(45,44,2),(45,48,2),(45,51,2),(45,55,2),(45,61,2),(45,63,2),(45,65,1),(47,2,1),(49,48,1),(49,51,1),(49,55,1),(49,61,1),(49,63,1),(54,2,2),(56,55,3),(56,61,3),(56,63,3),(56,65,2),(60,2,3),(62,61,4),(62,63,4),(62,65,3),(68,21,1),(70,69,1);
/*!40000 ALTER TABLE `elements_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,NULL,NULL,1,'2024-11-07 16:27:01','2024-11-07 16:27:01','9269c10f-def0-4488-bdcc-5dcd9bd9a502'),(2,2,1,'Home','home','__home__','{\"d124e445-a80b-469a-9b1f-2bd24c407c20\": [59]}',1,'2024-11-07 16:38:27','2024-11-21 21:38:30','d4f80ca4-df79-41fb-84f5-be6d2ac749fa'),(3,3,1,'Home','home','__home__','{\"d124e445-a80b-469a-9b1f-2bd24c407c20\": []}',1,'2024-11-07 16:38:27','2024-11-07 16:38:27','0d75008d-8578-4211-a763-790198d7b2d7'),(4,4,1,'Home','home','__home__','{\"d124e445-a80b-469a-9b1f-2bd24c407c20\": []}',1,'2024-11-07 16:39:28','2024-11-07 16:39:28','015f9cf5-3035-4e39-932b-75ae0952c323'),(8,8,1,'Jobrad nh',NULL,NULL,NULL,1,'2024-11-07 16:44:53','2024-11-07 16:44:53','2a945541-085b-41e0-9db2-2d1f82b07dc9'),(9,9,1,NULL,'this-is-the-headline',NULL,'{\"8d5becbd-6782-4c7c-b333-0f3e009dca41\": \"h2\"}',1,'2024-11-07 16:45:05','2024-11-07 20:19:04','2a743139-d8a6-4eaa-a743-3bcc6c602b0e'),(10,10,1,'This is the text of image and text','this-is-the-text-of-image-and-text',NULL,'{\"156ec57c-8e05-4add-9226-687607ff28d1\": \"This is the text of image and text\", \"34a577ab-a40d-4fdf-b455-5ccb218984f7\": [8]}',1,'2024-11-07 16:45:05','2024-11-07 16:45:05','5a0174c5-8428-48f6-908a-96d84c4ffb7f'),(11,11,1,'Home','home','__home__','{\"d124e445-a80b-469a-9b1f-2bd24c407c20\": []}',1,'2024-11-07 16:45:05','2024-11-07 16:45:05','2a48dde0-a38c-4914-b9ee-db334f156410'),(12,12,1,'This is the headline','this-is-the-headline',NULL,'{\"8d5becbd-6782-4c7c-b333-0f3e009dca41\": \"h2\"}',1,'2024-11-07 16:45:05','2024-11-07 16:45:05','e98bfe6c-803e-4d8e-a6bf-ca651a91df5d'),(13,13,1,'This is the text of image and text','this-is-the-text-of-image-and-text',NULL,'{\"156ec57c-8e05-4add-9226-687607ff28d1\": \"This is the text of image and text\", \"34a577ab-a40d-4fdf-b455-5ccb218984f7\": [8]}',1,'2024-11-07 16:45:05','2024-11-07 16:45:05','fde77954-bcf1-4a62-9a96-23279ca12602'),(15,15,1,'Home','home','__home__','{\"d124e445-a80b-469a-9b1f-2bd24c407c20\": [8]}',1,'2024-11-07 16:45:13','2024-11-07 16:45:13','5cbf562d-3a91-4422-8c59-bd40b0441ef5'),(16,16,1,'Rotax',NULL,NULL,NULL,1,'2024-11-07 16:47:21','2024-11-07 16:47:21','e49a1904-172b-46d1-9417-fc2b7a152562'),(18,18,1,'This is the text of image and text','this-is-the-text-of-image-and-text',NULL,'{\"156ec57c-8e05-4add-9226-687607ff28d1\": \"This is the text of image and text\", \"34a577ab-a40d-4fdf-b455-5ccb218984f7\": [16]}',1,'2024-11-07 16:49:21','2024-11-07 16:49:21','c6282558-20a6-4ae7-8b0f-e040ac3e94f6'),(19,19,1,'Home','home','__home__','{\"d124e445-a80b-469a-9b1f-2bd24c407c20\": [16]}',1,'2024-11-07 16:49:22','2024-11-07 16:49:22','0a805c42-b035-4987-bf30-792180808404'),(20,20,1,'This is the text of image and text','this-is-the-text-of-image-and-text',NULL,'{\"156ec57c-8e05-4add-9226-687607ff28d1\": \"This is the text of image and text\", \"34a577ab-a40d-4fdf-b455-5ccb218984f7\": [16]}',1,'2024-11-07 16:49:22','2024-11-07 16:49:22','3de19356-27e7-4016-bc0c-6b87f584d083'),(21,21,1,'News 1','news-1','news/news-1','{\"d124e445-a80b-469a-9b1f-2bd24c407c20\": [59]}',1,'2024-11-07 19:59:41','2024-11-21 21:41:31','559c5d34-620a-4343-bad6-58fafa126837'),(22,22,1,'News 1','news-1','news/news-1','{\"d124e445-a80b-469a-9b1f-2bd24c407c20\": []}',1,'2024-11-07 19:59:55','2024-11-07 19:59:55','7c6eaa39-0c73-4f1c-9e16-e6fec7de793c'),(24,24,1,'Home','home','__home__','{\"d124e445-a80b-469a-9b1f-2bd24c407c20\": [16]}',1,'2024-11-07 20:17:14','2024-11-07 20:17:14','7d0410ba-f9fb-4b58-8f4b-86bfd298c0d8'),(25,25,1,'Home','home','__home__','{\"d124e445-a80b-469a-9b1f-2bd24c407c20\": [16]}',1,'2024-11-07 20:19:11','2024-11-07 20:19:11','33b1ddcc-9010-4292-ba00-95e31366e648'),(27,27,1,NULL,'this-is-the-headline',NULL,'{\"37de2a41-399a-4168-83fb-b9c15619da34\": \"This is the Awesome Headline\", \"8d5becbd-6782-4c7c-b333-0f3e009dca41\": \"h2\"}',1,'2024-11-07 20:19:27','2024-11-07 20:19:33','988271b5-088d-4e57-a374-c081ace9e862'),(28,28,1,'Home','home','__home__','{\"d124e445-a80b-469a-9b1f-2bd24c407c20\": [16]}',1,'2024-11-07 20:19:34','2024-11-07 20:19:34','20a2e7ad-33d7-4905-8f02-d801b37813f2'),(29,29,1,NULL,'this-is-the-headline',NULL,'{\"37de2a41-399a-4168-83fb-b9c15619da34\": \"This is the Awesome Headline\", \"8d5becbd-6782-4c7c-b333-0f3e009dca41\": \"h2\"}',1,'2024-11-07 20:19:34','2024-11-07 20:19:34','86ce9a9c-749f-4e5d-9610-75afc16f3313'),(31,31,1,NULL,'this-is-the-headline',NULL,'{\"37de2a41-399a-4168-83fb-b9c15619da34\": \"This is the Awesome Headline\", \"8d5becbd-6782-4c7c-b333-0f3e009dca41\": \"h1\"}',1,'2024-11-07 20:24:14','2024-11-07 20:24:14','568ba3e9-1d0d-499a-812c-9185444bbb0e'),(32,32,1,'Home','home','__home__','{\"d124e445-a80b-469a-9b1f-2bd24c407c20\": [16]}',1,'2024-11-07 20:24:15','2024-11-07 20:24:15','be530e86-2539-41f3-86cb-c3b7616f2e85'),(33,33,1,NULL,'this-is-the-headline',NULL,'{\"37de2a41-399a-4168-83fb-b9c15619da34\": \"This is the Awesome Headline\", \"8d5becbd-6782-4c7c-b333-0f3e009dca41\": \"h1\"}',1,'2024-11-07 20:24:15','2024-11-07 20:24:15','0aaab384-dfa0-4c00-ade1-b93bc608829a'),(35,35,1,NULL,'this-is-the-headline',NULL,'{\"37de2a41-399a-4168-83fb-b9c15619da34\": \"This is the Awesome Headline\", \"8d5becbd-6782-4c7c-b333-0f3e009dca41\": \"h4\"}',1,'2024-11-07 20:24:20','2024-11-07 20:24:20','35c4bb46-1ab1-4d1b-9dd4-d8fba7ce76a6'),(36,36,1,'Home','home','__home__','{\"d124e445-a80b-469a-9b1f-2bd24c407c20\": [16]}',1,'2024-11-07 20:24:21','2024-11-07 20:24:21','b973e3b2-2238-40c1-bce4-d4b6184a98c6'),(37,37,1,NULL,'this-is-the-headline',NULL,'{\"37de2a41-399a-4168-83fb-b9c15619da34\": \"This is the Awesome Headline\", \"8d5becbd-6782-4c7c-b333-0f3e009dca41\": \"h4\"}',1,'2024-11-07 20:24:21','2024-11-07 20:24:21','5e8bd172-5f6f-4d71-8efb-778e61e0cdf5'),(39,39,1,NULL,'this-is-the-headline',NULL,'{\"37de2a41-399a-4168-83fb-b9c15619da34\": \"This is the Awesome Headline\", \"8d5becbd-6782-4c7c-b333-0f3e009dca41\": \"h1\"}',1,'2024-11-07 20:24:26','2024-11-07 20:24:26','fbe36832-635a-431a-965c-7eb7edd57ad5'),(40,40,1,'Home','home','__home__','{\"d124e445-a80b-469a-9b1f-2bd24c407c20\": [16]}',1,'2024-11-07 20:24:26','2024-11-07 20:24:26','ecda3598-3316-4a80-9444-238fc95edd27'),(41,41,1,NULL,'this-is-the-headline',NULL,'{\"37de2a41-399a-4168-83fb-b9c15619da34\": \"This is the Awesome Headline\", \"8d5becbd-6782-4c7c-b333-0f3e009dca41\": \"h1\"}',1,'2024-11-07 20:24:26','2024-11-07 20:24:26','e34c4f86-cfbb-488d-96a7-6467bc9e6aa4'),(43,43,1,NULL,'this-is-the-headline',NULL,'{\"37de2a41-399a-4168-83fb-b9c15619da34\": \"This is the Awesome Headline\", \"8d5becbd-6782-4c7c-b333-0f3e009dca41\": \"h2\"}',1,'2024-11-07 20:24:34','2024-11-07 20:24:34','096fc7de-6dff-4b8f-b30b-c703497f962b'),(44,44,1,'Home','home','__home__','{\"d124e445-a80b-469a-9b1f-2bd24c407c20\": [16]}',1,'2024-11-07 20:24:35','2024-11-07 20:24:35','d580827f-4df7-4423-88a3-8ecaf4072ac0'),(45,45,1,NULL,'this-is-the-headline',NULL,'{\"37de2a41-399a-4168-83fb-b9c15619da34\": \"This is the Awesome Headline\", \"8d5becbd-6782-4c7c-b333-0f3e009dca41\": \"h2\"}',1,'2024-11-07 20:24:35','2024-11-07 20:24:35','b73b30b6-c9e8-4b55-bd3e-7bd11d910492'),(47,47,1,NULL,'this-is-the-text-of-image-and-text',NULL,'{\"156ec57c-8e05-4add-9226-687607ff28d1\": \"This is the text of image and text\", \"34a577ab-a40d-4fdf-b455-5ccb218984f7\": []}',1,'2024-11-07 20:28:16','2024-11-21 21:39:45','329e2ba8-1573-477b-a253-d438958b0e20'),(48,48,1,'Homeee','home','__home__','{\"d124e445-a80b-469a-9b1f-2bd24c407c20\": [16]}',1,'2024-11-07 20:28:32','2024-11-07 20:28:32','39ada8f0-536b-4aed-8902-0c84e5777040'),(49,49,1,'This is the text of image and text','this-is-the-text-of-image-and-text',NULL,'{\"156ec57c-8e05-4add-9226-687607ff28d1\": \"This is the text of image and text\", \"34a577ab-a40d-4fdf-b455-5ccb218984f7\": [16]}',1,'2024-11-07 20:28:32','2024-11-07 20:28:32','edc16b84-9d8d-40df-936b-cd744027c591'),(51,51,1,'Home','home','__home__','{\"d124e445-a80b-469a-9b1f-2bd24c407c20\": [16]}',1,'2024-11-07 20:28:49','2024-11-07 20:28:49','49bd53c9-1ba9-4964-8922-c03260cab0d1'),(54,54,1,'This is the author module','this-is-the-author-module',NULL,'{\"0d56bdea-faf4-4c4c-920f-8fe32787326a\": \"there could be some intro text\", \"c522d613-d12d-4e17-ba79-8f2d47ddfc05\": [1]}',1,'2024-11-08 14:45:02','2024-11-08 14:45:02','c257a5eb-bc89-4b53-ba4a-2fc1f8e15abc'),(55,55,1,'Home','home','__home__','{\"d124e445-a80b-469a-9b1f-2bd24c407c20\": [16]}',1,'2024-11-08 14:45:02','2024-11-08 14:45:02','65266485-e5f7-4398-8278-64cc082dfb47'),(56,56,1,'This is the author module','this-is-the-author-module',NULL,'{\"0d56bdea-faf4-4c4c-920f-8fe32787326a\": \"there could be some intro text\", \"c522d613-d12d-4e17-ba79-8f2d47ddfc05\": [1]}',1,'2024-11-08 14:45:02','2024-11-08 14:45:02','bd626d36-f342-429d-88eb-def52158b184'),(59,59,1,'Cat',NULL,NULL,NULL,1,'2024-11-21 21:38:10','2024-11-21 21:38:10','6b5533e7-257b-468b-b54f-0128173be125'),(60,60,1,NULL,'this-is-the-image-text-module',NULL,'{\"156ec57c-8e05-4add-9226-687607ff28d1\": \"This is the image text module\", \"34a577ab-a40d-4fdf-b455-5ccb218984f7\": [59]}',1,'2024-11-21 21:38:30','2024-11-21 21:39:45','4300f42a-1d6f-48bc-83a3-c2beba99fd3d'),(61,61,1,'Home','home','__home__','{\"d124e445-a80b-469a-9b1f-2bd24c407c20\": [59]}',1,'2024-11-21 21:38:30','2024-11-21 21:38:30','c34645a5-fca4-415c-92cb-a35fdee42362'),(62,62,1,'This is the image text module','this-is-the-image-text-module',NULL,'{\"156ec57c-8e05-4add-9226-687607ff28d1\": \"This is the image text module\", \"34a577ab-a40d-4fdf-b455-5ccb218984f7\": [59]}',1,'2024-11-21 21:38:30','2024-11-21 21:38:30','152fe628-caec-4414-9539-8f041a6a0757'),(63,63,1,'Home','home','__home__','{\"d124e445-a80b-469a-9b1f-2bd24c407c20\": [59]}',1,'2024-11-21 21:40:35','2024-11-21 21:40:35','6a888226-5473-470b-beb6-3fabc9f92655'),(65,65,1,'Home','home','__home__','{\"d124e445-a80b-469a-9b1f-2bd24c407c20\": [59]}',1,'2024-11-21 21:40:41','2024-11-21 21:40:41','9b0d35c6-96c9-494e-9d5b-258428b8e11d'),(68,68,1,NULL,'__temp_nlmlqohsalvtizertuxdqgntpogowzvjkbpq',NULL,'{\"156ec57c-8e05-4add-9226-687607ff28d1\": \"Awesome cat party at my house\", \"34a577ab-a40d-4fdf-b455-5ccb218984f7\": [59]}',1,'2024-11-21 21:41:31','2024-11-21 21:41:31','d2a2ab29-473b-447d-aef6-5d35ae3995eb'),(69,69,1,'News 1','news-1','news/news-1','{\"d124e445-a80b-469a-9b1f-2bd24c407c20\": [59]}',1,'2024-11-21 21:41:31','2024-11-21 21:41:31','ff94c6c6-deeb-48a1-bbad-55bc21a27131'),(70,70,1,NULL,'__temp_nlmlqohsalvtizertuxdqgntpogowzvjkbpq',NULL,'{\"156ec57c-8e05-4add-9226-687607ff28d1\": \"Awesome cat party at my house\", \"34a577ab-a40d-4fdf-b455-5ccb218984f7\": [59]}',1,'2024-11-21 21:41:31','2024-11-21 21:41:31','7286bd6f-dafe-4034-9a50-b1a3a84bdfe4');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (2,1,NULL,NULL,NULL,1,'2024-11-07 16:38:00',NULL,NULL,'2024-11-07 16:38:27','2024-11-07 16:38:27'),(3,1,NULL,NULL,NULL,1,'2024-11-07 16:38:00',NULL,NULL,'2024-11-07 16:38:27','2024-11-07 16:38:27'),(4,1,NULL,NULL,NULL,1,'2024-11-07 16:38:00',NULL,NULL,'2024-11-07 16:39:28','2024-11-07 16:39:28'),(9,NULL,NULL,2,5,3,'2024-11-07 16:44:00',NULL,0,'2024-11-07 16:45:05','2024-11-07 16:45:05'),(10,NULL,NULL,2,5,2,'2024-11-07 16:44:00',NULL,0,'2024-11-07 16:45:05','2024-11-07 16:45:05'),(11,1,NULL,NULL,NULL,1,'2024-11-07 16:38:00',NULL,NULL,'2024-11-07 16:45:05','2024-11-07 16:45:05'),(12,NULL,NULL,11,5,3,'2024-11-07 16:44:00',NULL,NULL,'2024-11-07 16:45:05','2024-11-07 16:45:05'),(13,NULL,NULL,11,5,2,'2024-11-07 16:44:00',NULL,NULL,'2024-11-07 16:45:05','2024-11-07 16:45:05'),(15,1,NULL,NULL,NULL,1,'2024-11-07 16:38:00',NULL,NULL,'2024-11-07 16:45:13','2024-11-07 16:45:13'),(18,NULL,NULL,2,5,2,'2024-11-07 16:44:00',NULL,0,'2024-11-07 16:49:21','2024-11-07 16:49:22'),(19,1,NULL,NULL,NULL,1,'2024-11-07 16:38:00',NULL,NULL,'2024-11-07 16:49:22','2024-11-07 16:49:22'),(20,NULL,NULL,19,5,2,'2024-11-07 16:44:00',NULL,NULL,'2024-11-07 16:49:22','2024-11-07 16:49:22'),(21,2,NULL,NULL,NULL,1,'2024-11-07 19:59:00',NULL,NULL,'2024-11-07 19:59:41','2024-11-07 19:59:55'),(22,2,NULL,NULL,NULL,1,'2024-11-07 19:59:00',NULL,NULL,'2024-11-07 19:59:55','2024-11-07 19:59:55'),(24,1,NULL,NULL,NULL,1,'2024-11-07 16:38:00',NULL,NULL,'2024-11-07 20:17:14','2024-11-07 20:17:14'),(25,1,NULL,NULL,NULL,1,'2024-11-07 16:38:00',NULL,NULL,'2024-11-07 20:19:11','2024-11-07 20:19:11'),(27,NULL,NULL,2,5,3,'2024-11-07 16:44:00',NULL,0,'2024-11-07 20:19:27','2024-11-07 20:19:34'),(28,1,NULL,NULL,NULL,1,'2024-11-07 16:38:00',NULL,NULL,'2024-11-07 20:19:34','2024-11-07 20:19:34'),(29,NULL,NULL,28,5,3,'2024-11-07 16:44:00',NULL,NULL,'2024-11-07 20:19:34','2024-11-07 20:19:34'),(31,NULL,NULL,2,5,3,'2024-11-07 16:44:00',NULL,0,'2024-11-07 20:24:14','2024-11-07 20:24:15'),(32,1,NULL,NULL,NULL,1,'2024-11-07 16:38:00',NULL,NULL,'2024-11-07 20:24:15','2024-11-07 20:24:15'),(33,NULL,NULL,32,5,3,'2024-11-07 16:44:00',NULL,NULL,'2024-11-07 20:24:15','2024-11-07 20:24:15'),(35,NULL,NULL,2,5,3,'2024-11-07 16:44:00',NULL,0,'2024-11-07 20:24:20','2024-11-07 20:24:21'),(36,1,NULL,NULL,NULL,1,'2024-11-07 16:38:00',NULL,NULL,'2024-11-07 20:24:21','2024-11-07 20:24:21'),(37,NULL,NULL,36,5,3,'2024-11-07 16:44:00',NULL,NULL,'2024-11-07 20:24:21','2024-11-07 20:24:21'),(39,NULL,NULL,2,5,3,'2024-11-07 16:44:00',NULL,0,'2024-11-07 20:24:26','2024-11-07 20:24:26'),(40,1,NULL,NULL,NULL,1,'2024-11-07 16:38:00',NULL,NULL,'2024-11-07 20:24:26','2024-11-07 20:24:26'),(41,NULL,NULL,40,5,3,'2024-11-07 16:44:00',NULL,NULL,'2024-11-07 20:24:26','2024-11-07 20:24:26'),(43,NULL,NULL,2,5,3,'2024-11-07 16:44:00',NULL,NULL,'2024-11-07 20:24:34','2024-11-07 20:24:35'),(44,1,NULL,NULL,NULL,1,'2024-11-07 16:38:00',NULL,NULL,'2024-11-07 20:24:35','2024-11-07 20:24:35'),(45,NULL,NULL,44,5,3,'2024-11-07 16:44:00',NULL,NULL,'2024-11-07 20:24:35','2024-11-07 20:24:35'),(47,NULL,NULL,2,5,2,'2024-11-07 16:44:00',NULL,0,'2024-11-07 20:28:16','2024-11-07 20:28:32'),(48,1,NULL,NULL,NULL,1,'2024-11-07 16:38:00',NULL,NULL,'2024-11-07 20:28:32','2024-11-07 20:28:32'),(49,NULL,NULL,48,5,2,'2024-11-07 16:44:00',NULL,NULL,'2024-11-07 20:28:32','2024-11-07 20:28:32'),(51,1,NULL,NULL,NULL,1,'2024-11-07 16:38:00',NULL,NULL,'2024-11-07 20:28:49','2024-11-07 20:28:49'),(54,NULL,NULL,2,5,4,'2024-11-08 14:44:00',NULL,NULL,'2024-11-08 14:45:02','2024-11-08 14:45:02'),(55,1,NULL,NULL,NULL,1,'2024-11-07 16:38:00',NULL,NULL,'2024-11-08 14:45:02','2024-11-08 14:45:02'),(56,NULL,NULL,55,5,4,'2024-11-08 14:44:00',NULL,NULL,'2024-11-08 14:45:02','2024-11-08 14:45:02'),(60,NULL,NULL,2,5,2,'2024-11-21 21:35:00',NULL,NULL,'2024-11-21 21:38:30','2024-11-21 21:38:30'),(61,1,NULL,NULL,NULL,1,'2024-11-07 16:38:00',NULL,NULL,'2024-11-21 21:38:30','2024-11-21 21:38:30'),(62,NULL,NULL,61,5,2,'2024-11-21 21:35:00',NULL,NULL,'2024-11-21 21:38:30','2024-11-21 21:38:30'),(63,1,NULL,NULL,NULL,1,'2024-11-07 16:38:00',NULL,NULL,'2024-11-21 21:40:35','2024-11-21 21:40:35'),(65,1,NULL,NULL,NULL,1,'2024-11-07 16:38:00',NULL,NULL,'2024-11-21 21:40:41','2024-11-21 21:40:41'),(68,NULL,NULL,21,5,2,'2024-11-21 21:41:00',NULL,NULL,'2024-11-21 21:41:31','2024-11-21 21:41:31'),(69,2,NULL,NULL,NULL,1,'2024-11-07 19:59:00',NULL,NULL,'2024-11-21 21:41:31','2024-11-21 21:41:31'),(70,NULL,NULL,69,5,2,'2024-11-21 21:41:00',NULL,NULL,'2024-11-21 21:41:31','2024-11-21 21:41:31');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries_authors`
--

LOCK TABLES `entries_authors` WRITE;
/*!40000 ALTER TABLE `entries_authors` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries_authors` VALUES (21,1,1),(22,1,1),(69,1,1);
/*!40000 ALTER TABLE `entries_authors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,2,'Entry: Default','entry_default','',NULL,1,'site',NULL,'',1,'site',NULL,1,'2024-11-07 16:38:23','2024-11-07 16:44:05',NULL,'27541a86-a923-489e-a772-e7081c0ec88a'),(2,3,'Block: Image Text','block_imageText','',NULL,0,'site',NULL,'',1,'site',NULL,1,'2024-11-07 16:39:08','2024-11-21 21:39:44',NULL,'34d5e048-0128-4fc4-abf3-0414145729f2'),(3,4,'Block: Headline','block_headline','',NULL,0,'site',NULL,'',1,'site',NULL,1,'2024-11-07 16:40:39','2024-11-07 20:19:03',NULL,'b0d48687-1e44-4d17-a816-07ef88cf30de'),(4,5,'Block: Author','block_author','',NULL,1,'site',NULL,'',1,'site',NULL,1,'2024-11-08 14:44:14','2024-11-21 21:35:30',NULL,'94a69073-ffd1-4bc0-a6fb-703072ae99fa');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Asset','{\"tabs\": [{\"uid\": \"ae3025f8-c35a-486c-90db-f8c294c4ec70\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"8e20ba56-3871-46b5-97b2-1d368ca6766d\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-11-07T16:35:19+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"id\": null, \"tip\": null, \"uid\": \"5b85c134-d32c-41aa-9e7d-b6b6385068af\", \"cols\": null, \"name\": null, \"rows\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AltField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": false, \"attribute\": \"alt\", \"dateAdded\": \"2024-11-07T16:36:28+00:00\", \"requirable\": true, \"orientation\": null, \"placeholder\": null, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}]}','2024-11-07 16:36:28','2024-11-07 16:36:28',NULL,'995bfff2-93ee-4973-b1b9-181628274c7c'),(2,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"f95fce80-0aae-4f8c-8cac-d8bb5eadbcde\", \"name\": \"Content\", \"elements\": [{\"uid\": \"ac8b9ac7-a1d8-493a-8083-e3b7134593fb\", \"type\": \"craft\\\\fieldlayoutelements\\\\Heading\", \"heading\": \"Hero\", \"dateAdded\": \"2024-11-07T16:38:23+00:00\", \"userCondition\": null, \"elementCondition\": null}, {\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"52245e95-24a0-4570-b987-3bcf2b41e4ca\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 50, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-11-07T16:36:36+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"d124e445-a80b-469a-9b1f-2bd24c407c20\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 50, \"handle\": null, \"warning\": null, \"fieldUid\": \"03765a14-8035-4d3a-bada-9ec41b6f99e5\", \"required\": false, \"dateAdded\": \"2024-11-07T16:38:23+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"uid\": \"29292a79-5156-436d-ae2b-de676b154b75\", \"type\": \"craft\\\\fieldlayoutelements\\\\Heading\", \"heading\": \"Content\", \"dateAdded\": \"2024-11-07T16:42:57+00:00\", \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"a4fd9b77-7397-4ecd-b45b-0a09ea22433d\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"677c0116-c363-4e74-b5ab-87aaeaaf261d\", \"required\": false, \"dateAdded\": \"2024-11-07T16:42:57+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}','2024-11-07 16:38:23','2024-11-07 16:42:57',NULL,'65848ce2-bbf3-4af3-b1a3-296367ea1d1f'),(3,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"c70b0b64-a33c-4b6d-99f0-2df664bfa1b4\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"156ec57c-8e05-4add-9226-687607ff28d1\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 50, \"handle\": null, \"warning\": null, \"fieldUid\": \"613e3fb4-ca6e-40cb-81f9-dfb72e3f0484\", \"required\": false, \"dateAdded\": \"2024-11-07T16:40:07+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"34a577ab-a40d-4fdf-b455-5ccb218984f7\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 50, \"handle\": null, \"warning\": null, \"fieldUid\": \"03765a14-8035-4d3a-bada-9ec41b6f99e5\", \"required\": false, \"dateAdded\": \"2024-11-07T16:39:08+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"59f67a5e-2968-4dd5-acf1-44c84c33f99c\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-11-07T16:37:35+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}]}','2024-11-07 16:39:08','2024-11-07 16:40:07',NULL,'adb26259-aa13-4ade-b9e9-d423196e51e9'),(4,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"cb1b257e-4e3c-4b1e-a480-df09b07fbe22\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"0bb7c328-db3f-41be-a58e-73098f1e5982\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 75, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-11-07T16:39:21+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"37de2a41-399a-4168-83fb-b9c15619da34\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 75, \"handle\": null, \"warning\": null, \"fieldUid\": \"613e3fb4-ca6e-40cb-81f9-dfb72e3f0484\", \"required\": false, \"dateAdded\": \"2024-11-07T20:19:03+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"8d5becbd-6782-4c7c-b333-0f3e009dca41\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 25, \"handle\": null, \"warning\": null, \"fieldUid\": \"49e9100f-d9e4-4289-88ec-d8711b06ef1a\", \"required\": false, \"dateAdded\": \"2024-11-07T16:41:35+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}','2024-11-07 16:40:39','2024-11-07 20:19:50',NULL,'e649d7a2-ba3c-4fe9-a89f-6887ced68078'),(5,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"9033fae6-572b-452f-ba3b-3f81ae69fc26\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"4ea77f38-9bcc-40dc-9ee6-c877a82ae8a0\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": \"Headline\", \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-11-08T14:41:30+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"0d56bdea-faf4-4c4c-920f-8fe32787326a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 50, \"handle\": null, \"warning\": null, \"fieldUid\": \"613e3fb4-ca6e-40cb-81f9-dfb72e3f0484\", \"required\": false, \"dateAdded\": \"2024-11-08T14:44:14+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"c522d613-d12d-4e17-ba79-8f2d47ddfc05\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 50, \"handle\": null, \"warning\": null, \"fieldUid\": \"f58e1976-da02-4678-93be-a8def53fbc4e\", \"required\": false, \"dateAdded\": \"2024-11-08T14:44:14+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}','2024-11-08 14:44:14','2024-11-08 14:44:14',NULL,'d58fd658-c73c-4698-8391-95f39ccfc467');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (1,'Asset','asset','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:31f620da-7617-49ed-be03-9ff85694c893\",\"defaultUploadLocationSubpath\":null,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:31f620da-7617-49ed-be03-9ff85694c893\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2024-11-07 16:36:46','2024-11-07 16:36:46',NULL,'03765a14-8035-4d3a-bada-9ec41b6f99e5'),(2,'Entry','entry','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"branchLimit\":null,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2024-11-07 16:37:14','2024-11-07 16:37:14',NULL,'6a9c7573-e73a-4370-8e28-d50007a36721'),(3,'Text','text','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-11-07 16:39:21','2024-11-07 16:39:21',NULL,'613e3fb4-ca6e-40cb-81f9-dfb72e3f0484'),(4,'Headline Tag','headlineTag','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"H1\",\"value\":\"h1\",\"default\":\"\"},{\"label\":\"H2\",\"value\":\"h2\",\"default\":\"1\"},{\"label\":\"H3\",\"value\":\"h3\",\"default\":\"\"},{\"label\":\"H4\",\"value\":\"h4\",\"default\":\"\"}]}','2024-11-07 16:41:18','2024-11-07 16:41:18',NULL,'49e9100f-d9e4-4289-88ec-d8711b06ef1a'),(5,'Content Builder','contentBuilder','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"createButtonLabel\":null,\"entryTypes\":[\"b0d48687-1e44-4d17-a816-07ef88cf30de\",\"34d5e048-0128-4fc4-abf3-0414145729f2\",\"94a69073-ffd1-4bc0-a6fb-703072ae99fa\"],\"includeTableView\":false,\"maxEntries\":null,\"minEntries\":null,\"pageSize\":null,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"blocks\"}','2024-11-07 16:42:21','2024-11-08 14:44:26',NULL,'677c0116-c363-4e74-b5ab-87aaeaaf261d'),(6,'Select Users','selectUsers','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Users','{\"allowSelfRelations\":false,\"branchLimit\":null,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2024-11-08 14:43:25','2024-11-08 14:43:25',NULL,'f58e1976-da02-4678-93be-a8def53fbc4e');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'5.4.10','5.3.0.2',0,'zmewvamephbv','3@lrrljsudnq','2024-11-07 16:27:01','2024-11-21 21:39:44','4965b6eb-7d49-4bd7-9ef3-2f4ac8887f39');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','eb148dcc-53fc-4ebd-8431-6dd9f81123ed'),(2,'craft','m221101_115859_create_entries_authors_table','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','1a66e0ae-e300-49c7-9b26-9a30dcfed42c'),(3,'craft','m221107_112121_add_max_authors_to_sections','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','2260b5c2-6eb9-47f1-99ab-85034cbbdd23'),(4,'craft','m221205_082005_translatable_asset_alt_text','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','b632ddc6-18c3-491d-b714-6a18806fab7e'),(5,'craft','m230314_110309_add_authenticator_table','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','58546c09-f676-4b91-945d-793dd65f66f2'),(6,'craft','m230314_111234_add_webauthn_table','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','e122bf17-bd9a-41da-81f9-384ea4b385bc'),(7,'craft','m230503_120303_add_recoverycodes_table','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','31eb1b9d-8e78-4b52-bb27-e7c5cb9abd8f'),(8,'craft','m230511_000000_field_layout_configs','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','3113eef4-16ff-4dfa-878b-1d763def44d3'),(9,'craft','m230511_215903_content_refactor','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','267dea15-7633-4f20-84f3-b464d3dfcd11'),(10,'craft','m230524_000000_add_entry_type_show_slug_field','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','4231d03c-583e-49c9-9b71-190030f9a14e'),(11,'craft','m230524_000001_entry_type_icons','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','1746f8c7-2c9f-4d0b-a64f-5b0654fa0a2f'),(12,'craft','m230524_000002_entry_type_colors','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','d2feecdd-5dae-468d-baff-b950edbdc78a'),(13,'craft','m230524_220029_global_entry_types','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','f8fb7cd4-d85b-4487-824c-53ec2b51ca85'),(14,'craft','m230531_123004_add_entry_type_show_status_field','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','39532cc2-8896-457a-a8d0-19ecf8fb5dd9'),(15,'craft','m230607_102049_add_entrytype_slug_translation_columns','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','9a1996dd-86d6-4c2e-b180-8a21b0cb06ed'),(16,'craft','m230616_173810_kill_field_groups','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','9d4a97c2-e160-4599-aaa4-48565f75e22c'),(17,'craft','m230616_183820_remove_field_name_limit','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','4a3efc99-d5a6-4243-85f5-ff92cace0907'),(18,'craft','m230617_070415_entrify_matrix_blocks','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','041101cd-343f-4e4c-b0d0-bde84b31a675'),(19,'craft','m230710_162700_element_activity','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','8c10b417-d2d0-483c-88ae-75c710187836'),(20,'craft','m230820_162023_fix_cache_id_type','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','94b16a69-5cd1-4a90-9982-7d2b74744e63'),(21,'craft','m230826_094050_fix_session_id_type','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','239aaaf4-cb4e-4a21-bbb6-689b6a7cc5ce'),(22,'craft','m230904_190356_address_fields','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','433770df-018c-46de-ba03-0be22b31451a'),(23,'craft','m230928_144045_add_subpath_to_volumes','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','44b384ab-7f6f-42fd-8b64-18e051ce8901'),(24,'craft','m231013_185640_changedfields_amend_primary_key','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','436fea50-fd81-41b8-be20-e46d6ecdd7fa'),(25,'craft','m231213_030600_element_bulk_ops','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','e47188f2-1eb6-40cf-a445-a66c11000e94'),(26,'craft','m240129_150719_sites_language_amend_length','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','27a6d49d-e9a4-40c6-ad98-099a0f83543a'),(27,'craft','m240206_035135_convert_json_columns','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','e45af20f-a528-43a5-afed-b2c497fa6e3d'),(28,'craft','m240207_182452_address_line_3','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','990b097d-c64d-4272-8f30-554c8f41d8b2'),(29,'craft','m240302_212719_solo_preview_targets','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','929e37a3-b248-4893-bc51-e2284badc8c1'),(30,'craft','m240619_091352_add_auth_2fa_timestamp','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','b7245e4e-5e82-406c-8e8f-e858f88030d4'),(31,'craft','m240723_214330_drop_bulkop_fk','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','a87ff0a5-46c3-456c-8305-8c8eb4d472c5'),(32,'craft','m240731_053543_soft_delete_fields','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','179516a2-1e75-4b40-b806-ec8591740810'),(33,'craft','m240805_154041_sso_identities','2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-07 16:27:02','6863c99b-8647-4846-9eab-b5c5818114e5');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'craft-query-api','1.1.1','1.0.0','2024-11-07 17:03:13','2024-11-07 17:03:13','2024-11-21 21:28:55','7389a65e-dc20-44d3-b032-a7f7ca5b6047');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('dateModified','1732225184'),('email.fromEmail','\"samuelreichor@gmail.com\"'),('email.fromName','\"Craft Nuxt\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.color','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elementCondition','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.0.dateAdded','\"2024-11-07T16:38:23+00:00\"'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.0.elementCondition','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.0.heading','\"Hero\"'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\Heading\"'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.0.uid','\"ac8b9ac7-a1d8-493a-8083-e3b7134593fb\"'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.0.userCondition','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.1.autocapitalize','true'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.1.autocomplete','false'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.1.autocorrect','true'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.1.class','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.1.dateAdded','\"2024-11-07T16:36:36+00:00\"'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.1.disabled','false'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.1.elementCondition','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.1.id','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.1.includeInCards','false'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.1.inputType','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.1.instructions','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.1.label','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.1.max','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.1.min','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.1.name','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.1.orientation','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.1.placeholder','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.1.providesThumbs','false'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.1.readonly','false'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.1.requirable','false'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.1.size','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.1.step','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.1.tip','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.1.title','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.1.uid','\"52245e95-24a0-4570-b987-3bcf2b41e4ca\"'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.1.userCondition','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.1.warning','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.1.width','50'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.2.dateAdded','\"2024-11-07T16:38:23+00:00\"'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.2.elementCondition','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.2.fieldUid','\"03765a14-8035-4d3a-bada-9ec41b6f99e5\"'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.2.handle','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.2.includeInCards','false'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.2.instructions','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.2.label','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.2.providesThumbs','false'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.2.required','false'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.2.tip','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.2.uid','\"d124e445-a80b-469a-9b1f-2bd24c407c20\"'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.2.userCondition','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.2.warning','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.2.width','50'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.3.dateAdded','\"2024-11-07T16:42:57+00:00\"'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.3.elementCondition','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.3.heading','\"Content\"'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\Heading\"'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.3.uid','\"29292a79-5156-436d-ae2b-de676b154b75\"'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.3.userCondition','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.4.dateAdded','\"2024-11-07T16:42:57+00:00\"'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.4.elementCondition','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.4.fieldUid','\"677c0116-c363-4e74-b5ab-87aaeaaf261d\"'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.4.handle','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.4.includeInCards','false'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.4.instructions','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.4.label','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.4.providesThumbs','false'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.4.required','false'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.4.tip','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.4.uid','\"a4fd9b77-7397-4ecd-b45b-0a09ea22433d\"'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.4.userCondition','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.4.warning','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.elements.4.width','100'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.name','\"Content\"'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.uid','\"f95fce80-0aae-4f8c-8cac-d8bb5eadbcde\"'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.fieldLayouts.65848ce2-bbf3-4af3-b1a3-296367ea1d1f.tabs.0.userCondition','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.handle','\"entry_default\"'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.hasTitleField','true'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.icon','\"\"'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.name','\"Entry: Default\"'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.showSlugField','true'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.showStatusField','true'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.slugTranslationKeyFormat','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.slugTranslationMethod','\"site\"'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.titleFormat','\"\"'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.titleTranslationKeyFormat','null'),('entryTypes.27541a86-a923-489e-a772-e7081c0ec88a.titleTranslationMethod','\"site\"'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.color','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elementCondition','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.0.dateAdded','\"2024-11-07T16:40:07+00:00\"'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.0.elementCondition','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.0.fieldUid','\"613e3fb4-ca6e-40cb-81f9-dfb72e3f0484\"'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.0.handle','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.0.includeInCards','false'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.0.instructions','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.0.label','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.0.providesThumbs','false'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.0.required','false'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.0.tip','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.0.uid','\"156ec57c-8e05-4add-9226-687607ff28d1\"'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.0.userCondition','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.0.warning','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.0.width','50'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.1.dateAdded','\"2024-11-07T16:39:08+00:00\"'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.1.elementCondition','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.1.fieldUid','\"03765a14-8035-4d3a-bada-9ec41b6f99e5\"'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.1.handle','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.1.includeInCards','false'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.1.instructions','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.1.label','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.1.providesThumbs','false'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.1.required','false'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.1.tip','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.1.uid','\"34a577ab-a40d-4fdf-b455-5ccb218984f7\"'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.1.userCondition','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.1.warning','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.1.width','50'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.2.autocapitalize','true'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.2.autocomplete','false'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.2.autocorrect','true'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.2.class','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.2.dateAdded','\"2024-11-07T16:37:35+00:00\"'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.2.disabled','false'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.2.elementCondition','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.2.id','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.2.includeInCards','false'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.2.inputType','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.2.instructions','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.2.label','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.2.max','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.2.min','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.2.name','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.2.orientation','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.2.placeholder','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.2.providesThumbs','false'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.2.readonly','false'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.2.requirable','false'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.2.size','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.2.step','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.2.tip','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.2.title','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.2.uid','\"59f67a5e-2968-4dd5-acf1-44c84c33f99c\"'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.2.userCondition','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.2.warning','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.elements.2.width','100'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.name','\"Content\"'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.uid','\"c70b0b64-a33c-4b6d-99f0-2df664bfa1b4\"'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.fieldLayouts.adb26259-aa13-4ade-b9e9-d423196e51e9.tabs.0.userCondition','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.handle','\"block_imageText\"'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.hasTitleField','false'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.icon','\"\"'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.name','\"Block: Image Text\"'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.showSlugField','true'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.showStatusField','true'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.slugTranslationKeyFormat','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.slugTranslationMethod','\"site\"'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.titleFormat','\"\"'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.titleTranslationKeyFormat','null'),('entryTypes.34d5e048-0128-4fc4-abf3-0414145729f2.titleTranslationMethod','\"site\"'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.color','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elementCondition','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.0.autocapitalize','true'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.0.autocomplete','false'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.0.autocorrect','true'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.0.class','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.0.dateAdded','\"2024-11-08T14:41:30+00:00\"'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.0.disabled','false'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.0.elementCondition','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.0.id','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.0.includeInCards','false'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.0.inputType','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.0.instructions','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.0.label','\"Headline\"'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.0.max','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.0.min','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.0.name','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.0.orientation','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.0.placeholder','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.0.providesThumbs','false'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.0.readonly','false'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.0.requirable','false'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.0.size','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.0.step','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.0.tip','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.0.title','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.0.uid','\"4ea77f38-9bcc-40dc-9ee6-c877a82ae8a0\"'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.0.userCondition','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.0.warning','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.0.width','100'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.1.dateAdded','\"2024-11-08T14:44:14+00:00\"'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.1.elementCondition','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.1.fieldUid','\"613e3fb4-ca6e-40cb-81f9-dfb72e3f0484\"'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.1.handle','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.1.includeInCards','false'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.1.instructions','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.1.label','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.1.providesThumbs','false'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.1.required','false'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.1.tip','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.1.uid','\"0d56bdea-faf4-4c4c-920f-8fe32787326a\"'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.1.userCondition','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.1.warning','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.1.width','50'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.2.dateAdded','\"2024-11-08T14:44:14+00:00\"'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.2.elementCondition','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.2.fieldUid','\"f58e1976-da02-4678-93be-a8def53fbc4e\"'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.2.handle','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.2.includeInCards','false'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.2.instructions','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.2.label','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.2.providesThumbs','false'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.2.required','false'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.2.tip','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.2.uid','\"c522d613-d12d-4e17-ba79-8f2d47ddfc05\"'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.2.userCondition','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.2.warning','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.elements.2.width','50'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.name','\"Content\"'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.uid','\"9033fae6-572b-452f-ba3b-3f81ae69fc26\"'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.fieldLayouts.d58fd658-c73c-4698-8391-95f39ccfc467.tabs.0.userCondition','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.handle','\"block_author\"'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.hasTitleField','true'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.icon','\"\"'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.name','\"Block: Author\"'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.showSlugField','true'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.showStatusField','true'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.slugTranslationKeyFormat','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.slugTranslationMethod','\"site\"'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.titleFormat','\"\"'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.titleTranslationKeyFormat','null'),('entryTypes.94a69073-ffd1-4bc0-a6fb-703072ae99fa.titleTranslationMethod','\"site\"'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.color','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elementCondition','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.0.autocapitalize','true'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.0.autocomplete','false'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.0.autocorrect','true'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.0.class','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.0.dateAdded','\"2024-11-07T16:39:21+00:00\"'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.0.disabled','false'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.0.elementCondition','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.0.id','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.0.includeInCards','false'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.0.inputType','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.0.instructions','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.0.label','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.0.max','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.0.min','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.0.name','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.0.orientation','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.0.placeholder','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.0.providesThumbs','false'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.0.readonly','false'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.0.requirable','false'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.0.size','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.0.step','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.0.tip','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.0.title','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.0.uid','\"0bb7c328-db3f-41be-a58e-73098f1e5982\"'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.0.userCondition','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.0.warning','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.0.width','75'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.1.dateAdded','\"2024-11-07T20:19:03+00:00\"'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.1.elementCondition','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.1.fieldUid','\"613e3fb4-ca6e-40cb-81f9-dfb72e3f0484\"'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.1.handle','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.1.includeInCards','false'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.1.instructions','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.1.label','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.1.providesThumbs','false'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.1.required','false'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.1.tip','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.1.uid','\"37de2a41-399a-4168-83fb-b9c15619da34\"'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.1.userCondition','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.1.warning','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.1.width','75'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.2.dateAdded','\"2024-11-07T16:41:35+00:00\"'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.2.elementCondition','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.2.fieldUid','\"49e9100f-d9e4-4289-88ec-d8711b06ef1a\"'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.2.handle','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.2.includeInCards','false'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.2.instructions','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.2.label','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.2.providesThumbs','false'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.2.required','false'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.2.tip','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.2.uid','\"8d5becbd-6782-4c7c-b333-0f3e009dca41\"'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.2.userCondition','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.2.warning','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.elements.2.width','25'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.name','\"Content\"'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.uid','\"cb1b257e-4e3c-4b1e-a480-df09b07fbe22\"'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.fieldLayouts.e649d7a2-ba3c-4fe9-a89f-6887ced68078.tabs.0.userCondition','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.handle','\"block_headline\"'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.hasTitleField','false'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.icon','\"\"'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.name','\"Block: Headline\"'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.showSlugField','true'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.showStatusField','true'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.slugTranslationKeyFormat','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.slugTranslationMethod','\"site\"'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.titleFormat','\"\"'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.titleTranslationKeyFormat','null'),('entryTypes.b0d48687-1e44-4d17-a816-07ef88cf30de.titleTranslationMethod','\"site\"'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.columnSuffix','null'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.handle','\"asset\"'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.instructions','null'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.name','\"Asset\"'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.searchable','false'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.settings.allowedKinds','null'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.settings.allowSelfRelations','false'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.settings.allowSubfolders','false'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.settings.allowUploads','true'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.settings.branchLimit','null'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.settings.defaultUploadLocationSource','\"volume:31f620da-7617-49ed-be03-9ff85694c893\"'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.settings.defaultUploadLocationSubpath','null'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.settings.maintainHierarchy','false'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.settings.maxRelations','null'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.settings.minRelations','null'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.settings.previewMode','\"full\"'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.settings.restrictedDefaultUploadSubpath','null'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.settings.restrictedLocationSource','\"volume:31f620da-7617-49ed-be03-9ff85694c893\"'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.settings.restrictedLocationSubpath','null'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.settings.restrictFiles','false'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.settings.restrictLocation','false'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.settings.selectionLabel','null'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.settings.showCardsInGrid','false'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.settings.showSiteMenu','false'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.settings.showUnpermittedFiles','false'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.settings.showUnpermittedVolumes','false'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.settings.sources','\"*\"'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.settings.targetSiteId','null'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.settings.validateRelatedElements','false'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.settings.viewMode','\"list\"'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.translationKeyFormat','null'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.translationMethod','\"none\"'),('fields.03765a14-8035-4d3a-bada-9ec41b6f99e5.type','\"craft\\\\fields\\\\Assets\"'),('fields.49e9100f-d9e4-4289-88ec-d8711b06ef1a.columnSuffix','null'),('fields.49e9100f-d9e4-4289-88ec-d8711b06ef1a.handle','\"headlineTag\"'),('fields.49e9100f-d9e4-4289-88ec-d8711b06ef1a.instructions','null'),('fields.49e9100f-d9e4-4289-88ec-d8711b06ef1a.name','\"Headline Tag\"'),('fields.49e9100f-d9e4-4289-88ec-d8711b06ef1a.searchable','false'),('fields.49e9100f-d9e4-4289-88ec-d8711b06ef1a.settings.options.0.__assoc__.0.0','\"label\"'),('fields.49e9100f-d9e4-4289-88ec-d8711b06ef1a.settings.options.0.__assoc__.0.1','\"H1\"'),('fields.49e9100f-d9e4-4289-88ec-d8711b06ef1a.settings.options.0.__assoc__.1.0','\"value\"'),('fields.49e9100f-d9e4-4289-88ec-d8711b06ef1a.settings.options.0.__assoc__.1.1','\"h1\"'),('fields.49e9100f-d9e4-4289-88ec-d8711b06ef1a.settings.options.0.__assoc__.2.0','\"default\"'),('fields.49e9100f-d9e4-4289-88ec-d8711b06ef1a.settings.options.0.__assoc__.2.1','\"\"'),('fields.49e9100f-d9e4-4289-88ec-d8711b06ef1a.settings.options.1.__assoc__.0.0','\"label\"'),('fields.49e9100f-d9e4-4289-88ec-d8711b06ef1a.settings.options.1.__assoc__.0.1','\"H2\"'),('fields.49e9100f-d9e4-4289-88ec-d8711b06ef1a.settings.options.1.__assoc__.1.0','\"value\"'),('fields.49e9100f-d9e4-4289-88ec-d8711b06ef1a.settings.options.1.__assoc__.1.1','\"h2\"'),('fields.49e9100f-d9e4-4289-88ec-d8711b06ef1a.settings.options.1.__assoc__.2.0','\"default\"'),('fields.49e9100f-d9e4-4289-88ec-d8711b06ef1a.settings.options.1.__assoc__.2.1','\"1\"'),('fields.49e9100f-d9e4-4289-88ec-d8711b06ef1a.settings.options.2.__assoc__.0.0','\"label\"'),('fields.49e9100f-d9e4-4289-88ec-d8711b06ef1a.settings.options.2.__assoc__.0.1','\"H3\"'),('fields.49e9100f-d9e4-4289-88ec-d8711b06ef1a.settings.options.2.__assoc__.1.0','\"value\"'),('fields.49e9100f-d9e4-4289-88ec-d8711b06ef1a.settings.options.2.__assoc__.1.1','\"h3\"'),('fields.49e9100f-d9e4-4289-88ec-d8711b06ef1a.settings.options.2.__assoc__.2.0','\"default\"'),('fields.49e9100f-d9e4-4289-88ec-d8711b06ef1a.settings.options.2.__assoc__.2.1','\"\"'),('fields.49e9100f-d9e4-4289-88ec-d8711b06ef1a.settings.options.3.__assoc__.0.0','\"label\"'),('fields.49e9100f-d9e4-4289-88ec-d8711b06ef1a.settings.options.3.__assoc__.0.1','\"H4\"'),('fields.49e9100f-d9e4-4289-88ec-d8711b06ef1a.settings.options.3.__assoc__.1.0','\"value\"'),('fields.49e9100f-d9e4-4289-88ec-d8711b06ef1a.settings.options.3.__assoc__.1.1','\"h4\"'),('fields.49e9100f-d9e4-4289-88ec-d8711b06ef1a.settings.options.3.__assoc__.2.0','\"default\"'),('fields.49e9100f-d9e4-4289-88ec-d8711b06ef1a.settings.options.3.__assoc__.2.1','\"\"'),('fields.49e9100f-d9e4-4289-88ec-d8711b06ef1a.translationKeyFormat','null'),('fields.49e9100f-d9e4-4289-88ec-d8711b06ef1a.translationMethod','\"none\"'),('fields.49e9100f-d9e4-4289-88ec-d8711b06ef1a.type','\"craft\\\\fields\\\\Dropdown\"'),('fields.613e3fb4-ca6e-40cb-81f9-dfb72e3f0484.columnSuffix','null'),('fields.613e3fb4-ca6e-40cb-81f9-dfb72e3f0484.handle','\"text\"'),('fields.613e3fb4-ca6e-40cb-81f9-dfb72e3f0484.instructions','null'),('fields.613e3fb4-ca6e-40cb-81f9-dfb72e3f0484.name','\"Text\"'),('fields.613e3fb4-ca6e-40cb-81f9-dfb72e3f0484.searchable','false'),('fields.613e3fb4-ca6e-40cb-81f9-dfb72e3f0484.settings.byteLimit','null'),('fields.613e3fb4-ca6e-40cb-81f9-dfb72e3f0484.settings.charLimit','null'),('fields.613e3fb4-ca6e-40cb-81f9-dfb72e3f0484.settings.code','false'),('fields.613e3fb4-ca6e-40cb-81f9-dfb72e3f0484.settings.initialRows','4'),('fields.613e3fb4-ca6e-40cb-81f9-dfb72e3f0484.settings.multiline','false'),('fields.613e3fb4-ca6e-40cb-81f9-dfb72e3f0484.settings.placeholder','null'),('fields.613e3fb4-ca6e-40cb-81f9-dfb72e3f0484.settings.uiMode','\"normal\"'),('fields.613e3fb4-ca6e-40cb-81f9-dfb72e3f0484.translationKeyFormat','null'),('fields.613e3fb4-ca6e-40cb-81f9-dfb72e3f0484.translationMethod','\"none\"'),('fields.613e3fb4-ca6e-40cb-81f9-dfb72e3f0484.type','\"craft\\\\fields\\\\PlainText\"'),('fields.677c0116-c363-4e74-b5ab-87aaeaaf261d.columnSuffix','null'),('fields.677c0116-c363-4e74-b5ab-87aaeaaf261d.handle','\"contentBuilder\"'),('fields.677c0116-c363-4e74-b5ab-87aaeaaf261d.instructions','null'),('fields.677c0116-c363-4e74-b5ab-87aaeaaf261d.name','\"Content Builder\"'),('fields.677c0116-c363-4e74-b5ab-87aaeaaf261d.searchable','false'),('fields.677c0116-c363-4e74-b5ab-87aaeaaf261d.settings.createButtonLabel','null'),('fields.677c0116-c363-4e74-b5ab-87aaeaaf261d.settings.entryTypes.0','\"b0d48687-1e44-4d17-a816-07ef88cf30de\"'),('fields.677c0116-c363-4e74-b5ab-87aaeaaf261d.settings.entryTypes.1','\"34d5e048-0128-4fc4-abf3-0414145729f2\"'),('fields.677c0116-c363-4e74-b5ab-87aaeaaf261d.settings.entryTypes.2','\"94a69073-ffd1-4bc0-a6fb-703072ae99fa\"'),('fields.677c0116-c363-4e74-b5ab-87aaeaaf261d.settings.includeTableView','false'),('fields.677c0116-c363-4e74-b5ab-87aaeaaf261d.settings.maxEntries','null'),('fields.677c0116-c363-4e74-b5ab-87aaeaaf261d.settings.minEntries','null'),('fields.677c0116-c363-4e74-b5ab-87aaeaaf261d.settings.pageSize','null'),('fields.677c0116-c363-4e74-b5ab-87aaeaaf261d.settings.propagationKeyFormat','null'),('fields.677c0116-c363-4e74-b5ab-87aaeaaf261d.settings.propagationMethod','\"all\"'),('fields.677c0116-c363-4e74-b5ab-87aaeaaf261d.settings.showCardsInGrid','false'),('fields.677c0116-c363-4e74-b5ab-87aaeaaf261d.settings.viewMode','\"blocks\"'),('fields.677c0116-c363-4e74-b5ab-87aaeaaf261d.translationKeyFormat','null'),('fields.677c0116-c363-4e74-b5ab-87aaeaaf261d.translationMethod','\"site\"'),('fields.677c0116-c363-4e74-b5ab-87aaeaaf261d.type','\"craft\\\\fields\\\\Matrix\"'),('fields.6a9c7573-e73a-4370-8e28-d50007a36721.columnSuffix','null'),('fields.6a9c7573-e73a-4370-8e28-d50007a36721.handle','\"entry\"'),('fields.6a9c7573-e73a-4370-8e28-d50007a36721.instructions','null'),('fields.6a9c7573-e73a-4370-8e28-d50007a36721.name','\"Entry\"'),('fields.6a9c7573-e73a-4370-8e28-d50007a36721.searchable','false'),('fields.6a9c7573-e73a-4370-8e28-d50007a36721.settings.allowSelfRelations','false'),('fields.6a9c7573-e73a-4370-8e28-d50007a36721.settings.branchLimit','null'),('fields.6a9c7573-e73a-4370-8e28-d50007a36721.settings.maintainHierarchy','false'),('fields.6a9c7573-e73a-4370-8e28-d50007a36721.settings.maxRelations','null'),('fields.6a9c7573-e73a-4370-8e28-d50007a36721.settings.minRelations','null'),('fields.6a9c7573-e73a-4370-8e28-d50007a36721.settings.selectionLabel','null'),('fields.6a9c7573-e73a-4370-8e28-d50007a36721.settings.showCardsInGrid','false'),('fields.6a9c7573-e73a-4370-8e28-d50007a36721.settings.showSiteMenu','false'),('fields.6a9c7573-e73a-4370-8e28-d50007a36721.settings.sources','\"*\"'),('fields.6a9c7573-e73a-4370-8e28-d50007a36721.settings.targetSiteId','null'),('fields.6a9c7573-e73a-4370-8e28-d50007a36721.settings.validateRelatedElements','false'),('fields.6a9c7573-e73a-4370-8e28-d50007a36721.settings.viewMode','\"list\"'),('fields.6a9c7573-e73a-4370-8e28-d50007a36721.translationKeyFormat','null'),('fields.6a9c7573-e73a-4370-8e28-d50007a36721.translationMethod','\"none\"'),('fields.6a9c7573-e73a-4370-8e28-d50007a36721.type','\"craft\\\\fields\\\\Entries\"'),('fields.f58e1976-da02-4678-93be-a8def53fbc4e.columnSuffix','null'),('fields.f58e1976-da02-4678-93be-a8def53fbc4e.handle','\"selectUsers\"'),('fields.f58e1976-da02-4678-93be-a8def53fbc4e.instructions','null'),('fields.f58e1976-da02-4678-93be-a8def53fbc4e.name','\"Select Users\"'),('fields.f58e1976-da02-4678-93be-a8def53fbc4e.searchable','false'),('fields.f58e1976-da02-4678-93be-a8def53fbc4e.settings.allowSelfRelations','false'),('fields.f58e1976-da02-4678-93be-a8def53fbc4e.settings.branchLimit','null'),('fields.f58e1976-da02-4678-93be-a8def53fbc4e.settings.maintainHierarchy','false'),('fields.f58e1976-da02-4678-93be-a8def53fbc4e.settings.maxRelations','null'),('fields.f58e1976-da02-4678-93be-a8def53fbc4e.settings.minRelations','null'),('fields.f58e1976-da02-4678-93be-a8def53fbc4e.settings.selectionLabel','null'),('fields.f58e1976-da02-4678-93be-a8def53fbc4e.settings.showCardsInGrid','false'),('fields.f58e1976-da02-4678-93be-a8def53fbc4e.settings.showSiteMenu','false'),('fields.f58e1976-da02-4678-93be-a8def53fbc4e.settings.sources','\"*\"'),('fields.f58e1976-da02-4678-93be-a8def53fbc4e.settings.targetSiteId','null'),('fields.f58e1976-da02-4678-93be-a8def53fbc4e.settings.validateRelatedElements','false'),('fields.f58e1976-da02-4678-93be-a8def53fbc4e.settings.viewMode','\"list\"'),('fields.f58e1976-da02-4678-93be-a8def53fbc4e.translationKeyFormat','null'),('fields.f58e1976-da02-4678-93be-a8def53fbc4e.translationMethod','\"none\"'),('fields.f58e1976-da02-4678-93be-a8def53fbc4e.type','\"craft\\\\fields\\\\Users\"'),('fs.images.hasUrls','true'),('fs.images.name','\"Images\"'),('fs.images.settings.path','\"assets/images\"'),('fs.images.type','\"craft\\\\fs\\\\Local\"'),('fs.images.url','\"/assets/images\"'),('meta.__names__.03765a14-8035-4d3a-bada-9ec41b6f99e5','\"Asset\"'),('meta.__names__.16b5d140-0ec8-4bf0-8263-d71b291e7165','\"Home\"'),('meta.__names__.17b8e90a-bb07-4ebb-b17a-e9897728cdc8','\"Craft Nuxt\"'),('meta.__names__.27541a86-a923-489e-a772-e7081c0ec88a','\"Entry: Default\"'),('meta.__names__.31f620da-7617-49ed-be03-9ff85694c893','\"Images\"'),('meta.__names__.34d5e048-0128-4fc4-abf3-0414145729f2','\"Block: Image Text\"'),('meta.__names__.49e9100f-d9e4-4289-88ec-d8711b06ef1a','\"Headline Tag\"'),('meta.__names__.613e3fb4-ca6e-40cb-81f9-dfb72e3f0484','\"Text\"'),('meta.__names__.677c0116-c363-4e74-b5ab-87aaeaaf261d','\"Content Builder\"'),('meta.__names__.6a9c7573-e73a-4370-8e28-d50007a36721','\"Entry\"'),('meta.__names__.88cdb492-76a1-4a67-902f-08ffc4de6ab8','\"Craft Nuxt\"'),('meta.__names__.8e7ca482-4acf-4c99-a2d2-2604a8bcb88d','\"News\"'),('meta.__names__.94a69073-ffd1-4bc0-a6fb-703072ae99fa','\"Block: Author\"'),('meta.__names__.b0d48687-1e44-4d17-a816-07ef88cf30de','\"Block: Headline\"'),('meta.__names__.f58e1976-da02-4678-93be-a8def53fbc4e','\"Select Users\"'),('plugins.craft-query-api.edition','\"standard\"'),('plugins.craft-query-api.enabled','true'),('plugins.craft-query-api.schemaVersion','\"1.0.0\"'),('sections.16b5d140-0ec8-4bf0-8263-d71b291e7165.defaultPlacement','\"end\"'),('sections.16b5d140-0ec8-4bf0-8263-d71b291e7165.enableVersioning','true'),('sections.16b5d140-0ec8-4bf0-8263-d71b291e7165.entryTypes.0','\"27541a86-a923-489e-a772-e7081c0ec88a\"'),('sections.16b5d140-0ec8-4bf0-8263-d71b291e7165.handle','\"home\"'),('sections.16b5d140-0ec8-4bf0-8263-d71b291e7165.maxAuthors','1'),('sections.16b5d140-0ec8-4bf0-8263-d71b291e7165.name','\"Home\"'),('sections.16b5d140-0ec8-4bf0-8263-d71b291e7165.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.16b5d140-0ec8-4bf0-8263-d71b291e7165.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.16b5d140-0ec8-4bf0-8263-d71b291e7165.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.16b5d140-0ec8-4bf0-8263-d71b291e7165.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.16b5d140-0ec8-4bf0-8263-d71b291e7165.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.16b5d140-0ec8-4bf0-8263-d71b291e7165.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.16b5d140-0ec8-4bf0-8263-d71b291e7165.propagationMethod','\"all\"'),('sections.16b5d140-0ec8-4bf0-8263-d71b291e7165.siteSettings.17b8e90a-bb07-4ebb-b17a-e9897728cdc8.enabledByDefault','true'),('sections.16b5d140-0ec8-4bf0-8263-d71b291e7165.siteSettings.17b8e90a-bb07-4ebb-b17a-e9897728cdc8.hasUrls','true'),('sections.16b5d140-0ec8-4bf0-8263-d71b291e7165.siteSettings.17b8e90a-bb07-4ebb-b17a-e9897728cdc8.template','\"home/_entry.twig\"'),('sections.16b5d140-0ec8-4bf0-8263-d71b291e7165.siteSettings.17b8e90a-bb07-4ebb-b17a-e9897728cdc8.uriFormat','\"__home__\"'),('sections.16b5d140-0ec8-4bf0-8263-d71b291e7165.type','\"single\"'),('sections.8e7ca482-4acf-4c99-a2d2-2604a8bcb88d.defaultPlacement','\"end\"'),('sections.8e7ca482-4acf-4c99-a2d2-2604a8bcb88d.enableVersioning','true'),('sections.8e7ca482-4acf-4c99-a2d2-2604a8bcb88d.entryTypes.0','\"27541a86-a923-489e-a772-e7081c0ec88a\"'),('sections.8e7ca482-4acf-4c99-a2d2-2604a8bcb88d.handle','\"news\"'),('sections.8e7ca482-4acf-4c99-a2d2-2604a8bcb88d.maxAuthors','1'),('sections.8e7ca482-4acf-4c99-a2d2-2604a8bcb88d.name','\"News\"'),('sections.8e7ca482-4acf-4c99-a2d2-2604a8bcb88d.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.8e7ca482-4acf-4c99-a2d2-2604a8bcb88d.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.8e7ca482-4acf-4c99-a2d2-2604a8bcb88d.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.8e7ca482-4acf-4c99-a2d2-2604a8bcb88d.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.8e7ca482-4acf-4c99-a2d2-2604a8bcb88d.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.8e7ca482-4acf-4c99-a2d2-2604a8bcb88d.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.8e7ca482-4acf-4c99-a2d2-2604a8bcb88d.propagationMethod','\"all\"'),('sections.8e7ca482-4acf-4c99-a2d2-2604a8bcb88d.siteSettings.17b8e90a-bb07-4ebb-b17a-e9897728cdc8.enabledByDefault','true'),('sections.8e7ca482-4acf-4c99-a2d2-2604a8bcb88d.siteSettings.17b8e90a-bb07-4ebb-b17a-e9897728cdc8.hasUrls','true'),('sections.8e7ca482-4acf-4c99-a2d2-2604a8bcb88d.siteSettings.17b8e90a-bb07-4ebb-b17a-e9897728cdc8.template','\"news/_entry.twig\"'),('sections.8e7ca482-4acf-4c99-a2d2-2604a8bcb88d.siteSettings.17b8e90a-bb07-4ebb-b17a-e9897728cdc8.uriFormat','\"news/{slug}\"'),('sections.8e7ca482-4acf-4c99-a2d2-2604a8bcb88d.type','\"channel\"'),('siteGroups.88cdb492-76a1-4a67-902f-08ffc4de6ab8.name','\"Craft Nuxt\"'),('sites.17b8e90a-bb07-4ebb-b17a-e9897728cdc8.baseUrl','\"@website\"'),('sites.17b8e90a-bb07-4ebb-b17a-e9897728cdc8.enabled','true'),('sites.17b8e90a-bb07-4ebb-b17a-e9897728cdc8.handle','\"default\"'),('sites.17b8e90a-bb07-4ebb-b17a-e9897728cdc8.hasUrls','true'),('sites.17b8e90a-bb07-4ebb-b17a-e9897728cdc8.language','\"en-US\"'),('sites.17b8e90a-bb07-4ebb-b17a-e9897728cdc8.name','\"Craft Nuxt\"'),('sites.17b8e90a-bb07-4ebb-b17a-e9897728cdc8.primary','true'),('sites.17b8e90a-bb07-4ebb-b17a-e9897728cdc8.siteGroup','\"88cdb492-76a1-4a67-902f-08ffc4de6ab8\"'),('sites.17b8e90a-bb07-4ebb-b17a-e9897728cdc8.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Craft Nuxt\"'),('system.schemaVersion','\"5.3.0.2\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.require2fa','false'),('users.requireEmailVerification','true'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.altTranslationKeyFormat','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.altTranslationMethod','\"none\"'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elementCondition','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.0.autocapitalize','true'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.0.autocomplete','false'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.0.autocorrect','true'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.0.class','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.0.dateAdded','\"2024-11-07T16:35:19+00:00\"'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.0.disabled','false'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.0.elementCondition','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.0.id','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.0.includeInCards','false'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.0.inputType','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.0.instructions','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.0.label','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.0.max','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.0.min','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.0.name','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.0.orientation','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.0.placeholder','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.0.providesThumbs','false'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.0.readonly','false'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.0.requirable','false'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.0.size','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.0.step','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.0.tip','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.0.title','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.0.uid','\"8e20ba56-3871-46b5-97b2-1d368ca6766d\"'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.0.userCondition','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.0.warning','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.0.width','100'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.1.attribute','\"alt\"'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.1.class','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.1.cols','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.1.dateAdded','\"2024-11-07T16:36:28+00:00\"'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.1.disabled','false'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.1.elementCondition','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.1.id','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.1.includeInCards','false'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.1.instructions','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.1.label','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.1.name','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.1.orientation','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.1.placeholder','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.1.providesThumbs','false'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.1.readonly','false'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.1.requirable','true'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.1.required','false'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.1.rows','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.1.tip','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.1.title','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AltField\"'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.1.uid','\"5b85c134-d32c-41aa-9e7d-b6b6385068af\"'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.1.userCondition','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.1.warning','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.elements.1.width','100'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.name','\"Content\"'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.uid','\"ae3025f8-c35a-486c-90db-f8c294c4ec70\"'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fieldLayouts.995bfff2-93ee-4973-b1b9-181628274c7c.tabs.0.userCondition','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.fs','\"images\"'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.handle','\"images\"'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.name','\"Images\"'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.sortOrder','1'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.subpath','\"\"'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.titleTranslationKeyFormat','null'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.titleTranslationMethod','\"site\"'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.transformFs','\"\"'),('volumes.31f620da-7617-49ed-be03-9ff85694c893.transformSubpath','\"\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `recoverycodes`
--

LOCK TABLES `recoverycodes` WRITE;
/*!40000 ALTER TABLE `recoverycodes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `recoverycodes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `relations` VALUES (2,1,10,NULL,8,1,'2024-11-07 16:45:05','2024-11-07 16:45:05','fccafff6-870a-4e4e-863d-c5fdac69c6d7'),(3,1,13,NULL,8,1,'2024-11-07 16:45:05','2024-11-07 16:45:05','379a4dcc-fb66-41d7-878d-f6de4312e1cd'),(6,1,15,NULL,8,1,'2024-11-07 16:45:13','2024-11-07 16:45:13','494b71e2-836b-4dba-ae31-75e2f14b225d'),(10,1,18,NULL,16,1,'2024-11-07 16:49:21','2024-11-07 16:49:21','be2aacd3-af3f-46fb-87d1-fe72205ec06a'),(12,1,19,NULL,16,1,'2024-11-07 16:49:22','2024-11-07 16:49:22','a7f66394-5763-4515-8196-3128444f0ddf'),(13,1,20,NULL,16,1,'2024-11-07 16:49:22','2024-11-07 16:49:22','c816d1c3-4345-44ec-b7fe-a1dbcf77bc88'),(15,1,24,NULL,16,1,'2024-11-07 20:17:14','2024-11-07 20:17:14','4ab14f70-c900-4bcf-95f3-a7572e43580c'),(16,1,25,NULL,16,1,'2024-11-07 20:19:11','2024-11-07 20:19:11','efb152ae-8492-49af-9554-60baa902c908'),(18,1,28,NULL,16,1,'2024-11-07 20:19:34','2024-11-07 20:19:34','120eab46-d8f4-46ac-90a5-914bde3cd236'),(20,1,32,NULL,16,1,'2024-11-07 20:24:15','2024-11-07 20:24:15','6f0ab82d-f165-492c-9619-28bc17f49dfa'),(22,1,36,NULL,16,1,'2024-11-07 20:24:21','2024-11-07 20:24:21','7ed8eebe-c225-4a9e-ac81-92d758f24dcf'),(24,1,40,NULL,16,1,'2024-11-07 20:24:26','2024-11-07 20:24:26','7b2cb31f-8861-4051-87c2-82e53716a4b2'),(26,1,44,NULL,16,1,'2024-11-07 20:24:35','2024-11-07 20:24:35','e3df7f54-44be-43a6-a8ca-9f87daf84907'),(28,1,47,NULL,16,1,'2024-11-07 20:28:16','2024-11-07 20:28:16','dcbea555-514c-4b34-98c3-2ce41fa7d64b'),(29,1,48,NULL,16,1,'2024-11-07 20:28:32','2024-11-07 20:28:32','95b36377-756b-4264-a3be-aea4b040cf51'),(30,1,49,NULL,16,1,'2024-11-07 20:28:32','2024-11-07 20:28:32','6509173b-5bc3-477d-8164-5f03d07566d5'),(32,1,51,NULL,16,1,'2024-11-07 20:28:49','2024-11-07 20:28:49','c8dcbda8-ea8d-4bff-bd28-769eb4e1ecf2'),(35,6,54,NULL,1,1,'2024-11-08 14:45:02','2024-11-08 14:45:02','f28a3b5b-53c2-4bef-9b3f-4d539aaf2233'),(36,1,55,NULL,16,1,'2024-11-08 14:45:02','2024-11-08 14:45:02','2ae471a6-20b6-4280-8a40-3485ef2eb0e9'),(37,6,56,NULL,1,1,'2024-11-08 14:45:02','2024-11-08 14:45:02','04ce3360-1de6-499d-bfc6-c9d4c21dc891'),(42,1,2,NULL,59,1,'2024-11-21 21:38:30','2024-11-21 21:38:30','e622b250-6764-4ccf-8260-ea80c9f3ec3f'),(43,1,60,NULL,59,1,'2024-11-21 21:38:30','2024-11-21 21:38:30','b384f6bb-0c23-46da-a102-d3c8c278e124'),(44,1,61,NULL,59,1,'2024-11-21 21:38:30','2024-11-21 21:38:30','3e4e94a3-76ed-4ac1-8875-78309dea0e3a'),(45,1,62,NULL,59,1,'2024-11-21 21:38:30','2024-11-21 21:38:30','11702a13-858b-4f3c-b8d5-4e2452379d07'),(46,1,63,NULL,59,1,'2024-11-21 21:40:35','2024-11-21 21:40:35','64c920a2-1025-4073-9d8c-8826fa2d434c'),(48,1,65,NULL,59,1,'2024-11-21 21:40:41','2024-11-21 21:40:41','8ce73afa-8e83-4854-9470-e81ba4da0c90'),(51,1,21,NULL,59,1,'2024-11-21 21:41:31','2024-11-21 21:41:31','95d9df4a-aaa9-4dff-b70b-93bdc24b9d09'),(52,1,68,NULL,59,1,'2024-11-21 21:41:31','2024-11-21 21:41:31','aa9d23b8-e3ae-4fcf-9fbf-fed4d455d9a7'),(53,1,69,NULL,59,1,'2024-11-21 21:41:31','2024-11-21 21:41:31','1a9600c9-eb17-4f57-a1df-21db787b7f84'),(54,1,70,NULL,59,1,'2024-11-21 21:41:31','2024-11-21 21:41:31','fa186b38-bc6e-411e-b0cb-1b9a4f2e1aee');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,2,1,1,NULL),(2,2,1,2,NULL),(3,2,1,3,'Applied “Draft 1”'),(4,9,1,1,NULL),(5,10,1,1,NULL),(6,2,1,4,'Applied “Draft 1”'),(7,2,1,5,'Applied “Draft 1”'),(8,18,1,1,NULL),(9,21,1,1,''),(10,2,1,6,'Applied “Draft 1”'),(11,2,1,7,''),(12,2,1,8,'Applied “Draft 1”'),(13,27,1,1,NULL),(14,2,1,9,'Applied “Draft 1”'),(15,31,1,1,NULL),(16,2,1,10,'Applied “Draft 1”'),(17,35,1,1,NULL),(18,2,1,11,'Applied “Draft 1”'),(19,39,1,1,NULL),(20,2,1,12,'Applied “Draft 1”'),(21,43,1,1,NULL),(22,2,1,13,'Applied “Draft 1”'),(23,47,1,1,NULL),(24,2,1,14,'Applied “Draft 1”'),(25,2,1,15,'Applied “Draft 1”'),(26,54,1,1,NULL),(27,2,1,16,'Applied “Draft 1”'),(28,60,1,1,NULL),(29,2,1,17,''),(30,2,1,18,'Applied “Draft 1”'),(31,21,1,2,'Applied “Draft 1”'),(32,68,1,1,NULL);
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' samuelreichor gmail com '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'slug',0,1,' home '),(2,'title',0,1,' home '),(8,'alt',0,1,''),(8,'extension',0,1,' png '),(8,'filename',0,1,' jobrad nh png '),(8,'kind',0,1,' image '),(8,'slug',0,1,''),(8,'title',0,1,' jobrad nh '),(9,'slug',0,1,' this is the headline '),(9,'title',0,1,' this is the headline '),(10,'slug',0,1,' this is the text of image and text '),(10,'title',0,1,' this is the text of image and text '),(16,'alt',0,1,''),(16,'extension',0,1,' png '),(16,'filename',0,1,' rotax png '),(16,'kind',0,1,' image '),(16,'slug',0,1,''),(16,'title',0,1,' rotax '),(18,'slug',0,1,' this is the text of image and text '),(18,'title',0,1,' this is the text of image and text '),(21,'slug',0,1,' news 1 '),(21,'title',0,1,' news 1 '),(27,'slug',0,1,' this is the headline '),(27,'title',0,1,''),(31,'slug',0,1,' this is the headline '),(31,'title',0,1,''),(35,'slug',0,1,' this is the headline '),(35,'title',0,1,''),(39,'slug',0,1,' this is the headline '),(39,'title',0,1,''),(43,'slug',0,1,' this is the headline '),(43,'title',0,1,''),(47,'slug',0,1,' this is the text of image and text '),(47,'title',0,1,' this is the text of image and text '),(54,'slug',0,1,' this is the author module '),(54,'title',0,1,' this is the author module '),(59,'alt',0,1,''),(59,'extension',0,1,' jpg '),(59,'filename',0,1,' cat jpg '),(59,'kind',0,1,' image '),(59,'slug',0,1,''),(59,'title',0,1,' cat '),(60,'slug',0,1,' this is the image text module '),(60,'title',0,1,' this is the image text module '),(68,'slug',0,1,' temp nlmlqohsalvtizertuxdqgntpogowzvjkbpq '),(68,'title',0,1,'');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'Home','home','single',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2024-11-07 16:38:27','2024-11-07 16:38:27',NULL,'16b5d140-0ec8-4bf0-8263-d71b291e7165'),(2,NULL,'News','news','channel',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2024-11-07 16:43:47','2024-11-07 16:43:47',NULL,'8e7ca482-4acf-4c99-a2d2-2604a8bcb88d');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_entrytypes`
--

LOCK TABLES `sections_entrytypes` WRITE;
/*!40000 ALTER TABLE `sections_entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_entrytypes` VALUES (1,1,1),(2,1,1);
/*!40000 ALTER TABLE `sections_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'__home__','home/_entry.twig',1,'2024-11-07 16:38:27','2024-11-07 16:38:27','cf6c8810-e60e-4c52-922d-8db820a276fa'),(2,2,1,1,'news/{slug}','news/_entry.twig',1,'2024-11-07 16:43:47','2024-11-07 16:43:47','1c142682-da64-4926-baf2-1f07cb48a727');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'Craft Nuxt','2024-11-07 16:27:01','2024-11-07 16:27:01',NULL,'88cdb492-76a1-4a67-902f-08ffc4de6ab8');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'1','Craft Nuxt','default','en-US',1,'@website',1,'2024-11-07 16:27:01','2024-11-07 20:27:50',NULL,'17b8e90a-bb07-4ebb-b17a-e9897728cdc8');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sso_identities`
--

LOCK TABLES `sso_identities` WRITE;
/*!40000 ALTER TABLE `sso_identities` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sso_identities` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `tokens` VALUES (1,'AnYVpJ5v7agoXqWsUBtvwkv-2QVEoQqc','[\"preview\\/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"canonicalId\":2,\"siteId\":1,\"draftId\":null,\"revisionId\":null,\"userId\":1}]',NULL,NULL,'2024-11-08 20:28:10','2024-11-07 20:28:10','2024-11-07 20:28:10','c3dd72e9-5122-4c55-8b30-44a58fd9a9c8'),(2,'FUl1RlflHJA4rqCPdcsnmyF-gqh9C0VP','[\"preview\\/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"canonicalId\":2,\"siteId\":1,\"draftId\":null,\"revisionId\":null,\"userId\":1}]',NULL,NULL,'2024-11-08 20:28:43','2024-11-07 20:28:43','2024-11-07 20:28:43','5ebc6e65-2352-4b85-90a3-aa33bf61e562');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\": \"en-US\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,NULL,1,0,0,0,1,'admin',NULL,NULL,NULL,'samuelreichor@gmail.com','$2y$13$rMreXSrnaelwWtfceN4Lk.td7yHaOaAruwFG4NQdJRDM0sxsj7mKe','2024-11-23 16:46:34',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2024-11-07 16:27:02','2024-11-07 16:27:02','2024-11-23 16:46:34');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Images','','2024-11-07 16:36:28','2024-11-07 16:36:28','1ff5b636-8e0c-46dc-b32d-e5d69ea4868a'),(2,NULL,NULL,'Temporary Uploads',NULL,'2024-11-07 16:44:15','2024-11-07 16:44:15','a79e30da-b6b4-4725-9ef4-0b569fdb5569'),(3,2,NULL,'user_1','user_1/','2024-11-07 16:44:15','2024-11-07 16:44:15','650e7722-e30e-4044-a0a3-a456ad89f46a');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumes` VALUES (1,1,'Images','images','images','','','','site',NULL,'none',NULL,1,'2024-11-07 16:36:28','2024-11-07 16:36:28',NULL,'31f620da-7617-49ed-be03-9ff85694c893');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `webauthn`
--

LOCK TABLES `webauthn` WRITE;
/*!40000 ALTER TABLE `webauthn` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `webauthn` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"limit\": 10, \"siteId\": 1, \"section\": \"*\"}',1,'2024-11-07 16:28:00','2024-11-07 16:28:00','1b8a6027-8756-4610-8791-1ca584ab8922'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2024-11-07 16:28:00','2024-11-07 16:28:00','7dabbcb5-59f0-47db-8e01-13897c31a682'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2024-11-07 16:28:00','2024-11-07 16:28:00','fc549ac6-b36f-4006-b080-8df5c83b5668'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\": \"https://craftcms.com/news.rss\", \"limit\": 5, \"title\": \"Craft News\"}',1,'2024-11-07 16:28:00','2024-11-07 16:28:00','ce380ef1-a99a-4d45-821f-d754b56a1006');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-23 16:46:48
