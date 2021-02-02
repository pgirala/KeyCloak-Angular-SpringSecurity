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

-- Volcando datos para la tabla keycloak-springsecurity.acl_entry: ~22 rows (aproximadamente)
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
	(144, 37, 2, 13, 8, 1, 0, 0),
	(145, 38, 1, 13, 4, 1, 1, 1),
	(146, 38, 2, 15, 4, 1, 1, 1);
/*!40000 ALTER TABLE `acl_entry` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.acl_object_identity: ~8 rows (aproximadamente)
DELETE FROM `acl_object_identity`;
/*!40000 ALTER TABLE `acl_object_identity` DISABLE KEYS */;
INSERT INTO `acl_object_identity` (`id`, `object_id_class`, `object_id_identity`, `parent_object`, `owner_sid`, `entries_inheriting`) VALUES
	(1, 1, '2', NULL, 1, 0),
	(2, 1, '3', NULL, 1, 0),
	(27, 1, '-2482579485413606056', NULL, 1, 0),
	(31, 1, '48', NULL, 14, 1),
	(34, 3, '-2482579485413606057', NULL, 1, 0),
	(35, 3, '1', NULL, 1, 0),
	(37, 3, '3', NULL, 1, 1),
	(38, 3, '-2482579485413606055L', NULL, 1, 0);
/*!40000 ALTER TABLE `acl_object_identity` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.acl_sid: ~4 rows (aproximadamente)
DELETE FROM `acl_sid`;
/*!40000 ALTER TABLE `acl_sid` DISABLE KEYS */;
INSERT INTO `acl_sid` (`id`, `principal`, `sid`) VALUES
	(1, 1, 'pgalvez'),
	(14, 1, 'pgirala'),
	(13, 0, 'ROLE_ADMIN'),
	(15, 0, 'ROLE_GESTOR'),
	(18, 1, 'sgpf0078');
/*!40000 ALTER TABLE `acl_sid` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.department: ~0 rows (aproximadamente)
DELETE FROM `department`;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.employee: ~3 rows (aproximadamente)
DELETE FROM `employee`;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`employee_id`, `location`, `salary`, `id`, `department_id`) VALUES
	(22340, 'Madrid', 1000, 2, NULL),
	(810965, 'Córdoba', 2000, 3, NULL),
	(920247, 'El Molar', 2000, 48, NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.employee_project: ~3 rows (aproximadamente)
DELETE FROM `employee_project`;
/*!40000 ALTER TABLE `employee_project` DISABLE KEYS */;
INSERT INTO `employee_project` (`employee_id`, `project_id`) VALUES
	(3, 1),
	(48, 1),
	(2, 3),
	(48, 3);
/*!40000 ALTER TABLE `employee_project` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.jv_commit: ~6 rows (aproximadamente)
DELETE FROM `jv_commit`;
/*!40000 ALTER TABLE `jv_commit` DISABLE KEYS */;
INSERT INTO `jv_commit` (`commit_pk`, `author`, `commit_date`, `commit_date_instant`, `commit_id`) VALUES
	(162, 'sgpf0078', '2021-01-31 18:46:55.884', '2021-01-31T18:46:55.884807400Z', 1.00),
	(163, 'sgpf0078', '2021-01-31 19:07:49.898', '2021-01-31T19:07:49.898474100Z', 2.00),
	(164, 'sgpf0078', '2021-01-31 19:27:16.225', '2021-01-31T19:27:16.225766700Z', 3.00),
	(165, 'sgpf0078', '2021-01-31 19:27:19.734', '2021-01-31T19:27:19.734747200Z', 4.00),
	(166, 'sgpf0078', '2021-01-31 19:27:29.281', '2021-01-31T19:27:29.281294400Z', 5.00),
	(167, 'sgpf0078', '2021-01-31 19:27:33.426', '2021-01-31T19:27:33.426079400Z', 6.00);
/*!40000 ALTER TABLE `jv_commit` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.jv_commit_property: ~0 rows (aproximadamente)
DELETE FROM `jv_commit_property`;
/*!40000 ALTER TABLE `jv_commit_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `jv_commit_property` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.jv_global_id: ~7 rows (aproximadamente)
DELETE FROM `jv_global_id`;
/*!40000 ALTER TABLE `jv_global_id` DISABLE KEYS */;
INSERT INTO `jv_global_id` (`global_id_pk`, `local_id`, `fragment`, `type_name`, `owner_id_fk`) VALUES
	(77, '48', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(78, '1', NULL, 'com.pj.keycloak.model.Project', NULL),
	(79, '2', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(80, '3', NULL, 'com.pj.keycloak.model.Project', NULL),
	(81, '3', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(82, '54', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(83, '55', NULL, 'com.pj.keycloak.model.Employee', NULL);
/*!40000 ALTER TABLE `jv_global_id` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.jv_snapshot: ~10 rows (aproximadamente)
DELETE FROM `jv_snapshot`;
/*!40000 ALTER TABLE `jv_snapshot` DISABLE KEYS */;
INSERT INTO `jv_snapshot` (`snapshot_pk`, `type`, `version`, `state`, `changed_properties`, `managed_type`, `global_id_fk`, `commit_fk`) VALUES
	(195, 'INITIAL', 1, '{\n  "firstName": "Alberto",\n  "lastName": "Lagunas",\n  "projects": [\n    {\n      "entity": "com.pj.keycloak.model.Project",\n      "cdoId": 1\n    },\n    {\n      "entity": "com.pj.keycloak.model.Project",\n      "cdoId": 3\n    }\n  ],\n  "phone": "302-345-2333",\n  "employeeId": 920247,\n  "location": "El Molar",\n  "id": 48,\n  "salary": 2000.0,\n  "userGuid": "7a5f008b-bda7-4e64-9ede-545a580369d0",\n  "email": "alagunas@gmail.com"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 77, 162),
	(196, 'INITIAL', 1, '{\n  "name": "CoFFEE",\n  "location": "Madrid",\n  "id": 1,\n  "employees": [\n    {\n      "entity": "com.pj.keycloak.model.Employee",\n      "cdoId": 48\n    },\n    {\n      "entity": "com.pj.keycloak.model.Employee",\n      "cdoId": 3\n    }\n  ],\n  "budget": 200000.0\n}', '[\n  "name",\n  "location",\n  "id",\n  "employees",\n  "budget"\n]', 'com.pj.keycloak.model.Project', 78, 162),
	(197, 'INITIAL', 1, '{\n  "firstName": "Pablo",\n  "lastName": "Gálvez Irala",\n  "projects": [\n    {\n      "entity": "com.pj.keycloak.model.Project",\n      "cdoId": 3\n    }\n  ],\n  "phone": "555-555-5555",\n  "employeeId": 22340,\n  "location": "Pinto",\n  "id": 2,\n  "salary": 1000.0,\n  "userGuid": "7a5f008b-bda7-4e64-9ede-545a580369d0",\n  "email": "pgirala@gmail.com"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 79, 162),
	(198, 'INITIAL', 1, '{\n  "name": "ATENEA",\n  "location": "Madrid",\n  "id": 3,\n  "employees": [\n    {\n      "entity": "com.pj.keycloak.model.Employee",\n      "cdoId": 48\n    },\n    {\n      "entity": "com.pj.keycloak.model.Employee",\n      "cdoId": 2\n    }\n  ],\n  "budget": 10.0\n}', '[\n  "name",\n  "location",\n  "id",\n  "employees",\n  "budget"\n]', 'com.pj.keycloak.model.Project', 80, 162),
	(199, 'INITIAL', 1, '{\n  "firstName": "Luis",\n  "lastName": "Ranchal",\n  "projects": [\n    {\n      "entity": "com.pj.keycloak.model.Project",\n      "cdoId": 1\n    }\n  ],\n  "phone": "202-345-2333",\n  "employeeId": 810965,\n  "location": "Córdoba",\n  "id": 3,\n  "salary": 2000.0,\n  "userGuid": "7a5f008b-bda7-4e64-9ede-545a580369d0",\n  "email": "lranchal@gmail.com"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 81, 162),
	(200, 'UPDATE', 2, '{\n  "firstName": "Pablo",\n  "lastName": "Gálvez Irala",\n  "projects": [\n    {\n      "entity": "com.pj.keycloak.model.Project",\n      "cdoId": 3\n    }\n  ],\n  "phone": "555-555-5555",\n  "employeeId": 22340,\n  "location": "Madrid",\n  "id": 2,\n  "salary": 1000.0,\n  "userGuid": "7a5f008b-bda7-4e64-9ede-545a580369d0",\n  "email": "pgirala@gmail.com"\n}', '[\n  "location"\n]', 'com.pj.keycloak.model.Employee', 79, 163),
	(201, 'INITIAL', 1, '{\n  "firstName": "(name)",\n  "lastName": "(surname)",\n  "projects": [],\n  "phone": "(phone)",\n  "employeeId": 583667,\n  "location": "(location)",\n  "id": 54,\n  "salary": 0.0,\n  "userGuid": "gkzypcwmaj",\n  "email": "(email)"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 82, 164),
	(202, 'INITIAL', 1, '{\n  "firstName": "(name)",\n  "lastName": "(surname)",\n  "projects": [],\n  "phone": "(phone)",\n  "employeeId": 249969,\n  "location": "(location)",\n  "id": 55,\n  "salary": 0.0,\n  "userGuid": "ymvwgygsix",\n  "email": "(email)"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 83, 165),
	(203, 'TERMINAL', 2, '{}', '[]', 'com.pj.keycloak.model.Employee', 83, 166),
	(204, 'TERMINAL', 2, '{}', '[]', 'com.pj.keycloak.model.Employee', 82, 167);
/*!40000 ALTER TABLE `jv_snapshot` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.project: ~2 rows (aproximadamente)
DELETE FROM `project`;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` (`id`, `budget`, `location`, `name`) VALUES
	(1, 200000, 'Madrid', 'CoFFEE'),
	(3, 10, 'Madrid', 'ATENEA');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.user_profile: ~3 rows (aproximadamente)
DELETE FROM `user_profile`;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` (`id`, `email`, `first_name`, `last_name`, `phone`, `user_guid`) VALUES
	(2, 'pgirala@gmail.com', 'Pablo', 'Gálvez Irala', '555-555-5555', '7a5f008b-bda7-4e64-9ede-545a580369d0'),
	(3, 'lranchal@gmail.com', 'Luis', 'Ranchal', '202-345-2333', '7a5f008b-bda7-4e64-9ede-545a580369d0'),
	(48, 'alagunas@gmail.com', 'Alberto', 'Lagunas', '302-345-2333', '7a5f008b-bda7-4e64-9ede-545a580369d0');
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
