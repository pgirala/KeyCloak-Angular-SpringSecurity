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

-- Volcando datos para la tabla keycloak-springsecurity.acl_class: ~1 rows (aproximadamente)
DELETE FROM `acl_class`;
/*!40000 ALTER TABLE `acl_class` DISABLE KEYS */;
INSERT INTO `acl_class` (`id`, `class`) VALUES
	(1, 'com.pj.keycloak.model.Employee'),
	(3, 'com.pj.keycloak.model.Project');
/*!40000 ALTER TABLE `acl_class` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.acl_entry: ~19 rows (aproximadamente)
DELETE FROM `acl_entry`;
/*!40000 ALTER TABLE `acl_entry` DISABLE KEYS */;
INSERT INTO `acl_entry` (`id`, `acl_object_identity`, `ace_order`, `sid`, `mask`, `granting`, `audit_success`, `audit_failure`) VALUES
	(2, 1, 1, 13, 1, 1, 1, 1),
	(3, 2, 1, 13, 1, 1, 1, 1),
	(4, 2, 2, 13, 2, 1, 1, 1),
	(5, 27, 2, 15, 4, 1, 1, 1),
	(6, 2, 3, 13, 8, 1, 1, 1),
	(7, 1, 2, 13, 2, 1, 1, 1),
	(8, 27, 1, 13, 4, 1, 1, 1),
	(9, 1, 3, 13, 8, 1, 1, 1),
	(122, 31, 0, 15, 1, 1, 1, 1),
	(123, 31, 1, 15, 2, 1, 1, 1),
	(124, 31, 2, 15, 8, 1, 1, 1),
	(131, 34, 1, 13, 4, 1, 1, 1),
	(132, 34, 2, 15, 4, 1, 1, 1),
	(133, 35, 1, 13, 1, 1, 1, 1),
	(134, 35, 2, 13, 2, 1, 1, 1),
	(135, 35, 3, 13, 8, 1, 1, 1),
	(136, 35, 4, 15, 1, 1, 1, 1),
	(137, 35, 5, 15, 2, 1, 1, 1),
	(138, 35, 6, 15, 8, 1, 1, 1),
	(142, 37, 0, 13, 1, 1, 0, 0),
	(143, 37, 1, 13, 2, 1, 0, 0),
	(144, 37, 2, 13, 8, 1, 0, 0);
/*!40000 ALTER TABLE `acl_entry` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.acl_object_identity: ~6 rows (aproximadamente)
DELETE FROM `acl_object_identity`;
/*!40000 ALTER TABLE `acl_object_identity` DISABLE KEYS */;
INSERT INTO `acl_object_identity` (`id`, `object_id_class`, `object_id_identity`, `parent_object`, `owner_sid`, `entries_inheriting`) VALUES
	(1, 1, '2', NULL, 1, 0),
	(2, 1, '3', NULL, 1, 0),
	(27, 1, '-2482579485413606056', NULL, 1, 0),
	(31, 1, '48', NULL, 14, 1),
	(34, 3, '-2482579485413606057', NULL, 1, 0),
	(35, 3, '1', NULL, 1, 0),
	(37, 3, '3', NULL, 1, 1);
/*!40000 ALTER TABLE `acl_object_identity` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.acl_sid: ~4 rows (aproximadamente)
DELETE FROM `acl_sid`;
/*!40000 ALTER TABLE `acl_sid` DISABLE KEYS */;
INSERT INTO `acl_sid` (`id`, `principal`, `sid`) VALUES
	(1, 1, 'pgalvez'),
	(14, 1, 'pgirala'),
	(13, 0, 'ROLE_ADMIN'),
	(15, 0, 'ROLE_GESTOR');
/*!40000 ALTER TABLE `acl_sid` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.employee: ~4 rows (aproximadamente)
DELETE FROM `employee`;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`employee_id`, `location`, `salary`, `id`) VALUES
	(22340, 'Pinto', 1000, 2),
	(810965, 'Córdoba', 2000, 3),
	(920247, 'Alpedrete', 600000, 48);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.employee_project: ~2 rows (aproximadamente)
DELETE FROM `employee_project`;
/*!40000 ALTER TABLE `employee_project` DISABLE KEYS */;
INSERT INTO `employee_project` (`employee_id`, `project_id`) VALUES
	(2, 1),
	(3, 1),
	(48, 1);
/*!40000 ALTER TABLE `employee_project` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.jv_commit: ~6 rows (aproximadamente)
DELETE FROM `jv_commit`;
/*!40000 ALTER TABLE `jv_commit` DISABLE KEYS */;
/*!40000 ALTER TABLE `jv_commit` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.jv_commit_property: ~0 rows (aproximadamente)
DELETE FROM `jv_commit_property`;
/*!40000 ALTER TABLE `jv_commit_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `jv_commit_property` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.jv_global_id: ~4 rows (aproximadamente)
DELETE FROM `jv_global_id`;
/*!40000 ALTER TABLE `jv_global_id` DISABLE KEYS */;
/*!40000 ALTER TABLE `jv_global_id` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.jv_snapshot: ~9 rows (aproximadamente)
DELETE FROM `jv_snapshot`;
/*!40000 ALTER TABLE `jv_snapshot` DISABLE KEYS */;
/*!40000 ALTER TABLE `jv_snapshot` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.project: ~1 rows (aproximadamente)
DELETE FROM `project`;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` (`id`, `budget`, `location`, `name`) VALUES
	(1, 2000, 'Madrid', 'CoFFEE'),
	(3, 10, 'Madrid', 'ATENEA');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.user_profile: ~4 rows (aproximadamente)
DELETE FROM `user_profile`;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` (`id`, `email`, `first_name`, `last_name`, `phone`, `user_guid`) VALUES
	(2, 'pgirala@gmail.com', 'Pablo', 'Gálvez Irala', '555-555-5555', 'd0e27e2d-0438-4fbc-905a-cd401bbe0c95'),
	(3, 'lranchal@gmail.com', 'Luis', 'Ranchal', '202-345-2333', '827ab723-c115-4a28-8f49-5b3ec89ecf02'),
	(48, 'alagunas@gmail.com', 'Alberto', 'Lagunas', '302-345-2333', 'e1a0b843-f705-4764-a7f3-1d73bfbb55f7');
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
