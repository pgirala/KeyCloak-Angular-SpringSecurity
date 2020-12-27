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

-- Volcando datos para la tabla keycloak-springsecurity.acl_class: ~0 rows (aproximadamente)
DELETE FROM `acl_class`;
/*!40000 ALTER TABLE `acl_class` DISABLE KEYS */;
INSERT INTO `acl_class` (`id`, `class`) VALUES
	(1, 'com.pj.keycloak.model.Employee');
/*!40000 ALTER TABLE `acl_class` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.acl_entry: ~0 rows (aproximadamente)
DELETE FROM `acl_entry`;
/*!40000 ALTER TABLE `acl_entry` DISABLE KEYS */;
INSERT INTO `acl_entry` (`id`, `acl_object_identity`, `ace_order`, `sid`, `mask`, `granting`, `audit_success`, `audit_failure`) VALUES
	(2, 1, 1, 1, 1, 1, 1, 1),
	(3, 2, 1, 1, 1, 1, 1, 1),
	(4, 2, 2, 1, 2, 1, 1, 1),
	(5, 2, 3, 1, 4, 1, 1, 1),
	(6, 2, 4, 1, 8, 1, 1, 1),
	(7, 1, 2, 1, 2, 1, 1, 1),
	(8, 1, 3, 1, 4, 1, 1, 1),
	(9, 1, 4, 1, 8, 1, 1, 1);
/*!40000 ALTER TABLE `acl_entry` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.acl_object_identity: ~0 rows (aproximadamente)
DELETE FROM `acl_object_identity`;
/*!40000 ALTER TABLE `acl_object_identity` DISABLE KEYS */;
INSERT INTO `acl_object_identity` (`id`, `object_id_class`, `object_id_identity`, `parent_object`, `owner_sid`, `entries_inheriting`) VALUES
	(1, 1, '2', NULL, 1, 0),
	(2, 1, '3', NULL, 1, 0);
/*!40000 ALTER TABLE `acl_object_identity` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.acl_sid: ~0 rows (aproximadamente)
DELETE FROM `acl_sid`;
/*!40000 ALTER TABLE `acl_sid` DISABLE KEYS */;
INSERT INTO `acl_sid` (`id`, `principal`, `sid`) VALUES
	(1, 1, 'jdoe@example.com');
/*!40000 ALTER TABLE `acl_sid` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.employee: ~0 rows (aproximadamente)
DELETE FROM `employee`;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`employee_id`, `location`, `salary`, `id`) VALUES
	(22340, 'Pinto', 1000, 2),
	(810965, 'Córdoba', 2000, 3);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.employee_project: ~0 rows (aproximadamente)
DELETE FROM `employee_project`;
/*!40000 ALTER TABLE `employee_project` DISABLE KEYS */;
INSERT INTO `employee_project` (`employee_id`, `project_id`) VALUES
	(2, 1),
	(3, 1);
/*!40000 ALTER TABLE `employee_project` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.project: ~0 rows (aproximadamente)
DELETE FROM `project`;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` (`id`, `budget`, `location`, `name`) VALUES
	(1, 1000000, 'Madrid', 'CoFFEE');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.user_profile: ~2 rows (aproximadamente)
DELETE FROM `user_profile`;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` (`id`, `email`, `first_name`, `last_name`, `phone`, `user_guid`) VALUES
	(2, 'pgirala@gmail.com', 'Pablo', 'Gálvez', '555-555-5555', ''),
	(3, 'lranchal@gmail.com', 'Luis', 'Ranchal', '202-345-2333', '827ab723-c115-4a28-8f49-5b3ec89ecf02');
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
