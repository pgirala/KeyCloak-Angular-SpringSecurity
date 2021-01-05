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
	(1, 'com.pj.keycloak.model.Employee');
/*!40000 ALTER TABLE `acl_class` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.acl_entry: ~11 rows (aproximadamente)
DELETE FROM `acl_entry`;
/*!40000 ALTER TABLE `acl_entry` DISABLE KEYS */;
INSERT INTO `acl_entry` (`id`, `acl_object_identity`, `ace_order`, `sid`, `mask`, `granting`, `audit_success`, `audit_failure`) VALUES
	(2, 1, 1, 13, 1, 1, 1, 1),
	(3, 2, 1, 13, 1, 1, 1, 1),
	(4, 2, 2, 13, 2, 1, 1, 1),
	(5, 27, 2, 15, 4, 1, 1, 1),
	(6, 2, 3, 13, 8, 1, 1, 1),
	(7, 1, 2, 13, 2, 1, 1, 1),
	(8, 27, 1, 13, 4, 0, 1, 1),
	(9, 1, 3, 13, 8, 1, 1, 1),
	(122, 31, 0, 15, 1, 1, 0, 0),
	(123, 31, 1, 15, 2, 1, 0, 0),
	(124, 31, 2, 15, 8, 1, 0, 0);
/*!40000 ALTER TABLE `acl_entry` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.acl_object_identity: ~4 rows (aproximadamente)
DELETE FROM `acl_object_identity`;
/*!40000 ALTER TABLE `acl_object_identity` DISABLE KEYS */;
INSERT INTO `acl_object_identity` (`id`, `object_id_class`, `object_id_identity`, `parent_object`, `owner_sid`, `entries_inheriting`) VALUES
	(1, 1, '2', NULL, 1, 0),
	(2, 1, '3', NULL, 1, 0),
	(27, 1, '-2482579485413606056', NULL, 1, 0),
	(31, 1, '48', NULL, 14, 1);
/*!40000 ALTER TABLE `acl_object_identity` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.acl_sid: ~4 rows (aproximadamente)
DELETE FROM `acl_sid`;
/*!40000 ALTER TABLE `acl_sid` DISABLE KEYS */;
INSERT INTO `acl_sid` (`id`, `principal`, `sid`) VALUES
	(1, 1, 'jdoe@example.com'),
	(14, 1, 'pgirala@gmail.com'),
	(13, 0, 'ROLE_ADMIN'),
	(15, 0, 'ROLE_GESTOR');
/*!40000 ALTER TABLE `acl_sid` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.employee: ~3 rows (aproximadamente)
DELETE FROM `employee`;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`employee_id`, `location`, `salary`, `id`) VALUES
	(22340, 'Pinto', 1000, 2),
	(810965, 'Córdoba', 2000, 3),
	(920247, 'Falls Church', 200000, 48);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.employee_project: ~2 rows (aproximadamente)
DELETE FROM `employee_project`;
/*!40000 ALTER TABLE `employee_project` DISABLE KEYS */;
INSERT INTO `employee_project` (`employee_id`, `project_id`) VALUES
	(2, 1),
	(3, 1);
/*!40000 ALTER TABLE `employee_project` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.jv_commit: ~56 rows (aproximadamente)
DELETE FROM `jv_commit`;
/*!40000 ALTER TABLE `jv_commit` DISABLE KEYS */;
INSERT INTO `jv_commit` (`commit_pk`, `author`, `commit_date`, `commit_date_instant`, `commit_id`) VALUES
	(19, 'jdoe@example.com', '2021-01-04 14:05:31.315', '2021-01-04T14:05:31.315989600Z', 1.00),
	(20, 'jdoe@example.com', '2021-01-04 14:07:26.876', '2021-01-04T14:07:26.876117900Z', 2.00),
	(21, 'jdoe@example.com', '2021-01-04 14:11:34.488', '2021-01-04T14:11:34.488293900Z', 3.00),
	(22, 'jdoe@example.com', '2021-01-04 14:15:24.203', '2021-01-04T14:15:24.203530Z', 4.00),
	(23, 'jdoe@example.com', '2021-01-04 14:16:17.534', '2021-01-04T14:16:17.534970400Z', 5.00),
	(24, 'jdoe@example.com', '2021-01-04 14:44:02.539', '2021-01-04T14:44:02.539862800Z', 6.00),
	(25, 'jdoe@example.com', '2021-01-04 14:44:14.866', '2021-01-04T14:44:14.866896100Z', 7.00),
	(26, 'jdoe@example.com', '2021-01-04 14:48:20.175', '2021-01-04T14:48:20.175777800Z', 8.00),
	(27, 'jdoe@example.com', '2021-01-04 14:49:24.126', '2021-01-04T14:49:24.126793800Z', 9.00),
	(28, 'jdoe@example.com', '2021-01-04 14:51:13.139', '2021-01-04T14:51:13.139818Z', 10.00),
	(29, 'jdoe@example.com', '2021-01-04 14:51:26.104', '2021-01-04T14:51:26.104143200Z', 11.00),
	(30, 'jdoe@example.com', '2021-01-04 15:51:29.504', '2021-01-04T15:51:29.504605500Z', 12.00),
	(31, 'jdoe@example.com', '2021-01-04 15:52:22.828', '2021-01-04T15:52:22.828150400Z', 13.00),
	(32, 'jdoe@example.com', '2021-01-04 15:53:19.713', '2021-01-04T15:53:19.713389800Z', 14.00),
	(33, 'jdoe@example.com', '2021-01-04 15:53:21.411', '2021-01-04T15:53:21.411444100Z', 15.00),
	(34, 'jdoe@example.com', '2021-01-04 15:55:59.196', '2021-01-04T15:55:59.196042500Z', 16.00),
	(35, 'jdoe@example.com', '2021-01-04 15:56:35.484', '2021-01-04T15:56:35.484547100Z', 17.00),
	(36, 'jdoe@example.com', '2021-01-04 15:58:56.349', '2021-01-04T15:58:56.349605100Z', 18.00),
	(37, 'jdoe@example.com', '2021-01-04 15:58:59.589', '2021-01-04T15:58:59.589398800Z', 19.00),
	(38, 'pgirala@gmail.com', '2021-01-04 15:59:41.889', '2021-01-04T15:59:41.889781300Z', 20.00),
	(39, 'pgirala@gmail.com', '2021-01-04 16:02:09.970', '2021-01-04T16:02:09.970224600Z', 21.00),
	(40, 'pgirala@gmail.com', '2021-01-04 16:02:27.991', '2021-01-04T16:02:27.991171Z', 22.00),
	(41, 'pgirala@gmail.com', '2021-01-04 16:03:23.486', '2021-01-04T16:03:23.486062900Z', 23.00),
	(42, 'jdoe@example.com', '2021-01-04 16:15:39.199', '2021-01-04T16:15:39.199352300Z', 24.00),
	(43, 'jdoe@example.com', '2021-01-04 16:19:31.706', '2021-01-04T16:19:31.706165800Z', 25.00),
	(44, 'jdoe@example.com', '2021-01-04 16:19:46.673', '2021-01-04T16:19:46.673570400Z', 26.00),
	(45, 'pgirala@gmail.com', '2021-01-04 16:45:57.382', '2021-01-04T16:45:57.382445500Z', 27.00),
	(46, 'pgirala@gmail.com', '2021-01-04 16:46:21.380', '2021-01-04T16:46:21.380395900Z', 28.00),
	(47, 'jdoe@example.com', '2021-01-04 16:48:07.836', '2021-01-04T16:48:07.836877400Z', 29.00),
	(48, 'pgirala@gmail.com', '2021-01-04 16:48:34.558', '2021-01-04T16:48:34.558920Z', 30.00),
	(49, 'pgirala@gmail.com', '2021-01-04 16:55:12.297', '2021-01-04T16:55:12.297292200Z', 31.00),
	(50, 'pgirala@gmail.com', '2021-01-04 16:55:39.899', '2021-01-04T16:55:39.899607300Z', 32.00),
	(51, 'jdoe@example.com', '2021-01-04 16:57:00.130', '2021-01-04T16:57:00.130984Z', 33.00),
	(52, 'jdoe@example.com', '2021-01-04 17:00:46.955', '2021-01-04T17:00:46.955609300Z', 34.00),
	(53, 'pgirala@gmail.com', '2021-01-04 17:02:04.242', '2021-01-04T17:02:04.242162500Z', 35.00),
	(54, 'pgirala@gmail.com', '2021-01-04 17:02:13.705', '2021-01-04T17:02:13.705237800Z', 36.00),
	(55, 'jdoe@example.com', '2021-01-04 17:04:19.051', '2021-01-04T17:04:19.051826900Z', 37.00),
	(56, 'jdoe@example.com', '2021-01-04 17:07:17.633', '2021-01-04T17:07:17.633480700Z', 38.00),
	(57, 'jdoe@example.com', '2021-01-04 17:09:19.430', '2021-01-04T17:09:19.430034900Z', 39.00),
	(58, 'jdoe@example.com', '2021-01-04 17:09:36.903', '2021-01-04T17:09:36.903326400Z', 40.00),
	(59, 'pgirala@gmail.com', '2021-01-04 17:10:13.183', '2021-01-04T17:10:13.183245200Z', 41.00),
	(60, 'pgirala@gmail.com', '2021-01-04 17:11:41.768', '2021-01-04T17:11:41.768953700Z', 42.00),
	(61, 'pgirala@gmail.com', '2021-01-04 17:11:53.128', '2021-01-04T17:11:53.128586600Z', 43.00),
	(62, 'jdoe@example.com', '2021-01-05 08:20:53.395', '2021-01-05T08:20:53.395093600Z', 44.00),
	(63, 'jdoe@example.com', '2021-01-05 08:26:28.965', '2021-01-05T08:26:28.965767100Z', 45.00),
	(64, 'jdoe@example.com', '2021-01-05 08:28:19.084', '2021-01-05T08:28:19.084427400Z', 46.00),
	(65, 'jdoe@example.com', '2021-01-05 08:33:11.531', '2021-01-05T08:33:11.531426500Z', 47.00),
	(66, 'jdoe@example.com', '2021-01-05 08:33:25.468', '2021-01-05T08:33:25.468620400Z', 48.00),
	(67, 'jdoe@example.com', '2021-01-05 08:35:01.614', '2021-01-05T08:35:01.614652800Z', 49.00),
	(68, 'jdoe@example.com', '2021-01-05 08:36:37.166', '2021-01-05T08:36:37.166301800Z', 50.00),
	(69, 'jdoe@example.com', '2021-01-05 08:36:40.096', '2021-01-05T08:36:40.096147900Z', 51.00),
	(70, 'jdoe@example.com', '2021-01-05 08:36:42.014', '2021-01-05T08:36:42.014331600Z', 52.00),
	(71, 'pgirala@gmail.com', '2021-01-05 08:37:33.616', '2021-01-05T08:37:33.616234800Z', 53.00),
	(72, 'pgirala@gmail.com', '2021-01-05 08:38:01.031', '2021-01-05T08:38:01.031367700Z', 54.00),
	(73, 'pgirala@gmail.com', '2021-01-05 08:40:55.002', '2021-01-05T08:40:55.002493900Z', 55.00),
	(74, 'pgirala@gmail.com', '2021-01-05 08:40:58.714', '2021-01-05T08:40:58.714407200Z', 56.00);
/*!40000 ALTER TABLE `jv_commit` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.jv_commit_property: ~0 rows (aproximadamente)
DELETE FROM `jv_commit_property`;
/*!40000 ALTER TABLE `jv_commit_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `jv_commit_property` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.jv_global_id: ~31 rows (aproximadamente)
DELETE FROM `jv_global_id`;
/*!40000 ALTER TABLE `jv_global_id` DISABLE KEYS */;
INSERT INTO `jv_global_id` (`global_id_pk`, `local_id`, `fragment`, `type_name`, `owner_id_fk`) VALUES
	(16, '20', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(17, '21', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(18, '22', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(19, '23', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(20, '24', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(21, '25', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(22, '26', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(23, '27', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(24, '28', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(25, '29', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(26, '30', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(27, '31', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(28, '32', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(29, '33', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(30, '34', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(31, '35', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(32, '36', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(33, '37', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(34, '38', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(35, '39', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(36, '40', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(37, '41', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(38, '42', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(39, '43', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(40, '44', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(41, '2', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(42, '45', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(43, '46', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(44, '47', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(45, '48', NULL, 'com.pj.keycloak.model.Employee', NULL),
	(46, '49', NULL, 'com.pj.keycloak.model.Employee', NULL);
/*!40000 ALTER TABLE `jv_global_id` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.jv_snapshot: ~56 rows (aproximadamente)
DELETE FROM `jv_snapshot`;
/*!40000 ALTER TABLE `jv_snapshot` DISABLE KEYS */;
INSERT INTO `jv_snapshot` (`snapshot_pk`, `type`, `version`, `state`, `changed_properties`, `managed_type`, `global_id_fk`, `commit_fk`) VALUES
	(19, 'INITIAL', 1, '{\n  "firstName": "John",\n  "lastName": "Doe",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 717167,\n  "location": "Falls Church",\n  "id": 20,\n  "salary": 200000.0,\n  "userGuid": "tqmimvdssx",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 16, 19),
	(20, 'INITIAL', 1, '{\n  "firstName": "John",\n  "lastName": "Doe",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 663132,\n  "location": "Falls Church",\n  "id": 21,\n  "salary": 200000.0,\n  "userGuid": "fdkocljdvg",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 17, 20),
	(21, 'INITIAL', 1, '{\n  "firstName": "John",\n  "lastName": "Doe",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 707796,\n  "location": "Falls Church",\n  "id": 22,\n  "salary": 200000.0,\n  "userGuid": "uvtvuzidlf",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 18, 21),
	(22, 'INITIAL', 1, '{\n  "firstName": "John",\n  "lastName": "Doe",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 665489,\n  "location": "Falls Church",\n  "id": 23,\n  "salary": 200000.0,\n  "userGuid": "vjowelfoyq",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 19, 22),
	(23, 'TERMINAL', 2, '{}', '[]', 'com.pj.keycloak.model.Employee', 19, 23),
	(24, 'INITIAL', 1, '{\n  "firstName": "John",\n  "lastName": "Doe",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 258793,\n  "location": "Falls Church",\n  "id": 24,\n  "salary": 200000.0,\n  "userGuid": "gptzhwinog",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 20, 24),
	(25, 'TERMINAL', 2, '{}', '[]', 'com.pj.keycloak.model.Employee', 20, 25),
	(26, 'INITIAL', 1, '{\n  "firstName": "John",\n  "lastName": "Doe",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 555117,\n  "location": "Falls Church",\n  "id": 25,\n  "salary": 200000.0,\n  "userGuid": "zmphyktkgw",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 21, 26),
	(27, 'TERMINAL', 2, '{}', '[]', 'com.pj.keycloak.model.Employee', 21, 27),
	(28, 'INITIAL', 1, '{\n  "firstName": "John",\n  "lastName": "Doe",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 354326,\n  "location": "Falls Church",\n  "id": 26,\n  "salary": 200000.0,\n  "userGuid": "lbtwnlsnvd",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 22, 28),
	(29, 'TERMINAL', 2, '{}', '[]', 'com.pj.keycloak.model.Employee', 22, 29),
	(30, 'INITIAL', 1, '{\n  "firstName": "John",\n  "lastName": "Doe",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 283675,\n  "location": "Falls Church",\n  "id": 27,\n  "salary": 200000.0,\n  "userGuid": "sxjwfbchdj",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 23, 30),
	(31, 'INITIAL', 1, '{\n  "firstName": "John",\n  "lastName": "Doe",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 978900,\n  "location": "Falls Church",\n  "id": 28,\n  "salary": 200000.0,\n  "userGuid": "iuyjwivaiu",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 24, 31),
	(32, 'TERMINAL', 2, '{}', '[]', 'com.pj.keycloak.model.Employee', 24, 32),
	(33, 'INITIAL', 1, '{\n  "firstName": "John",\n  "lastName": "Doe",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 443630,\n  "location": "Falls Church",\n  "id": 29,\n  "salary": 200000.0,\n  "userGuid": "dirgkocxfc",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 25, 33),
	(34, 'INITIAL', 1, '{\n  "firstName": "John",\n  "lastName": "Doe",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 18044,\n  "location": "Falls Church",\n  "id": 30,\n  "salary": 200000.0,\n  "userGuid": "ztlmjafomh",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 26, 34),
	(35, 'TERMINAL', 2, '{}', '[]', 'com.pj.keycloak.model.Employee', 26, 35),
	(36, 'INITIAL', 1, '{\n  "firstName": "John",\n  "lastName": "Doe",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 683354,\n  "location": "Falls Church",\n  "id": 31,\n  "salary": 200000.0,\n  "userGuid": "emsidjaxya",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 27, 36),
	(37, 'TERMINAL', 2, '{}', '[]', 'com.pj.keycloak.model.Employee', 27, 37),
	(38, 'INITIAL', 1, '{\n  "firstName": "John",\n  "lastName": "Doe",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 954278,\n  "location": "Falls Church",\n  "id": 32,\n  "salary": 200000.0,\n  "userGuid": "gtltnzkufj",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 28, 38),
	(39, 'INITIAL', 1, '{\n  "firstName": "John",\n  "lastName": "Doe",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 126701,\n  "location": "Falls Church",\n  "id": 33,\n  "salary": 200000.0,\n  "userGuid": "scqeiuupkm",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 29, 39),
	(40, 'INITIAL', 1, '{\n  "firstName": "John",\n  "lastName": "Doe",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 976217,\n  "location": "Falls Church",\n  "id": 34,\n  "salary": 200000.0,\n  "userGuid": "exrysekhfj",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 30, 40),
	(41, 'INITIAL', 1, '{\n  "firstName": "John",\n  "lastName": "Doe",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 581854,\n  "location": "Falls Church",\n  "id": 35,\n  "salary": 200000.0,\n  "userGuid": "rzyoilyfmm",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 31, 41),
	(42, 'INITIAL', 1, '{\n  "firstName": "John",\n  "lastName": "Doe",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 360208,\n  "location": "Falls Church",\n  "id": 36,\n  "salary": 200000.0,\n  "userGuid": "xrpsoqyqtu",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 32, 42),
	(43, 'TERMINAL', 2, '{}', '[]', 'com.pj.keycloak.model.Employee', 32, 43),
	(44, 'INITIAL', 1, '{\n  "firstName": "John",\n  "lastName": "Doe",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 166684,\n  "location": "Falls Church",\n  "id": 37,\n  "salary": 200000.0,\n  "userGuid": "rlukelrhvd",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 33, 44),
	(45, 'INITIAL', 1, '{\n  "firstName": "John",\n  "lastName": "Doe",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 132848,\n  "location": "Falls Church",\n  "id": 38,\n  "salary": 200000.0,\n  "userGuid": "gzblszxujc",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 34, 45),
	(46, 'UPDATE', 2, '{\n  "firstName": "Pepe",\n  "lastName": "Hillo",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 132848,\n  "location": "Falls Church",\n  "id": 38,\n  "salary": 200000.0,\n  "userGuid": "e1a0b843-f705-4764-a7f3-1d73bfbb55f7",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "lastName",\n  "userGuid"\n]', 'com.pj.keycloak.model.Employee', 34, 46),
	(47, 'TERMINAL', 2, '{}', '[]', 'com.pj.keycloak.model.Employee', 33, 47),
	(48, 'TERMINAL', 3, '{}', '[]', 'com.pj.keycloak.model.Employee', 34, 48),
	(49, 'INITIAL', 1, '{\n  "firstName": "John",\n  "lastName": "Doe",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 469794,\n  "location": "Falls Church",\n  "id": 39,\n  "salary": 200000.0,\n  "userGuid": "duefspqhfe",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 35, 49),
	(50, 'UPDATE', 2, '{\n  "firstName": "Juan",\n  "lastName": "Doe",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 469794,\n  "location": "Falls Church",\n  "id": 39,\n  "salary": 200000.0,\n  "userGuid": "e1a0b843-f705-4764-a7f3-1d73bfbb55f7",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "userGuid"\n]', 'com.pj.keycloak.model.Employee', 35, 50),
	(51, 'TERMINAL', 3, '{}', '[]', 'com.pj.keycloak.model.Employee', 35, 51),
	(52, 'INITIAL', 1, '{\n  "firstName": "John",\n  "lastName": "Doe",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 154337,\n  "location": "Falls Church",\n  "id": 40,\n  "salary": 200000.0,\n  "userGuid": "qpawrcrtcn",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 36, 52),
	(53, 'INITIAL', 1, '{\n  "firstName": "John",\n  "lastName": "Doe",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 709250,\n  "location": "Falls Church",\n  "id": 41,\n  "salary": 200000.0,\n  "userGuid": "jdhvvwqijw",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 37, 53),
	(54, 'UPDATE', 2, '{\n  "firstName": "Julián",\n  "lastName": "Doe",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 709250,\n  "location": "Falls Church",\n  "id": 41,\n  "salary": 200000.0,\n  "userGuid": "e1a0b843-f705-4764-a7f3-1d73bfbb55f7",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "userGuid"\n]', 'com.pj.keycloak.model.Employee', 37, 54),
	(55, 'UPDATE', 3, '{\n  "firstName": "Julián",\n  "lastName": "Does",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 709250,\n  "location": "Falls Church",\n  "id": 41,\n  "salary": 200000.0,\n  "userGuid": "827ab723-c115-4a28-8f49-5b3ec89ecf02",\n  "email": "jdoe@hj.cim"\n}', '[\n  "lastName",\n  "userGuid"\n]', 'com.pj.keycloak.model.Employee', 37, 55),
	(56, 'TERMINAL', 2, '{}', '[]', 'com.pj.keycloak.model.Employee', 36, 56),
	(57, 'INITIAL', 1, '{\n  "firstName": "John",\n  "lastName": "Doe",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 561046,\n  "location": "Falls Church",\n  "id": 42,\n  "salary": 200000.0,\n  "userGuid": "vqvmgrzeqn",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 38, 57),
	(58, 'TERMINAL', 2, '{}', '[]', 'com.pj.keycloak.model.Employee', 38, 58),
	(59, 'TERMINAL', 4, '{}', '[]', 'com.pj.keycloak.model.Employee', 37, 59),
	(60, 'INITIAL', 1, '{\n  "firstName": "John",\n  "lastName": "Doe",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 485945,\n  "location": "Falls Church",\n  "id": 43,\n  "salary": 200000.0,\n  "userGuid": "gtqqzxhdmb",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 39, 60),
	(61, 'TERMINAL', 2, '{}', '[]', 'com.pj.keycloak.model.Employee', 39, 61),
	(62, 'INITIAL', 1, '{\n  "firstName": "John",\n  "lastName": "Doe",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 290950,\n  "location": "Falls Church",\n  "id": 44,\n  "salary": 200000.0,\n  "userGuid": "gndlnnbnhr",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 40, 62),
	(63, 'TERMINAL', 2, '{}', '[]', 'com.pj.keycloak.model.Employee', 40, 63),
	(64, 'INITIAL', 1, '{\n  "firstName": "Pablo",\n  "lastName": "Gálvez Irala",\n  "projects": [],\n  "phone": "555-555-5555",\n  "employeeId": 22340,\n  "location": "Pinto",\n  "id": 2,\n  "salary": 1000.0,\n  "userGuid": "827ab723-c115-4a28-8f49-5b3ec89ecf02",\n  "email": "pgirala@gmail.com"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 41, 64),
	(65, 'INITIAL', 1, '{\n  "firstName": "John",\n  "lastName": "Doe",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 381821,\n  "location": "Falls Church",\n  "id": 45,\n  "salary": 200000.0,\n  "userGuid": "nvlywhyjct",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 42, 65),
	(66, 'TERMINAL', 2, '{}', '[]', 'com.pj.keycloak.model.Employee', 42, 66),
	(67, 'INITIAL', 1, '{\n  "firstName": "John",\n  "lastName": "Doe",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 633360,\n  "location": "Falls Church",\n  "id": 46,\n  "salary": 200000.0,\n  "userGuid": "gqxbxisdtt",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 43, 67),
	(68, 'TERMINAL', 2, '{}', '[]', 'com.pj.keycloak.model.Employee', 43, 68),
	(69, 'INITIAL', 1, '{\n  "firstName": "John",\n  "lastName": "Doe",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 584883,\n  "location": "Falls Church",\n  "id": 47,\n  "salary": 200000.0,\n  "userGuid": "mpgttpebph",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 44, 69),
	(70, 'TERMINAL', 2, '{}', '[]', 'com.pj.keycloak.model.Employee', 44, 70),
	(71, 'INITIAL', 1, '{\n  "firstName": "John",\n  "lastName": "Doe",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 920247,\n  "location": "Falls Church",\n  "id": 48,\n  "salary": 200000.0,\n  "userGuid": "qgxyowcprj",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 45, 71),
	(72, 'UPDATE', 2, '{\n  "firstName": "Alberto",\n  "lastName": "Lagunas",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 920247,\n  "location": "Falls Church",\n  "id": 48,\n  "salary": 200000.0,\n  "userGuid": "e1a0b843-f705-4764-a7f3-1d73bfbb55f7",\n  "email": "alagunas@gmail.com"\n}', '[\n  "firstName",\n  "lastName",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 45, 72),
	(73, 'INITIAL', 1, '{\n  "firstName": "John",\n  "lastName": "Doe",\n  "projects": [],\n  "phone": "202-345-2333",\n  "employeeId": 152003,\n  "location": "Falls Church",\n  "id": 49,\n  "salary": 200000.0,\n  "userGuid": "ocovbixfsv",\n  "email": "jdoe@hj.cim"\n}', '[\n  "firstName",\n  "lastName",\n  "projects",\n  "phone",\n  "employeeId",\n  "location",\n  "id",\n  "salary",\n  "userGuid",\n  "email"\n]', 'com.pj.keycloak.model.Employee', 46, 73),
	(74, 'TERMINAL', 2, '{}', '[]', 'com.pj.keycloak.model.Employee', 46, 74);
/*!40000 ALTER TABLE `jv_snapshot` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.project: ~1 rows (aproximadamente)
DELETE FROM `project`;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` (`id`, `budget`, `location`, `name`) VALUES
	(1, 1000000, 'Madrid', 'CoFFEE');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;

-- Volcando datos para la tabla keycloak-springsecurity.user_profile: ~3 rows (aproximadamente)
DELETE FROM `user_profile`;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` (`id`, `email`, `first_name`, `last_name`, `phone`, `user_guid`) VALUES
	(2, 'pgirala@gmail.com', 'Pablo', 'Gálvez Irala', '555-555-5555', '827ab723-c115-4a28-8f49-5b3ec89ecf02'),
	(3, 'lranchal@gmail.com', 'Luis', 'Ranchal', '202-345-2333', '827ab723-c115-4a28-8f49-5b3ec89ecf02'),
	(48, 'alagunas@gmail.com', 'Alberto', 'Lagunas', '202-345-2333', 'e1a0b843-f705-4764-a7f3-1d73bfbb55f7');
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
