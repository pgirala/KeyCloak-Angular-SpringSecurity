-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.22 - MySQL Community Server - GPL
-- SO del servidor:              Linux
-- HeidiSQL Versión:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla keycloak-springsecurity.acl_class
DROP TABLE IF EXISTS `acl_class`;
CREATE TABLE IF NOT EXISTS `acl_class` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_acl_class` (`class`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla keycloak-springsecurity.acl_entry
DROP TABLE IF EXISTS `acl_entry`;
CREATE TABLE IF NOT EXISTS `acl_entry` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `acl_object_identity` bigint unsigned NOT NULL,
  `ace_order` int NOT NULL,
  `sid` bigint unsigned NOT NULL,
  `mask` int unsigned NOT NULL,
  `granting` tinyint(1) NOT NULL,
  `audit_success` tinyint(1) NOT NULL,
  `audit_failure` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_acl_entry` (`acl_object_identity`,`ace_order`),
  KEY `fk_acl_entry_acl` (`sid`),
  CONSTRAINT `fk_acl_entry_acl` FOREIGN KEY (`sid`) REFERENCES `acl_sid` (`id`),
  CONSTRAINT `fk_acl_entry_object` FOREIGN KEY (`acl_object_identity`) REFERENCES `acl_object_identity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla keycloak-springsecurity.acl_object_identity
DROP TABLE IF EXISTS `acl_object_identity`;
CREATE TABLE IF NOT EXISTS `acl_object_identity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `object_id_class` bigint unsigned NOT NULL,
  `object_id_identity` varchar(36) NOT NULL,
  `parent_object` bigint unsigned DEFAULT NULL,
  `owner_sid` bigint unsigned DEFAULT NULL,
  `entries_inheriting` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_acl_object_identity` (`object_id_class`,`object_id_identity`),
  KEY `fk_acl_object_identity_parent` (`parent_object`),
  KEY `fk_acl_object_identity_owner` (`owner_sid`),
  CONSTRAINT `fk_acl_object_identity_class` FOREIGN KEY (`object_id_class`) REFERENCES `acl_class` (`id`),
  CONSTRAINT `fk_acl_object_identity_owner` FOREIGN KEY (`owner_sid`) REFERENCES `acl_sid` (`id`),
  CONSTRAINT `fk_acl_object_identity_parent` FOREIGN KEY (`parent_object`) REFERENCES `acl_object_identity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla keycloak-springsecurity.acl_sid
DROP TABLE IF EXISTS `acl_sid`;
CREATE TABLE IF NOT EXISTS `acl_sid` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `principal` tinyint(1) NOT NULL,
  `sid` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_acl_sid` (`sid`,`principal`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla keycloak-springsecurity.department
DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla keycloak-springsecurity.employee
DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `employee_id` bigint DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `id` bigint NOT NULL,
  `department_id` bigint DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_mc5x07dj0uft9opsxchp0uwji` (`employee_id`),
  KEY `FKempdep` (`department_id`),
  CONSTRAINT `FKempdep` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla keycloak-springsecurity.employee_project
DROP TABLE IF EXISTS `employee_project`;
CREATE TABLE IF NOT EXISTS `employee_project` (
  `employee_id` bigint NOT NULL,
  `project_id` bigint NOT NULL,
  PRIMARY KEY (`employee_id`,`project_id`),
  KEY `FK4yddvnm7283a40plkcti66wv9` (`project_id`),
  CONSTRAINT `FK4yddvnm7283a40plkcti66wv9` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `FKb25s5hgggo6k4au4sye7teb3a` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para vista keycloak-springsecurity.employee_project_view
DROP VIEW IF EXISTS `employee_project_view`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `employee_project_view` (
	`employee_id` BIGINT NOT NULL,
	`first_name` VARCHAR(255) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`last_name` VARCHAR(255) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`project_location` VARCHAR(255) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`project_name` VARCHAR(255) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`salary` DOUBLE NULL
) ENGINE=MyISAM;

-- Volcando estructura para tabla keycloak-springsecurity.jv_commit
DROP TABLE IF EXISTS `jv_commit`;
CREATE TABLE IF NOT EXISTS `jv_commit` (
  `commit_pk` bigint NOT NULL AUTO_INCREMENT,
  `author` varchar(200) DEFAULT NULL,
  `commit_date` timestamp(3) NULL DEFAULT NULL,
  `commit_date_instant` varchar(30) DEFAULT NULL,
  `commit_id` decimal(22,2) DEFAULT NULL,
  PRIMARY KEY (`commit_pk`),
  KEY `jv_commit_commit_id_idx` (`commit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla keycloak-springsecurity.jv_commit_property
DROP TABLE IF EXISTS `jv_commit_property`;
CREATE TABLE IF NOT EXISTS `jv_commit_property` (
  `property_name` varchar(191) NOT NULL,
  `property_value` varchar(600) DEFAULT NULL,
  `commit_fk` bigint NOT NULL,
  PRIMARY KEY (`commit_fk`,`property_name`),
  KEY `jv_commit_property_commit_fk_idx` (`commit_fk`),
  KEY `jv_commit_property_property_name_property_value_idx` (`property_name`,`property_value`(191)),
  CONSTRAINT `jv_commit_property_commit_fk` FOREIGN KEY (`commit_fk`) REFERENCES `jv_commit` (`commit_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla keycloak-springsecurity.jv_global_id
DROP TABLE IF EXISTS `jv_global_id`;
CREATE TABLE IF NOT EXISTS `jv_global_id` (
  `global_id_pk` bigint NOT NULL AUTO_INCREMENT,
  `local_id` varchar(191) DEFAULT NULL,
  `fragment` varchar(200) DEFAULT NULL,
  `type_name` varchar(200) DEFAULT NULL,
  `owner_id_fk` bigint DEFAULT NULL,
  PRIMARY KEY (`global_id_pk`),
  KEY `jv_global_id_local_id_idx` (`local_id`),
  KEY `jv_global_id_owner_id_fk_idx` (`owner_id_fk`),
  CONSTRAINT `jv_global_id_owner_id_fk` FOREIGN KEY (`owner_id_fk`) REFERENCES `jv_global_id` (`global_id_pk`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla keycloak-springsecurity.jv_snapshot
DROP TABLE IF EXISTS `jv_snapshot`;
CREATE TABLE IF NOT EXISTS `jv_snapshot` (
  `snapshot_pk` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(200) DEFAULT NULL,
  `version` bigint DEFAULT NULL,
  `state` text,
  `changed_properties` text,
  `managed_type` varchar(200) DEFAULT NULL,
  `global_id_fk` bigint DEFAULT NULL,
  `commit_fk` bigint DEFAULT NULL,
  PRIMARY KEY (`snapshot_pk`),
  KEY `jv_snapshot_global_id_fk_idx` (`global_id_fk`),
  KEY `jv_snapshot_commit_fk_idx` (`commit_fk`),
  CONSTRAINT `jv_snapshot_commit_fk` FOREIGN KEY (`commit_fk`) REFERENCES `jv_commit` (`commit_pk`),
  CONSTRAINT `jv_snapshot_global_id_fk` FOREIGN KEY (`global_id_fk`) REFERENCES `jv_global_id` (`global_id_pk`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla keycloak-springsecurity.project
DROP TABLE IF EXISTS `project`;
CREATE TABLE IF NOT EXISTS `project` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `budget` double DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para vista keycloak-springsecurity.employee_project_view
DROP VIEW IF EXISTS `employee_project_view`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `employee_project_view`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `employee_project_view` AS select `E`.`id` AS `employee_id`,`E`.`first_name` AS `first_name`,`E`.`last_name` AS `last_name`,`P`.`location` AS `project_location`,`P`.`name` AS `project_name`,`E`.`salary` AS `salary` from ((`employee` `E` join `employee_project` `EP` on((`E`.`id` = `EP`.`employee_id`))) join `project` `P` on((`P`.`id` = `EP`.`project_id`)));

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
