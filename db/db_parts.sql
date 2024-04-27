/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100419
 Source Host           : localhost:3306
 Source Schema         : db_parts

 Target Server Type    : MySQL
 Target Server Version : 100419
 File Encoding         : 65001

 Date: 27/04/2024 13:13:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tools` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES (1, NULL, NULL, 100);

-- ----------------------------
-- Table structure for pr_debplans
-- ----------------------------
DROP TABLE IF EXISTS `pr_debplans`;
CREATE TABLE `pr_debplans`  (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `model` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mold_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cavity` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `attachment` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `file_path` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pr_debplans
-- ----------------------------
INSERT INTO `pr_debplans` VALUES (1, 'DT META', '100', 'L101', 'c671c9da00e4a22426acfff8b567e402.pdf', '2024-03-05 08:44:00', 'Rosly Rapada', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf');
INSERT INTO `pr_debplans` VALUES (2, 'DT META', '100', 'L102', '3e7475cff9736721550dd15e7e53e40d.pdf', '2024-03-05 08:44:00', 'Rosly Rapada', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/3e7475cff9736721550dd15e7e53e40d.pdf');
INSERT INTO `pr_debplans` VALUES (3, 'DT META', '200', 'CAV4', 'b868f00df6ea23f7e227c0ad301980c5.pdf', '2024-03-05 04:00:00', 'Rosly Rapada', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/b868f00df6ea23f7e227c0ad301980c5.pdf');
INSERT INTO `pr_debplans` VALUES (4, 'DT META', '200', 'CAV1', '994829cbe1e093461bb601247b16d895.pdf', '2024-03-12 01:25:00', 'Rosly Rapada', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf');
INSERT INTO `pr_debplans` VALUES (5, 'DT META', '10', '110', 'cc223ee0dce9a4e95ba520b80d5eee66.pdf', '2024-03-18 09:59:00', 'Rosly Rapada', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf');
INSERT INTO `pr_debplans` VALUES (6, 'DT META', 'F2', 'A', '77bfde243e4dad8cca7047a4d9ac1fa0.pdf', '2024-04-01 04:25:00', 'Rosly Rapada', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/77bfde243e4dad8cca7047a4d9ac1fa0.pdf');
INSERT INTO `pr_debplans` VALUES (7, 'DT META', 'F2', 'D', 'e4efba0725d9f061a6f929b23d26142c.pdf', '2024-04-15 04:31:00', 'Rosly Rapada', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/e4efba0725d9f061a6f929b23d26142c.pdf');
INSERT INTO `pr_debplans` VALUES (8, 'TEST MODEL', '1', '101', 'e782b05963fd66432a1553c0ebe29990.pdf', '2024-04-27 09:01:00', 'Rosly Rapada', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/e782b05963fd66432a1553c0ebe29990.pdf');

-- ----------------------------
-- Table structure for pr_history
-- ----------------------------
DROP TABLE IF EXISTS `pr_history`;
CREATE TABLE `pr_history`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `unique` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `model` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cavity` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `quantity` int(12) NULL DEFAULT NULL,
  `mold_no` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `casting_machine` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `trimming_date` datetime(0) NULL DEFAULT NULL,
  `trimmer` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `med_sampling_date` datetime(0) NULL DEFAULT NULL,
  `med_sampler` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `deburring_line` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `date_deburring_in` datetime(0) NULL DEFAULT NULL,
  `date_deburring_out` datetime(0) NULL DEFAULT NULL,
  `deburring_pic` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `shotblast_line` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `date_shotblast_in` datetime(0) NULL DEFAULT NULL,
  `date_shotblast_out` datetime(0) NULL DEFAULT NULL,
  `shotblast_pic` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `shotblastqa_lock_details` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `shotblastqa_lock_date` datetime(0) NULL DEFAULT NULL,
  `shotblastqa_lock_by` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `shotblastqa_unlock_by` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `shotblastqa_unlock_date` datetime(0) NULL DEFAULT NULL,
  `shotblastmrs_remarks` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `shotblastmrs_date` datetime(0) NULL DEFAULT NULL,
  `shotblastmrs_by` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `deburring_pic_out` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `shotblast_pic_out` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `annealing_oven` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `annealing_date_in` datetime(0) NULL DEFAULT NULL,
  `annealing_pic_in` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `annealing_pic_out` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `annealing_date_out` datetime(0) NULL DEFAULT NULL,
  `machining_date_in` datetime(0) NULL DEFAULT NULL,
  `machining_line` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `machining_pic_in` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `machining_date_out` datetime(0) NULL DEFAULT NULL,
  `machining_pic_out` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `machining_split_lot` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `machine_no` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `date_split` datetime(0) NULL DEFAULT NULL,
  `split_by` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `reason_split` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `from_serial` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `from_unique` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `qa_split_judge` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `qa_split_date` datetime(0) NULL DEFAULT NULL,
  `qa_split_pic` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ipqc_mc_judge` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `date_ipqc_mc` datetime(0) NULL DEFAULT NULL,
  `ipqc_pic` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mrs_wet_details` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mrs_wet_date` datetime(0) NULL DEFAULT NULL,
  `mrs_wet_pic` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `qa_dimension_pic` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `qa_dimension_date` datetime(0) NULL DEFAULT NULL,
  `qa_dimension_remarks` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `qa_dimension_judgement` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bubblewashin_date` datetime(0) NULL DEFAULT NULL,
  `bubblewashin_line` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bubblewashin_pic` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bubblewashout_date` datetime(0) NULL DEFAULT NULL,
  `bubblewashout_pic` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ovenin_date` datetime(0) NULL DEFAULT NULL,
  `ovenin_line` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ovenin_pic` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ovenout_date` datetime(0) NULL DEFAULT NULL,
  `ovenout_pic` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mfi_line` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mfiin_date` datetime(0) NULL DEFAULT NULL,
  `mfiin_pic` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mfiout_date` datetime(0) NULL DEFAULT NULL,
  `mfiout_pic` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mrs_dry_details` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mrs_dry_date` datetime(0) NULL DEFAULT NULL,
  `mrs_dry_pic` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mrsdry_qa_status` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mrs_dryqa_pic` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mrs_dryqa_date` datetime(0) NULL DEFAULT NULL,
  `mfi_serial` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mfi_details` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pr_history
-- ----------------------------
INSERT INTO `pr_history` VALUES (1, '012345678910', '1', 'DT META', 'L101', 16, '100', 'DC01', '2024-04-01 09:17:00', 'Rosly Rapada', '2024-04-02 09:48:00', 'Rosly Rapada', 'LINE01', '2024-04-03 09:44:54', '2024-04-03 09:46:00', 'Rosly Rapada', 'SHOTBLAST2', '2024-04-03 09:47:34', '2024-04-03 09:48:00', 'Rosly Rapada', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-08 15:50:22', NULL, NULL, NULL, 'Rosly Rapada', 'Rosly Rapada', 'OVEN01', '2024-04-03 09:49:57', 'Rosly Rapada', 'Rosly Rapada', '2024-04-03 10:06:44', '2024-04-03 10:07:08', 'B101', 'Rosly Rapada', '2024-04-03 02:03:00', 'Rosly Rapada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Accept', '2024-04-05 09:33:00', 'Rosly Rapada', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-05 01:24:00', 'DIMENSION NG', 'Scrap', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_history` VALUES (2, '111111111115', '1', 'DT META', '110', 16, '10', 'DC03', '2024-04-02 11:12:00', 'Rosly Rapada', '2024-04-02 11:12:00', 'Rosly Rapada', 'LINE02', '2024-04-02 11:12:22', '2024-04-02 11:12:00', 'Rosly Rapada', 'SHOTBLAST1', '2024-04-02 11:12:52', '2024-04-02 11:12:00', 'Rosly Rapada', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-08 15:50:18', NULL, NULL, NULL, 'Rosly Rapada', 'Rosly Rapada', 'OVEN01', '2024-04-02 11:24:29', 'Rosly Rapada', 'Rosly Rapada', '2024-04-02 11:24:43', '2024-04-02 11:26:07', 'B101', 'Rosly Rapada', '2024-04-02 11:26:00', 'Rosly Rapada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Reject', '2024-04-05 05:12:00', 'Rosly Rapada', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-02 11:26:00', 'Lot Accepted', 'Accept', '2024-04-02 11:26:57', 'BUBBLEWASH01', 'Rosly Rapada', '2024-04-02 11:27:09', 'Rosly Rapada', '2024-04-02 11:27:18', 'OVEN01', 'Rosly Rapada', '2024-04-02 11:29:28', 'Rosly Rapada', 'LINE01', '2024-04-02 11:45:57', 'Rosly Rapada', '2024-04-02 02:41:00', 'Rosly Rapada', 'Sorted OK - Rosly Rapada', '2024-04-16 10:58:00', 'Rosly Rapada', 'Lot Scrap - Rosly Rapada', 'Rosly Rapada', '2024-04-16 05:01:00', NULL, NULL);
INSERT INTO `pr_history` VALUES (3, '111222222111', '1', 'DT META', '110', 16, '10', 'DC03', '2024-04-02 05:01:00', 'Rosly Rapada', '2024-04-02 05:01:00', 'Rosly Rapada', 'LINE01', '2024-04-02 17:02:05', '2024-04-02 05:02:00', 'Rosly Rapada', 'SHOTBLAST2', '2024-04-02 17:02:32', '2024-04-02 05:02:00', 'Rosly Rapada', 'ASASAS', '2024-04-02 05:02:00', 'Rosly Rapada', NULL, NULL, 'n/a', '2024-04-08 01:47:00', 'Rosly Rapada', 'Rosly Rapada', 'Rosly Rapada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_history` VALUES (4, '555555555555', '1', 'DT META', '110', 16, '10', 'DC03', '2024-04-03 11:40:00', 'Rosly Rapada', '2024-04-03 11:40:00', 'Rosly Rapada', 'LINE01', '2024-04-03 11:40:59', '2024-04-03 11:41:00', 'Rosly Rapada', 'SHOTBLAST1', '2024-04-03 11:41:13', '2024-04-03 11:41:00', 'Rosly Rapada', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-03 11:41:26', NULL, NULL, NULL, 'Rosly Rapada', 'Rosly Rapada', 'OVEN01', '2024-04-03 11:41:33', 'Rosly Rapada', 'Rosly Rapada', '2024-04-03 14:53:01', '2024-04-03 14:53:20', 'B101', 'Rosly Rapada', '2024-04-03 04:40:00', 'Rosly Rapada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Reject', '2024-04-05 11:03:00', 'Rosly Rapada', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-05 01:56:00', 'DIMENSION NG', 'Scrap', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_history` VALUES (5, '555555555556', '1', 'DT META', '110', 3, '10', 'DC03', '2024-04-03 11:40:00', 'Rosly Rapada', '2024-04-03 11:40:00', 'Rosly Rapada', 'LINE01', '2024-04-03 11:40:59', '2024-04-03 11:41:00', 'Rosly Rapada', 'SHOTBLAST1', '2024-04-03 11:41:13', '2024-04-03 11:41:00', 'Rosly Rapada', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-03 11:41:26', NULL, NULL, NULL, 'Rosly Rapada', 'Rosly Rapada', 'OVEN01', '2024-04-03 11:41:33', 'Rosly Rapada', 'Rosly Rapada', '2024-04-03 14:53:01', '2024-04-03 14:53:20', 'B101', 'Rosly Rapada', NULL, NULL, NULL, NULL, '2024-04-03 03:51:00', 'Rosly Rapada', 'For Sort', '555555555555', '1', 'For Sort MRS', '2024-04-05 11:01:00', 'Rosly Rapada', 'Reject', '2024-04-08 07:44:00', 'Rosly Rapada', 'Sorted OK - ', '2024-04-05 03:06:00', 'Rosly Rapada', 'Rosly Rapada', '2024-04-05 03:37:00', 'Lot Accepted', 'Accept', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Sorted OK - Rosly Rapada', '2024-04-16 10:57:00', 'Rosly Rapada', 'Lot Accepted - Rosly Rapada', 'Rosly Rapada', '2024-04-16 04:55:00', NULL, NULL);
INSERT INTO `pr_history` VALUES (6, '222222222222', '1', 'DT META', 'CAV1', 16, '200', 'DC01', '2024-04-08 01:41:00', 'Rosly Rapada', '2024-04-08 01:41:00', 'Rosly Rapada', 'LINE01', '2024-04-08 13:42:41', '2024-04-08 01:43:00', 'Rosly Rapada', 'SHOTBLAST1', '2024-04-08 13:44:34', '2024-04-08 01:44:00', 'Rosly Rapada', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-08 13:45:18', NULL, NULL, NULL, 'Rosly Rapada', 'Rosly Rapada', 'OVEN01', '2024-04-08 13:46:22', 'Rosly Rapada', 'Rosly Rapada', '2024-04-08 13:47:00', '2024-04-08 13:48:53', 'B101', 'Rosly Rapada', '2024-04-08 01:49:00', 'Rosly Rapada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Accept', '2024-04-08 01:49:00', 'Rosly Rapada', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-08 01:50:00', 'Lot Accepted', 'Accept', '2024-04-08 13:52:42', 'BUBBLEWASH01', 'Rosly Rapada', '2024-04-08 13:52:58', 'Rosly Rapada', '2024-04-08 13:54:10', 'OVEN01', 'Rosly Rapada', '2024-04-08 14:18:30', 'Rosly Rapada', 'LINE01', '2024-04-08 15:42:12', 'Rosly Rapada', '2024-04-08 04:59:00', 'Rosly Rapada', NULL, NULL, NULL, NULL, NULL, NULL, 'MFISERIAL202404200713515461', 'Rosly Rapada-2024-04-20 07:13');
INSERT INTO `pr_history` VALUES (7, '000000000000', '1', 'DT META', 'CAV1', 16, '200', 'DC02', '2024-04-11 09:14:00', 'Rosly Rapada', '2024-04-11 09:19:00', 'Rosly Rapada', 'LINE01', '2024-04-11 09:19:55', '2024-04-11 09:20:00', 'Rosly Rapada', 'SHOTBLAST1', '2024-04-11 09:21:58', '2024-04-11 09:43:00', 'Rosly Rapada', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-12 14:33:06', NULL, NULL, NULL, 'Rosly Rapada', 'Rosly Rapada', 'OVEN01', '2024-04-12 14:34:07', 'Rosly Rapada', 'Rosly Rapada', '2024-04-12 17:01:27', '2024-04-12 17:01:51', 'B101', 'Rosly Rapada', '2024-04-15 03:55:00', 'Rosly Rapada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Accept', '2024-04-15 03:55:00', 'Rosly Rapada', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-15 03:56:00', 'Lot Accepted', 'Accept', '2024-04-15 15:56:50', 'BUBBLEWASH01', 'Rosly Rapada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_history` VALUES (8, '121523111029', '1', 'DT META', 'CAV1', 16, '200', 'DC02', '2024-04-15 04:26:00', 'Rosly Rapada', '2024-04-15 04:33:00', 'Rosly Rapada', 'LINE01', '2024-04-15 16:43:10', '2024-04-16 11:26:00', 'Rosly Rapada', 'SHOTBLAST3', '2024-04-20 08:43:46', '2024-04-20 10:00:00', 'Rosly Rapada', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-20 11:36:10', NULL, NULL, NULL, 'Rosly Rapada', 'Rosly Rapada', 'OVEN01', '2024-04-20 13:05:09', 'Rosly Rapada', 'Rosly Rapada', '2024-04-20 14:37:07', '2024-04-22 10:39:36', 'B101', 'Rosly Rapada', '2024-04-22 10:46:00', 'Rosly Rapada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Accept', '2024-04-22 10:47:00', 'Rosly Rapada', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-22 10:47:00', 'Lot Accepted', 'Accept', '2024-04-22 10:49:07', 'BUBBLEWASH01', 'Rosly Rapada', '2024-04-22 10:49:27', 'Rosly Rapada', '2024-04-22 10:49:57', 'OVEN01', 'Rosly Rapada', '2024-04-22 10:51:38', 'Rosly Rapada', 'LINE01', '2024-04-22 11:31:57', 'Rosly Rapada', '2024-04-22 11:32:00', 'Rosly Rapada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_history` VALUES (9, '222222222222', '2', 'DT META', 'CAV1', 16, '200', 'DC02', '2024-04-15 04:45:00', 'Rosly Rapada', '2024-04-15 04:45:00', 'Rosly Rapada', 'LINE02', '2024-04-15 16:48:20', NULL, 'Rosly Rapada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_history` VALUES (10, '888888888885', '1', 'DT META', 'CAV1', 16, '200', 'DC02', '2024-04-16 09:30:00', 'Rosly Rapada', NULL, 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_history` VALUES (11, '011111111119', '1', 'DT META', 'CAV1', 16, '200', 'DC02', '2024-04-16 09:33:00', 'Rosly Rapada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_history` VALUES (12, '787878787878', '1', 'DT META', 'CAV1', 16, '200', 'DC02', '2024-04-16 11:08:00', 'Rosly Rapada', '2024-04-16 11:08:00', 'Rosly Rapada', 'LINE01', '2024-04-16 11:08:35', '2024-04-16 11:09:00', 'Rosly Rapada', 'SHOTBLAST1', '2024-04-16 11:09:10', '2024-04-16 11:09:00', 'Rosly Rapada', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-16 11:10:10', NULL, NULL, NULL, 'Rosly Rapada', 'Rosly Rapada', 'OVEN01', '2024-04-16 11:10:21', 'Rosly Rapada', 'Rosly Rapada', '2024-04-16 11:10:39', '2024-04-16 11:10:50', 'B101', 'Rosly Rapada', '2024-04-16 11:11:00', 'Rosly Rapada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Reject', '2024-04-18 10:55:00', 'Rosly Rapada', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-16 11:12:00', 'Lot Accepted', 'Accept', '2024-04-16 11:12:51', 'BUBBLEWASH01', 'Rosly Rapada', '2024-04-16 11:13:02', 'Rosly Rapada', '2024-04-16 11:13:12', 'OVEN01', 'Rosly Rapada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Sorted OK - Rosly Rapada', '2024-04-18 10:56:00', 'Rosly Rapada', 'Lot Accepted - Rosly Rapada', 'Rosly Rapada', '2024-04-22 03:20:00', NULL, NULL);
INSERT INTO `pr_history` VALUES (13, '112923111015', '1', 'DT META', '110', 16, '10', 'DC03', '2024-04-20 03:14:00', 'Rosly Rapada', '2024-04-20 03:36:00', 'Rosly Rapada', 'LINE02', '2024-04-20 15:37:00', '2024-04-20 03:44:00', 'Rosly Rapada', 'SHOTBLAST3', '2024-04-20 15:45:42', '2024-04-20 03:49:00', 'Rosly Rapada', 'TESTING', '2024-04-20 04:28:00', 'Rosly Rapada', 'Rosly Rapada', '2024-04-22 15:01:21', 'TESTING', '2024-04-20 05:11:00', 'Rosly Rapada', 'Rosly Rapada', 'Rosly Rapada', 'OVEN01', '2024-04-22 15:01:40', 'Rosly Rapada', 'Rosly Rapada', '2024-04-22 15:01:55', '2024-04-22 15:02:26', 'B101', 'Rosly Rapada', '2024-04-22 03:04:00', 'Rosly Rapada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Accept', '2024-04-22 03:04:00', 'Rosly Rapada', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-22 03:04:00', 'Lot Accepted', 'Accept', '2024-04-22 15:05:04', 'BUBBLEWASH01', 'Rosly Rapada', '2024-04-22 15:05:31', 'Rosly Rapada', '2024-04-22 15:05:43', 'OVEN01', 'Rosly Rapada', '2024-04-22 15:06:02', 'Rosly Rapada', 'LINE01', '2024-04-22 15:06:19', 'Rosly Rapada', '2024-04-22 03:06:00', 'Rosly Rapada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_history` VALUES (14, '199999999999', '1', 'DT META', 'CAV1', 16, '200', 'DC02', '2024-04-23 11:32:00', 'Rosly Rapada', '2024-04-23 04:53:00', 'Rosly Rapada', 'LINE01', '2024-04-23 16:55:47', '2024-04-24 08:04:00', 'Rosly Rapada', 'SHOTBLAST1', '2024-04-24 08:05:01', '2024-04-24 08:12:00', 'Rosly Rapada', 'faded barcod', '2024-04-24 08:21:00', 'Rosly Rapada', NULL, NULL, NULL, NULL, NULL, 'Rosly Rapada', 'Rosly Rapada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_history` VALUES (15, '121111111111', '1', 'DT META', 'CAV1', 16, '200', 'DC02', '2024-04-23 11:57:00', 'Rosly Rapada', '2024-04-23 11:58:00', 'Rosly Rapada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_history` VALUES (16, '000000000001', '1', 'DT META', 'CAV1', 16, '200', 'DC02', '2024-04-24 07:43:00', 'Rosly Rapada', '2024-04-24 07:43:00', 'Rosly Rapada', 'LINE01', '2024-04-24 07:44:52', '2024-04-24 08:11:00', 'Rosly Rapada', 'SHOTBLAST1', '2024-04-24 08:12:27', '2024-04-24 08:12:00', 'Rosly Rapada', 'test', '2024-04-24 08:19:00', 'Rosly Rapada', NULL, NULL, 'Sorted Ok', '2024-04-24 08:32:00', 'Rosly Rapada', 'Rosly Rapada', 'Rosly Rapada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_history` VALUES (17, '123456712345', '1', 'DT META', 'CAV1', 16, '200', 'DC02', '2024-04-24 08:00:00', 'Rosly Rapada', '2024-04-24 08:33:00', 'Rosly Rapada', 'LINE01', '2024-04-24 08:33:49', '2024-04-24 08:33:00', 'Rosly Rapada', 'SHOTBLAST1', '2024-04-24 08:34:09', '2024-04-24 08:36:00', 'Rosly Rapada', NULL, NULL, NULL, NULL, NULL, 'ok', '2024-04-24 08:37:00', 'Rosly Rapada', 'Rosly Rapada', 'Rosly Rapada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_history` VALUES (18, '112345643641', '1', 'DT META', '110', 16, '10', 'DC03', '2024-04-24 08:40:00', 'Rosly Rapada', '2024-04-24 08:40:00', 'Rosly Rapada', 'LINE01', '2024-04-24 08:40:41', '2024-04-24 08:40:00', 'Rosly Rapada', 'SHOTBLAST2', '2024-04-24 08:41:02', '2024-04-24 08:41:00', 'Rosly Rapada', 'rejected', '2024-04-24 08:42:00', 'Rosly Rapada', 'Rosly Rapada', '2024-04-24 08:42:04', 'done', '2024-04-24 08:43:00', 'Rosly Rapada', 'Rosly Rapada', 'Rosly Rapada', 'OVEN01', '2024-04-24 16:47:05', 'Rosly Rapada', 'Rosly Rapada', '2024-04-24 16:50:56', '2024-04-24 16:51:08', 'B101', 'Rosly Rapada', '2024-04-24 04:59:00', 'Rosly Rapada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Reject', '2024-04-25 10:12:00', 'Rosly Rapada', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-25 10:12:00', 'Lot Accepted', 'Accept', '2024-04-25 10:33:57', 'BUBBLEWASH01', 'Rosly Rapada', '2024-04-25 10:39:47', 'Rosly Rapada', '2024-04-25 10:39:56', 'OVEN01', 'Rosly Rapada', '2024-04-25 10:47:28', 'Rosly Rapada', 'LINE01', '2024-04-25 10:47:37', 'Rosly Rapada', '2024-04-25 11:05:00', 'Rosly Rapada', 'Sorted OK - Rosly Rapada', '2024-04-25 10:17:00', 'Rosly Rapada', 'Lot Accepted - Rosly Rapada', 'Rosly Rapada', '2024-04-25 10:33:00', NULL, NULL);
INSERT INTO `pr_history` VALUES (19, '123123123123', '1', 'DT META', 'CAV1', 16, '200', 'DC02', '2024-04-24 08:44:00', 'Rosly Rapada', '2024-04-24 08:44:00', 'Rosly Rapada', 'LINE01', '2024-04-24 08:45:12', '2024-04-24 08:45:00', 'Rosly Rapada', 'SHOTBLAST1', '2024-04-24 08:45:49', '2024-04-24 08:46:00', 'Rosly Rapada', 'ewewe', '2024-04-24 08:46:00', 'Rosly Rapada', 'Rosly Rapada', '2024-04-24 09:19:18', 'okay', '2024-04-24 09:14:00', 'Rosly Rapada', 'Rosly Rapada', 'Rosly Rapada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_history` VALUES (20, '123123123133', '1', 'DT META', 'CAV1', 16, '200', 'DC02', '2024-04-24 08:44:00', 'Rosly Rapada', '2024-04-24 08:44:00', 'Rosly Rapada', 'LINE01', '2024-04-24 08:45:19', '2024-04-24 08:45:00', 'Rosly Rapada', 'SHOTBLAST1', '2024-04-24 08:45:55', '2024-04-24 08:46:00', 'Rosly Rapada', 'dfgregrt', '2024-04-24 08:46:00', 'Rosly Rapada', 'Rosly Rapada', '2024-04-24 11:33:36', 'ok', '2024-04-24 09:19:00', 'Rosly Rapada', 'Rosly Rapada', 'Rosly Rapada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_history` VALUES (21, '111111111171', '1', 'DT META', 'CAV1', 16, '200', 'DC02', '2024-04-24 11:34:00', 'Rosly Rapada', '2024-04-24 11:34:00', 'Rosly Rapada', 'LINE01', '2024-04-24 13:33:00', '2024-04-24 01:33:00', 'Rosly Rapada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rosly Rapada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_history` VALUES (22, '123451234512', '1', 'DT META', 'CAV1', 16, '200', 'DC02', '2024-04-25 11:45:00', 'Rosly Rapada', '2024-04-25 11:45:00', 'Rosly Rapada', 'LINE01', '2024-04-25 11:45:33', '2024-04-25 11:45:00', 'Rosly Rapada', 'SHOTBLAST1', '2024-04-25 11:46:02', '2024-04-25 11:46:00', 'Rosly Rapada', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-25 11:46:28', NULL, NULL, NULL, 'Rosly Rapada', 'Rosly Rapada', 'OVEN01', '2024-04-25 11:46:35', 'Rosly Rapada', 'Rosly Rapada', '2024-04-26 11:24:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_history` VALUES (23, '123451234567', '1', 'DT META', '110', 16, '10', 'DC03', '2024-04-25 02:07:00', 'Rosly Rapada', '2024-04-25 02:07:00', 'Rosly Rapada', 'LINE01', '2024-04-25 14:07:50', '2024-04-26 11:23:00', 'Rosly Rapada', 'SHOTBLAST3', '2024-04-26 11:23:55', '2024-04-26 11:24:00', 'Rosly Rapada', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-26 11:24:10', NULL, NULL, NULL, 'Rosly Rapada', 'Rosly Rapada', 'OVEN01', '2024-04-26 11:24:20', 'Rosly Rapada', 'Rosly Rapada', '2024-04-26 11:24:54', '2024-04-26 11:25:02', 'B101', 'Rosly Rapada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_history` VALUES (24, '222222222222', '3', 'DT META', 'CAV1', 16, '200', 'DC03', '2024-04-26 09:38:00', 'Rosly Rapada', '2024-04-26 09:39:00', 'Rosly Rapada', 'LINE03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_history` VALUES (25, '131313131313', '1', 'DT META', 'CAV1', 16, '200', 'DC02', '2024-04-26 09:41:00', 'Rosly Rapada', '2024-04-26 09:42:00', 'Rosly Rapada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_history` VALUES (26, '123451234568', '1', 'DT META', '110', 3, '10', 'DC03', '2024-04-25 02:07:00', 'Rosly Rapada', '2024-04-25 02:07:00', 'Rosly Rapada', 'LINE01', '2024-04-25 14:07:50', '2024-04-26 11:23:00', 'Rosly Rapada', 'SHOTBLAST3', '2024-04-26 11:23:55', '2024-04-26 11:24:00', 'Rosly Rapada', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-26 11:24:10', NULL, NULL, NULL, 'Rosly Rapada', 'Rosly Rapada', 'OVEN01', '2024-04-26 11:24:20', 'Rosly Rapada', 'Rosly Rapada', '2024-04-26 11:24:54', '2024-04-26 11:25:02', 'B101', 'Rosly Rapada', NULL, NULL, NULL, NULL, '2024-04-26 11:25:00', 'Rosly Rapada', 'BIBIRI', '123451234567', '1', 'For Sort MRS', '2024-04-26 11:42:00', 'Rosly Rapada', 'Lot Accepted', '2024-04-26 11:55:00', 'Rosly Rapada', 'Sorted OK - ', '2024-04-26 11:53:00', 'Rosly Rapada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_history` VALUES (27, '123451234566', '1', 'TEST MODEL', '101', 16, '1', 'DC05', '2024-04-27 09:00:00', 'Rosly Rapada', '2024-04-27 09:01:00', 'Rosly Rapada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for pr_remarks
-- ----------------------------
DROP TABLE IF EXISTS `pr_remarks`;
CREATE TABLE `pr_remarks`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `uniques` int(10) NULL DEFAULT NULL,
  `category` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `remarks` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `input_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `input_date` timestamp(0) NULL DEFAULT NULL,
  `area_id` int(10) NULL DEFAULT NULL,
  `is_active` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 156 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pr_remarks
-- ----------------------------
INSERT INTO `pr_remarks` VALUES (1, '111111111111', 1, 'VISUAL NG', 'test', 'Rosly Rapada', '2024-03-19 02:58:00', 1, 1);
INSERT INTO `pr_remarks` VALUES (2, '111111111111', 1, 'VISUAL NG', 'sdsd', 'Rosly Rapada', '2024-03-19 02:59:00', 1, 1);
INSERT INTO `pr_remarks` VALUES (3, '111111111111', 1, 'DIMENSION NG', 'sdsd', 'Rosly Rapada', '2024-03-19 02:59:00', 2, 1);
INSERT INTO `pr_remarks` VALUES (4, '111111111111', 1, 'EVALUATION', 'sdsd', 'Rosly Rapada', '2024-03-19 03:00:00', 3, 1);
INSERT INTO `pr_remarks` VALUES (5, '111111111111', 1, 'Annealing', 'dsds', 'Rosly Rapada', '2024-03-19 15:00:50', 4, 1);
INSERT INTO `pr_remarks` VALUES (6, '111111111111', 1, 'VISUAL NG', 'asas', 'Rosly Rapada', '2024-03-19 03:01:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (7, '111111111111', 1, 'QA-Dimension', 'Lot Accepted', 'Rosly Rapada', '2024-03-19 03:02:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (8, '222222222222', 1, 'VISUAL NG', 'test', 'Rosly Rapada', '2024-03-19 03:05:00', 1, 1);
INSERT INTO `pr_remarks` VALUES (9, '222222222222', 1, 'DIMENSION NG', 'Big Diameter', 'Rosly Rapada', '2024-03-19 03:10:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (10, '333333333333', 1, 'VISUAL NG', 'test', 'Rosly Rapada', '2024-03-19 03:14:00', 1, 1);
INSERT INTO `pr_remarks` VALUES (11, '333333333333', 1, 'VISUAL NG', 'test', 'Rosly Rapada', '2024-03-19 03:33:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (12, '111111111111', 1, 'VISUAL NG', 'test ng-test ng', 'Rosly Rapada', '2024-03-20 07:39:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (13, '111111111111', 1, 'Oven', 'oven out', 'Rosly Rapada', '2024-03-20 13:41:29', 7, 1);
INSERT INTO `pr_remarks` VALUES (14, '666666666666', 1, 'QA-Dimension', 'Lot Accepted', 'Rosly Rapada', '2024-03-20 01:59:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (15, '666666666666', 1, 'Oven', 'okay na po sa oven', 'Rosly Rapada', '2024-03-21 15:56:05', 7, 1);
INSERT INTO `pr_remarks` VALUES (16, '012345678910', 1, 'EVALUATION', 'Testing', 'Rosly Rapada', '2024-04-01 09:17:00', 1, 1);
INSERT INTO `pr_remarks` VALUES (17, '012345678910', 1, 'MED SAMPLE', 'Testing', 'Rosly Rapada', '2024-04-02 09:48:00', 1, 1);
INSERT INTO `pr_remarks` VALUES (18, '111111111115', 1, 'QA-Dimension', 'Lot Accepted', 'Rosly Rapada', '2024-04-02 11:26:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (19, '111111111115', 1, 'Oven', 'sdsd', 'Rosly Rapada', '2024-04-02 11:29:28', 7, 1);
INSERT INTO `pr_remarks` VALUES (20, '111111111115', 1, 'VISUAL NG', 'test MFI', 'Rosly Rapada', '2024-04-02 02:41:00', 8, 1);
INSERT INTO `pr_remarks` VALUES (21, '111222222111', 1, 'DIMENSION NG', 'DGFF', 'Rosly Rapada', '2024-04-02 05:01:00', 1, 1);
INSERT INTO `pr_remarks` VALUES (22, '111222222111', 1, 'VISUAL NG', 'XSDASA', 'Rosly Rapada', '2024-04-02 05:02:00', 2, 1);
INSERT INTO `pr_remarks` VALUES (23, '111222222111', 1, 'QA Shotblast', 'ASASAS', 'Rosly Rapada', '2024-04-02 05:02:00', NULL, 1);
INSERT INTO `pr_remarks` VALUES (24, '012345678910', 1, 'VISUAL NG', 'docs testing', 'Rosly Rapada', '2024-04-03 09:46:00', 2, 1);
INSERT INTO `pr_remarks` VALUES (25, '012345678910', 1, 'VISUAL NG', 'docs. testing', 'Rosly Rapada', '2024-04-03 09:48:00', 3, 1);
INSERT INTO `pr_remarks` VALUES (26, '012345678910', 1, 'IPQC SAMPLE', 'IPQC SAMPLE', 'Rosly Rapada', '2024-04-03 02:03:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (27, '555555555556', 1, 'VISUAL NG', 'test', 'Rosly Rapada', '2024-04-03 03:51:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (28, '555555555555', 1, 'IPQC SAMPLE', 'IPQC SAMPLE', 'Rosly Rapada', '2024-04-03 04:40:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (29, '666666666666', 1, 'VISUAL NG', 'Hold (For Sort)-Unmachined Slot Hole', 'Rosly Rapada', '2024-04-05 10:11:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (30, '555555555556', 1, 'VISUAL NG', 'For Sort', 'Rosly Rapada', '2024-04-05 11:01:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (31, '555555555555', 1, 'VISUAL NG', 'Hold-Unmachined on Slot Hole', 'Rosly Rapada', '2024-04-05 11:03:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (32, '111111111111', 1, 'VISUAL NG', 'hold-Unmachined Slot hole', 'Rosly Rapada', '2024-04-05 11:04:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (33, '666666666666', 1, 'QA-Dimension', 'Lot Accepted', 'Rosly Rapada', '2024-04-05 11:52:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (34, '012345678910', 1, 'DIMENSION NG', 'For Scrap', 'Rosly Rapada', '2024-04-05 01:24:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (35, '555555555555', 1, 'DIMENSION NG', 'For Scrap', 'Rosly Rapada', '2024-04-05 01:56:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (36, '555555555556', 1, 'Machining MRS-Wet', 'Sorted Good', 'Rosly Rapada', '2024-04-05 03:06:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (37, '666666666666', 1, 'VISUAL NG', 'For Sort-Unmachined Slot Hole', 'Rosly Rapada', '2024-04-05 03:07:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (38, '555555555556', 1, 'Machining IPQC', 'Lot Accepted', 'Rosly Rapada', '2024-04-05 03:33:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (39, '555555555556', 1, 'QA-Dimension', 'Lot Accepted', 'Rosly Rapada', '2024-04-05 03:37:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (40, '111111111115', 1, 'VISUAL NG', 'For Sort-Unmachined On Slot Hole', 'Rosly Rapada', '2024-04-05 05:12:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (41, '555555555556', 1, 'VISUAL NG', 'For Sort (testing)-Unmachined Slot Hole', 'Rosly Rapada', '2024-04-08 07:44:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (42, '222222222222', 2, 'EVALUATION', 'Testing', 'Rosly Rapada', '2024-04-08 01:41:00', 1, 1);
INSERT INTO `pr_remarks` VALUES (43, '222222222222', 1, 'EVALUATION', 'Testing', 'Rosly Rapada', '2024-04-08 01:41:00', 1, 1);
INSERT INTO `pr_remarks` VALUES (44, '222222222222', 1, 'EVALUATION', 'Testing', 'Rosly Rapada', '2024-04-08 01:43:00', 2, 1);
INSERT INTO `pr_remarks` VALUES (45, '222222222222', 1, 'EVALUATION', 'Testing', 'Rosly Rapada', '2024-04-08 01:44:00', 3, 1);
INSERT INTO `pr_remarks` VALUES (46, '111222222111', 1, 'Shotblast MRS', 'n/a', 'Rosly Rapada', '2024-04-08 01:47:00', NULL, 1);
INSERT INTO `pr_remarks` VALUES (47, '222222222222', 2, 'EVALUATION', 'TESTING', 'Rosly Rapada', '2024-04-08 01:49:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (48, '222222222222', 2, 'QA-Dimension', 'Lot Accepted', 'Rosly Rapada', '2024-04-08 01:50:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (49, '666666666666', 1, 'Shotblast QA', 'Lot Accepted', 'Rosly Rapada', '2024-04-08 14:29:13', NULL, 1);
INSERT INTO `pr_remarks` VALUES (50, '222222222222', 1, 'Shotblast QA', 'Lot Accepted', 'Rosly Rapada', '2024-04-08 14:29:33', NULL, 1);
INSERT INTO `pr_remarks` VALUES (51, '333333333333', 1, 'Shotblast QA', 'Lot Accepted', 'Rosly Rapada', '2024-04-08 14:29:38', NULL, 1);
INSERT INTO `pr_remarks` VALUES (52, '111111111111', 2, 'Shotblast QA', 'Lot Accepted', 'Rosly Rapada', '2024-04-08 15:50:14', 5, 1);
INSERT INTO `pr_remarks` VALUES (53, '111111111115', 1, 'Shotblast QA', 'Lot Accepted', 'Rosly Rapada', '2024-04-08 15:50:18', NULL, 1);
INSERT INTO `pr_remarks` VALUES (54, '012345678910', 1, 'Shotblast QA', 'Lot Accepted', 'Rosly Rapada', '2024-04-08 15:50:22', NULL, 1);
INSERT INTO `pr_remarks` VALUES (55, '777777777777', 1, 'EVALUATION', 'Testing', 'Rosly Rapada', '2024-04-08 03:54:00', 2, 1);
INSERT INTO `pr_remarks` VALUES (56, '777777777777', 1, 'EVALUATION', 'Testing', 'Rosly Rapada', '2024-04-08 03:54:00', 3, 1);
INSERT INTO `pr_remarks` VALUES (57, '777777777777', 1, 'EVALUATION', 'Testing', 'Rosly Rapada', '2024-04-08 03:57:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (58, '777777777777', 1, 'QA-Dimension', 'Lot Accepted', 'Rosly Rapada', '2024-04-08 03:58:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (59, '777777777777', 1, 'Bubblewash', 'Testing', 'Rosly Rapada', '2024-04-08 15:59:12', 5, 1);
INSERT INTO `pr_remarks` VALUES (60, '777777777777', 1, 'Oven', 'Testing', 'Rosly Rapada', '2024-04-08 16:00:17', 7, 1);
INSERT INTO `pr_remarks` VALUES (61, '222222222222', 2, 'EVALUATION', 'Testing', 'Rosly Rapada', '2024-04-08 04:59:00', 8, 1);
INSERT INTO `pr_remarks` VALUES (62, '777777777777', 1, 'EVALUATION', 'Testing', 'Rosly Rapada', '2024-04-08 05:05:00', 8, 1);
INSERT INTO `pr_remarks` VALUES (63, '000000000000', 1, 'EVALUATION', 'Testing', 'Rosly Rapada', '2024-04-11 09:14:00', 1, 1);
INSERT INTO `pr_remarks` VALUES (64, '000000000000', 1, 'EVALUATION', 'Testing', 'Rosly Rapada', '2024-04-11 09:19:00', 1, 1);
INSERT INTO `pr_remarks` VALUES (65, '000000000000', 1, 'EVALUATION', 'Testing', 'Rosly Rapada', '2024-04-11 09:20:00', 2, 1);
INSERT INTO `pr_remarks` VALUES (66, '000000000000', 1, 'EVALUATION', 'Testing', 'Rosly Rapada', '2024-04-11 09:43:00', 3, 1);
INSERT INTO `pr_remarks` VALUES (67, '000000000000', 1, 'Annealing', 'Test', 'Rosly Rapada', '2024-04-12 17:01:27', 4, 1);
INSERT INTO `pr_remarks` VALUES (68, '000000000000', 2, 'EVALUATION', 'test', 'Rosly Rapada', '2024-04-15 03:55:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (69, '000000000000', 1, 'QA-Dimension', 'Lot Accepted', 'Rosly Rapada', '2024-04-15 03:56:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (70, '121523111029', 1, 'EVALUATION', 'TESTING', 'Rosly Rapada', '2024-04-15 04:26:00', 1, 1);
INSERT INTO `pr_remarks` VALUES (71, '121523111029', 1, 'MED SAMPLE', 'TESTING', 'Rosly Rapada', '2024-04-15 04:33:00', 1, 1);
INSERT INTO `pr_remarks` VALUES (72, '333333333334', 1, 'EVALUATION', 'Test', 'Rosly Rapada', '2024-04-15 04:45:00', 1, 1);
INSERT INTO `pr_remarks` VALUES (73, '333333333334', 1, 'EVALUATION', 'Test', 'Rosly Rapada', '2024-04-15 04:45:00', 1, 1);
INSERT INTO `pr_remarks` VALUES (74, '666666666666', 1, 'VISUAL NG', 'test', 'Rosly Rapada', '2024-04-16 08:53:00', 11, 1);
INSERT INTO `pr_remarks` VALUES (75, '555555555556', 1, 'Machining MRS-DRY', 'Sorted Good', 'Rosly Rapada', '2024-04-16 10:57:00', 11, 1);
INSERT INTO `pr_remarks` VALUES (76, '111111111115', 1, 'Machining MRS-DRY', 'Sorted Good', 'Rosly Rapada', '2024-04-16 10:58:00', 11, 1);
INSERT INTO `pr_remarks` VALUES (77, '787878787878', 1, 'QA-Dimension', 'Lot Accepted', 'Rosly Rapada', '2024-04-16 11:12:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (78, '787878787878', 1, 'VISUAL NG', 'test-test', 'Rosly Rapada', '2024-04-16 11:12:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (79, '121523111029', 1, 'EVALUATION', 'TESTING', 'Rosly Rapada', '2024-04-16 11:26:00', 2, 1);
INSERT INTO `pr_remarks` VALUES (80, '787878787878', 1, 'Machining MRS-DRY', 'Sorted Good', 'Rosly Rapada', '2024-04-16 11:52:00', 11, 1);
INSERT INTO `pr_remarks` VALUES (81, '787878787878', 1, 'Machining MRS-DRY', 'Sorted Good', 'Rosly Rapada', '2024-04-16 11:54:00', 11, 1);
INSERT INTO `pr_remarks` VALUES (82, '787878787878', 1, 'Machining MRS-DRY Confirmation', 'Lot Accepted', 'Rosly Rapada', '2024-04-16 04:53:00', 11, 1);
INSERT INTO `pr_remarks` VALUES (83, '555555555556', 1, 'VISUAL NG', 'tetst', 'Rosly Rapada', '2024-04-16 04:55:00', 11, 1);
INSERT INTO `pr_remarks` VALUES (84, '111111111115', 1, 'NPI', 'test', 'Rosly Rapada', '2024-04-16 05:01:00', 11, 1);
INSERT INTO `pr_remarks` VALUES (85, '787878787878', 1, 'VISUAL NG', 'For Sort-Unmachined on Slot  Hole', 'Rosly Rapada', '2024-04-18 10:55:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (86, '787878787878', 1, 'Machining MRS-DRY', 'Sorted Good', 'Rosly Rapada', '2024-04-18 10:56:00', 11, 1);
INSERT INTO `pr_remarks` VALUES (87, '121523111029', 1, 'EVALUATION', 'TESTING', 'Rosly Rapada', '2024-04-20 10:00:00', 3, 1);
INSERT INTO `pr_remarks` VALUES (88, '121523111029', 1, 'Annealing', 'testing', 'Rosly Rapada', '2024-04-20 14:37:07', 4, 1);
INSERT INTO `pr_remarks` VALUES (89, '112923111015', 1, 'QA Shotblast', 'TESTING', 'Rosly Rapada', '2024-04-20 04:28:00', NULL, 1);
INSERT INTO `pr_remarks` VALUES (90, '112923111015', 1, 'Shotblast MRS', 'TESTING', 'Rosly Rapada', '2024-04-20 05:11:00', NULL, 1);
INSERT INTO `pr_remarks` VALUES (91, '121523111029', 1, 'DIMENSION NG', 'Testing', 'Rosly Rapada', '2024-04-22 10:46:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (92, '121523111029', 1, 'QA-Dimension', 'Lot Accepted', 'Rosly Rapada', '2024-04-22 10:47:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (93, '121523111029', 1, 'Bubblewash', 'Testing', 'Rosly Rapada', '2024-04-22 10:49:27', 5, 1);
INSERT INTO `pr_remarks` VALUES (94, '121523111029', 1, 'Oven', 'Testing', 'Rosly Rapada', '2024-04-22 10:51:38', 7, 1);
INSERT INTO `pr_remarks` VALUES (95, '121523111029', 1, 'EVALUATION', 'Testing', 'Rosly Rapada', '2024-04-22 11:32:00', 8, 1);
INSERT INTO `pr_remarks` VALUES (96, '112923111015', 1, 'Shotblast QA', 'Lot Accepted', 'Rosly Rapada', '2024-04-22 15:01:21', NULL, 1);
INSERT INTO `pr_remarks` VALUES (97, '112923111015', 1, 'Annealing', 'Testing', 'Rosly Rapada', '2024-04-22 15:01:55', 4, 1);
INSERT INTO `pr_remarks` VALUES (98, '112923111015', 1, 'EVALUATION', 'Testing', 'Rosly Rapada', '2024-04-22 03:04:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (99, '112923111015', 1, 'QA-Dimension', 'Lot Accepted', 'Rosly Rapada', '2024-04-22 03:04:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (100, '112923111015', 1, 'Bubblewash', 'Testing', 'Rosly Rapada', '2024-04-22 15:05:31', 5, 1);
INSERT INTO `pr_remarks` VALUES (101, '112923111015', 1, 'Oven', 'Testing', 'Rosly Rapada', '2024-04-22 15:06:02', 7, 1);
INSERT INTO `pr_remarks` VALUES (102, '112923111015', 1, 'EVALUATION', 'Testing', 'Rosly Rapada', '2024-04-22 03:06:00', 8, 1);
INSERT INTO `pr_remarks` VALUES (103, '787878787878', 1, 'Machining MRS-DRY Confirmation', 'Lot Accepted', 'Rosly Rapada', '2024-04-22 03:20:00', 11, 1);
INSERT INTO `pr_remarks` VALUES (104, '199999999999', 1, 'VISUAL NG', 'die crack', 'Rosly Rapada', '2024-04-23 11:32:00', 1, 1);
INSERT INTO `pr_remarks` VALUES (105, '121111111111', 1, 'OGI SAMPLE', 'test', 'Rosly Rapada', '2024-04-23 11:57:00', 1, 1);
INSERT INTO `pr_remarks` VALUES (106, '199999999999', 1, 'VISUAL NG', 'die crack1', 'Rosly Rapada', '2024-04-23 11:32:00', 1, 1);
INSERT INTO `pr_remarks` VALUES (107, '000000000001', 1, 'VISUAL NG', 'broken die', 'Rosly Rapada', '2024-04-24 07:43:00', 1, 1);
INSERT INTO `pr_remarks` VALUES (108, '000000000001', 1, 'VISUAL NG', 'Flushes', 'Rosly Rapada', '2024-04-24 07:43:00', 1, 1);
INSERT INTO `pr_remarks` VALUES (109, '123456712345', 1, 'NPI', 'NPI Samples', 'Rosly Rapada', '2024-04-24 08:00:00', 1, 1);
INSERT INTO `pr_remarks` VALUES (110, '199999999999', 1, 'EVALUATION', 'Deburring Eval', 'Rosly Rapada', '2024-04-24 08:04:00', 2, 1);
INSERT INTO `pr_remarks` VALUES (111, '000000000001', 1, 'EVALUATION', 'deb eval', 'Rosly Rapada', '2024-04-24 08:11:00', 2, 1);
INSERT INTO `pr_remarks` VALUES (112, '000000000001', 1, 'NPI', 'test', 'Rosly Rapada', '2024-04-24 08:12:00', 3, 1);
INSERT INTO `pr_remarks` VALUES (113, '199999999999', 1, 'NPI', 'test', 'Rosly Rapada', '2024-04-24 08:12:00', 3, 1);
INSERT INTO `pr_remarks` VALUES (114, '000000000001', 1, 'QA Shotblast', 'test', 'Rosly Rapada', '2024-04-24 08:19:00', 3, 1);
INSERT INTO `pr_remarks` VALUES (115, '199999999999', 1, 'QA Shotblast', 'faded barcode', 'Rosly Rapada', '2024-04-24 08:21:00', 3, 1);
INSERT INTO `pr_remarks` VALUES (116, '000000000001', 1, 'Shotblast MRS', 'Sorted Ok', 'Rosly Rapada', '2024-04-24 08:32:00', NULL, 1);
INSERT INTO `pr_remarks` VALUES (117, '123456712345', 1, 'IPQC SAMPLE', 'test', 'Rosly Rapada', '2024-04-24 08:33:00', 1, 1);
INSERT INTO `pr_remarks` VALUES (118, '123456712345', 1, 'IPQC SAMPLE', 'sdfsdsd', 'Rosly Rapada', '2024-04-24 08:33:00', 2, 1);
INSERT INTO `pr_remarks` VALUES (119, '123456712345', 1, 'VISUAL NG', 'ok', 'Rosly Rapada', '2024-04-24 08:36:00', 3, 1);
INSERT INTO `pr_remarks` VALUES (120, '123456712345', 1, 'QA Shotblast', 'test rejected', 'Rosly Rapada', '2024-04-24 08:36:00', 3, 1);
INSERT INTO `pr_remarks` VALUES (121, '123456712345', 1, 'Shotblast MRS', 'ok', 'Rosly Rapada', '2024-04-24 08:37:00', NULL, 1);
INSERT INTO `pr_remarks` VALUES (122, '112345643641', 1, 'QA Shotblast', 'rejected', 'Rosly Rapada', '2024-04-24 08:42:00', 3, 1);
INSERT INTO `pr_remarks` VALUES (123, '112345643641', 1, 'Shotblast MRS', 'done', 'Rosly Rapada', '2024-04-24 08:43:00', NULL, 1);
INSERT INTO `pr_remarks` VALUES (124, '123123123133', 1, 'MED SAMPLE', 'test', 'Rosly Rapada', '2024-04-24 08:44:00', 1, 1);
INSERT INTO `pr_remarks` VALUES (125, '123123123123', 1, 'VISUAL NG', 'test', 'Rosly Rapada', '2024-04-24 08:45:00', 2, 1);
INSERT INTO `pr_remarks` VALUES (126, '123123123133', 1, 'VISUAL NG', 'test', 'Rosly Rapada', '2024-04-24 08:45:00', 2, 1);
INSERT INTO `pr_remarks` VALUES (127, '123123123123', 1, 'QA Shotblast', 'ewewe', 'Rosly Rapada', '2024-04-24 08:46:00', 3, 1);
INSERT INTO `pr_remarks` VALUES (128, '123123123133', 1, 'QA Shotblast', 'dfgregrt', 'Rosly Rapada', '2024-04-24 08:46:00', 3, 1);
INSERT INTO `pr_remarks` VALUES (129, '123123123123', 1, 'Shotblast MRS', 'awqw', 'Rosly Rapada', '2024-04-24 08:46:00', NULL, 1);
INSERT INTO `pr_remarks` VALUES (130, '123123123133', 1, 'Shotblast MRS', 'test', 'Rosly Rapada', '2024-04-24 08:52:00', NULL, 1);
INSERT INTO `pr_remarks` VALUES (131, '123123123133', 1, 'Shotblast MRS', 'scrap', 'Rosly Rapada', '2024-04-24 08:53:00', NULL, 1);
INSERT INTO `pr_remarks` VALUES (132, '123123123123', 1, 'Shotblast MRS', 'okay', 'Rosly Rapada', '2024-04-24 09:14:00', NULL, 1);
INSERT INTO `pr_remarks` VALUES (133, '123123123133', 1, 'Shotblast MRS', 'ok', 'Rosly Rapada', '2024-04-24 09:19:00', NULL, 1);
INSERT INTO `pr_remarks` VALUES (134, '123123123123', 1, 'Shotblast QA', 'Lot Accepted', 'Rosly Rapada', '2024-04-24 09:19:18', NULL, 1);
INSERT INTO `pr_remarks` VALUES (135, '123123123133', 1, 'Shotblast QA', 'Lot Accepted', 'Rosly Rapada', '2024-04-24 11:33:36', NULL, 1);
INSERT INTO `pr_remarks` VALUES (136, '111111111171', 1, 'VISUAL NG', 'test', 'Rosly Rapada', '2024-04-24 11:34:00', 1, 1);
INSERT INTO `pr_remarks` VALUES (137, '111111111171', 1, 'EVALUATION', 'test', 'Rosly Rapada', '2024-04-24 11:34:00', 1, 1);
INSERT INTO `pr_remarks` VALUES (138, '112345643641', 1, 'Annealing', 'ok', 'Rosly Rapada', '2024-04-24 16:50:56', 4, 1);
INSERT INTO `pr_remarks` VALUES (139, '112345643641', 1, 'EVALUATION', 'test only', 'Rosly Rapada', '2024-04-24 04:59:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (140, '112345643641', 1, 'QA-Dimension', 'Lot Accepted', 'Rosly Rapada', '2024-04-25 10:12:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (141, '112345643641', 1, 'VISUAL NG', 'bibiri-please hold', 'Rosly Rapada', '2024-04-25 10:12:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (142, '112345643641', 1, 'Machining MRS-DRY', 'Sorted Good', 'Rosly Rapada', '2024-04-25 10:17:00', 11, 1);
INSERT INTO `pr_remarks` VALUES (143, '112345643641', 1, 'Machining MRS-DRY Confirmation', 'Lot Accepted', 'Rosly Rapada', '2024-04-25 10:33:00', 11, 1);
INSERT INTO `pr_remarks` VALUES (144, '112345643641', 1, 'Bubblewash', 'ok', 'Rosly Rapada', '2024-04-25 10:39:47', 6, 1);
INSERT INTO `pr_remarks` VALUES (145, '112345643641', 1, 'Oven', 'okay', 'Rosly Rapada', '2024-04-25 10:47:28', 7, 1);
INSERT INTO `pr_remarks` VALUES (146, '112345643641', 1, 'NPI', 'ok', 'Rosly Rapada', '2024-04-25 11:05:00', 8, 1);
INSERT INTO `pr_remarks` VALUES (147, '222222222222', 3, 'VISUAL NG', 'test', 'Rosly Rapada', '2024-04-26 09:38:00', 1, 1);
INSERT INTO `pr_remarks` VALUES (148, '222222222222', 1, 'VISUAL NG', 'okay', 'Rosly Rapada', '2024-04-26 09:39:00', 1, 1);
INSERT INTO `pr_remarks` VALUES (149, '131313131313', 1, 'EVALUATION', 'test', 'Rosly Rapada', '2024-04-26 09:41:00', 1, 1);
INSERT INTO `pr_remarks` VALUES (150, '131313131313', 1, 'MED SAMPLE', 'test med', 'Rosly Rapada', '2024-04-26 09:42:00', 1, 1);
INSERT INTO `pr_remarks` VALUES (151, '123451234568', 1, 'VISUAL NG', 'test', 'Rosly Rapada', '2024-04-26 11:25:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (152, '123451234568', 1, 'VISUAL NG', 'BIBIRI', 'Rosly Rapada', '2024-04-26 11:42:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (153, '123451234568', 1, 'Machining MRS-Wet', 'Sorted Good', 'Rosly Rapada', '2024-04-26 11:53:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (154, '123451234568', 1, 'Machining IPQC', 'Lot Accepted', 'Rosly Rapada', '2024-04-26 11:55:00', 5, 1);
INSERT INTO `pr_remarks` VALUES (155, '123451234566', 1, 'VISUAL NG', 'ok', 'Rosly Rapada', '2024-04-27 09:00:00', 1, 1);

-- ----------------------------
-- Table structure for pr_result
-- ----------------------------
DROP TABLE IF EXISTS `pr_result`;
CREATE TABLE `pr_result`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial1` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `unique1` int(10) NULL DEFAULT NULL,
  `serial2` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `unique2` int(10) NULL DEFAULT NULL,
  `area_id` int(10) NULL DEFAULT NULL,
  `line` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `model` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cavity` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mold_no` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ingot_lot` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tray_size` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tray_no` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `debplan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `castplan` int(10) NULL DEFAULT NULL,
  `moldshots` int(10) NULL DEFAULT NULL,
  `quantity` int(10) NULL DEFAULT NULL,
  `quantity_lost` int(10) NULL DEFAULT NULL,
  `area_status` tinyint(1) NULL DEFAULT NULL,
  `lot_status` tinyint(1) NULL DEFAULT NULL,
  `input_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `input_date` timestamp(0) NULL DEFAULT NULL,
  `output_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `output_date` timestamp(0) NULL DEFAULT NULL,
  `disposition` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `locked` tinyint(1) NULL DEFAULT NULL,
  `locked_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `locked_date` timestamp(0) NULL DEFAULT NULL,
  `locked_details` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `locked_remarks` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `unlocked_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `unlocked_date` timestamp(0) NULL DEFAULT NULL,
  `unlocked_remarks` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `sample_category` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sample_quantity` int(10) NULL DEFAULT NULL,
  `sample_tray` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sample_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sample_date` timestamp(0) NULL DEFAULT NULL,
  `qan_number` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `date_sorted` datetime(0) NULL DEFAULT NULL,
  `sorted_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sort_remarks` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `disposition_ipqc` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `serial_lotsplit` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `unique_lotsplit` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `split_lot_details` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mrswet_remarks` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sequence` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mrsdry_remarks` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mrsdry_qa_remarks` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mrsdry_qa_date` datetime(0) NULL DEFAULT NULL,
  `mfi_serial` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mfi_ogi_remarks` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mfi_sorting_remarks` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `qr_code` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 164 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pr_result
-- ----------------------------
INSERT INTO `pr_result` VALUES (1, '111111111111', 1, NULL, NULL, 1, 'DC01', 'DT META', 'L101', '100', '10001', '16', 'na', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-03-19 02:58:00', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-26 07:42:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (2, '111111111111', 1, NULL, NULL, 2, 'LINE02', 'DT META', 'L101', '100', '10001', '16', 'na', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-03-19 14:59:39', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (3, '111111111111', 1, NULL, NULL, 3, 'SHOTBLAST1', 'DT META', 'L101', '100', '10001', '16', 'na', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 16, 0, 0, 'Rosly Rapada', '2024-03-19 15:00:03', 'Rosly Rapada', '2024-04-20 09:24:00', 'Scrap', 0, NULL, NULL, NULL, NULL, 'Rosly Rapada', '2024-04-08 15:50:14', 'Lot Accepted', '2024-04-24 08:53:01', NULL, NULL, NULL, 'Rosly Rapada', '2024-03-19 15:00:28', NULL, '2024-04-24 08:53:00', 'Rosly Rapada', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (4, '111111111111', 1, NULL, NULL, 4, 'OVEN01', 'DT META', 'L101', '100', '10001', '16', 'na', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-03-19 15:00:39', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (5, '111111111111', 1, '111111111112', 1, 5, 'B102', 'DT META', 'L101', '100', '10001', '16', 'na', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-03-19 15:01:05', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-05 11:04:00', NULL, NULL, NULL, NULL, 'OK', NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (6, '111111111111', 1, '111111111112', 1, 6, 'BUBBLEWASH02', 'DT META', 'L101', '100', '10001', '16', 'na', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 13, 0, 0, 0, 'Rosly Rapada', '2024-03-20 07:59:55', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-26 08:03:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (7, '222222222222', 1, NULL, NULL, 1, 'DC01', 'DT META', 'L101', '100', '10001', '16', '222', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-03-19 03:05:00', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (8, '222222222222', 1, NULL, NULL, 2, 'LINE01', 'DT META', 'L101', '100', '10001', '16', '222', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-03-19 15:06:25', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (9, '222222222222', 1, NULL, NULL, 3, 'SHOTBLAST3', 'DT META', 'L101', '100', '10001', '16', '222', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 16, 0, 0, 'Rosly Rapada', '2024-03-19 15:06:39', 'Rosly Rapada', '2024-04-20 09:24:00', 'Scrap', 0, NULL, NULL, NULL, NULL, 'Rosly Rapada', '2024-04-08 14:29:33', 'Lot Accepted', '2024-04-24 08:53:01', NULL, NULL, NULL, 'Rosly Rapada', '2024-03-19 15:06:47', NULL, '2024-04-24 08:53:00', 'Rosly Rapada', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (10, '222222222222', 1, NULL, NULL, 4, 'OVEN01', 'DT META', 'L101', '100', '10001', '16', '222', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-03-19 15:06:57', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (11, '222222222222', 1, '222222222223', 1, 5, 'B101', 'DT META', 'L101', '100', '10001', '16', '222', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-03-19 15:07:13', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, 'Rosly Rapada', '2024-03-19 03:10:00', NULL, NULL, NULL, NULL, 'Scrap', NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (12, '333333333333', 1, NULL, NULL, 1, 'DC01', 'DT META', 'L101', '100', '10001', '16', '333333', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-03-19 03:14:00', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (13, '333333333333', 1, NULL, NULL, 2, 'LINE02', 'DT META', 'L101', '100', '10001', '16', '333333', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-03-19 15:14:42', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (14, '333333333333', 1, NULL, NULL, 3, 'SHOTBLAST2', 'DT META', 'L101', '100', '10001', '16', '333333', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 16, 0, 0, 'Rosly Rapada', '2024-03-19 15:14:59', 'Rosly Rapada', '2024-04-20 09:24:00', 'Scrap', 0, NULL, NULL, NULL, NULL, 'Rosly Rapada', '2024-04-08 14:29:38', 'Lot Accepted', '2024-04-24 08:53:01', NULL, NULL, NULL, 'Rosly Rapada', '2024-03-19 15:15:24', NULL, '2024-04-24 08:53:00', 'Rosly Rapada', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (15, '333333333333', 1, NULL, NULL, 4, 'OVEN01', 'DT META', 'L101', '100', '10001', '16', '333333', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-03-19 15:15:33', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (16, '333333333333', 1, '333333333332', 1, 5, 'B101', 'DT META', 'L101', '100', '10001', '16', '333333', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-03-19 15:15:54', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, 'Rosly Rapada', '2024-03-19 03:33:00', NULL, NULL, NULL, NULL, 'Scrap', NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (18, '111111111111', 1, '111111111112', 1, 7, 'OVEN03', 'DT META', 'L101', '100', '10001', '16', 'na', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 13, 0, 0, 0, 'Rosly Rapada', '2024-03-20 09:57:51', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (19, '111111111111', 1, '111111111112', 1, 8, 'LINE01', 'DT META', 'L101', '100', '10001', '16', 'na', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 13, 0, 0, 0, 'Rosly Rapada', '2024-04-02 11:10:44', 'Rosly Rapada', '2024-04-20 09:24:00', 'For Lot Combine', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 13:39:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (20, '666666666666', 1, NULL, NULL, 1, 'DC01', 'DT META', 'L101', '100', '10001', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-03-20 01:57:00', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', 1, 'Rosly Rapada', '2024-04-17 08:45:23', 'dxfxdf', 'xdfd', 'Rosly Rapada', '2024-04-08 14:26:30', 'Accept', '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, 'dfd', '2024-04-08 01:47:00', 'Rosly Rapada', 'n/a', NULL, NULL, ' ', NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (21, '666666666666', 1, NULL, NULL, 2, 'LINE01', 'DT META', 'L101', '100', '10001', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-03-20 13:57:38', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (22, '666666666666', 1, NULL, NULL, 3, 'SHOTBLAST1', 'DT META', 'L101', '100', '10001', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 16, 0, 0, 'Rosly Rapada', '2024-03-20 13:57:53', 'Rosly Rapada', '2024-04-20 09:24:00', 'Scrap', 0, NULL, NULL, NULL, NULL, 'Rosly Rapada', '2024-04-08 14:29:13', 'Lot Accepted', '2024-04-24 08:53:01', NULL, NULL, NULL, 'Rosly Rapada', '2024-03-20 13:58:02', NULL, '2024-04-24 08:53:00', 'Rosly Rapada', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (23, '666666666666', 1, NULL, NULL, 4, 'OVEN01', 'DT META', 'L101', '100', '10001', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-03-20 13:58:12', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (24, '666666666666', 1, '666666666667', 1, 5, 'B101', 'DT META', 'L101', '100', '10001', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-03-20 13:58:36', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-05 03:07:00', NULL, NULL, NULL, NULL, 'OK', NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (26, '666666666666', 1, '666666666667', 1, 7, 'OVEN01', 'DT META', 'L101', '100', '10001', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-03-20 14:00:02', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (27, '777777777777', 1, NULL, NULL, 1, 'DC01', 'DT META', 'L101', '100', '10001', '16', '77', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-03-20 05:10:00', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', 0, 'Rosly Rapada', '2024-03-20 17:11:12', 'czxz', 'zx', 'Rosly Rapada', '2024-03-20 17:14:43', 'fdfrfe', '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, 'xc', '2024-03-20 05:11:00', 'Rosly Rapada', 'sdas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (28, '777777777777', 1, NULL, NULL, 2, 'LINE01', 'DT META', 'L101', '100', '10001', '16', '77', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-08 15:53:55', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (29, '999999999999', 1, NULL, NULL, 1, 'DC02', 'DT META', 'CAV1', '200', '100', '16', '99', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-03-21 03:40:00', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (30, '999999999999', 1, NULL, NULL, 2, NULL, 'DT META', 'CAV1', '200', '100', '16', '99', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, NULL, NULL, 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (31, '666666666666', 1, '766666668667', 1, 5, 'B102', 'DT META', 'L101', '100', '10001', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-03 15:38:31', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-16 08:53:00', NULL, NULL, NULL, NULL, 'Scrap', NULL, NULL, NULL, NULL, 'A12', NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (32, '012345678910', 1, NULL, NULL, 1, 'DC01', 'DT META', 'L101', '100', '10001', '16', '123', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 1, 0, 0, 'Rosly Rapada', '2024-04-01 09:17:00', 'Rosly Rapada', '2024-04-02 09:48:00', 'OK', 0, 'Rosly Rapada', '2024-04-17 13:24:55', 'SAMPLE', 'TESTING', 'Rosly Rapada', '2024-04-19 15:45:58', 'TESTING', '2024-04-19 15:45:58', NULL, NULL, NULL, NULL, NULL, '14344', '2024-04-19 11:37:00', 'Rosly Rapada', 'Sample', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MFISERIAL202404191037232618', NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (33, '012345678910', 1, NULL, NULL, 2, 'LINE01', 'DT META', 'L101', '100', '10001', '16', '123', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 15, 0, 0, 0, 'Rosly Rapada', '2024-04-03 09:44:54', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (34, '111111111115', 1, NULL, NULL, 1, 'DC03', 'DT META', '110', '10', '10010101', '16', 'na', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-02 11:12:00', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', 0, 'Rosly Rapada', '2024-04-02 11:25:44', 'test', 'test', 'Rosly Rapada', '2024-04-02 11:29:14', 'ok', '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, 'test', '2024-04-02 11:28:00', 'Rosly Rapada', 'okay', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (35, '111111111115', 1, NULL, NULL, 2, 'LINE02', 'DT META', '110', '10', '10010101', '16', 'na', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-02 11:12:22', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (36, '111111111115', 1, NULL, NULL, 3, 'SHOTBLAST1', 'DT META', '110', '10', '10010101', '16', 'na', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 16, 0, 0, 'Rosly Rapada', '2024-04-02 11:12:52', 'Rosly Rapada', '2024-04-20 09:24:00', 'Scrap', 0, NULL, NULL, NULL, NULL, 'Rosly Rapada', '2024-04-08 15:50:18', 'Lot Accepted', '2024-04-24 08:53:01', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-02 11:24:17', NULL, '2024-04-24 08:53:00', 'Rosly Rapada', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (37, '111111111115', 1, NULL, NULL, 4, 'OVEN01', 'DT META', '110', '10', '10010101', '16', 'na', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-02 11:24:29', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (38, '111111111115', 1, '111111111116', 1, 5, 'B101', 'DT META', '110', '10', '10010101', '16', 'na', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-02 11:26:07', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-16 05:01:00', NULL, NULL, NULL, NULL, 'Scrap', NULL, NULL, NULL, NULL, NULL, 'Sorted OK - Rosly Rapada', 'Rejected  By: Rosly Rapada - rest', '2024-04-16 05:01:00', 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (39, '111111111115', 1, '111111111116', 1, 6, 'BUBBLEWASH01', 'DT META', '110', '10', '10010101', '16', 'na', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-02 11:26:57', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (40, '111111111115', 1, '111111111116', 1, 7, 'OVEN01', 'DT META', '110', '10', '10010101', '16', 'na', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-02 11:27:18', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (41, '111111111115', 1, '111111111116', 1, 8, 'LINE01', 'DT META', '110', '10', '10010101', '16', 'na', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-02 11:45:57', 'Rosly Rapada', '2024-04-20 09:24:00', 'For Lot Combine', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 13:39:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (42, '111111111115', 1, NULL, NULL, 20, NULL, 'DT META', '110', '10', '10010101', '16', 'na', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 15, 0, 0, 0, NULL, NULL, 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-16 05:01:00', NULL, NULL, NULL, NULL, 'Scrap', NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', '2024-04-16 05:01:00', 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (44, '111111111111', 2, '111111111112', 1, 20, 'LINE01', 'DT META', 'L101', '100', '10001', '16', 'na', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 13, 0, 1, 1, NULL, NULL, 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-26 08:03:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (45, '111222222111', 1, NULL, NULL, 1, 'DC03', 'DT META', '110', '10', '10010101', '16', 'ASAS1111', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-02 05:01:00', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (46, '111222222111', 1, NULL, NULL, 2, 'LINE01', 'DT META', '110', '10', '10010101', '16', 'ASAS1111', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-02 17:02:05', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (47, '111222222111', 1, NULL, NULL, 3, 'SHOTBLAST2', 'DT META', '110', '10', '10010101', '16', 'ASAS1111', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 16, 0, 0, 'Rosly Rapada', '2024-04-02 17:02:32', 'Rosly Rapada', '2024-04-20 09:24:00', 'Scrap', 0, 'Rosly Rapada', '2024-04-02 05:02:00', 'ASASAS', 'QA Shotblast', 'Rosly Rapada', '2024-04-08 14:28:47', 'Testing', '2024-04-24 08:53:01', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 08:53:00', 'Rosly Rapada', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (48, '111222222111', 1, NULL, NULL, 4, NULL, 'DT META', '110', '10', '10010101', '16', 'ASAS1111', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 0, 0, 0, NULL, NULL, 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-08 01:47:00', 'Rosly Rapada', 'n/a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (49, '012345678910', 1, NULL, NULL, 3, 'SHOTBLAST2', 'DT META', 'L101', '100', '10001', '16', '123', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 15, 16, 0, 0, 'Rosly Rapada', '2024-04-03 09:47:34', 'Rosly Rapada', '2024-04-20 09:24:00', 'Scrap', 0, NULL, NULL, NULL, NULL, 'Rosly Rapada', '2024-04-08 15:50:22', 'Lot Accepted', '2024-04-24 08:53:01', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-03 09:49:31', NULL, '2024-04-24 08:53:00', 'Rosly Rapada', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (50, '012345678910', 1, NULL, NULL, 4, 'OVEN01', 'DT META', 'L101', '100', '10001', '16', '123', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 15, 0, 0, 0, 'Rosly Rapada', '2024-04-03 09:49:57', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (51, '012345678910', 1, '012345678911', 1, 5, 'B101', 'DT META', 'L101', '100', '10001', '16', '123', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 15, 0, 0, 0, 'Rosly Rapada', '2024-04-03 10:07:08', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-05 01:24:00', NULL, NULL, NULL, NULL, 'Scrap', NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (52, '555555555555', 1, NULL, NULL, 1, 'DC03', 'DT META', '110', '10', '10010101', '16', '11', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-03 11:40:00', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (53, '555555555555', 1, NULL, NULL, 2, 'LINE01', 'DT META', '110', '10', '10010101', '16', '11', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-03 11:40:59', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (54, '555555555555', 1, NULL, NULL, 3, 'SHOTBLAST1', 'DT META', '110', '10', '10010101', '16', '11', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 16, 0, 0, 'Rosly Rapada', '2024-04-03 11:41:13', 'Rosly Rapada', '2024-04-20 09:24:00', 'Scrap', 0, NULL, NULL, NULL, NULL, 'Rosly Rapada', '2024-04-08 15:49:57', 'Testing', '2024-04-24 08:53:01', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-03 11:41:26', NULL, '2024-04-24 08:53:00', 'Rosly Rapada', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (55, '555555555555', 1, NULL, NULL, 4, 'OVEN01', 'DT META', '110', '10', '10010101', '16', '11', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-03 11:41:33', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (56, '555555555555', 1, '123456789101', 1, 5, 'B101', 'DT META', '110', '10', '10010101', '16', '11', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-03 14:53:20', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-05 01:56:00', NULL, NULL, NULL, NULL, 'Scrap', NULL, NULL, NULL, NULL, '', NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (57, '555555555556', 1, NULL, NULL, 5, 'B101', 'DT META', '110', '10', '10010101', '16', '123', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 3, 0, 0, 0, 'Rosly Rapada', '2024-04-03 03:51:00', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-16 04:55:00', NULL, NULL, NULL, NULL, 'Scrap', '555555555555', '1', 'VISUAL NG--For Sort', 'Sorted OK - Rosly Rapada', NULL, 'Sorted OK - Rosly Rapada', 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (58, '666666666666', 1, '766666668667', 1, 6, 'BUBBLEWASH01', 'DT META', 'L101', '100', '10001', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-05 16:46:23', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (59, '555555555556', 1, NULL, NULL, 6, NULL, 'DT META', '110', '10', '10010101', '16', '123', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 3, 0, 0, 0, NULL, NULL, 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-16 04:55:00', NULL, NULL, NULL, NULL, 'Scrap', NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (60, '666666666666', 1, '766666668667', 1, 7, 'OVEN01', 'DT META', 'L101', '100', '10001', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-08 13:05:10', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (61, '222222222222', 2, NULL, NULL, 1, 'DC02', 'DT META', 'CAV1', '200', '100', '16', '10', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-08 01:41:00', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (62, '222222222222', 2, NULL, NULL, 2, 'LINE01', 'DT META', 'CAV1', '200', '100', '16', '10', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-08 13:42:41', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (63, '222222222222', 2, NULL, NULL, 3, 'SHOTBLAST1', 'DT META', 'CAV1', '200', '100', '16', '10', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 16, 0, 0, 'Rosly Rapada', '2024-04-08 13:44:34', 'Rosly Rapada', '2024-04-20 09:24:00', 'Scrap', 0, NULL, NULL, NULL, NULL, 'Rosly Rapada', '2024-04-08 15:49:35', 'Testing', '2024-04-24 08:53:01', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-08 13:45:18', NULL, '2024-04-24 08:53:00', 'Rosly Rapada', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (64, '222222222222', 2, NULL, NULL, 4, 'OVEN01', 'DT META', 'CAV1', '200', '100', '16', '10', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-08 13:46:22', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (65, '222222222222', 2, '333333333333', 2, 5, 'B101', 'DT META', 'CAV1', '200', '100', '16', '10', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-08 13:48:53', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-08 01:50:00', NULL, NULL, NULL, NULL, 'OK', NULL, NULL, NULL, NULL, '1', NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (66, '222222222222', 2, '333333333333', 2, 6, 'BUBBLEWASH01', 'DT META', 'CAV1', '200', '100', '16', '10', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-08 13:52:42', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (67, '222222222222', 2, '333333333333', 2, 7, 'OVEN01', 'DT META', 'CAV1', '200', '100', '16', '10', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-08 13:54:10', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (68, '222222222222', 2, '333333333333', 2, 8, 'LINE01', 'DT META', 'CAV1', '200', '100', '16', '10', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-08 15:42:12', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 15:59:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (69, '777777777777', 1, NULL, NULL, 3, 'SHOTBLAST1', 'DT META', 'L101', '100', '10001', '16', '77', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 16, 0, 0, 'Rosly Rapada', '2024-04-08 15:54:34', 'Rosly Rapada', '2024-04-20 09:24:00', 'Scrap', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 08:53:01', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-08 15:55:35', NULL, '2024-04-24 08:53:00', 'Rosly Rapada', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (70, '777777777777', 1, NULL, NULL, 4, 'OVEN01', 'DT META', 'L101', '100', '10001', '16', '77', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-08 15:55:56', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (71, '777777777777', 1, '888888888888', 1, 5, 'B101', 'DT META', 'L101', '100', '10001', '16', '77', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-08 15:56:32', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-08 03:58:00', NULL, NULL, NULL, NULL, 'OK', NULL, NULL, NULL, NULL, '1', NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (72, '777777777777', 1, '888888888888', 1, 6, 'BUBBLEWASH01', 'DT META', 'L101', '100', '10001', '16', '77', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-08 15:58:57', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (73, '777777777777', 1, '888888888888', 1, 7, 'OVEN01', 'DT META', 'L101', '100', '10001', '16', '77', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-08 15:59:35', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (74, '777777777777', 1, '888888888888', 1, 8, 'LINE01', 'DT META', 'L101', '100', '10001', '16', '77', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-08 16:00:41', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 15:57:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (75, '222222222222', 2, '333333333333', 2, 20, 'LINE01', 'DT META', 'L101', '200', '100', '16', '10', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 5, 1, 0, 0, 'Rosly Rapada', '2024-04-20 08:37:00', 'Rosly Rapada', '2024-04-23 07:14:00', 'For Lot Combine', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 15:58:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'test only', NULL, 'MFISERIAL202404200837013176', 'Accepted  By: Rosly Rapada - okay', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (76, '777777777777', 1, '888888888888', 1, 20, 'LINE01', 'DT META', 'L101', '100', '10001', '16', '77', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 20, 5, 0, 0, 'Rosly Rapada', '2024-04-26 09:27:00', 'Rosly Rapada', '2024-04-26 09:30:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-26 09:30:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'test only', NULL, 'MFISERIAL202404260927224076', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (77, '000000000000', 1, NULL, NULL, 1, 'DC02', 'DT META', 'CAV1', '200', '100', '16', '12', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-11 09:14:00', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', 0, 'Rosly Rapada', '2024-04-11 09:41:27', 'Crack on Stator Top', 'Hold (Testing)', NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, 'QAN-001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (78, '000000000000', 1, NULL, NULL, 2, 'LINE01', 'DT META', 'CAV1', '200', '100', '16', '12', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-11 09:19:55', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (79, '000000000000', 1, NULL, NULL, 3, 'SHOTBLAST1', 'DT META', 'CAV1', '200', '100', '16', '12', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 16, 0, 0, 'Rosly Rapada', '2024-04-11 09:21:58', 'Rosly Rapada', '2024-04-20 09:24:00', 'Scrap', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 08:53:01', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-12 14:33:06', NULL, '2024-04-24 08:53:00', 'Rosly Rapada', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (80, '000000000000', 1, NULL, NULL, 4, 'OVEN01', 'DT META', 'CAV1', '200', '100', '16', '12', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-12 14:34:07', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (81, '000000000000', 1, '111111111111', 2, 5, 'B101', 'DT META', 'CAV1', '200', '100', '16', '12', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-12 17:01:51', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-15 03:56:00', NULL, NULL, NULL, NULL, 'OK', NULL, NULL, NULL, NULL, '1', NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (82, '000000000000', 1, '111111111111', 2, 6, 'BUBBLEWASH01', 'DT META', 'CAV1', '200', '100', '16', '12', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-15 15:56:50', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (83, '121523111029', 1, NULL, NULL, 1, 'DC02', 'DT META', 'CAV1', '200', '100', '16', '15', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-15 04:26:00', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (84, '121523111029', 1, NULL, NULL, 2, 'LINE01', 'DT META', 'CAV1', '200', '100', '16', '15', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 15, 0, 0, 0, 'Rosly Rapada', '2024-04-15 16:43:10', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (85, '333333333334', 1, NULL, NULL, 1, 'DC02', 'DT META', 'CAV1', '200', '100', '16', '10', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-15 04:45:00', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (86, '333333333334', 1, NULL, NULL, 2, 'LINE01', 'DT META', 'CAV1', '200', '100', '16', '10', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-15 16:48:20', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (87, '888888888885', 1, NULL, NULL, 1, 'DC02', 'DT META', 'CAV1', '200', '100', '16', '9', NULL, NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-16 09:30:00', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (88, '011111111119', 1, NULL, NULL, 1, 'DC02', 'DT META', 'CAV1', '200', '100', '16', '2', NULL, NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-16 09:33:00', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (89, '787878787878', 1, NULL, NULL, 1, 'DC02', 'DT META', 'CAV1', '200', '100', '16', 'na', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-16 11:08:00', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', 1, 'Rosly Rapada', '2024-04-17 08:42:31', '6465', '24656+', NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, '163', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (90, '787878787878', 1, NULL, NULL, 2, 'LINE01', 'DT META', 'CAV1', '200', '100', '16', 'na', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-16 11:08:35', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (91, '787878787878', 1, NULL, NULL, 3, 'SHOTBLAST1', 'DT META', 'CAV1', '200', '100', '16', 'na', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 16, 0, 0, 'Rosly Rapada', '2024-04-16 11:09:10', 'Rosly Rapada', '2024-04-20 09:24:00', 'Scrap', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 08:53:01', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-16 11:10:10', NULL, '2024-04-24 08:53:00', 'Rosly Rapada', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (92, '787878787878', 1, NULL, NULL, 4, 'OVEN01', 'DT META', 'CAV1', '200', '100', '16', 'na', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-16 11:10:21', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (93, '787878787878', 1, '787878787879', 1, 5, 'B101', 'DT META', 'CAV1', '200', '100', '16', 'na', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-16 11:10:50', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-22 15:20:16', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-18 10:56:00', NULL, NULL, NULL, NULL, 'OK', NULL, NULL, NULL, NULL, 'A1', 'Sorted OK - Rosly Rapada', 'Lot Accepted - Rosly Rapada', '2024-04-22 03:20:00', 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (94, '787878787878', 1, '787878787879', 1, 6, 'BUBBLEWASH01', 'DT META', 'CAV1', '200', '100', '16', 'na', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-16 11:12:51', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:24:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (95, '787878787878', 1, '787878787879', 1, 7, 'OVEN01', 'DT META', 'CAV1', '200', '100', '16', 'na', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-16 11:13:12', 'Rosly Rapada', '2024-04-20 09:24:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-22 15:20:16', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-18 10:56:00', NULL, NULL, NULL, NULL, 'OK', NULL, NULL, NULL, NULL, NULL, 'Sorted OK - Rosly Rapada', 'Lot Accepted - Rosly Rapada', '2024-04-22 03:20:00', 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (96, '121523111029', 1, NULL, NULL, 3, 'SHOTBLAST3', 'DT META', 'CAV1', '200', '100', '16', '15', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 14, 16, 0, 0, 'Rosly Rapada', '2024-04-20 08:43:46', 'Rosly Rapada', '2024-04-20 10:00:00', 'Scrap', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 08:53:01', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-20 11:36:10', NULL, '2024-04-24 08:53:00', 'Rosly Rapada', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (97, '666666666666', 1, '766666668667', 1, 8, NULL, 'DT META', 'L101', '100', '10001', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/c671c9da00e4a22426acfff8b567e402.pdf', NULL, NULL, 16, 0, 0, 0, NULL, NULL, 'Rosly Rapada', '2024-04-20 09:24:00', 'For Lot Combine', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 13:39:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rejected  By: Rosly Rapada - rest', NULL, 'MFISERIAL202404191037232618', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-', NULL);
INSERT INTO `pr_result` VALUES (98, '121523111029', 1, NULL, NULL, 4, 'OVEN01', 'DT META', 'CAV1', '200', '100', '16', '15', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 13, 0, 0, 0, 'Rosly Rapada', '2024-04-20 13:05:09', 'Rosly Rapada', '2024-04-20 14:37:07', 'OK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 14:37:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (99, '121523111029', 1, '121523111023', 1, 5, 'B101', 'DT META', 'CAV1', '200', '100', '16', '15', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 13, 0, 0, 0, 'Rosly Rapada', '2024-04-22 10:39:36', 'Rosly Rapada', '2024-04-22 10:46:00', 'OK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-22 10:47:18', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-22 10:47:00', NULL, NULL, NULL, NULL, 'OK', NULL, NULL, NULL, NULL, '10', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (100, '112923111015', 1, NULL, NULL, 1, 'DC03', 'DT META', '110', '10', '10010101', '16', '10', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-20 03:14:00', 'Rosly Rapada', '2024-04-20 03:36:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 15:36:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (101, '112923111015', 1, NULL, NULL, 2, 'LINE02', 'DT META', '110', '10', '10010101', '16', '10', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-20 15:37:00', 'Rosly Rapada', '2024-04-20 03:44:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 15:44:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (102, '112923111015', 1, NULL, NULL, 3, 'SHOTBLAST3', 'DT META', '110', '10', '10010101', '16', '10', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 16, 0, 0, 'Rosly Rapada', '2024-04-20 15:45:42', 'Rosly Rapada', '2024-04-20 03:49:00', 'Scrap', 0, 'Rosly Rapada', '2024-04-20 04:28:00', 'TESTING', 'QA Shotblast', 'Rosly Rapada', '2024-04-22 15:01:21', 'Lot Accepted', '2024-04-24 08:53:01', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 08:53:00', 'Rosly Rapada', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (103, '112923111015', 1, NULL, NULL, 4, 'OVEN01', 'DT META', '110', '10', '10010101', '16', '10', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 1, 0, 0, 'Rosly Rapada', '2024-04-22 15:01:40', 'Rosly Rapada', '2024-04-22 15:01:55', 'OK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-22 15:01:55', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-20 05:11:00', 'Rosly Rapada', 'TESTING', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (104, '121523111029', 1, '121523111023', 1, 6, 'BUBBLEWASH01', 'DT META', 'CAV1', '200', '100', '16', '15', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 13, 0, 0, 0, 'Rosly Rapada', '2024-04-22 10:49:07', 'Rosly Rapada', '2024-04-22 10:49:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-22 10:49:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (105, '121523111029', 1, '121523111023', 1, 7, 'OVEN01', 'DT META', 'CAV1', '200', '100', '16', '15', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 13, 0, 0, 0, 'Rosly Rapada', '2024-04-22 10:49:57', 'Rosly Rapada', '2024-04-22 10:51:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-22 10:51:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (107, '121523111029', 1, '121523111023', 1, 20, 'LINE01', 'DT META', 'CAV1', '200', '100', '16', '15', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 13, 0, 0, 0, 'Rosly Rapada', '2024-04-26 09:29:00', 'Rosly Rapada', '2024-04-26 09:30:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-26 09:30:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MFISERIAL202404260929149801', 'Accepted  By: Rosly Rapada - ', NULL, NULL);
INSERT INTO `pr_result` VALUES (108, '112923111015', 1, '112923111016', 1, 5, 'B101', 'DT META', '110', '10', '10010101', '16', '10', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 1, 0, 0, 'Rosly Rapada', '2024-04-22 15:02:26', 'Rosly Rapada', '2024-04-22 03:04:00', 'OK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-22 15:04:42', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-22 03:04:00', NULL, NULL, NULL, NULL, 'OK', NULL, NULL, NULL, NULL, '12', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (109, '112923111015', 1, '112923111016', 1, 6, 'BUBBLEWASH01', 'DT META', '110', '10', '10010101', '16', '10', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 15, 0, 0, 0, 'Rosly Rapada', '2024-04-22 15:05:04', 'Rosly Rapada', '2024-04-22 15:05:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-22 15:05:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (110, '112923111015', 1, '112923111016', 1, 7, 'OVEN01', 'DT META', '110', '10', '10010101', '16', '10', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 15, 0, 0, 0, 'Rosly Rapada', '2024-04-22 15:05:43', 'Rosly Rapada', '2024-04-22 15:06:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-22 15:06:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (112, '112923111015', 1, '112923111016', 1, 20, 'LINE01', 'DT META', 'CAV1', '10', '10010101', '16', '10', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 15, 2, 0, 0, 'Rosly Rapada', '2024-04-26 09:28:00', 'Rosly Rapada', '2024-04-26 09:30:00', 'Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-26 09:30:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MFISERIAL202404260928583360', 'Accepted  By: Rosly Rapada - ', 'Sorted By:Rosly Rapada-Testing', NULL);
INSERT INTO `pr_result` VALUES (113, '199999999999', 1, NULL, NULL, 1, 'DC02', 'DT META', 'CAV1', '200', '100', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-23 11:32:00', 'Rosly Rapada', '2024-04-23 04:53:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-23 16:53:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'test', NULL);
INSERT INTO `pr_result` VALUES (114, '121111111111', 1, NULL, NULL, 1, 'DC02', 'DT META', 'CAV1', '200', '100', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-23 11:57:00', 'Rosly Rapada', '2024-04-23 11:58:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-23 11:58:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (115, '121111111111', 1, NULL, NULL, 2, NULL, 'DT META', 'CAV1', '200', '100', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-26 16:54:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (116, '199999999999', 1, NULL, NULL, 2, 'LINE01', 'DT META', 'CAV1', '200', '100', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-23 16:55:47', 'Rosly Rapada', '2024-04-24 08:04:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 08:04:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (117, '000000000001', 1, NULL, NULL, 1, 'DC02', 'DT META', 'CAV1', '200', '100', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-24 07:43:00', 'Rosly Rapada', '2024-04-24 07:43:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 07:43:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (118, '000000000001', 1, NULL, NULL, 2, 'LINE01', 'DT META', 'CAV1', '200', '100', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-24 07:44:52', 'Rosly Rapada', '2024-04-24 08:11:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 08:11:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (119, '123456712345', 1, NULL, NULL, 1, 'DC02', 'DT META', 'CAV1', '200', '100', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-24 08:00:00', 'Rosly Rapada', '2024-04-24 08:33:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 08:33:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (120, '199999999999', 1, NULL, NULL, 3, 'SHOTBLAST1', 'DT META', 'CAV1', '200', '100', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 16, 0, 0, 'Rosly Rapada', '2024-04-24 08:05:01', 'Rosly Rapada', '2024-04-24 08:12:00', 'Scrap', 0, 'Rosly Rapada', '2024-04-24 08:21:00', 'faded barcode', 'QA Shotblast', NULL, NULL, NULL, '2024-04-24 08:53:01', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 08:53:00', 'Rosly Rapada', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (121, '000000000001', 1, NULL, NULL, 3, 'SHOTBLAST1', 'DT META', 'CAV1', '200', '100', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 16, 0, 0, 'Rosly Rapada', '2024-04-24 08:12:27', 'Rosly Rapada', '2024-04-24 08:12:00', 'Scrap', 0, 'Rosly Rapada', '2024-04-24 08:19:00', 'test', 'QA Shotblast', NULL, NULL, NULL, '2024-04-24 08:53:01', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 08:53:00', 'Rosly Rapada', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (122, '000000000001', 1, NULL, NULL, 4, NULL, 'DT META', 'CAV1', '200', '100', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 1, 1, NULL, NULL, NULL, NULL, 'For Verify', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 08:32:17', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 08:32:00', 'Rosly Rapada', 'Sorted Ok', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (123, '199999999999', 1, NULL, NULL, 4, 'LINE01', 'DT META', 'CAV1', '200', '100', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 1, 1, NULL, NULL, NULL, NULL, 'For QA Judge', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-26 08:12:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (124, '123456712345', 1, NULL, NULL, 2, 'LINE01', 'DT META', 'CAV1', '200', '100', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-24 08:33:49', 'Rosly Rapada', '2024-04-24 08:33:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 08:33:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (125, '123456712345', 1, NULL, NULL, 3, 'SHOTBLAST1', 'DT META', 'CAV1', '200', '100', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 16, 0, 0, 'Rosly Rapada', '2024-04-24 08:34:09', 'Rosly Rapada', '2024-04-24 08:36:00', 'Scrap', 0, 'Rosly Rapada', '2024-04-24 08:36:00', 'test rejected', 'QA Shotblast', NULL, NULL, NULL, '2024-04-24 08:53:01', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 08:53:00', 'Rosly Rapada', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (126, '123456712345', 1, NULL, NULL, 4, NULL, 'DT META', 'CAV1', '200', '100', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 1, 1, NULL, NULL, NULL, NULL, 'For Verify', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 08:37:45', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 08:37:00', 'Rosly Rapada', 'ok', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (127, '112345643641', 1, NULL, NULL, 1, 'DC03', 'DT META', '110', '10', '10010101', '16', 'sdas', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-24 08:40:00', 'Rosly Rapada', '2024-04-24 08:40:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 08:40:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (128, '112345643641', 1, NULL, NULL, 2, 'LINE01', 'DT META', '110', '10', '10010101', '16', 'sdas', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-24 08:40:41', 'Rosly Rapada', '2024-04-24 08:40:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 08:40:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (129, '112345643641', 1, NULL, NULL, 3, 'SHOTBLAST2', 'DT META', '110', '10', '10010101', '16', 'sdas', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 16, 0, 0, 'Rosly Rapada', '2024-04-24 08:41:02', 'Rosly Rapada', '2024-04-24 08:41:00', 'OK', 0, 'Rosly Rapada', '2024-04-24 08:42:00', 'rejected', 'QA Shotblast', NULL, NULL, NULL, '2024-04-24 16:46:53', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-24 08:42:04', NULL, '2024-04-24 08:53:00', 'Rosly Rapada', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (130, '112345643641', 1, NULL, NULL, 4, 'OVEN01', 'DT META', '110', '10', '10010101', '16', 'sdas', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-24 16:47:05', 'Rosly Rapada', '2024-04-24 16:50:56', 'OK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 16:50:56', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 08:43:00', 'Rosly Rapada', 'done', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (131, '123123123123', 1, NULL, NULL, 1, 'DC02', 'DT META', 'CAV1', '200', '100', '16', 'jtest', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-24 08:44:00', 'Rosly Rapada', '2024-04-24 08:44:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 08:44:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (132, '123123123133', 1, NULL, NULL, 1, 'DC02', 'DT META', 'CAV1', '200', '100', '16', 'test1', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-24 08:44:00', 'Rosly Rapada', '2024-04-24 08:44:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 08:44:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (133, '123123123123', 1, NULL, NULL, 2, 'LINE01', 'DT META', 'CAV1', '200', '100', '16', 'jtest', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-24 08:45:12', 'Rosly Rapada', '2024-04-24 08:45:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 08:45:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (134, '123123123133', 1, NULL, NULL, 2, 'LINE01', 'DT META', 'CAV1', '200', '100', '16', 'test1', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-24 08:45:19', 'Rosly Rapada', '2024-04-24 08:45:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 08:45:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (135, '123123123123', 1, NULL, NULL, 3, 'SHOTBLAST1', 'DT META', 'CAV1', '200', '100', '16', 'jtest', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-24 08:45:49', 'Rosly Rapada', '2024-04-24 08:46:00', 'OK', 0, 'Rosly Rapada', '2024-04-24 08:46:00', 'ewewe', 'QA Shotblast', 'Rosly Rapada', '2024-04-24 09:19:18', 'Lot Accepted', '2024-04-24 09:19:18', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 09:14:00', 'Rosly Rapada', 'okay', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (136, '123123123133', 1, NULL, NULL, 3, 'SHOTBLAST1', 'DT META', 'CAV1', '200', '100', '16', 'test1', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-24 08:45:55', 'Rosly Rapada', '2024-04-24 08:46:00', 'OK', 0, 'Rosly Rapada', '2024-04-24 08:46:00', 'dfgregrt', 'QA Shotblast', 'Rosly Rapada', '2024-04-24 11:33:36', 'Lot Accepted', '2024-04-24 11:33:35', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 09:19:00', 'Rosly Rapada', 'ok', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (137, '123123123123', 1, NULL, NULL, 4, NULL, 'DT META', 'CAV1', '200', '100', '16', 'jtest', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 1, 1, NULL, NULL, NULL, NULL, 'OK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 09:19:18', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 09:14:00', 'Rosly Rapada', 'okay', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (138, '123123123133', 1, NULL, NULL, 4, 'DC02', 'DT META', 'CAV1', '200', '100', '16', 'test1', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, NULL, NULL, NULL, NULL, 'OK', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-26 08:14:21', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 09:19:00', 'Rosly Rapada', 'ok', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (139, '111111111171', 1, NULL, NULL, 1, 'DC02', 'DT META', 'CAV1', '200', '100', '16', '12', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-24 11:34:00', 'Rosly Rapada', '2024-04-24 11:34:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 11:34:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (140, '111111111171', 1, NULL, NULL, 2, 'LINE01', 'DT META', 'CAV1', '200', '100', '16', '12', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-24 13:33:00', 'Rosly Rapada', '2024-04-24 01:33:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 13:33:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (141, '111111111171', 1, NULL, NULL, 3, 'B101', 'DT META', 'CAV1', '200', '100', '16', '12', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-26 08:20:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (142, '112345643641', 1, '112345643642', 1, 5, 'B101', 'DT META', '110', '10', '10010101', '16', 'sdas', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-24 16:51:08', 'Rosly Rapada', '2024-04-24 04:59:00', 'OK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-25 10:33:46', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-25 10:17:00', NULL, NULL, NULL, NULL, 'OK', NULL, NULL, NULL, NULL, 'A2', 'Sorted OK - Rosly Rapada', 'Lot Accepted - Rosly Rapada', '2024-04-25 10:33:00', NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (143, '112345643641', 1, '112345643642', 1, 6, 'BUBBLEWASH01', 'DT META', '110', '10', '10010101', '16', 'sdas', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-25 10:33:57', 'Rosly Rapada', '2024-04-25 10:39:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-25 10:39:47', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-25 10:17:00', NULL, NULL, NULL, NULL, 'OK', NULL, NULL, NULL, NULL, NULL, 'Sorted OK - Rosly Rapada', 'Lot Accepted - Rosly Rapada', '2024-04-25 10:33:00', NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (144, '112345643641', 1, '112345643642', 1, 7, 'OVEN01', 'DT META', '110', '10', '10010101', '16', 'sdas', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-25 10:39:56', 'Rosly Rapada', '2024-04-25 10:47:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-25 10:47:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (145, '112345643641', 1, '112345643642', 1, 8, 'LINE01', 'DT META', '110', '10', '10010101', '16', 'sdas', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-25 10:47:37', 'Rosly Rapada', '2024-04-25 11:05:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-25 11:05:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (146, '112345643641', 1, '112345643642', 1, 20, 'LINE01', 'DT META', '110', '10', '10010101', '16', 'sdas', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 0, 1, 1, NULL, NULL, NULL, NULL, 'For Lot Combine', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (147, '123451234512', 1, NULL, NULL, 1, 'DC02', 'DT META', 'CAV1', '200', '100', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-25 11:45:00', 'Rosly Rapada', '2024-04-25 11:45:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-25 11:45:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (148, '123451234512', 1, NULL, NULL, 2, 'LINE01', 'DT META', 'CAV1', '200', '100', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-25 11:45:33', 'Rosly Rapada', '2024-04-25 11:45:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-25 11:45:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (149, '123451234512', 1, NULL, NULL, 3, 'SHOTBLAST1', 'DT META', 'CAV1', '200', '100', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-25 11:46:02', 'Rosly Rapada', '2024-04-25 11:46:00', 'OK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-25 11:46:28', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-25 11:46:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (150, '123451234512', 1, NULL, NULL, 4, 'OVEN01', 'DT META', 'CAV1', '200', '100', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-25 11:46:35', 'Rosly Rapada', '2024-04-26 11:24:38', 'OK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-26 11:24:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (151, '123451234567', 1, NULL, NULL, 1, 'DC03', 'DT META', '110', '10', '10010101', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-25 02:07:00', 'Rosly Rapada', '2024-04-25 02:07:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-25 14:07:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (152, '123451234567', 1, NULL, NULL, 2, 'LINE01', 'DT META', '110', '10', '10010101', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-25 14:07:50', 'Rosly Rapada', '2024-04-26 11:23:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-26 11:23:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (153, '222222222222', 3, NULL, NULL, 1, 'DC02', 'DT META', 'CAV1', '200', '100', '16', '12', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-26 09:38:00', 'Rosly Rapada', '2024-04-26 09:39:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-26 09:39:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (154, '222222222222', 3, NULL, NULL, 2, NULL, 'DT META', 'CAV1', '200', '100', '16', '12', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (155, '131313131313', 1, NULL, NULL, 1, 'DC02', 'DT META', 'CAV1', '200', '100', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-26 09:41:00', 'Rosly Rapada', '2024-04-26 09:42:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-26 09:42:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (156, '131313131313', 1, NULL, NULL, 2, NULL, 'DT META', 'CAV1', '200', '100', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (157, '123451234567', 1, NULL, NULL, 3, 'SHOTBLAST3', 'DT META', '110', '10', '10010101', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-26 11:23:55', 'Rosly Rapada', '2024-04-26 11:24:00', 'OK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-26 11:24:10', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-26 11:24:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (158, '123451234567', 1, NULL, NULL, 4, 'OVEN01', 'DT META', '110', '10', '10010101', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 0, 0, 0, 'Rosly Rapada', '2024-04-26 11:24:20', 'Rosly Rapada', '2024-04-26 11:24:54', 'OK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-26 11:24:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (159, '123451234512', 1, NULL, NULL, 5, NULL, 'DT META', 'CAV1', '200', '100', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/994829cbe1e093461bb601247b16d895.pdf', NULL, NULL, 16, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (160, '123451234567', 1, NULL, NULL, 5, 'B101', 'DT META', '110', '10', '10010101', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 16, 3, 1, 1, 'Rosly Rapada', '2024-04-26 11:25:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-26 11:25:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pr_result` VALUES (161, '123451234568', 1, NULL, NULL, 5, 'B101', 'DT META', '110', '10', '10010101', '16', 'test', 'http://10.216.128.114/PartsTraceabilitySystem/uploads/cc223ee0dce9a4e95ba520b80d5eee66.pdf', NULL, NULL, 3, 0, 0, 0, 'Rosly Rapada', '2024-04-26 11:25:00', NULL, NULL, 'For QA-DIM Judge', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-26 11:55:44', NULL, NULL, NULL, 'Rosly Rapada', '2024-04-26 11:55:00', NULL, NULL, NULL, NULL, 'For QA-DIM Judge', '123451234567', '1', 'VISUAL NG--BIBIRI', 'Sorted OK - Rosly Rapada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for pr_unique
-- ----------------------------
DROP TABLE IF EXISTS `pr_unique`;
CREATE TABLE `pr_unique`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `uniques` int(10) NULL DEFAULT NULL,
  `is_active` tinyint(1) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pr_unique
-- ----------------------------
INSERT INTO `pr_unique` VALUES (1, '111111111111', 2, 1, '2024-04-15 03:55:00');
INSERT INTO `pr_unique` VALUES (2, '111111111112', 1, 1, '2024-03-19 03:01:00');
INSERT INTO `pr_unique` VALUES (3, '222222222222', 3, 1, '2024-04-26 09:38:39');
INSERT INTO `pr_unique` VALUES (4, '222222222223', 1, 1, '2024-03-19 03:07:00');
INSERT INTO `pr_unique` VALUES (5, '333333333333', 2, 1, '2024-04-08 01:49:00');
INSERT INTO `pr_unique` VALUES (6, '333333333332', 1, 0, '2024-03-19 03:33:00');
INSERT INTO `pr_unique` VALUES (7, '666666666666', 1, 0, '2024-04-16 08:53:00');
INSERT INTO `pr_unique` VALUES (8, '666666666667', 1, 1, '2024-03-20 01:59:00');
INSERT INTO `pr_unique` VALUES (9, '777777777777', 1, 0, '2024-04-23 07:14:01');
INSERT INTO `pr_unique` VALUES (10, '999999999999', 1, 1, '2024-03-21 03:40:00');
INSERT INTO `pr_unique` VALUES (11, '012345678910', 1, 0, '2024-04-05 01:24:00');
INSERT INTO `pr_unique` VALUES (12, '111111111115', 1, 0, '2024-04-16 05:01:00');
INSERT INTO `pr_unique` VALUES (13, '111111111116', 1, 1, '2024-04-02 11:26:00');
INSERT INTO `pr_unique` VALUES (14, '111222222111', 1, 1, '2024-04-02 05:01:00');
INSERT INTO `pr_unique` VALUES (15, '555555555555', 1, 0, '2024-04-05 01:56:00');
INSERT INTO `pr_unique` VALUES (16, '012345678911', 1, 0, '2024-04-05 01:24:00');
INSERT INTO `pr_unique` VALUES (17, '766666666667', 1, 1, '2024-04-03 03:48:00');
INSERT INTO `pr_unique` VALUES (18, '555555555556', 1, 0, '2024-04-16 04:55:00');
INSERT INTO `pr_unique` VALUES (19, '766666668667', 1, 1, '2024-04-03 03:56:00');
INSERT INTO `pr_unique` VALUES (20, '123456789101', 1, 0, '2024-04-05 01:56:00');
INSERT INTO `pr_unique` VALUES (21, '888888888888', 1, 1, '2024-04-08 03:57:00');
INSERT INTO `pr_unique` VALUES (22, '000000000000', 1, 1, '2024-04-11 09:14:00');
INSERT INTO `pr_unique` VALUES (23, '121523111029', 1, 0, '2024-04-24 13:45:19');
INSERT INTO `pr_unique` VALUES (24, '333333333334', 1, 1, '2024-04-15 04:45:00');
INSERT INTO `pr_unique` VALUES (25, '888888888885', 1, 1, '2024-04-16 09:30:00');
INSERT INTO `pr_unique` VALUES (26, '011111111119', 1, 1, '2024-04-16 09:33:00');
INSERT INTO `pr_unique` VALUES (27, '787878787878', 1, 0, '2024-04-18 10:55:00');
INSERT INTO `pr_unique` VALUES (28, '787878787879', 1, 1, '2024-04-16 11:11:00');
INSERT INTO `pr_unique` VALUES (29, '112923111015', 1, 0, '2024-04-24 08:14:18');
INSERT INTO `pr_unique` VALUES (30, '121523111023', 1, 1, '2024-04-22 10:46:00');
INSERT INTO `pr_unique` VALUES (31, '112923111016', 1, 1, '2024-04-22 03:04:00');
INSERT INTO `pr_unique` VALUES (32, '199999999999', 1, 1, '2024-04-23 11:32:00');
INSERT INTO `pr_unique` VALUES (33, '121111111111', 1, 1, '2024-04-23 11:57:00');
INSERT INTO `pr_unique` VALUES (34, '000000000001', 1, 1, '2024-04-24 07:43:00');
INSERT INTO `pr_unique` VALUES (35, '123456712345', 1, 1, '2024-04-24 08:00:00');
INSERT INTO `pr_unique` VALUES (36, '112345643641', 1, 0, '2024-04-25 10:12:00');
INSERT INTO `pr_unique` VALUES (37, '123123123123', 1, 1, '2024-04-24 08:44:00');
INSERT INTO `pr_unique` VALUES (38, '123123123133', 1, 0, '2024-04-24 08:53:00');
INSERT INTO `pr_unique` VALUES (39, '111111111171', 1, 1, '2024-04-24 11:34:00');
INSERT INTO `pr_unique` VALUES (40, '112345643642', 1, 1, '2024-04-24 04:59:00');
INSERT INTO `pr_unique` VALUES (41, '123451234512', 1, 1, '2024-04-25 11:45:00');
INSERT INTO `pr_unique` VALUES (42, '123451234567', 1, 1, '2024-04-25 02:07:00');
INSERT INTO `pr_unique` VALUES (43, '131313131313', 1, 1, '2024-04-26 09:41:00');
INSERT INTO `pr_unique` VALUES (44, '123451234568', 1, 1, '2024-04-26 11:25:00');
INSERT INTO `pr_unique` VALUES (45, '123451234566', 1, 1, '2024-04-27 09:00:00');

-- ----------------------------
-- Table structure for set_areas
-- ----------------------------
DROP TABLE IF EXISTS `set_areas`;
CREATE TABLE `set_areas`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `location` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `is_active` tinyint(1) NULL DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of set_areas
-- ----------------------------
INSERT INTO `set_areas` VALUES (1, 'TRIMMING', 'casting', 1, 'Rosly Rapada', '2024-02-29 07:40:00', '2024-03-15 09:44:00');
INSERT INTO `set_areas` VALUES (2, 'Deburring', 'casting', 1, 'Rosly Rapada', '2024-02-29 07:41:00', '2024-02-29 08:15:05');
INSERT INTO `set_areas` VALUES (3, 'Shotblast', 'casting', 1, 'Rosly Rapada', '2024-02-29 07:41:00', '2024-02-29 08:15:12');
INSERT INTO `set_areas` VALUES (4, 'Annealing', 'casting', 1, 'Rosly Rapada', '2024-02-29 07:41:00', '2024-02-29 08:15:18');
INSERT INTO `set_areas` VALUES (5, 'Machining', 'casting', 1, 'Rosly Rapada', '2024-02-29 07:41:00', '2024-03-01 08:18:33');
INSERT INTO `set_areas` VALUES (6, 'BUBBLE WASH', 'machining', 1, 'Rosly Rapada', '2024-02-29 07:43:00', '2024-04-05 03:39:00');
INSERT INTO `set_areas` VALUES (7, 'Oven', 'machining', 1, 'Rosly Rapada', '2024-02-29 07:43:00', '2024-03-01 08:18:41');
INSERT INTO `set_areas` VALUES (8, 'MFI', 'machining', 1, 'Rosly Rapada', '2024-02-29 08:17:00', '2024-03-01 08:19:19');
INSERT INTO `set_areas` VALUES (9, 'OGI', 'machining', 1, 'Rosly Rapada', '2024-02-29 08:17:00', '2024-03-01 08:35:36');
INSERT INTO `set_areas` VALUES (11, 'MRS MACHINING', 'machining', 1, 'Rosly Rapada', '2024-03-01 01:30:00', '2024-03-01 01:32:00');
INSERT INTO `set_areas` VALUES (13, 'MED CASTING', 'casting', 1, 'Rosly Rapada', '2024-03-13 07:41:00', '2024-03-13 07:41:00');
INSERT INTO `set_areas` VALUES (14, 'MED Machining', 'machining', 1, 'Rosly Rapada', '2024-03-13 07:41:00', NULL);
INSERT INTO `set_areas` VALUES (15, 'MRS Casting', 'casting', 1, 'Rosly Rapada', '2024-03-13 07:42:00', NULL);
INSERT INTO `set_areas` VALUES (16, 'Med Debplan', 'casting', 1, 'Rosly Rapada', '2024-03-13 09:06:00', NULL);
INSERT INTO `set_areas` VALUES (18, 'Casting QA', 'casting', 1, 'Rosly Rapada', '2024-03-13 09:19:00', NULL);
INSERT INTO `set_areas` VALUES (19, 'Admin', 'casting', 1, 'Rosly Rapada', '2024-03-13 09:32:00', NULL);
INSERT INTO `set_areas` VALUES (20, 'Lot Combine', 'machining', 1, 'Rosly Rapada', '2024-04-02 01:06:00', '2024-04-02 13:07:10');
INSERT INTO `set_areas` VALUES (21, 'Guest', 'casting', 1, 'Rosly Rapada', NULL, '2024-04-17 13:06:13');
INSERT INTO `set_areas` VALUES (22, 'IPQE Inline', 'machining', 1, 'Rosly Rapada', '2024-04-26 02:20:00', NULL);
INSERT INTO `set_areas` VALUES (23, 'IPQE Dimension', 'machining', 1, 'Rosly Rapada', '2024-04-26 02:20:00', NULL);

-- ----------------------------
-- Table structure for set_category
-- ----------------------------
DROP TABLE IF EXISTS `set_category`;
CREATE TABLE `set_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `is_active` tinyint(1) NULL DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of set_category
-- ----------------------------
INSERT INTO `set_category` VALUES (1, 'VISUAL NG', 1, 'A.Manzano', '2024-02-05 16:42:13', '2024-02-05 16:41:31');
INSERT INTO `set_category` VALUES (2, 'DIMENSION NG', 1, 'A.Manzano', '2024-02-05 16:42:13', '2024-02-05 16:41:31');
INSERT INTO `set_category` VALUES (3, 'EVALUATION', 1, 'A.Manzano', '2024-02-05 16:42:13', '2024-02-05 16:41:31');
INSERT INTO `set_category` VALUES (4, 'NPI', 1, 'A.Manzano', '2024-02-05 16:42:13', '2024-02-05 16:41:31');
INSERT INTO `set_category` VALUES (5, 'OGI SAMPLE', 1, 'A.Manzano', '2024-02-05 16:42:13', '2024-02-05 16:41:31');
INSERT INTO `set_category` VALUES (6, 'IPQC SAMPLE', 1, 'A.Manzano', '2024-02-05 16:42:13', '2024-02-05 16:41:31');
INSERT INTO `set_category` VALUES (7, 'MED SAMPLE', 1, 'A.Manzano', '2024-02-05 16:42:13', '2024-02-05 16:41:31');

-- ----------------------------
-- Table structure for set_lines
-- ----------------------------
DROP TABLE IF EXISTS `set_lines`;
CREATE TABLE `set_lines`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lines` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `area_id` int(11) NULL DEFAULT NULL,
  `is_active` tinyint(1) NULL DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `area_id`(`area_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of set_lines
-- ----------------------------
INSERT INTO `set_lines` VALUES (1, 'DC01', 1, 1, 'Rosly Rapada', '2024-02-29 07:43:00', NULL);
INSERT INTO `set_lines` VALUES (2, 'DC02', 1, 1, 'Rosly Rapada', '2024-02-29 07:44:00', NULL);
INSERT INTO `set_lines` VALUES (3, 'LINE01', 2, 1, 'Rosly Rapada', '2024-03-01 09:06:00', NULL);
INSERT INTO `set_lines` VALUES (4, 'LINE02', 2, 1, 'Rosly Rapada', '2024-03-01 09:06:00', NULL);
INSERT INTO `set_lines` VALUES (5, 'DC03', 1, 1, 'Rosly Rapada', '2024-03-01 01:44:00', NULL);
INSERT INTO `set_lines` VALUES (6, 'DC04', 1, 1, 'Rosly Rapada', '2024-03-04 10:06:00', NULL);
INSERT INTO `set_lines` VALUES (7, 'DC05', 1, 1, 'Rosly Rapada', '2024-03-04 10:09:00', NULL);
INSERT INTO `set_lines` VALUES (8, 'SHOTBLAST1', 3, 1, 'Rosly Rapada', '2024-03-08 08:26:00', NULL);
INSERT INTO `set_lines` VALUES (9, 'SHOTBLAST2', 3, 1, 'Rosly Rapada', '2024-03-08 08:27:00', NULL);
INSERT INTO `set_lines` VALUES (10, 'SHOTBLAST3', 3, 1, 'Rosly Rapada', '2024-03-08 08:27:00', NULL);
INSERT INTO `set_lines` VALUES (11, 'OVEN01', 4, 1, 'Rosly Rapada', '2024-03-08 11:53:00', NULL);
INSERT INTO `set_lines` VALUES (12, 'B101', 5, 1, 'Rosly Rapada', '2024-03-13 10:00:00', NULL);
INSERT INTO `set_lines` VALUES (13, 'B102', 5, 1, 'Rosly Rapada', '2024-03-13 10:00:00', NULL);
INSERT INTO `set_lines` VALUES (14, 'OVEN01', 7, 1, 'Rosly Rapada', '2024-03-20 07:41:00', NULL);
INSERT INTO `set_lines` VALUES (15, 'OVEN02', 7, 1, 'Rosly Rapada', '2024-03-20 07:41:00', NULL);
INSERT INTO `set_lines` VALUES (16, 'OVEN03', 7, 1, 'Rosly Rapada', '2024-03-20 07:41:00', NULL);
INSERT INTO `set_lines` VALUES (17, 'BUBBLEWASH01', 6, 1, 'Rosly Rapada', '2024-03-20 07:52:00', NULL);
INSERT INTO `set_lines` VALUES (18, 'BUBBLEWASH02', 6, 1, 'Rosly Rapada', '2024-03-20 07:52:00', NULL);
INSERT INTO `set_lines` VALUES (19, 'LINE01', 8, 1, 'Rosly Rapada', '2024-03-21 04:03:00', NULL);
INSERT INTO `set_lines` VALUES (20, 'LINE02', 8, 1, 'Rosly Rapada', '2024-04-02 02:36:00', NULL);

-- ----------------------------
-- Table structure for set_lotdetails
-- ----------------------------
DROP TABLE IF EXISTS `set_lotdetails`;
CREATE TABLE `set_lotdetails`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `machine` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `model` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mold_no` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ingot_no` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tray_size` int(10) NULL DEFAULT NULL,
  `cavity` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `is_active` tinyint(1) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of set_lotdetails
-- ----------------------------
INSERT INTO `set_lotdetails` VALUES (1, 'DC01', 'DT META', '100', '10001', 16, 'L101, L102', 0, '2024-03-04 04:02:00', '2024-04-02 08:09:31', 'System1');
INSERT INTO `set_lotdetails` VALUES (2, 'DC02', 'DT META', '200', '100', 16, 'CAV1, CAV2, CAV3, CAV4', 1, '2024-03-04 04:46:00', NULL, 'Rosly Rapada');
INSERT INTO `set_lotdetails` VALUES (3, 'DC03', 'DT META', '10', '10010101', 16, '110, 111, 112, 114', 1, '2024-03-12 01:38:00', NULL, 'Rosly Rapada');
INSERT INTO `set_lotdetails` VALUES (4, 'DC04', 'DT META', 'F1', 'ADC12', 16, 'A, B, C, D', 1, '2024-03-27 02:38:00', NULL, 'Rosly Rapada');
INSERT INTO `set_lotdetails` VALUES (5, 'DC05', 'DT META', 'F1', 'ADC12', 16, 'A, B, C, D', 0, '2024-03-27 02:42:00', '2024-04-20 15:24:02', 'Rosly Rapada');
INSERT INTO `set_lotdetails` VALUES (6, 'DC01', 'DT META', 'F1', 'ADC12', 16, 'A, B, C, D', 1, '2024-04-02 08:12:00', NULL, 'Rosly Rapada');
INSERT INTO `set_lotdetails` VALUES (7, 'DC05', 'DT META', '1F', 'ADC12', 16, 'B', 0, '2024-04-20 03:31:00', '2024-04-20 15:32:41', 'Rosly Rapada');
INSERT INTO `set_lotdetails` VALUES (8, 'DC05', 'TEST MODEL', '1', 'TETS', 16, '101', 1, '2024-04-27 09:00:00', NULL, 'Rosly Rapada');

-- ----------------------------
-- Table structure for set_models
-- ----------------------------
DROP TABLE IF EXISTS `set_models`;
CREATE TABLE `set_models`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` date NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `is_active` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `updated_at` date NULL DEFAULT NULL,
  `annealing_baking` int(12) NULL DEFAULT NULL,
  `oven_baking` int(12) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of set_models
-- ----------------------------
INSERT INTO `set_models` VALUES (1, 'DT META', '2024-03-04', 'Rosly Rapada', '1', '2024-04-03', 0, 0);

-- ----------------------------
-- Table structure for set_molddetails
-- ----------------------------
DROP TABLE IF EXISTS `set_molddetails`;
CREATE TABLE `set_molddetails`  (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `model` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mold_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cavity1` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `is_active` int(10) NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` date NULL DEFAULT NULL,
  `updated_at` date NULL DEFAULT NULL,
  `cavity_no` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of set_molddetails
-- ----------------------------
INSERT INTO `set_molddetails` VALUES (1, 'DT META', '100', 'L101,L102', 1, 'System1', '2024-03-04', NULL, 2);
INSERT INTO `set_molddetails` VALUES (2, 'DT META', '200', 'CAV1,CAV2,CAV3,CAV4', 1, 'Rosly Rapada', '2024-03-04', NULL, 4);
INSERT INTO `set_molddetails` VALUES (3, 'DT META', '10', '110,111,112,114', 1, 'Rosly Rapada', '2024-03-12', NULL, 4);
INSERT INTO `set_molddetails` VALUES (4, 'DT META', 'A1FC', 'L123,L124', 1, 'Rosly Rapada', '2024-03-13', NULL, 2);
INSERT INTO `set_molddetails` VALUES (5, 'DT META', 'B', '1B', 1, 'Rosly Rapada', '2024-03-27', NULL, 1);
INSERT INTO `set_molddetails` VALUES (6, 'DT META', 'F1', 'A,B,C,D', 1, 'Rosly Rapada', '2024-03-27', NULL, 4);
INSERT INTO `set_molddetails` VALUES (7, 'DT META', 'F2', 'A,B,C,D', 1, 'Rosly Rapada', '2024-03-27', NULL, 4);
INSERT INTO `set_molddetails` VALUES (8, 'DT META', 'F4', 'A,B,C,D', 1, 'Rosly Rapada', '2024-04-17', NULL, 4);
INSERT INTO `set_molddetails` VALUES (9, 'DT META', 'F3', 'A,B', 1, 'Rosly Rapada', '2024-04-17', NULL, 2);
INSERT INTO `set_molddetails` VALUES (10, 'DT META', '1F', 'B', 1, 'Rosly Rapada', '2024-04-20', NULL, 1);
INSERT INTO `set_molddetails` VALUES (11, 'TEST MODEL', '1', '101', 1, 'Rosly Rapada', '2024-04-27', NULL, 1);

-- ----------------------------
-- Table structure for set_pages
-- ----------------------------
DROP TABLE IF EXISTS `set_pages`;
CREATE TABLE `set_pages`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `page_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of set_pages
-- ----------------------------
INSERT INTO `set_pages` VALUES (1, 'Batch In', 1, 1, '2022-04-27 14:25:29', '2022-04-27 14:25:29');
INSERT INTO `set_pages` VALUES (2, 'Batch Out', 1, 1, '2022-04-27 14:25:29', '2022-04-27 14:25:29');
INSERT INTO `set_pages` VALUES (3, 'Single In', 1, 1, '2022-04-27 14:25:29', '2022-04-27 14:25:29');
INSERT INTO `set_pages` VALUES (4, 'Single Out', 1, 1, '2022-04-27 14:25:29', '2022-04-27 14:25:29');
INSERT INTO `set_pages` VALUES (5, 'Lot Creation', 1, 1, '2022-04-27 14:25:29', '2022-04-27 14:25:29');
INSERT INTO `set_pages` VALUES (6, 'History', 1, 1, '2022-04-27 14:25:30', '2022-04-27 14:25:30');
INSERT INTO `set_pages` VALUES (7, 'Lot Sample', 1, 1, '2022-04-27 14:25:30', '2022-04-27 14:25:30');
INSERT INTO `set_pages` VALUES (8, 'Lot Sampling', 1, 1, '2022-04-27 14:25:30', '2022-04-27 14:25:30');

-- ----------------------------
-- Table structure for set_permissions
-- ----------------------------
DROP TABLE IF EXISTS `set_permissions`;
CREATE TABLE `set_permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(10) UNSIGNED NOT NULL,
  `page_id` int(10) UNSIGNED NOT NULL,
  `is_view` tinyint(1) NOT NULL,
  `is_add` tinyint(1) NOT NULL,
  `is_edit` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `set_permissions_role_id_foreign`(`role_id`) USING BTREE,
  INDEX `set_permissions_page_id_foreign`(`page_id`) USING BTREE,
  CONSTRAINT `set_permissions_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `set_pages` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `set_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `set_roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of set_permissions
-- ----------------------------
INSERT INTO `set_permissions` VALUES (1, 1, 1, 1, 1, 1, 1, 1, '2022-04-23 06:53:08', '2022-04-23 06:53:08');
INSERT INTO `set_permissions` VALUES (2, 1, 2, 1, 1, 1, 1, 1, '2022-04-23 06:53:09', '2022-04-23 06:53:09');
INSERT INTO `set_permissions` VALUES (3, 1, 3, 1, 1, 1, 1, 1, '2022-04-23 06:53:09', '2022-04-23 06:53:09');
INSERT INTO `set_permissions` VALUES (4, 1, 4, 1, 1, 1, 1, 1, '2022-04-23 06:53:09', '2022-04-23 06:53:09');
INSERT INTO `set_permissions` VALUES (5, 1, 5, 1, 1, 1, 1, 1, '2022-04-23 06:53:09', '2022-04-23 06:53:09');
INSERT INTO `set_permissions` VALUES (6, 1, 6, 1, 1, 1, 1, 1, '2022-04-23 06:53:09', '2022-04-23 06:53:09');
INSERT INTO `set_permissions` VALUES (7, 1, 7, 1, 1, 1, 1, 1, '2022-04-23 06:53:09', '2022-04-23 06:53:09');
INSERT INTO `set_permissions` VALUES (8, 1, 8, 1, 1, 1, 1, 1, '2022-04-23 06:53:09', '2022-04-23 06:53:09');
INSERT INTO `set_permissions` VALUES (9, 2, 5, 1, 1, 1, 1, 1, '2024-02-15 09:04:02', '2024-02-15 09:04:04');
INSERT INTO `set_permissions` VALUES (10, 2, 6, 1, 1, 1, 1, 1, '2024-02-15 09:04:02', '2024-02-15 09:04:04');
INSERT INTO `set_permissions` VALUES (11, 3, 8, 1, 1, 1, 1, 1, '2024-02-15 09:04:02', '2024-02-15 09:04:04');
INSERT INTO `set_permissions` VALUES (12, 3, 6, 1, 1, 1, 1, 1, '2024-02-15 09:04:02', '2024-02-15 09:04:04');
INSERT INTO `set_permissions` VALUES (13, 4, 1, 1, 1, 1, 1, 1, '2024-02-15 09:04:02', '2024-02-15 09:04:04');
INSERT INTO `set_permissions` VALUES (14, 4, 4, 1, 1, 1, 1, 1, '2024-02-15 09:04:02', '2024-02-15 09:04:04');
INSERT INTO `set_permissions` VALUES (15, 4, 6, 1, 1, 1, 1, 1, '2024-02-15 09:04:02', '2024-02-15 09:04:04');
INSERT INTO `set_permissions` VALUES (16, 5, 1, 1, 1, 1, 1, 1, '2024-02-15 09:04:02', '2024-02-15 09:04:04');
INSERT INTO `set_permissions` VALUES (17, 5, 4, 1, 1, 1, 1, 1, '2024-02-15 09:04:02', '2024-02-15 09:04:04');
INSERT INTO `set_permissions` VALUES (18, 5, 6, 1, 1, 1, 1, 1, '2024-02-15 09:04:02', '2024-02-15 09:04:04');
INSERT INTO `set_permissions` VALUES (19, 6, 1, 1, 1, 1, 1, 1, '2024-02-15 09:04:02', '2024-02-15 09:04:04');
INSERT INTO `set_permissions` VALUES (20, 6, 4, 1, 1, 1, 1, 1, '2024-02-15 09:04:02', '2024-02-15 09:04:04');
INSERT INTO `set_permissions` VALUES (21, 6, 6, 1, 1, 1, 1, 1, '2024-02-15 09:04:02', '2024-02-15 09:04:04');

-- ----------------------------
-- Table structure for set_process
-- ----------------------------
DROP TABLE IF EXISTS `set_process`;
CREATE TABLE `set_process`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `area_id` int(10) NULL DEFAULT NULL,
  `previous_id` int(10) NULL DEFAULT NULL,
  `next_id` int(10) NULL DEFAULT NULL,
  `is_sampling` tinyint(1) NULL DEFAULT NULL,
  `is_active` tinyint(1) NULL DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of set_process
-- ----------------------------
INSERT INTO `set_process` VALUES (1, 'DT META', 1, 1, 2, 0, 1, 'R.Rapada', '2024-02-06 14:46:08', '2024-02-06 14:46:09');
INSERT INTO `set_process` VALUES (2, 'DT META', 2, 1, 3, 1, 1, 'R.Rapada', '2024-02-06 14:46:08', '2024-02-06 14:46:09');
INSERT INTO `set_process` VALUES (3, 'DT META', 3, 2, 4, 1, 1, 'R.Rapada', '2024-02-06 14:46:08', '2024-02-06 14:46:09');
INSERT INTO `set_process` VALUES (4, 'DT META', 4, 3, 5, 1, 1, 'R.Rapada', '2024-02-06 14:46:08', '2024-02-06 14:46:09');
INSERT INTO `set_process` VALUES (5, 'DT META', 5, 4, 6, 1, 1, 'R.Rapada', '2024-02-06 14:46:08', '2024-02-06 14:46:09');
INSERT INTO `set_process` VALUES (6, 'DT META', 6, 5, 7, 1, 1, 'R.Rapada', '2024-02-06 14:46:08', '2024-02-06 14:46:09');
INSERT INTO `set_process` VALUES (7, 'DT META', 7, 6, 8, 1, 1, 'R.Rapada', '2024-02-06 14:46:08', '2024-02-06 14:46:09');
INSERT INTO `set_process` VALUES (8, 'DT META', 8, 7, 20, 1, 1, 'R.Rapada', '2024-02-06 14:46:08', '2024-02-06 14:46:09');
INSERT INTO `set_process` VALUES (9, 'DT META', 20, 8, 9, 1, 1, 'Rosly Rapada', '2024-04-02 01:09:00', NULL);

-- ----------------------------
-- Table structure for set_roles
-- ----------------------------
DROP TABLE IF EXISTS `set_roles`;
CREATE TABLE `set_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of set_roles
-- ----------------------------
INSERT INTO `set_roles` VALUES (1, 'Admin', 1, 1, '2022-04-23 06:53:08', '2022-06-09 16:16:13');
INSERT INTO `set_roles` VALUES (2, 'Operator', 1, 1, '2022-04-23 06:53:08', '2022-04-23 06:53:08');
INSERT INTO `set_roles` VALUES (3, 'Lineleader', 1, 1, '2022-04-23 06:53:08', '2022-04-23 06:53:08');
INSERT INTO `set_roles` VALUES (4, 'Engineer', 1, 1, '2022-04-23 09:44:25', '2022-05-04 14:11:00');
INSERT INTO `set_roles` VALUES (5, 'Supervisor', 1, 1, '2022-04-26 14:14:09', '2022-04-27 17:14:21');
INSERT INTO `set_roles` VALUES (6, 'Manager', 1, 1, '2022-04-28 07:53:43', '2022-04-28 07:53:43');
INSERT INTO `set_roles` VALUES (7, 'Guest', 1, 1, '2022-04-28 07:53:43', '2022-04-28 07:53:43');

-- ----------------------------
-- Table structure for set_users
-- ----------------------------
DROP TABLE IF EXISTS `set_users`;
CREATE TABLE `set_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(10) UNSIGNED NOT NULL,
  `area_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `set_users_user_name_unique`(`username`) USING BTREE,
  INDEX `set_users_role_id_foreign`(`role_id`) USING BTREE,
  CONSTRAINT `set_users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `set_roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of set_users
-- ----------------------------
INSERT INTO `set_users` VALUES (16, 1, '19', 'Rosly Rapada', 'RR', '3c59dc048e8850243be8079a5c74d079', 1, 16, '2024-02-19 11:16:00', '2024-03-22 10:03:00');
INSERT INTO `set_users` VALUES (18, 2, '1', 'ADRIAN BAGAYAWA', 'ADRIAN.B', 'a74dab71c885251ac0e76c6b737ea4a4', 1, 16, '2024-03-05 07:14:00', '2024-04-17 01:15:00');
INSERT INTO `set_users` VALUES (19, 2, '1', 'RODERICK AGUILAR', 'RODERICK.A', 'df5961d5723035e7c6623334f7ad798b', 1, 16, '2024-03-05 07:18:00', '2024-04-17 01:16:00');
INSERT INTO `set_users` VALUES (20, 2, '1', 'RYAN MARABELLA', 'RYAN.M', 'adea9a524dbaab8ec7cbba28ddb81089', 1, 16, '2024-03-05 11:05:00', '2024-04-17 01:16:00');
INSERT INTO `set_users` VALUES (24, 7, '21', 'Guest Account', 'Guest', 'adb831a7fdd83dd1e2a309ce7591dff8', 1, 16, '2024-04-17 12:00:00', NULL);

-- ----------------------------
-- Table structure for tbl_palletserial
-- ----------------------------
DROP TABLE IF EXISTS `tbl_palletserial`;
CREATE TABLE `tbl_palletserial`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cavity` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lotserial` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `quantity` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `copies` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `date_created` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_palletserial
-- ----------------------------
INSERT INTO `tbl_palletserial` VALUES (1, 'DT META', 'L101', 'DT METAL10120240422113333', '15', '1', '2024-04-23');
INSERT INTO `tbl_palletserial` VALUES (2, 'DT META', 'CAV1', 'DT METAL10120240422113332', '17', '1', '2024-04-23');

-- ----------------------------
-- Table structure for tbl_serial_printing
-- ----------------------------
DROP TABLE IF EXISTS `tbl_serial_printing`;
CREATE TABLE `tbl_serial_printing`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cavity` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `quantity` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sublot_serial` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mother_serial` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lot_serial` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `date_add_sublot` datetime(0) NULL DEFAULT NULL,
  `date_add_motherlot` datetime(0) NULL DEFAULT NULL,
  `combine_sublot` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `combine_motherlot` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lot_serial_generated` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mother_lot_serial_generated` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_serial_printing
-- ----------------------------
INSERT INTO `tbl_serial_printing` VALUES (39, 'DT META', 'L101', '4', 'MFISERIAL2024042008370131761', 'DT METAL10120240422113331', '777777777777', NULL, '2024-04-22 11:33:00', NULL, 'Rosly Rapada', '1', '1');
INSERT INTO `tbl_serial_printing` VALUES (40, 'DT META1', 'L101', '15', 'MFISERIAL2024042008370131761', 'DT METAL10120240422113331', '222222222222', NULL, '2024-04-22 11:33:00', NULL, 'Rosly Rapada', '1', '1');
INSERT INTO `tbl_serial_printing` VALUES (41, 'DT META', 'CAV1', '13', 'MFISERIAL202404221135275107', 'DT METAL10120240422113332', '121523111029', '2024-04-22 02:54:00', NULL, 'Rosly Rapada', NULL, '1', '1');
INSERT INTO `tbl_serial_printing` VALUES (42, 'DT META', 'L101', '4', 'MFISERIAL2024042008370131762', 'DT METAL10120240422113332', '222222222222', '2024-04-23 07:14:00', NULL, 'Rosly Rapada', NULL, '1', '1');
INSERT INTO `tbl_serial_printing` VALUES (43, 'DT META', 'L101', '15', 'MFISERIAL2024042008370131763', 'DT METAL10120240422113333', '777777777777', '2024-04-23 07:14:00', NULL, 'Rosly Rapada', NULL, '1', '1');
INSERT INTO `tbl_serial_printing` VALUES (44, 'DT META', '110', '13', 'MFISERIAL202404221507096044', NULL, '112923111015', '2024-04-24 08:14:00', NULL, 'Rosly Rapada', NULL, '1', NULL);
INSERT INTO `tbl_serial_printing` VALUES (45, 'DT META', '110', '8', 'MFISERIAL202404241340203110', NULL, '121523111029', '2024-04-24 01:45:00', NULL, 'Rosly Rapada', NULL, '1', NULL);
INSERT INTO `tbl_serial_printing` VALUES (46, 'DT META', '110', '15', 'MFISERIAL202404241340203110', NULL, '112923111015', '2024-04-24 01:45:00', NULL, 'Rosly Rapada', NULL, '1', NULL);
INSERT INTO `tbl_serial_printing` VALUES (47, 'DT META', 'L101', '15', 'MFISERIAL202404260927224076', NULL, '777777777777', '2024-04-26 09:30:00', NULL, 'Rosly Rapada', NULL, '1', NULL);
INSERT INTO `tbl_serial_printing` VALUES (48, 'DT META', 'CAV1', '13', 'MFISERIAL202404260929149801', NULL, '121523111029', '2024-04-26 09:30:00', NULL, 'Rosly Rapada', NULL, '1', NULL);
INSERT INTO `tbl_serial_printing` VALUES (49, 'DT META', 'CAV1', '13', 'MFISERIAL202404260928583360', NULL, '112923111015', '2024-04-26 09:30:00', NULL, 'Rosly Rapada', NULL, '1', NULL);

-- ----------------------------
-- Table structure for tbl_sublotserial
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sublotserial`;
CREATE TABLE `tbl_sublotserial`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cavity` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lotserial` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `quantity` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `copies` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `date_created` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_sublotserial
-- ----------------------------
INSERT INTO `tbl_sublotserial` VALUES (1, 'DT META', 'L101', 'MFISERIAL202404200837013176', '15', '1', '2024-04-24');
INSERT INTO `tbl_sublotserial` VALUES (2, 'DT META', 'L101', 'MFISERIAL2024042008370131763', '15', '1', '2024-04-24');
INSERT INTO `tbl_sublotserial` VALUES (3, 'DT META', 'L101', 'MFISERIAL2024042008370131761', '4', '1', '2024-04-23');
INSERT INTO `tbl_sublotserial` VALUES (4, 'DT META', 'L101', 'MFISERIAL2024042008370131762', '4', '1', '2024-04-23');
INSERT INTO `tbl_sublotserial` VALUES (5, 'DT META1', 'L101', 'MFISERIAL2024042008370131761', '15', '1', '2024-04-23');
INSERT INTO `tbl_sublotserial` VALUES (6, 'DT META1', 'L101', 'MFISERIAL2024042008370131761', '15', '1', '2024-04-23');
INSERT INTO `tbl_sublotserial` VALUES (7, 'DT META', 'L101', 'MFISERIAL2024042008370131762', '4', '1', '2024-04-23');
INSERT INTO `tbl_sublotserial` VALUES (8, 'DT META', 'L101', 'MFISERIAL2024042008370131763', '15', '1', '2024-04-23');
INSERT INTO `tbl_sublotserial` VALUES (9, 'DT META', 'CAV1', 'MFISERIAL202404221135275107', '13', '1', '2024-04-23');
INSERT INTO `tbl_sublotserial` VALUES (10, 'DT META', 'L101', 'MFISERIAL2024042008370131761', '19', '1', '2024-04-23');
INSERT INTO `tbl_sublotserial` VALUES (11, 'DT META', 'L101', 'MFISERIAL2024042008370131762', '4', '1', '2024-04-23');
INSERT INTO `tbl_sublotserial` VALUES (12, 'DT META', 'L101', 'MFISERIAL2024042008370131763', '15', '1', '2024-04-23');
INSERT INTO `tbl_sublotserial` VALUES (13, 'DT META', 'CAV1', 'MFISERIAL202404221135275107', '13', '1', '2024-04-23');
INSERT INTO `tbl_sublotserial` VALUES (14, 'DT META', '110', 'MFISERIAL202404221507096044', '13', '1', '2024-04-24');
INSERT INTO `tbl_sublotserial` VALUES (15, 'DT META', '110', 'MFISERIAL202404241340203110', '23', '1', '2024-04-24');
INSERT INTO `tbl_sublotserial` VALUES (16, 'DT META', 'L101', 'MFISERIAL202404260927224076', '15', '1', '2024-04-26');
INSERT INTO `tbl_sublotserial` VALUES (17, 'DT META', 'CAV1', 'MFISERIAL202404260928583360', '13', '1', '2024-04-26');
INSERT INTO `tbl_sublotserial` VALUES (18, 'DT META', 'CAV1', 'MFISERIAL202404260929149801', '13', '1', '2024-04-26');

SET FOREIGN_KEY_CHECKS = 1;
