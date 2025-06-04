/*
 Navicat Premium Dump SQL

 Source Server         : dbtest
 Source Server Type    : MySQL
 Source Server Version : 90100 (9.1.0)
 Source Host           : localhost:3306
 Source Schema         : csdl_noithat2

 Target Server Type    : MySQL
 Target Server Version : 90100 (9.1.0)
 File Encoding         : 65001

 Date: 02/06/2025 17:19:49
*/
CREATE DATABASE csdl_noithat
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE csdl_noithat;

-- ----------------------------
-- Table structure for actions
-- ----------------------------
DROP TABLE IF EXISTS `actions`;
CREATE TABLE `actions`  (
  `actionID` int NOT NULL AUTO_INCREMENT,
  `actionName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`actionID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of actions
-- ----------------------------
INSERT INTO `actions` VALUES (1, 'view');
INSERT INTO `actions` VALUES (2, 'create');
INSERT INTO `actions` VALUES (3, 'update');
INSERT INTO `actions` VALUES (4, 'delete');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `categoryID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `thumbnail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`categoryID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('FCB', 'Full Combo', '');
INSERT INTO `category` VALUES ('FH', 'Full House', '');
INSERT INTO `category` VALUES ('GA', 'Ghế ăn', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtyN4C0FMwvUJ7leOvPd0Wtldsd0vJO9yPyg&s');
INSERT INTO `category` VALUES ('GN', 'Giường ngủ', '');
INSERT INTO `category` VALUES ('GSF', 'Ghế Sofa', 'https://mysofa.vn/wp-content/uploads/2019/12/ghe-sofa-boc-ni-mau-trang-phoi-mau-ghi.jpg');
INSERT INTO `category` VALUES ('HTB', 'Hệ tủ bếp', '');
INSERT INTO `category` VALUES ('LV-BLV', 'Bàn làm việc', 'https://hoaphatnoithat.net.vn/wp-content/uploads/2021/04/ban-lam-viec-at120shl3df.jpg');
INSERT INTO `category` VALUES ('ST', 'Signature ', '');
INSERT INTO `category` VALUES ('T', 'Tủ', 'https://bizweb.dktcdn.net/thumb/1024x1024/100/429/325/products/tu-giay-1-4x0-9.jpg?v=1667290809907');

-- ----------------------------
-- Table structure for contact
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact`  (
  `contactID` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `phoneNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `message` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `userID` int NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'pending',
  `sentTime` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `replyMessage` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `replyTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`contactID`) USING BTREE,
  INDEX `fk_contactuserforkey`(`userID` ASC) USING BTREE,
  CONSTRAINT `fk_contactuserforkey` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of contact
-- ----------------------------
INSERT INTO `contact` VALUES (4, 'A', '1231', 'abc@gmail.com', 'abc', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (5, 'A', '12311231231', 'abc@gmail.com', 'abc', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (6, 'A', '2342432342', 'nguyenvana@gmail.com', 'okelaa', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (7, 'A', '2342432342', 'nguyenvana@gmail.com', 'okelaa', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (44, 'fsdfa1', '1123123123', 'nguyenvana@gmail.com', '12', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (45, '2312', '123131231', 'nguyenvana@gmail.com', '312', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (46, 'adfas', '53224241', 'ta@gmail.c', 'gfd', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (47, 'adfas', '53224241', 'ta@gmail.c', 'gfd', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (48, 'adfas', '53224241', 'ta@gmail.c', 'gfd', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (49, 'adfas', '53224241', 'ta@gmail.c', 'gfd', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (50, 'gfsdg', '135232333', 'gdsfg#@gmail.c', 'gsdfgsgsdfgdfgs', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (51, 'gfsdg', '135232333', 'gdsfg#@gmail.c', 'gsdfgsgsdfgdfgs', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (52, 'safd', '1231231232', 'ta@gmail.c', 'afsdfas', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (53, 'adfas', '123123123', 'ta@gmail.c', '12323dsafds', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (54, 'adfas', '123123123', 'ta@gmail.c', '12323dsafds', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (55, 'adfas', '123123123', 'ta@gmail.c', '12313', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (56, 'adfas', '123123123', 'ta@gmail.c', '12313', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (57, 'adfas', '123123123', 'ta@gmail.c', '12313', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (58, 'adfas', '123123123', 'ta@gmail.c', '12313', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (59, 'adfas', '123123123', 'ta@gmail.c', '12313', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (60, 'adfas', '123123123', 'ta@gmail.c', '12313', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (61, 'adfas', '123123123', 'ta@gmail.c', '12313', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (62, 'adfas', '123123123', 'ta@gmail.c', '12313', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (63, 'adfas', '123123123', 'ta@gmail.c', '12313', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (64, 'adfas', '123123123', 'ta@gmail.c', '12313', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (65, 'adfas', '123123123', 'ta@gmail.c', '12313', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (66, 'gfsdg', '131231231', 'ta@gmail.c', '123', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (67, 'gfsdg', '12312312', 'ta@gmail.c', '12', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (68, 'gfsdg', '12312312', 'ta@gmail.c', '12', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (69, 'gfsdg', '12312312', 'ta@gmail.c', '12', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (70, 'gfsdg', '12312312', 'ta@gmail.c', '12', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (71, 'gfsdg', '12312312', 'ta@gmail.c', '12', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (72, 'gfsdg', '12312312', 'ta@gmail.c', '12', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (73, 'hhlkhkfa.sdnf', '1298349832', 'ta@gmail.c', 'nakjf', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (74, 'hansdklf', '293493290', 'gdsfg#@gmail.c', 'sdfad', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (75, 'hansdklf', '293493290', 'gdsfg#@gmail.c', 'sdfad', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (76, 'hansdklf', '293493290', 'gdsfg#@gmail.c', 'sdfad', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (77, 'gfsdg', '12312332', 'ta@gmail.c', '1', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (78, 'gfsdg', '12312332', 'ta@gmail.c', '1', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (79, 'gfsdg', '12312332', 'ta@gmail.c', '1', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (80, 'gfsdg', '12312332', 'ta@gmail.c', '1', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (81, 'gfsdg', '12312332', 'ta@gmail.c', '1', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (82, 'gfsdg', '12312332', 'ta@gmail.c', '1', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (83, 'gfsdg', '12312332', 'ta@gmail.c', '1', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (84, 'gfsdg', '12312332', 'ta@gmail.c', '1', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (85, 'gfsdg', '12312332', 'ta@gmail.c', '1', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (86, 'gfsdg', '12312332', 'ta@gmail.c', '1', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (87, 'gfsdg', '12312332', 'ta@gmail.c', '1', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (88, 'gfsdg', '12312332', 'ta@gmail.c', '1', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (89, 'gfsdg', '12312332', 'ta@gmail.c', '1', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (90, 'gfsdg', '12312332', 'ta@gmail.c', '1', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (91, 'gfsdg', '12312332', 'ta@gmail.c', '1', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (92, 'gfsdg', '12312332', 'ta@gmail.c', '1', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (93, 'gfsdg', '12312332', 'ta@gmail.c', '1', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (94, 'gfsdg', '12312332', 'ta@gmail.c', '1', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (95, 'gfsdg', '12312332', 'ta@gmail.c', '1', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (96, 'gfsdg', '12312332', 'ta@gmail.c', '1', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (97, 'gfsdg', '123123123', 'ta@gmail.c', 'fasd', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (98, 'gfsdg', '123123123', 'ta@gmail.c', 'fasd', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (99, 'gfsdg', '12312322', 'ta@gmail.c', '1', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (100, 'gfsdg', '12312322', 'ta@gmail.c', '1', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (101, 'gfsdg', '12312322', 'ta@gmail.c', '1', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (102, 'gfsdg', '12312322', 'ta@gmail.c', '1', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (103, 'gfsdg', '12312322', 'ta@gmail.c', '1', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (104, 'gfsdg', '12312322', 'ta@gmail.c', '1', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (105, 'gfsdg', '12312322', 'ta@gmail.c', '1', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (106, 'gfsdg', '12312322', 'ta@gmail.c', '1', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (107, 'dfsad', '12312312', 'ta@gmail.c', '543', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);
INSERT INTO `contact` VALUES (108, 'dfsad', '12312312', 'ta@gmail.c', '543', 11, 'pending', '2025-05-07 12:50:14', NULL, NULL);

-- ----------------------------
-- Table structure for features
-- ----------------------------
DROP TABLE IF EXISTS `features`;
CREATE TABLE `features`  (
  `featureID` int NOT NULL AUTO_INCREMENT,
  `featureName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `featureURL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`featureID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of features
-- ----------------------------
INSERT INTO `features` VALUES (1, 'Thống kê', 'dashboards');
INSERT INTO `features` VALUES (2, 'Quản lí tài khoản khách hàng', 'users');
INSERT INTO `features` VALUES (3, 'Báo cáo kho hàng', 'warehouseHistories');
INSERT INTO `features` VALUES (4, 'Quản lí tin tức', 'news');
INSERT INTO `features` VALUES (5, 'Quản lí liên hệ khách hàng', 'contacts');
INSERT INTO `features` VALUES (6, 'Quản lí bình luận', 'comments');
INSERT INTO `features` VALUES (7, 'Quản lí Log', 'logs');
INSERT INTO `features` VALUES (22, 'Quản lí sản phẩm', 'products');
INSERT INTO `features` VALUES (23, 'Quản lí đơn hàng', 'orders');
INSERT INTO `features` VALUES (24, 'Quản lí danh mục', 'categories');
INSERT INTO `features` VALUES (25, 'Quản lí nhập kho', 'inventories');
INSERT INTO `features` VALUES (26, 'Quản lí xuất kho', 'dispatches');
INSERT INTO `features` VALUES (27, 'Quản lí khuyến mãi', 'promotions');

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory`  (
  `productID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` int NULL DEFAULT NULL,
  PRIMARY KEY (`productID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES ('MD.CS-1M0', 355);
INSERT INTO `inventory` VALUES ('MD.CS-1M21', 381);
INSERT INTO `inventory` VALUES ('MD.CS50-1M0', 35);
INSERT INTO `inventory` VALUES ('MD.LX6NPN-1.8X2.0', 228);
INSERT INTO `inventory` VALUES ('MD.LXCOMFY-1M8(G3)', 240);
INSERT INTO `inventory` VALUES ('MD.LXGXT8N-1.8X2.0', 117);
INSERT INTO `inventory` VALUES ('MD.LXHY12N-1.8X2.0', 267);
INSERT INTO `inventory` VALUES ('MD.LXLACOIL-1.8X2.0', 183);
INSERT INTO `inventory` VALUES ('MD.LXRB10N-1.6X2.0', 112);
INSERT INTO `inventory` VALUES ('MFBNCB801.B16', 13);
INSERT INTO `inventory` VALUES ('MFBNCBD01.B16', 129);
INSERT INTO `inventory` VALUES ('MFBNCBD04.B12', 204);
INSERT INTO `inventory` VALUES ('MFBNCBD04.N12', 236);
INSERT INTO `inventory` VALUES ('MFBNCC601.A16', 165);
INSERT INTO `inventory` VALUES ('MFBNCC901.N16', 120);
INSERT INTO `inventory` VALUES ('MFBSCA501.B05', 106);
INSERT INTO `inventory` VALUES ('MFBSCA802.B05', 169);
INSERT INTO `inventory` VALUES ('MFBSCA802.N05', 125);
INSERT INTO `inventory` VALUES ('MFBSCAO02.N05', 120);
INSERT INTO `inventory` VALUES ('MFBSCB801.B55', 225);
INSERT INTO `inventory` VALUES ('MFBSCBD01.B06', 363);
INSERT INTO `inventory` VALUES ('MFBSCDN01.B04', 339);
INSERT INTO `inventory` VALUES ('MFCBCE601.BH12', 206);
INSERT INTO `inventory` VALUES ('MFCBCE601.BH13', 13);
INSERT INTO `inventory` VALUES ('MFCBCE601.BH3', 250);
INSERT INTO `inventory` VALUES ('MFCBCE601.BH5', 8);
INSERT INTO `inventory` VALUES ('MFCBCE601.BH7', 92);
INSERT INTO `inventory` VALUES ('MFCDCA901.B08', 37);
INSERT INTO `inventory` VALUES ('MFCDCA901.N08', 311);
INSERT INTO `inventory` VALUES ('MFDBCC801.B11', 240);
INSERT INTO `inventory` VALUES ('MFDBCCN02.B12', 267);
INSERT INTO `inventory` VALUES ('MFDCCAD07.N05', 215);
INSERT INTO `inventory` VALUES ('MFDCCC101.N05', 273);
INSERT INTO `inventory` VALUES ('MFDCCC103.N06', 320);
INSERT INTO `inventory` VALUES ('MFDCCC103.O05', 381);
INSERT INTO `inventory` VALUES ('MFDCCC104.O05', 141);
INSERT INTO `inventory` VALUES ('MFDCCCD04.B05', 368);
INSERT INTO `inventory` VALUES ('MFDCCCN01.G04', 214);
INSERT INTO `inventory` VALUES ('MFDCCCN01.N08', 367);
INSERT INTO `inventory` VALUES ('MFDCCD901.N05', 390);
INSERT INTO `inventory` VALUES ('MFDCCE301.B05', 49);
INSERT INTO `inventory` VALUES ('MFDTCA701.B09', 277);
INSERT INTO `inventory` VALUES ('MFDTCA701.B16', 37);
INSERT INTO `inventory` VALUES ('MFDTCBN01.B16', 155);
INSERT INTO `inventory` VALUES ('MFDTCC801.B16', 263);
INSERT INTO `inventory` VALUES ('MFDTCC802.N14', 51);
INSERT INTO `inventory` VALUES ('MFDTCE301.B16', 266);
INSERT INTO `inventory` VALUES ('MFDTSMLFYDC4.N12', 378);
INSERT INTO `inventory` VALUES ('MFDTSOLMLDC4.N14', 289);
INSERT INTO `inventory` VALUES ('MFDTSOLVBGDC6.N14', 313);
INSERT INTO `inventory` VALUES ('MFDTSVLBR1DB1.B16', 295);
INSERT INTO `inventory` VALUES ('MFDTSVLDC2.B09', 136);
INSERT INTO `inventory` VALUES ('MFDTSVLFYDC4.N16', 197);
INSERT INTO `inventory` VALUES ('MFFSSBELFAST43.06', 178);
INSERT INTO `inventory` VALUES ('MFFSSBOSTON355.06', 296);
INSERT INTO `inventory` VALUES ('MFFSSLENA102.06', 148);
INSERT INTO `inventory` VALUES ('MFLVSVLLOTG.B18', 253);
INSERT INTO `inventory` VALUES ('MFMTSVNMT1MR1.B10', 21);
INSERT INTO `inventory` VALUES ('MFMTSVNMT1MR1.N10', 147);
INSERT INTO `inventory` VALUES ('MFNKCC801.B12', 273);
INSERT INTO `inventory` VALUES ('MFNKCC802.N12', 120);
INSERT INTO `inventory` VALUES ('MFSCCC801.B14', 183);
INSERT INTO `inventory` VALUES ('MFSCCC901.B14', 155);
INSERT INTO `inventory` VALUES ('MFSCCE301.B16', 227);
INSERT INTO `inventory` VALUES ('MFSCCE302.B16', 271);
INSERT INTO `inventory` VALUES ('MFSHCBD01.B06', 270);
INSERT INTO `inventory` VALUES ('MFSHCBD01.N18', 139);
INSERT INTO `inventory` VALUES ('MFSHCBD02.B08', 284);
INSERT INTO `inventory` VALUES ('MFSHCBD03.B08', 204);
INSERT INTO `inventory` VALUES ('MFSNCB601.N20', 167);
INSERT INTO `inventory` VALUES ('MFSNCB701.K20', 222);
INSERT INTO `inventory` VALUES ('MFSNCB701.N20', 210);
INSERT INTO `inventory` VALUES ('MFSNCB901.C19', 383);
INSERT INTO `inventory` VALUES ('MFSNCC701.G20', 84);
INSERT INTO `inventory` VALUES ('MFSNCC801.B18', 73);
INSERT INTO `inventory` VALUES ('MFSNCC801.N18', 115);
INSERT INTO `inventory` VALUES ('MFSNCC802.B18', 353);
INSERT INTO `inventory` VALUES ('MFSNCC802.N18', 221);
INSERT INTO `inventory` VALUES ('MFSNCE301.B18', 45);
INSERT INTO `inventory` VALUES ('MFSNCE302.B18', 366);
INSERT INTO `inventory` VALUES ('MFSNCE701.B18', 91);
INSERT INTO `inventory` VALUES ('MFSNCE701.N16', 160);
INSERT INTO `inventory` VALUES ('MFSNCE702.N19', 126);
INSERT INTO `inventory` VALUES ('MFSNSVLLG14.B18', 151);
INSERT INTO `inventory` VALUES ('MFSSCB801.B06', 375);
INSERT INTO `inventory` VALUES ('MFSSCC201.N06', 222);
INSERT INTO `inventory` VALUES ('MFSSCC801.B06', 387);
INSERT INTO `inventory` VALUES ('MFSSCE301.B07', 64);
INSERT INTO `inventory` VALUES ('MFSTCA603.B10', 362);
INSERT INTO `inventory` VALUES ('MFSTCA603.N10', 15);
INSERT INTO `inventory` VALUES ('MFSTCB501.N06', 192);
INSERT INTO `inventory` VALUES ('MFSTCB501.N07', 113);
INSERT INTO `inventory` VALUES ('MFSTCB502.N06', 391);
INSERT INTO `inventory` VALUES ('MFSTCC902.B08', 12);
INSERT INTO `inventory` VALUES ('MFSTCE301.B09', 92);
INSERT INTO `inventory` VALUES ('MFSTSOL901.BST2', 23);
INSERT INTO `inventory` VALUES ('MFSTSV601.GW2', 239);
INSERT INTO `inventory` VALUES ('MFTCCA901.B16', 324);
INSERT INTO `inventory` VALUES ('MFTCCA901.N16', 101);
INSERT INTO `inventory` VALUES ('MFTCCB701.M18', 335);
INSERT INTO `inventory` VALUES ('MFTCCBN01.B16', 172);
INSERT INTO `inventory` VALUES ('MFTCCC702.K16', 255);
INSERT INTO `inventory` VALUES ('MFTCCDN01.B16', 359);
INSERT INTO `inventory` VALUES ('MFTCCE301.B18', 227);
INSERT INTO `inventory` VALUES ('MFTNCAO01.B11', 59);
INSERT INTO `inventory` VALUES ('MFTNCAO01.N11', 14);
INSERT INTO `inventory` VALUES ('MFWRBJN02.1205', 297);
INSERT INTO `inventory` VALUES ('MFWRCA505.B05', 239);
INSERT INTO `inventory` VALUES ('MFWRCA901.W05', 303);
INSERT INTO `inventory` VALUES ('MFWRCB801.B10', 400);
INSERT INTO `inventory` VALUES ('MFWRCBD01.B05', 288);
INSERT INTO `inventory` VALUES ('MFWRCBD03.M05', 241);
INSERT INTO `inventory` VALUES ('MFWRCD504.B05', 343);
INSERT INTO `inventory` VALUES ('MFWRCD505.W05', 188);
INSERT INTO `inventory` VALUES ('MFWRCD506.B10', 314);
INSERT INTO `inventory` VALUES ('MFWRCD701.B10', 204);
INSERT INTO `inventory` VALUES ('MFWRCD702.B05', 78);
INSERT INTO `inventory` VALUES ('MFWRCD703.B05', 179);
INSERT INTO `inventory` VALUES ('MFWRCD802.N05', 263);
INSERT INTO `inventory` VALUES ('MFWRCDD01.B05', 375);
INSERT INTO `inventory` VALUES ('MFWRCDD02.M10', 286);
INSERT INTO `inventory` VALUES ('MFWRCDD03.N05', 306);
INSERT INTO `inventory` VALUES ('MFWRHB301V2.BMH', 271);
INSERT INTO `inventory` VALUES ('MFWRHB301V2.BMS', 36);
INSERT INTO `inventory` VALUES ('MFWRHB301V2.BSH', 168);
INSERT INTO `inventory` VALUES ('MFWRHB301V2.BSMH', 333);
INSERT INTO `inventory` VALUES ('MFWRSV201V2.BMS', 360);
INSERT INTO `inventory` VALUES ('MFWRSVN201V2.BMS', 398);
INSERT INTO `inventory` VALUES ('MFWRSVN201V2.BSH', 111);
INSERT INTO `inventory` VALUES ('MFWRSVN201V2.MMH', 163);
INSERT INTO `inventory` VALUES ('MFWRSVN201V2.NSMH', 81);
INSERT INTO `inventory` VALUES ('MFWRSVNH201V2.MMS', 318);
INSERT INTO `inventory` VALUES ('MFWRSVNH201V2.MSH', 145);
INSERT INTO `inventory` VALUES ('MFWRSVNH201V2.NHM', 172);
INSERT INTO `inventory` VALUES ('MFWRSVNH201V2.NHMS', 26);
INSERT INTO `inventory` VALUES ('MHCBCD801.BG1', 13);
INSERT INTO `inventory` VALUES ('MHCBCD801.BG2', 389);
INSERT INTO `inventory` VALUES ('MHCBCD801.BG3', 305);
INSERT INTO `inventory` VALUES ('MHCBCD801.BG31', 356);
INSERT INTO `inventory` VALUES ('MHCBCD801.BG36', 62);
INSERT INTO `inventory` VALUES ('MHCBCD801.BG41', 47);
INSERT INTO `inventory` VALUES ('MHCBCD802.MG4', 49);
INSERT INTO `inventory` VALUES ('MHCBCD902.BN22', 105);
INSERT INTO `inventory` VALUES ('MHCBCD902.BN23', 377);
INSERT INTO `inventory` VALUES ('MHCBCD902.BN24', 370);
INSERT INTO `inventory` VALUES ('MHCBCD902.BN26', 316);
INSERT INTO `inventory` VALUES ('MHCBCD902.BN33', 72);
INSERT INTO `inventory` VALUES ('MHCBCD902.BN40', 214);
INSERT INTO `inventory` VALUES ('MHCBCD902.BN50', 53);
INSERT INTO `inventory` VALUES ('MHCBCD902.MN21', 22);
INSERT INTO `inventory` VALUES ('MHCBCD902.NN19', 355);
INSERT INTO `inventory` VALUES ('MHCBCD902.NN20', 103);
INSERT INTO `inventory` VALUES ('MHCBCD902.NN29', 255);
INSERT INTO `inventory` VALUES ('MHCBCD902.NN32', 164);
INSERT INTO `inventory` VALUES ('MHCBCD902.NN39', 53);
INSERT INTO `inventory` VALUES ('MHCBCD902.NN47', 176);
INSERT INTO `inventory` VALUES ('MHCBCDD01.BL1', 322);
INSERT INTO `inventory` VALUES ('MHCBCDD01.BL4', 278);
INSERT INTO `inventory` VALUES ('MHCBCDD02.BK1', 24);
INSERT INTO `inventory` VALUES ('MHCBCDD02.BK10', 90);
INSERT INTO `inventory` VALUES ('MHCBCDD02.BK12', 380);
INSERT INTO `inventory` VALUES ('MHCBCDD02.BK2', 23);
INSERT INTO `inventory` VALUES ('MHCBCDD02.BK3', 179);
INSERT INTO `inventory` VALUES ('MHCBCDD02.BK5', 24);
INSERT INTO `inventory` VALUES ('MHCBCDD02.BK7', 387);
INSERT INTO `inventory` VALUES ('MHCBCDN01.BU10', 258);
INSERT INTO `inventory` VALUES ('MHCBCDN01.BU34', 130);
INSERT INTO `inventory` VALUES ('MHCBCDN01.BU37', 279);
INSERT INTO `inventory` VALUES ('MHCBCDN01.BU43', 202);
INSERT INTO `inventory` VALUES ('MHCBCDN01.BU7', 174);
INSERT INTO `inventory` VALUES ('MHCBCDN01.BU8', 263);
INSERT INTO `inventory` VALUES ('MHCBCDN01.BU9', 392);
INSERT INTO `inventory` VALUES ('MHCBCDN01.NU13', 369);
INSERT INTO `inventory` VALUES ('MHCBCDN01.NU14', 269);
INSERT INTO `inventory` VALUES ('MHCBCDN01.NU15', 237);
INSERT INTO `inventory` VALUES ('MHCBCDN01.NU16', 379);
INSERT INTO `inventory` VALUES ('MHCBCDN01.NU35', 383);
INSERT INTO `inventory` VALUES ('MHCBCDN01.NU38', 379);
INSERT INTO `inventory` VALUES ('MHCBCDN01.NU44', 345);
INSERT INTO `inventory` VALUES ('MKGBCCDD01.B15', 188);
INSERT INTO `inventory` VALUES ('MKGPCCDD05.M15', 305);
INSERT INTO `inventory` VALUES ('MKGSCCDD04.M15', 161);
INSERT INTO `inventory` VALUES ('MKNBCCDD01.N15', 290);
INSERT INTO `inventory` VALUES ('MKNPCCDD05.M15', 166);
INSERT INTO `inventory` VALUES ('MKNSCCDD04.M15', 360);
INSERT INTO `inventory` VALUES ('MKUBCCDD01.N15', 99);
INSERT INTO `inventory` VALUES ('MKUPCCDD05.M15', 220);
INSERT INTO `inventory` VALUES ('MKUSCCDD04.M15', 2);

-- ----------------------------
-- Table structure for inventory_history
-- ----------------------------
DROP TABLE IF EXISTS `inventory_history`;
CREATE TABLE `inventory_history`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `productID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `change_type` enum('receipt','issue') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `related_id` int NULL DEFAULT NULL,
  `quantity_change` int NULL DEFAULT NULL,
  `new_quantity` int NULL DEFAULT NULL,
  `change_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `changed_by` int NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `productID`(`productID`) USING BTREE,
  INDEX `changed_by`(`changed_by`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of inventory_history
-- ----------------------------
INSERT INTO `inventory_history` VALUES (1, 'MD.CS50-1M0', 'receipt', 7, 1, 34, '2025-05-02 16:15:07', 11, '1');
INSERT INTO `inventory_history` VALUES (2, 'MD.CS-1M21', 'receipt', 8, 1, 381, '2025-05-02 16:15:48', 11, 'ãâx');
INSERT INTO `inventory_history` VALUES (3, 'MD.CS50-1M0', 'receipt', 9, 1, 35, '2025-05-02 16:16:33', 11, 'wèwe');

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs`  (
  `logID` int NOT NULL AUTO_INCREMENT,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `userID` int NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `beforeData` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `afterData` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`logID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 154 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO `logs` VALUES (111, 'infor', 15, '2025-05-28 23:14:28', 'Đăng nhập', 'Chưa đăng nhập', 'Đăng nhập thành công với tài khoản Người Quản Trị');
INSERT INTO `logs` VALUES (6, 'alert', 0, '2025-03-21 00:00:00', 'Đăng nhập', 'Email tai111@gmail.co not exist attempted to login', 'Login fail, tai111@gmail.co not exist');
INSERT INTO `logs` VALUES (4, 'alert', 0, '2025-03-21 00:00:00', 'Đăng nhập', 'tai111@gmail.comis attempted to login', 'tai111@gmail.comis login successful with role user');
INSERT INTO `logs` VALUES (109, 'infor', 15, '2025-05-28 22:59:42', 'Đăng nhập', 'Chưa đăng nhập', 'Đăng nhập thành công');
INSERT INTO `logs` VALUES (8, 'alert', 0, '2025-03-23 00:00:00', 'Đăng nhập', 'tai111@gmail.com đang thực hiện đăng nhập', 'Đăng nhập thất bại, mật khẩu không chính xác');
INSERT INTO `logs` VALUES (107, 'infor', 15, '2025-05-28 22:58:46', 'Đăng nhập', 'Chưa đăng nhập', 'Đăng nhập thành công');
INSERT INTO `logs` VALUES (108, 'infor', 15, '2025-05-28 22:59:09', 'Đăng xuất', 'Còn lưu tài khoản ở Session', 'Session được xóa và thoát tài khoản');
INSERT INTO `logs` VALUES (10, 'alert', 0, '2025-03-23 00:00:00', 'Đăng nhập', 'tai111@gmail.com đang thực hiện đăng nhập', 'tai111@gmail.com đăng nhập thành công với vai trò user');
INSERT INTO `logs` VALUES (11, 'infor', 11, '2025-03-23 00:00:00', 'Bình luận', '11 đang thực hiện thực bình luận với productId MD.LXGXT8N-1.8X2.0', 'bình luận thất bại do user chưa mua sản phẩm');
INSERT INTO `logs` VALUES (12, 'infor', 11, '2025-03-23 00:00:00', 'Bình luận', '11 đang thực hiện thực bình luận với productId MHCBCDD02.BK5', ' bình luận thành công  MHCBCDD02.BK5 với nội dung test log');
INSERT INTO `logs` VALUES (110, 'infor', 15, '2025-05-28 22:59:56', 'Thay đổi mật khẩu', 'Thay đổi mật khẩu', 'Hệ thống bắt đầu gửi mail');
INSERT INTO `logs` VALUES (14, 'alert', 11, '2025-03-23 00:00:00', 'Liên hệ', '11 đang thực hiện bình luận ', 'bình luận thành công với nội dung gfd');
INSERT INTO `logs` VALUES (15, 'alert', 11, '2025-03-23 00:00:00', 'Liên hệ', '11 đang thực hiện bình luận ', 'bình luận thành công với nội dung gfd');
INSERT INTO `logs` VALUES (16, 'alert', 11, '2025-03-23 00:00:00', 'Liên hệ', '11 đang thực hiện bình luận ', 'bình luận thành công với nội dung gfd');
INSERT INTO `logs` VALUES (17, 'infor', 11, '2025-03-23 00:00:00', 'Mua hàng', '11 đang thực hiện mua hàng ', 'mua thành công với mã đơn hàng 68');
INSERT INTO `logs` VALUES (18, 'alert', 0, '2025-03-26 00:00:00', 'Đăng nhập', 'tai111@gmail.com đang thực hiện đăng nhập', 'tai111@gmail.com đăng nhập thành công với vai trò user');
INSERT INTO `logs` VALUES (19, 'alert', 0, '2025-03-26 00:00:00', 'Đăng nhập', 'tai111@gmail.com đang thực hiện đăng nhập', 'tai111@gmail.com đăng nhập thành công với vai trò user');
INSERT INTO `logs` VALUES (20, 'infor', 11, '2025-03-26 00:00:00', 'Mua hàng', 'UserId : 11 đang thực hiện mua hàng ', 'mua thành công với mã đơn hàng 69');
INSERT INTO `logs` VALUES (21, 'infor', 11, '2025-03-26 00:00:00', 'Mua hàng', 'UserId : 11 đang thực hiện mua hàng ', 'mua thành công với mã đơn hàng 70');
INSERT INTO `logs` VALUES (22, 'alert', 0, '2025-03-26 00:00:00', 'Đăng nhập', 'tai111@gmail.com đang thực hiện đăng nhập', 'tai111@gmail.com đăng nhập thành công với vai trò user');
INSERT INTO `logs` VALUES (23, 'alert', 0, '2025-03-29 00:00:00', 'Đăng nhập', 'tai111@gmail.com đang thực hiện đăng nhập', 'tai111@gmail.com đăng nhập thành công với vai trò user');
INSERT INTO `logs` VALUES (24, 'alert', 0, '2025-03-29 00:00:00', 'Đăng nhập', 'tai111@gmail.com đang thực hiện đăng nhập', 'tai111@gmail.com đăng nhập thành công với vai trò user');
INSERT INTO `logs` VALUES (25, 'alert', 0, '2025-03-29 00:00:00', 'Đăng nhập', 'tai111@gmail.com đang thực hiện đăng nhập', 'tai111@gmail.com đăng nhập thành công với vai trò user');
INSERT INTO `logs` VALUES (26, 'alert', 0, '2025-03-29 00:00:00', 'Đăng nhập', 'tai111@gmail.com đang thực hiện đăng nhập', 'tai111@gmail.com đăng nhập thành công với vai trò user');
INSERT INTO `logs` VALUES (27, 'alert', 0, '2025-03-29 00:00:00', 'Đăng nhập', 'tai111@gmail.com đang thực hiện đăng nhập', 'tai111@gmail.com đăng nhập thành công với vai trò user');
INSERT INTO `logs` VALUES (28, 'alert', 0, '2025-03-29 00:00:00', 'Đăng nhập', 'tai111@gmail.com đang thực hiện đăng nhập', 'tai111@gmail.com đăng nhập thành công với vai trò user');
INSERT INTO `logs` VALUES (29, 'alert', 0, '2025-03-30 00:00:00', 'Đăng nhập', 'tai111@gmail.com đang thực hiện đăng nhập', 'tai111@gmail.com đăng nhập thành công với vai trò user');
INSERT INTO `logs` VALUES (30, 'alert', 0, '2025-03-30 00:00:00', 'Đăng nhập', 'tai111@gmail.com đang thực hiện đăng nhập', 'tai111@gmail.com đăng nhập thành công với vai trò user');
INSERT INTO `logs` VALUES (31, 'alert', 0, '2025-03-30 00:00:00', 'Đăng nhập', 'tai111@gmail.com đang thực hiện đăng nhập', 'tai111@gmail.com đăng nhập thành công với vai trò user');
INSERT INTO `logs` VALUES (32, 'alert', 0, '2025-03-30 00:00:00', 'Đăng nhập', 'tai111@gmail.com đang thực hiện đăng nhập', 'tai111@gmail.com đăng nhập thành công với vai trò user');
INSERT INTO `logs` VALUES (33, 'alert', 0, '2025-03-30 00:00:00', 'Đăng nhập', 'tai111@gmail.com đang thực hiện đăng nhập', 'tai111@gmail.com đăng nhập thành công với vai trò user');
INSERT INTO `logs` VALUES (34, 'alert', 0, '2025-03-30 00:00:00', 'Đăng nhập', 'tai111@gmail.com đang thực hiện đăng nhập', 'tai111@gmail.com đăng nhập thành công với vai trò user');
INSERT INTO `logs` VALUES (35, 'alert', 0, '2025-03-30 00:00:00', 'Đăng nhập', 'tai111@gmail.com đang thực hiện đăng nhập', 'tai111@gmail.com đăng nhập thành công với vai trò user');
INSERT INTO `logs` VALUES (36, 'infor', 11, '2025-03-30 00:00:00', 'Mua hàng', 'UserId : 11 đang thực hiện mua hàng ', 'mua thành công với mã đơn hàng 71');
INSERT INTO `logs` VALUES (37, 'alert', 0, '2025-03-30 00:00:00', 'Đăng nhập', 'tai111@gmail.com đang thực hiện đăng nhập', 'tai111@gmail.com đăng nhập thành công với vai trò user');
INSERT INTO `logs` VALUES (38, 'alert', 0, '2025-03-30 00:00:00', 'Đăng nhập', 'tai111@gmail.com đang thực hiện đăng nhập', 'tai111@gmail.com đăng nhập thành công với vai trò user');
INSERT INTO `logs` VALUES (39, 'alert', 0, '2025-04-01 00:00:00', 'Đăng nhập', 'tai111@gmail.com đang thực hiện đăng nhập', 'tai111@gmail.com đăng nhập thành công với vai trò user');
INSERT INTO `logs` VALUES (40, 'alert', 0, '2025-04-01 00:00:00', 'Đăng nhập', 'tai111@gmail.com đang thực hiện đăng nhập', 'tai111@gmail.com đăng nhập thành công với vai trò user');
INSERT INTO `logs` VALUES (41, 'alert', 11, '2025-04-01 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung gsdfgsgsdfgdfgs');
INSERT INTO `logs` VALUES (42, 'alert', 11, '2025-04-01 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung gsdfgsgsdfgdfgs');
INSERT INTO `logs` VALUES (43, 'infor', 11, '2025-04-03 00:00:00', 'Mua hàng', 'UserId : 11 đang thực hiện mua hàng ', 'mua thành công với mã đơn hàng 72');
INSERT INTO `logs` VALUES (44, 'infor', 11, '2025-04-03 00:00:00', 'Mua hàng', 'UserId : 11 đang thực hiện mua hàng ', 'mua thành công với mã đơn hàng 73');
INSERT INTO `logs` VALUES (45, 'infor', 11, '2025-04-03 00:00:00', 'Mua hàng', 'UserId : 11 đang thực hiện mua hàng ', 'mua thành công với mã đơn hàng 74');
INSERT INTO `logs` VALUES (46, 'infor', 11, '2025-04-03 00:00:00', 'Mua hàng', 'UserId : 11 đang thực hiện mua hàng ', 'mua thành công với mã đơn hàng 75');
INSERT INTO `logs` VALUES (47, 'infor', 11, '2025-04-03 00:00:00', 'Mua hàng', 'UserId : 11 đang thực hiện mua hàng ', 'mua thành công với mã đơn hàng 76');
INSERT INTO `logs` VALUES (48, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung afsdfas');
INSERT INTO `logs` VALUES (49, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 12323dsafds');
INSERT INTO `logs` VALUES (50, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 12323dsafds');
INSERT INTO `logs` VALUES (51, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 12313');
INSERT INTO `logs` VALUES (52, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 12313');
INSERT INTO `logs` VALUES (53, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 12313');
INSERT INTO `logs` VALUES (54, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 12313');
INSERT INTO `logs` VALUES (55, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 12313');
INSERT INTO `logs` VALUES (56, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 12313');
INSERT INTO `logs` VALUES (57, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 12313');
INSERT INTO `logs` VALUES (58, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 12313');
INSERT INTO `logs` VALUES (59, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 12313');
INSERT INTO `logs` VALUES (60, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 12313');
INSERT INTO `logs` VALUES (61, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 12313');
INSERT INTO `logs` VALUES (62, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 123');
INSERT INTO `logs` VALUES (63, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 12');
INSERT INTO `logs` VALUES (64, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 12');
INSERT INTO `logs` VALUES (65, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 12');
INSERT INTO `logs` VALUES (66, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 12');
INSERT INTO `logs` VALUES (67, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 12');
INSERT INTO `logs` VALUES (68, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 12');
INSERT INTO `logs` VALUES (69, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung nakjf');
INSERT INTO `logs` VALUES (70, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung sdfad');
INSERT INTO `logs` VALUES (71, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung sdfad');
INSERT INTO `logs` VALUES (72, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung sdfad');
INSERT INTO `logs` VALUES (73, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 1');
INSERT INTO `logs` VALUES (74, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 1');
INSERT INTO `logs` VALUES (75, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 1');
INSERT INTO `logs` VALUES (76, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 1');
INSERT INTO `logs` VALUES (77, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 1');
INSERT INTO `logs` VALUES (78, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 1');
INSERT INTO `logs` VALUES (79, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 1');
INSERT INTO `logs` VALUES (80, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 1');
INSERT INTO `logs` VALUES (81, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 1');
INSERT INTO `logs` VALUES (82, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 1');
INSERT INTO `logs` VALUES (83, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 1');
INSERT INTO `logs` VALUES (84, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 1');
INSERT INTO `logs` VALUES (85, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 1');
INSERT INTO `logs` VALUES (86, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 1');
INSERT INTO `logs` VALUES (87, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 1');
INSERT INTO `logs` VALUES (88, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 1');
INSERT INTO `logs` VALUES (89, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 1');
INSERT INTO `logs` VALUES (90, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 1');
INSERT INTO `logs` VALUES (91, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 1');
INSERT INTO `logs` VALUES (92, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 1');
INSERT INTO `logs` VALUES (93, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung fasd');
INSERT INTO `logs` VALUES (94, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung fasd');
INSERT INTO `logs` VALUES (95, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 1');
INSERT INTO `logs` VALUES (96, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 1');
INSERT INTO `logs` VALUES (97, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 1');
INSERT INTO `logs` VALUES (98, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 1');
INSERT INTO `logs` VALUES (99, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 1');
INSERT INTO `logs` VALUES (100, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 1');
INSERT INTO `logs` VALUES (101, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 1');
INSERT INTO `logs` VALUES (102, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 1');
INSERT INTO `logs` VALUES (103, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 543');
INSERT INTO `logs` VALUES (104, 'alert', 11, '2025-04-03 00:00:00', 'Liên hệ', 'UserId : 11 đang thực hiện bình luận ', 'bình luận thành công với nội dung 543');
INSERT INTO `logs` VALUES (105, 'infor', 11, '2025-04-04 00:00:00', 'Mua hàng', 'UserId : 11 đang thực hiện mua hàng ', 'mua thành công với mã đơn hàng 77');
INSERT INTO `logs` VALUES (106, 'infor', 11, '2025-04-04 00:00:00', 'Mua hàng', 'UserId : 11 đang thực hiện mua hàng ', 'mua thành công với mã đơn hàng 78');
INSERT INTO `logs` VALUES (112, 'infor', 15, '2025-05-28 23:15:08', 'Đăng nhập', 'Chưa đăng nhập', 'Đăng nhập thành công với tài khoản Người Quản Trị');
INSERT INTO `logs` VALUES (113, 'infor', 15, '2025-05-28 23:15:47', 'Đăng nhập', 'Chưa đăng nhập', 'Đăng nhập thành công với tài khoản Người Quản Trị');
INSERT INTO `logs` VALUES (114, 'infor', 15, '2025-05-28 23:17:02', 'Đăng nhập', 'Chưa đăng nhập', 'Đăng nhập thành công với tài khoản Người Quản Trị');
INSERT INTO `logs` VALUES (115, 'infor', 15, '2025-05-28 23:19:52', 'Đăng nhập', 'Chưa đăng nhập', 'Đăng nhập thành công với tài khoản Người Quản Trị');
INSERT INTO `logs` VALUES (116, 'infor', 15, '2025-05-28 23:22:27', 'Đăng nhập', 'Chưa đăng nhập', 'Đăng nhập thành công với tài khoản Người Quản Trị');
INSERT INTO `logs` VALUES (117, 'infor', 15, '2025-05-28 23:25:50', 'Đăng nhập', 'Chưa đăng nhập', 'Đăng nhập thành công với tài khoản Người Quản Trị');
INSERT INTO `logs` VALUES (118, 'warning', 15, '2025-05-28 23:30:39', 'Đăng nhập', 'Tài khoản bị khóa', 'Vẫn đăng nhập lại khi tài khoản bị khóa');
INSERT INTO `logs` VALUES (119, 'warning', 15, '2025-05-28 23:31:07', 'Đăng nhập', 'Tài khoản chờ kích hoạt ', 'Vẫn đăng nhập lại khi tài khoản đang chờ kích hoạt');
INSERT INTO `logs` VALUES (120, 'warning', 28, '2025-05-29 22:43:14', 'Kiểm tra Tokens khi kích hoạt với tài khoản NGƯỜI QUẢN TRỊ', 'Nhận tokens', 'Tokens hợp lệ, chuyển sang trang nhập mật khẩu');
INSERT INTO `logs` VALUES (121, 'warning', 29, '2025-05-29 22:56:08', 'Kiểm tra Tokens khi kích hoạt với tài khoản NGƯỜI QUẢN TRỊ', 'Nhận tokens', 'Tokens hợp lệ, chuyển sang trang nhập mật khẩu');
INSERT INTO `logs` VALUES (122, 'warning', 30, '2025-05-29 23:00:00', 'Kiểm tra Tokens khi kích hoạt với tài khoản NGƯỜI QUẢN TRỊ', 'Nhận tokens', 'Tokens hợp lệ, chuyển sang trang nhập mật khẩu');
INSERT INTO `logs` VALUES (123, 'warning', 30, '2025-05-29 23:09:56', 'Kiểm tra Tokens khi kích hoạt với tài khoản NGƯỜI QUẢN TRỊ', 'Nhận tokens', 'Tokens hợp lệ, chuyển sang trang nhập mật khẩu');
INSERT INTO `logs` VALUES (124, 'warning', 30, '2025-05-29 23:10:21', 'Kiểm tra Tokens khi kích hoạt với tài khoản NGƯỜI QUẢN TRỊ', 'Nhận tokens', 'Tokens hợp lệ, chuyển sang trang nhập mật khẩu');
INSERT INTO `logs` VALUES (125, 'warning', 30, '2025-05-29 23:10:39', 'Kiểm tra Tokens khi kích hoạt với tài khoản NGƯỜI QUẢN TRỊ', 'Nhận tokens', 'Tokens hợp lệ, chuyển sang trang nhập mật khẩu');
INSERT INTO `logs` VALUES (126, 'warning', 30, '2025-05-29 23:11:49', 'Kiểm tra Tokens khi kích hoạt với tài khoản NGƯỜI QUẢN TRỊ', 'Nhận tokens', 'Tokens hợp lệ, chuyển sang trang nhập mật khẩu');
INSERT INTO `logs` VALUES (127, 'warning', 30, '2025-05-30 00:05:01', 'Kiểm tra Tokens khi kích hoạt với tài khoản NGƯỜI QUẢN TRỊ', 'Nhận tokens', 'Tokens hợp lệ, chuyển sang trang nhập mật khẩu');
INSERT INTO `logs` VALUES (128, 'warning', 30, '2025-05-30 00:07:05', 'Kiểm tra Tokens khi kích hoạt với tài khoản NGƯỜI QUẢN TRỊ', 'Nhận tokens', 'Tokens hợp lệ, chuyển sang trang nhập mật khẩu');
INSERT INTO `logs` VALUES (129, 'warning', 30, '2025-05-30 00:08:03', 'Kiểm tra Tokens khi kích hoạt với tài khoản NGƯỜI QUẢN TRỊ', 'Nhận tokens', 'Tokens hợp lệ, chuyển sang trang nhập mật khẩu');
INSERT INTO `logs` VALUES (130, 'warning', 30, '2025-05-30 00:08:20', 'Kiểm tra Tokens khi kích hoạt với tài khoản NGƯỜI QUẢN TRỊ', 'Nhận tokens', 'Tokens hợp lệ, chuyển sang trang nhập mật khẩu');
INSERT INTO `logs` VALUES (131, 'warning', 30, '2025-05-30 00:09:15', 'Kiểm tra Tokens khi kích hoạt với tài khoản NGƯỜI QUẢN TRỊ', 'Nhận tokens', 'Tokens hợp lệ, chuyển sang trang nhập mật khẩu');
INSERT INTO `logs` VALUES (132, 'warning', 30, '2025-05-30 00:10:10', 'Kiểm tra Tokens khi kích hoạt với tài khoản NGƯỜI QUẢN TRỊ', 'Nhận tokens', 'Tokens hợp lệ, chuyển sang trang nhập mật khẩu');
INSERT INTO `logs` VALUES (133, 'warning', 30, '2025-05-30 00:12:11', 'Kiểm tra Tokens khi kích hoạt với tài khoản NGƯỜI QUẢN TRỊ', 'Nhận tokens', 'Tokens hợp lệ, chuyển sang trang nhập mật khẩu');
INSERT INTO `logs` VALUES (134, 'warning', 30, '2025-05-30 00:12:51', 'Kiểm tra Tokens khi kích hoạt với tài khoản NGƯỜI QUẢN TRỊ', 'Nhận tokens', 'Tokens hợp lệ, chuyển sang trang nhập mật khẩu');
INSERT INTO `logs` VALUES (135, 'warning', 30, '2025-05-30 00:16:47', 'Kiểm tra Tokens khi kích hoạt với tài khoản NGƯỜI QUẢN TRỊ', 'Nhận tokens', 'Tokens hợp lệ, chuyển sang trang nhập mật khẩu');
INSERT INTO `logs` VALUES (136, 'warning', 30, '2025-05-30 00:20:53', 'Kiểm tra Tokens khi kích hoạt với tài khoản NGƯỜI QUẢN TRỊ', 'Nhận tokens', 'Tokens hợp lệ, chuyển sang trang nhập mật khẩu');
INSERT INTO `logs` VALUES (137, 'warning', 30, '2025-05-30 00:22:09', 'Kiểm tra Tokens khi kích hoạt với tài khoản NGƯỜI QUẢN TRỊ', 'Nhận tokens', 'Tokens hợp lệ, chuyển sang trang nhập mật khẩu');
INSERT INTO `logs` VALUES (138, 'warning', 30, '2025-05-30 00:24:03', 'Kiểm tra Tokens khi kích hoạt với tài khoản NGƯỜI QUẢN TRỊ', 'Nhận tokens', 'Tokens hợp lệ, chuyển sang trang nhập mật khẩu');
INSERT INTO `logs` VALUES (139, 'warning', 30, '2025-05-30 00:24:40', 'Kiểm tra Tokens khi kích hoạt với tài khoản NGƯỜI QUẢN TRỊ', 'Nhận tokens', 'Tokens hợp lệ, chuyển sang trang nhập mật khẩu');
INSERT INTO `logs` VALUES (140, 'warning', 30, '2025-05-30 00:32:51', 'Kiểm tra Tokens khi kích hoạt với tài khoản NGƯỜI QUẢN TRỊ', 'Nhận tokens', 'Tokens hợp lệ, chuyển sang trang nhập mật khẩu');
INSERT INTO `logs` VALUES (141, 'warning', 30, '2025-05-30 00:34:59', 'Kiểm tra Tokens khi kích hoạt với tài khoản NGƯỜI QUẢN TRỊ', 'Nhận tokens', 'Tokens hợp lệ, chuyển sang trang nhập mật khẩu');
INSERT INTO `logs` VALUES (142, 'warning', 30, '2025-05-30 00:35:30', 'Kiểm tra Tokens khi kích hoạt với tài khoản NGƯỜI QUẢN TRỊ', 'Nhận tokens', 'Tokens hợp lệ, chuyển sang trang nhập mật khẩu');
INSERT INTO `logs` VALUES (143, 'warning', 30, '2025-05-30 00:45:29', 'Kiểm tra Tokens khi kích hoạt với tài khoản NGƯỜI QUẢN TRỊ', 'Nhận tokens', 'Tokens hợp lệ, chuyển sang trang nhập mật khẩu');
INSERT INTO `logs` VALUES (144, 'warning', 30, '2025-05-31 17:05:02', 'Kiểm tra Tokens khi kích hoạt với tài khoản NGƯỜI QUẢN TRỊ', 'Nhận tokens', 'Tokens hợp lệ, chuyển sang trang nhập mật khẩu');
INSERT INTO `logs` VALUES (145, 'infor', 30, '2025-06-01 23:11:39', 'Đăng nhập', 'Chưa đăng nhập', 'Đăng nhập thành công với tài khoản Người Quản Trị');
INSERT INTO `logs` VALUES (146, 'infor', 30, '2025-06-01 23:16:46', 'Đăng nhập', 'Chưa đăng nhập', 'Đăng nhập thành công với tài khoản Người Quản Trị');
INSERT INTO `logs` VALUES (147, 'infor', 30, '2025-06-01 23:21:14', 'Đăng nhập', 'Chưa đăng nhập', 'Đăng nhập thành công với tài khoản Người Quản Trị');
INSERT INTO `logs` VALUES (148, 'infor', 30, '2025-06-01 23:22:48', 'Đăng nhập', 'Chưa đăng nhập', 'Đăng nhập thành công với tài khoản Người Quản Trị');
INSERT INTO `logs` VALUES (149, 'infor', 30, '2025-06-01 23:24:44', 'Đăng nhập', 'Chưa đăng nhập', 'Đăng nhập thành công với tài khoản Người Quản Trị');
INSERT INTO `logs` VALUES (150, 'infor', 30, '2025-06-01 23:41:00', 'Đăng nhập', 'Chưa đăng nhập', 'Đăng nhập thành công với tài khoản Người Quản Trị');
INSERT INTO `logs` VALUES (151, 'infor', 11, '2025-06-02 14:19:39', 'Đăng nhập', 'Chưa đăng nhập', 'Đăng nhập thành công với tài khoản Người Quản Trị');
INSERT INTO `logs` VALUES (152, 'infor', 11, '2025-06-02 14:35:07', 'Đăng nhập', 'Chưa đăng nhập', 'Đăng nhập thành công với tài khoản Người Quản Trị');
INSERT INTO `logs` VALUES (153, 'infor', 11, '2025-06-02 14:41:48', 'Đăng nhập', 'Chưa đăng nhập', 'Đăng nhập thành công với tài khoản Người Quản Trị');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `newsID` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `createAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `thumbnail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `newsTypeID` int NOT NULL,
  PRIMARY KEY (`newsID`) USING BTREE,
  INDEX `FK_news_newstype`(`newsTypeID` ASC) USING BTREE,
  CONSTRAINT `FK_news_newstype` FOREIGN KEY (`newsTypeID`) REFERENCES `newstype` (`newsTypeID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (37, 'Ngủ ngon say giấc cùng Baya 2025', '<p style=\"text-align:center\"><span style=\"font-size:18px\"><span style=\"color:#c0392b\"><strong>NHỮNG XU HƯỚNG NỘI THẤT NỔI BẬT NĂM 2024</strong></span></span></p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-size:18px\"><span style=\"color:#c0392b\"><strong><img alt=\"\" src=\"https://i1-vnexpress.vnecdn.net/2023/12/30/A-nh-chu-p-Ma-n-hi-nh-2023-12-2703-5860-1703953571.png?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=RlQD3KcQfo8O3lpZDnYAXQ\" style=\"height:1072px; width:900px\" /></strong></span></span></p>\r\n\r\n<p>Gam m&agrave;u ngọt ng&agrave;o của những quả đ&agrave;o v&agrave; mơ ch&iacute;n - Peach Fuzz - được Viện m&agrave;u sắc Pantone (trụ sở ch&iacute;nh tại Mỹ) b&igrave;nh chọn l&agrave; m&agrave;u sắc của năm. Gi&aacute;m đốc điều h&agrave;nh của đơn vị n&agrave;y c&ograve;n m&ocirc; tả gam m&agrave;u n&agrave;y nổi bật bởi sự rạng rỡ, ấm &aacute;p, sang trọng v&agrave; hiện đại.</p>\r\n\r\n<p>B&ecirc;n cạnh đ&oacute;, Gemma Riberti, người đứng đầu bộ phận nội thất tại WGSN - c&ocirc;ng ty to&agrave;n cầu về dự b&aacute;o xu hướng ti&ecirc;u d&ugrave;ng, phong c&aacute;ch sống v&agrave; thiết kế sản phẩm - lại d&agrave;nh sự quan t&acirc;m đến tone m&agrave;u cam. L&yacute; do bởi đ&acirc;y l&agrave; &quot;nguồn năng lượng tươi s&aacute;ng trong lĩnh vực chăm s&oacute;c sức khỏe&quot;, ph&ugrave; hợp để thay thế c&aacute;c m&agrave;u truyền thống.</p>\r\n\r\n<p>M&agrave;u quả mơ ch&iacute;n c&oacute; thể dễ d&agrave;ng kết hợp với c&aacute;c m&agrave;u trung t&iacute;nh v&agrave; tự nhi&ecirc;n, th&ocirc;ng qua c&aacute;c sản phẩm nội thất từ dệt may thủ c&ocirc;ng, thủy tinh, bố tr&iacute; trong ph&ograve;ng tắm v&agrave; ph&ograve;ng ngủ. Ngo&agrave;i ra, tone cam kết hợp c&ugrave;ng xanh l&aacute; c&acirc;y, t&iacute;m v&agrave; xanh lam cũng tạo độ tương phản sống động cho kh&ocirc;ng gian.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n', '2025-01-09 10:15:41', 'https://theme.hstatic.net/200000796751/1001266995/14/homebanner_1_img.jpg?v=82\r\n', 1);
INSERT INTO `news` VALUES (38, 'Tin tức 1222', 'áđâsfàà', '2025-05-17 21:38:03', 'https://cdn-media.sforum.vn/storage/app/media/anh-dep-16.jpg', 2);
INSERT INTO `news` VALUES (49, '12', '1', '2025-05-21 22:04:55', '12', 1);
INSERT INTO `news` VALUES (50, '12', '1', '2025-05-21 22:04:55', '12', 1);
INSERT INTO `news` VALUES (51, '12', '1', '2025-05-21 22:04:55', '12', 1);
INSERT INTO `news` VALUES (52, '12', '1', '2025-05-21 22:05:02', '12', 1);
INSERT INTO `news` VALUES (53, '12', '1', '2025-05-21 22:05:05', '12', 1);
INSERT INTO `news` VALUES (55, '12', '1', '2025-05-21 22:05:36', '12', 2);

-- ----------------------------
-- Table structure for newstype
-- ----------------------------
DROP TABLE IF EXISTS `newstype`;
CREATE TABLE `newstype`  (
  `newsTypeID` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`newsTypeID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of newstype
-- ----------------------------
INSERT INTO `newstype` VALUES (1, 'Bài viết bình thường', 'Không có nội dung');
INSERT INTO `newstype` VALUES (2, 'Bài viết quảng cáo', 'Quảng cáo sản phẩm');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `orderID` int NOT NULL,
  `productID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` int NOT NULL,
  `totalPrice` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`orderID`, `productID`) USING BTREE,
  INDEX `ProductID`(`productID` ASC) USING BTREE,
  CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (46, 'MHCBCDD02.BK5', 1, 11736300.00);
INSERT INTO `order_detail` VALUES (46, 'MHCBCDD02.BK7', 1, 6516300.00);
INSERT INTO `order_detail` VALUES (47, 'MHCBCDD02.BK5', 1, 11736300.00);
INSERT INTO `order_detail` VALUES (47, 'MHCBCDD02.BK7', 1, 6516300.00);
INSERT INTO `order_detail` VALUES (48, 'MHCBCDD02.BK7', 1, 6516300.00);
INSERT INTO `order_detail` VALUES (48, 'MHCBCDN01.NU15', 1, 5256900.00);
INSERT INTO `order_detail` VALUES (49, 'MHCBCDD02.BK7', 1, 6516300.00);
INSERT INTO `order_detail` VALUES (49, 'MHCBCDN01.NU15', 1, 5256900.00);
INSERT INTO `order_detail` VALUES (50, 'MHCBCDD02.BK7', 1, 6516300.00);
INSERT INTO `order_detail` VALUES (50, 'MHCBCDN01.NU15', 1, 5256900.00);
INSERT INTO `order_detail` VALUES (51, 'MHCBCDN01.BU10', 1, 7212400.00);
INSERT INTO `order_detail` VALUES (52, 'MHCBCDN01.BU10', 1, 7212400.00);
INSERT INTO `order_detail` VALUES (64, 'MHCBCDN01.BU10', 1, 7212400.00);
INSERT INTO `order_detail` VALUES (64, 'MHCBCDN01.NU15', 1, 5256900.00);
INSERT INTO `order_detail` VALUES (66, 'MHCBCDD02.BK5', 2, 23472600.00);
INSERT INTO `order_detail` VALUES (66, 'MHCBCDN01.NU15', 1, 5256900.00);
INSERT INTO `order_detail` VALUES (67, 'MHCBCDN01.BU10', 1, 7212400.00);
INSERT INTO `order_detail` VALUES (67, 'MHCBCDN01.NU15', 1, 5256900.00);
INSERT INTO `order_detail` VALUES (68, 'MHCBCDD02.BK5', 1, 11736300.00);
INSERT INTO `order_detail` VALUES (69, 'MD.CS-1M21', 1, 7420500.00);
INSERT INTO `order_detail` VALUES (70, 'MHCBCDN01.BU10', 1, 7212400.00);
INSERT INTO `order_detail` VALUES (71, 'MD.CS50-1M0', 1, 4596900.00);
INSERT INTO `order_detail` VALUES (71, 'MD.LXCOMFY-1M8(G3)', 1, 7506400.00);
INSERT INTO `order_detail` VALUES (71, 'MD.LXGXT8N-1.8X2.0', 1, 3176000.00);
INSERT INTO `order_detail` VALUES (72, 'MHCBCDD02.BK5', 1, 11736300.00);
INSERT INTO `order_detail` VALUES (72, 'MHCBCDN01.BU10', 2, 14424800.00);
INSERT INTO `order_detail` VALUES (72, 'MHCBCDN01.NU15', 1, 5256900.00);
INSERT INTO `order_detail` VALUES (73, 'MHCBCDN01.BU10', 2, 14424800.00);
INSERT INTO `order_detail` VALUES (74, 'MHCBCDN01.NU15', 1, 5256900.00);
INSERT INTO `order_detail` VALUES (75, 'MFBNCBD04.B12', 1, 4342500.00);
INSERT INTO `order_detail` VALUES (76, 'MFBNCBD04.N12', 3, 16848900.00);
INSERT INTO `order_detail` VALUES (77, 'MHCBCDN01.BU10', 1, 7212400.00);
INSERT INTO `order_detail` VALUES (78, 'MHCBCDD02.BK7', 1, 6516300.00);

-- ----------------------------
-- Table structure for order_status
-- ----------------------------
DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status`  (
  `orderStatusID` int NOT NULL,
  `orderStatusName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`orderStatusID`) USING BTREE,
  INDEX `orderStatusID`(`orderStatusID` ASC) USING BTREE,
  INDEX `orderStatusID_2`(`orderStatusID` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_status
-- ----------------------------
INSERT INTO `order_status` VALUES (1, 'Đang xử lí');
INSERT INTO `order_status` VALUES (2, 'Đang vận chuyển');
INSERT INTO `order_status` VALUES (3, 'Hoàn thành');
INSERT INTO `order_status` VALUES (4, 'Đã hủy');
INSERT INTO `order_status` VALUES (5, 'Trả hàng');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `orderID` int NOT NULL AUTO_INCREMENT,
  `userID` int NOT NULL,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phoneNumber` int NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `paymentID` int NOT NULL,
  `orderStatusID` int NOT NULL,
  `totalPrice` decimal(10, 2) NOT NULL,
  `createAt` date NULL DEFAULT NULL,
  `deliveredDate` date NULL DEFAULT NULL,
  `Note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `fee` int NULL DEFAULT 0,
  `discount` int NULL DEFAULT 0,
  PRIMARY KEY (`orderID`) USING BTREE,
  INDEX `UserID`(`userID` ASC) USING BTREE,
  INDEX `PaymentID`(`paymentID` ASC) USING BTREE,
  INDEX `FK_order_order_status`(`orderStatusID` ASC) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`orderStatusID`) REFERENCES `order_status` (`orderStatusID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 79 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (46, 11, 'Lâm Hồng Phúc', 'tailam164@gmail.com', 123434423, 'Đại học Nông Lâm TPHCM', 1, 1, 18252600.00, '2024-12-03', '2025-01-01', 'Nhanh nha nha shop ơi', 22327, 1000000);
INSERT INTO `orders` VALUES (47, 11, 'Lâm Hồng Phúccc', 'tailam164@gmail.com', 123434423, 'Đại học Nông Lâm TPHCM', 1, 3, 18252600.00, '2025-01-03', '2025-01-04', 'Nhanh nha nha shop ơi', 22327, 1000000);
INSERT INTO `orders` VALUES (48, 11, 'Nguyen Van A', 'tai@gmail.com', 23424323, 'Binh duong', 1, 4, 11773200.00, '2025-01-01', '2025-01-07', 'ngủ thôi tối r', 330517, 500000);
INSERT INTO `orders` VALUES (49, 11, 'Nguyen Van Tai E', 'tai@gmail.com', 2147483647, 'Binh duong', 1, 2, 11773200.00, '2025-01-02', '2025-01-07', 'ngủ thôi tối r', 330517, 500000);
INSERT INTO `orders` VALUES (50, 11, 'Lam', 'tailam164@gmail.com', 123434423, 'Đại học Nông Lâm TPHCM', 1, 4, 11773200.00, '2025-01-10', NULL, 'Nhanh nha nha shop ơi', 330517, 500000);
INSERT INTO `orders` VALUES (51, 11, 'Tai Lam', 'tai@gmail.com', 123455666, 'Binh duong', 1, 2, 7212400.00, '2025-01-03', '2025-01-08', '12313123', 330517, 0);
INSERT INTO `orders` VALUES (52, 2, 's', 'tai@gmail.com', 123123321, 'Binh duong', 2, 2, 7212400.00, '2025-01-01', '2025-01-01', '12313123', 330517, 0);
INSERT INTO `orders` VALUES (64, 11, 'Van A', 'nguyenvana@gmail.com', 234243234, '253', 1, 4, 12469300.00, '2025-01-15', NULL, 'eqe', 330517, 1000000);
INSERT INTO `orders` VALUES (66, 11, 's', 'tai111@gmail.com', 234243234, 'Soc Trang', 2, 5, 28729500.00, '2025-05-06', '2025-05-07', 'dáF', 330517, 0);
INSERT INTO `orders` VALUES (67, 11, 'Nguyen Van A', 'tai111@gmail.com', 1231231321, 'Binh duong', 2, 1, 12469300.00, '2025-03-20', NULL, 'fdasdf', 330517, 0);
INSERT INTO `orders` VALUES (68, 11, 'Nguyen Van A', 'tai111@gmail.com', 234243232, '423', 1, 1, 11736300.00, '2025-03-23', NULL, '4323', 330517, 0);
INSERT INTO `orders` VALUES (69, 11, 'Nguyen Van A', 'nguyenvana@gmail.com', 124124214, 'Binh duong', 1, 1, 7420500.00, '2025-03-26', NULL, '3414', 330517, 0);
INSERT INTO `orders` VALUES (70, 11, 'Nguyen Van A', 'nguyenvana@gmail.com', 124124214, 'Binh duong', 1, 1, 7212400.00, '2025-03-26', NULL, '3414', 330517, 0);
INSERT INTO `orders` VALUES (71, 11, 'Van A', 'nguyenvana@gmail.com', 132123132, '253', 1, 3, 15279300.00, '2025-03-30', '2025-06-01', 'fad', 334517, 0);
INSERT INTO `orders` VALUES (72, 11, 'fasd', 'nguyenvana@gmail.com', 1231231231, 'Binh duong', 1, 1, 14424800.00, '2025-04-03', NULL, 'jabjk', 330517, 1000000);
INSERT INTO `orders` VALUES (73, 11, 'Nguyen Van A', 'tai111@gmail.com', 1231231231, 'Binh duong', 1, 1, 14424800.00, '2025-04-03', NULL, '123', 330517, 1500000);
INSERT INTO `orders` VALUES (74, 11, 'Nguyen Van A', 'tai111@gmail.com', 1231231231, 'Binh duong', 1, 1, 5256900.00, '2025-04-03', NULL, '123', 330517, 1500000);
INSERT INTO `orders` VALUES (75, 11, 'Nguyen Van A', 'tai111@gmail.com', 1231231231, 'Binh duong', 1, 1, 4342500.00, '2025-04-03', NULL, '123a', 330517, 1500000);
INSERT INTO `orders` VALUES (76, 11, 'Nguyen Van A', 'tai111@gmail.com', 1231231231, 'Binh duong', 1, 1, 16848900.00, '2025-04-03', NULL, '123a', 330517, 1500000);
INSERT INTO `orders` VALUES (77, 11, 'Nguyen Van A', 'nguyenvana@gmail.com', 12313222, 'Binh duong', 3, 1, 7212400.00, '2025-04-04', NULL, '12312322', 334517, 0);
INSERT INTO `orders` VALUES (78, 11, 'Nguyen Van A', 'nguyenvana@gmail.com', 12321332, 'Binh duong', 3, 1, 6516300.00, '2025-04-04', NULL, '123123', 334517, 0);

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment`  (
  `paymentID` int NOT NULL AUTO_INCREMENT,
  `paymentName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`paymentID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment
-- ----------------------------
INSERT INTO `payment` VALUES (1, 'COD');
INSERT INTO `payment` VALUES (2, 'Vnpay');
INSERT INTO `payment` VALUES (3, 'Mono');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `permissionID` int NOT NULL AUTO_INCREMENT,
  `featureID` int NOT NULL,
  `actionID` int NOT NULL,
  PRIMARY KEY (`permissionID`) USING BTREE,
  INDEX `featureID`(`featureID` ASC) USING BTREE,
  INDEX `actionID`(`actionID` ASC) USING BTREE,
  CONSTRAINT `permissions_ibfk_1` FOREIGN KEY (`featureID`) REFERENCES `features` (`featureID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `permissions_ibfk_2` FOREIGN KEY (`actionID`) REFERENCES `actions` (`actionID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 2, 2);
INSERT INTO `permissions` VALUES (2, 24, 2);
INSERT INTO `permissions` VALUES (3, 5, 1);
INSERT INTO `permissions` VALUES (4, 27, 1);
INSERT INTO `permissions` VALUES (5, 7, 4);
INSERT INTO `permissions` VALUES (6, 2, 3);
INSERT INTO `permissions` VALUES (7, 24, 3);
INSERT INTO `permissions` VALUES (8, 5, 2);
INSERT INTO `permissions` VALUES (9, 27, 2);
INSERT INTO `permissions` VALUES (10, 22, 1);
INSERT INTO `permissions` VALUES (11, 2, 4);
INSERT INTO `permissions` VALUES (12, 24, 4);
INSERT INTO `permissions` VALUES (13, 5, 3);
INSERT INTO `permissions` VALUES (14, 27, 3);
INSERT INTO `permissions` VALUES (15, 22, 2);
INSERT INTO `permissions` VALUES (16, 3, 1);
INSERT INTO `permissions` VALUES (17, 25, 1);
INSERT INTO `permissions` VALUES (18, 5, 4);
INSERT INTO `permissions` VALUES (19, 27, 4);
INSERT INTO `permissions` VALUES (20, 22, 3);
INSERT INTO `permissions` VALUES (21, 3, 2);
INSERT INTO `permissions` VALUES (22, 25, 2);
INSERT INTO `permissions` VALUES (23, 6, 1);
INSERT INTO `permissions` VALUES (24, 22, 4);
INSERT INTO `permissions` VALUES (25, 3, 3);
INSERT INTO `permissions` VALUES (26, 25, 3);
INSERT INTO `permissions` VALUES (27, 6, 2);
INSERT INTO `permissions` VALUES (28, 1, 1);
INSERT INTO `permissions` VALUES (29, 23, 1);
INSERT INTO `permissions` VALUES (30, 3, 4);
INSERT INTO `permissions` VALUES (31, 25, 4);
INSERT INTO `permissions` VALUES (32, 6, 3);
INSERT INTO `permissions` VALUES (33, 1, 2);
INSERT INTO `permissions` VALUES (34, 23, 2);
INSERT INTO `permissions` VALUES (35, 4, 1);
INSERT INTO `permissions` VALUES (36, 26, 1);
INSERT INTO `permissions` VALUES (37, 6, 4);
INSERT INTO `permissions` VALUES (38, 1, 3);
INSERT INTO `permissions` VALUES (39, 23, 3);
INSERT INTO `permissions` VALUES (40, 4, 2);
INSERT INTO `permissions` VALUES (41, 26, 2);
INSERT INTO `permissions` VALUES (42, 7, 1);
INSERT INTO `permissions` VALUES (43, 1, 4);
INSERT INTO `permissions` VALUES (44, 23, 4);
INSERT INTO `permissions` VALUES (45, 4, 3);
INSERT INTO `permissions` VALUES (46, 26, 3);
INSERT INTO `permissions` VALUES (47, 7, 2);
INSERT INTO `permissions` VALUES (48, 2, 1);
INSERT INTO `permissions` VALUES (49, 24, 1);
INSERT INTO `permissions` VALUES (50, 4, 4);
INSERT INTO `permissions` VALUES (51, 26, 4);
INSERT INTO `permissions` VALUES (52, 7, 3);

-- ----------------------------
-- Table structure for product_reviews
-- ----------------------------
DROP TABLE IF EXISTS `product_reviews`;
CREATE TABLE `product_reviews`  (
  `reviewID` int NOT NULL AUTO_INCREMENT,
  `userID` int NOT NULL,
  `productID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rating` int NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phoneNumber` int NOT NULL DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fullname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hidden` int NULL DEFAULT 0,
  PRIMARY KEY (`reviewID`) USING BTREE,
  INDEX `FK_product_reviews_user`(`userID` ASC) USING BTREE,
  INDEX `FK_product_reviews_products`(`productID` ASC) USING BTREE,
  CONSTRAINT `FK_product_reviews_products` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_product_reviews_user` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_reviews_chk_1` CHECK (`rating` between 1 and 5)
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_reviews
-- ----------------------------
INSERT INTO `product_reviews` VALUES (1, 1, 'MD.CS-1M21', 5, 'chất lượng tốt.', 0, '2024-12-27 21:24:49', 'asdf', NULL);
INSERT INTO `product_reviews` VALUES (2, 1, 'MD.CS-1M21', 4, 'giao hàng hơi chậm.', 0, '2024-12-27 21:22:33', 'asfd', NULL);
INSERT INTO `product_reviews` VALUES (3, 1, 'MD.CS-1M21', 3, 'Sản phẩm ổn nhưng giá hơi cao.', 0, '2024-12-27 21:22:31', 'asf', NULL);
INSERT INTO `product_reviews` VALUES (4, 1, 'MD.LXLACOIL-1.8X2.0', 5, 'chất lượng tốt.', 0, '2024-12-27 21:22:29', 'sadf', NULL);
INSERT INTO `product_reviews` VALUES (5, 1, 'MFBNCB801.B16', 3, 'giao hàng hơi chậm.', 0, '2024-12-27 21:22:26', 'fas', NULL);
INSERT INTO `product_reviews` VALUES (35, 2, 'MHCBCDD02.BK5', 1, 'tuyet voi', 0, '2024-12-27 23:28:22', NULL, NULL);
INSERT INTO `product_reviews` VALUES (36, 2, 'MHCBCDD02.BK5', 2, 'ok nha may b men', 0, '2024-12-27 23:28:46', NULL, NULL);
INSERT INTO `product_reviews` VALUES (37, 2, 'MHCBCDD02.BK5', 3, 'oke la nha ', 0, '2024-12-27 23:36:06', NULL, NULL);
INSERT INTO `product_reviews` VALUES (38, 2, 'MHCBCDD02.BK5', 2, 'em lam nha cac ban', 0, '2024-12-28 00:12:18', NULL, NULL);
INSERT INTO `product_reviews` VALUES (39, 2, 'MHCBCDD02.BK5', 2, 'ngu thoi khuya roi', 0, '2024-12-28 00:15:52', NULL, NULL);
INSERT INTO `product_reviews` VALUES (40, 2, 'MHCBCDD02.BK5', 2, 'phat cuoi ngu ne', 0, '2024-12-28 00:16:35', NULL, NULL);
INSERT INTO `product_reviews` VALUES (41, 2, 'MHCBCDD02.BK5', 3, 'huhu duoc di ma', 0, '2024-12-28 00:18:49', NULL, NULL);
INSERT INTO `product_reviews` VALUES (42, 2, 'MHCBCDD02.BK5', 3, 'ngủ thiệt nè', 0, '2024-12-28 00:27:06', NULL, NULL);
INSERT INTO `product_reviews` VALUES (43, 1, 'MD.CS-1M21', 5, 'on ap do', 0, '2025-01-14 10:17:28', '', NULL);
INSERT INTO `product_reviews` VALUES (44, 2, 'MHCBCDD02.BK5', 2, 'oka la', 0, '2025-01-14 16:30:47', NULL, NULL);
INSERT INTO `product_reviews` VALUES (45, 11, 'MHCBCDN01.NU15', 3, 'a', 0, '2025-01-15 00:22:16', NULL, NULL);
INSERT INTO `product_reviews` VALUES (46, 11, 'MHCBCD801.BG36', 3, '1', 0, '2025-01-15 00:22:40', NULL, NULL);
INSERT INTO `product_reviews` VALUES (47, 11, 'MHCBCDN01.NU15', 3, 'sdfsdfsdffds', 0, '2025-01-15 09:13:18', NULL, NULL);
INSERT INTO `product_reviews` VALUES (48, 11, 'MHCBCDD02.BK5', 2, 'okela', 0, '2025-03-09 14:19:38', NULL, NULL);
INSERT INTO `product_reviews` VALUES (49, 11, 'MHCBCDD02.BK5', 1, 'test log', 0, '2025-03-23 11:46:42', NULL, NULL);

-- ----------------------------
-- Table structure for product_views
-- ----------------------------
DROP TABLE IF EXISTS `product_views`;
CREATE TABLE `product_views`  (
  `productViewID` int NOT NULL AUTO_INCREMENT,
  `productID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createAt` date NOT NULL,
  PRIMARY KEY (`productViewID`) USING BTREE,
  INDEX `FK_product_views_products`(`productID` ASC) USING BTREE,
  CONSTRAINT `FK_product_views_products` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_views
-- ----------------------------
INSERT INTO `product_views` VALUES (1, 'MD.CS-1M21', '2024-12-03');
INSERT INTO `product_views` VALUES (2, 'MD.CS-1M21', '2024-12-03');
INSERT INTO `product_views` VALUES (3, 'MD.CS-1M21', '2024-12-03');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `productID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `price` int NOT NULL,
  `discountDefault` int NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `categoryID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'LV-BLV',
  `quanlityStock` int NOT NULL,
  `quanlitySell` int NOT NULL,
  `thumbnail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createAt` date NOT NULL,
  `minStockLevel` int NULL DEFAULT 50,
  PRIMARY KEY (`productID`) USING BTREE,
  INDEX `FK_products_subcategory`(`categoryID` ASC) USING BTREE,
  CONSTRAINT `FK_products_subcategory` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('MD.CS-1M0', 'Baya-Signature Năm 2025 - BEHAHOIT', 8730000, 10, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'ST', 11, 1, 'https://product.hstatic.net/200000065946/product/nem_cao_su_thien_nhien_bao_hanh_12_nam_-_copy_4c33b367a317434b91cc60d5196b3402_1024x1024.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MD.CS-1M21', 'Ghế Aya', 8730000, 15, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'LV-BLV', 10, 2, 'https://product.hstatic.net/200000065946/product/nem_cao_su_thien_nhien_bao_hanh_12_nam_-_copy_4c33b367a317434b91cc60d5196b3402_1024x1024.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MD.CS50-1M0', 'Baya-Signature Năm 2025 - TQUEQVEO', 5970000, 23, 'Nội thất đóng vai trò quan trọng trong việc kiến tạo không gian sống tiện nghi và hiện đại. Với các thiết kế tối giản nhưng đầy đủ chức năng, nội thất ngày nay đáp ứng tốt nhu cầu của người dùng trong mọi hoàn cảnh, từ nhà ở, văn phòng cho đến không gian công cộng. Chất liệu như gỗ tự nhiên, thép không gỉ, và kính cường lực không chỉ đảm bảo độ bền mà còn mang lại vẻ đẹp sang trọng và độc đáo. Nội thất thông minh cũng đang là xu hướng, giúp tiết kiệm không gian và tối ưu hóa tiện ích trong các căn hộ nhỏ', 'ST', 40, 4, 'https://product.hstatic.net/200000065946/product/nem_cao_su_thien_nhien_bao_hanh_12_nam_-_copy_765f8c1c56aa4568a92d851c11f32de5_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MD.LX6NPN-1.8X2.0', 'Baya-Signature Năm 2025 - XIHGGTIF', 3510000, 21, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'ST', 17, 2, 'https://product.hstatic.net/200000065946/product/lo_xo_phoenix_2_mat_vai_152a583be5aa45ddb0675f9b2df14613_1024x1024.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MD.LXCOMFY-1M8(G3)', 'Baya-Signature Năm 2025 - ZALUFBJK', 8530000, 12, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'ST', 98, 0, 'https://product.hstatic.net/200000065946/product/lo_xo_gap_comfy_cfad04ea8a0948d7ac72f48572a6f044_1024x1024.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MD.LXGXT8N-1.8X2.0', 'Baya-Signature Năm 2025 - KQOOEFQN', 3970000, 20, 'Với sự phát triển không ngừng, ngành nội thất luôn mang đến những giải pháp sáng tạo cho mọi không gian. Các sản phẩm được thiết kế thông minh để vừa tiết kiệm diện tích vừa đảm bảo tính thẩm mỹ cao. Nội thất đa năng, chẳng hạn như ghế sofa tích hợp giường ngủ hoặc tủ có chức năng lưu trữ, đang dần trở thành sự lựa chọn phổ biến cho các gia đình hiện đại.', 'ST', 79, 42, 'https://product.hstatic.net/200000065946/product/pro_trang_kem_noi_that_moho_nem_lo_xo_van_thanh__9ffeace09eae494baf02dd69905f753b_master.png', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MD.LXHY12N-1.8X2.0', 'Baya-Signature Năm 2025 - RIKKBMXG', 8460000, 13, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'ST', 93, 4, 'https://product.hstatic.net/200000065946/product/lo_xo_tui_harmony_51e73afc497646cab1a56e383aabddd9_1024x1024.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MD.LXLACOIL-1.8X2.0', 'Baya-Signature Năm 2025 - IYPOJALJ', 24120000, 5, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'ST', 2, 0, 'https://product.hstatic.net/200000065946/product/lo_xo_tui_lacoil_d260102c40a340a2ad86d45181092416_1024x1024.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MD.LXRB10N-1.6X2.0', 'Baya-Signature Năm 2025 - PDGARLVU', 6850000, 9, 'Nội thất không gian sống là sự giao thoa giữa nghệ thuật và công năng. Các sản phẩm như bàn ăn, ghế thư giãn, và kệ sách không chỉ đáp ứng nhu cầu sử dụng hàng ngày mà còn là điểm nhấn thẩm mỹ quan trọng. Các nhà thiết kế ngày càng chú trọng vào việc kết hợp ánh sáng, màu sắc, và bố cục để tạo ra sự hài hòa trong không gian nội thất', 'ST', 53, 1, 'https://product.hstatic.net/200000065946/product/lo_xo_tui_ruby_22651984e65d4b4caa241da9f3a846e0_1024x1024.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFBNCB801.B16', 'Sofa hiện đại', 6990000, 5, 'Không gian nội thất không chỉ ảnh hưởng đến hiệu suất làm việc mà còn góp phần cải thiện tâm trạng của con người. Những món đồ như bàn làm việc gọn nhẹ, ghế ngồi thoải mái hay tủ lưu trữ rộng rãi đều được thiết kế để mang lại sự tiện nghi và cảm hứng trong công việc. Việc sử dụng các chất liệu thân thiện với môi trường cũng đang trở thành xu hướng trong thiết kế nội thất hiện đại.', 'LV-BLV', 22, 164, 'https://product.hstatic.net/200000065946/product/pro_1m6_noi_that_moho_giuong_ngu_fiji_b_cae43605b18e4e6a961709059b8d03f6_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFBNCBD01.B16', 'Giường Ngủ Gỗ Tràm MOHO HOBRO 301', 8490000, 23, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'GN', 64, 241, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_go_hobro_11_ba80c956f01b4fce9e31515baa84318a_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFBNCBD04.B12', 'Giường Ngủ Gỗ Tràm MOHO VLINE 601', 5790000, 25, 'Nội thất đóng vai trò quan trọng trong việc kiến tạo không gian sống tiện nghi và hiện đại. Với các thiết kế tối giản nhưng đầy đủ chức năng, nội thất ngày nay đáp ứng tốt nhu cầu của người dùng trong mọi hoàn cảnh, từ nhà ở, văn phòng cho đến không gian công cộng. Chất liệu như gỗ tự nhiên, thép không gỉ, và kính cường lực không chỉ đảm bảo độ bền mà còn mang lại vẻ đẹp sang trọng và độc đáo. Nội thất thông minh cũng đang là xu hướng, giúp tiết kiệm không gian và tối ưu hóa tiện ích trong các căn hộ nhỏ', 'GN', 12, 985, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_go_tram_vline_1m8_a_6ba57dbc2c7943509208badc020decf8_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFBNCBD04.N12', 'Giường Ngủ Gỗ MOHO VLINE 601', 5790000, 3, 'Không gian nội thất không chỉ ảnh hưởng đến hiệu suất làm việc mà còn góp phần cải thiện tâm trạng của con người. Những món đồ như bàn làm việc gọn nhẹ, ghế ngồi thoải mái hay tủ lưu trữ rộng rãi đều được thiết kế để mang lại sự tiện nghi và cảm hứng trong công việc. Việc sử dụng các chất liệu thân thiện với môi trường cũng đang trở thành xu hướng trong thiết kế nội thất hiện đại.', 'GN', 15, 882, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_giuong_ngu_go_soi_vline_601_a_567fd3232780488ea2339740d4807bb4_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFBNCC601.A16', 'Giường Ngủ Gỗ Tràm MOHO DALUMD 301', 5990000, 16, 'Nội thất đóng vai trò quan trọng trong việc kiến tạo không gian sống tiện nghi và hiện đại. Với các thiết kế tối giản nhưng đầy đủ chức năng, nội thất ngày nay đáp ứng tốt nhu cầu của người dùng trong mọi hoàn cảnh, từ nhà ở, văn phòng cho đến không gian công cộng. Chất liệu như gỗ tự nhiên, thép không gỉ, và kính cường lực không chỉ đảm bảo độ bền mà còn mang lại vẻ đẹp sang trọng và độc đáo. Nội thất thông minh cũng đang là xu hướng, giúp tiết kiệm không gian và tối ưu hóa tiện ích trong các căn hộ nhỏ', 'GN', 10, 320, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_go_dalumd_1m6_a_fd3289aaa60f48cd966c3893154a63f4_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFBNCC901.N16', 'Giường Ngủ Gỗ Cao Su MOHO HOBRO 301', 6490000, 23, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'GN', 51, 83, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_giuong_ngu_go_hobro__6_637a70c78a7849b5a7f716007cee1f1f_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFBSCA501.B05', 'Baya-Signature Năm 2025 - JBOWXXJJ', 1490000, 13, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'ST', 6, 456, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_go_vienna_11_18a111d742864bfeb8ac20335371286b_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFBSCA802.B05', 'Tủ Đầu Giường Gỗ MOHO VLINE 801', 1990000, 21, 'Không gian nội thất không chỉ ảnh hưởng đến hiệu suất làm việc mà còn góp phần cải thiện tâm trạng của con người. Những món đồ như bàn làm việc gọn nhẹ, ghế ngồi thoải mái hay tủ lưu trữ rộng rãi đều được thiết kế để mang lại sự tiện nghi và cảm hứng trong công việc. Việc sử dụng các chất liệu thân thiện với môi trường cũng đang trở thành xu hướng trong thiết kế nội thất hiện đại.', 'T', 28, 495, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_vline_801_1_23cfecbb74a14c43918abdff9a03b485_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFBSCA802.N05', 'Baya-Signature Năm 2025 - YZCFWBAO', 1990000, 15, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'ST', 62, 327, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_dau_giuong_vline_5_8789ba9c811d4c31a71b47d8eb17744b_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFBSCAO02.N05', 'Baya-Signature Năm 2025 - LZDGEIYS', 1790000, 13, 'Với sự phát triển không ngừng, ngành nội thất luôn mang đến những giải pháp sáng tạo cho mọi không gian. Các sản phẩm được thiết kế thông minh để vừa tiết kiệm diện tích vừa đảm bảo tính thẩm mỹ cao. Nội thất đa năng, chẳng hạn như ghế sofa tích hợp giường ngủ hoặc tủ có chức năng lưu trữ, đang dần trở thành sự lựa chọn phổ biến cho các gia đình hiện đại.', 'ST', 6, 285, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_go_malaga_11_12d457b5f32f4be4831862b3e1af3751_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFBSCB801.B55', 'Baya-Signature Năm 2025 - TWYKOJCE', 1490000, 18, 'Nội thất đóng vai trò quan trọng trong việc kiến tạo không gian sống tiện nghi và hiện đại. Với các thiết kế tối giản nhưng đầy đủ chức năng, nội thất ngày nay đáp ứng tốt nhu cầu của người dùng trong mọi hoàn cảnh, từ nhà ở, văn phòng cho đến không gian công cộng. Chất liệu như gỗ tự nhiên, thép không gỉ, và kính cường lực không chỉ đảm bảo độ bền mà còn mang lại vẻ đẹp sang trọng và độc đáo. Nội thất thông minh cũng đang là xu hướng, giúp tiết kiệm không gian và tối ưu hóa tiện ích trong các căn hộ nhỏ', 'ST', 90, 86, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_fiji_6_db3bb7779c934e4f8ceefad840a433af_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFBSCBD01.B06', 'Tủ Đầu Giường Gỗ MOHO HOBRO 301', 2490000, 2, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'T', 51, 157, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_go_hobro_4_0495ddbc14184b4cae586b82d6eb30af_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFBSCDN01.B04', 'Tủ Đầu Giường Gỗ MOHO UBEDA 201', 690000, 5, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'T', 22, 14, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tudaugiuong___2__85b4b890204a454bbffb5cb6b06ac45c_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFCBCE601.BH12', 'Full Combo Phòng Khách 5 Món MOHO HOBRO', 23490000, 20, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'FCB', 39, 7, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___4__a89a2dd63d764f6287d3f50530f70041_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFCBCE601.BH13', 'Combo Phòng Ăn MOHO HOBRO (4 hoặc 6 ghế)', 10490000, 8, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'FH', 40, 11, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_bo_ban_an___4__041c7036557546eb8466041bbca132ee_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFCBCE601.BH3', 'Full Combo Phòng Ngủ 5 Món MOHO HOBRO', 23490000, 3, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'FCB', 32, 5, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___1__53efae5f678c4308ae2d621cab3515c3_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFCBCE601.BH5', 'Combo Basic Phòng Ngủ 4 Món MOHO HOBRO', 20990000, 15, 'Với sự phát triển không ngừng, ngành nội thất luôn mang đến những giải pháp sáng tạo cho mọi không gian. Các sản phẩm được thiết kế thông minh để vừa tiết kiệm diện tích vừa đảm bảo tính thẩm mỹ cao. Nội thất đa năng, chẳng hạn như ghế sofa tích hợp giường ngủ hoặc tủ có chức năng lưu trữ, đang dần trở thành sự lựa chọn phổ biến cho các gia đình hiện đại.', 'FH', 85, 20, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___4__9006c9e805ed4342854cdf54d203ef86_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFCBCE601.BH7', 'Combo Basic Phòng Khách 4 Món MOHO HOBRO', 15999000, 19, 'Với sự phát triển không ngừng, ngành nội thất luôn mang đến những giải pháp sáng tạo cho mọi không gian. Các sản phẩm được thiết kế thông minh để vừa tiết kiệm diện tích vừa đảm bảo tính thẩm mỹ cao. Nội thất đa năng, chẳng hạn như ghế sofa tích hợp giường ngủ hoặc tủ có chức năng lưu trữ, đang dần trở thành sự lựa chọn phổ biến cho các gia đình hiện đại.', 'FH', 38, 5, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___1__ad53e790da554627893cd8d8bda366f3_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFCDCA901.B08', 'Baya-Signature Năm 2025 - GIBXUQZD', 2790000, 21, 'Với sự phát triển không ngừng, ngành nội thất luôn mang đến những giải pháp sáng tạo cho mọi không gian. Các sản phẩm được thiết kế thông minh để vừa tiết kiệm diện tích vừa đảm bảo tính thẩm mỹ cao. Nội thất đa năng, chẳng hạn như ghế sofa tích hợp giường ngủ hoặc tủ có chức năng lưu trữ, đang dần trở thành sự lựa chọn phổ biến cho các gia đình hiện đại.', 'ST', 54, 307, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_giay_vline_601_1_4d815074d997442b86777b129e166f13_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFCDCA901.N08', 'Baya-Signature Năm 2025 - IKKDPKEB', 2790000, 25, 'Nội thất đóng vai trò quan trọng trong việc kiến tạo không gian sống tiện nghi và hiện đại. Với các thiết kế tối giản nhưng đầy đủ chức năng, nội thất ngày nay đáp ứng tốt nhu cầu của người dùng trong mọi hoàn cảnh, từ nhà ở, văn phòng cho đến không gian công cộng. Chất liệu như gỗ tự nhiên, thép không gỉ, và kính cường lực không chỉ đảm bảo độ bền mà còn mang lại vẻ đẹp sang trọng và độc đáo. Nội thất thông minh cũng đang là xu hướng, giúp tiết kiệm không gian và tối ưu hóa tiện ích trong các căn hộ nhỏ', 'ST', 63, 126, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_giay_vline_601_1_69d5ae45a39744f4bec4eb52bd28a0d1_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFDBCC801.B11', 'Baya-Signature Năm 2025 - JMHMVTDE', 2290000, 10, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'ST', 61, 350, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_bang_dai_vline_1_ae30cf99b089494bac2d06196c4ff2bb_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFDBCCN02.B12', 'Baya-Signature Năm 2025 - JFGIZTIX', 1990000, 25, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'ST', 2, 401, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_bang_dai_dem_be_1_9cf95d7cf236470ab808b5ce10265bd7_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFDCCAD07.N05', 'Ghế Ăn Gỗ Cao Su Tự Nhiên MOHO ODESSA', 1290000, 19, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'GA', 1, 584, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ghe_an_odessa_6_98d8d065e6254d03969bb97e51fcf485_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFDCCC101.N05', 'Baya-Signature Năm 2025 - KGRSUYSX', 990000, 20, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'ST', 83, 101, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an_go_malaga_13_0f68780b04be419bb7a45d788f2b32a9_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFDCCC103.N06', 'Baya-Signature Năm 2025 - ITPKETOD', 1090000, 19, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'ST', 81, 143, 'https://product.hstatic.net/200000065946/product/pro_xanh_navy_noi_that_moho_ghe_an_go_verona_6_b0d28d1e676049cfb6adfa204846d0ca_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFDCCC103.O05', 'Ghế Ăn Gỗ Cao Su Tự Nhiên MOHO NEXO 601', 1390000, 10, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'GA', 75, 124, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_ghe_an_go_cao_su_tu_nhien_nexo_5_a10820a942574046a91a635e7da4cbdd_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFDCCC104.O05', 'Ghế Ăn Gỗ Cao Su Tự Nhiên MOHO SORO 601', 1490000, 17, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'GA', 55, 112, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_noi_that_moho_ghe_an_go_cao_su_soro_3_3f906b4a6a10464ab0d060cf0f7f8c44_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFDCCCD04.B05', 'Baya-Signature Năm 2025 - VTVCNMCO', 1490000, 3, 'Với sự phát triển không ngừng, ngành nội thất luôn mang đến những giải pháp sáng tạo cho mọi không gian. Các sản phẩm được thiết kế thông minh để vừa tiết kiệm diện tích vừa đảm bảo tính thẩm mỹ cao. Nội thất đa năng, chẳng hạn như ghế sofa tích hợp giường ngủ hoặc tủ có chức năng lưu trữ, đang dần trở thành sự lựa chọn phổ biến cho các gia đình hiện đại.', 'ST', 55, 399, 'https://product.hstatic.net/200000065946/product/pro_nau_ghe_an_go_milan_1_ac2aae2b06094ab595210f7bcdb0e47f_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFDCCCN01.G04', 'Ghế Ăn Gỗ Cao Su Tự Nhiên MOHO VIBORG 601', 1090000, 16, 'Không gian nội thất không chỉ ảnh hưởng đến hiệu suất làm việc mà còn góp phần cải thiện tâm trạng của con người. Những món đồ như bàn làm việc gọn nhẹ, ghế ngồi thoải mái hay tủ lưu trữ rộng rãi đều được thiết kế để mang lại sự tiện nghi và cảm hứng trong công việc. Việc sử dụng các chất liệu thân thiện với môi trường cũng đang trở thành xu hướng trong thiết kế nội thất hiện đại.', 'GA', 35, 72, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an_go_viborg_trang_4_93618cecb359466b921c59512df27192_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFDCCCN01.N08', 'Ghế Ăn Gỗ Cao Su Tự Nhiên MOHO VLINE 601', 1490000, 20, 'Nội thất đóng vai trò quan trọng trong việc kiến tạo không gian sống tiện nghi và hiện đại. Với các thiết kế tối giản nhưng đầy đủ chức năng, nội thất ngày nay đáp ứng tốt nhu cầu của người dùng trong mọi hoàn cảnh, từ nhà ở, văn phòng cho đến không gian công cộng. Chất liệu như gỗ tự nhiên, thép không gỉ, và kính cường lực không chỉ đảm bảo độ bền mà còn mang lại vẻ đẹp sang trọng và độc đáo. Nội thất thông minh cũng đang là xu hướng, giúp tiết kiệm không gian và tối ưu hóa tiện ích trong các căn hộ nhỏ', 'GA', 33, 912, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an_vline_1_e4a9936f38fe4b67aebf70c35f804e25_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFDCCD901.N05', 'Ghế Ăn Gỗ Cao Su Tự Nhiên MOHO FYN', 1790000, 25, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'GA', 70, 663, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an_go_cao_su_fyn__4__6f72ede2ef024d89b2643dd0d9b41e1f_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFDCCE301.B05', 'Ghế Ăn Gỗ Cao Su Tự Nhiên HOBRO 301', 1790000, 15, 'Không gian nội thất không chỉ ảnh hưởng đến hiệu suất làm việc mà còn góp phần cải thiện tâm trạng của con người. Những món đồ như bàn làm việc gọn nhẹ, ghế ngồi thoải mái hay tủ lưu trữ rộng rãi đều được thiết kế để mang lại sự tiện nghi và cảm hứng trong công việc. Việc sử dụng các chất liệu thân thiện với môi trường cũng đang trở thành xu hướng trong thiết kế nội thất hiện đại.', 'GA', 79, 36, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nem_xam_noi_that_moho_ghe_an_hobro___1__3379dc3ce30c44938c562a89b8dad919_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFDTCA701.B09', 'Baya-Signature Năm 2025 - BWBCVKPQ', 2490000, 23, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'ST', 37, 114, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_an_go_vline_1_2070a5751a624ebcb4ff1a0f726b74c2_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFDTCA701.B16', 'Baya-Signature Năm 2025 - JOPPJXKH', 3490000, 21, 'Với sự phát triển không ngừng, ngành nội thất luôn mang đến những giải pháp sáng tạo cho mọi không gian. Các sản phẩm được thiết kế thông minh để vừa tiết kiệm diện tích vừa đảm bảo tính thẩm mỹ cao. Nội thất đa năng, chẳng hạn như ghế sofa tích hợp giường ngủ hoặc tủ có chức năng lưu trữ, đang dần trở thành sự lựa chọn phổ biến cho các gia đình hiện đại.', 'ST', 2, 188, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_an_go_vlne_1_02c484a7c1914fd18e85938012442389_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFDTCBN01.B16', 'Bàn Ăn Gỗ Cao Su Tự Nhiên MOHO ODENSE 601', 3299000, 9, 'Nội thất đóng vai trò quan trọng trong việc kiến tạo không gian sống tiện nghi và hiện đại. Với các thiết kế tối giản nhưng đầy đủ chức năng, nội thất ngày nay đáp ứng tốt nhu cầu của người dùng trong mọi hoàn cảnh, từ nhà ở, văn phòng cho đến không gian công cộng. Chất liệu như gỗ tự nhiên, thép không gỉ, và kính cường lực không chỉ đảm bảo độ bền mà còn mang lại vẻ đẹp sang trọng và độc đáo. Nội thất thông minh cũng đang là xu hướng, giúp tiết kiệm không gian và tối ưu hóa tiện ích trong các căn hộ nhỏ', 'LV-BLV', 30, 18, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_noi_that_moho_ban_an_go_cao_su_odense_6_aaa7b6c7cc964c3c8cdeea305bb8f692_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFDTCC801.B16', 'Bàn Ăn Gỗ Cao Su Tự Nhiên MOHO VLINE 602', 3990000, 6, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'LV-BLV', 61, 81, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_an_go_vline_1_f5a35e91c4db456d9468f0a64b10115c_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFDTCC802.N14', 'Bàn Ăn Gỗ MOHO MOSS 601', 2790000, 1, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'LV-BLV', 0, 39, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ban_an_go_moss_1m6_8_4fff91ec81cc48a4b2a90297534d12d4_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFDTCE301.B16', 'Bàn Ăn Gỗ Cao Su Tự Nhiên HOBRO 301 (Màu nâu 160)', 3990000, 15, 'Không gian nội thất không chỉ ảnh hưởng đến hiệu suất làm việc mà còn góp phần cải thiện tâm trạng của con người. Những món đồ như bàn làm việc gọn nhẹ, ghế ngồi thoải mái hay tủ lưu trữ rộng rãi đều được thiết kế để mang lại sự tiện nghi và cảm hứng trong công việc. Việc sử dụng các chất liệu thân thiện với môi trường cũng đang trở thành xu hướng trong thiết kế nội thất hiện đại.', 'LV-BLV', 41, 4, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban___1__0f1907c986394fc781fec6bfbfa12861_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFDTSMLFYDC4.N12', 'Baya-Signature Năm 2025 - EYXWUTFK', 7490000, 22, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'ST', 46, 115, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_bo_ban_an_milan_4_ghe_oslo_901_4_cebc39261df04cfa9262bdf8550c784e_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFDTSOLMLDC4.N14', 'Baya-Signature Năm 2025 - BTUBOMBB', 7790000, 12, 'Việc lựa chọn nội thất phù hợp là yếu tố quan trọng để tạo nên không gian sống lý tưởng. Các thiết kế hiện nay không chỉ đẹp mắt mà còn thân thiện với người dùng, chẳng hạn như giường ngủ điều chỉnh linh hoạt, bàn có thể mở rộng hay tủ tích hợp nhiều ngăn kéo. Các chất liệu phổ biến như gỗ công nghiệp, kim loại sơn tĩnh điện, và vải cao cấp mang đến sự lựa chọn đa dạng cho khách hàng.', 'ST', 50, 174, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_bo_ban_an_go_oslo_4_ghe_milan_8ec49013bbe64a489d654fd997d299c7_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFDTSOLVBGDC6.N14', 'Baya-Signature Năm 2025 - ZWZCXFYY', 9830000, 20, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'ST', 75, 14, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_bo_ban_an_oslo_6_ghe_oslo_1_054e2af61f224796aba9656935051e34_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFDTSVLBR1DB1.B16', 'Baya-Signature Năm 2025 - AJUQGNKQ', 6490000, 12, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'ST', 82, 217, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_bo_ban_an_vline_nau_1m6_4_5607bf3740be4ac088bf64a470635cce_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFDTSVLDC2.B09', 'Baya-Signature Năm 2025 - PUXKIYVX', 4490000, 1, 'Với sự phát triển không ngừng, ngành nội thất luôn mang đến những giải pháp sáng tạo cho mọi không gian. Các sản phẩm được thiết kế thông minh để vừa tiết kiệm diện tích vừa đảm bảo tính thẩm mỹ cao. Nội thất đa năng, chẳng hạn như ghế sofa tích hợp giường ngủ hoặc tủ có chức năng lưu trữ, đang dần trở thành sự lựa chọn phổ biến cho các gia đình hiện đại.', 'ST', 63, 76, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_bo_ban_an_vline_1_c2652ee64fbe48a9b3b4009fe195fba0_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFDTSVLFYDC4.N16', 'Bộ Bàn Ăn Gỗ Cao Su Tự Nhiên MOHO VLINE 602 (75cm)', 9490000, 17, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'LV-BLV', 97, 21, 'https://product.hstatic.net/200000065946/product/o_ghe_an_go_cao_su_fyn__4__6f72ede2ef024d89b2643dd0d9b41e1f_master__1__d3dfd4f4f4bb438480e300a1c5146e79_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFFSSBELFAST43.06', 'Vỏ Bọc Nệm Sofa MOHO VLINE Màu Xám Đậm', 990000, 8, 'Nội thất đóng vai trò quan trọng trong việc kiến tạo không gian sống tiện nghi và hiện đại. Với các thiết kế tối giản nhưng đầy đủ chức năng, nội thất ngày nay đáp ứng tốt nhu cầu của người dùng trong mọi hoàn cảnh, từ nhà ở, văn phòng cho đến không gian công cộng. Chất liệu như gỗ tự nhiên, thép không gỉ, và kính cường lực không chỉ đảm bảo độ bền mà còn mang lại vẻ đẹp sang trọng và độc đáo. Nội thất thông minh cũng đang là xu hướng, giúp tiết kiệm không gian và tối ưu hóa tiện ích trong các căn hộ nhỏ', 'LV-BLV', 35, 21, 'https://product.hstatic.net/200000065946/product/pro_ghe_don_vai_boc_3_mau_1_79262a9a8d484ef3abe91411b84ea6fe_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFFSSBOSTON355.06', 'Vỏ Bọc Nệm Sofa MOHO VLINE Màu Xanh Lá', 990000, 15, 'Không gian nội thất không chỉ ảnh hưởng đến hiệu suất làm việc mà còn góp phần cải thiện tâm trạng của con người. Những món đồ như bàn làm việc gọn nhẹ, ghế ngồi thoải mái hay tủ lưu trữ rộng rãi đều được thiết kế để mang lại sự tiện nghi và cảm hứng trong công việc. Việc sử dụng các chất liệu thân thiện với môi trường cũng đang trở thành xu hướng trong thiết kế nội thất hiện đại.', 'LV-BLV', 41, 19, 'https://product.hstatic.net/200000065946/product/pro_ghe_don_vai_boc_3_mau_1_b2ebfed5b31a4e0a9c22f735eee582b8_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFFSSLENA102.06', 'Vỏ Bọc Nệm Sofa MOHO VLINE Màu Be', 490000, 22, 'Không gian nội thất không chỉ ảnh hưởng đến hiệu suất làm việc mà còn góp phần cải thiện tâm trạng của con người. Những món đồ như bàn làm việc gọn nhẹ, ghế ngồi thoải mái hay tủ lưu trữ rộng rãi đều được thiết kế để mang lại sự tiện nghi và cảm hứng trong công việc. Việc sử dụng các chất liệu thân thiện với môi trường cũng đang trở thành xu hướng trong thiết kế nội thất hiện đại.', 'LV-BLV', 70, 25, 'https://product.hstatic.net/200000065946/product/pro_ghe_don_vai_boc_3_mau_1_5d08ee598cb34da083e09a66575b1627_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFLVSVLLOTG.B18', 'Ghế Sofa Góc Chữ L Gỗ Cao Su Tự Nhiên MOHO VLINE 601 Kèm Đôn', 13490000, 18, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'GSF', 71, 43, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo_ghe_sofa_nau_kem_don_nem_xam_8d66f8aea67545d0885f3ea8bd53c132_master.png', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFMTSVNMT1MR1.B10', 'Baya-Signature Năm 2025 - ATFSSBIE', 3990000, 21, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'ST', 5, 207, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo_ban_va_guong_trang_diem_vienna_6_63151bd4018e49e4bdbd590328a73267_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFMTSVNMT1MR1.N10', 'Baya-Signature Năm 2025 - DKJUCCMC', 3990000, 3, 'Không gian nội thất không chỉ ảnh hưởng đến hiệu suất làm việc mà còn góp phần cải thiện tâm trạng của con người. Những món đồ như bàn làm việc gọn nhẹ, ghế ngồi thoải mái hay tủ lưu trữ rộng rãi đều được thiết kế để mang lại sự tiện nghi và cảm hứng trong công việc. Việc sử dụng các chất liệu thân thiện với môi trường cũng đang trở thành xu hướng trong thiết kế nội thất hiện đại.', 'ST', 15, 194, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_combo_ban_va_guong_trang_diem_4_1ca3bb5e864d457b8017481f66fb20a7_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFNKCC801.B12', 'Bàn Làm Việc Gỗ MOHO FYN 601 Màu Nâu', 2790000, 25, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'LV-BLV', 13, 206, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_lam_viec_go_fyn_nau2_f607075e46254fc190dfabcd5108f91c_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFNKCC802.N12', 'Bàn Làm Việc Gỗ MOHO FYN 601 Màu Tự Nhiên', 2790000, 17, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'LV-BLV', 99, 117, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ban_lam_viec_go_fyn_1_363104d4c8da475394e683e556879f88_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSCCC801.B14', 'Baya-Signature Năm 2025 - QWZQMADW', 5490000, 9, 'Không gian nội thất không chỉ ảnh hưởng đến hiệu suất làm việc mà còn góp phần cải thiện tâm trạng của con người. Những món đồ như bàn làm việc gọn nhẹ, ghế ngồi thoải mái hay tủ lưu trữ rộng rãi đều được thiết kế để mang lại sự tiện nghi và cảm hứng trong công việc. Việc sử dụng các chất liệu thân thiện với môi trường cũng đang trở thành xu hướng trong thiết kế nội thất hiện đại.', 'ST', 49, 151, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_sofa_goc_vline_dem_be_2_22f7622e011b4761851383379179f03d_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSCCC901.B14', 'Ghế sofa góc MOHO VLINE 601 màu xám đậm', 5490000, 16, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'GSF', 39, 56, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_don_sofa_vline_xam_dam_6_41a605f93512456ca73ea40ba2036672_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSCCE301.B16', 'Ghế Sofa Góc HOBRO 301 Bên Phải', 8990000, 6, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'GSF', 63, 0, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_sofa_goc_hobro___1__41f009b1af1f41ddbe294b8eb3bd81ef_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSCCE302.B16', 'Ghế Sofa Góc HOBRO 301 (160) Bên Trái', 8990000, 4, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'GSF', 46, 3, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_xam_noi_that_moho_sofa_goc_phai___2__af8b7439219448088a86001e3612fa7b_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSHCBD01.B06', 'Tủ Giày – Tủ Trang Trí Gỗ MOHO VIENNA 201', 2490000, 1, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'T', 1, 148, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_giay_trang_tri_vienna_8_f7ae2f2d0fac42a2b6a18d54e0705829_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSHCBD01.N18', 'Tủ Giày – Tủ Trang Trí Gỗ MOHO VIENNA 202', 2790000, 19, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'T', 92, 82, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_giay_trang_tri_vienna_202_8_9aa276314d3f40368bd1c0143bef6369_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSHCBD02.B08', 'Tủ Giày – Tủ Trang Trí Gỗ MOHO VIENNA 203', 3290000, 18, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'T', 49, 148, 'https://product.hstatic.net/200000065946/product/pro_nau_phoi_trang_noi_that_moho_tu_giay_trang_tri_vienna_203_8_184027c233b84428bb37751d18a8d83a_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSHCBD03.B08', 'Tủ Giày – Tủ Trang Trí Gỗ MOHO VIENNA 204', 2990000, 7, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'T', 13, 136, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_giay_vienna_204_1_e9d38e73e1b546e4b3884366bdc7d35b_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSNCB601.N20', 'Baya-Signature Năm 2025 - WILKFRHU', 10990000, 4, 'Nội thất không gian sống là sự giao thoa giữa nghệ thuật và công năng. Các sản phẩm như bàn ăn, ghế thư giãn, và kệ sách không chỉ đáp ứng nhu cầu sử dụng hàng ngày mà còn là điểm nhấn thẩm mỹ quan trọng. Các nhà thiết kế ngày càng chú trọng vào việc kết hợp ánh sáng, màu sắc, và bố cục để tạo ra sự hài hòa trong không gian nội thất', 'ST', 69, 143, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_sofa_fyn_901_2_6db9b36362284eeb9c94a841747295f9_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSNCB701.K20', 'Baya-Signature Năm 2025 - EMPOIIQS', 10090000, 22, 'Nội thất đóng vai trò quan trọng trong việc kiến tạo không gian sống tiện nghi và hiện đại. Với các thiết kế tối giản nhưng đầy đủ chức năng, nội thất ngày nay đáp ứng tốt nhu cầu của người dùng trong mọi hoàn cảnh, từ nhà ở, văn phòng cho đến không gian công cộng. Chất liệu như gỗ tự nhiên, thép không gỉ, và kính cường lực không chỉ đảm bảo độ bền mà còn mang lại vẻ đẹp sang trọng và độc đáo. Nội thất thông minh cũng đang là xu hướng, giúp tiết kiệm không gian và tối ưu hóa tiện ích trong các căn hộ nhỏ', 'ST', 72, 78, 'https://product.hstatic.net/200000065946/product/pro_dem_xam_dam_noi_that_moho_ghe_sofa_kolding_2m_1_6_6687dc52fc4e48ecb82f27d5d9de3cca_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSNCB701.N20', 'Ghế Sofa Gỗ Cao Su Tự Nhiên MOHO MOSS 601', 15490000, 25, 'Với sự phát triển không ngừng, ngành nội thất luôn mang đến những giải pháp sáng tạo cho mọi không gian. Các sản phẩm được thiết kế thông minh để vừa tiết kiệm diện tích vừa đảm bảo tính thẩm mỹ cao. Nội thất đa năng, chẳng hạn như ghế sofa tích hợp giường ngủ hoặc tủ có chức năng lưu trữ, đang dần trở thành sự lựa chọn phổ biến cho các gia đình hiện đại.', 'GSF', 90, 61, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_sofa_go_moss_7_aa9094ddb7cb47738f67a0db521f5c1a_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSNCB901.C19', 'Ghế Sofa Gỗ Cao Su Tự Nhiên MOHO TROMSO 601', 19990000, 9, 'Với sự phát triển không ngừng, ngành nội thất luôn mang đến những giải pháp sáng tạo cho mọi không gian. Các sản phẩm được thiết kế thông minh để vừa tiết kiệm diện tích vừa đảm bảo tính thẩm mỹ cao. Nội thất đa năng, chẳng hạn như ghế sofa tích hợp giường ngủ hoặc tủ có chức năng lưu trữ, đang dần trở thành sự lựa chọn phổ biến cho các gia đình hiện đại.', 'GSF', 70, 8, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ghe_sofa_go_tromso_ce35d6cbc3934c5788dc15cabb66d715_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSNCC701.G20', 'Ghế Sofa MOHO LEEDS 701', 15490000, 18, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'GSF', 62, 9, 'https://product.hstatic.net/200000065946/product/pro_xanh_duong_noi_that_moho_ghe_sofa_go_leeds_6_9536e54d617047f294d531be8ad3e698_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSNCC801.B18', 'Ghế Sofa Gỗ Tràm Tự Nhiên MOHO VLINE 601 Màu Xám Đậm', 8490000, 14, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'GSF', 60, 123, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_sofa_go_tram_vline_1_07104f24cbc14a3c8450de236374eae4_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSNCC801.N18', 'Ghế Sofa Gỗ Cao Su Tự Nhiên MOHO VLINE 601 Màu Xám Đậm', 8490000, 16, 'Với sự phát triển không ngừng, ngành nội thất luôn mang đến những giải pháp sáng tạo cho mọi không gian. Các sản phẩm được thiết kế thông minh để vừa tiết kiệm diện tích vừa đảm bảo tính thẩm mỹ cao. Nội thất đa năng, chẳng hạn như ghế sofa tích hợp giường ngủ hoặc tủ có chức năng lưu trữ, đang dần trở thành sự lựa chọn phổ biến cho các gia đình hiện đại.', 'GSF', 84, 66, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_sofa_go_vline_1_4fd0cd2ed09a4e368d6324d884bfce99_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSNCC802.B18', 'Ghế Sofa Gỗ Tràm Tự Nhiên MOHO VLINE 601', 8490000, 12, 'Với sự phát triển không ngừng, ngành nội thất luôn mang đến những giải pháp sáng tạo cho mọi không gian. Các sản phẩm được thiết kế thông minh để vừa tiết kiệm diện tích vừa đảm bảo tính thẩm mỹ cao. Nội thất đa năng, chẳng hạn như ghế sofa tích hợp giường ngủ hoặc tủ có chức năng lưu trữ, đang dần trở thành sự lựa chọn phổ biến cho các gia đình hiện đại.', 'GSF', 72, 537, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_sofa_go_vline_dem_be_2_8481c99127b74a319d33504cd3227b34_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSNCC802.N18', 'Ghế Sofa Gỗ Cao Su Tự Nhiên MOHO VLINE 601', 8490000, 12, 'Với sự phát triển không ngừng, ngành nội thất luôn mang đến những giải pháp sáng tạo cho mọi không gian. Các sản phẩm được thiết kế thông minh để vừa tiết kiệm diện tích vừa đảm bảo tính thẩm mỹ cao. Nội thất đa năng, chẳng hạn như ghế sofa tích hợp giường ngủ hoặc tủ có chức năng lưu trữ, đang dần trở thành sự lựa chọn phổ biến cho các gia đình hiện đại.', 'GSF', 24, 488, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_sofa_go_vline_1_19dcd6f51c9a452cb3647ae432b20e0f_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSNCE301.B18', 'Ghế Sofa HOBRO 301 Bên Trái', 10490000, 24, 'Với sự phát triển không ngừng, ngành nội thất luôn mang đến những giải pháp sáng tạo cho mọi không gian. Các sản phẩm được thiết kế thông minh để vừa tiết kiệm diện tích vừa đảm bảo tính thẩm mỹ cao. Nội thất đa năng, chẳng hạn như ghế sofa tích hợp giường ngủ hoặc tủ có chức năng lưu trữ, đang dần trở thành sự lựa chọn phổ biến cho các gia đình hiện đại.', 'GSF', 60, 1, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_xam_noi_that_moho_ghe_sofa_goc___1__4e6f53e943b74496b52e469bc0ec1b42_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSNCE302.B18', 'GHẾ SOFA HOBRO 301 (180) BÊN PHẢI', 10490000, 9, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'GSF', 75, 4, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_xam_noi_that_moho_sofa_trai_2a_17e4134d6a3f4d6da67504ed41c424d6_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSNCE701.B18', 'Ghế Sofa MOHO HALDEN 801', 9490500, 20, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'GSF', 59, 6, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_bdc5094c1d0a4520b209c54ea88e10ba_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSNCE701.N16', 'Ghế Sofa MOHO LYNGBY 601', 9015500, 23, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'GSF', 53, 1, 'https://product.hstatic.net/200000065946/product/pro_be_noi_that_moho_sofa_lyngby__2__e2a03c4c157949509a00cec546e3ae6b_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSNCE702.N19', 'Ghế Sofa MOHO LYNGBY Góc L', 11390500, 3, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'GSF', 88, 4, 'https://product.hstatic.net/200000065946/product/pro_be_noi_that_moho___1__2a8d850c5cba4d0c87f1b4803eace91d_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSNSVLLG14.B18', 'Ghế Sofa Góc Chữ L Gỗ Cao Su Tự Nhiên MOHO VLINE 601', 12290000, 22, 'Với sự phát triển không ngừng, ngành nội thất luôn mang đến những giải pháp sáng tạo cho mọi không gian. Các sản phẩm được thiết kế thông minh để vừa tiết kiệm diện tích vừa đảm bảo tính thẩm mỹ cao. Nội thất đa năng, chẳng hạn như ghế sofa tích hợp giường ngủ hoặc tủ có chức năng lưu trữ, đang dần trở thành sự lựa chọn phổ biến cho các gia đình hiện đại.', 'GSF', 97, 66, 'https://product.hstatic.net/200000065946/product/dsc02535_d64ac0bacdca49508a05ed62a8a178c2_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSSCB801.B06', 'Ghế Đôn Sofa Gỗ Cao Su Tự Nhiên MOHO VLINE 601 Màu Xám Đậm', 1990000, 2, 'Không gian nội thất không chỉ ảnh hưởng đến hiệu suất làm việc mà còn góp phần cải thiện tâm trạng của con người. Những món đồ như bàn làm việc gọn nhẹ, ghế ngồi thoải mái hay tủ lưu trữ rộng rãi đều được thiết kế để mang lại sự tiện nghi và cảm hứng trong công việc. Việc sử dụng các chất liệu thân thiện với môi trường cũng đang trở thành xu hướng trong thiết kế nội thất hiện đại.', 'LV-BLV', 69, 120, 'https://product.hstatic.net/200000065946/product/pro_nau_ghe_don_sofa_vline_7_e059afd3419943ea8baeabeefa35a6e4_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSSCC201.N06', 'Ghế Đôn Sofa Gỗ Cao Su Tự Nhiên MOHO FYN 601', 1990000, 18, 'Nội thất đóng vai trò quan trọng trong việc kiến tạo không gian sống tiện nghi và hiện đại. Với các thiết kế tối giản nhưng đầy đủ chức năng, nội thất ngày nay đáp ứng tốt nhu cầu của người dùng trong mọi hoàn cảnh, từ nhà ở, văn phòng cho đến không gian công cộng. Chất liệu như gỗ tự nhiên, thép không gỉ, và kính cường lực không chỉ đảm bảo độ bền mà còn mang lại vẻ đẹp sang trọng và độc đáo. Nội thất thông minh cũng đang là xu hướng, giúp tiết kiệm không gian và tối ưu hóa tiện ích trong các căn hộ nhỏ', 'LV-BLV', 28, 11, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_don_sofa_fyn_601_1_243f8562383e401a85e59987eb24bac1_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSSCC801.B06', 'Baya-Signature Năm 2025 - RDTWKDAG', 1990000, 7, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'ST', 49, 255, 'https://product.hstatic.net/200000065946/product/pro_nau_ghe_don_sofa_vline_be_1_9398f1a205464fa183ec802df207938a_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSSCE301.B07', 'Ghế Đôn Sofa HOBRO 301', 2990000, 5, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'LV-BLV', 76, 4, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ghe_don_sofa___3__4fe4852690674f24989926064034243e_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSTCA603.B10', 'Bàn Sofa - Bàn Cafe - Bàn Trà Gỗ Thông MOHO VLINE 501', 1990000, 6, 'Nội thất đóng vai trò quan trọng trong việc kiến tạo không gian sống tiện nghi và hiện đại. Với các thiết kế tối giản nhưng đầy đủ chức năng, nội thất ngày nay đáp ứng tốt nhu cầu của người dùng trong mọi hoàn cảnh, từ nhà ở, văn phòng cho đến không gian công cộng. Chất liệu như gỗ tự nhiên, thép không gỉ, và kính cường lực không chỉ đảm bảo độ bền mà còn mang lại vẻ đẹp sang trọng và độc đáo. Nội thất thông minh cũng đang là xu hướng, giúp tiết kiệm không gian và tối ưu hóa tiện ích trong các căn hộ nhỏ', 'LV-BLV', 29, 568, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_sofa_ban_tra_ban_cafe_go_vline_501_223bf2f124a5446a9d60d48b379be0ad_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSTCA603.N10', 'Baya-Signature Năm 2025 - SEZCBRTW', 1990000, 15, 'Nội thất đóng vai trò quan trọng trong việc kiến tạo không gian sống tiện nghi và hiện đại. Với các thiết kế tối giản nhưng đầy đủ chức năng, nội thất ngày nay đáp ứng tốt nhu cầu của người dùng trong mọi hoàn cảnh, từ nhà ở, văn phòng cho đến không gian công cộng. Chất liệu như gỗ tự nhiên, thép không gỉ, và kính cường lực không chỉ đảm bảo độ bền mà còn mang lại vẻ đẹp sang trọng và độc đáo. Nội thất thông minh cũng đang là xu hướng, giúp tiết kiệm không gian và tối ưu hóa tiện ích trong các căn hộ nhỏ', 'ST', 42, 275, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ban_sofa_vline_601_01_ef3e51bcd70b4879bcbbca2928a5a906_master.png', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSTCB501.N06', 'Baya-Signature Năm 2025 - QXGXIWDM', 590000, 7, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'ST', 7, 195, 'https://product.hstatic.net/200000065946/product/pro_trang_xam_noi_that_moho_ban_sofa_verona_06_0a991d27f8d24cbcbbf5876383a2e72f_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSTCB501.N07', 'Baya-Signature Năm 2025 - PINBWUOE', 599000, 15, 'Với sự phát triển không ngừng, ngành nội thất luôn mang đến những giải pháp sáng tạo cho mọi không gian. Các sản phẩm được thiết kế thông minh để vừa tiết kiệm diện tích vừa đảm bảo tính thẩm mỹ cao. Nội thất đa năng, chẳng hạn như ghế sofa tích hợp giường ngủ hoặc tủ có chức năng lưu trữ, đang dần trở thành sự lựa chọn phổ biến cho các gia đình hiện đại.', 'ST', 3, 210, 'https://product.hstatic.net/200000065946/product/pro_xam_noi_that_moho_ban_sofa_verona_07_b86fcc1afedf431187f5dac3e56fb449_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSTCB502.N06', 'Baya-Signature Năm 2025 - RADZVJCR', 590000, 2, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'ST', 4, 191, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ban_sofa__ban_tra_go_cao_su_milan_601_cff8c5a279094d5a891809d9e8bf3221_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSTCC902.B08', 'Bàn Sofa - Bàn Cafe - Bàn Trà Gỗ MOHO HOBRO 601', 2190000, 14, 'Không gian nội thất không chỉ ảnh hưởng đến hiệu suất làm việc mà còn góp phần cải thiện tâm trạng của con người. Những món đồ như bàn làm việc gọn nhẹ, ghế ngồi thoải mái hay tủ lưu trữ rộng rãi đều được thiết kế để mang lại sự tiện nghi và cảm hứng trong công việc. Việc sử dụng các chất liệu thân thiện với môi trường cũng đang trở thành xu hướng trong thiết kế nội thất hiện đại.', 'LV-BLV', 79, 12, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_tra_sofa_go_hobro_7_f7a5a581bd4643dda8f6f8535a730644_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSTCE301.B09', 'Bàn Sofa HOBRO 301 (màu nâu 90)', 1790000, 16, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'LV-BLV', 60, 12, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ban_sofa_hobro___1__b8b2225e1732409086e953121185762d_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSTSOL901.BST2', 'Baya-Signature Năm 2025 - PPXCYWOC', 1990000, 10, 'Nội thất đóng vai trò quan trọng trong việc kiến tạo không gian sống tiện nghi và hiện đại. Với các thiết kế tối giản nhưng đầy đủ chức năng, nội thất ngày nay đáp ứng tốt nhu cầu của người dùng trong mọi hoàn cảnh, từ nhà ở, văn phòng cho đến không gian công cộng. Chất liệu như gỗ tự nhiên, thép không gỉ, và kính cường lực không chỉ đảm bảo độ bền mà còn mang lại vẻ đẹp sang trọng và độc đáo. Nội thất thông minh cũng đang là xu hướng, giúp tiết kiệm không gian và tối ưu hóa tiện ích trong các căn hộ nhỏ', 'ST', 14, 103, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_set_ban_tra_sofa_oslo_1_f0021fb1071e4b2e9c357f2ed39539e6_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFSTSV601.GW2', 'Baya-Signature Năm 2025 - UWZNFKHJ', 990000, 4, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'ST', 17, 155, 'https://product.hstatic.net/200000065946/product/pro_trang_xam_noi_that_moho_set_2_ban_sofa_milan_602_1_44ce4340a4764520a5754ffc2934687e_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFTCCA901.B16', 'Baya-Signature Năm 2025 - JFBGAPIP', 3790000, 11, 'Với sự phát triển không ngừng, ngành nội thất luôn mang đến những giải pháp sáng tạo cho mọi không gian. Các sản phẩm được thiết kế thông minh để vừa tiết kiệm diện tích vừa đảm bảo tính thẩm mỹ cao. Nội thất đa năng, chẳng hạn như ghế sofa tích hợp giường ngủ hoặc tủ có chức năng lưu trữ, đang dần trở thành sự lựa chọn phổ biến cho các gia đình hiện đại.', 'ST', 72, 345, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_ke_tivi_vline_2b_d168fb57701b4610a26aa5e2cb53e559_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFTCCA901.N16', 'Baya-Signature Năm 2025 - OMKRIALR', 3790000, 20, 'Với sự phát triển không ngừng, ngành nội thất luôn mang đến những giải pháp sáng tạo cho mọi không gian. Các sản phẩm được thiết kế thông minh để vừa tiết kiệm diện tích vừa đảm bảo tính thẩm mỹ cao. Nội thất đa năng, chẳng hạn như ghế sofa tích hợp giường ngủ hoặc tủ có chức năng lưu trữ, đang dần trở thành sự lựa chọn phổ biến cho các gia đình hiện đại.', 'ST', 10, 197, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ke_tu_tivi_go_vline_301_1_71e3f02ab71746249ebf623b48f788ae_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFTCCB701.M18', 'Tủ Kệ Tivi Gỗ MOHO LEEDS 701', 3490000, 18, 'Với sự phát triển không ngừng, ngành nội thất luôn mang đến những giải pháp sáng tạo cho mọi không gian. Các sản phẩm được thiết kế thông minh để vừa tiết kiệm diện tích vừa đảm bảo tính thẩm mỹ cao. Nội thất đa năng, chẳng hạn như ghế sofa tích hợp giường ngủ hoặc tủ có chức năng lưu trữ, đang dần trở thành sự lựa chọn phổ biến cho các gia đình hiện đại.', 'T', 24, 9, 'https://product.hstatic.net/200000065946/product/pro_go_phoi_den_noi_that_moho_tu_ke_tivi_leeds_10_e5384e8867ae4bda83d67fb678a411f6_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFTCCBN01.B16', 'Tủ Kệ Tivi Gỗ MOHO ODENSE 601', 4490000, 2, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'T', 56, 29, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_noi_that_moho_tu_ke_tivi_go_odense_1_7e38c3d35dd0414f8d9172e3f0f1f1bf_master.png', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFTCCC702.K16', 'Tủ Kệ Tivi Gỗ MOHO KOLDING 702', 3799000, 7, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'T', 24, 23, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_ke_tivi_kolding_1_e504bddf2c8e41799626f1569d7f9a9a_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFTCCDN01.B16', 'Tủ Kệ Tivi Gỗ MOHO UBEDA 201', 2190000, 2, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'T', 1, 9, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu___1__645338e0da8641539b7e681fbfd12d2a_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFTCCE301.B18', 'Kệ TV MOHO HOBRO 301 (Màu Nâu 180)', 3990000, 16, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'LV-BLV', 20, 18, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ke_tv_hobro_a_636d5c00e6a849b391264d64c121739f_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFTNCAO01.B11', 'Baya-Signature Năm 2025 - SUNOZXNP', 1990000, 23, 'Với sự phát triển không ngừng, ngành nội thất luôn mang đến những giải pháp sáng tạo cho mọi không gian. Các sản phẩm được thiết kế thông minh để vừa tiết kiệm diện tích vừa đảm bảo tính thẩm mỹ cao. Nội thất đa năng, chẳng hạn như ghế sofa tích hợp giường ngủ hoặc tủ có chức năng lưu trữ, đang dần trở thành sự lựa chọn phổ biến cho các gia đình hiện đại.', 'ST', 50, 480, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_lam_viec_vline_601_a_e60e2f8b72854311ae12424eed3cb88a_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFTNCAO01.N11', 'Baya-Signature Năm 2025 - TMZTOOOS', 1990000, 16, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'ST', 58, 335, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ban_lam_viec_vline_1_92060b73c393469181d9d24218c38851_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFWRBJN02.1205', 'Tủ quần áo MOHO VIENNA Ngăn Kệ Ver 1', 1999000, 11, 'Với sự phát triển không ngừng, ngành nội thất luôn mang đến những giải pháp sáng tạo cho mọi không gian. Các sản phẩm được thiết kế thông minh để vừa tiết kiệm diện tích vừa đảm bảo tính thẩm mỹ cao. Nội thất đa năng, chẳng hạn như ghế sofa tích hợp giường ngủ hoặc tủ có chức năng lưu trữ, đang dần trở thành sự lựa chọn phổ biến cho các gia đình hiện đại.', 'T', 87, 9, 'https://product.hstatic.net/200000065946/product/pro_khong_tay_nam_noi_that_moho_tu_quan_ao___2__9032f41e77c64fe2aec22ded8aa7b8fe_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFWRCA505.B05', 'Tủ quần áo VIENNA Ver 1 H50', 4290000, 8, 'Nội thất đóng vai trò quan trọng trong việc kiến tạo không gian sống tiện nghi và hiện đại. Với các thiết kế tối giản nhưng đầy đủ chức năng, nội thất ngày nay đáp ứng tốt nhu cầu của người dùng trong mọi hoàn cảnh, từ nhà ở, văn phòng cho đến không gian công cộng. Chất liệu như gỗ tự nhiên, thép không gỉ, và kính cường lực không chỉ đảm bảo độ bền mà còn mang lại vẻ đẹp sang trọng và độc đáo. Nội thất thông minh cũng đang là xu hướng, giúp tiết kiệm không gian và tối ưu hóa tiện ích trong các căn hộ nhỏ', 'T', 39, 15, 'https://product.hstatic.net/200000065946/product/dsc03920_c130055209914c52b37fac712e9a4cc6_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFWRCA901.W05', 'Baya-Signature Năm 2025 - RFNDKTJG', 2990000, 6, 'Với sự phát triển không ngừng, ngành nội thất luôn mang đến những giải pháp sáng tạo cho mọi không gian. Các sản phẩm được thiết kế thông minh để vừa tiết kiệm diện tích vừa đảm bảo tính thẩm mỹ cao. Nội thất đa năng, chẳng hạn như ghế sofa tích hợp giường ngủ hoặc tủ có chức năng lưu trữ, đang dần trở thành sự lựa chọn phổ biến cho các gia đình hiện đại.', 'ST', 13, 50, 'https://product.hstatic.net/200000065946/product/pro_trang_noi_that_moho_tu_ke_ngan_05_6fac2f95f5d84489a07b6366f3bf4167_master.png', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFWRCB801.B10', 'Baya-Signature Năm 2025 - LITOYIGZ', 6790000, 4, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'ST', 28, 71, 'https://product.hstatic.net/200000065946/product/pro_version_1_noi_that_moho_tu_quan_ao_go_fiji_7ec18dabdfdc4964a559e22eeda8817b_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFWRCBD01.B05', 'Tủ quần áo VIENNA Tay Nắm Ver 1 S50', 2190000, 3, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'T', 2, 16, 'https://product.hstatic.net/200000065946/product/pro_co_tay_nam_noi_that_moho___3__1170c021070b409b923b0621e41a48ee_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFWRCBD03.M05', 'Tủ quần áo VIENNA Tay Nắm Ver 1 H50', 2190000, 2, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'T', 64, 14, 'https://product.hstatic.net/200000065946/product/pro_co_tay_nam_noi_that_moho_tu_quan_ao___1__9f31d69e6ca74e109e7c209dc1406ee2_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFWRCD504.B05', 'Baya-Signature Năm 2025 - BHXMOXOY', 4290000, 24, 'Với sự phát triển không ngừng, ngành nội thất luôn mang đến những giải pháp sáng tạo cho mọi không gian. Các sản phẩm được thiết kế thông minh để vừa tiết kiệm diện tích vừa đảm bảo tính thẩm mỹ cao. Nội thất đa năng, chẳng hạn như ghế sofa tích hợp giường ngủ hoặc tủ có chức năng lưu trữ, đang dần trở thành sự lựa chọn phổ biến cho các gia đình hiện đại.', 'ST', 49, 397, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_vienna_1_canh_50cm_32_f3b81560a67946e79454af413efe30db_master.png', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFWRCD505.W05', 'Baya-Signature Năm 2025 - FEATNFDJ', 4290000, 16, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'ST', 86, 287, 'https://product.hstatic.net/200000065946/product/vienna_wardrobe_wh_1_t_4e06cc783cb4400fab838a87a6a28d08_master.png', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFWRCD506.B10', 'Tủ Quần Áo Gỗ 2 Cánh MOHO VIENNA 201', 6490000, 8, 'Không gian nội thất không chỉ ảnh hưởng đến hiệu suất làm việc mà còn góp phần cải thiện tâm trạng của con người. Những món đồ như bàn làm việc gọn nhẹ, ghế ngồi thoải mái hay tủ lưu trữ rộng rãi đều được thiết kế để mang lại sự tiện nghi và cảm hứng trong công việc. Việc sử dụng các chất liệu thân thiện với môi trường cũng đang trở thành xu hướng trong thiết kế nội thất hiện đại.', 'T', 13, 642, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_vienna_2_canh_1m_a_99418c1b50054f7e894915aa4766e49c_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFWRCD701.B10', 'Tủ Quần Áo Gỗ MOHO HOBRO 301 2 Cánh', 8290000, 16, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'T', 52, 93, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_2_canh_1m_a_99e290973a194592b576364340a288e5_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFWRCD702.B05', 'Tủ Quần Áo Gỗ HOBRO 301 Kệ Ngăn', 4790000, 5, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'T', 65, 31, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_ngan_ke_57_c69356d22fd44bbc9cbf71bb95d3ccf4_master.png', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFWRCD703.B05', 'Tủ Quần Áo Gỗ HOBRO 301 Thanh Treo', 4790000, 2, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'T', 75, 34, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_thanh_treo_16_112ad0bbab8e4811a2b9abf837d27e72_master.png', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFWRCD802.N05', 'Baya-Signature Năm 2025 - GTBBMNHW', 4490000, 19, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'ST', 95, 402, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_tu_quan_ao_vline_601_52cm_5_1__22e767c2f9c542b397669c65390afa27_master.png', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFWRCDD01.B05', 'Baya-Signature Năm 2025 - PFFOFZXW', 4290000, 15, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'ST', 34, 89, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_vienna_tay_nam_ke_go_1_e06da42023f0469f967173ed338b0791_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFWRCDD02.M10', 'Baya-Signature Năm 2025 - JBRFDLEP', 6490000, 15, 'Nội thất đóng vai trò quan trọng trong việc kiến tạo không gian sống tiện nghi và hiện đại. Với các thiết kế tối giản nhưng đầy đủ chức năng, nội thất ngày nay đáp ứng tốt nhu cầu của người dùng trong mọi hoàn cảnh, từ nhà ở, văn phòng cho đến không gian công cộng. Chất liệu như gỗ tự nhiên, thép không gỉ, và kính cường lực không chỉ đảm bảo độ bền mà còn mang lại vẻ đẹp sang trọng và độc đáo. Nội thất thông minh cũng đang là xu hướng, giúp tiết kiệm không gian và tối ưu hóa tiện ích trong các căn hộ nhỏ', 'ST', 49, 200, 'https://product.hstatic.net/200000065946/product/pro_go_phoi_trang_noi_that_moho_tu_quan_ao_vienna_2_canh_47_882a1ed667d74a8e8fdac54709d51ec0_master.png', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFWRCDD03.N05', 'Baya-Signature Năm 2025 - KYFGCSSA', 4290000, 5, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'ST', 6, 91, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_phoi_trang_noi_that_moho_tu_quan_ao_vienna_2_d431b87a01de4731a2f3cd8e7610297a_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFWRHB301V2.BMH', 'Set Tủ Quần Áo Gỗ MOHO HOBRO 301 3 Cánh Thanh Treo', 10990000, 6, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'LV-BLV', 54, 15, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_3_canh_1m5_8_3219fa946ce34d74ba14e9f30a277c74_master.png', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFWRHB301V2.BMS', 'Set Tủ Quần Áo MOHO HOBRO 301 3 Cánh Ngăn Kệ', 10990000, 13, 'Nội thất không gian sống là sự giao thoa giữa nghệ thuật và công năng. Các sản phẩm như bàn ăn, ghế thư giãn, và kệ sách không chỉ đáp ứng nhu cầu sử dụng hàng ngày mà còn là điểm nhấn thẩm mỹ quan trọng. Các nhà thiết kế ngày càng chú trọng vào việc kết hợp ánh sáng, màu sắc, và bố cục để tạo ra sự hài hòa trong không gian nội thất', 'LV-BLV', 84, 39, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_3_canh_1m5_c638686e30974318a0489748bdb3888e_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFWRHB301V2.BSH', 'Set Tủ Quần Áo Gỗ MOHO HOBRO 301 2 Cánh', 8490000, 23, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'LV-BLV', 81, 21, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_2_canh_1m_20_2362be8605d8485b95efeffc54e3b447_master.png', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFWRHB301V2.BSMH', 'Set Tủ Quần Áo Gỗ MOHO HOBRO 301 4 Cánh', 14990000, 1, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'LV-BLV', 32, 16, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_4_canh_2m_2_de601cd722564fbcb1c72a4aa85de17f_master.png', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFWRSV201V2.BMS', 'Baya-Signature Năm 2025 - TCTJTBIL', 10290000, 10, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'ST', 91, 110, 'https://product.hstatic.net/200000065946/product/pro_nau_tu_quan_ao_go_vline_1m5_9_1__6ec40d8210b34bc3845327bc455be324_0a700313600b43849852e8e1bfb3ba4a_master.png', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFWRSVN201V2.BMS', 'Baya-Signature Năm 2025 - ZJKOXGPT', 8990000, 23, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'ST', 96, 245, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_vienna_21_cafa99a772f642cabe79360562a36700_master.png', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFWRSVN201V2.BSH', 'Baya-Signature Năm 2025 - ENKLFHGF', 6790000, 7, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'ST', 39, 48, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_vienna_2_canh_1m_33_5c46811848204476865917f28dbc79c4_master.png', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFWRSVN201V2.MMH', 'Baya-Signature Năm 2025 - CPZIZVYH', 8990000, 16, 'Với sự phát triển không ngừng, ngành nội thất luôn mang đến những giải pháp sáng tạo cho mọi không gian. Các sản phẩm được thiết kế thông minh để vừa tiết kiệm diện tích vừa đảm bảo tính thẩm mỹ cao. Nội thất đa năng, chẳng hạn như ghế sofa tích hợp giường ngủ hoặc tủ có chức năng lưu trữ, đang dần trở thành sự lựa chọn phổ biến cho các gia đình hiện đại.', 'ST', 41, 71, 'https://product.hstatic.net/200000065946/product/pro_go_phoi_trang_tu_quan_ao_3_canh_vienna_201_2_54feb0ad5d204951b658e42981c288a4_master.png', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFWRSVN201V2.NSMH', 'Baya-Signature Năm 2025 - TKAWBUOV', 11490000, 10, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'ST', 31, 79, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_set_tu_quan_ao_vienna_a_6340457b0bb842fca7952aa4cbececfe_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFWRSVNH201V2.MMS', 'Baya-Signature Năm 2025 - SHRZCZOX', 8990000, 24, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'ST', 80, 65, 'https://product.hstatic.net/200000065946/product/pro_go_phoi_trang_noi_that_moho_tu_quan_ao_go_3_canh_vienna_2_9bd7280452d64b56af328c1377e4649c_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFWRSVNH201V2.MSH', 'Baya-Signature Năm 2025 - VLZNPTFZ', 6790000, 14, 'Với sự phát triển không ngừng, ngành nội thất luôn mang đến những giải pháp sáng tạo cho mọi không gian. Các sản phẩm được thiết kế thông minh để vừa tiết kiệm diện tích vừa đảm bảo tính thẩm mỹ cao. Nội thất đa năng, chẳng hạn như ghế sofa tích hợp giường ngủ hoặc tủ có chức năng lưu trữ, đang dần trở thành sự lựa chọn phổ biến cho các gia đình hiện đại.', 'ST', 36, 31, 'https://product.hstatic.net/200000065946/product/pro_go_phoi_trang_noi_that_moho_tu_quan_ao_go_vienna_2_381ae861d7664f018a1bce952d3ba20e_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFWRSVNH201V2.NHM', 'Baya-Signature Năm 2025 - XIBILKUT', 8990000, 1, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'ST', 51, 24, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_quan_ao_go_3_canh_1_c24a747dd0094852ad9bb45a3c42caf6_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MFWRSVNH201V2.NHMS', 'Set Tủ Quần Áo Gỗ MOHO VIENNA Tay Nắm 201 4 Cánh 4 Màu', 11490000, 10, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'LV-BLV', 81, 32, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_tu_quan_ao_vienna_4_canh_3_7dfdb5dd74ad469fa4214edb640a54ca_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCD801.BG1', 'Combo Basic Phòng Khách Grenaa 201 Màu Nâu', 6990000, 21, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'FH', 56, 45, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__2__ab3fc9ded04c4f5b8840dfdcd23af42f_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCD801.BG2', 'Combo Basic Phòng Ngủ Grenaa 201 Màu Nâu', 6490000, 2, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'FH', 75, 38, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__7__69d231891277473fbe532e1af7244cbb_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCD801.BG3', 'Combo Basic Phòng Ăn Grenaa 201 Màu Nâu', 5490000, 21, 'Với sự phát triển không ngừng, ngành nội thất luôn mang đến những giải pháp sáng tạo cho mọi không gian. Các sản phẩm được thiết kế thông minh để vừa tiết kiệm diện tích vừa đảm bảo tính thẩm mỹ cao. Nội thất đa năng, chẳng hạn như ghế sofa tích hợp giường ngủ hoặc tủ có chức năng lưu trữ, đang dần trở thành sự lựa chọn phổ biến cho các gia đình hiện đại.', 'FH', 54, 48, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__13__7b36d81feb2f406caa970117eda1ffef_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCD801.BG31', 'Full House Bộ Sưu Tập Grenaa 201 Màu Nâu', 25990000, 24, 'Việc lựa chọn nội thất phù hợp là yếu tố quan trọng để tạo nên không gian sống lý tưởng. Các thiết kế hiện nay không chỉ đẹp mắt mà còn thân thiện với người dùng, chẳng hạn như giường ngủ điều chỉnh linh hoạt, bàn có thể mở rộng hay tủ tích hợp nhiều ngăn kéo. Các chất liệu phổ biến như gỗ công nghiệp, kim loại sơn tĩnh điện, và vải cao cấp mang đến sự lựa chọn đa dạng cho khách hàng.', 'FH', 77, 16, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__17__d497024658fd44958d4c87aaf3ed4da2_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCD801.BG36', 'Full House (Combo Basic) Bộ Sưu Tập Grenaa 201 Màu Nâu', 16990000, 6, 'Với sự phát triển không ngừng, ngành nội thất luôn mang đến những giải pháp sáng tạo cho mọi không gian. Các sản phẩm được thiết kế thông minh để vừa tiết kiệm diện tích vừa đảm bảo tính thẩm mỹ cao. Nội thất đa năng, chẳng hạn như ghế sofa tích hợp giường ngủ hoặc tủ có chức năng lưu trữ, đang dần trở thành sự lựa chọn phổ biến cho các gia đình hiện đại.', 'FH', 57, 6, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__22__a76dca50353447dca2b62c36fe02f47f_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCD801.BG41', 'Full Combo Phòng Ngủ Grenaa 201 Màu Nâu', 9990000, 6, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'FCB', 11, 32, 'https://product.hstatic.net/200000065946/product/pro_full_combo_3_mon_noi_that_grenaa_moho__53__a966ba1922654d1fac0f1631d69edb5e_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCD802.MG4', 'Full Combo Phòng Khách Grenaa 201 Màu Nâu', 7990000, 11, 'Việc lựa chọn nội thất phù hợp là yếu tố quan trọng để tạo nên không gian sống lý tưởng. Các thiết kế hiện nay không chỉ đẹp mắt mà còn thân thiện với người dùng, chẳng hạn như giường ngủ điều chỉnh linh hoạt, bàn có thể mở rộng hay tủ tích hợp nhiều ngăn kéo. Các chất liệu phổ biến như gỗ công nghiệp, kim loại sơn tĩnh điện, và vải cao cấp mang đến sự lựa chọn đa dạng cho khách hàng.', 'FCB', 82, 26, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__26__25945458ba02412192ab68c2c04cb81e_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCD902.BN22', 'Combo Basic Phòng Ngủ Narvik 201 Màu Nâu', 5990000, 11, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'FH', 88, 15, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik_livingroom_giuong_ngu_9f419d98ab9248e2a9c74174a31b434e_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCD902.BN23', 'Combo Basic Phòng Khách Narvik 201 Màu Nâu', 7490000, 24, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'FH', 39, 8, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik_livingroom_basic_1_89ac244d12b6487c9191f26d359302f3_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCD902.BN24', 'Combo Basic Phòng Ăn Narvik 201 Màu Nâu', 5290000, 10, 'Với sự phát triển không ngừng, ngành nội thất luôn mang đến những giải pháp sáng tạo cho mọi không gian. Các sản phẩm được thiết kế thông minh để vừa tiết kiệm diện tích vừa đảm bảo tính thẩm mỹ cao. Nội thất đa năng, chẳng hạn như ghế sofa tích hợp giường ngủ hoặc tủ có chức năng lưu trữ, đang dần trở thành sự lựa chọn phổ biến cho các gia đình hiện đại.', 'FH', 49, 29, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik_diningroom_basic_0359beecfdec4d98a88a9abfce22cba3_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCD902.BN26', 'Full Combo Phòng Khách Narvik 201 Màu Nâu', 9290000, 4, 'Nội thất đóng vai trò quan trọng trong việc kiến tạo không gian sống tiện nghi và hiện đại. Với các thiết kế tối giản nhưng đầy đủ chức năng, nội thất ngày nay đáp ứng tốt nhu cầu của người dùng trong mọi hoàn cảnh, từ nhà ở, văn phòng cho đến không gian công cộng. Chất liệu như gỗ tự nhiên, thép không gỉ, và kính cường lực không chỉ đảm bảo độ bền mà còn mang lại vẻ đẹp sang trọng và độc đáo. Nội thất thông minh cũng đang là xu hướng, giúp tiết kiệm không gian và tối ưu hóa tiện ích trong các căn hộ nhỏ', 'FCB', 41, 11, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik_livingroom_full_d817b1f747df4c088f3aac13a135a875_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCD902.BN33', 'Full House Bộ Sưu Tập Narvik 201 Màu Nâu', 25490000, 13, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'FH', 40, 7, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik_livingroom_full_04c13065d93a456ebf817275c8c54780_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCD902.BN40', 'Full House (Combo Basic) Bộ Sưu Tập Narvik 201 Màu Nâu', 16490000, 4, 'Với sự phát triển không ngừng, ngành nội thất luôn mang đến những giải pháp sáng tạo cho mọi không gian. Các sản phẩm được thiết kế thông minh để vừa tiết kiệm diện tích vừa đảm bảo tính thẩm mỹ cao. Nội thất đa năng, chẳng hạn như ghế sofa tích hợp giường ngủ hoặc tủ có chức năng lưu trữ, đang dần trở thành sự lựa chọn phổ biến cho các gia đình hiện đại.', 'FH', 64, 0, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik__5__cfebcbd0fe564a7187e8566ba0c5af5e_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCD902.BN50', 'Full Combo Phòng Ngủ Narvik 201 Màu Nâu', 8990000, 6, 'Với sự phát triển không ngừng, ngành nội thất luôn mang đến những giải pháp sáng tạo cho mọi không gian. Các sản phẩm được thiết kế thông minh để vừa tiết kiệm diện tích vừa đảm bảo tính thẩm mỹ cao. Nội thất đa năng, chẳng hạn như ghế sofa tích hợp giường ngủ hoặc tủ có chức năng lưu trữ, đang dần trở thành sự lựa chọn phổ biến cho các gia đình hiện đại.', 'FCB', 82, 31, 'https://product.hstatic.net/200000065946/product/pro_full_combo_2_mon_noi_that_moho_narvik__11__1f45c1413ad1447d8525964ad7276859_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCD902.MN21', 'Combo Basic Phòng Ăn Narvik 201 Màu Tự Nhiên', 5290000, 17, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'FH', 11, 53, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__10__e84698ebcf7045e9b05d7d7809d153c3_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCD902.NN19', 'Combo Basic Phòng Ngủ Narvik 201 Màu Tự Nhiên', 5990000, 17, 'Không gian nội thất không chỉ ảnh hưởng đến hiệu suất làm việc mà còn góp phần cải thiện tâm trạng của con người. Những món đồ như bàn làm việc gọn nhẹ, ghế ngồi thoải mái hay tủ lưu trữ rộng rãi đều được thiết kế để mang lại sự tiện nghi và cảm hứng trong công việc. Việc sử dụng các chất liệu thân thiện với môi trường cũng đang trở thành xu hướng trong thiết kế nội thất hiện đại.', 'FH', 80, 39, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__15__3991cbf77ad8488fb644eef67a08790c_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCD902.NN20', 'Combo Basic Phòng Khách Narvik 201 Màu Tự Nhiên', 7490000, 6, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'FH', 35, 25, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__8__b68b0f7c19c347ccbf1a684d1f2e0804_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCD902.NN29', 'Full Combo Phòng Khách Narvik 201 Màu Tự Nhiên', 9290000, 6, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'FCB', 67, 9, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_full_combo_narvik__1__dbf183ed714f46968999199979123ba2_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCD902.NN32', 'Full House Bộ Sưu Tập Narvik 201 Màu Tự Nhiên', 25790000, 9, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'FH', 8, 15, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__6__c1d88e443a544802928070b5ab4a6a36_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCD902.NN39', 'Full House (Combo Basic) Bộ Sưu Tập Narvik 201 Màu Tự Nhiên', 16990000, 4, 'Với sự phát triển không ngừng, ngành nội thất luôn mang đến những giải pháp sáng tạo cho mọi không gian. Các sản phẩm được thiết kế thông minh để vừa tiết kiệm diện tích vừa đảm bảo tính thẩm mỹ cao. Nội thất đa năng, chẳng hạn như ghế sofa tích hợp giường ngủ hoặc tủ có chức năng lưu trữ, đang dần trở thành sự lựa chọn phổ biến cho các gia đình hiện đại.', 'FH', 16, 1, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_combo_narvik_coohom__25__9db84ca5bfe3493b99293aba2f246698_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCD902.NN47', 'Full Combo Phòng Ngủ Narvik 201 Màu Tự Nhiên', 8990000, 15, 'Nội thất đóng vai trò quan trọng trong việc kiến tạo không gian sống tiện nghi và hiện đại. Với các thiết kế tối giản nhưng đầy đủ chức năng, nội thất ngày nay đáp ứng tốt nhu cầu của người dùng trong mọi hoàn cảnh, từ nhà ở, văn phòng cho đến không gian công cộng. Chất liệu như gỗ tự nhiên, thép không gỉ, và kính cường lực không chỉ đảm bảo độ bền mà còn mang lại vẻ đẹp sang trọng và độc đáo. Nội thất thông minh cũng đang là xu hướng, giúp tiết kiệm không gian và tối ưu hóa tiện ích trong các căn hộ nhỏ', 'FCB', 81, 68, 'https://product.hstatic.net/200000065946/product/pro_combo_day_du_2_mon_noi_that_moho_narvik__28__1a37dc4910744280aca0677393b4c8da_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCDD01.BL1', 'Combo Basic Phòng Khách MOHO LANGO Màu Nâu Cam', 8290000, 13, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'FH', 33, 7, 'https://product.hstatic.net/200000065946/product/pro_noi_that_moho_combo_bs_1_lango_mau_nau__25__35770572d8d24fa79731fa12e4b148af_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCDD01.BL4', 'Full Combo Phòng Khách MOHO LANGO Màu Nâu Cam', 22850000, 19, 'Không gian nội thất không chỉ ảnh hưởng đến hiệu suất làm việc mà còn góp phần cải thiện tâm trạng của con người. Những món đồ như bàn làm việc gọn nhẹ, ghế ngồi thoải mái hay tủ lưu trữ rộng rãi đều được thiết kế để mang lại sự tiện nghi và cảm hứng trong công việc. Việc sử dụng các chất liệu thân thiện với môi trường cũng đang trở thành xu hướng trong thiết kế nội thất hiện đại.', 'FCB', 30, 7, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo_phong_khach_lango_mau_nau__22__d14f5fd0133d4ddf9f2984e2ca9db2f6_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCDD02.BK1', 'Combo Cơ Bản Phòng Khách MOHO KOSTER Màu Nâu', 8990000, 6, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'FH', 75, 18, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_full_combo_phong_khach_moho_koster_mau_nau__5__33889987df314f4084ca95d5c84e29f9_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCDD02.BK10', 'Full House (Combo Basic) MOHO KOSTER Màu Nâu', 24690000, 21, 'Không gian nội thất không chỉ ảnh hưởng đến hiệu suất làm việc mà còn góp phần cải thiện tâm trạng của con người. Những món đồ như bàn làm việc gọn nhẹ, ghế ngồi thoải mái hay tủ lưu trữ rộng rãi đều được thiết kế để mang lại sự tiện nghi và cảm hứng trong công việc. Việc sử dụng các chất liệu thân thiện với môi trường cũng đang trở thành xu hướng trong thiết kế nội thất hiện đại.', 'FH', 43, 1, 'https://product.hstatic.net/200000065946/product/pro_combo_full_house_1_noi_that_moho_koster_e720c470be4a456da8be33fb6717e06b_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCDD02.BK12', 'Full House MOHO KOSTER Màu Nâu', 29990000, 11, 'Nội thất không gian sống là sự giao thoa giữa nghệ thuật và công năng. Các sản phẩm như bàn ăn, ghế thư giãn, và kệ sách không chỉ đáp ứng nhu cầu sử dụng hàng ngày mà còn là điểm nhấn thẩm mỹ quan trọng. Các nhà thiết kế ngày càng chú trọng vào việc kết hợp ánh sáng, màu sắc, và bố cục để tạo ra sự hài hòa trong không gian nội thất', 'FH', 3, 20, 'https://product.hstatic.net/200000065946/product/pro_combo_full_house_2_noi_that_moho_koster__2__9d837792507d4a1082160ce4c6c8d49b_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCDD02.BK2', 'Full Combo Phòng Khách MOHO KOSTER Màu Nâu', 11290000, 19, 'Nội thất đóng vai trò quan trọng trong việc kiến tạo không gian sống tiện nghi và hiện đại. Với các thiết kế tối giản nhưng đầy đủ chức năng, nội thất ngày nay đáp ứng tốt nhu cầu của người dùng trong mọi hoàn cảnh, từ nhà ở, văn phòng cho đến không gian công cộng. Chất liệu như gỗ tự nhiên, thép không gỉ, và kính cường lực không chỉ đảm bảo độ bền mà còn mang lại vẻ đẹp sang trọng và độc đáo. Nội thất thông minh cũng đang là xu hướng, giúp tiết kiệm không gian và tối ưu hóa tiện ích trong các căn hộ nhỏ', 'FCB', 59, 20, 'https://product.hstatic.net/200000065946/product/o_nau_noi_that_moho_full_combo_phong_khach_moho_koster_mau_nau__23415__83c6ed699b72450ab7753785432d5c62_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCDD02.BK3', 'Combo Basic Phòng Ngủ MOHO KOSTER Màu Nâu', 7490000, 9, 'Không gian nội thất không chỉ ảnh hưởng đến hiệu suất làm việc mà còn góp phần cải thiện tâm trạng của con người. Những món đồ như bàn làm việc gọn nhẹ, ghế ngồi thoải mái hay tủ lưu trữ rộng rãi đều được thiết kế để mang lại sự tiện nghi và cảm hứng trong công việc. Việc sử dụng các chất liệu thân thiện với môi trường cũng đang trở thành xu hướng trong thiết kế nội thất hiện đại.', 'FH', 8, 27, 'https://product.hstatic.net/200000065946/product/pro_combo_bs_1_noi_that_moho_koster_9017545cd40c40938f498a421ad6f8b4_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCDD02.BK5', 'Full Combo Phòng Ngủ MOHO KOSTER Màu Nâu', 13490000, 13, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'FCB', 71, 28, 'https://product.hstatic.net/200000065946/product/pro_combo_full_combo_1_noi_that_moho_koster__15__3a43a366836b49ee812111da0da9101e_master.jpg', '2024-12-18', 50);
INSERT INTO `products` VALUES ('MHCBCDD02.BK7', 'Combo Phòng Ăn MOHO KOSTER Màu Nâu', 7490000, 13, 'Nội thất đóng vai trò quan trọng trong việc kiến tạo không gian sống tiện nghi và hiện đại. Với các thiết kế tối giản nhưng đầy đủ chức năng, nội thất ngày nay đáp ứng tốt nhu cầu của người dùng trong mọi hoàn cảnh, từ nhà ở, văn phòng cho đến không gian công cộng. Chất liệu như gỗ tự nhiên, thép không gỉ, và kính cường lực không chỉ đảm bảo độ bền mà còn mang lại vẻ đẹp sang trọng và độc đáo. Nội thất thông minh cũng đang là xu hướng, giúp tiết kiệm không gian và tối ưu hóa tiện ích trong các căn hộ nhỏ', 'FH', 80, 32, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo_phong_an_moho_koster_mau_nau_444_69fba7541b9d43ac9d6459bb7cb6f4eb_master.jpg', '2024-11-25', 50);
INSERT INTO `products` VALUES ('MHCBCDN01.BU10', 'Full Combo Phòng Khách Ubeda 201 Màu Nâu', 9490000, 24, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'FCB', 0, 9, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ubeda_livingroom_a4a14b63e87d4d0486eefd7402dbf9bd_master.jpg', '2024-12-01', 50);
INSERT INTO `products` VALUES ('MHCBCDN01.BU34', 'Full House Bộ Sưu Tập Ubeda 201 Màu Nâu', 37370000, 7, 'Nội thất đóng vai trò quan trọng trong việc kiến tạo không gian sống tiện nghi và hiện đại. Với các thiết kế tối giản nhưng đầy đủ chức năng, nội thất ngày nay đáp ứng tốt nhu cầu của người dùng trong mọi hoàn cảnh, từ nhà ở, văn phòng cho đến không gian công cộng. Chất liệu như gỗ tự nhiên, thép không gỉ, và kính cường lực không chỉ đảm bảo độ bền mà còn mang lại vẻ đẹp sang trọng và độc đáo. Nội thất thông minh cũng đang là xu hướng, giúp tiết kiệm không gian và tối ưu hóa tiện ích trong các căn hộ nhỏ', 'FH', 8, 11, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ubeda__4__8caaa3de3f5947cd8f177773225f1a16_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCDN01.BU37', 'Full House (Combo Basic) Bộ Sưu Tập Ubeda 201 Màu Nâu', 25500000, 11, 'Với sự phát triển không ngừng, ngành nội thất luôn mang đến những giải pháp sáng tạo cho mọi không gian. Các sản phẩm được thiết kế thông minh để vừa tiết kiệm diện tích vừa đảm bảo tính thẩm mỹ cao. Nội thất đa năng, chẳng hạn như ghế sofa tích hợp giường ngủ hoặc tủ có chức năng lưu trữ, đang dần trở thành sự lựa chọn phổ biến cho các gia đình hiện đại.', 'FH', 71, 1, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ubeda__6__61e1e0901d40426bae3d8e731496eeba_master.jpg', '2024-11-22', 50);
INSERT INTO `products` VALUES ('MHCBCDN01.BU43', 'Full Combo Phòng Ngủ Ubeda 201 Màu Nâu', 11580000, 7, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'FCB', 81, 26, 'https://product.hstatic.net/200000065946/product/pro_mau_full_combo_2_mon_noi_that_moho_ubeda__1__eea2b70440234e24bd295a71c399a1ae_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCDN01.BU7', 'Combo Basic Phòng Khách Ubeda 201 Màu Nâu', 7590000, 5, 'Nội thất đóng vai trò quan trọng trong việc kiến tạo không gian sống tiện nghi và hiện đại. Với các thiết kế tối giản nhưng đầy đủ chức năng, nội thất ngày nay đáp ứng tốt nhu cầu của người dùng trong mọi hoàn cảnh, từ nhà ở, văn phòng cho đến không gian công cộng. Chất liệu như gỗ tự nhiên, thép không gỉ, và kính cường lực không chỉ đảm bảo độ bền mà còn mang lại vẻ đẹp sang trọng và độc đáo. Nội thất thông minh cũng đang là xu hướng, giúp tiết kiệm không gian và tối ưu hóa tiện ích trong các căn hộ nhỏ', 'FH', 2, 16, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nau_noi_that_moho_ubeda__31__fe9f7cec37344929bdbbc89314a13247_master.jpg', '2024-11-08', 50);
INSERT INTO `products` VALUES ('MHCBCDN01.BU8', 'Combo Basic Phòng Ngủ Ubeda 201 Màu Nâu', 5690000, 3, 'Nội thất đóng vai trò quan trọng trong việc kiến tạo không gian sống tiện nghi và hiện đại. Với các thiết kế tối giản nhưng đầy đủ chức năng, nội thất ngày nay đáp ứng tốt nhu cầu của người dùng trong mọi hoàn cảnh, từ nhà ở, văn phòng cho đến không gian công cộng. Chất liệu như gỗ tự nhiên, thép không gỉ, và kính cường lực không chỉ đảm bảo độ bền mà còn mang lại vẻ đẹp sang trọng và độc đáo. Nội thất thông minh cũng đang là xu hướng, giúp tiết kiệm không gian và tối ưu hóa tiện ích trong các căn hộ nhỏ', 'FH', 87, 11, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nau_noi_that_moho_ubeda__40__6b87d8e809af48c5a7ac1c8023847507_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCDN01.BU9', 'Combo Basic Phòng Ăn Ubeda 201 Màu Nâu', 6490000, 24, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'FH', 44, 27, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_combo_1_b6ce41f6d34b4506a5df1233964415ec_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCDN01.NU13', 'Combo Basic Phòng Khách Ubeda 201 Màu Tự Nhiên', 7590000, 9, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'FH', 95, 14, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_combo_basic_phong_khach_ubeda_1_9e1100c9218b422d8538ee08a66968aa_master.jpg', '2024-11-05', 50);
INSERT INTO `products` VALUES ('MHCBCDN01.NU14', 'Combo Basic Phòng Ngủ Ubeda 201 Màu Tự Nhiên', 5690000, 24, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'FH', 93, 28, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_combo_basic_phong_ngu_ubeda_1_1ec8feaf56f5496a8fb52c4aa3c57688_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCDN01.NU15', 'Combo Basic Phòng Ăn Ubeda 201 Màu Tự Nhiên', 6490000, 19, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'FH', 41, 37, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_bo_ban_an_2_1f7ea22bb33b435f9df0f49622c7fc52_master.jpg', '2024-12-13', 50);
INSERT INTO `products` VALUES ('MHCBCDN01.NU16', 'Full Combo Phòng Khách Ubeda 201 Màu Tự Nhiên', 9490000, 20, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'FCB', 8, 12, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_ubeda__7__78e0cdb3e32848d39f9b8f2463fca450_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCDN01.NU35', 'Full House Bộ Sưu Tập Ubeda 201 Màu Tự Nhiên', 37370000, 17, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'FH', 22, 13, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_full_house_ubeda_1_1189e20105d54564a0054e572e2445d5_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCDN01.NU38', 'Full House (Combo Basic) Bộ Sưu Tập Ubeda 201 Màu Tự Nhiên', 25500000, 25, 'Nội thất đóng vai trò quan trọng trong việc kiến tạo không gian sống tiện nghi và hiện đại. Với các thiết kế tối giản nhưng đầy đủ chức năng, nội thất ngày nay đáp ứng tốt nhu cầu của người dùng trong mọi hoàn cảnh, từ nhà ở, văn phòng cho đến không gian công cộng. Chất liệu như gỗ tự nhiên, thép không gỉ, và kính cường lực không chỉ đảm bảo độ bền mà còn mang lại vẻ đẹp sang trọng và độc đáo. Nội thất thông minh cũng đang là xu hướng, giúp tiết kiệm không gian và tối ưu hóa tiện ích trong các căn hộ nhỏ', 'FH', 89, 1, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_full_house_ubeda_1_4a27b73a83db4ff39385fa7abebb2c3c_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MHCBCDN01.NU44', 'Full Combo Phòng Ngủ Ubeda 201 Màu Tự Nhiên', 9480000, 1, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'FCB', 14, 31, 'https://product.hstatic.net/200000065946/product/pro_full_combo_2_mon_noi_that_moho__22__9989cfef2a4e426badd66566cdada936_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MKGBCCDD01.B15', 'Hệ tủ bếp MOHO Kitchen Essential Grenaa Nhiều Kích Thước', 7890000, 2, 'Sự đa dạng trong thiết kế nội thất cho phép mọi người dễ dàng tìm thấy sản phẩm phù hợp với phong cách sống của mình. Các sản phẩm nội thất hiện đại không chỉ chú trọng đến kiểu dáng mà còn tích hợp các tính năng thông minh, như khả năng gấp gọn, thay đổi hình dáng hoặc lưu trữ tiện lợi. Những gam màu trung tính như trắng, xám, và be thường được ưa chuộng để tạo cảm giác thư giãn và dễ dàng kết hợp với các yếu tố trang trí khác', 'HTB', 84, 0, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_essential_chu_i_1m5_narvik_grenaa_c_95c5dcb276ec4a35bd000e2666315087_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MKGPCCDD05.M15', 'Hệ tủ bếp MOHO Kitchen Premium Grenaa Nhiều Kích Thước', 11890000, 7, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'HTB', 67, 0, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_premium_chu_i_1m5_narvik_grenaa_a_2decbb02235f40cca1c786fe699969df_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MKGSCCDD04.M15', 'Hệ tủ bếp MOHO Kitchen Smart Grenaa Nhiều Kích Thước', 8490000, 3, 'Việc lựa chọn nội thất phù hợp là yếu tố quan trọng để tạo nên không gian sống lý tưởng. Các thiết kế hiện nay không chỉ đẹp mắt mà còn thân thiện với người dùng, chẳng hạn như giường ngủ điều chỉnh linh hoạt, bàn có thể mở rộng hay tủ tích hợp nhiều ngăn kéo. Các chất liệu phổ biến như gỗ công nghiệp, kim loại sơn tĩnh điện, và vải cao cấp mang đến sự lựa chọn đa dạng cho khách hàng.', 'HTB', 29, 0, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_smart_chu_i_1m5_narvik_grenaa_c_27af5b348e8441e3b617ce8381fbfa06_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MKNBCCDD01.N15', 'Hệ tủ bếp MOHO Kitchen Essential Narvik Nhiều Kích Thước', 7890000, 21, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'HTB', 18, 0, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_essential_chu_i_1m5_narvik_c_18fa9e7d0d09415cb132a835fff07242_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MKNPCCDD05.M15', 'Hệ tủ bếp MOHO Kitchen Premium Narvik Nhiều Kích Thước', 11890000, 18, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'HTB', 18, 0, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_premium_chu_i_1m5_narvik_c_8273740dc0ef4573906ba2ffed50ffdd_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MKNSCCDD04.M15', 'Hệ tủ bếp MOHO Kitchen Smart Narvik Nhiều Kích Thước', 8490000, 25, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'HTB', 82, 0, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_smart_chu_i_1m5_narvik_c_ebfc9ccad24e437fa09c54683feea174_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MKUBCCDD01.N15', 'Hệ tủ bếp MOHO Kitchen Essential Ubeda Nhiều Kích Thước', 7890000, 24, 'Không gian nội thất không chỉ ảnh hưởng đến hiệu suất làm việc mà còn góp phần cải thiện tâm trạng của con người. Những món đồ như bàn làm việc gọn nhẹ, ghế ngồi thoải mái hay tủ lưu trữ rộng rãi đều được thiết kế để mang lại sự tiện nghi và cảm hứng trong công việc. Việc sử dụng các chất liệu thân thiện với môi trường cũng đang trở thành xu hướng trong thiết kế nội thất hiện đại.', 'HTB', 14, 0, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_essential_chu_i_1m5_ubeda_c_c0d33a525dff4c2d9adf7e9594c31245_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MKUPCCDD05.M15', 'Hệ tủ bếp MOHO Kitchen Premium Ubeda Nhiều Kích Thước', 11890000, 19, 'Nội thất ngày nay không chỉ đơn thuần là những món đồ dùng mà còn là biểu tượng của phong cách sống và gu thẩm mỹ. Từ bàn ghế cổ điển mang hơi thở hoài niệm đến các thiết kế hiện đại với đường nét tối giản, mỗi sản phẩm nội thất đều kể một câu chuyện riêng. Chất liệu tự nhiên như gỗ và đá được yêu thích nhờ vào sự gần gũi và cảm giác ấm cúng mà chúng mang lại.', 'HTB', 60, 1, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_premium_chu_i_1m5_ubeda_c_604284e648254233b4b822f8a0f6de15_master.jpg', '2024-11-18', 50);
INSERT INTO `products` VALUES ('MKUSCCDD04.M15', 'Hệ tủ bếp MOHO Kitchen Smart Ubeda Nhiều Kích Thước', 8490000, 22, 'Không gian sống của bạn sẽ trở nên hoàn hảo hơn với những món nội thất được thiết kế hài hòa giữa phong cách và công năng. Từ những bộ sofa êm ái, bàn làm việc hiện đại đến giường ngủ thoải mái, mỗi sản phẩm nội thất đều được chế tác tỉ mỉ để tạo nên sự thoải mái và sang trọng. Việc kết hợp chất liệu bền bỉ như gỗ, da, và kim loại trong các thiết kế nội thất không chỉ đảm bảo tính thẩm mỹ mà còn kéo dài tuổi thọ sử dụng', 'HTB', 99, 0, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_smart_chu_i_1m5_ubeda_c_24816d45e5cb4f07b0cbb876b410c670_master.jpg', '2024-11-18', 50);

-- ----------------------------
-- Table structure for return_request_order
-- ----------------------------
DROP TABLE IF EXISTS `return_request_order`;
CREATE TABLE `return_request_order`  (
  `returnOrderID` int NOT NULL AUTO_INCREMENT,
  `orderID` int NULL DEFAULT NULL,
  `requestDate` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `responseDate` datetime NULL DEFAULT NULL,
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `imagePath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` enum('Đang duyệt','Hoàn trả','Từ chối') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `adminNote` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`returnOrderID`) USING BTREE,
  INDEX `orderID`(`orderID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of return_request_order
-- ----------------------------
INSERT INTO `return_request_order` VALUES (6, 66, '2025-05-09 19:12:34', '2025-05-09 18:21:26', 'fad', 'assets/images/return_order/hutieu_cp.jpg', 'Hoàn trả', 'Đơn hàng sẽ được hoàn trả');
INSERT INTO `return_request_order` VALUES (7, 71, '2025-06-02 14:42:34', NULL, 'lỗi hàng', 'assets/images/return_order/hutieu_cp.jpg', 'Đang duyệt', NULL);
INSERT INTO `return_request_order` VALUES (8, 71, '2025-06-02 14:43:15', NULL, 'lỗi hàng', 'assets/images/return_order/hutieu_cp.jpg', 'Đang duyệt', NULL);
INSERT INTO `return_request_order` VALUES (9, 71, '2025-06-02 14:49:08', NULL, 'lỗi', 'assets/images/return_order/hutieuunpack.jpg', 'Đang duyệt', NULL);

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `rolePermissionID` int NOT NULL AUTO_INCREMENT,
  `roleID` int NOT NULL,
  `permissionID` int NOT NULL,
  PRIMARY KEY (`rolePermissionID`) USING BTREE,
  UNIQUE INDEX `roleID`(`roleID` ASC, `permissionID` ASC) USING BTREE,
  INDEX `permissionID`(`permissionID` ASC) USING BTREE,
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`roleID`) REFERENCES `roles` (`roleID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`permissionID`) REFERENCES `permissions` (`permissionID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 251 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `roleID` int NOT NULL AUTO_INCREMENT,
  `roleName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 93 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (24, 'Quản trị viên');
INSERT INTO `roles` VALUES (31, 'Kế toán trưởng');
INSERT INTO `roles` VALUES (88, 'Quản trị sản phẩm');
INSERT INTO `roles` VALUES (89, 'Quản lí khuyến mãi');
INSERT INTO `roles` VALUES (90, 'Quản lí kho hàng');

-- ----------------------------
-- Table structure for specifications
-- ----------------------------
DROP TABLE IF EXISTS `specifications`;
CREATE TABLE `specifications`  (
  `specificationID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dimensions` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'Dài 192cm x Rộng 132cm x Cao 72cm',
  `material` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `original` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `standard` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `productID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`specificationID`) USING BTREE,
  INDEX `FK_specifications_products`(`productID` ASC) USING BTREE,
  CONSTRAINT `fk_1_1_spec_pro` FOREIGN KEY (`specificationID`) REFERENCES `products` (`productID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of specifications
-- ----------------------------
INSERT INTO `specifications` VALUES ('MFBNCBD01.B16', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Thân giường: Gỗ tràm tự nhiên/ MDF veneer tràm<br>- Tấm phản: Gỗ plywood chuẩn CARB-P2 (*)', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MFBNCBD01.B16');
INSERT INTO `specifications` VALUES ('MFBNCC601.A16', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Thân giường: Gỗ tràm tự nhiên/ MDF veneer tràm<br>- Tấm phản: Gỗ plywood chuẩn CARB-P2 (*)', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe\r\nNote: Hàng thanh lý không áp dụng bảo hành và bảo trì.', 'MFBNCC601.A16');
INSERT INTO `specifications` VALUES ('MFBNCC901.N16', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Thân giường: Gỗ cao su tự nhiên<br>- Tấm phản: Gỗ plywood chuẩn CARB-P2 (*)', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe\r\nNote: Hàng thanh lý không áp dụng bảo hành và bảo trì.', 'MFBNCC901.N16');
INSERT INTO `specifications` VALUES ('MFBSCBD01.B06', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Trung Quốc', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MFBSCBD01.B06');
INSERT INTO `specifications` VALUES ('MFBSCDN01.B04', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Trung Quốc', 'null', 'MFBSCDN01.B04');
INSERT INTO `specifications` VALUES ('MFCBCE601.BH12', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe.', 'MFCBCE601.BH12');
INSERT INTO `specifications` VALUES ('MFCBCE601.BH13', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe.', 'MFCBCE601.BH13');
INSERT INTO `specifications` VALUES ('MFCBCE601.BH3', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe.', 'MFCBCE601.BH3');
INSERT INTO `specifications` VALUES ('MFCBCE601.BH5', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe.', 'MFCBCE601.BH5');
INSERT INTO `specifications` VALUES ('MFCBCE601.BH7', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe.', 'MFCBCE601.BH7');
INSERT INTO `specifications` VALUES ('MFDCCC103.O05', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'null', 'MFDCCC103.O05');
INSERT INTO `specifications` VALUES ('MFDCCC104.O05', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'null', 'MFDCCC104.O05');
INSERT INTO `specifications` VALUES ('MFDCCCD04.B05', 'Dài 52cm x Rộng 49cm x Cao đến đệm ngồi/lưng tựa 46cm/74cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn sức khỏe.', 'MFDCCCD04.B05');
INSERT INTO `specifications` VALUES ('MFDCCCN01.G04', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'null', 'MFDCCCN01.G04');
INSERT INTO `specifications` VALUES ('MFDCCE301.B05', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên<br>- Vải bọc Polyester chống nhăn, kháng bụi bẩn và nấm mốc', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe\r\nChống thấm, cong vênh, trầy xước, mối mọt', 'MFDCCE301.B05');
INSERT INTO `specifications` VALUES ('MFDTCBN01.B16', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên<br>- Gỗ công nghiệp, Veneer cao su', 'Nhật Bản', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe\r\nChống thấm, cong vênh, trầy xước, mối mọt', 'MFDTCBN01.B16');
INSERT INTO `specifications` VALUES ('MFDTCC801.B16', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Nhật Bản', 'null', 'MFDTCC801.B16');
INSERT INTO `specifications` VALUES ('MFDTCC802.N14', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Mặt bàn: Gỗ công nghiệp MDF chuẩn CARB-P2 (*), Veneer gỗ cao su tự nhiên<br>- Chân bàn: Gỗ cao su tự nhiên', 'Nhật Bản', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MFDTCC802.N14');
INSERT INTO `specifications` VALUES ('MFDTSVLFYDC4.N16', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'null', 'MFDTSVLFYDC4.N16');
INSERT INTO `specifications` VALUES ('MFLVSVLLOTG.B18', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Thân ghế: Gỗ tràm tự nhiên (Ghế sofa Nâu)<br>- Thân ghế: Gỗ cao su tự nhiên (Ghế sofa Màu tự nhiên)<br>- Chân ghế: Gỗ cao su tự nhiên<br>- Vải sợi tổng hợp chống nhăn, kháng bụi bẩn và nấm mốc<br>- Tấm phản: Gỗ công nghiệp Plywood chuẩn CARB-P2 (*)', 'Nhật Bản', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn sức khỏe.', 'MFLVSVLLOTG.B18');
INSERT INTO `specifications` VALUES ('MFNKCC801.B12', 'Dài 192cm x Rộng 132cm x Cao 72cm', 'Mặt bàn: Gỗ công nghiệp PB chuẩn CARB-P2 (*), Veneer gỗ tràm tự nhiên<br>Chân bàn: Gỗ cao su tự nhiên<br>Cụm hộc tủ: Gỗ công nghiệp PB chuẩn CARB-P2 (*), phần mặt hộc tủ được dán veneer gỗ tràm tự nhiên', 'Nhật Bản', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MFNKCC801.B12');
INSERT INTO `specifications` VALUES ('MFNKCC802.N12', 'Dài 192cm x Rộng 132cm x Cao 72cm', 'Mặt bàn: Gỗ công nghiệp PB chuẩn CARB-P2 (*), Veneer gỗ sồi tự nhiên<br>Chân bàn: Gỗ sồi tự nhiên<br>Cụm hộc tủ: Gỗ công nghiệp PB chuẩn CARB-P2 (*), phần mặt hộc tủ được dán veneer gỗ sồi tự nhiên', 'Nhật Bản', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MFNKCC802.N12');
INSERT INTO `specifications` VALUES ('MFSCCC901.B14', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên<br>- Vải sợi tổng hợp chống nhăn, kháng bụi bẩn và nấm mốc<br>- Tấm phản: Gỗ công nghiệp Plywood chuẩn CARB-P2 (*)', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn sức khỏe.\r\n*Sản phẩm của chương trình Outlet không áp dụng bảo hành và bảo trì.', 'MFSCCC901.B14');
INSERT INTO `specifications` VALUES ('MFSCCE302.B16', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Nhật Bản', 'null', 'MFSCCE302.B16');
INSERT INTO `specifications` VALUES ('MFSHCBD01.B06', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Mặt tủ: Gỗ công nghiệp PB chuẩn CARB-P2 (*), Sơn phủ UV<br>- Thân tủ: Gỗ công nghiệp MDF chuẩn CARB-P2 (*), Sơn phủ UV', 'Trung Quốc', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MFSHCBD01.B06');
INSERT INTO `specifications` VALUES ('MFSHCBD01.N18', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Mặt tủ: Gỗ công nghiệp PB chuẩn CARB-P2 (*), Sơn phủ UV<br>- Thân tủ: Gỗ công nghiệp MDF chuẩn CARB-P2 (*), Sơn phủ UV', 'Trung Quốc', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MFSHCBD01.N18');
INSERT INTO `specifications` VALUES ('MFSHCBD02.B08', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Mặt tủ: Gỗ công nghiệp PB chuẩn CARB-P2 (*), Sơn phủ UV<br>- Thân tủ: Gỗ công nghiệp MDF chuẩn CARB-P2 (*), Sơn phủ UV', 'Trung Quốc', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MFSHCBD02.B08');
INSERT INTO `specifications` VALUES ('MFSHCBD03.B08', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Mặt tủ: Gỗ công nghiệp PB chuẩn CARB-P2 (*), Sơn phủ UV<br>- Thân tủ: Gỗ công nghiệp MDF chuẩn CARB-P2 (*), Sơn phủ UV', 'Trung Quốc', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MFSHCBD03.B08');
INSERT INTO `specifications` VALUES ('MFSNCB701.N20', 'Dài 200cm x Rộng 75cm x Cao 69cm', '- Gỗ cao su tự nhiên<br>- Vải bọc sợi tổng hợp có khả năng chống thấm nước và dầu<br>- Tấm phản: Gỗ công nghiệp Plywood chuẩn CARB-P2 (*)', 'Nhật Bản', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn sức khỏe.\r\nNote: Hàng thanh lý không áp dụng bảo hành và bảo trì.', 'MFSNCB701.N20');
INSERT INTO `specifications` VALUES ('MFSNCC801.B18', 'Dài 180cm x Rộng 85cm x Cao 69cm', '- Gỗ tràm tự nhiên<br>- Vải sợi tổng hợp có khả năng chống thấm nước và dầu<br>- Tấm phản: Gỗ công nghiệp Plywood chuẩn CARB-P2 (*)', 'Nhật Bản', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn sức khỏe.', 'MFSNCC801.B18');
INSERT INTO `specifications` VALUES ('MFSNCC801.N18', 'Dài 180cm x Rộng 85cm x Cao 69cm', '- Gỗ cao su tự nhiên<br>- Vải sợi tổng hợp có khả năng chống thấm nước và dầu<br>- Tấm phản: Gỗ công nghiệp Plywood chuẩn CARB-P2 (*)', 'Nhật Bản', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn sức khỏe.', 'MFSNCC801.N18');
INSERT INTO `specifications` VALUES ('MFSNCE302.B18', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'null', 'MFSNCE302.B18');
INSERT INTO `specifications` VALUES ('MFSNCE701.B18', 'Dài 180cm x Rộng 85cm x Cao 82cm', '- Gỗ cao su tự nhiên<br>- Vải sợi tổng hợp có khả năng chống thấm nước và dầu', 'Nhật Bản', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn sức khỏe.', 'MFSNCE701.B18');
INSERT INTO `specifications` VALUES ('MFSNCE701.N16', 'Dài 160cm x Rộng 79cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Nhật Bản', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn sức khỏe.', 'MFSNCE701.N16');
INSERT INTO `specifications` VALUES ('MFSNCE702.N19', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Nhật Bản', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn sức khỏe.', 'MFSNCE702.N19');
INSERT INTO `specifications` VALUES ('MFSNSVLLG14.B18', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Thân ghế: Gỗ tràm tự nhiên (Ghế sofa Nâu)<br>- Thân ghế: Gỗ cao su tự nhiên (Ghế sofa Màu tự nhiên)<br>- Chân ghế: Gỗ cao su tự nhiên<br>- Vải sợi tổng hợp có khả năng chống thấm nước và dầu<br>- Tấm phản: Gỗ công nghiệp Plywood chuẩn CARB-P2 (*)', 'Nhật Bản', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn sức khỏe.\r\nChống thấm, cong vênh, trầy xước, mối mọt', 'MFSNSVLLG14.B18');
INSERT INTO `specifications` VALUES ('MFSSCB801.B06', 'Dài 60cm x Rộng 60cm x Cao 37cm', '- Gỗ cao su tự nhiên<br>- Vải sợi tổng hợp chống nhăn, kháng bụi bẩn và nấm mốc<br>- Tấm phản: Gỗ công nghiệp Plywood chuẩn CARB-P2 (*)', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn sức khỏe.', 'MFSSCB801.B06');
INSERT INTO `specifications` VALUES ('MFSSCC201.N06', 'Dài 60cm x Rộng 60cm x Cao 42cm', '- Gỗ cao su tự nhiên<br>- Vải sợi tổng hợp chống nhăn, kháng bụi bẩn và nấm mốc<br>- Tấm phản: Gỗ công nghiệp Plywood chuẩn CARB-P2 (*)', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn sức khỏe.\r\n*Sản phẩm của chương trình Outlet không áp dụng bảo hành và bảo trì.', 'MFSSCC201.N06');
INSERT INTO `specifications` VALUES ('MFSSCE301.B07', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'null', 'MFSSCE301.B07');
INSERT INTO `specifications` VALUES ('MFSTCC902.B08', 'Dài 800mm x Rộng 800mm x Cao 380mm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'null', 'MFSTCC902.B08');
INSERT INTO `specifications` VALUES ('MFSTCE301.B09', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Nhật Bản', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MFSTCE301.B09');
INSERT INTO `specifications` VALUES ('MFTCCB701.M18', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Trung Quốc', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe\r\nSản phẩm chỉ còn hàng tại TP.HCM', 'MFTCCB701.M18');
INSERT INTO `specifications` VALUES ('MFTCCBN01.B16', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Trung Quốc', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MFTCCBN01.B16');
INSERT INTO `specifications` VALUES ('MFTCCC702.K16', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Trung Quốc', 'null', 'MFTCCC702.K16');
INSERT INTO `specifications` VALUES ('MFTCCDN01.B16', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Trung Quốc', 'null', 'MFTCCDN01.B16');
INSERT INTO `specifications` VALUES ('MFTCCE301.B18', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Mặt trên: Gỗ tràm, veneer tràm<br>- Thân tủ: Gỗ công nghiệp PB, CARB-P2 (*)<br>- Mặt cửa tủ: Gỗ tràm, veneer tràm<br>- Chân tủ: Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MFTCCE301.B18');
INSERT INTO `specifications` VALUES ('MFWRCA505.B05', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Trung Quốc', 'null', 'MFWRCA505.B05');
INSERT INTO `specifications` VALUES ('MFWRCD701.B10', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Thân tủ: Gỗ công nghiệp PB chuẩn CARB-P2 (*), Sơn phủ UV<br>- Cửa tủ: Gỗ công nghiệp MDF chuẩn CARB-P2 (*), Veneer gỗ tràm<br>- Thanh treo: Hợp kim nhôm, chống gỉ sét', 'Trung Quốc', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MFWRCD701.B10');
INSERT INTO `specifications` VALUES ('MFWRCD702.B05', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Thân tủ: Gỗ MFC/ MDF phủ Melamine chuẩn CARB-P2 (*)<br>- Cánh tủ + Lưng tủ: Gỗ MDF phủ Melamine chuẩn CARB-P2 (*), Veneer gỗ tràm<br>- Thanh treo: Hợp kim nhôm, chống gỉ sét', 'Trung Quốc', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MFWRCD702.B05');
INSERT INTO `specifications` VALUES ('MFWRCD703.B05', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Thân tủ: Gỗ MFC/ MDF phủ Melamine chuẩn CARB-P2 (*)<br>- Cửa tủ: Gỗ MDF phủ Melamine chuẩn CARB-P2 (*), Veneer gỗ tràm<br>- Thanh treo: Hợp kim nhôm, chống gỉ sét', 'Trung Quốc', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe\r\nChống thấm, cong vênh, trầy xước, mối mọt', 'MFWRCD703.B05');
INSERT INTO `specifications` VALUES ('MFWRHB301V2.BMH', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Thân tủ: Gỗ MFC/ MDF phủ Melamine chuẩn CARB-P2 (*)<br>- Cửa tủ: Gỗ MDF phủ Melamine chuẩn CARB-P2 (*), Veneer gỗ tràm<br>- Thanh treo: Hợp kim nhôm, chống gỉ sét', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MFWRHB301V2.BMH');
INSERT INTO `specifications` VALUES ('MFWRHB301V2.BMS', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Thân tủ: Gỗ MFC/ MDF phủ Melamine chuẩn CARB-P2 (*)<br>- Cửa tủ: Gỗ MDF phủ Melamine chuẩn CARB-P2 (*), Veneer gỗ tràm<br>- Thanh treo: Hợp kim nhôm, chống gỉ sét', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MFWRHB301V2.BMS');
INSERT INTO `specifications` VALUES ('MFWRHB301V2.BSH', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Thân tủ: Gỗ MFC/ MDF phủ Melamine chuẩn CARB-P2 (*)<br>- Cửa tủ: Gỗ MDF phủ Melamine chuẩn CARB-P2 (*), Veneer gỗ tràm<br>- Thanh treo: Hợp kim nhôm, chống gỉ sét', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MFWRHB301V2.BSH');
INSERT INTO `specifications` VALUES ('MFWRHB301V2.BSMH', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Thân tủ: Gỗ MFC/ MDF phủ Melamine chuẩn CARB-P2 (*)<br>- Cửa tủ: Gỗ MDF phủ Melamine chuẩn CARB-P2 (*), Veneer gỗ tràm<br>- Thanh treo: Hợp kim nhôm, chống gỉ sét', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MFWRHB301V2.BSMH');
INSERT INTO `specifications` VALUES ('MHCBCD801.BG3', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MHCBCD801.BG3');
INSERT INTO `specifications` VALUES ('MHCBCD801.BG31', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MHCBCD801.BG31');
INSERT INTO `specifications` VALUES ('MHCBCD801.BG36', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MHCBCD801.BG36');
INSERT INTO `specifications` VALUES ('MHCBCD902.BN22', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MHCBCD902.BN22');
INSERT INTO `specifications` VALUES ('MHCBCD902.BN23', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MHCBCD902.BN23');
INSERT INTO `specifications` VALUES ('MHCBCD902.BN24', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MHCBCD902.BN24');
INSERT INTO `specifications` VALUES ('MHCBCD902.BN26', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MHCBCD902.BN26');
INSERT INTO `specifications` VALUES ('MHCBCD902.BN33', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MHCBCD902.BN33');
INSERT INTO `specifications` VALUES ('MHCBCD902.BN40', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MHCBCD902.BN40');
INSERT INTO `specifications` VALUES ('MHCBCD902.BN50', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MHCBCD902.BN50');
INSERT INTO `specifications` VALUES ('MHCBCD902.MN21', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MHCBCD902.MN21');
INSERT INTO `specifications` VALUES ('MHCBCD902.NN19', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MHCBCD902.NN19');
INSERT INTO `specifications` VALUES ('MHCBCD902.NN20', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MHCBCD902.NN20');
INSERT INTO `specifications` VALUES ('MHCBCD902.NN29', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MHCBCD902.NN29');
INSERT INTO `specifications` VALUES ('MHCBCD902.NN32', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MHCBCD902.NN32');
INSERT INTO `specifications` VALUES ('MHCBCD902.NN39', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MHCBCD902.NN39');
INSERT INTO `specifications` VALUES ('MHCBCD902.NN47', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MHCBCD902.NN47');
INSERT INTO `specifications` VALUES ('MHCBCDD01.BL1', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MHCBCDD01.BL1');
INSERT INTO `specifications` VALUES ('MHCBCDD01.BL4', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MHCBCDD01.BL4');
INSERT INTO `specifications` VALUES ('MHCBCDD02.BK1', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MHCBCDD02.BK1');
INSERT INTO `specifications` VALUES ('MHCBCDD02.BK2', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MHCBCDD02.BK2');
INSERT INTO `specifications` VALUES ('MHCBCDD02.BK3', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 'MHCBCDD02.BK3');
INSERT INTO `specifications` VALUES ('MKGBCCDD01.B15', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe\r\nBảo hành: 2 năm\r\nKích thước tường đề nghị với tủ bếp chữ L:\r\n- Bếp chữ L 3.4m: 2274 x 1724mm trở lên\r\n- Bếp chữ L 2.6m: 1874 x 1324mm trở lên\r\nLưu ý: Sản phẩm hiệ', 'MKGBCCDD01.B15');
INSERT INTO `specifications` VALUES ('MKGPCCDD05.M15', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe\r\nBảo hành: 2 năm\r\nKích thước tường đề nghị với tủ bếp chữ L:\r\n- Bếp chữ L 3.4m: 2274 x 1724mm trở lên\r\n- Bếp chữ L 2.6m: 1874 x 1324mm trở lên\r\nLưu ý: Sản phẩm hiệ', 'MKGPCCDD05.M15');
INSERT INTO `specifications` VALUES ('MKGSCCDD04.M15', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe\r\nBảo hành: 2 năm\r\nKích thước tường đề nghị với tủ bếp chữ L:\r\n- Bếp chữ L 3.4m: 2274 x 1724mm trở lên\r\n- Bếp chữ L 2.6m: 1874 x 1324mm trở lên\r\nLưu ý: Sản phẩm hiệ', 'MKGSCCDD04.M15');
INSERT INTO `specifications` VALUES ('MKNBCCDD01.N15', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe\r\nBảo hành: 2 năm\r\nKích thước tường đề nghị với tủ bếp chữ L:\r\n- Bếp chữ L 3.4m: 2274 x 1724mm trở lên\r\n- Bếp chữ L 2.6m: 1874 x 1324mm trở lên\r\nLưu ý: Sản phẩm hiệ', 'MKNBCCDD01.N15');
INSERT INTO `specifications` VALUES ('MKNPCCDD05.M15', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe\r\nBảo hành: 2 năm\r\nKích thước tường đề nghị với tủ bếp chữ L:\r\n- Bếp chữ L 3.4m: 2274 x 1724mm trở lên\r\n- Bếp chữ L 2.6m: 1874 x 1324mm trở lên\r\nLưu ý: Sản phẩm hiệ', 'MKNPCCDD05.M15');
INSERT INTO `specifications` VALUES ('MKNSCCDD04.M15', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe\r\nBảo hành: 2 năm\r\nKích thước tường đề nghị với tủ bếp chữ L:\r\n- Bếp chữ L 3.4m: 2274 x 1724mm trở lên\r\n- Bếp chữ L 2.6m: 1874 x 1324mm trở lên\r\nLưu ý: Sản phẩm hiệ', 'MKNSCCDD04.M15');
INSERT INTO `specifications` VALUES ('MKUBCCDD01.N15', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe\r\nBảo hành: 2 năm\r\nKích thước tường đề nghị với tủ bếp chữ L:\r\n- Bếp chữ L 3.4m: 2274 x 1724mm trở lên\r\n- Bếp chữ L 2.6m: 1874 x 1324mm trở lên\r\nLưu ý: Sản phẩm hiệ', 'MKUBCCDD01.N15');
INSERT INTO `specifications` VALUES ('MKUPCCDD05.M15', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe\r\nBảo hành: 2 năm\r\nKích thước tường đề nghị với tủ bếp chữ L:\r\n- Bếp chữ L 3.4m: 2274 x 1724mm trở lên\r\n- Bếp chữ L 2.6m: 1874 x 1324mm trở lên\r\nLưu ý: Sản phẩm hiệ', 'MKUPCCDD05.M15');
INSERT INTO `specifications` VALUES ('MKUSCCDD04.M15', 'Dài 192cm x Rộng 132cm x Cao 72cm', '- Gỗ cao su tự nhiên', 'Việt Nam', 'California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe\r\nBảo hành: 2 năm\r\nKích thước tường đề nghị với tủ bếp chữ L:\r\n- Bếp chữ L 3.4m: 2274 x 1724mm trở lên\r\n- Bếp chữ L 2.6m: 1874 x 1324mm trở lên\r\nLưu ý: Sản phẩm hiệ', 'MKUSCCDD04.M15');

-- ----------------------------
-- Table structure for status_user
-- ----------------------------
DROP TABLE IF EXISTS `status_user`;
CREATE TABLE `status_user`  (
  `statusID` int NOT NULL AUTO_INCREMENT,
  `Description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`statusID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of status_user
-- ----------------------------
INSERT INTO `status_user` VALUES (1, 'Đang hoạt động');
INSERT INTO `status_user` VALUES (2, 'Bị khóa');
INSERT INTO `status_user` VALUES (3, 'Đang chờ kích hoạt');
INSERT INTO `status_user` VALUES (4, 'Đã xóa');

-- ----------------------------
-- Table structure for stock_issue_details
-- ----------------------------
DROP TABLE IF EXISTS `stock_issue_details`;
CREATE TABLE `stock_issue_details`  (
  `issueID` int NOT NULL,
  `productID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`issueID`, `productID`) USING BTREE,
  INDEX `productID`(`productID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stock_issue_details
-- ----------------------------

-- ----------------------------
-- Table structure for stock_issues
-- ----------------------------
DROP TABLE IF EXISTS `stock_issues`;
CREATE TABLE `stock_issues`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userID` int NULL DEFAULT NULL,
  `orderID` int NULL DEFAULT NULL,
  `issue_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `issue_type` enum('bán cho khách hàng','trả nhà cung cấp','hết hạn','điều chỉnh') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'bán cho khách hàng',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userID`(`userID`) USING BTREE,
  INDEX `orderID`(`orderID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stock_issues
-- ----------------------------
INSERT INTO `stock_issues` VALUES (2, 3, NULL, '2025-04-10 16:35:30', 'hang da qua thoi han ', 'hết hạn');

-- ----------------------------
-- Table structure for stock_receipt_details
-- ----------------------------
DROP TABLE IF EXISTS `stock_receipt_details`;
CREATE TABLE `stock_receipt_details`  (
  `receiptID` int NOT NULL,
  `productID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`receiptID`, `productID`) USING BTREE,
  INDEX `productID`(`productID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stock_receipt_details
-- ----------------------------
INSERT INTO `stock_receipt_details` VALUES (6, 'MD.CS-1M21', 1, 8730000.00);
INSERT INTO `stock_receipt_details` VALUES (7, 'MD.CS50-1M0', 1, 5970000.00);
INSERT INTO `stock_receipt_details` VALUES (8, 'MD.CS-1M21', 1, 8730000.00);
INSERT INTO `stock_receipt_details` VALUES (9, 'MD.CS50-1M0', 1, 5970000.00);

-- ----------------------------
-- Table structure for stock_receipts
-- ----------------------------
DROP TABLE IF EXISTS `stock_receipts`;
CREATE TABLE `stock_receipts`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userID` int NULL DEFAULT NULL,
  `receipt_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `receipt_type` enum('nhập từ nhà cung cấp','trả từ khách hàng','điều chỉnh') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'nhập từ nhà cung cấp',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userID`(`userID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stock_receipts
-- ----------------------------
INSERT INTO `stock_receipts` VALUES (2, 3, '2025-04-10 13:10:26', 'đơn hàng cập nhật ', 'nhập từ nhà cung cấp');
INSERT INTO `stock_receipts` VALUES (3, 3, '2025-04-10 16:21:48', 'khách hàng trả về do hàng lỗi', 'trả từ khách hàng');
INSERT INTO `stock_receipts` VALUES (4, 13, '2025-04-11 17:16:52', '', 'nhập từ nhà cung cấp');
INSERT INTO `stock_receipts` VALUES (5, 13, '2025-04-11 17:19:02', '', 'nhập từ nhà cung cấp');
INSERT INTO `stock_receipts` VALUES (6, 3, '2025-04-11 17:22:40', '', 'nhập từ nhà cung cấp');
INSERT INTO `stock_receipts` VALUES (7, 11, '2025-05-02 16:15:07', '1', 'nhập từ nhà cung cấp');
INSERT INTO `stock_receipts` VALUES (8, 11, '2025-05-02 16:15:48', 'ãâx', 'nhập từ nhà cung cấp');
INSERT INTO `stock_receipts` VALUES (9, 11, '2025-05-02 16:16:33', 'wèwe', 'nhập từ nhà cung cấp');

-- ----------------------------
-- Table structure for subimages
-- ----------------------------
DROP TABLE IF EXISTS `subimages`;
CREATE TABLE `subimages`  (
  `subImagesID` int NOT NULL AUTO_INCREMENT,
  `image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createDate` date NULL DEFAULT NULL,
  `productID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`subImagesID`) USING BTREE,
  INDEX `FK_subimages_products`(`productID` ASC) USING BTREE,
  CONSTRAINT `FK_subimages_products` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1274 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of subimages
-- ----------------------------
INSERT INTO `subimages` VALUES (43, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_noi_that_moho_ban_an_go_cao_su_odense_6_aaa7b6c7cc964c3c8cdeea305bb8f692_master.jpg', '2024-11-16', 'MFDTCBN01.B16');
INSERT INTO `subimages` VALUES (117, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ban_an_go_moss_1m6_8_4fff91ec81cc48a4b2a90297534d12d4_master.jpg', '2024-11-16', 'MFDTCC802.N14');
INSERT INTO `subimages` VALUES (188, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo_ghe_sofa_nau_kem_don_nem_xam_8d66f8aea67545d0885f3ea8bd53c132_master.png', '2024-11-16', 'MFLVSVLLOTG.B18');
INSERT INTO `subimages` VALUES (189, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo_ghe_sofa_vline_be_2_805e3aec75d4487483494eff55ccbb3b.jpg', '2024-11-16', 'MFLVSVLLOTG.B18');
INSERT INTO `subimages` VALUES (190, 'https://product.hstatic.net/200000065946/product/dsc02535_d64ac0bacdca49508a05ed62a8a178c2_master.jpg', '2024-11-16', 'MFSNSVLLG14.B18');
INSERT INTO `subimages` VALUES (191, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_sofa_vline_sofa_goc_be_4ec65ab4fe1d4440ad9e8cca93c07a5c.jpg', '2024-11-16', 'MFSNSVLLG14.B18');
INSERT INTO `subimages` VALUES (192, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo_ban_va_guong_trang_diem_vienna_6_63151bd4018e49e4bdbd590328a73267_master.jpg', '2024-11-16', 'MFMTSVNMT1MR1.B10');
INSERT INTO `subimages` VALUES (193, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo_ban_va_guong_trang_diem_vienna_7_f56dbbc1e08a41d49b57bffd2425ad04_master.jpg', '2024-11-16', 'MFMTSVNMT1MR1.B10');
INSERT INTO `subimages` VALUES (194, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo_ban_va_guong_trang_diem_vienna_8_80419c74730d4b74995d200e2cc7b13a_master.jpg', '2024-11-16', 'MFMTSVNMT1MR1.B10');
INSERT INTO `subimages` VALUES (195, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_trang_diem_vienna_1_384f5c1aee0448fd90c879f4c094656b_master.jpg', '2024-11-16', 'MFMTSVNMT1MR1.B10');
INSERT INTO `subimages` VALUES (196, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_trang_diem_vienna_2_5d83603b88cf49799369c139f479973c_master.jpg', '2024-11-16', 'MFMTSVNMT1MR1.B10');
INSERT INTO `subimages` VALUES (197, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo_ban_va_guong_trang_diem_vienna_1_63323661476c48e39adea5f76066ca8c_master.jpg', '2024-11-16', 'MFMTSVNMT1MR1.B10');
INSERT INTO `subimages` VALUES (198, 'https://product.hstatic.net/200000065946/product/pro_trang_noi_that_moho_ban_may_tinh_1_07121e2728134e579bdfd34fd6e3c184_master.jpg', '2024-11-16', 'MWCKCBN02.N14');
INSERT INTO `subimages` VALUES (199, 'https://product.hstatic.net/200000065946/product/pro_trang_noi_that_moho_ban_may_tinh_2_0ef59ed925d64134967dbc93236c3cb1.jpg', '2024-11-16', 'MWCKCBN02.N14');
INSERT INTO `subimages` VALUES (200, 'https://product.hstatic.net/200000065946/product/pro_trang_noi_that_moho_ban_may_tinh_3_6b2feb36823f4d1f96ce09ff301824a4.jpg', '2024-11-16', 'MWCKCBN02.N14');
INSERT INTO `subimages` VALUES (201, 'https://product.hstatic.net/200000065946/product/pro_trang_noi_that_moho_ban_may_tinh_go_moho_works_1_670171a7effc4a3999531e39db8a0bf0.jpg', '2024-11-16', 'MWCKCBN02.N14');
INSERT INTO `subimages` VALUES (202, 'https://product.hstatic.net/200000065946/product/pro_trang_noi_that_moho_ban_may_tinh_go_moho_works_2_6a9ba75328724c6689c37d96004cbd52.jpg', '2024-11-16', 'MWCKCBN02.N14');
INSERT INTO `subimages` VALUES (203, 'https://product.hstatic.net/200000065946/product/pro_trang_noi_that_moho_ban_may_tinh_go_moho_works_3_b324f6dba7184758819dec1618ec38a4.jpg', '2024-11-16', 'MWCKCBN02.N14');
INSERT INTO `subimages` VALUES (204, 'https://product.hstatic.net/200000065946/product/pro_version_1_noi_that_moho_tu_quan_ao_go_fiji_7ec18dabdfdc4964a559e22eeda8817b_master.jpg', '2024-11-16', 'MFWRCB801.B10');
INSERT INTO `subimages` VALUES (205, 'https://product.hstatic.net/200000065946/product/pro_version_1_noi_that_moho_tu_quan_ao_go_fiji_2_ce990012e3874b51afd227bed1464f94_master.jpg', '2024-11-16', 'MFWRCB801.B10');
INSERT INTO `subimages` VALUES (206, 'https://product.hstatic.net/200000065946/product/pro_version_1_noi_that_moho_tu_quan_ao_go_fiji_3_671df9685ccb43bcba55abc06db645e1_master.jpg', '2024-11-16', 'MFWRCB801.B10');
INSERT INTO `subimages` VALUES (207, 'https://product.hstatic.net/200000065946/product/pro_version_1_noi_that_moho_tu_quan_ao_go_fiji_4_b8b6cc0f84ca41649d7f9b351950adf4_master.jpg', '2024-11-16', 'MFWRCB801.B10');
INSERT INTO `subimages` VALUES (208, 'https://product.hstatic.net/200000065946/product/pro_version_1_noi_that_moho_tu_quan_ao_go_fiji_5_80e99cdb4ec84eeebecb0c0157bfd7da_master.jpg', '2024-11-16', 'MFWRCB801.B10');
INSERT INTO `subimages` VALUES (209, 'https://file.hstatic.net/200000065946/file/noi-that-moho-icon-xem-video_fac41602910e4c228b9bb8974b9d1fc6.jpg', '2024-11-16', 'MFWRCB801.B10');
INSERT INTO `subimages` VALUES (210, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_fiji_6_db3bb7779c934e4f8ceefad840a433af_master.jpg', '2024-11-16', 'MFBSCB801.B55');
INSERT INTO `subimages` VALUES (211, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_fiji_1_97161274de5e4598ac6b38300e6db97c_master.jpg', '2024-11-16', 'MFBSCB801.B55');
INSERT INTO `subimages` VALUES (212, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_fiji_2_c6dde93aa5a04aae95650eb519132c8a_master.jpg', '2024-11-16', 'MFBSCB801.B55');
INSERT INTO `subimages` VALUES (213, 'https://product.hstatic.net/200000065946/product/pro_nau_tu_noi_that_moho_tu_dau_giuong_fiji_4_52215a5b05b04918855f68f288601912_master.jpg', '2024-11-16', 'MFBSCB801.B55');
INSERT INTO `subimages` VALUES (214, 'https://product.hstatic.net/200000065946/product/pro_nau_tu_noi_that_moho_tu_dau_giuong_fiji_5_9707ea911d774ebabf334cfcec7a1848_master.jpg', '2024-11-16', 'MFBSCB801.B55');
INSERT INTO `subimages` VALUES (215, 'https://product.hstatic.net/200000065946/product/pro_nau_tu_noi_that_moho_tu_dau_giuong_fiji_3_b821f85563984b7db3829ac59a11ef16_master.jpg', '2024-11-16', 'MFBSCB801.B55');
INSERT INTO `subimages` VALUES (216, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_sofa_goc_vline_dem_be_2_22f7622e011b4761851383379179f03d_master.jpg', '2024-11-16', 'MFSCCC801.B14');
INSERT INTO `subimages` VALUES (217, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_sofa_goc_vline_dem_be_2_22f7622e011b4761851383379179f03d.jpg', '2024-11-16', 'MFSCCC801.B14');
INSERT INTO `subimages` VALUES (218, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_sofa_goc_vline_dem_be_3_4798af049ae141dc9ad7fb8cc40fe461.jpg', '2024-11-16', 'MFSCCC801.B14');
INSERT INTO `subimages` VALUES (219, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_sofa_goc_vline_dem_be_4_1e3f8e4d3cbc43d8ac2147cb48596868.jpg', '2024-11-16', 'MFSCCC801.B14');
INSERT INTO `subimages` VALUES (220, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_sofa_goc_vline_dem_be_5_295ea90723754b7c86b782ad83e66dfc.jpg', '2024-11-16', 'MFSCCC801.B14');
INSERT INTO `subimages` VALUES (221, 'https://product.hstatic.net/200000065946/product/pro_nau_ghe_don_sofa_vline_be_1_9398f1a205464fa183ec802df207938a_master.jpg', '2024-11-16', 'MFSSCC801.B06');
INSERT INTO `subimages` VALUES (222, 'https://product.hstatic.net/200000065946/product/pro_nau_ghe_don_sofa_vline_be_2_7a8f088cd39f4e2cbce4dfc5d76d66c0.jpg', '2024-11-16', 'MFSSCC801.B06');
INSERT INTO `subimages` VALUES (223, 'https://product.hstatic.net/200000065946/product/pro_nau_ghe_don_sofa_vline_be_3_2c30d09eeaba4b2e9b01a3f724bd2541.jpg', '2024-11-16', 'MFSSCC801.B06');
INSERT INTO `subimages` VALUES (224, 'https://product.hstatic.net/200000065946/product/pro_nau_ghe_don_sofa_vline_be_4_116ebfda86eb4d218fb392a4982b9e4b.jpg', '2024-11-16', 'MFSSCC801.B06');
INSERT INTO `subimages` VALUES (225, 'https://product.hstatic.net/200000065946/product/pro_1m6_noi_that_moho_giuong_ngu_fiji_b_cae43605b18e4e6a961709059b8d03f6_master.jpg', '2024-11-16', 'MFBNCB801.B16');
INSERT INTO `subimages` VALUES (226, 'https://product.hstatic.net/200000065946/product/pro_1m6_noi_that_moho_giuong_ngu_fiji_0e991b4522384129abbfffde0138bc51.jpg', '2024-11-16', 'MFBNCB801.B16');
INSERT INTO `subimages` VALUES (227, 'https://product.hstatic.net/200000065946/product/pro_1m6_noi_that_moho_giuong_ngu_fiji_16_6d462882f09347e591f4d549af322e60.jpg', '2024-11-16', 'MFBNCB801.B16');
INSERT INTO `subimages` VALUES (228, 'https://product.hstatic.net/200000065946/product/pro_1m6_noi_that_moho_giuong_ngu_fiji_17_80ffd042437e4ba49d77312a6024f3cb.jpg', '2024-11-16', 'MFBNCB801.B16');
INSERT INTO `subimages` VALUES (229, 'https://product.hstatic.net/200000065946/product/pro_1m6_noi_that_moho_giuong_ngu_fiji_18_f6b92271cd994f6b92ce697c5c20e50b.jpg', '2024-11-16', 'MFBNCB801.B16');
INSERT INTO `subimages` VALUES (230, 'https://product.hstatic.net/200000065946/product/pro_1m6_noi_that_moho_giuong_ngu_fiji_19_6e54eeaf30354b9a91b2989402945d9d.jpg', '2024-11-16', 'MFBNCB801.B16');
INSERT INTO `subimages` VALUES (231, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_tu_quan_ao_vienna_4_canh_3_7dfdb5dd74ad469fa4214edb640a54ca_master.jpg', '2024-11-16', 'MFWRSVNH201V2.NHMS');
INSERT INTO `subimages` VALUES (232, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_tu_quan_ao_vienna_4_canh_3_7dfdb5dd74ad469fa4214edb640a54ca.jpg', '2024-11-16', 'MFWRSVNH201V2.NHMS');
INSERT INTO `subimages` VALUES (233, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_tu_quan_ao_vienna_4_canh_3_7dfdb5dd74ad469fa4214edb640a54ca.jpg', '2024-11-16', 'MFWRSVNH201V2.NHMS');
INSERT INTO `subimages` VALUES (234, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_tu_quan_ao_vienna_4_canh_4_bc8b6d61ea02428cb41ddab1b7e66b0f.jpg', '2024-11-16', 'MFWRSVNH201V2.NHMS');
INSERT INTO `subimages` VALUES (235, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_quan_ao_go_3_canh_1_c24a747dd0094852ad9bb45a3c42caf6_master.jpg', '2024-11-16', 'MFWRSVNH201V2.NHM');
INSERT INTO `subimages` VALUES (236, 'https://product.hstatic.net/200000065946/product/pro_go_phoi_trang_noi_that_moho_tu_quan_ao_go_3_canh_vienna_2_9bd7280452d64b56af328c1377e4649c_master.jpg', '2024-11-16', 'MFWRSVNH201V2.MMS');
INSERT INTO `subimages` VALUES (237, 'https://product.hstatic.net/200000065946/product/pro_go_phoi_trang_noi_that_moho_tu_quan_ao_go_vienna_2_381ae861d7664f018a1bce952d3ba20e_master.jpg', '2024-11-16', 'MFWRSVNH201V2.MSH');
INSERT INTO `subimages` VALUES (238, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ke_de_sach_tu_khoa_11_5753b0817b9d4954bb1c5072694c0971_master.jpg', '2024-11-16', 'MWSFCBN02.K08');
INSERT INTO `subimages` VALUES (239, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ke_de_sach_tu_khoa_1_55426ceab9e045aa8457c246af42421f.jpg', '2024-11-16', 'MWSFCBN02.K08');
INSERT INTO `subimages` VALUES (240, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ke_de_sach_tu_khoa_2_a6491bc1606e4257a5fc050e05d2ad87.jpg', '2024-11-16', 'MWSFCBN02.K08');
INSERT INTO `subimages` VALUES (241, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ke_de_sach_tu_khoa_3_7af3fded85da4a2d8c5c746115092ea6.jpg', '2024-11-16', 'MWSFCBN02.K08');
INSERT INTO `subimages` VALUES (242, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ke_de_sach_tu_khoa_4_b8661bc2e81749fe842866d2526e10d8.jpg', '2024-11-16', 'MWSFCBN02.K08');
INSERT INTO `subimages` VALUES (243, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ke_de_sach_tu_khoa_5_879c6ffc999548fc90d60075a85c1574.jpg', '2024-11-16', 'MWSFCBN02.K08');
INSERT INTO `subimages` VALUES (244, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ke_de_sach_7_6d68505ffeaa46e6a1642cad38af56a5_master.jpg', '2024-11-16', 'MWSFCBN03.K08');
INSERT INTO `subimages` VALUES (245, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ke_de_sach_1_6f85bbca3ef2457b8ee70d03f60d5e05.jpg', '2024-11-16', 'MWSFCBN03.K08');
INSERT INTO `subimages` VALUES (246, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ke_de_sach_2_9d3f236f73044515925a44db4226c0eb.jpg', '2024-11-16', 'MWSFCBN03.K08');
INSERT INTO `subimages` VALUES (247, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ke_de_sach_3_5feff8d612834b3eb3881bfa1b98c662.jpg', '2024-11-16', 'MWSFCBN03.K08');
INSERT INTO `subimages` VALUES (248, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ke_de_sach_4_149556b661054a65b5a8d680a0d21198.jpg', '2024-11-16', 'MWSFCBN03.K08');
INSERT INTO `subimages` VALUES (249, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ke_de_sach_5_a28ef713bea54783b477155f91d60eb5.jpg', '2024-11-16', 'MWSFCBN03.K08');
INSERT INTO `subimages` VALUES (250, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ke_de_sach_5_tang_moho_works_8_02bf94d9c3a04a31932ed4626172bacf_master.jpg', '2024-11-16', 'MWSFCBN01.K08');
INSERT INTO `subimages` VALUES (251, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ke_de_sach_5_tang_moho_works_1_57ef6c03ecd44e9886c624af9e1b7ada.jpg', '2024-11-16', 'MWSFCBN01.K08');
INSERT INTO `subimages` VALUES (252, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ke_de_sach_5_tang_moho_works_2_17a39bae75c8451eaca52bdac0eeddf0.jpg', '2024-11-16', 'MWSFCBN01.K08');
INSERT INTO `subimages` VALUES (253, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ke_de_sach_5_tang_moho_works_4_8cd3087632424e918f8b9ede958cf2f0.jpg', '2024-11-16', 'MWSFCBN01.K08');
INSERT INTO `subimages` VALUES (254, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ke_de_sach_5_tang_moho_works_7_3cdd1a50d95f4e34b41d9ee0eecbc4ef.jpg', '2024-11-16', 'MWSFCBN01.K08');
INSERT INTO `subimages` VALUES (255, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ke_de_sach_5_tang_moho_works_11_c6595ebddd5843d6b9ef82986ab3db02.jpg', '2024-11-16', 'MWSFCBN01.K08');
INSERT INTO `subimages` VALUES (256, 'https://product.hstatic.net/200000065946/product/pro_xanh_navy_noi_that_moho_ghe_an_go_verona_6_b0d28d1e676049cfb6adfa204846d0ca_master.jpg', '2024-11-16', 'MFDCCC103.N06');
INSERT INTO `subimages` VALUES (257, 'https://product.hstatic.net/200000065946/product/pro_xanh_navy_noi_that_moho_ghe_an_go_verona_7_6ac21ff7d9d44f2197dc07fc05d54a4e.jpg', '2024-11-16', 'MFDCCC103.N06');
INSERT INTO `subimages` VALUES (258, 'https://product.hstatic.net/200000065946/product/pro_xanh_navy_noi_that_moho_ghe_an_go_verona_8_ca5f7fe23b1c41f09ad48d1dcbb0e8ec.jpg', '2024-11-16', 'MFDCCC103.N06');
INSERT INTO `subimages` VALUES (259, 'https://product.hstatic.net/200000065946/product/pro_xanh_navy_noi_that_moho_ghe_an_go_verona_9_c2ccee43ff0d435e9feb4c30473dfc4d.jpg', '2024-11-16', 'MFDCCC103.N06');
INSERT INTO `subimages` VALUES (260, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an_go_malaga_13_0f68780b04be419bb7a45d788f2b32a9_master.jpg', '2024-11-16', 'MFDCCC101.N05');
INSERT INTO `subimages` VALUES (261, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an_go_malaga_11_7cedfbdf434341e2b0f41a6683a964e4_master.jpg', '2024-11-16', 'MFDCCC101.N05');
INSERT INTO `subimages` VALUES (262, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an_go_malaga_12_787f52c8fe2048e4b3c65a77e18c8c06_master.jpg', '2024-11-16', 'MFDCCC101.N05');
INSERT INTO `subimages` VALUES (263, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an_go_malaga_2_12cb0a52ce6044bd8a332ef0826a4316_master.jpg', '2024-11-16', 'MFDCCC101.N05');
INSERT INTO `subimages` VALUES (264, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an_go_malaga_3_91ad4d80ee284c9db4dc477f39b074c4_master.jpg', '2024-11-16', 'MFDCCC101.N05');
INSERT INTO `subimages` VALUES (265, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an_go_malaga_4_4500f00a179a43b286f3e4ff0ef5db6a_master.jpg', '2024-11-16', 'MFDCCC101.N05');
INSERT INTO `subimages` VALUES (266, 'https://product.hstatic.net/200000065946/product/pro_trang_noi_that_moho_hoc_tu_luu_tru_11_7cac38416e714e32b8534fd2a8e011d8_master.jpg', '2024-11-16', 'MWBWCBN01.W04');
INSERT INTO `subimages` VALUES (267, 'https://product.hstatic.net/200000065946/product/pro_trang_noi_that_moho_hoc_tu_luu_tru_1_52509c767ef64b3289070b0a005a145d.jpg', '2024-11-16', 'MWBWCBN01.W04');
INSERT INTO `subimages` VALUES (268, 'https://product.hstatic.net/200000065946/product/pro_trang_noi_that_moho_hoc_tu_luu_tru_2_0d4f16923757400e8f65e4272c529188.jpg', '2024-11-16', 'MWBWCBN01.W04');
INSERT INTO `subimages` VALUES (269, 'https://product.hstatic.net/200000065946/product/pro_trang_noi_that_moho_hoc_tu_luu_tru_3_eb2a59214a2648f2bb8597ab4dcdc6a6.jpg', '2024-11-16', 'MWBWCBN01.W04');
INSERT INTO `subimages` VALUES (270, 'https://product.hstatic.net/200000065946/product/pro_trang_noi_that_moho_hoc_tu_luu_tru_4_56028c40c11f45c88cb846f9975901fb.jpg', '2024-11-16', 'MWBWCBN01.W04');
INSERT INTO `subimages` VALUES (271, 'https://product.hstatic.net/200000065946/product/pro_trang_noi_that_moho_hoc_tu_luu_tru_5_856c8763a9744c7381cab01432f01bea.jpg', '2024-11-16', 'MWBWCBN01.W04');
INSERT INTO `subimages` VALUES (272, 'https://product.hstatic.net/200000065946/product/pro_nau_ghe_an_go_milan_1_ac2aae2b06094ab595210f7bcdb0e47f_master.jpg', '2024-11-16', 'MFDCCCD04.B05');
INSERT INTO `subimages` VALUES (273, 'https://product.hstatic.net/200000065946/product/pro_nau_ghe_an_go_milan_2_5e8bb12735a54808a4b91e3b89d6a37f_ce3dc35af4c84cd8b16ba78a1424613c_master.jpg', '2024-11-16', 'MFDCCCD04.B05');
INSERT INTO `subimages` VALUES (274, 'https://product.hstatic.net/200000065946/product/pro_nau_ghe_an_go_milan_3_8584ce7747c2478da4a5133093b6dd27_0c17d55f905a48db9810dac705a03e26_master.jpg', '2024-11-16', 'MFDCCCD04.B05');
INSERT INTO `subimages` VALUES (275, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ghe_van_phong_riga_1_36e7043208564abbb45f8bd6f68f998d_master.jpg', '2024-11-16', 'MWFNCC402.K07');
INSERT INTO `subimages` VALUES (276, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ghe_van_phong_riga_3_4722911408574dbf8513ef8d4aeefe0e.jpg', '2024-11-16', 'MWFNCC402.K07');
INSERT INTO `subimages` VALUES (277, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ghe_van_phong_riga_2_829b4245a8f04531aec1f6ce87f6b9eb.jpg', '2024-11-16', 'MWFNCC402.K07');
INSERT INTO `subimages` VALUES (278, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ghe_van_phong_riga_4_9f015c42095043599fb1a77b6244cd07.jpg', '2024-11-16', 'MWFNCC402.K07');
INSERT INTO `subimages` VALUES (279, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ghe_van_phong_riga_5_eb4533b5b7114c8e8f0b5d7b0b609d96.jpg', '2024-11-16', 'MWFNCC402.K07');
INSERT INTO `subimages` VALUES (280, 'https://product.hstatic.net/200000065946/product/pro_xam_noi_that_moho_ghe_van_phong_jefe_1_48604ad742f84db3b64168507767a9d0_master.jpg', '2024-11-16', 'MWFNCC201.G06');
INSERT INTO `subimages` VALUES (281, 'https://product.hstatic.net/200000065946/product/pro_xam_noi_that_moho_ghe_van_phong_jefe_2_64ce1e0a7a75460b98b3fe07f064a5f8.jpg', '2024-11-16', 'MWFNCC201.G06');
INSERT INTO `subimages` VALUES (282, 'https://product.hstatic.net/200000065946/product/pro_xam_noi_that_moho_ghe_van_phong_jefe_3_7d5e784f610943c5ad949dda8440b024.jpg', '2024-11-16', 'MWFNCC201.G06');
INSERT INTO `subimages` VALUES (283, 'https://product.hstatic.net/200000065946/product/pro_xam_noi_that_moho_ghe_van_phong_jefe_4_4b206a77467a411ab1ac5ec23d44c0c7.jpg', '2024-11-16', 'MWFNCC201.G06');
INSERT INTO `subimages` VALUES (284, 'https://product.hstatic.net/200000065946/product/pro_xam_noi_that_moho_ghe_van_phong_jefe_5_2d8b6404921d4645ba9f86eaf14c5b34.jpg', '2024-11-16', 'MWFNCC201.G06');
INSERT INTO `subimages` VALUES (285, 'https://product.hstatic.net/200000065946/product/pro_xam_noi_that_moho_ghe_van_phong_jefe_6_838c93a7bfc04eb8ac2fecff35c80252.jpg', '2024-11-16', 'MWFNCC201.G06');
INSERT INTO `subimages` VALUES (286, 'https://product.hstatic.net/200000065946/product/pro_xam_noi_that_moho_ghe_van_phong_major_1_c42a19b3b8634ec09327363bb4491bfa_master.jpg', '2024-11-16', 'MWBFCC201.G06');
INSERT INTO `subimages` VALUES (287, 'https://product.hstatic.net/200000065946/product/pro_xam_noi_that_moho_ghe_van_phong_major_2_22aa5d7ffceb4374afcf0ce37cb3f141.jpg', '2024-11-16', 'MWBFCC201.G06');
INSERT INTO `subimages` VALUES (288, 'https://product.hstatic.net/200000065946/product/pro_xam_noi_that_moho_ghe_van_phong_major_3_7f1c2cee529444ce940c7cac9bf9ccf4.jpg', '2024-11-16', 'MWBFCC201.G06');
INSERT INTO `subimages` VALUES (289, 'https://product.hstatic.net/200000065946/product/pro_xam_noi_that_moho_ghe_van_phong_major_4_5cf747f517f043588bb1f2becd64f2b1.jpg', '2024-11-16', 'MWBFCC201.G06');
INSERT INTO `subimages` VALUES (290, 'https://product.hstatic.net/200000065946/product/pro_xam_noi_that_moho_ghe_van_phong_major_5_1f51e5e286cf44adb3e812612f10a367.jpg', '2024-11-16', 'MWBFCC201.G06');
INSERT INTO `subimages` VALUES (291, 'https://product.hstatic.net/200000065946/product/pro_xam_noi_that_moho_ghe_van_phong_major_6_8dadfc7f2a8943ab812cfb79375b86da.jpg', '2024-11-16', 'MWBFCC201.G06');
INSERT INTO `subimages` VALUES (292, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ghe_van_phong_chan_quy_1_e2e0f1d592c34753b5c755af1444ecc2_master.jpg', '2024-11-16', 'MWFXCC201.K06');
INSERT INTO `subimages` VALUES (293, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ghe_van_phong_chan_quy_2_847c0e08233e4c02bb7aef01493dacfe_master.jpg', '2024-11-16', 'MWFXCC201.K06');
INSERT INTO `subimages` VALUES (294, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ghe_van_phong_chan_quy_3_c232605a28a941439875a0dae3c10a1f_master.jpg', '2024-11-16', 'MWFXCC201.K06');
INSERT INTO `subimages` VALUES (295, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ghe_van_phong_chan_quy_4_ad8edfc784de4f73879b8b3781f97a4a_master.jpg', '2024-11-16', 'MWFXCC201.K06');
INSERT INTO `subimages` VALUES (296, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ghe_van_phong_chan_quy_5_83bfd95963464f5dba809e3e58ac9af6_master.jpg', '2024-11-16', 'MWFXCC201.K06');
INSERT INTO `subimages` VALUES (297, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ghe_van_phong_chan_quy_6_2a69884c9229472d8b76f65f004a51a9_master.jpg', '2024-11-16', 'MWFXCC201.K06');
INSERT INTO `subimages` VALUES (298, 'https://product.hstatic.net/200000065946/product/pro_dem_xam_dam_noi_that_moho_ghe_sofa_kolding_2m_1_6_6687dc52fc4e48ecb82f27d5d9de3cca_master.jpg', '2024-11-16', 'MFSNCB701.K20');
INSERT INTO `subimages` VALUES (299, 'https://product.hstatic.net/200000065946/product/pro_dem_xam_dam_noi_that_moho_ghe_sofa_kolding_2m_1__2__52b641cf79f14ff79652504274917c92_master.jpg', '2024-11-16', 'MFSNCB701.K20');
INSERT INTO `subimages` VALUES (300, 'https://product.hstatic.net/200000065946/product/pro_dem_xam_dam_noi_that_moho_ghe_sofa_kolding_2m__2_f358e5e0f8a84dcb90b6d594376c1fd2_master.jpg', '2024-11-16', 'MFSNCB701.K20');
INSERT INTO `subimages` VALUES (301, 'https://product.hstatic.net/200000065946/product/pro_dem_xam_dam_noi_that_moho_ghe_sofa_kolding_2m_4_beff566930734e0b8b5f07ade1e301b2_master.jpg', '2024-11-16', 'MFSNCB701.K20');
INSERT INTO `subimages` VALUES (302, 'https://product.hstatic.net/200000065946/product/pro_dem_xam_dam_noi_that_moho_ghe_sofa_kolding_2m_3__2__9bd01af900cd4557ab3f81b61c001d66_master.jpg', '2024-11-16', 'MFSNCB701.K20');
INSERT INTO `subimages` VALUES (303, 'https://product.hstatic.net/200000065946/product/pro_dem_xam_dam_noi_that_moho_ghe_sofa_kolding_2m_5_82d5da23dae342dda5cedfd551bc3ce0_master.jpg', '2024-11-16', 'MFSNCB701.K20');
INSERT INTO `subimages` VALUES (304, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ban_lam_viec_work_701_1m4_7_36c73ec0825343fe8368b108d52be96d_master.jpg', '2024-11-16', 'MWNKCBN01.B14');
INSERT INTO `subimages` VALUES (305, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ban_lam_viec_work_701_2_4107765d3c4144ec8e59a976a83628a9.jpg', '2024-11-16', 'MWNKCBN01.B14');
INSERT INTO `subimages` VALUES (306, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ban_lam_viec_work_701_3_5d92db47daed4245923c7bb1978ec06b.jpg', '2024-11-16', 'MWNKCBN01.B14');
INSERT INTO `subimages` VALUES (307, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ban_lam_viec_work_701_4_c7a94cab47a14c7b9834c80db796eac6.jpg', '2024-11-16', 'MWNKCBN01.B14');
INSERT INTO `subimages` VALUES (308, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ban_lam_viec_work_701_11_4f944b2a05344fa8b317a6ecfd0278fa.jpg', '2024-11-16', 'MWNKCBN01.B14');
INSERT INTO `subimages` VALUES (309, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ban_lam_viec_work_701_1m4_7_36c73ec0825343fe8368b108d52be96d.jpg', '2024-11-16', 'MWNKCBN01.B14');
INSERT INTO `subimages` VALUES (310, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_combo_ban_va_guong_trang_diem_4_1ca3bb5e864d457b8017481f66fb20a7_master.jpg', '2024-11-16', 'MFMTSVNMT1MR1.N10');
INSERT INTO `subimages` VALUES (311, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_combo_ban_va_guong_trang_diem_2_b1b0519b9dc84f0bba38fc1f0976329f_master.jpg', '2024-11-16', 'MFMTSVNMT1MR1.N10');
INSERT INTO `subimages` VALUES (312, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ban_trang_diem_vienna_9_9617dfc2ccda4aa18216ae4562fde939_master.jpg', '2024-11-16', 'MFMTSVNMT1MR1.N10');
INSERT INTO `subimages` VALUES (313, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ban_trang_diem_2_df3051d5b7c74e85b0b83b777c329b67_master.jpg', '2024-11-16', 'MFMTSVNMT1MR1.N10');
INSERT INTO `subimages` VALUES (314, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ban_trang_diem_vienna_1_692762459c3e4c5a9119b3de2a9f0726_master.jpg', '2024-11-16', 'MFMTSVNMT1MR1.N10');
INSERT INTO `subimages` VALUES (315, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_combo_ban_va_guong_trang_diem_3_78969e0586f04f12a89dea4074eaf3f0_master.jpg', '2024-11-16', 'MFMTSVNMT1MR1.N10');
INSERT INTO `subimages` VALUES (316, 'https://product.hstatic.net/200000065946/product/pro_go_phoi_trang_noi_that_moho_tu_quan_ao_vienna_2_canh_47_882a1ed667d74a8e8fdac54709d51ec0_master.png', '2024-11-16', 'MFWRCDD02.M10');
INSERT INTO `subimages` VALUES (317, 'https://product.hstatic.net/200000065946/product/pro_go_phoi_trang_noi_that_moho_tu_quan_ao_vienna_2_canh_4ffcea0e7ee34d8293084e392e3ded26.jpg', '2024-11-16', 'MFWRCDD02.M10');
INSERT INTO `subimages` VALUES (318, 'https://product.hstatic.net/200000065946/product/pro_go_phoi_trang_noi_that_moho_tu_quan_ao_vienna_2_canh_2_3e8a7ba2e8024ee492d980bc1e6373e4.jpg', '2024-11-16', 'MFWRCDD02.M10');
INSERT INTO `subimages` VALUES (319, 'https://product.hstatic.net/200000065946/product/pro_go_phoi_trang_noi_that_moho_tu_quan_ao_vienna_2_canh_f026326635cf40c29044ad8f000123fa.jpg', '2024-11-16', 'MFWRCDD02.M10');
INSERT INTO `subimages` VALUES (320, 'https://product.hstatic.net/200000065946/product/pro_go_phoi_trang_noi_that_moho_tu_quan_ao_vienna_2_canh_47_882a1ed667d74a8e8fdac54709d51ec0.png', '2024-11-16', 'MFWRCDD02.M10');
INSERT INTO `subimages` VALUES (321, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_phoi_trang_noi_that_moho_tu_quan_ao_vienna_2_d431b87a01de4731a2f3cd8e7610297a_master.jpg', '2024-11-16', 'MFWRCDD03.N05');
INSERT INTO `subimages` VALUES (322, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_phoi_trang_noi_that_moho_tu_quan_ao_vienna_2_d431b87a01de4731a2f3cd8e7610297a.jpg', '2024-11-16', 'MFWRCDD03.N05');
INSERT INTO `subimages` VALUES (323, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_phoi_trang_noi_that_moho_tu_quan_ao_vienna_2_d431b87a01de4731a2f3cd8e7610297a.jpg', '2024-11-16', 'MFWRCDD03.N05');
INSERT INTO `subimages` VALUES (324, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_vienna_tay_nam_ke_go_1_e06da42023f0469f967173ed338b0791_master.jpg', '2024-11-16', 'MFWRCDD01.B05');
INSERT INTO `subimages` VALUES (325, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_vienna_tay_nam_ke_go_2_ae74170de91d43c5bd580541131a1b3a.jpg', '2024-11-16', 'MFWRCDD01.B05');
INSERT INTO `subimages` VALUES (326, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_vienna_tay_nam_ke_go_3_554b97b6ffe14cddaec90259ee607f43.jpg', '2024-11-16', 'MFWRCDD01.B05');
INSERT INTO `subimages` VALUES (327, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_bo_ban_an_milan_4_ghe_oslo_901_4_cebc39261df04cfa9262bdf8550c784e_master.jpg', '2024-11-16', 'MFDTSMLFYDC4.N12');
INSERT INTO `subimages` VALUES (328, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_bo_ban_an_milan_4_ghe_odessa_901__4__9b162939d2484ce68c1aedc3ea9d6669.jpg', '2024-11-16', 'MFDTSMLFYDC4.N12');
INSERT INTO `subimages` VALUES (329, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_bo_ban_an_milan_4_ghe_malaga_1_a44528110fd44b8fb39c935994aea8ca.jpg', '2024-11-16', 'MFDTSMLFYDC4.N12');
INSERT INTO `subimages` VALUES (330, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_bo_ban_an_milan_4_ghe_verona_mau_be_2_5d87628f730d4e97a03140a000a6943e.jpg', '2024-11-16', 'MFDTSMLFYDC4.N12');
INSERT INTO `subimages` VALUES (331, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_bo_ban_an_milan_4_ghe_verona_mau_xam_3_0dfaa32630964d838de73cb2a5029889.jpg', '2024-11-16', 'MFDTSMLFYDC4.N12');
INSERT INTO `subimages` VALUES (332, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_bo_ban_an_go_milan_4_ghe_nexo_2_13bb7435ef194314abd492a349b2a66a.jpg', '2024-11-16', 'MFDTSMLFYDC4.N12');
INSERT INTO `subimages` VALUES (333, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_lam_viec_go_co_ke_vline_6_2fd5643fbb19409ca67f6c65a1ba77a4_master.jpg', '2024-11-16', 'MOFKCB501.B12');
INSERT INTO `subimages` VALUES (334, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_lam_viec_go_co_ke_vline_1_b6926338890d41ff8f49520ba50b2e62_master.jpg', '2024-11-16', 'MOFKCB501.B12');
INSERT INTO `subimages` VALUES (335, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_lam_viec_go_co_ke_vline_2_05f80c2a27694bf69d74930209af0be4_master.jpg', '2024-11-16', 'MOFKCB501.B12');
INSERT INTO `subimages` VALUES (336, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_lam_viec_go_co_ke_vline_3_3ed478504c384e7593ffb13d57b9e78d_master.jpg', '2024-11-16', 'MOFKCB501.B12');
INSERT INTO `subimages` VALUES (337, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_lam_viec_go_co_ke_vline_4_9e76f2a1d81c45b2b72768f1d73fb8e5_master.jpg', '2024-11-16', 'MOFKCB501.B12');
INSERT INTO `subimages` VALUES (338, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_lam_viec_go_co_ke_vline_5_9afb8c211357423aaedd6d8f9f1201d5_master.jpg', '2024-11-16', 'MOFKCB501.B12');
INSERT INTO `subimages` VALUES (339, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ban_lam_viec_go_co_ke_vline_4_b433c72c14024fb4b5929c24ce13509e_master.jpg', '2024-11-16', 'MOFKCB501.N12');
INSERT INTO `subimages` VALUES (340, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ban_lam_viec_go_co_ke_vline_4_b433c72c14024fb4b5929c24ce13509e.jpg', '2024-11-16', 'MOFKCB501.N12');
INSERT INTO `subimages` VALUES (341, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ban_lam_viec_go_co_ke_vline_5_060b7838dfe1480a93f886abaf067bc5_master.jpg', '2024-11-16', 'MOFKCB501.N12');
INSERT INTO `subimages` VALUES (342, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ban_lam_viec_go_co_ke_vline_1_e3cbfa58f546459eacd0843f2a64ce8b_master.jpg', '2024-11-16', 'MOFKCB501.N12');
INSERT INTO `subimages` VALUES (343, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ban_lam_viec_go_co_ke_vline_2_d77f865b3c1a45d194e02177962b8439_master.jpg', '2024-11-16', 'MOFKCB501.N12');
INSERT INTO `subimages` VALUES (344, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ban_lam_viec_go_co_ke_vline_3_b4d918785ef5403d81cfef4da7d388f3_master.jpg', '2024-11-16', 'MOFKCB501.N12');
INSERT INTO `subimages` VALUES (345, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_an_go_vline_1_2070a5751a624ebcb4ff1a0f726b74c2_master.jpg', '2024-11-16', 'MFDTCA701.B09');
INSERT INTO `subimages` VALUES (346, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_an___2__4d15bb4d1a774a4e891415feeae1fe25.png', '2024-11-16', 'MFDTCA701.B09');
INSERT INTO `subimages` VALUES (347, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_an___1__3da334ca1edf473bb4bfe851bfd5e14d.png', '2024-11-16', 'MFDTCA701.B09');
INSERT INTO `subimages` VALUES (348, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_an_go_vline_2_0022b6ac4fa44f07b9c04a1f70369990.jpg', '2024-11-16', 'MFDTCA701.B09');
INSERT INTO `subimages` VALUES (349, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_an_go_vline_3_aa5ad4acbc8e48c282d417ccaabdf568.jpg', '2024-11-16', 'MFDTCA701.B09');
INSERT INTO `subimages` VALUES (350, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_an_go_vline_4_8b279b2ae2ab4dd6837b13e6923d1b17.jpg', '2024-11-16', 'MFDTCA701.B09');
INSERT INTO `subimages` VALUES (351, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_go_malaga_11_12d457b5f32f4be4831862b3e1af3751_master.jpg', '2024-11-16', 'MFBSCAO02.N05');
INSERT INTO `subimages` VALUES (352, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_go_malaga_12_25e16695f1a645208133300c9f616020_master.jpg', '2024-11-16', 'MFBSCAO02.N05');
INSERT INTO `subimages` VALUES (353, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_go_malaga_13_48f9a74f25124a9ca4613c7ffddced95_master.jpg', '2024-11-16', 'MFBSCAO02.N05');
INSERT INTO `subimages` VALUES (354, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_go_moho_malaga_1_efebddba0868449b933c1a8e88d36fab_master.jpg', '2024-11-16', 'MFBSCAO02.N05');
INSERT INTO `subimages` VALUES (355, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_go_moho_malaga_2_a27d299fbdd3416ba2c3fcb20cf70557_master.jpg', '2024-11-16', 'MFBSCAO02.N05');
INSERT INTO `subimages` VALUES (356, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_go_moho_malaga_3_b80e0537a2e34460ab7807c711bb6bab_master.jpg', '2024-11-16', 'MFBSCAO02.N05');
INSERT INTO `subimages` VALUES (357, 'https://product.hstatic.net/200000065946/product/lo_xo_phoenix_2_mat_vai_152a583be5aa45ddb0675f9b2df14613_1024x1024.jpg', '2024-11-16', 'MD.LX6NPN-1.8X2.0');
INSERT INTO `subimages` VALUES (358, 'https://product.hstatic.net/200000065946/product/pro_trang_kem_noi_that_moho_nem_lo_xo_van_thanh__9ffeace09eae494baf02dd69905f753b_master.png', '2024-11-16', 'MD.LXGXT8N-1.8X2.0');
INSERT INTO `subimages` VALUES (359, 'https://product.hstatic.net/200000065946/product/pro_trang_kem_noi_that_moho_nem_lo_xo_van_thanh_1_f450cb4751eb444d963cf01ecad6b5d5.png', '2024-11-16', 'MD.LXGXT8N-1.8X2.0');
INSERT INTO `subimages` VALUES (360, 'https://product.hstatic.net/200000065946/product/pro_trang_kem_noi_that_moho_nem_lo_xo_van_thanh_3-2_04631ea7bb0940dbb39f30ef7a529600.png', '2024-11-16', 'MD.LXGXT8N-1.8X2.0');
INSERT INTO `subimages` VALUES (361, 'https://product.hstatic.net/200000065946/product/pro_trang_kem_noi_that_moho_nem_lo_xo_van_thanh_4-2_cdce3ba04407488ba6626036e6e5b00c.png', '2024-11-16', 'MD.LXGXT8N-1.8X2.0');
INSERT INTO `subimages` VALUES (362, 'https://product.hstatic.net/200000065946/product/pro_trang_kem_noi_that_moho_nem_lo_xo_van_thanh_5-2_a1ccdbe996ab4ff48e3207abbc2530fa.png', '2024-11-16', 'MD.LXGXT8N-1.8X2.0');
INSERT INTO `subimages` VALUES (363, 'https://product.hstatic.net/200000065946/product/pro_trang_kem_noi_that_moho_nem_lo_xo_van_thanh_6-2_4a0ee7a01c9f4dec89faf7c719cb1488.png', '2024-11-16', 'MD.LXGXT8N-1.8X2.0');
INSERT INTO `subimages` VALUES (364, 'https://product.hstatic.net/200000065946/product/lo_xo_tui_ruby_22651984e65d4b4caa241da9f3a846e0_1024x1024.jpg', '2024-11-16', 'MD.LXRB10N-1.6X2.0');
INSERT INTO `subimages` VALUES (365, 'https://product.hstatic.net/200000065946/product/nem_cao_su_thien_nhien_bao_hanh_12_nam_-_copy_4c33b367a317434b91cc60d5196b3402_1024x1024.jpg', '2024-11-16', 'MD.CS-1M0');
INSERT INTO `subimages` VALUES (366, 'https://product.hstatic.net/200000065946/product/lo_xo_tui_harmony_51e73afc497646cab1a56e383aabddd9_1024x1024.jpg', '2024-11-16', 'MD.LXHY12N-1.8X2.0');
INSERT INTO `subimages` VALUES (367, 'https://product.hstatic.net/200000065946/product/nem_cao_su_thien_nhien_bao_hanh_12_nam_-_copy_765f8c1c56aa4568a92d851c11f32de5_master.jpg', '2024-11-16', 'MD.CS50-1M0');
INSERT INTO `subimages` VALUES (368, 'https://product.hstatic.net/200000065946/product/pro_cao_su_thien_nhien_noi_that_moho_nem_cao_su_tu_nhien_3_056e44d7115341479b91462aa164e82a.png', '2024-11-16', 'MD.CS50-1M0');
INSERT INTO `subimages` VALUES (369, 'https://product.hstatic.net/200000065946/product/pro_cao_su_thien_nhien_noi_that_moho_nem_cao_su_tu_nhien_1_005c96aa2de1447092a5fb7eb8aa6c21.png', '2024-11-16', 'MD.CS50-1M0');
INSERT INTO `subimages` VALUES (370, 'https://product.hstatic.net/200000065946/product/lo_xo_gap_comfy_cfad04ea8a0948d7ac72f48572a6f044_1024x1024.jpg', '2024-11-16', 'MD.LXCOMFY-1M8(G3)');
INSERT INTO `subimages` VALUES (371, 'https://product.hstatic.net/200000065946/product/lo_xo_tui_lacoil_d260102c40a340a2ad86d45181092416_1024x1024.jpg', '2024-11-16', 'MD.LXLACOIL-1.8X2.0');
INSERT INTO `subimages` VALUES (372, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_sofa_fyn_901_2_6db9b36362284eeb9c94a841747295f9_master.jpg', '2024-11-16', 'MFSNCB601.N20');
INSERT INTO `subimages` VALUES (373, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_sofa_fyn_901_2_6db9b36362284eeb9c94a841747295f9.jpg', '2024-11-16', 'MFSNCB601.N20');
INSERT INTO `subimages` VALUES (374, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_sofa_fyn_901_6ab12aad12f44c998bf44917d5483085.jpg', '2024-11-16', 'MFSNCB601.N20');
INSERT INTO `subimages` VALUES (375, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_sofa_fyn_901_2_6db9b36362284eeb9c94a841747295f9.jpg', '2024-11-16', 'MFSNCB601.N20');
INSERT INTO `subimages` VALUES (376, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_sofa_fyn_901_6_fde6d1726c0f4039b5146f31e7ca7eb4.jpg', '2024-11-16', 'MFSNCB601.N20');
INSERT INTO `subimages` VALUES (377, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_sofa_fyn_901_14_f0ca94b9b7d74d8997bdd4dfc18945ec.jpg', '2024-11-16', 'MFSNCB601.N20');
INSERT INTO `subimages` VALUES (378, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an_go_cao_su_fyn__4__6f72ede2ef024d89b2643dd0d9b41e1f_master.jpg', '2024-11-16', 'MFDCCD901.N05');
INSERT INTO `subimages` VALUES (379, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an_go_cao_su_fyn__4__6f72ede2ef024d89b2643dd0d9b41e1f.jpg', '2024-11-16', 'MFDCCD901.N05');
INSERT INTO `subimages` VALUES (380, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an_go_cao_su_fyn__4__266a38cc5eca442cad5e4b316f7f4663.jpg', '2024-11-16', 'MFDCCD901.N05');
INSERT INTO `subimages` VALUES (381, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an_go_cao_su_fyn__2__53dde4f9c603445ead2183fa6e89c6e0.jpg', '2024-11-16', 'MFDCCD901.N05');
INSERT INTO `subimages` VALUES (382, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an_go_cao_su_fyn__3__44c66d9636364db4973f37f29d33c619.jpg', '2024-11-16', 'MFDCCD901.N05');
INSERT INTO `subimages` VALUES (383, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an_go_cao_su_fyn_19b045c28691431794386a9242c21887.jpg', '2024-11-16', 'MFDCCD901.N05');
INSERT INTO `subimages` VALUES (384, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an_go_cao_su_fyn__5__02cbd3b29023435eba90243aa32a48e7.jpg', '2024-11-16', 'MFDCCD901.N05');
INSERT INTO `subimages` VALUES (385, 'https://product.hstatic.net/200000065946/product/pro_nau_tu_quan_ao_go_vline_1m5_9_1__6ec40d8210b34bc3845327bc455be324_0a700313600b43849852e8e1bfb3ba4a_master.png', '2024-11-16', 'MFWRSV201V2.BMS');
INSERT INTO `subimages` VALUES (386, 'https://product.hstatic.net/200000065946/product/pro_nau_tu_quan_ao_go_vline_1m5_10_1__893d0f7d0b99409183999f23000b8279_2c763f92649b406998e28512495331e2.png', '2024-11-16', 'MFWRSV201V2.BMS');
INSERT INTO `subimages` VALUES (387, 'https://product.hstatic.net/200000065946/product/pro_nau_tu_quan_ao_go_vline_19_04669841756a41528abd8daae497dd47_ce0d14735b8b454e9ab6c14d6858274b.png', '2024-11-16', 'MFWRSV201V2.BMS');
INSERT INTO `subimages` VALUES (388, 'https://product.hstatic.net/200000065946/product/pro_nau_tu_quan_ao_go_vline_1916_2fbce408a0fa427ea51b08c1b829dc21_59317d24bc3b4145a5dbc387c069a79e.png', '2024-11-16', 'MFWRSV201V2.BMS');
INSERT INTO `subimages` VALUES (389, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_set_ban_tra_sofa_oslo_1_f0021fb1071e4b2e9c357f2ed39539e6_master.jpg', '2024-11-16', 'MFSTSOL901.BST2');
INSERT INTO `subimages` VALUES (390, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_set_ban_tra_sofa_oslo_1_3936051757ee49edb172d6df03613f7a.jpg', '2024-11-16', 'MFSTSOL901.BST2');
INSERT INTO `subimages` VALUES (391, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_bo_ban_an_oslo_6_ghe_oslo_1_054e2af61f224796aba9656935051e34_master.jpg', '2024-11-16', 'MFDTSOLVBGDC6.N14');
INSERT INTO `subimages` VALUES (392, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_bo_ban_an_oslo_6_ghe_milan_1_3c9b7ebea238420e9c4008a3edc20aad.jpg', '2024-11-16', 'MFDTSOLVBGDC6.N14');
INSERT INTO `subimages` VALUES (393, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_bo_ban_an_oslo_6_ghe_oslo_2_f40e4707eb5c4428b4813cb325636a4c.jpg', '2024-11-16', 'MFDTSOLVBGDC6.N14');
INSERT INTO `subimages` VALUES (394, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_bo_ban_an_oslo_6_ghe_oslo_3_dd5c9b2eab93460e9fd53b2c5cc7aeb4.jpg', '2024-11-16', 'MFDTSOLVBGDC6.N14');
INSERT INTO `subimages` VALUES (395, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_bo_ban_an_oslo_6_ghe_malaga_2_f151462bd1d944b391d027f6ad381c3f.jpg', '2024-11-16', 'MFDTSOLVBGDC6.N14');
INSERT INTO `subimages` VALUES (396, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_bo_ban_an_oslo_6_ghe_malaga_3_16f391021a6c45fbb4d124341bf11c34.jpg', '2024-11-16', 'MFDTSOLVBGDC6.N14');
INSERT INTO `subimages` VALUES (397, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_bo_ban_an_oslo_6_ghe_odessa_1_6b1721ccf6ed4e439f07ddb86c82471a.jpg', '2024-11-16', 'MFDTSOLVBGDC6.N14');
INSERT INTO `subimages` VALUES (398, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ghe_an_odessa_6_98d8d065e6254d03969bb97e51fcf485_master.jpg', '2024-11-16', 'MFDCCAD07.N05');
INSERT INTO `subimages` VALUES (399, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ghe_an_odessa_6_98d8d065e6254d03969bb97e51fcf485.jpg', '2024-11-16', 'MFDCCAD07.N05');
INSERT INTO `subimages` VALUES (400, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_1_63661ff7993a435daf7a04f5d9255f35.png', '2024-11-16', 'MFDCCAD07.N05');
INSERT INTO `subimages` VALUES (401, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ghe_an_go_odessa_1_80b209d6f0d34eef979182d554988f15.jpg', '2024-11-16', 'MFDCCAD07.N05');
INSERT INTO `subimages` VALUES (402, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ghe_an_go_odessa_2_e4ed4d57eeb24be68765b716b5d3b26a.jpg', '2024-11-16', 'MFDCCAD07.N05');
INSERT INTO `subimages` VALUES (403, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ghe_an_go_odessa_3_13881edb9b1b4980ace823024b1581bf.jpg', '2024-11-16', 'MFDCCAD07.N05');
INSERT INTO `subimages` VALUES (404, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ghe_an_go_odessa_4_12dabc3ba82142619ab217534605d05f.jpg', '2024-11-16', 'MFDCCAD07.N05');
INSERT INTO `subimages` VALUES (405, 'https://product.hstatic.net/200000065946/product/pro_trang_xam_noi_that_moho_set_2_ban_sofa_milan_602_1_44ce4340a4764520a5754ffc2934687e_master.jpg', '2024-11-16', 'MFSTSV601.GW2');
INSERT INTO `subimages` VALUES (406, 'https://product.hstatic.net/200000065946/product/pro_trang_xam_noi_that_moho_set_2_ban_sofa_milan_602_1_352bf9cdbe2d400c899dd29ae476404f_master.jpg', '2024-11-16', 'MFSTSV601.GW2');
INSERT INTO `subimages` VALUES (407, 'https://file.hstatic.net/200000065946/file/noi-that-moho-icon-xem-video_fac41602910e4c228b9bb8974b9d1fc6.jpg', '2024-11-16', 'MFSTSV601.GW2');
INSERT INTO `subimages` VALUES (408, 'https://product.hstatic.net/200000065946/product/pro_trang_noi_that_moho_tu_ke_ngan_05_6fac2f95f5d84489a07b6366f3bf4167_master.png', '2024-11-16', 'MFWRCA901.W05');
INSERT INTO `subimages` VALUES (409, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_set_tu_quan_ao_vienna_a_6340457b0bb842fca7952aa4cbececfe_master.jpg', '2024-11-16', 'MFWRSVN201V2.NSMH');
INSERT INTO `subimages` VALUES (410, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_set_tu_quan_ao_vienna_a_6340457b0bb842fca7952aa4cbececfe.jpg', '2024-11-16', 'MFWRSVN201V2.NSMH');
INSERT INTO `subimages` VALUES (411, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_set_tu_quan_ao_vienna_46e9bc6ea5d04e458df8fe556e63e522.jpg', '2024-11-16', 'MFWRSVN201V2.NSMH');
INSERT INTO `subimages` VALUES (412, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_set_tu_quan_ao_vienna_279bfa26726b405e852cc358ac5a9564.jpg', '2024-11-16', 'MFWRSVN201V2.NSMH');
INSERT INTO `subimages` VALUES (413, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_set_tu_quan_ao_vienna_2_1868240fb3a34c9ca6e5ca219ef07208.jpg', '2024-11-16', 'MFWRSVN201V2.NSMH');
INSERT INTO `subimages` VALUES (414, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_set_tu_quan_ao_vienna_3_517bc851b6a547fcbf7261f9b3e3bfce.jpg', '2024-11-16', 'MFWRSVN201V2.NSMH');
INSERT INTO `subimages` VALUES (415, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_set_tu_quan_ao_vienna_4_4f4ab0e8377246919a3c2c7d81413de6.jpg', '2024-11-16', 'MFWRSVN201V2.NSMH');
INSERT INTO `subimages` VALUES (416, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_vienna_2_canh_1m_33_5c46811848204476865917f28dbc79c4_master.png', '2024-11-16', 'MFWRSVN201V2.BSH');
INSERT INTO `subimages` VALUES (417, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_vienna_21_cafa99a772f642cabe79360562a36700_master.png', '2024-11-16', 'MFWRSVN201V2.BMS');
INSERT INTO `subimages` VALUES (418, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_vienna_21_cafa99a772f642cabe79360562a36700.png', '2024-11-16', 'MFWRSVN201V2.BMS');
INSERT INTO `subimages` VALUES (419, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_vienna_22_72839cc8299e48adba7bfccff85ef9b9.png', '2024-11-16', 'MFWRSVN201V2.BMS');
INSERT INTO `subimages` VALUES (420, 'https://product.hstatic.net/200000065946/product/pro_go_phoi_trang_tu_quan_ao_3_canh_vienna_201_2_54feb0ad5d204951b658e42981c288a4_master.png', '2024-11-16', 'MFWRSVN201V2.MMH');
INSERT INTO `subimages` VALUES (421, 'https://product.hstatic.net/200000065946/product/pro_go_phoi_trang_noi_that_moho_tu_quan_ao_go_3_canh_2_102827f122334ea5a15ba3d6c04e72ca.jpg', '2024-11-16', 'MFWRSVN201V2.MMH');
INSERT INTO `subimages` VALUES (422, 'https://product.hstatic.net/200000065946/product/pro_go_phoi_trang_tu_quan_ao_3_canh_vienna_201_1_51e5ac683ecb4a6e9b989351ee0695fa.png', '2024-11-16', 'MFWRSVN201V2.MMH');
INSERT INTO `subimages` VALUES (423, 'https://product.hstatic.net/200000065946/product/pro_go_phoi_trang_tu_quan_ao_3_canh_vienna_201_2_54feb0ad5d204951b658e42981c288a4.png', '2024-11-16', 'MFWRSVN201V2.MMH');
INSERT INTO `subimages` VALUES (424, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_vienna_2_canh_1m_a_99418c1b50054f7e894915aa4766e49c_master.jpg', '2024-11-16', 'MFWRCD506.B10');
INSERT INTO `subimages` VALUES (425, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_vienna_2_canh_1m_0fb0ab3f984d4cfcae172f92c1ec041f.jpg', '2024-11-16', 'MFWRCD506.B10');
INSERT INTO `subimages` VALUES (426, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_vienna_2_canh_1m_24_b3f745ee6f6e4591bea18a54d07e5c76.png', '2024-11-16', 'MFWRCD506.B10');
INSERT INTO `subimages` VALUES (427, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_vienna_2_canh_1m_27_5c996c6d74e646219a21a53f7c2b0446.png', '2024-11-16', 'MFWRCD506.B10');
INSERT INTO `subimages` VALUES (428, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_vienna_2_canh_1m_33_c93ce123902f426591f92972d0a0efb8.png', '2024-11-16', 'MFWRCD506.B10');
INSERT INTO `subimages` VALUES (429, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_vienna_1_canh_50cm_32_f3b81560a67946e79454af413efe30db_master.png', '2024-11-16', 'MFWRCD504.B05');
INSERT INTO `subimages` VALUES (430, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_vienna_2_canh_1m_33_fe17f8ecea534e7085f5770860a0c775.png', '2024-11-16', 'MFWRCD504.B05');
INSERT INTO `subimages` VALUES (431, 'https://product.hstatic.net/200000065946/product/vienna_wardrobe_wh_1_t_4e06cc783cb4400fab838a87a6a28d08_master.png', '2024-11-16', 'MFWRCD505.W05');
INSERT INTO `subimages` VALUES (432, 'https://product.hstatic.net/200000065946/product/pro_trang_tu_quan_ao_thanh_treo_vienna_201_2_bee63b62bf6c4728964894ed7a583f56.png', '2024-11-16', 'MFWRCD505.W05');
INSERT INTO `subimages` VALUES (433, 'https://product.hstatic.net/200000065946/product/pro_trang_tu_quan_ao_vienna_thanh_treo_01_baf86830795141eea12dcea09f959aee.png', '2024-11-16', 'MFWRCD505.W05');
INSERT INTO `subimages` VALUES (434, 'https://product.hstatic.net/200000065946/product/pro_trang_tu_quan_ao_vienna_thanh_treo_02_489ee1c74fd5431b99ea8c31a8008ff4.png', '2024-11-16', 'MFWRCD505.W05');
INSERT INTO `subimages` VALUES (435, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ban_lam_viec_vline_1_92060b73c393469181d9d24218c38851_master.jpg', '2024-11-16', 'MFTNCAO01.N11');
INSERT INTO `subimages` VALUES (436, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ban_lam_viec_vline_2_c5873c63ba1d417d93a80ad99569ef51_master.jpg', '2024-11-16', 'MFTNCAO01.N11');
INSERT INTO `subimages` VALUES (437, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ban_lam_viec_vline_3_b32e93a14f7b4af6866b0beb92e35798_master.jpg', '2024-11-16', 'MFTNCAO01.N11');
INSERT INTO `subimages` VALUES (438, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ban_lam_viec_vline_5_70a8ab5d00c6463ea5eee815b34800b3_master.jpg', '2024-11-16', 'MFTNCAO01.N11');
INSERT INTO `subimages` VALUES (439, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ban_lam_viec_vline_7_fb8a8b06d20b446381fb47f1e5c367df_master.jpg', '2024-11-16', 'MFTNCAO01.N11');
INSERT INTO `subimages` VALUES (440, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_lam_viec_vline_601_a_e60e2f8b72854311ae12424eed3cb88a_master.jpg', '2024-11-16', 'MFTNCAO01.B11');
INSERT INTO `subimages` VALUES (441, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_lam_viec_vline_601_45d5b92f9a2b464e8382610013e531d7_master.jpg', '2024-11-16', 'MFTNCAO01.B11');
INSERT INTO `subimages` VALUES (442, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_lam_viec_vline_601_2_6bf27bf129314b939560356444c1f2c7_master.jpg', '2024-11-16', 'MFTNCAO01.B11');
INSERT INTO `subimages` VALUES (443, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_lam_viec_vline_601_4_17eb5523e35c4e2fa99e8eea41c3be06_master.jpg', '2024-11-16', 'MFTNCAO01.B11');
INSERT INTO `subimages` VALUES (444, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_lam_viec_go_soi_vline_601_3_3d784700168f460f8392f22a8571ab3b_master.png', '2024-11-16', 'MFTNCAO01.B11');
INSERT INTO `subimages` VALUES (445, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_bo_ban_an_vline_nau_1m6_4_5607bf3740be4ac088bf64a470635cce_master.jpg', '2024-11-16', 'MFDTSVLBR1DB1.B16');
INSERT INTO `subimages` VALUES (446, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_bo_ban_an_vline_1_dai_2_ghe_don_2_1_58ce32f86df6402c9d6b5cb7066ab92f.jpg', '2024-11-16', 'MFDTSVLBR1DB1.B16');
INSERT INTO `subimages` VALUES (447, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_bo_ban_an_vline_1_dai_2_ghe_don_2_2_d1ebf083d25949638b31b11dde23c7bf.jpg', '2024-11-16', 'MFDTSVLBR1DB1.B16');
INSERT INTO `subimages` VALUES (448, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_bo_ban_an_vline_nau_1m6_1_7c040b3931a545b59ae656521059f7ec.jpg', '2024-11-16', 'MFDTSVLBR1DB1.B16');
INSERT INTO `subimages` VALUES (449, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_bo_ban_an_vline_nau_1m6_2_c2fe71b13dee407289680d4f6b8d2c2c.jpg', '2024-11-16', 'MFDTSVLBR1DB1.B16');
INSERT INTO `subimages` VALUES (450, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_bo_ban_an_vline_nau_1m6_3_8e7089b973184a828cf2aa5e41d5b6a2.jpg', '2024-11-16', 'MFDTSVLBR1DB1.B16');
INSERT INTO `subimages` VALUES (451, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_bo_ban_an_vline_1_c2652ee64fbe48a9b3b4009fe195fba0_master.jpg', '2024-11-16', 'MFDTSVLDC2.B09');
INSERT INTO `subimages` VALUES (452, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_an___1__beeb9f98ed6d4d0bb0fc19e2bdae30cf.png', '2024-11-16', 'MFDTSVLDC2.B09');
INSERT INTO `subimages` VALUES (453, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_an___2__13d4a0a5dccd4267afe65e07a0fd9ad7.png', '2024-11-16', 'MFDTSVLDC2.B09');
INSERT INTO `subimages` VALUES (454, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_an___3__70ebfa1e09754a76a6840c7b9ea211fe.png', '2024-11-16', 'MFDTSVLDC2.B09');
INSERT INTO `subimages` VALUES (455, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_bo_ban_an_go_oslo_4_ghe_milan_8ec49013bbe64a489d654fd997d299c7_master.jpg', '2024-11-16', 'MFDTSOLMLDC4.N14');
INSERT INTO `subimages` VALUES (456, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_bo_ban_an_go_oslo_4_ghe_milan_8ec49013bbe64a489d654fd997d299c7.jpg', '2024-11-16', 'MFDTSOLMLDC4.N14');
INSERT INTO `subimages` VALUES (457, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_bo_ban_an_oslo_4_ghe_verono_mau_be_1_b04ed5ccb65040bab5752965822c786e.jpg', '2024-11-16', 'MFDTSOLMLDC4.N14');
INSERT INTO `subimages` VALUES (458, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_bo_ban_an_oslo_4_ghe_verono_mau_navy_1_d956e8fcad2844aabaa193877d1d869d.jpg', '2024-11-16', 'MFDTSOLMLDC4.N14');
INSERT INTO `subimages` VALUES (459, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_bo_ban_an_go_oslo_4_ghe_nexo_addf4c6eacab4a0093aa586ee6591ae6.jpg', '2024-11-16', 'MFDTSOLMLDC4.N14');
INSERT INTO `subimages` VALUES (460, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_bo_ban_an_go_oslo_4_ghe_soro_1fc2760ed3ab491987892c12b67281ff.jpg', '2024-11-16', 'MFDTSOLMLDC4.N14');
INSERT INTO `subimages` VALUES (461, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_bo_ban_an_go_oslo_4_ghe_vibor_mau_trang_479140c20e9748f0a66a93ea1e90fcb7.jpg', '2024-11-16', 'MFDTSOLMLDC4.N14');
INSERT INTO `subimages` VALUES (462, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_go_vienna_11_18a111d742864bfeb8ac20335371286b_master.jpg', '2024-11-16', 'MFBSCA501.B05');
INSERT INTO `subimages` VALUES (463, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_go_vienna_2_7f610bfafd6748958a6b21d1093f2919.jpg', '2024-11-16', 'MFBSCA501.B05');
INSERT INTO `subimages` VALUES (464, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_go_vienna_3_b5d53fd42b0d4f249dd9c94fc244ab5b.jpg', '2024-11-16', 'MFBSCA501.B05');
INSERT INTO `subimages` VALUES (465, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_go_vienna_4_073b9dd3f753456193f5407a4bfda614.jpg', '2024-11-16', 'MFBSCA501.B05');
INSERT INTO `subimages` VALUES (466, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_go_vienna_5_6b61ffbfd0814631a39004c6b6e6228e.jpg', '2024-11-16', 'MFBSCA501.B05');
INSERT INTO `subimages` VALUES (467, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_go_vienna_6_b3322d5f05e943149520a10a930c7fb2.jpg', '2024-11-16', 'MFBSCA501.B05');
INSERT INTO `subimages` VALUES (468, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_giay_vline_601_1_4d815074d997442b86777b129e166f13_master.jpg', '2024-11-16', 'MFCDCA901.B08');
INSERT INTO `subimages` VALUES (469, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_giay_vline_601_2_cd8a1e0b318f48069d9cd43ac25435ff_master.jpg', '2024-11-16', 'MFCDCA901.B08');
INSERT INTO `subimages` VALUES (470, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_giay_vline_601_3_792c4b885be14b6fb969d56f5d2ff81e_master.jpg', '2024-11-16', 'MFCDCA901.B08');
INSERT INTO `subimages` VALUES (471, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_giay_vline_601_4_d9d7509d29c54281a453cf1d2ffb5929_master.jpg', '2024-11-16', 'MFCDCA901.B08');
INSERT INTO `subimages` VALUES (472, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_giay_vline_601_5_dbd34de6ee784a69a2d7840f11a72e48_master.jpg', '2024-11-16', 'MFCDCA901.B08');
INSERT INTO `subimages` VALUES (473, 'https://file.hstatic.net/200000065946/file/noi-that-moho-icon-xem-video_fac41602910e4c228b9bb8974b9d1fc6.jpg', '2024-11-16', 'MFCDCA901.B08');
INSERT INTO `subimages` VALUES (474, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_giay_vline_601_1_69d5ae45a39744f4bec4eb52bd28a0d1_master.jpg', '2024-11-16', 'MFCDCA901.N08');
INSERT INTO `subimages` VALUES (475, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_giay_vline_601_1_69d5ae45a39744f4bec4eb52bd28a0d1.jpg', '2024-11-16', 'MFCDCA901.N08');
INSERT INTO `subimages` VALUES (476, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_giay_vline_601_2_c8bf1133b8ae450fb7f283c1b561f169_master.jpg', '2024-11-16', 'MFCDCA901.N08');
INSERT INTO `subimages` VALUES (477, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_giay_vline_601_5_07f888ce954a4ed1b06ca1afdc1b6ec8_master.jpg', '2024-11-16', 'MFCDCA901.N08');
INSERT INTO `subimages` VALUES (478, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_giay_vline_601_3_79a1ece664b94d008dda218619a4a62a_master.jpg', '2024-11-16', 'MFCDCA901.N08');
INSERT INTO `subimages` VALUES (479, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_giay_vline_601_4_ec665c4f4ceb4ec9a66d9696fe051b88_master.jpg', '2024-11-16', 'MFCDCA901.N08');
INSERT INTO `subimages` VALUES (480, 'https://file.hstatic.net/200000065946/file/noi-that-moho-icon-xem-video_fac41602910e4c228b9bb8974b9d1fc6.jpg', '2024-11-16', 'MFCDCA901.N08');
INSERT INTO `subimages` VALUES (481, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_sofa_go_vline_dem_be_2_8481c99127b74a319d33504cd3227b34_master.jpg', '2024-11-16', 'MFSNCC802.B18');
INSERT INTO `subimages` VALUES (482, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_sofa_go_vline_dem_be_hfbfbd_e3ba9cdd45664c79aaf1d2d9cf5e4758_master.jpg', '2024-11-16', 'MFSNCC802.B18');
INSERT INTO `subimages` VALUES (483, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_sofa_go_vline_dem_be_3_099c4d66140c4a13bf7f6c5871594033_master.jpg', '2024-11-16', 'MFSNCC802.B18');
INSERT INTO `subimages` VALUES (484, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_sofa_go_vline_dem_be_4_d16438d5d3d041f3b161766a5d641987_master.jpg', '2024-11-16', 'MFSNCC802.B18');
INSERT INTO `subimages` VALUES (485, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_sofa_go_vline_dem_be_5_64539e86ca6e45a1bbb6b3e37440c118_master.jpg', '2024-11-16', 'MFSNCC802.B18');
INSERT INTO `subimages` VALUES (486, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_sofa_go_vline_dem_be_2_f7e008dfa06847f99a80e695cf81259c_master.jpg', '2024-11-16', 'MFSNCC802.B18');
INSERT INTO `subimages` VALUES (487, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_sofa_go_vline_1_19dcd6f51c9a452cb3647ae432b20e0f_master.jpg', '2024-11-16', 'MFSNCC802.N18');
INSERT INTO `subimages` VALUES (488, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_sofa_go_vline_1_19dcd6f51c9a452cb3647ae432b20e0f.jpg', '2024-11-16', 'MFSNCC802.N18');
INSERT INTO `subimages` VALUES (489, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_sofa_go_vline_2_a490ad1dcd0345ca866313b1475e34ca_master.jpg', '2024-11-16', 'MFSNCC802.N18');
INSERT INTO `subimages` VALUES (490, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_sofa_go_vline_3_2bdce9553aa54ef9b5d63952e4715995_master.jpg', '2024-11-16', 'MFSNCC802.N18');
INSERT INTO `subimages` VALUES (491, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_sofa_go_vline_4_d631836a1e1c46998d2f29fcbad96f8b_master.jpg', '2024-11-16', 'MFSNCC802.N18');
INSERT INTO `subimages` VALUES (492, 'https://file.hstatic.net/200000065946/file/noi-that-moho-icon-xem-video_fac41602910e4c228b9bb8974b9d1fc6.jpg', '2024-11-16', 'MFSNCC802.N18');
INSERT INTO `subimages` VALUES (493, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_bang_dai_dem_be_1_9cf95d7cf236470ab808b5ce10265bd7_master.jpg', '2024-11-16', 'MFDBCCN02.B12');
INSERT INTO `subimages` VALUES (494, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_bang_dai_dem_be_2_7c5c242d258d4b07b54ff19351754409.jpg', '2024-11-16', 'MFDBCCN02.B12');
INSERT INTO `subimages` VALUES (495, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_bang_dai_dem_be_3_b81c9739abf44aa29cfeae6714d5d751.jpg', '2024-11-16', 'MFDBCCN02.B12');
INSERT INTO `subimages` VALUES (496, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_bang_dai_dem_be_4_c544074ed64646d4bb6a029214edd9c0.jpg', '2024-11-16', 'MFDBCCN02.B12');
INSERT INTO `subimages` VALUES (497, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_bang_vline_2_d9c257fc897d4369bc77f6500be54b36.jpg', '2024-11-16', 'MFDBCCN02.B12');
INSERT INTO `subimages` VALUES (498, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_bang_vline_3_7ea9d434d7df4bbcaf339e6cbc0d7fdc.jpg', '2024-11-16', 'MFDBCCN02.B12');
INSERT INTO `subimages` VALUES (499, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_bang_dai_vline_1_ae30cf99b089494bac2d06196c4ff2bb_master.jpg', '2024-11-16', 'MFDBCC801.B11');
INSERT INTO `subimages` VALUES (500, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_bang_dai_vline_2_bd8099e461294adebbcf91402aacd118.jpg', '2024-11-16', 'MFDBCC801.B11');
INSERT INTO `subimages` VALUES (501, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_bang_dai_vline_3_a032464f259041529dbc3ece47f2a39d.jpg', '2024-11-16', 'MFDBCC801.B11');
INSERT INTO `subimages` VALUES (502, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_bang_tua_vline_dem_kem_3_5356f086eaef4a039de3e85f24152559.jpg', '2024-11-16', 'MFDBCC801.B11');
INSERT INTO `subimages` VALUES (503, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_bang_tua_vline_dem_kem_4_acf200d4770a45bcaae3b25a3b22d699.jpg', '2024-11-16', 'MFDBCC801.B11');
INSERT INTO `subimages` VALUES (504, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_bang_tua_vline_dem_kem_5_7f0bb40f04a04488ba5411c5c5359546.jpg', '2024-11-16', 'MFDBCC801.B11');
INSERT INTO `subimages` VALUES (505, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_an_go_vlne_1_02c484a7c1914fd18e85938012442389_master.jpg', '2024-11-16', 'MFDTCA701.B16');
INSERT INTO `subimages` VALUES (506, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_an_go_vlne_2_0b82287fc97649369ab832c025402c35.jpg', '2024-11-16', 'MFDTCA701.B16');
INSERT INTO `subimages` VALUES (507, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_an_go_vlne_3_30e8339ae5484bc080f98197a7bb3bc8.jpg', '2024-11-16', 'MFDTCA701.B16');
INSERT INTO `subimages` VALUES (508, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an_vline_1_e4a9936f38fe4b67aebf70c35f804e25_master.jpg', '2024-11-16', 'MFDCCCN01.N08');
INSERT INTO `subimages` VALUES (509, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an_vline_1_e4a9936f38fe4b67aebf70c35f804e25.jpg', '2024-11-16', 'MFDCCCN01.N08');
INSERT INTO `subimages` VALUES (510, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an___1__dd86b873c73d4fd08f3820d0bece6951.png', '2024-11-16', 'MFDCCCN01.N08');
INSERT INTO `subimages` VALUES (511, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an___4__ab739e1a13434f46bf3c93454f84336f.png', '2024-11-16', 'MFDCCCN01.N08');
INSERT INTO `subimages` VALUES (512, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an___5__2de4a9714dcb43578e40881eb1de9bc9.png', '2024-11-16', 'MFDCCCN01.N08');
INSERT INTO `subimages` VALUES (513, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an___7__47e13f44f0ba414a8d449125a5192b5b.png', '2024-11-16', 'MFDCCCN01.N08');
INSERT INTO `subimages` VALUES (514, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_ke_tivi_vline_2b_d168fb57701b4610a26aa5e2cb53e559_master.jpg', '2024-11-16', 'MFTCCA901.B16');
INSERT INTO `subimages` VALUES (515, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_ke_tivi_vline_1_6eda633268d940eeaf8d3b642f309a62_master.jpg', '2024-11-16', 'MFTCCA901.B16');
INSERT INTO `subimages` VALUES (516, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_ke_tivi_vline_2_eb95b38a1f6847ad81c83d93af99eb68_master.jpg', '2024-11-16', 'MFTCCA901.B16');
INSERT INTO `subimages` VALUES (517, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_ke_tivi_vline_3_21ecff8aa28846548cee2f56db3bff85_master.jpg', '2024-11-16', 'MFTCCA901.B16');
INSERT INTO `subimages` VALUES (518, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_ke_tivi_vline_4_78bf536ce84e4e5582a4cd1bc600112c_master.jpg', '2024-11-16', 'MFTCCA901.B16');
INSERT INTO `subimages` VALUES (519, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_ke_tivi_vline_6_f2964f78e14442bd8f77d687ef21f9ba_master.jpg', '2024-11-16', 'MFTCCA901.B16');
INSERT INTO `subimages` VALUES (520, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ke_tu_tivi_go_vline_301_1_71e3f02ab71746249ebf623b48f788ae_master.jpg', '2024-11-16', 'MFTCCA901.N16');
INSERT INTO `subimages` VALUES (521, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ke_tu_tivi_go_vline_301_1_71e3f02ab71746249ebf623b48f788ae.jpg', '2024-11-16', 'MFTCCA901.N16');
INSERT INTO `subimages` VALUES (522, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ke_tu_tivi_go_vline_301_2_9b52ced8634e42a69fc8358076c2a963_master.jpg', '2024-11-16', 'MFTCCA901.N16');
INSERT INTO `subimages` VALUES (523, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ke_tu_tivi_go_vline_301_3_c1c8934d338d48e482d304de7175f8cd_master.jpg', '2024-11-16', 'MFTCCA901.N16');
INSERT INTO `subimages` VALUES (524, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ke_tu_tivi_go_vline_301_4_32400ad12e254c23914a9bf2a1cc8c19_master.jpg', '2024-11-16', 'MFTCCA901.N16');
INSERT INTO `subimages` VALUES (525, 'https://file.hstatic.net/200000065946/file/noi-that-moho-icon-xem-video_fac41602910e4c228b9bb8974b9d1fc6.jpg', '2024-11-16', 'MFTCCA901.N16');
INSERT INTO `subimages` VALUES (526, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ban_sofa_vline_601_01_ef3e51bcd70b4879bcbbca2928a5a906_master.png', '2024-11-16', 'MFSTCA603.N10');
INSERT INTO `subimages` VALUES (527, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ban_sofa_vline_501_1_34b1b3e327314c898aec50d5c0001f85_master.jpg', '2024-11-16', 'MFSTCA603.N10');
INSERT INTO `subimages` VALUES (528, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ban_sofa_vline_501_2_72463f2def864dcdaa02cacb5fc1fcad_master.jpg', '2024-11-16', 'MFSTCA603.N10');
INSERT INTO `subimages` VALUES (529, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ban_sofa_vline_501_3_6d7bff2ab2e54ce48bcb3f2a9caa1945_master.jpg', '2024-11-16', 'MFSTCA603.N10');
INSERT INTO `subimages` VALUES (530, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ban_sofa_vline_501_4_bf2022c2fa1041719f231b245ad96b49_master.jpg', '2024-11-16', 'MFSTCA603.N10');
INSERT INTO `subimages` VALUES (531, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ban_sofa_vline_501_5_715508980b894e4b9ff713affa9229aa_master.jpg', '2024-11-16', 'MFSTCA603.N10');
INSERT INTO `subimages` VALUES (532, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_sofa_ban_tra_ban_cafe_go_vline_501_223bf2f124a5446a9d60d48b379be0ad_master.jpg', '2024-11-16', 'MFSTCA603.B10');
INSERT INTO `subimages` VALUES (533, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_tra_sofa_vline_2_7d1edde654ba43f081021e08e8556ee0_master.jpg', '2024-11-16', 'MFSTCA603.B10');
INSERT INTO `subimages` VALUES (534, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_tra_sofa_vline_3_e4ab6e4d6a9345b5841bc4caa50f440f_master.jpg', '2024-11-16', 'MFSTCA603.B10');
INSERT INTO `subimages` VALUES (535, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_tra_sofa_vline_4_3772ed6a219346d9bf690576eceacfb1_master.jpg', '2024-11-16', 'MFSTCA603.B10');
INSERT INTO `subimages` VALUES (536, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_tra_sofa_vline_5_d1580591e7a44295bf043d2a19c12608_master.jpg', '2024-11-16', 'MFSTCA603.B10');
INSERT INTO `subimages` VALUES (537, 'https://file.hstatic.net/200000065946/file/noi-that-moho-icon-xem-video_fac41602910e4c228b9bb8974b9d1fc6.jpg', '2024-11-16', 'MFSTCA603.B10');
INSERT INTO `subimages` VALUES (538, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_tu_quan_ao_vline_601_52cm_5_1__22e767c2f9c542b397669c65390afa27_master.png', '2024-11-16', 'MFWRCD802.N05');
INSERT INTO `subimages` VALUES (539, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_tu_quan_ao_vline_601_52cm_5_1__22e767c2f9c542b397669c65390afa27.png', '2024-11-16', 'MFWRCD802.N05');
INSERT INTO `subimages` VALUES (540, 'https://product.hstatic.net/200000065946/product/productpro_mau_tu_nhien_tu_quan_ao_vline_601_1m_3_1__8a458fef97714028b1f3278d7aa936b1.png', '2024-11-16', 'MFWRCD802.N05');
INSERT INTO `subimages` VALUES (541, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_tu_quan_ao_vline_601_52cm_5_1__22e767c2f9c542b397669c65390afa27.png', '2024-11-16', 'MFWRCD802.N05');
INSERT INTO `subimages` VALUES (542, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_tu_quan_ao_vline_601_52cm_6_1__2c1ef7ba5c994eceb6525706f44f7507.png', '2024-11-16', 'MFWRCD802.N05');
INSERT INTO `subimages` VALUES (543, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_tu_quan_ao_vline_601_52cm_8_6c39dc16730142289d1f4ae0cbdf2f48.png', '2024-11-16', 'MFWRCD802.N05');
INSERT INTO `subimages` VALUES (544, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_tu_quan_ao_vline_601_52cm_9_d463d64ea97f4ce68a8900b0a6045187.png', '2024-11-16', 'MFWRCD802.N05');
INSERT INTO `subimages` VALUES (545, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_vline_801_1_23cfecbb74a14c43918abdff9a03b485_master.jpg', '2024-11-16', 'MFBSCA802.B05');
INSERT INTO `subimages` VALUES (546, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_vline_801_1_7651c9cb14ec4423adfc22514cad8908_master.jpg', '2024-11-16', 'MFBSCA802.B05');
INSERT INTO `subimages` VALUES (547, 'https://product.hstatic.net/200000065946/product/pro_nau_tu_dau_giuong_noi_that_moho_vline_05_2780287b68c848919955972e93defc82_master.jpg', '2024-11-16', 'MFBSCA802.B05');
INSERT INTO `subimages` VALUES (548, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_vline_801_1_23cfecbb74a14c43918abdff9a03b485_master.jpg', '2024-11-16', 'MFBSCA802.B05');
INSERT INTO `subimages` VALUES (549, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_vline_801_2_c445487d86524603a86f3704e4794fcc_master.jpg', '2024-11-16', 'MFBSCA802.B05');
INSERT INTO `subimages` VALUES (550, 'https://product.hstatic.net/200000065946/product/pro_nau_tu_dau_giuong_noi_that_moho_vline_01_dc7a45a8bbad4c4a8a5b5c0f127e23d2_master.jpg', '2024-11-16', 'MFBSCA802.B05');
INSERT INTO `subimages` VALUES (551, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_dau_giuong_vline_5_8789ba9c811d4c31a71b47d8eb17744b_master.jpg', '2024-11-16', 'MFBSCA802.N05');
INSERT INTO `subimages` VALUES (552, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_dau_giuong_vline_5_8789ba9c811d4c31a71b47d8eb17744b.jpg', '2024-11-16', 'MFBSCA802.N05');
INSERT INTO `subimages` VALUES (553, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_dau_giuong_vline_1_452f90565390482fb11724a7051262be_master.jpg', '2024-11-16', 'MFBSCA802.N05');
INSERT INTO `subimages` VALUES (554, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_dau_giuong_vline_2_3c33c3ccf57d43db8515c8478073b838_master.jpg', '2024-11-16', 'MFBSCA802.N05');
INSERT INTO `subimages` VALUES (555, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_dau_giuong_vline_3_01b0ff78cfca406d98a4531525541a79_master.jpg', '2024-11-16', 'MFBSCA802.N05');
INSERT INTO `subimages` VALUES (556, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_dau_giuong_vline_4_9386e203f6ed4df394eb2b3cd8a900c0_master.jpg', '2024-11-16', 'MFBSCA802.N05');
INSERT INTO `subimages` VALUES (557, 'https://file.hstatic.net/200000065946/file/noi-that-moho-icon-xem-video_fac41602910e4c228b9bb8974b9d1fc6.jpg', '2024-11-16', 'MFBSCA802.N05');
INSERT INTO `subimages` VALUES (558, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_go_tram_vline_1m8_a_6ba57dbc2c7943509208badc020decf8_master.jpg', '2024-11-16', 'MFBNCBD04.B12');
INSERT INTO `subimages` VALUES (559, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_go_tram_vline_1m8_4895664ad9d24c2fac54e2c501b4e7a4.jpg', '2024-11-16', 'MFBNCBD04.B12');
INSERT INTO `subimages` VALUES (560, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_go_tram_vline_1m8_2_09e6f0afa7684efcbb049ae74aa0c183.jpg', '2024-11-16', 'MFBNCBD04.B12');
INSERT INTO `subimages` VALUES (561, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_go_tram_vline_1m8_3_bcf9f9d31e2f4ed59119bc0a146c1702.jpg', '2024-11-16', 'MFBNCBD04.B12');
INSERT INTO `subimages` VALUES (562, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_giuong_ngu_go_soi_vline_601_a_567fd3232780488ea2339740d4807bb4_master.jpg', '2024-11-16', 'MFBNCBD04.N12');
INSERT INTO `subimages` VALUES (563, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_giuong_ngu_go_vline_1m4_tam_phan__d41e2d1c00d34a6e91da34fdde64dd69.jpg', '2024-11-16', 'MFBNCBD04.N12');
INSERT INTO `subimages` VALUES (564, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_giuong_ngu_go_soi_vline_601_8cdf668db13644e8985bc0873c64ddbc.jpg', '2024-11-16', 'MFBNCBD04.N12');
INSERT INTO `subimages` VALUES (565, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_giuong_ngu_go_soi_vline_601_1_a95eb9eb9e3f4426b16fa220146d66c9.jpg', '2024-11-16', 'MFBNCBD04.N12');
INSERT INTO `subimages` VALUES (566, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_giuong_ngu_go_soi_vline_601_2_33637b81716249c09233cdcd39abb6b9.jpg', '2024-11-16', 'MFBNCBD04.N12');
INSERT INTO `subimages` VALUES (567, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_giuong_ngu_go_soi_vline_601_4_b9aa87403dcd46259c3d98c492f3e731.jpg', '2024-11-16', 'MFBNCBD04.N12');
INSERT INTO `subimages` VALUES (568, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_giuong_ngu_go_soi_vline_601_5_27846995e09f478d8c9bfbb28bf7c8f7.jpg', '2024-11-16', 'MFBNCBD04.N12');
INSERT INTO `subimages` VALUES (569, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ban_sofa__ban_tra_go_cao_su_milan_601_cff8c5a279094d5a891809d9e8bf3221_master.jpg', '2024-11-16', 'MFSTCB502.N06');
INSERT INTO `subimages` VALUES (570, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ban_sofa__ban_tra_go_cao_su_milan_601_2_d47c00a19ef14f58a35e5d47d9c36f24_master.jpg', '2024-11-16', 'MFSTCB502.N06');
INSERT INTO `subimages` VALUES (571, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ban_sofa__ban_tra_go_cao_su_milan_601_3_5cff377050cf46eeb3a205007e597aef_master.jpg', '2024-11-16', 'MFSTCB502.N06');
INSERT INTO `subimages` VALUES (572, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ban_sofa__ban_tra_go_cao_su_milan_601_4_95ea41af1e7e48079ca266947d686a93_master.jpg', '2024-11-16', 'MFSTCB502.N06');
INSERT INTO `subimages` VALUES (573, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ban_sofa_ban_tra_go_cao_su_milan_601_1_77585da92f0c4746897a38a2d6de9a6a_master.jpg', '2024-11-16', 'MFSTCB502.N06');
INSERT INTO `subimages` VALUES (574, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ban_sofa_ban_tra_go_cao_su_milan_601_2_3738ee6da07e40a3bdaa6d6eba070019_master.jpg', '2024-11-16', 'MFSTCB502.N06');
INSERT INTO `subimages` VALUES (575, 'https://product.hstatic.net/200000065946/product/pro_xam_noi_that_moho_ban_sofa_verona_07_b86fcc1afedf431187f5dac3e56fb449_master.jpg', '2024-11-16', 'MFSTCB501.N07');
INSERT INTO `subimages` VALUES (576, 'https://product.hstatic.net/200000065946/product/pro_xam_noi_that_moho_ban_sofa_verona_b75234d3d65b4cea988e64b695b8aae5_master.png', '2024-11-16', 'MFSTCB501.N07');
INSERT INTO `subimages` VALUES (577, 'https://product.hstatic.net/200000065946/product/pro_xam_noi_that_moho_ban_sofa_verona_01_d48b89b45aa14b2090fa50cf45e35385_master.png', '2024-11-16', 'MFSTCB501.N07');
INSERT INTO `subimages` VALUES (578, 'https://product.hstatic.net/200000065946/product/pro_xam_noi_that_moho_ban_sofa_verona_02_bbb346ed62c54522944ddd12c4f0ee07_master.png', '2024-11-16', 'MFSTCB501.N07');
INSERT INTO `subimages` VALUES (579, 'https://product.hstatic.net/200000065946/product/pro_xam_noi_that_moho_ban_sofa_verona_03_3776ca1078c24e219957f07c66b3f33f_master.png', '2024-11-16', 'MFSTCB501.N07');
INSERT INTO `subimages` VALUES (580, 'https://file.hstatic.net/200000065946/file/noi-that-moho-icon-xem-video_fac41602910e4c228b9bb8974b9d1fc6.jpg', '2024-11-16', 'MFSTCB501.N07');
INSERT INTO `subimages` VALUES (581, 'https://product.hstatic.net/200000065946/product/pro_trang_xam_noi_that_moho_ban_sofa_verona_06_0a991d27f8d24cbcbbf5876383a2e72f_master.jpg', '2024-11-16', 'MFSTCB501.N06');
INSERT INTO `subimages` VALUES (582, 'https://product.hstatic.net/200000065946/product/pro_trang_noi_that_moho_ban_sofa_verona_81dc353207eb461fa36988f8857e18c3_master.png', '2024-11-16', 'MFSTCB501.N06');
INSERT INTO `subimages` VALUES (583, 'https://product.hstatic.net/200000065946/product/pro_trang_noi_that_moho_ban_sofa_trang_801_01_2da7308967994c38a78a14cc41469b89_master.jpg', '2024-11-16', 'MFSTCB501.N06');
INSERT INTO `subimages` VALUES (584, 'https://product.hstatic.net/200000065946/product/pro_trang_noi_that_moho_ban_sofa_trang_801_02_5ebb756c0b4f421bb94f8b7826469c42_master.jpg', '2024-11-16', 'MFSTCB501.N06');
INSERT INTO `subimages` VALUES (585, 'https://product.hstatic.net/200000065946/product/pro_trang_noi_that_moho_ban_sofa_verona_801_02_4ca5e083de814f15811d858bcb2a21ef_master.png', '2024-11-16', 'MFSTCB501.N06');
INSERT INTO `subimages` VALUES (586, 'https://product.hstatic.net/200000065946/product/pro_trang_noi_that_moho_ban_sofa_trang_801_03_7dd09ec23e444b02832baa7f39ba9bf8_master.jpg', '2024-11-16', 'MFSTCB501.N06');
INSERT INTO `subimages` VALUES (587, 'https://product.hstatic.net/200000065946/product/pro_be_noi_that_moho___1__2a8d850c5cba4d0c87f1b4803eace91d_master.jpg', '2024-11-16', 'MFSNCE702.N19');
INSERT INTO `subimages` VALUES (588, 'https://product.hstatic.net/200000065946/product/pro_be_noi_that_moho___1__2a8d850c5cba4d0c87f1b4803eace91d.jpg', '2024-11-16', 'MFSNCE702.N19');
INSERT INTO `subimages` VALUES (589, 'https://product.hstatic.net/200000065946/product/pro_be_noi_that_moho_sofa_lyngby_shape_l_e9d9bbacbf8c4125ba2e68edba127d15_master.jpg', '2024-11-16', 'MFSNCE702.N19');
INSERT INTO `subimages` VALUES (590, 'https://product.hstatic.net/200000065946/product/pro_be_noi_that_moho___1__2a8d850c5cba4d0c87f1b4803eace91d_master.jpg', '2024-11-16', 'MFSNCE702.N19');
INSERT INTO `subimages` VALUES (591, 'https://product.hstatic.net/200000065946/product/pro_be_noi_that_moho___2__acd996ed82684c60b11f65cede53b78d_master.jpg', '2024-11-16', 'MFSNCE702.N19');
INSERT INTO `subimages` VALUES (592, 'https://product.hstatic.net/200000065946/product/pro_be_noi_that_moho___2__acd996ed82684c60b11f65cede53b78d_master.jpg', '2024-11-16', 'MFSNCE702.N19');
INSERT INTO `subimages` VALUES (593, 'https://product.hstatic.net/200000065946/product/pro_be_noi_that_moho___4__83211d0437a4433ea9793a20eaf2a5fc_master.jpg', '2024-11-16', 'MFSNCE702.N19');
INSERT INTO `subimages` VALUES (594, 'https://product.hstatic.net/200000065946/product/pro_be_noi_that_moho_sofa_lyngby__2__e2a03c4c157949509a00cec546e3ae6b_master.jpg', '2024-11-16', 'MFSNCE701.N16');
INSERT INTO `subimages` VALUES (595, 'https://product.hstatic.net/200000065946/product/pro_be_noi_that_moho_sofa_lyngby_3deebaf59e9b4cc48bb9d1ffdf841a79_master.jpg', '2024-11-16', 'MFSNCE701.N16');
INSERT INTO `subimages` VALUES (596, 'https://product.hstatic.net/200000065946/product/pro_be_noi_that_moho_ghe___2__fadd838300a541d5b21d9b6984300406_master.jpg', '2024-11-16', 'MFSNCE701.N16');
INSERT INTO `subimages` VALUES (597, 'https://product.hstatic.net/200000065946/product/pro_be_noi_that_moho_ghe___3__cefd2239228d451d96d59313d4fa4fcd_master.jpg', '2024-11-16', 'MFSNCE701.N16');
INSERT INTO `subimages` VALUES (598, 'https://product.hstatic.net/200000065946/product/pro_be_noi_that_moho_ghe___3__cefd2239228d451d96d59313d4fa4fcd_master.jpg', '2024-11-16', 'MFSNCE701.N16');
INSERT INTO `subimages` VALUES (599, 'https://product.hstatic.net/200000065946/product/pro_be_noi_that_moho_ghe___5__5658b1ab9ede4a4ea0e6c45efe59e08b_master.jpg', '2024-11-16', 'MFSNCE701.N16');
INSERT INTO `subimages` VALUES (600, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_xam_noi_that_moho_sofa_trai_2a_17e4134d6a3f4d6da67504ed41c424d6_master.jpg', '2024-11-16', 'MFSNCE302.B18');
INSERT INTO `subimages` VALUES (601, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_xam_noi_that_moho_sofa_trai_889686d78f114d599324d8829cc774a0_master.jpg', '2024-11-16', 'MFSNCE302.B18');
INSERT INTO `subimages` VALUES (602, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_xam_noi_that_moho_sofa_trai___5__4250b16f47544a0d9066ae4837f9e3fe_master.jpg', '2024-11-16', 'MFSNCE302.B18');
INSERT INTO `subimages` VALUES (603, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_xam_noi_that_moho_sofa_trai_1_5bcd6d7b2dec49ae87cff11d0acb8474_master.jpg', '2024-11-16', 'MFSNCE302.B18');
INSERT INTO `subimages` VALUES (604, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_xam_noi_that_moho_sofa_trai_1_5bcd6d7b2dec49ae87cff11d0acb8474_master.jpg', '2024-11-16', 'MFSNCE302.B18');
INSERT INTO `subimages` VALUES (605, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_xam_noi_that_moho_sofa_trai_7_7f872bfcf833439d81f181e39d362955_master.jpg', '2024-11-16', 'MFSNCE302.B18');
INSERT INTO `subimages` VALUES (606, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ke_tv_hobro_a_636d5c00e6a849b391264d64c121739f_master.jpg', '2024-11-16', 'MFTCCE301.B18');
INSERT INTO `subimages` VALUES (607, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ke_tv_hobro_bcecbb8af65d4aaab4afe1e344027943_master.jpg', '2024-11-16', 'MFTCCE301.B18');
INSERT INTO `subimages` VALUES (608, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ke_tv_hobro___2__c54a60684da343c3a92e97abd75c62e0_master.jpg', '2024-11-16', 'MFTCCE301.B18');
INSERT INTO `subimages` VALUES (609, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ke_tv_hobro___3__241d0f3d6fa14d788bdd392f2b7a8acd_master.jpg', '2024-11-16', 'MFTCCE301.B18');
INSERT INTO `subimages` VALUES (610, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ke_tv_hobro___3__241d0f3d6fa14d788bdd392f2b7a8acd_master.jpg', '2024-11-16', 'MFTCCE301.B18');
INSERT INTO `subimages` VALUES (611, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ke_tv_hobro___5__d8b35b1f1fe44395975a20700cd02fc3_master.jpg', '2024-11-16', 'MFTCCE301.B18');
INSERT INTO `subimages` VALUES (612, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_bo_ban_an___4__041c7036557546eb8466041bbca132ee_master.jpg', '2024-11-16', 'MFCBCE601.BH13');
INSERT INTO `subimages` VALUES (613, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_bo_ban_an___4__041c7036557546eb8466041bbca132ee.jpg', '2024-11-16', 'MFCBCE601.BH13');
INSERT INTO `subimages` VALUES (614, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_bo_ban_an___1__7deb21c33a9b4455b358228d3c088a79.jpg', '2024-11-16', 'MFCBCE601.BH13');
INSERT INTO `subimages` VALUES (615, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___1__3445468b49484455a4e5f983d4c81f28.jpg', '2024-11-16', 'MFCBCE601.BH13');
INSERT INTO `subimages` VALUES (616, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___4__b88a3cee732f447e964f03b4271d9d35.jpg', '2024-11-16', 'MFCBCE601.BH13');
INSERT INTO `subimages` VALUES (617, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___4__b88a3cee732f447e964f03b4271d9d35.jpg', '2024-11-16', 'MFCBCE601.BH13');
INSERT INTO `subimages` VALUES (618, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_bo_ban_an___1__02ef3823698e4bfc801807f7bc263e9b.jpg', '2024-11-16', 'MFCBCE601.BH13');
INSERT INTO `subimages` VALUES (619, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___4__a89a2dd63d764f6287d3f50530f70041_master.jpg', '2024-11-16', 'MFCBCE601.BH12');
INSERT INTO `subimages` VALUES (620, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___4__a89a2dd63d764f6287d3f50530f70041.jpg', '2024-11-16', 'MFCBCE601.BH12');
INSERT INTO `subimages` VALUES (621, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___2__db33815aa67a4b3ca5ea6858e34d6611.jpg', '2024-11-16', 'MFCBCE601.BH12');
INSERT INTO `subimages` VALUES (622, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___3__3c06c85a51d94264849fef687773940f.jpg', '2024-11-16', 'MFCBCE601.BH12');
INSERT INTO `subimages` VALUES (623, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___4__6836ec671cb345fe990b681e9b4d4159.jpg', '2024-11-16', 'MFCBCE601.BH12');
INSERT INTO `subimages` VALUES (624, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___4__6836ec671cb345fe990b681e9b4d4159.jpg', '2024-11-16', 'MFCBCE601.BH12');
INSERT INTO `subimages` VALUES (625, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___6__99222e9ce9d94756b08f96039e6d7aed.jpg', '2024-11-16', 'MFCBCE601.BH12');
INSERT INTO `subimages` VALUES (626, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___1__ad53e790da554627893cd8d8bda366f3_master.jpg', '2024-11-16', 'MFCBCE601.BH7');
INSERT INTO `subimages` VALUES (627, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___1__ad53e790da554627893cd8d8bda366f3.jpg', '2024-11-16', 'MFCBCE601.BH7');
INSERT INTO `subimages` VALUES (628, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___2__0ac8246713f546779929912e126dc066.jpg', '2024-11-16', 'MFCBCE601.BH7');
INSERT INTO `subimages` VALUES (629, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___3__96a3cc97fd4a49ca9b4cbedc4c8eb25f.jpg', '2024-11-16', 'MFCBCE601.BH7');
INSERT INTO `subimages` VALUES (630, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___4__f625a2e67ca4488ea639a876a4dd5002.jpg', '2024-11-16', 'MFCBCE601.BH7');
INSERT INTO `subimages` VALUES (631, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___4__f625a2e67ca4488ea639a876a4dd5002.jpg', '2024-11-16', 'MFCBCE601.BH7');
INSERT INTO `subimages` VALUES (632, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___6__8b21eb50e3c74f978e276a27ec8aff0f.jpg', '2024-11-16', 'MFCBCE601.BH7');
INSERT INTO `subimages` VALUES (633, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nem_xam_noi_that_moho_ghe_an_hobro___1__3379dc3ce30c44938c562a89b8dad919_master.jpg', '2024-11-16', 'MFDCCE301.B05');
INSERT INTO `subimages` VALUES (634, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nem_xam_noi_that_moho_ghe_an_hobro___1__3379dc3ce30c44938c562a89b8dad919.jpg', '2024-11-16', 'MFDCCE301.B05');
INSERT INTO `subimages` VALUES (635, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nem_xam_noi_that_moho_ghe_an_hobro___2__d75c2272dc214ec9aedb296b4afe91bb_master.jpg', '2024-11-16', 'MFDCCE301.B05');
INSERT INTO `subimages` VALUES (636, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nem_xam_noi_that_moho_ghe_an_hobro___3__ad4f31a57e7447959df8fb12e1919c97_master.jpg', '2024-11-16', 'MFDCCE301.B05');
INSERT INTO `subimages` VALUES (637, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nem_xam_noi_that_moho_ghe_an_hobro___4__4645b98e59614719b7d8c6ad07900112_master.jpg', '2024-11-16', 'MFDCCE301.B05');
INSERT INTO `subimages` VALUES (638, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nem_xam_noi_that_moho_ghe_an_hobro___4__4645b98e59614719b7d8c6ad07900112_master.jpg', '2024-11-16', 'MFDCCE301.B05');
INSERT INTO `subimages` VALUES (639, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nem_xam_noi_that_moho_ghe_an_hobro___6__c0a39a6a4c1d4a1cb491380375d58ed0_master.jpg', '2024-11-16', 'MFDCCE301.B05');
INSERT INTO `subimages` VALUES (640, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___1__53efae5f678c4308ae2d621cab3515c3_master.jpg', '2024-11-16', 'MFCBCE601.BH3');
INSERT INTO `subimages` VALUES (641, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___1__53efae5f678c4308ae2d621cab3515c3.jpg', '2024-11-16', 'MFCBCE601.BH3');
INSERT INTO `subimages` VALUES (642, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo_4_66f6ce37d5cb420abd5944701fecdf65.jpg', '2024-11-16', 'MFCBCE601.BH3');
INSERT INTO `subimages` VALUES (643, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___1__8c741f6fb0e0440da84548a9dfb5da10.png', '2024-11-16', 'MFCBCE601.BH3');
INSERT INTO `subimages` VALUES (644, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___2__9c8d58fbf7734c368c3fc04fb5a88843.jpg', '2024-11-16', 'MFCBCE601.BH3');
INSERT INTO `subimages` VALUES (645, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___2__9c8d58fbf7734c368c3fc04fb5a88843.jpg', '2024-11-16', 'MFCBCE601.BH3');
INSERT INTO `subimages` VALUES (646, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___3__4c986ee178b34d32aa72916e1057c674.jpg', '2024-11-16', 'MFCBCE601.BH3');
INSERT INTO `subimages` VALUES (647, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___4__9006c9e805ed4342854cdf54d203ef86_master.jpg', '2024-11-16', 'MFCBCE601.BH5');
INSERT INTO `subimages` VALUES (648, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___4__9006c9e805ed4342854cdf54d203ef86.jpg', '2024-11-16', 'MFCBCE601.BH5');
INSERT INTO `subimages` VALUES (649, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___3__60d7c857f9134bcbaeb90efda9911961.jpg', '2024-11-16', 'MFCBCE601.BH5');
INSERT INTO `subimages` VALUES (650, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___4__9006c9e805ed4342854cdf54d203ef86.jpg', '2024-11-16', 'MFCBCE601.BH5');
INSERT INTO `subimages` VALUES (651, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___5__f2f6a97759c04153bdf906d3953fd0b8.jpg', '2024-11-16', 'MFCBCE601.BH5');
INSERT INTO `subimages` VALUES (652, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___5__f2f6a97759c04153bdf906d3953fd0b8.jpg', '2024-11-16', 'MFCBCE601.BH5');
INSERT INTO `subimages` VALUES (653, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo___7__8fde941e2bed4768bd6f7cae3e2fcdbf.jpg', '2024-11-16', 'MFCBCE601.BH5');
INSERT INTO `subimages` VALUES (654, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_xam_noi_that_moho_sofa_goc_phai___2__af8b7439219448088a86001e3612fa7b_master.jpg', '2024-11-16', 'MFSCCE302.B16');
INSERT INTO `subimages` VALUES (655, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_xam_noi_that_moho_sofa_goc_phai___2__af8b7439219448088a86001e3612fa7b.jpg', '2024-11-16', 'MFSCCE302.B16');
INSERT INTO `subimages` VALUES (656, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_xam_noi_that_moho_sofa_goc_phai___2__af8b7439219448088a86001e3612fa7b_master.jpg', '2024-11-16', 'MFSCCE302.B16');
INSERT INTO `subimages` VALUES (657, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_xam_noi_that_moho_sofa_goc_phai___3__f54bc175ab754f899aa1ec04b3573589_master.jpg', '2024-11-16', 'MFSCCE302.B16');
INSERT INTO `subimages` VALUES (658, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_xam_noi_that_moho_sofa_goc_phai___4__78a4a47d9b204462b369bec337b12ff4_master.jpg', '2024-11-16', 'MFSCCE302.B16');
INSERT INTO `subimages` VALUES (659, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_xam_noi_that_moho_sofa_goc_phai___4__78a4a47d9b204462b369bec337b12ff4_master.jpg', '2024-11-16', 'MFSCCE302.B16');
INSERT INTO `subimages` VALUES (660, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ban_sofa_hobro___1__b8b2225e1732409086e953121185762d_master.jpg', '2024-11-16', 'MFSTCE301.B09');
INSERT INTO `subimages` VALUES (661, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ban_sofa_hobro___1__b8b2225e1732409086e953121185762d.jpg', '2024-11-16', 'MFSTCE301.B09');
INSERT INTO `subimages` VALUES (662, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ban_sofa_hobro___2__eca0f716a389412991d0de9fe840ec58_master.jpg', '2024-11-16', 'MFSTCE301.B09');
INSERT INTO `subimages` VALUES (663, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ban_sofa_hobro___3__cbdb5ef1b3114e6d9a6be79f6b5ca813_master.jpg', '2024-11-16', 'MFSTCE301.B09');
INSERT INTO `subimages` VALUES (664, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ban_sofa_hobro___4__544af17b8afe4168b1a3fb10cc9d9c5c_master.jpg', '2024-11-16', 'MFSTCE301.B09');
INSERT INTO `subimages` VALUES (665, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ban_sofa_hobro___4__544af17b8afe4168b1a3fb10cc9d9c5c_master.jpg', '2024-11-16', 'MFSTCE301.B09');
INSERT INTO `subimages` VALUES (666, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ban_sofa_hobro___6__dedecf9fee0041a9934fecd90d778506_master.jpg', '2024-11-16', 'MFSTCE301.B09');
INSERT INTO `subimages` VALUES (667, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ghe_don_sofa___3__4fe4852690674f24989926064034243e_master.jpg', '2024-11-16', 'MFSSCE301.B07');
INSERT INTO `subimages` VALUES (668, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ghe_don_sofa___3__4fe4852690674f24989926064034243e.jpg', '2024-11-16', 'MFSSCE301.B07');
INSERT INTO `subimages` VALUES (669, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ghe_don_sofa___2__2cee46d7e5e24ba9bff87b3110f8c1cc_master.jpg', '2024-11-16', 'MFSSCE301.B07');
INSERT INTO `subimages` VALUES (670, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ghe_don_sofa___3__4fe4852690674f24989926064034243e_master.jpg', '2024-11-16', 'MFSSCE301.B07');
INSERT INTO `subimages` VALUES (671, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ghe_don_sofa___4__e4c6dfc31e3c40e8b3338644ad26d5aa_master.jpg', '2024-11-16', 'MFSSCE301.B07');
INSERT INTO `subimages` VALUES (672, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ghe_don_sofa___4__e4c6dfc31e3c40e8b3338644ad26d5aa_master.jpg', '2024-11-16', 'MFSSCE301.B07');
INSERT INTO `subimages` VALUES (673, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_sofa_goc_hobro___1__41f009b1af1f41ddbe294b8eb3bd81ef_master.jpg', '2024-11-16', 'MFSCCE301.B16');
INSERT INTO `subimages` VALUES (674, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_sofa_goc_hobro___2__6588ca790ffe457a901cac81e9bce1e4_master.jpg', '2024-11-16', 'MFSCCE301.B16');
INSERT INTO `subimages` VALUES (675, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_sofa_goc_hobro___3__089951c7775042d4b861d3d895fb554d_master.jpg', '2024-11-16', 'MFSCCE301.B16');
INSERT INTO `subimages` VALUES (676, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_sofa_goc_hobro___4__34a45dc38a844b60bf6fb747cc4df00f_master.jpg', '2024-11-16', 'MFSCCE301.B16');
INSERT INTO `subimages` VALUES (677, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_sofa_goc_hobro___4__34a45dc38a844b60bf6fb747cc4df00f_master.jpg', '2024-11-16', 'MFSCCE301.B16');
INSERT INTO `subimages` VALUES (678, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_xam_noi_that_moho_ghe_sofa_goc___1__4e6f53e943b74496b52e469bc0ec1b42_master.jpg', '2024-11-16', 'MFSNCE301.B18');
INSERT INTO `subimages` VALUES (679, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_xam_noi_that_moho_ghe_sofa_goc___1__4e6f53e943b74496b52e469bc0ec1b42.jpg', '2024-11-16', 'MFSNCE301.B18');
INSERT INTO `subimages` VALUES (680, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_xam_noi_that_moho_sofa_trai___3__a3193606cfa6482bb08f79a8861b60ab_master.jpg', '2024-11-16', 'MFSNCE301.B18');
INSERT INTO `subimages` VALUES (681, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_xam_noi_that_moho_ghe_sofa_goc___4__383a8b664ec947999bccd8d08bf3cbbb_master.jpg', '2024-11-16', 'MFSNCE301.B18');
INSERT INTO `subimages` VALUES (682, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_xam_noi_that_moho_ghe_sofa_goc___7__673b306cb0cd4b0c91197d3981900799_master.jpg', '2024-11-16', 'MFSNCE301.B18');
INSERT INTO `subimages` VALUES (683, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_xam_noi_that_moho_ghe_sofa_goc___7__673b306cb0cd4b0c91197d3981900799_master.jpg', '2024-11-16', 'MFSNCE301.B18');
INSERT INTO `subimages` VALUES (684, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_xam_noi_that_moho_sofa_trai__tay_a2e0ef85589749c186e54f56fd76c28a_master.jpg', '2024-11-16', 'MFSNCE301.B18');
INSERT INTO `subimages` VALUES (685, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban___1__0f1907c986394fc781fec6bfbfa12861_master.jpg', '2024-11-16', 'MFDTCE301.B16');
INSERT INTO `subimages` VALUES (686, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban___1__0f1907c986394fc781fec6bfbfa12861.jpg', '2024-11-16', 'MFDTCE301.B16');
INSERT INTO `subimages` VALUES (687, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban___2__1a705857e2df4b209fb483aa661c1b57_master.jpg', '2024-11-16', 'MFDTCE301.B16');
INSERT INTO `subimages` VALUES (688, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban___3__a89a27d2a52b4afda85aa5cf300fb05d_master.jpg', '2024-11-16', 'MFDTCE301.B16');
INSERT INTO `subimages` VALUES (689, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban___4__fe79ed0923234c45ba7ea5637ca8ff55_master.jpg', '2024-11-16', 'MFDTCE301.B16');
INSERT INTO `subimages` VALUES (690, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban___4__fe79ed0923234c45ba7ea5637ca8ff55_master.jpg', '2024-11-16', 'MFDTCE301.B16');
INSERT INTO `subimages` VALUES (691, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban___6__e3e5344f2b654d4ebf78b433348d5d6c_master.jpg', '2024-11-16', 'MFDTCE301.B16');
INSERT INTO `subimages` VALUES (692, 'https://product.hstatic.net/200000065946/product/pro_combo_full_house_1_noi_that_moho_koster_e720c470be4a456da8be33fb6717e06b_master.jpg', '2024-11-16', 'MHCBCDD02.BK10');
INSERT INTO `subimages` VALUES (693, 'https://product.hstatic.net/200000065946/product/pro_combo_full_house_1_noi_that_moho_koster_e720c470be4a456da8be33fb6717e06b.jpg', '2024-11-16', 'MHCBCDD02.BK10');
INSERT INTO `subimages` VALUES (694, 'https://product.hstatic.net/200000065946/product/pro_combo_full_house_1_noi_that_moho_koster__4__873dc22e98f04693880ba5a9cc6a4f53.jpg', '2024-11-16', 'MHCBCDD02.BK10');
INSERT INTO `subimages` VALUES (695, 'https://product.hstatic.net/200000065946/product/pro_combo_full_house_1_noi_that_moho_koster__5__db4cc313430c4209aecea5f8b0883ec0.jpg', '2024-11-16', 'MHCBCDD02.BK10');
INSERT INTO `subimages` VALUES (696, 'https://product.hstatic.net/200000065946/product/pro_combo_full_house_1_noi_that_moho_koster__33__0d16877a574e44c4a421501c66a9ff1f.jpg', '2024-11-16', 'MHCBCDD02.BK10');
INSERT INTO `subimages` VALUES (697, 'https://product.hstatic.net/200000065946/product/pro_combo_full_house_1_noi_that_moho_koster__33__0d16877a574e44c4a421501c66a9ff1f.jpg', '2024-11-16', 'MHCBCDD02.BK10');
INSERT INTO `subimages` VALUES (698, 'https://product.hstatic.net/200000065946/product/pro_combo_full_house_1_noi_that_moho_koster__17__a8c628932c7949b58315b19f67277714.jpg', '2024-11-16', 'MHCBCDD02.BK10');
INSERT INTO `subimages` VALUES (699, 'https://product.hstatic.net/200000065946/product/pro_khong_tay_nam_noi_that_moho_tu_quan_ao___2__9032f41e77c64fe2aec22ded8aa7b8fe_master.jpg', '2024-11-16', 'MFWRBJN02.1205');
INSERT INTO `subimages` VALUES (700, 'https://product.hstatic.net/200000065946/product/pro_khong_tay_nam_noi_that_moho_tu_quan_ao___2__9032f41e77c64fe2aec22ded8aa7b8fe.jpg', '2024-11-16', 'MFWRBJN02.1205');
INSERT INTO `subimages` VALUES (701, 'https://product.hstatic.net/200000065946/product/pro_khong_tay_nam_noi_that_moho_tu_quan_ao___2__9032f41e77c64fe2aec22ded8aa7b8fe.jpg', '2024-11-16', 'MFWRBJN02.1205');
INSERT INTO `subimages` VALUES (702, 'https://product.hstatic.net/200000065946/product/pro_khong_tay_nam_noi_that_moho_tu_quan_ao___3__63239198691e494d81e384df8114228f.jpg', '2024-11-16', 'MFWRBJN02.1205');
INSERT INTO `subimages` VALUES (703, 'https://product.hstatic.net/200000065946/product/pro_khong_tay_nam_noi_that_moho_tu_quan_ao___4__e61183330fa745f8831794f8f9791fbc.jpg', '2024-11-16', 'MFWRBJN02.1205');
INSERT INTO `subimages` VALUES (704, 'https://product.hstatic.net/200000065946/product/pro_khong_tay_nam_noi_that_moho_tu_quan_ao___4__e61183330fa745f8831794f8f9791fbc.jpg', '2024-11-16', 'MFWRBJN02.1205');
INSERT INTO `subimages` VALUES (705, 'https://product.hstatic.net/200000065946/product/pro_khong_tay_nam_noi_that_moho_tu_quan_ao___6__ade6bfed142a462bac35a9f9f0327aa1.jpg', '2024-11-16', 'MFWRBJN02.1205');
INSERT INTO `subimages` VALUES (706, 'https://product.hstatic.net/200000065946/product/dsc03920_c130055209914c52b37fac712e9a4cc6_master.jpg', '2024-11-16', 'MFWRCA505.B05');
INSERT INTO `subimages` VALUES (707, 'https://product.hstatic.net/200000065946/product/pro_co_tay_nam_noi_that_moho___3__1170c021070b409b923b0621e41a48ee_master.jpg', '2024-11-16', 'MFWRCBD01.B05');
INSERT INTO `subimages` VALUES (708, 'https://product.hstatic.net/200000065946/product/pro_co_tay_nam_noi_that_moho___3__1170c021070b409b923b0621e41a48ee.jpg', '2024-11-16', 'MFWRCBD01.B05');
INSERT INTO `subimages` VALUES (709, 'https://product.hstatic.net/200000065946/product/pro_co_tay_nam_noi_that_moho___2__6caf5f53117743d989958c68d2e15712.jpg', '2024-11-16', 'MFWRCBD01.B05');
INSERT INTO `subimages` VALUES (710, 'https://product.hstatic.net/200000065946/product/pro_co_tay_nam_noi_that_moho___3__1170c021070b409b923b0621e41a48ee.jpg', '2024-11-16', 'MFWRCBD01.B05');
INSERT INTO `subimages` VALUES (711, 'https://product.hstatic.net/200000065946/product/pro_co_tay_nam_noi_that_moho___4__7542e9d66b7549c4a102b1bd9fe7b4ae.jpg', '2024-11-16', 'MFWRCBD01.B05');
INSERT INTO `subimages` VALUES (712, 'https://product.hstatic.net/200000065946/product/pro_co_tay_nam_noi_that_moho___4__7542e9d66b7549c4a102b1bd9fe7b4ae.jpg', '2024-11-16', 'MFWRCBD01.B05');
INSERT INTO `subimages` VALUES (713, 'https://product.hstatic.net/200000065946/product/pro_co_tay_nam_noi_that_moho_tu_quan_ao___1__9f31d69e6ca74e109e7c209dc1406ee2_master.jpg', '2024-11-16', 'MFWRCBD03.M05');
INSERT INTO `subimages` VALUES (714, 'https://product.hstatic.net/200000065946/product/pro_co_tay_nam_noi_that_moho_tu_quan_ao___1__9f31d69e6ca74e109e7c209dc1406ee2.jpg', '2024-11-16', 'MFWRCBD03.M05');
INSERT INTO `subimages` VALUES (715, 'https://product.hstatic.net/200000065946/product/pro_co_tay_nam_noi_that_moho_tu_quan_ao___2__ecfe27312d784eef9c891a1977c18591.jpg', '2024-11-16', 'MFWRCBD03.M05');
INSERT INTO `subimages` VALUES (716, 'https://product.hstatic.net/200000065946/product/pro_co_tay_nam_noi_that_moho_tu_quan_ao___3__34fa55b3425c49a79daccbfc179f464b.jpg', '2024-11-16', 'MFWRCBD03.M05');
INSERT INTO `subimages` VALUES (717, 'https://product.hstatic.net/200000065946/product/pro_co_tay_nam_noi_that_moho_tu_quan_ao___4__97d0deda888e4cea820792050272b6c8.jpg', '2024-11-16', 'MFWRCBD03.M05');
INSERT INTO `subimages` VALUES (718, 'https://product.hstatic.net/200000065946/product/pro_co_tay_nam_noi_that_moho_tu_quan_ao___4__97d0deda888e4cea820792050272b6c8.jpg', '2024-11-16', 'MFWRCBD03.M05');
INSERT INTO `subimages` VALUES (719, 'https://product.hstatic.net/200000065946/product/pro_combo_full_house_2_noi_that_moho_koster__2__9d837792507d4a1082160ce4c6c8d49b_master.jpg', '2024-11-16', 'MHCBCDD02.BK12');
INSERT INTO `subimages` VALUES (720, 'https://product.hstatic.net/200000065946/product/pro_combo_full_house_2_noi_that_moho_koster__2__9d837792507d4a1082160ce4c6c8d49b.jpg', '2024-11-16', 'MHCBCDD02.BK12');
INSERT INTO `subimages` VALUES (721, 'https://product.hstatic.net/200000065946/product/pro_combo_full_house_2_noi_that_moho_koster__9__c08da8bb6c6a4092bde7a94b08314820.jpg', '2024-11-16', 'MHCBCDD02.BK12');
INSERT INTO `subimages` VALUES (722, 'https://product.hstatic.net/200000065946/product/pro_combo_full_house_2_noi_that_moho_koster__2__9d837792507d4a1082160ce4c6c8d49b.jpg', '2024-11-16', 'MHCBCDD02.BK12');
INSERT INTO `subimages` VALUES (723, 'https://product.hstatic.net/200000065946/product/pro_combo_full_house_2_noi_that_moho_koster__7__01a9d9fbf36649a68f222cdfb740fd1d.jpg', '2024-11-16', 'MHCBCDD02.BK12');
INSERT INTO `subimages` VALUES (724, 'https://product.hstatic.net/200000065946/product/pro_combo_full_house_2_noi_that_moho_koster__7__01a9d9fbf36649a68f222cdfb740fd1d.jpg', '2024-11-16', 'MHCBCDD02.BK12');
INSERT INTO `subimages` VALUES (725, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo_phong_an_moho_koster_mau_nau_444_69fba7541b9d43ac9d6459bb7cb6f4eb_master.jpg', '2024-11-16', 'MHCBCDD02.BK7');
INSERT INTO `subimages` VALUES (726, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo_phong_an_moho_koster_mau_nau_444_69fba7541b9d43ac9d6459bb7cb6f4eb.jpg', '2024-11-16', 'MHCBCDD02.BK7');
INSERT INTO `subimages` VALUES (727, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo_phong_an_moho_koster_mau_nau_444_69fba7541b9d43ac9d6459bb7cb6f4eb_master.jpg', '2024-11-16', 'MHCBCDD02.BK7');
INSERT INTO `subimages` VALUES (728, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo_phong_an_moho_koster_mau_nau__4__753a0abf326f448b958c193c46d18780_master.jpg', '2024-11-16', 'MHCBCDD02.BK7');
INSERT INTO `subimages` VALUES (729, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo_phong_an_moho_koster_mau_nau__5__e7a0a95f3c1646b9b7a9109a0787de61_master.jpg', '2024-11-16', 'MHCBCDD02.BK7');
INSERT INTO `subimages` VALUES (730, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo_phong_an_moho_koster_mau_nau__5__e7a0a95f3c1646b9b7a9109a0787de61_master.jpg', '2024-11-16', 'MHCBCDD02.BK7');
INSERT INTO `subimages` VALUES (731, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo_phong_an_moho_koster_mau_nau_b251a48e314e4a83ac642a73ac1b02e7_master.jpg', '2024-11-16', 'MHCBCDD02.BK7');
INSERT INTO `subimages` VALUES (732, 'https://product.hstatic.net/200000065946/product/pro_combo_full_combo_1_noi_that_moho_koster__15__3a43a366836b49ee812111da0da9101e_master.jpg', '2024-11-16', 'MHCBCDD02.BK5');
INSERT INTO `subimages` VALUES (733, 'https://product.hstatic.net/200000065946/product/pro_combo_full_combo_1_noi_that_moho_koster__15__3a43a366836b49ee812111da0da9101e.jpg', '2024-11-16', 'MHCBCDD02.BK5');
INSERT INTO `subimages` VALUES (734, 'https://product.hstatic.net/200000065946/product/pro_combo_full_combo_1_noi_that_moho_koster__34__761c8b86dece46febab86958c41c02d1.jpg', '2024-11-16', 'MHCBCDD02.BK5');
INSERT INTO `subimages` VALUES (735, 'https://product.hstatic.net/200000065946/product/pro_combo_full_combo_1_noi_that_moho_koster__33__990044dda5674a60b179024fc5a064b1.jpg', '2024-11-16', 'MHCBCDD02.BK5');
INSERT INTO `subimages` VALUES (736, 'https://product.hstatic.net/200000065946/product/pro_combo_full_combo_1_noi_that_moho_koster__39__1e513545d5a746b6a4ce167ecd4baf82.jpg', '2024-11-16', 'MHCBCDD02.BK5');
INSERT INTO `subimages` VALUES (737, 'https://product.hstatic.net/200000065946/product/pro_combo_full_combo_1_noi_that_moho_koster__39__1e513545d5a746b6a4ce167ecd4baf82.jpg', '2024-11-16', 'MHCBCDD02.BK5');
INSERT INTO `subimages` VALUES (738, 'https://product.hstatic.net/200000065946/product/pro_combo_full_combo_1_noi_that_moho_koster__11__e4744f6e832e475dbf3ed3f779eef09f.jpg', '2024-11-16', 'MHCBCDD02.BK5');
INSERT INTO `subimages` VALUES (739, 'https://product.hstatic.net/200000065946/product/pro_combo_bs_1_noi_that_moho_koster_9017545cd40c40938f498a421ad6f8b4_master.jpg', '2024-11-16', 'MHCBCDD02.BK3');
INSERT INTO `subimages` VALUES (740, 'https://product.hstatic.net/200000065946/product/pro_combo_bs_1_noi_that_moho_koster_9017545cd40c40938f498a421ad6f8b4.jpg', '2024-11-16', 'MHCBCDD02.BK3');
INSERT INTO `subimages` VALUES (741, 'https://product.hstatic.net/200000065946/product/pro_combo_bs_1_noi_that_moho_koster__6__b43ea5f8a5634d1cbacd16ff11e1b7c0.jpg', '2024-11-16', 'MHCBCDD02.BK3');
INSERT INTO `subimages` VALUES (742, 'https://product.hstatic.net/200000065946/product/pro_combo_bs_1_noi_that_moho_koster__7__392639aaea5d44cc830726078b6cb8a1.jpg', '2024-11-16', 'MHCBCDD02.BK3');
INSERT INTO `subimages` VALUES (743, 'https://product.hstatic.net/200000065946/product/pro_combo_bs_1_noi_that_moho_koster__8__9b192d59c195434899b7fb8dbdfb43af.jpg', '2024-11-16', 'MHCBCDD02.BK3');
INSERT INTO `subimages` VALUES (744, 'https://product.hstatic.net/200000065946/product/pro_combo_bs_1_noi_that_moho_koster__8__9b192d59c195434899b7fb8dbdfb43af.jpg', '2024-11-16', 'MHCBCDD02.BK3');
INSERT INTO `subimages` VALUES (745, 'https://product.hstatic.net/200000065946/product/pro_combo_bs_1_noi_that_moho_koster__2__6c5709cf9501443f9bff49a50071142f.jpg', '2024-11-16', 'MHCBCDD02.BK3');
INSERT INTO `subimages` VALUES (746, 'https://product.hstatic.net/200000065946/product/o_nau_noi_that_moho_full_combo_phong_khach_moho_koster_mau_nau__23415__83c6ed699b72450ab7753785432d5c62_master.jpg', '2024-11-16', 'MHCBCDD02.BK2');
INSERT INTO `subimages` VALUES (747, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_full_combo_phong_khach_moho_koster_mau_nau__6__811088b5bc8a4560929dd9426535a483_master.jpg', '2024-11-16', 'MHCBCDD02.BK2');
INSERT INTO `subimages` VALUES (748, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_full_combo_phong_khach_moho_koster_mau_nau__9__1f1832f457a143bf885b03eec0df2b68_master.jpg', '2024-11-16', 'MHCBCDD02.BK2');
INSERT INTO `subimages` VALUES (749, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_full_combo_phong_khach_moho_koster_mau_nau__8__ad369ba415f5452780eeb1da60f0ff2b_master.jpg', '2024-11-16', 'MHCBCDD02.BK2');
INSERT INTO `subimages` VALUES (750, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_full_combo_phong_khach_moho_koster_mau_nau__8__ad369ba415f5452780eeb1da60f0ff2b_master.jpg', '2024-11-16', 'MHCBCDD02.BK2');
INSERT INTO `subimages` VALUES (751, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo_co_ban_phong_khach_moho_koster_mau_nau_dd4321b5d61d427f91fe649575a322ef_master.jpg', '2024-11-16', 'MHCBCDD02.BK2');
INSERT INTO `subimages` VALUES (752, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_full_combo_phong_khach_moho_koster_mau_nau__5__33889987df314f4084ca95d5c84e29f9_master.jpg', '2024-11-16', 'MHCBCDD02.BK1');
INSERT INTO `subimages` VALUES (753, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_full_combo_phong_khach_moho_koster_mau_nau__5__33889987df314f4084ca95d5c84e29f9.jpg', '2024-11-16', 'MHCBCDD02.BK1');
INSERT INTO `subimages` VALUES (754, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_full_combo_phong_khach_moho_koster_mau_nau__4__15a5da6d8699412b81faf99754aa36ec_master.jpg', '2024-11-16', 'MHCBCDD02.BK1');
INSERT INTO `subimages` VALUES (755, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_full_combo_phong_khach_moho_koster_mau_nau__3__bcd0d56791274ce1a41feaa8b3835951_master.jpg', '2024-11-16', 'MHCBCDD02.BK1');
INSERT INTO `subimages` VALUES (756, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_full_combo_phong_khach_moho_koster_mau_nau__4__e578abe06f0a4b1686c731475702f468_master.jpg', '2024-11-16', 'MHCBCDD02.BK1');
INSERT INTO `subimages` VALUES (757, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_full_combo_phong_khach_moho_koster_mau_nau__4__e578abe06f0a4b1686c731475702f468_master.jpg', '2024-11-16', 'MHCBCDD02.BK1');
INSERT INTO `subimages` VALUES (758, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_full_combo_phong_khach_moho_koster_mau_nau__8__9848b235e43145cd8eaf53357a241799_master.jpg', '2024-11-16', 'MHCBCDD02.BK1');
INSERT INTO `subimages` VALUES (759, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo_phong_khach_lango_mau_nau__22__d14f5fd0133d4ddf9f2984e2ca9db2f6_master.jpg', '2024-11-16', 'MHCBCDD01.BL4');
INSERT INTO `subimages` VALUES (760, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo_phong_khach_lango_mau_nau__22__d14f5fd0133d4ddf9f2984e2ca9db2f6.jpg', '2024-11-16', 'MHCBCDD01.BL4');
INSERT INTO `subimages` VALUES (761, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo_phong_khach_lango_mau_nau__21__3e6cd2fa3c3b4972b739f7498f4d75c6_master.jpg', '2024-11-16', 'MHCBCDD01.BL4');
INSERT INTO `subimages` VALUES (762, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo_phong_khach_lango_mau_nau__22__d14f5fd0133d4ddf9f2984e2ca9db2f6_master.jpg', '2024-11-16', 'MHCBCDD01.BL4');
INSERT INTO `subimages` VALUES (763, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo_phong_khach_lango_mau_nau__24__99e838ef1be246d1ab6271f54dd49afd_master.jpg', '2024-11-16', 'MHCBCDD01.BL4');
INSERT INTO `subimages` VALUES (764, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo_phong_khach_lango_mau_nau__24__99e838ef1be246d1ab6271f54dd49afd_master.jpg', '2024-11-16', 'MHCBCDD01.BL4');
INSERT INTO `subimages` VALUES (765, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo_phong_khach_lango_mau_nau__2__bd0a77adaa764503a1595ba9f0f944c2_master.jpg', '2024-11-16', 'MHCBCDD01.BL4');
INSERT INTO `subimages` VALUES (766, 'https://product.hstatic.net/200000065946/product/pro_noi_that_moho_combo_bs_1_lango_mau_nau__25__35770572d8d24fa79731fa12e4b148af_master.jpg', '2024-11-16', 'MHCBCDD01.BL1');
INSERT INTO `subimages` VALUES (767, 'https://product.hstatic.net/200000065946/product/pro_noi_that_moho_combo_bs_1_lango_mau_nau__25__35770572d8d24fa79731fa12e4b148af.jpg', '2024-11-16', 'MHCBCDD01.BL1');
INSERT INTO `subimages` VALUES (768, 'https://product.hstatic.net/200000065946/product/pro_noi_that_moho_combo_bs_1_lango_mau_nau__12__8e2c159b78104dab98b16860ccd07297.jpg', '2024-11-16', 'MHCBCDD01.BL1');
INSERT INTO `subimages` VALUES (769, 'https://product.hstatic.net/200000065946/product/pro_noi_that_moho_combo_bs_1_lango_mau_nau__9__233aa8469de944a0a3376d9672894b80.jpg', '2024-11-16', 'MHCBCDD01.BL1');
INSERT INTO `subimages` VALUES (770, 'https://product.hstatic.net/200000065946/product/pro_noi_that_moho_combo_bs_1_lango_mau_nau__7__760f5ffe6ac54ce7b743fa943448d76b.jpg', '2024-11-16', 'MHCBCDD01.BL1');
INSERT INTO `subimages` VALUES (771, 'https://product.hstatic.net/200000065946/product/pro_noi_that_moho_combo_bs_1_lango_mau_nau__7__760f5ffe6ac54ce7b743fa943448d76b.jpg', '2024-11-16', 'MHCBCDD01.BL1');
INSERT INTO `subimages` VALUES (772, 'https://product.hstatic.net/200000065946/product/pro_noi_that_moho_combo_bs_1_lango_mau_nau__5__d00c9eda4f39440baaf6bdb52eaffee7.jpg', '2024-11-16', 'MHCBCDD01.BL1');
INSERT INTO `subimages` VALUES (773, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_premium_chu_i_1m5_narvik_grenaa_a_2decbb02235f40cca1c786fe699969df_master.jpg', '2024-11-16', 'MKGPCCDD05.M15');
INSERT INTO `subimages` VALUES (774, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_premium_chu_i_1m5_narvik_grenaa_b_c1f1e7d6133340059d188a77211b982c.jpg', '2024-11-16', 'MKGPCCDD05.M15');
INSERT INTO `subimages` VALUES (775, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_premium_chu_i_1m5_narvik_grenaa_c_dcbb767028e54068af3fa6686fd86e2e.jpg', '2024-11-16', 'MKGPCCDD05.M15');
INSERT INTO `subimages` VALUES (776, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_premium_chu_i_1m5_narvik_c_8273740dc0ef4573906ba2ffed50ffdd_master.jpg', '2024-11-16', 'MKNPCCDD05.M15');
INSERT INTO `subimages` VALUES (777, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_premium_chu_i_1m5_narvik_c_8273740dc0ef4573906ba2ffed50ffdd.jpg', '2024-11-16', 'MKNPCCDD05.M15');
INSERT INTO `subimages` VALUES (778, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_premium_chu_i_1m5_narvik_b_804c3680a33649c097732eaf825f08a8.jpg', '2024-11-16', 'MKNPCCDD05.M15');
INSERT INTO `subimages` VALUES (779, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_premium_chu_i_1m5_narvik_c_8273740dc0ef4573906ba2ffed50ffdd.jpg', '2024-11-16', 'MKNPCCDD05.M15');
INSERT INTO `subimages` VALUES (780, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_premium_chu_i_1m5_ubeda_c_604284e648254233b4b822f8a0f6de15_master.jpg', '2024-11-16', 'MKUPCCDD05.M15');
INSERT INTO `subimages` VALUES (781, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_premium_chu_i_1m5_ubeda_c_604284e648254233b4b822f8a0f6de15.jpg', '2024-11-16', 'MKUPCCDD05.M15');
INSERT INTO `subimages` VALUES (782, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_premium_chu_i_1m5_ubeda_a_e26842070b17474b90a7263d431ebbd9.jpg', '2024-11-16', 'MKUPCCDD05.M15');
INSERT INTO `subimages` VALUES (783, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_premium_chu_i_1m5_ubeda_b_94bfcdbb622a4ad2812eab1194351cfc.jpg', '2024-11-16', 'MKUPCCDD05.M15');
INSERT INTO `subimages` VALUES (784, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_smart_chu_i_1m5_narvik_grenaa_c_27af5b348e8441e3b617ce8381fbfa06_master.jpg', '2024-11-16', 'MKGSCCDD04.M15');
INSERT INTO `subimages` VALUES (785, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_smart_chu_i_1m5_narvik_grenaa_c_27af5b348e8441e3b617ce8381fbfa06.jpg', '2024-11-16', 'MKGSCCDD04.M15');
INSERT INTO `subimages` VALUES (786, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_smart_chu_i_1m5_narvik_grenaa_b_4bf2e63d1c8b47108993f334178d68bf.jpg', '2024-11-16', 'MKGSCCDD04.M15');
INSERT INTO `subimages` VALUES (787, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_smart_chu_i_1m5_narvik_c_ebfc9ccad24e437fa09c54683feea174_master.jpg', '2024-11-16', 'MKNSCCDD04.M15');
INSERT INTO `subimages` VALUES (788, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_smart_chu_i_1m5_narvik_c_ebfc9ccad24e437fa09c54683feea174.jpg', '2024-11-16', 'MKNSCCDD04.M15');
INSERT INTO `subimages` VALUES (789, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_smart_chu_i_1m5_narvik_b_7cb176aadb0d468b8604f0ee83ffdae7.jpg', '2024-11-16', 'MKNSCCDD04.M15');
INSERT INTO `subimages` VALUES (790, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_smart_chu_i_1m5_narvik_c_ebfc9ccad24e437fa09c54683feea174.jpg', '2024-11-16', 'MKNSCCDD04.M15');
INSERT INTO `subimages` VALUES (791, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_smart_chu_i_1m5_ubeda_c_24816d45e5cb4f07b0cbb876b410c670_master.jpg', '2024-11-16', 'MKUSCCDD04.M15');
INSERT INTO `subimages` VALUES (792, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_smart_chu_i_1m5_ubeda_c_24816d45e5cb4f07b0cbb876b410c670.jpg', '2024-11-16', 'MKUSCCDD04.M15');
INSERT INTO `subimages` VALUES (793, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_smart_chu_i_1m5_ubeda_a_78c312d24a4d4676879c1fa658c6b075.jpg', '2024-11-16', 'MKUSCCDD04.M15');
INSERT INTO `subimages` VALUES (794, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_smart_chu_i_1m5_ubeda_b_e61bfd753c53496eb8839d476ee5c41b.jpg', '2024-11-16', 'MKUSCCDD04.M15');
INSERT INTO `subimages` VALUES (795, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_essential_chu_i_1m5_narvik_grenaa_c_95c5dcb276ec4a35bd000e2666315087_master.jpg', '2024-11-16', 'MKGBCCDD01.B15');
INSERT INTO `subimages` VALUES (796, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_essential_chu_i_1m5_narvik_grenaa_c_95c5dcb276ec4a35bd000e2666315087.jpg', '2024-11-16', 'MKGBCCDD01.B15');
INSERT INTO `subimages` VALUES (797, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_essential_chu_i_1m5_narvik_grenaa_b_10787e42c470453e9a8b08799ba10836.jpg', '2024-11-16', 'MKGBCCDD01.B15');
INSERT INTO `subimages` VALUES (798, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_essential_chu_i_1m5_narvik_grenaa_a_721f0cca550e46c38fe6ffcf153fda8d.jpg', '2024-11-16', 'MKGBCCDD01.B15');
INSERT INTO `subimages` VALUES (799, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_essential_chu_i_1m5_narvik_c_18fa9e7d0d09415cb132a835fff07242_master.jpg', '2024-11-16', 'MKNBCCDD01.N15');
INSERT INTO `subimages` VALUES (800, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_essential_chu_i_1m5_narvik_c_18fa9e7d0d09415cb132a835fff07242.jpg', '2024-11-16', 'MKNBCCDD01.N15');
INSERT INTO `subimages` VALUES (801, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_essential_chu_i_1m5_narvik_a_04564cf18461434784980c408c9281f1.jpg', '2024-11-16', 'MKNBCCDD01.N15');
INSERT INTO `subimages` VALUES (802, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_essential_chu_i_1m5_narvik_c_18fa9e7d0d09415cb132a835fff07242.jpg', '2024-11-16', 'MKNBCCDD01.N15');
INSERT INTO `subimages` VALUES (803, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_essential_chu_i_1m5_ubeda_c_c0d33a525dff4c2d9adf7e9594c31245_master.jpg', '2024-11-16', 'MKUBCCDD01.N15');
INSERT INTO `subimages` VALUES (804, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_essential_chu_i_1m5_ubeda_c_c0d33a525dff4c2d9adf7e9594c31245.jpg', '2024-11-16', 'MKUBCCDD01.N15');
INSERT INTO `subimages` VALUES (805, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_essential_chu_i_1m5_ubeda_a_fcd92c6a569b4414865770be2634dfe3.jpg', '2024-11-16', 'MKUBCCDD01.N15');
INSERT INTO `subimages` VALUES (806, 'https://product.hstatic.net/200000065946/product/pro_1m5_chu_i_noi_that_moho_tu_bep_essential_chu_i_1m5_ubeda_c_c0d33a525dff4c2d9adf7e9594c31245.jpg', '2024-11-16', 'MKUBCCDD01.N15');
INSERT INTO `subimages` VALUES (807, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tudaugiuong___2__85b4b890204a454bbffb5cb6b06ac45c_master.jpg', '2024-11-16', 'MFBSCDN01.B04');
INSERT INTO `subimages` VALUES (808, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tudaugiuong___2__85b4b890204a454bbffb5cb6b06ac45c.jpg', '2024-11-16', 'MFBSCDN01.B04');
INSERT INTO `subimages` VALUES (809, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu___1__645338e0da8641539b7e681fbfd12d2a_master.jpg', '2024-11-16', 'MFTCCDN01.B16');
INSERT INTO `subimages` VALUES (810, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu___1__645338e0da8641539b7e681fbfd12d2a.jpg', '2024-11-16', 'MFTCCDN01.B16');
INSERT INTO `subimages` VALUES (811, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu___2__042b4c7be9504f579c52e8f4052fc0c6.jpg', '2024-11-16', 'MFTCCDN01.B16');
INSERT INTO `subimages` VALUES (812, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu___3__fddbd76fe02f418c928cd7d3195c5f28.jpg', '2024-11-16', 'MFTCCDN01.B16');
INSERT INTO `subimages` VALUES (813, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu___4__7777e6df03db40aaa0f1387856c54a27.jpg', '2024-11-16', 'MFTCCDN01.B16');
INSERT INTO `subimages` VALUES (814, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu___4__7777e6df03db40aaa0f1387856c54a27.jpg', '2024-11-16', 'MFTCCDN01.B16');
INSERT INTO `subimages` VALUES (815, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu___6__45edb23df68648c69ede7ae2ae3297ee.jpg', '2024-11-16', 'MFTCCDN01.B16');
INSERT INTO `subimages` VALUES (816, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik__5__cfebcbd0fe564a7187e8566ba0c5af5e_master.jpg', '2024-11-16', 'MHCBCD902.BN40');
INSERT INTO `subimages` VALUES (817, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik_diningroom_basic_236d3339d5e04093ac4d8e67063b62ac_master.jpg', '2024-11-16', 'MHCBCD902.BN40');
INSERT INTO `subimages` VALUES (818, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik_bedroom_basic_0c14886ef42f4943b6264f79d2643ca1_master.jpg', '2024-11-16', 'MHCBCD902.BN40');
INSERT INTO `subimages` VALUES (819, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik__6__1e2442203bec4d148167600a2a1efc82_master.jpg', '2024-11-16', 'MHCBCD902.BN40');
INSERT INTO `subimages` VALUES (820, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik__6__1e2442203bec4d148167600a2a1efc82_master.jpg', '2024-11-16', 'MHCBCD902.BN40');
INSERT INTO `subimages` VALUES (821, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik__20__df456e0616d54550bf5f87cddb11de99_master.jpg', '2024-11-16', 'MHCBCD902.BN40');
INSERT INTO `subimages` VALUES (822, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_combo_narvik_coohom__25__9db84ca5bfe3493b99293aba2f246698_master.jpg', '2024-11-16', 'MHCBCD902.NN39');
INSERT INTO `subimages` VALUES (823, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_combo_narvik_coohom__25__9db84ca5bfe3493b99293aba2f246698.jpg', '2024-11-16', 'MHCBCD902.NN39');
INSERT INTO `subimages` VALUES (824, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__9__b00b08443e8840a19dd388ad54eb3386_master.jpg', '2024-11-16', 'MHCBCD902.NN39');
INSERT INTO `subimages` VALUES (825, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__15__f38eeaecb6d14506b1f869a29da5d16d_master.jpg', '2024-11-16', 'MHCBCD902.NN39');
INSERT INTO `subimages` VALUES (826, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__10__abe2c08bd63946d183a6ca602e25c415_master.jpg', '2024-11-16', 'MHCBCD902.NN39');
INSERT INTO `subimages` VALUES (827, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__10__abe2c08bd63946d183a6ca602e25c415_master.jpg', '2024-11-16', 'MHCBCD902.NN39');
INSERT INTO `subimages` VALUES (828, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__16__044d95fb32054099bee03c48ab70165d_master.jpg', '2024-11-16', 'MHCBCD902.NN39');
INSERT INTO `subimages` VALUES (829, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_full_house_ubeda_1_4a27b73a83db4ff39385fa7abebb2c3c_master.jpg', '2024-11-16', 'MHCBCDN01.NU38');
INSERT INTO `subimages` VALUES (830, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_full_house_ubeda_1_4a27b73a83db4ff39385fa7abebb2c3c.jpg', '2024-11-16', 'MHCBCDN01.NU38');
INSERT INTO `subimages` VALUES (831, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho__33__d39c7824d96a4954a4853ce49ca239ad_master.jpg', '2024-11-16', 'MHCBCDN01.NU38');
INSERT INTO `subimages` VALUES (832, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho__13__3336cb2d3034487b9146201938e0dae9_master.jpg', '2024-11-16', 'MHCBCDN01.NU38');
INSERT INTO `subimages` VALUES (833, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho__47__b41994f3c21e41cc9ccb95003da463d9_master.jpg', '2024-11-16', 'MHCBCDN01.NU38');
INSERT INTO `subimages` VALUES (834, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho__47__b41994f3c21e41cc9ccb95003da463d9_master.jpg', '2024-11-16', 'MHCBCDN01.NU38');
INSERT INTO `subimages` VALUES (835, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho__22__3ea40b2ac76640f897fca22dbd706819_master.jpg', '2024-11-16', 'MHCBCDN01.NU38');
INSERT INTO `subimages` VALUES (836, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ubeda__6__61e1e0901d40426bae3d8e731496eeba_master.jpg', '2024-11-16', 'MHCBCDN01.BU37');
INSERT INTO `subimages` VALUES (837, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ubeda__6__61e1e0901d40426bae3d8e731496eeba.jpg', '2024-11-16', 'MHCBCDN01.BU37');
INSERT INTO `subimages` VALUES (838, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ubeda__10__2c46b07751ba4818be9178814a5a903f_master.jpg', '2024-11-16', 'MHCBCDN01.BU37');
INSERT INTO `subimages` VALUES (839, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ubeda__9__d04a030a57fb4dd89caec7257a6f6809_master.jpg', '2024-11-16', 'MHCBCDN01.BU37');
INSERT INTO `subimages` VALUES (840, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ubeda__15__fe7fbaae465f48258206c174cd7e4ca4_master.jpg', '2024-11-16', 'MHCBCDN01.BU37');
INSERT INTO `subimages` VALUES (841, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ubeda__15__fe7fbaae465f48258206c174cd7e4ca4_master.jpg', '2024-11-16', 'MHCBCDN01.BU37');
INSERT INTO `subimages` VALUES (842, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ubeda__11__72430b7c6c7141659391bf722d3fcb55_master.jpg', '2024-11-16', 'MHCBCDN01.BU37');
INSERT INTO `subimages` VALUES (843, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__22__a76dca50353447dca2b62c36fe02f47f_master.jpg', '2024-11-16', 'MHCBCD801.BG36');
INSERT INTO `subimages` VALUES (844, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__46__c61545477fdf4e9f81f32e1a0b927f00_master.jpg', '2024-11-16', 'MHCBCD801.BG36');
INSERT INTO `subimages` VALUES (845, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__34__5c068a2c2ed44898b3989ea50607c005_master.jpg', '2024-11-16', 'MHCBCD801.BG36');
INSERT INTO `subimages` VALUES (846, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__31__002a2ab87e934dd1a49939086b5b7875_master.jpg', '2024-11-16', 'MHCBCD801.BG36');
INSERT INTO `subimages` VALUES (847, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__31__002a2ab87e934dd1a49939086b5b7875_master.jpg', '2024-11-16', 'MHCBCD801.BG36');
INSERT INTO `subimages` VALUES (848, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__19__7b50e26d927c4b01b1724e6bdc588835_master.jpg', '2024-11-16', 'MHCBCD801.BG36');
INSERT INTO `subimages` VALUES (849, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_full_house_ubeda_1_1189e20105d54564a0054e572e2445d5_master.jpg', '2024-11-16', 'MHCBCDN01.NU35');
INSERT INTO `subimages` VALUES (850, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_full_house_ubeda_1_1189e20105d54564a0054e572e2445d5.jpg', '2024-11-16', 'MHCBCDN01.NU35');
INSERT INTO `subimages` VALUES (851, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_ubeda__8__64c58a91343b40b9879ca87a37515437_master.jpg', '2024-11-16', 'MHCBCDN01.NU35');
INSERT INTO `subimages` VALUES (852, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho__8__fcc220c3b89941b6996cc2d237b0f7fc_master.jpg', '2024-11-16', 'MHCBCDN01.NU35');
INSERT INTO `subimages` VALUES (853, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho__59__63bda815d17d4713a3a57c89fc14be50_master.jpg', '2024-11-16', 'MHCBCDN01.NU35');
INSERT INTO `subimages` VALUES (854, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho__59__63bda815d17d4713a3a57c89fc14be50_master.jpg', '2024-11-16', 'MHCBCDN01.NU35');
INSERT INTO `subimages` VALUES (855, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho__24__6d8129b4f70942e3bbb1c3a56c8ca973_master.jpg', '2024-11-16', 'MHCBCDN01.NU35');
INSERT INTO `subimages` VALUES (856, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ubeda__4__8caaa3de3f5947cd8f177773225f1a16_master.jpg', '2024-11-16', 'MHCBCDN01.BU34');
INSERT INTO `subimages` VALUES (857, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ubeda__4__8caaa3de3f5947cd8f177773225f1a16.jpg', '2024-11-16', 'MHCBCDN01.BU34');
INSERT INTO `subimages` VALUES (858, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nau_noi_that_moho_ubeda__16__33aab8a1e4d34e38b76cb7fdfaee20cb_master.jpg', '2024-11-16', 'MHCBCDN01.BU34');
INSERT INTO `subimages` VALUES (859, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nau_noi_that_moho_ubeda__1__4ffabe1403714d3a9a15f2a58e31f32d_master.jpg', '2024-11-16', 'MHCBCDN01.BU34');
INSERT INTO `subimages` VALUES (860, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ubeda__25__85ae18a785c24f909a51ea9c12229485_master.jpg', '2024-11-16', 'MHCBCDN01.BU34');
INSERT INTO `subimages` VALUES (861, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ubeda__25__85ae18a785c24f909a51ea9c12229485_master.jpg', '2024-11-16', 'MHCBCDN01.BU34');
INSERT INTO `subimages` VALUES (862, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ubeda__16__5161839093f54c26a4b145a070ac663f_master.jpg', '2024-11-16', 'MHCBCDN01.BU34');
INSERT INTO `subimages` VALUES (863, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik_livingroom_full_04c13065d93a456ebf817275c8c54780_master.jpg', '2024-11-16', 'MHCBCD902.BN33');
INSERT INTO `subimages` VALUES (864, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik__25__2042b255ee7442cb88b8440d48036d55_master.jpg', '2024-11-16', 'MHCBCD902.BN33');
INSERT INTO `subimages` VALUES (865, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik__26__d8745c50c9ce44a8a5738f5cb66a4b53_master.jpg', '2024-11-16', 'MHCBCD902.BN33');
INSERT INTO `subimages` VALUES (866, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik_bedroom_basic_72470d57cba44eee8616a65f580a9d1d_master.jpg', '2024-11-16', 'MHCBCD902.BN33');
INSERT INTO `subimages` VALUES (867, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik_bedroom_basic_72470d57cba44eee8616a65f580a9d1d_master.jpg', '2024-11-16', 'MHCBCD902.BN33');
INSERT INTO `subimages` VALUES (868, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik_livingroom_full__2__7005a209d29c4700b51941a4e40a0644_master.jpg', '2024-11-16', 'MHCBCD902.BN33');
INSERT INTO `subimages` VALUES (869, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__6__c1d88e443a544802928070b5ab4a6a36_master.jpg', '2024-11-16', 'MHCBCD902.NN32');
INSERT INTO `subimages` VALUES (870, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__7__b04f32e5d8524fdeb78c9d9e8c10141f_master.jpg', '2024-11-16', 'MHCBCD902.NN32');
INSERT INTO `subimages` VALUES (871, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__12__4c8cc10cc14b458987427134ade7fc65_master.jpg', '2024-11-16', 'MHCBCD902.NN32');
INSERT INTO `subimages` VALUES (872, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__10__a302b084e3d34cc185eae5efb6519fd6_master.jpg', '2024-11-16', 'MHCBCD902.NN32');
INSERT INTO `subimages` VALUES (873, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__10__a302b084e3d34cc185eae5efb6519fd6_master.jpg', '2024-11-16', 'MHCBCD902.NN32');
INSERT INTO `subimages` VALUES (874, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__15__bec4e6e6324d484f8328946fb535b8bf_master.jpg', '2024-11-16', 'MHCBCD902.NN32');
INSERT INTO `subimages` VALUES (875, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__17__d497024658fd44958d4c87aaf3ed4da2_master.jpg', '2024-11-16', 'MHCBCD801.BG31');
INSERT INTO `subimages` VALUES (876, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__17__d497024658fd44958d4c87aaf3ed4da2.jpg', '2024-11-16', 'MHCBCD801.BG31');
INSERT INTO `subimages` VALUES (877, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__26__b0fe21bdb18e4010ba9c89a728eae142_master.jpg', '2024-11-16', 'MHCBCD801.BG31');
INSERT INTO `subimages` VALUES (878, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__13__a71c44c28d854b149124fbb487fb7295_master.jpg', '2024-11-16', 'MHCBCD801.BG31');
INSERT INTO `subimages` VALUES (879, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__36__f04c591559f94376bf88ad400e5f5105_master.jpg', '2024-11-16', 'MHCBCD801.BG31');
INSERT INTO `subimages` VALUES (880, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__36__f04c591559f94376bf88ad400e5f5105_master.jpg', '2024-11-16', 'MHCBCD801.BG31');
INSERT INTO `subimages` VALUES (881, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__39__67217e7a2cdc4188bc3e2c639e3fa9ed_master.jpg', '2024-11-16', 'MHCBCD801.BG31');
INSERT INTO `subimages` VALUES (882, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__13__7b36d81feb2f406caa970117eda1ffef_master.jpg', '2024-11-16', 'MHCBCD801.BG3');
INSERT INTO `subimages` VALUES (883, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__13__7b36d81feb2f406caa970117eda1ffef.jpg', '2024-11-16', 'MHCBCD801.BG3');
INSERT INTO `subimages` VALUES (884, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__34__dcfd5d53026349a5b07acdac68a1f582_master.jpg', '2024-11-16', 'MHCBCD801.BG3');
INSERT INTO `subimages` VALUES (885, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__35__2767864cab6841aebd96e7a6ba9e0af9_master.jpg', '2024-11-16', 'MHCBCD801.BG3');
INSERT INTO `subimages` VALUES (886, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__40__721b041343ca4821a784be5d1f333b0f_master.jpg', '2024-11-16', 'MHCBCD801.BG3');
INSERT INTO `subimages` VALUES (887, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__40__721b041343ca4821a784be5d1f333b0f_master.jpg', '2024-11-16', 'MHCBCD801.BG3');
INSERT INTO `subimages` VALUES (888, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__47__84fdc4d81ba141f6ad901deb648f4787_master.jpg', '2024-11-16', 'MHCBCD801.BG3');
INSERT INTO `subimages` VALUES (889, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik_livingroom_basic_1_89ac244d12b6487c9191f26d359302f3_master.jpg', '2024-11-16', 'MHCBCD902.BN23');
INSERT INTO `subimages` VALUES (890, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik__5__e2244e908e64436fbc45976da120ea7e_master.jpg', '2024-11-16', 'MHCBCD902.BN23');
INSERT INTO `subimages` VALUES (891, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik__6__c8767f86eb944e9f93287f9d2ad7d4b0_master.jpg', '2024-11-16', 'MHCBCD902.BN23');
INSERT INTO `subimages` VALUES (892, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik__7__f2e37a91e6a34de7b5f942fa5b99bb0f_master.jpg', '2024-11-16', 'MHCBCD902.BN23');
INSERT INTO `subimages` VALUES (893, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik__7__f2e37a91e6a34de7b5f942fa5b99bb0f_master.jpg', '2024-11-16', 'MHCBCD902.BN23');
INSERT INTO `subimages` VALUES (894, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik__11__b7d35d09734a4784ab9593cd0f0f6693_master.jpg', '2024-11-16', 'MHCBCD902.BN23');
INSERT INTO `subimages` VALUES (895, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik_livingroom_giuong_ngu_9f419d98ab9248e2a9c74174a31b434e_master.jpg', '2024-11-16', 'MHCBCD902.BN22');
INSERT INTO `subimages` VALUES (896, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik_bedroom_basic_be140b79191f493a8eb6a03ddc137f19_master.jpg', '2024-11-16', 'MHCBCD902.BN22');
INSERT INTO `subimages` VALUES (897, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik__20__7b209b2fc876440ba582f92b70b8588e_master.jpg', '2024-11-16', 'MHCBCD902.BN22');
INSERT INTO `subimages` VALUES (898, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik_bedroom_tu_dau_giuong_c15792d855c54019a04e415fad30cb94_master.jpg', '2024-11-16', 'MHCBCD902.BN22');
INSERT INTO `subimages` VALUES (899, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik_bedroom_tu_dau_giuong_c15792d855c54019a04e415fad30cb94_master.jpg', '2024-11-16', 'MHCBCD902.BN22');
INSERT INTO `subimages` VALUES (900, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_full_combo_narvik__1__dbf183ed714f46968999199979123ba2_master.jpg', '2024-11-16', 'MHCBCD902.NN29');
INSERT INTO `subimages` VALUES (901, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_full_combo_narvik__1__dbf183ed714f46968999199979123ba2.jpg', '2024-11-16', 'MHCBCD902.NN29');
INSERT INTO `subimages` VALUES (902, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__6__59ff257ceb32449298394d6650182f61_master.jpg', '2024-11-16', 'MHCBCD902.NN29');
INSERT INTO `subimages` VALUES (903, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__7__f6645caeeb9e4346acd4a7414bfe91cf_master.jpg', '2024-11-16', 'MHCBCD902.NN29');
INSERT INTO `subimages` VALUES (904, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__10__137e877e4a94451c8d845796b6e4e7c0_master.jpg', '2024-11-16', 'MHCBCD902.NN29');
INSERT INTO `subimages` VALUES (905, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__10__137e877e4a94451c8d845796b6e4e7c0_master.jpg', '2024-11-16', 'MHCBCD902.NN29');
INSERT INTO `subimages` VALUES (906, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__1__207c4690c66b4a699ca5010c98155602_master.jpg', '2024-11-16', 'MHCBCD902.NN29');
INSERT INTO `subimages` VALUES (907, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik_diningroom_basic_0359beecfdec4d98a88a9abfce22cba3_master.jpg', '2024-11-16', 'MHCBCD902.BN24');
INSERT INTO `subimages` VALUES (908, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik_diningroom_basic_0359beecfdec4d98a88a9abfce22cba3.jpg', '2024-11-16', 'MHCBCD902.BN24');
INSERT INTO `subimages` VALUES (909, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik_diningroom_basic_0359beecfdec4d98a88a9abfce22cba3_master.jpg', '2024-11-16', 'MHCBCD902.BN24');
INSERT INTO `subimages` VALUES (910, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik_diningroom_basic_24682ddaa73442049cc28323ca8b902f_master.png', '2024-11-16', 'MHCBCD902.BN24');
INSERT INTO `subimages` VALUES (911, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik__12__b3f1b7b79eed4279bcf6e0fe7b6793ac_master.jpg', '2024-11-16', 'MHCBCD902.BN24');
INSERT INTO `subimages` VALUES (912, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik__12__b3f1b7b79eed4279bcf6e0fe7b6793ac_master.jpg', '2024-11-16', 'MHCBCD902.BN24');
INSERT INTO `subimages` VALUES (913, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik__15__c926c3b2bb7f4a37b15f33786001fc2f_master.jpg', '2024-11-16', 'MHCBCD902.BN24');
INSERT INTO `subimages` VALUES (914, 'https://product.hstatic.net/200000065946/product/pro_combo_day_du_2_mon_noi_that_moho_narvik__28__1a37dc4910744280aca0677393b4c8da_master.jpg', '2024-11-16', 'MHCBCD902.NN47');
INSERT INTO `subimages` VALUES (915, 'https://product.hstatic.net/200000065946/product/pro_combo_day_du_2_mon_noi_that_moho_narvik__26__192a8f8ea4c1412093f5385cd36eb182.jpg', '2024-11-16', 'MHCBCD902.NN47');
INSERT INTO `subimages` VALUES (916, 'https://product.hstatic.net/200000065946/product/pro_combo_day_du_2_mon_noi_that_moho_narvik__27__6b68a3febcdb49578f0ea13e283b14fd.jpg', '2024-11-16', 'MHCBCD902.NN47');
INSERT INTO `subimages` VALUES (917, 'https://product.hstatic.net/200000065946/product/pro_combo_day_du_2_mon_noi_that_moho_narvik__29__520cb100d42844ae90a21a32bcdfa1e5.jpg', '2024-11-16', 'MHCBCD902.NN47');
INSERT INTO `subimages` VALUES (918, 'https://product.hstatic.net/200000065946/product/pro_combo_day_du_2_mon_noi_that_moho_narvik__29__520cb100d42844ae90a21a32bcdfa1e5.jpg', '2024-11-16', 'MHCBCD902.NN47');
INSERT INTO `subimages` VALUES (919, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik_livingroom_full_d817b1f747df4c088f3aac13a135a875_master.jpg', '2024-11-16', 'MHCBCD902.BN26');
INSERT INTO `subimages` VALUES (920, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik__5__e9695f708bdf46479eaad7c4d701bf08_master.jpg', '2024-11-16', 'MHCBCD902.BN26');
INSERT INTO `subimages` VALUES (921, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik__6__7f91e74980aa4f78bd27794df8f45e65_master.jpg', '2024-11-16', 'MHCBCD902.BN26');
INSERT INTO `subimages` VALUES (922, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik__2__a14e0fa86b954ba8bed57397dd266e51_master.jpg', '2024-11-16', 'MHCBCD902.BN26');
INSERT INTO `subimages` VALUES (923, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik__2__a14e0fa86b954ba8bed57397dd266e51_master.jpg', '2024-11-16', 'MHCBCD902.BN26');
INSERT INTO `subimages` VALUES (924, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_narvik_livingroom_ghe_don_a9cd903882104c7b8c51858553987896_master.jpg', '2024-11-16', 'MHCBCD902.BN26');
INSERT INTO `subimages` VALUES (925, 'https://product.hstatic.net/200000065946/product/pro_full_combo_2_mon_noi_that_moho_narvik__11__1f45c1413ad1447d8525964ad7276859_master.jpg', '2024-11-16', 'MHCBCD902.BN50');
INSERT INTO `subimages` VALUES (926, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__10__e84698ebcf7045e9b05d7d7809d153c3_master.jpg', '2024-11-16', 'MHCBCD902.MN21');
INSERT INTO `subimages` VALUES (927, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__5__f33e4b574a24404ca97d9fe0da2ff24d_master.jpg', '2024-11-16', 'MHCBCD902.MN21');
INSERT INTO `subimages` VALUES (928, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__11__15beb3a352e4488891857358727177e2_master.jpg', '2024-11-16', 'MHCBCD902.MN21');
INSERT INTO `subimages` VALUES (929, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__14__dda286525df249fc98550040ed2a6e33_master.jpg', '2024-11-16', 'MHCBCD902.MN21');
INSERT INTO `subimages` VALUES (930, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__14__dda286525df249fc98550040ed2a6e33_master.jpg', '2024-11-16', 'MHCBCD902.MN21');
INSERT INTO `subimages` VALUES (931, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__20__0ddcbfed75524833b3b9a7db5d87c90b_master.jpg', '2024-11-16', 'MHCBCD902.MN21');
INSERT INTO `subimages` VALUES (932, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__15__3991cbf77ad8488fb644eef67a08790c_master.jpg', '2024-11-16', 'MHCBCD902.NN19');
INSERT INTO `subimages` VALUES (933, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__16__7af779d558c24249b1826325fe931275_master.jpg', '2024-11-16', 'MHCBCD902.NN19');
INSERT INTO `subimages` VALUES (934, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__17__f111b16d47ec489fab1a3f27c0f60e97_master.jpg', '2024-11-16', 'MHCBCD902.NN19');
INSERT INTO `subimages` VALUES (935, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__26__8c3e3a6f005344a3917fd8bdb2fd26b6_master.jpg', '2024-11-16', 'MHCBCD902.NN19');
INSERT INTO `subimages` VALUES (936, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__26__8c3e3a6f005344a3917fd8bdb2fd26b6_master.jpg', '2024-11-16', 'MHCBCD902.NN19');
INSERT INTO `subimages` VALUES (937, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__8__b68b0f7c19c347ccbf1a684d1f2e0804_master.jpg', '2024-11-16', 'MHCBCD902.NN20');
INSERT INTO `subimages` VALUES (938, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__9__7e2543066f8544ea948ef572ee13e7a1_master.jpg', '2024-11-16', 'MHCBCD902.NN20');
INSERT INTO `subimages` VALUES (939, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__1__0e378298105647a29128edf1ce3c7ed9_master.jpg', '2024-11-16', 'MHCBCD902.NN20');
INSERT INTO `subimages` VALUES (940, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__4__38e6b68c63de49749f903b3e11c7ffb9_master.jpg', '2024-11-16', 'MHCBCD902.NN20');
INSERT INTO `subimages` VALUES (941, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__4__38e6b68c63de49749f903b3e11c7ffb9_master.jpg', '2024-11-16', 'MHCBCD902.NN20');
INSERT INTO `subimages` VALUES (942, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_narvik__25__86745e3b04c54707a1be2d82cd7f081e_master.jpg', '2024-11-16', 'MHCBCD902.NN20');
INSERT INTO `subimages` VALUES (943, 'https://product.hstatic.net/200000065946/product/pro_full_combo_2_mon_noi_that_moho__22__9989cfef2a4e426badd66566cdada936_master.jpg', '2024-11-16', 'MHCBCDN01.NU44');
INSERT INTO `subimages` VALUES (944, 'https://product.hstatic.net/200000065946/product/pro_full_combo_2_mon_noi_that_moho__22__9989cfef2a4e426badd66566cdada936.jpg', '2024-11-16', 'MHCBCDN01.NU44');
INSERT INTO `subimages` VALUES (945, 'https://product.hstatic.net/200000065946/product/pro_full_combo_2_mon_noi_that_moho__25__b85e7a59af474615bd294ce4eac91ef5.jpg', '2024-11-16', 'MHCBCDN01.NU44');
INSERT INTO `subimages` VALUES (946, 'https://product.hstatic.net/200000065946/product/pro_full_combo_2_mon_noi_that_moho__23__16ef7ed5dd354f7da5f70f35791af229.jpg', '2024-11-16', 'MHCBCDN01.NU44');
INSERT INTO `subimages` VALUES (947, 'https://product.hstatic.net/200000065946/product/pro_full_combo_2_mon_noi_that_moho__24__6f6280ae7ed94bce842a3599acc515bc.jpg', '2024-11-16', 'MHCBCDN01.NU44');
INSERT INTO `subimages` VALUES (948, 'https://product.hstatic.net/200000065946/product/pro_full_combo_2_mon_noi_that_moho__24__6f6280ae7ed94bce842a3599acc515bc.jpg', '2024-11-16', 'MHCBCDN01.NU44');
INSERT INTO `subimages` VALUES (949, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_ubeda__7__78e0cdb3e32848d39f9b8f2463fca450_master.jpg', '2024-11-16', 'MHCBCDN01.NU16');
INSERT INTO `subimages` VALUES (950, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_ubeda__7__78e0cdb3e32848d39f9b8f2463fca450.jpg', '2024-11-16', 'MHCBCDN01.NU16');
INSERT INTO `subimages` VALUES (951, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho__34__c2aba3cc49ac428c9df81fc84c57165c_master.jpg', '2024-11-16', 'MHCBCDN01.NU16');
INSERT INTO `subimages` VALUES (952, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho__36__51cdc3746bfc4f5c8cb547296848feb9_master.jpg', '2024-11-16', 'MHCBCDN01.NU16');
INSERT INTO `subimages` VALUES (953, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho__40__3406a52049444ba2a20dad547482f715_master.jpg', '2024-11-16', 'MHCBCDN01.NU16');
INSERT INTO `subimages` VALUES (954, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho__40__3406a52049444ba2a20dad547482f715_master.jpg', '2024-11-16', 'MHCBCDN01.NU16');
INSERT INTO `subimages` VALUES (955, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho__57__e76e6ed431d940298b594027221470d9_master.jpg', '2024-11-16', 'MHCBCDN01.NU16');
INSERT INTO `subimages` VALUES (956, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_bo_ban_an_2_1f7ea22bb33b435f9df0f49622c7fc52_master.jpg', '2024-11-16', 'MHCBCDN01.NU15');
INSERT INTO `subimages` VALUES (957, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_combo_basic_phong_an_ubeda_2_bba57728e757449f90861373bd3ce8be_master.jpg', '2024-11-16', 'MHCBCDN01.NU15');
INSERT INTO `subimages` VALUES (958, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho__63__dc206a160ab94d479b27e9802e5c53c5_master.jpg', '2024-11-16', 'MHCBCDN01.NU15');
INSERT INTO `subimages` VALUES (959, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho__66__fa98a8f3cdbd448c808c4bfac9375dba_master.jpg', '2024-11-16', 'MHCBCDN01.NU15');
INSERT INTO `subimages` VALUES (960, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho__66__fa98a8f3cdbd448c808c4bfac9375dba_master.jpg', '2024-11-16', 'MHCBCDN01.NU15');
INSERT INTO `subimages` VALUES (961, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho__68__1082756e20204261b917699190868464_master.jpg', '2024-11-16', 'MHCBCDN01.NU15');
INSERT INTO `subimages` VALUES (962, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_combo_basic_phong_ngu_ubeda_1_1ec8feaf56f5496a8fb52c4aa3c57688_master.jpg', '2024-11-16', 'MHCBCDN01.NU14');
INSERT INTO `subimages` VALUES (963, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_combo_basic_phong_ngu_ubeda_1_1ec8feaf56f5496a8fb52c4aa3c57688.jpg', '2024-11-16', 'MHCBCDN01.NU14');
INSERT INTO `subimages` VALUES (964, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_ubeda__14__b9ee7afa9862429c9655c1d056ab281f_master.jpg', '2024-11-16', 'MHCBCDN01.NU14');
INSERT INTO `subimages` VALUES (965, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_combo_basic_phong_ngu_ubeda_2_24274b306bc54527b6aef6ba3c7cce19_master.jpg', '2024-11-16', 'MHCBCDN01.NU14');
INSERT INTO `subimages` VALUES (966, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho__1__fcb4f260ad8340309e29ca877482c3f5_master.jpg', '2024-11-16', 'MHCBCDN01.NU14');
INSERT INTO `subimages` VALUES (967, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho__1__fcb4f260ad8340309e29ca877482c3f5_master.jpg', '2024-11-16', 'MHCBCDN01.NU14');
INSERT INTO `subimages` VALUES (968, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho__4__9d37d401687c48f3b8badd2cb9fd51ad_master.jpg', '2024-11-16', 'MHCBCDN01.NU14');
INSERT INTO `subimages` VALUES (969, 'https://product.hstatic.net/200000065946/product/pro_mau_full_combo_2_mon_noi_that_moho_ubeda__1__eea2b70440234e24bd295a71c399a1ae_master.jpg', '2024-11-16', 'MHCBCDN01.BU43');
INSERT INTO `subimages` VALUES (970, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_combo_basic_phong_khach_ubeda_1_9e1100c9218b422d8538ee08a66968aa_master.jpg', '2024-11-16', 'MHCBCDN01.NU13');
INSERT INTO `subimages` VALUES (971, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_combo_basic_phong_khach_ubeda_1_9e1100c9218b422d8538ee08a66968aa.jpg', '2024-11-16', 'MHCBCDN01.NU13');
INSERT INTO `subimages` VALUES (972, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_combo_basic_phong_khach_ubeda_1_9e1100c9218b422d8538ee08a66968aa_master.jpg', '2024-11-16', 'MHCBCDN01.NU13');
INSERT INTO `subimages` VALUES (973, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho__71__214b7412bc02486cb0ad702bbcef7f4d_master.jpg', '2024-11-16', 'MHCBCDN01.NU13');
INSERT INTO `subimages` VALUES (974, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho__72__e348469158fa45f7b2dc991304a87ce8_master.jpg', '2024-11-16', 'MHCBCDN01.NU13');
INSERT INTO `subimages` VALUES (975, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho__72__e348469158fa45f7b2dc991304a87ce8_master.jpg', '2024-11-16', 'MHCBCDN01.NU13');
INSERT INTO `subimages` VALUES (976, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho__40__81836a1f48bb4e429c200270ae0e3b8c_master.jpg', '2024-11-16', 'MHCBCDN01.NU13');
INSERT INTO `subimages` VALUES (977, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ubeda_livingroom_a4a14b63e87d4d0486eefd7402dbf9bd_master.jpg', '2024-11-16', 'MHCBCDN01.BU10');
INSERT INTO `subimages` VALUES (978, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_ubeda_livingroom_a4a14b63e87d4d0486eefd7402dbf9bd.jpg', '2024-11-16', 'MHCBCDN01.BU10');
INSERT INTO `subimages` VALUES (979, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nau_noi_that_moho_ubeda__50__ba70dd1fdfb747318d815bee84a1e5bb_master.jpg', '2024-11-16', 'MHCBCDN01.BU10');
INSERT INTO `subimages` VALUES (980, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nau_noi_that_moho_ubeda__52__1109d26cd7a04cd08d7560577cf25965_master.jpg', '2024-11-16', 'MHCBCDN01.BU10');
INSERT INTO `subimages` VALUES (981, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nau_noi_that_moho_ubeda__7__7259dfe415c04a81a73babd5aa27b6d6_master.jpg', '2024-11-16', 'MHCBCDN01.BU10');
INSERT INTO `subimages` VALUES (982, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nau_noi_that_moho_ubeda__7__7259dfe415c04a81a73babd5aa27b6d6_master.jpg', '2024-11-16', 'MHCBCDN01.BU10');
INSERT INTO `subimages` VALUES (983, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nau_noi_that_moho_ubeda__9__65a8c8d01cdb4620928da4604e8d5756_master.jpg', '2024-11-16', 'MHCBCDN01.BU10');
INSERT INTO `subimages` VALUES (984, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nau_noi_that_moho_ubeda__40__6b87d8e809af48c5a7ac1c8023847507_master.jpg', '2024-11-16', 'MHCBCDN01.BU8');
INSERT INTO `subimages` VALUES (985, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nau_noi_that_moho_ubeda__40__6b87d8e809af48c5a7ac1c8023847507.jpg', '2024-11-16', 'MHCBCDN01.BU8');
INSERT INTO `subimages` VALUES (986, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nau_noi_that_moho_ubeda__41__da67f97db2164cd994d9c54fa5a94de3_master.jpg', '2024-11-16', 'MHCBCDN01.BU8');
INSERT INTO `subimages` VALUES (987, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nau_noi_that_moho_ubeda__44__113a2fb11cd1401aae6aeb7815911a21_master.jpg', '2024-11-16', 'MHCBCDN01.BU8');
INSERT INTO `subimages` VALUES (988, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nau_noi_that_moho_ubeda__45__0cd747ea601f4d0d894f10a2b447b264_master.jpg', '2024-11-16', 'MHCBCDN01.BU8');
INSERT INTO `subimages` VALUES (989, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nau_noi_that_moho_ubeda__45__0cd747ea601f4d0d894f10a2b447b264_master.jpg', '2024-11-16', 'MHCBCDN01.BU8');
INSERT INTO `subimages` VALUES (990, 'https://product.hstatic.net/200000065946/product/pro_full_combo_3_mon_noi_that_grenaa_moho__53__a966ba1922654d1fac0f1631d69edb5e_master.jpg', '2024-11-16', 'MHCBCD801.BG41');
INSERT INTO `subimages` VALUES (991, 'https://product.hstatic.net/200000065946/product/pro_full_combo_3_mon_noi_that_grenaa_moho__53__a966ba1922654d1fac0f1631d69edb5e.jpg', '2024-11-16', 'MHCBCD801.BG41');
INSERT INTO `subimages` VALUES (992, 'https://product.hstatic.net/200000065946/product/pro_full_combo_2_mon_noi_that_grenaa_moho__46__d9d0f0f3e4b6458fa2777a9d3537292c.jpg', '2024-11-16', 'MHCBCD801.BG41');
INSERT INTO `subimages` VALUES (993, 'https://product.hstatic.net/200000065946/product/pro_full_combo_2_mon_noi_that_grenaa_moho__47__663956397ab04285a9c343475fa74dd3.jpg', '2024-11-16', 'MHCBCD801.BG41');
INSERT INTO `subimages` VALUES (994, 'https://product.hstatic.net/200000065946/product/pro_full_combo_2_mon_noi_that_grenaa_moho__49__066053ead1804156b4cf831c88be909b.jpg', '2024-11-16', 'MHCBCD801.BG41');
INSERT INTO `subimages` VALUES (995, 'https://product.hstatic.net/200000065946/product/pro_full_combo_2_mon_noi_that_grenaa_moho__49__066053ead1804156b4cf831c88be909b.jpg', '2024-11-16', 'MHCBCD801.BG41');
INSERT INTO `subimages` VALUES (996, 'https://product.hstatic.net/200000065946/product/pro_full_combo_2_mon_noi_that_grenaa_moho__51__a06d78b1501444bdbaa4a3a14ebd4df3.jpg', '2024-11-16', 'MHCBCD801.BG41');
INSERT INTO `subimages` VALUES (997, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__26__25945458ba02412192ab68c2c04cb81e_master.jpg', '2024-11-16', 'MHCBCD802.MG4');
INSERT INTO `subimages` VALUES (998, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__26__25945458ba02412192ab68c2c04cb81e.jpg', '2024-11-16', 'MHCBCD802.MG4');
INSERT INTO `subimages` VALUES (999, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__36__d3e99e87f7b04bd3b18ca7410e18a3ac_master.jpg', '2024-11-16', 'MHCBCD802.MG4');
INSERT INTO `subimages` VALUES (1000, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__25__92efbda0107b4f1c9a7733947979c72c_master.jpg', '2024-11-16', 'MHCBCD802.MG4');
INSERT INTO `subimages` VALUES (1001, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_combo_grenaa__8__a22d13ff335945bab07250e9d0a72a71_master.jpg', '2024-11-16', 'MHCBCD802.MG4');
INSERT INTO `subimages` VALUES (1002, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_combo_grenaa__8__a22d13ff335945bab07250e9d0a72a71_master.jpg', '2024-11-16', 'MHCBCD802.MG4');
INSERT INTO `subimages` VALUES (1003, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__24__aa305782e7ae4e149eaa05db11caabbc_master.jpg', '2024-11-16', 'MHCBCD802.MG4');
INSERT INTO `subimages` VALUES (1004, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_moho_combo_1_b6ce41f6d34b4506a5df1233964415ec_master.jpg', '2024-11-16', 'MHCBCDN01.BU9');
INSERT INTO `subimages` VALUES (1005, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nau_noi_that_moho_ubeda__4__5acd919d2b784921b5e53dcb47402d50_master.jpg', '2024-11-16', 'MHCBCDN01.BU9');
INSERT INTO `subimages` VALUES (1006, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nau_noi_that_moho_ubeda__2__47960c979f444bbc96224d237c1d9f1c_master.jpg', '2024-11-16', 'MHCBCDN01.BU9');
INSERT INTO `subimages` VALUES (1007, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nau_noi_that_moho_ubeda__36__4d2fdd75525742f68ecc2bdb2cae0466_master.jpg', '2024-11-16', 'MHCBCDN01.BU9');
INSERT INTO `subimages` VALUES (1008, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nau_noi_that_moho_ubeda__36__4d2fdd75525742f68ecc2bdb2cae0466_master.jpg', '2024-11-16', 'MHCBCDN01.BU9');
INSERT INTO `subimages` VALUES (1009, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nau_noi_that_moho_ubeda__38__c1f7c9b8449548c894389c52ddebe872_master.jpg', '2024-11-16', 'MHCBCDN01.BU9');
INSERT INTO `subimages` VALUES (1010, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__2__ab3fc9ded04c4f5b8840dfdcd23af42f_master.jpg', '2024-11-16', 'MHCBCD801.BG1');
INSERT INTO `subimages` VALUES (1011, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__2__ab3fc9ded04c4f5b8840dfdcd23af42f.jpg', '2024-11-16', 'MHCBCD801.BG1');
INSERT INTO `subimages` VALUES (1012, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__2__ab3fc9ded04c4f5b8840dfdcd23af42f_master.jpg', '2024-11-16', 'MHCBCD801.BG1');
INSERT INTO `subimages` VALUES (1013, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__15__e54c81a994cb4434810bf9d1f7d6c933_master.jpg', '2024-11-16', 'MHCBCD801.BG1');
INSERT INTO `subimages` VALUES (1014, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__8__3caec940dbd64242b6d470f136a8b9b6_master.jpg', '2024-11-16', 'MHCBCD801.BG1');
INSERT INTO `subimages` VALUES (1015, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__8__3caec940dbd64242b6d470f136a8b9b6_master.jpg', '2024-11-16', 'MHCBCD801.BG1');
INSERT INTO `subimages` VALUES (1016, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__37__1db4911941ad4bd09bcfa3667bfca6a0_master.jpg', '2024-11-16', 'MHCBCD801.BG1');
INSERT INTO `subimages` VALUES (1017, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nau_noi_that_moho_ubeda__31__fe9f7cec37344929bdbbc89314a13247_master.jpg', '2024-11-16', 'MHCBCDN01.BU7');
INSERT INTO `subimages` VALUES (1018, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nau_noi_that_moho_ubeda__31__fe9f7cec37344929bdbbc89314a13247.jpg', '2024-11-16', 'MHCBCDN01.BU7');
INSERT INTO `subimages` VALUES (1019, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nau_noi_that_moho_ubeda__30__f597341d283043aa8d44c1a845d6e965_master.jpg', '2024-11-16', 'MHCBCDN01.BU7');
INSERT INTO `subimages` VALUES (1020, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nau_noi_that_moho_ubeda__10__c971160d10664cfa9be0903544ce00fa_master.jpg', '2024-11-16', 'MHCBCDN01.BU7');
INSERT INTO `subimages` VALUES (1021, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nau_noi_that_moho_ubeda__34__9e171f71bd3f44b9a3e258d7334d6338_master.jpg', '2024-11-16', 'MHCBCDN01.BU7');
INSERT INTO `subimages` VALUES (1022, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nau_noi_that_moho_ubeda__34__9e171f71bd3f44b9a3e258d7334d6338_master.jpg', '2024-11-16', 'MHCBCDN01.BU7');
INSERT INTO `subimages` VALUES (1023, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_nau_noi_that_moho_ubeda__9__0496ca12f5ad48548beba9e08e7773ab_master.jpg', '2024-11-16', 'MHCBCDN01.BU7');
INSERT INTO `subimages` VALUES (1024, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__7__69d231891277473fbe532e1af7244cbb_master.jpg', '2024-11-16', 'MHCBCD801.BG2');
INSERT INTO `subimages` VALUES (1025, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__7__69d231891277473fbe532e1af7244cbb.jpg', '2024-11-16', 'MHCBCD801.BG2');
INSERT INTO `subimages` VALUES (1026, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__9__8655792041d844a8b588bc00727622c4_master.jpg', '2024-11-16', 'MHCBCD801.BG2');
INSERT INTO `subimages` VALUES (1027, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__43__676bcbc6c9f1460da9d2dc080291909b_master.jpg', '2024-11-16', 'MHCBCD801.BG2');
INSERT INTO `subimages` VALUES (1028, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__46__16bb325ac4654c8e8b59388e75d70387_master.jpg', '2024-11-16', 'MHCBCD801.BG2');
INSERT INTO `subimages` VALUES (1029, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__46__16bb325ac4654c8e8b59388e75d70387_master.jpg', '2024-11-16', 'MHCBCD801.BG2');
INSERT INTO `subimages` VALUES (1030, 'https://product.hstatic.net/200000065946/product/pro_mau_nau_noi_that_grenaa_moho__10__5b49d4e8eb204196ad3c701bf749f55c_master.jpg', '2024-11-16', 'MHCBCD801.BG2');
INSERT INTO `subimages` VALUES (1031, 'https://product.hstatic.net/200000065946/product/pro_xanh_duong_noi_that_moho_ghe_sofa_go_leeds_6_9536e54d617047f294d531be8ad3e698_master.jpg', '2024-11-16', 'MFSNCC701.G20');
INSERT INTO `subimages` VALUES (1032, 'https://product.hstatic.net/200000065946/product/pro_xanh_duong_noi_that_moho_ghe_sofa_go_leeds_6_9536e54d617047f294d531be8ad3e698.jpg', '2024-11-16', 'MFSNCC701.G20');
INSERT INTO `subimages` VALUES (1033, 'https://product.hstatic.net/200000065946/product/pro_xanh_duong_noi_that_moho_ghe_sofa_go_leeds_5_817e0b06ec6a44b0aad431223d348d46_master.jpg', '2024-11-16', 'MFSNCC701.G20');
INSERT INTO `subimages` VALUES (1034, 'https://product.hstatic.net/200000065946/product/pro_xanh_duong_noi_that_moho_ghe_sofa_go_leeds_7_12a24c9d0d2f4120a6de19632ac14a34_master.jpg', '2024-11-16', 'MFSNCC701.G20');
INSERT INTO `subimages` VALUES (1035, 'https://product.hstatic.net/200000065946/product/pro_xanh_duong_noi_that_moho_ghe_sofa_go_leeds_1_908f7c074ebe4b078edfc45b49832f1c_master.jpg', '2024-11-16', 'MFSNCC701.G20');
INSERT INTO `subimages` VALUES (1036, 'https://product.hstatic.net/200000065946/product/pro_xanh_duong_noi_that_moho_ghe_sofa_go_leeds_1_908f7c074ebe4b078edfc45b49832f1c_master.jpg', '2024-11-16', 'MFSNCC701.G20');
INSERT INTO `subimages` VALUES (1037, 'https://product.hstatic.net/200000065946/product/pro_xanh_duong_noi_that_moho_ghe_sofa_go_leeds_3_e52b0764118d487c8adb4e7b26a9321b_master.jpg', '2024-11-16', 'MFSNCC701.G20');
INSERT INTO `subimages` VALUES (1038, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ghe_sofa_go_tromso_ce35d6cbc3934c5788dc15cabb66d715_master.jpg', '2024-11-16', 'MFSNCB901.C19');
INSERT INTO `subimages` VALUES (1039, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ghe_sofa_go_tromso_1_d90f93dcf6b7455ebfb65ed96cf3eb91_master.jpg', '2024-11-16', 'MFSNCB901.C19');
INSERT INTO `subimages` VALUES (1040, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ghe_sofa_go_tromso_2_ea4a0c5e10d340fcbb5e1bd49fcebabb_master.jpg', '2024-11-16', 'MFSNCB901.C19');
INSERT INTO `subimages` VALUES (1041, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ghe_sofa_go_tromso_3_135625d3ea54421d9987a8b1f3fffe44_master.jpg', '2024-11-16', 'MFSNCB901.C19');
INSERT INTO `subimages` VALUES (1042, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ghe_sofa_go_tromso_3_135625d3ea54421d9987a8b1f3fffe44_master.jpg', '2024-11-16', 'MFSNCB901.C19');
INSERT INTO `subimages` VALUES (1043, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ghe_sofa_go_tromso_5_ef845ea75d60453cb80bc9cfcdde6a8e_master.jpg', '2024-11-16', 'MFSNCB901.C19');
INSERT INTO `subimages` VALUES (1044, 'https://product.hstatic.net/200000065946/product/pro_ghe_don_vai_boc_3_mau_1_b2ebfed5b31a4e0a9c22f735eee582b8_master.jpg', '2024-11-16', 'MFFSSBOSTON355.06');
INSERT INTO `subimages` VALUES (1045, 'https://product.hstatic.net/200000065946/product/pro_ghe_don_vai_boc_3_mau_1_b2ebfed5b31a4e0a9c22f735eee582b8.jpg', '2024-11-16', 'MFFSSBOSTON355.06');
INSERT INTO `subimages` VALUES (1046, 'https://product.hstatic.net/200000065946/product/pro_ghe_don_vai_boc_3_mau_2_2a66c83e600749e79e8820192faf1147.jpg', '2024-11-16', 'MFFSSBOSTON355.06');
INSERT INTO `subimages` VALUES (1047, 'https://product.hstatic.net/200000065946/product/pro_ghe_don_vai_boc_3_mau_1_79262a9a8d484ef3abe91411b84ea6fe_master.jpg', '2024-11-16', 'MFFSSBELFAST43.06');
INSERT INTO `subimages` VALUES (1048, 'https://product.hstatic.net/200000065946/product/pro_ghe_don_vai_boc_3_mau_1_79262a9a8d484ef3abe91411b84ea6fe.jpg', '2024-11-16', 'MFFSSBELFAST43.06');
INSERT INTO `subimages` VALUES (1049, 'https://product.hstatic.net/200000065946/product/pro_ghe_don_vai_boc_3_mau_2_b3d75ff35bbc46f8991f4397303a0e48.jpg', '2024-11-16', 'MFFSSBELFAST43.06');
INSERT INTO `subimages` VALUES (1050, 'https://product.hstatic.net/200000065946/product/pro_ghe_don_vai_boc_3_mau_1_5d08ee598cb34da083e09a66575b1627_master.jpg', '2024-11-16', 'MFFSSLENA102.06');
INSERT INTO `subimages` VALUES (1051, 'https://product.hstatic.net/200000065946/product/pro_ghe_don_vai_boc_3_mau_1_5d08ee598cb34da083e09a66575b1627.jpg', '2024-11-16', 'MFFSSLENA102.06');
INSERT INTO `subimages` VALUES (1052, 'https://product.hstatic.net/200000065946/product/pro_ghe_don_vai_boc_3_mau_2_a315393a570e4ea5aa902bedf28e94c1.jpg', '2024-11-16', 'MFFSSLENA102.06');
INSERT INTO `subimages` VALUES (1053, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_don_sofa_fyn_601_1_243f8562383e401a85e59987eb24bac1_master.jpg', '2024-11-16', 'MFSSCC201.N06');
INSERT INTO `subimages` VALUES (1054, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_don_sofa_fyn_601_2_0a0b07924c37491ea91f531e4293023a_master.jpg', '2024-11-16', 'MFSSCC201.N06');
INSERT INTO `subimages` VALUES (1055, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_don_sofa_fyn_601_3_2133fcb45deb4a5a8c357ce3db314a5d_master.jpg', '2024-11-16', 'MFSSCC201.N06');
INSERT INTO `subimages` VALUES (1056, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_don_sofa_fyn_601_4_b7d775230def450eb7bac9f44780f1a6_master.jpg', '2024-11-16', 'MFSSCC201.N06');
INSERT INTO `subimages` VALUES (1057, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_don_sofa_fyn_601_4_b7d775230def450eb7bac9f44780f1a6_master.jpg', '2024-11-16', 'MFSSCC201.N06');
INSERT INTO `subimages` VALUES (1058, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_don_sofa_fyn_601_6_20359d3b396245d3b6ea9c24cfb505a0_master.jpg', '2024-11-16', 'MFSSCC201.N06');
INSERT INTO `subimages` VALUES (1059, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_tra_sofa_go_hobro_7_f7a5a581bd4643dda8f6f8535a730644_master.jpg', '2024-11-16', 'MFSTCC902.B08');
INSERT INTO `subimages` VALUES (1060, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_tra_sofa_go_hobro_6_3a169323e00041cbb1625d1f7fb9e4e2_master.jpg', '2024-11-16', 'MFSTCC902.B08');
INSERT INTO `subimages` VALUES (1061, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_tra_sofa_go_hobro_1_294ea6c967ff49d09479c9176c0bd96a_master.jpg', '2024-11-16', 'MFSTCC902.B08');
INSERT INTO `subimages` VALUES (1062, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_tra_sofa_go_hobro_2_53a0d4cf250e423f807396bdb481a1c1_master.jpg', '2024-11-16', 'MFSTCC902.B08');
INSERT INTO `subimages` VALUES (1063, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_tra_sofa_go_hobro_2_53a0d4cf250e423f807396bdb481a1c1_master.jpg', '2024-11-16', 'MFSTCC902.B08');
INSERT INTO `subimages` VALUES (1064, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_tra_sofa_go_hobro_4_8b41fc83e9f240c7af0f2d4b63b3099b_master.jpg', '2024-11-16', 'MFSTCC902.B08');
INSERT INTO `subimages` VALUES (1065, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_lam_viec_go_fyn_nau2_f607075e46254fc190dfabcd5108f91c_master.jpg', '2024-11-16', 'MFNKCC801.B12');
INSERT INTO `subimages` VALUES (1066, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_lam_viec_go_fyn_nau1_61d8be0aebc64b6e923da493f2dd5358_master.jpg', '2024-11-16', 'MFNKCC801.B12');
INSERT INTO `subimages` VALUES (1067, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_lam_viec_go_fyn_2_86bb6ecf2f4b4045b54b6cec911b6ac8_master.jpg', '2024-11-16', 'MFNKCC801.B12');
INSERT INTO `subimages` VALUES (1068, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_lam_viec_go_fyn_3_737ddfb5021a40628b743f280b60143b_master.jpg', '2024-11-16', 'MFNKCC801.B12');
INSERT INTO `subimages` VALUES (1069, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_lam_viec_go_fyn_3_737ddfb5021a40628b743f280b60143b_master.jpg', '2024-11-16', 'MFNKCC801.B12');
INSERT INTO `subimages` VALUES (1070, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_lam_viec_go_fyn_5_28e800aa5bed4f5294ce95afac273cb1_master.jpg', '2024-11-16', 'MFNKCC801.B12');
INSERT INTO `subimages` VALUES (1071, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ban_lam_viec_go_fyn_1_363104d4c8da475394e683e556879f88_master.jpg', '2024-11-16', 'MFNKCC802.N12');
INSERT INTO `subimages` VALUES (1072, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ban_lam_viec_go_fyn_f86f575539af422dba2c59782de45091_master.jpg', '2024-11-16', 'MFNKCC802.N12');
INSERT INTO `subimages` VALUES (1073, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ban_hoc_lam_viec_go_fyn_3_9946253edf0845c1a44c19a5a66ede9e_master.jpg', '2024-11-16', 'MFNKCC802.N12');
INSERT INTO `subimages` VALUES (1074, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ban_hoc_lam_viec_go_fyn_4_5cea45ae373849528064a4db9ed175ea_master.jpg', '2024-11-16', 'MFNKCC802.N12');
INSERT INTO `subimages` VALUES (1075, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ban_hoc_lam_viec_go_fyn_4_5cea45ae373849528064a4db9ed175ea_master.jpg', '2024-11-16', 'MFNKCC802.N12');
INSERT INTO `subimages` VALUES (1076, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ban_hoc_lam_viec_go_fyn_6_be35e2a7ae14420fb6ec6f1b6a59f7d0_master.jpg', '2024-11-16', 'MFNKCC802.N12');
INSERT INTO `subimages` VALUES (1077, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_noi_that_moho_tu_ke_tivi_go_odense_1_7e38c3d35dd0414f8d9172e3f0f1f1bf_master.png', '2024-11-16', 'MFTCCBN01.B16');
INSERT INTO `subimages` VALUES (1078, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_noi_that_moho_tu_ke_tivi_go_odense_1_7e38c3d35dd0414f8d9172e3f0f1f1bf.png', '2024-11-16', 'MFTCCBN01.B16');
INSERT INTO `subimages` VALUES (1079, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_noi_that_moho_tu_ke_tivi_go_odense_2_c0257818a72e44099520e1f093a70c26_master.png', '2024-11-16', 'MFTCCBN01.B16');
INSERT INTO `subimages` VALUES (1080, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_noi_that_moho_tu_ke_tivi_go_odense_3_c97d51088c904538996fdaaa23579390_master.png', '2024-11-16', 'MFTCCBN01.B16');
INSERT INTO `subimages` VALUES (1081, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_noi_that_moho_tu_ke_tivi_go_odense_4_9e7be186505a4bc98fa17f244985f680_master.png', '2024-11-16', 'MFTCCBN01.B16');
INSERT INTO `subimages` VALUES (1082, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_noi_that_moho_tu_ke_tivi_go_odense_4_9e7be186505a4bc98fa17f244985f680_master.png', '2024-11-16', 'MFTCCBN01.B16');
INSERT INTO `subimages` VALUES (1083, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_noi_that_moho_tu_ke_tivi_go_odense_6_4593840cd2964d228d6387bff6331108_master.png', '2024-11-16', 'MFTCCBN01.B16');
INSERT INTO `subimages` VALUES (1084, 'https://product.hstatic.net/200000065946/product/pro_go_phoi_den_noi_that_moho_tu_ke_tivi_leeds_10_e5384e8867ae4bda83d67fb678a411f6_master.jpg', '2024-11-16', 'MFTCCB701.M18');
INSERT INTO `subimages` VALUES (1085, 'https://product.hstatic.net/200000065946/product/pro_go_phoi_den_noi_that_moho_tu_ke_tivi_leeds_9_ed9d8553fc44496682fd4365673067c2_master.jpg', '2024-11-16', 'MFTCCB701.M18');
INSERT INTO `subimages` VALUES (1086, 'https://product.hstatic.net/200000065946/product/pro_go_phoi_den_noi_that_moho_tu_ke_tivi_leeds_4_f005d7d543094ae69e368bf87fd4598f_master.jpg', '2024-11-16', 'MFTCCB701.M18');
INSERT INTO `subimages` VALUES (1087, 'https://product.hstatic.net/200000065946/product/pro_go_phoi_den_noi_that_moho_tu_ke_tivi_leeds_8_877a643ae93f4c65ac9840822a7d02f0_master.jpg', '2024-11-16', 'MFTCCB701.M18');
INSERT INTO `subimages` VALUES (1088, 'https://product.hstatic.net/200000065946/product/pro_go_phoi_den_noi_that_moho_tu_ke_tivi_leeds_8_877a643ae93f4c65ac9840822a7d02f0_master.jpg', '2024-11-16', 'MFTCCB701.M18');
INSERT INTO `subimages` VALUES (1089, 'https://product.hstatic.net/200000065946/product/pro_go_phoi_den_noi_that_moho_tu_ke_tivi_leeds_6_850daef0b75e420fac9941dc4f86bdde_master.jpg', '2024-11-16', 'MFTCCB701.M18');
INSERT INTO `subimages` VALUES (1090, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an_go_viborg_trang_4_93618cecb359466b921c59512df27192_master.jpg', '2024-11-16', 'MFDCCCN01.G04');
INSERT INTO `subimages` VALUES (1091, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an_go_viborg_trang_4_93618cecb359466b921c59512df27192.jpg', '2024-11-16', 'MFDCCCN01.G04');
INSERT INTO `subimages` VALUES (1092, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an_go_viborg_trang_3_32a885ac39c64798828f82ee407eac6b.jpg', '2024-11-16', 'MFDCCCN01.G04');
INSERT INTO `subimages` VALUES (1093, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an_go_viborg_trang_4_93618cecb359466b921c59512df27192.jpg', '2024-11-16', 'MFDCCCN01.G04');
INSERT INTO `subimages` VALUES (1094, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an_go_viborg_trang_5_ee0a8f40ceee4da79a4001de38afcd2b.jpg', '2024-11-16', 'MFDCCCN01.G04');
INSERT INTO `subimages` VALUES (1095, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an_go_viborg_trang_5_ee0a8f40ceee4da79a4001de38afcd2b.jpg', '2024-11-16', 'MFDCCCN01.G04');
INSERT INTO `subimages` VALUES (1096, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_noi_that_moho_ban_an_go_cao_su_odense_6_aaa7b6c7cc964c3c8cdeea305bb8f692_master.jpg', '2024-11-16', 'MFDTCBN01.B16');
INSERT INTO `subimages` VALUES (1097, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_noi_that_moho_ban_an_go_cao_su_odense_6_aaa7b6c7cc964c3c8cdeea305bb8f692.jpg', '2024-11-16', 'MFDTCBN01.B16');
INSERT INTO `subimages` VALUES (1098, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_giuong_ngu_go_hobro__6_637a70c78a7849b5a7f716007cee1f1f_master.jpg', '2024-11-16', 'MFBNCC901.N16');
INSERT INTO `subimages` VALUES (1099, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_giuong_ngu_go_hobro__6_637a70c78a7849b5a7f716007cee1f1f.jpg', '2024-11-16', 'MFBNCC901.N16');
INSERT INTO `subimages` VALUES (1100, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_giuong_ngu_go_hobro_1_4b103e3be16f4e5ba722ae53df0559bd.jpg', '2024-11-16', 'MFBNCC901.N16');
INSERT INTO `subimages` VALUES (1101, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_giuong_ngu_go_hobro__2_a71402c82872406ebc2d00c77bc7218f.jpg', '2024-11-16', 'MFBNCC901.N16');
INSERT INTO `subimages` VALUES (1102, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_giuong_ngu_go_hobro__4_bf0a9bcd92ab45e59b74cd78e15de426.jpg', '2024-11-16', 'MFBNCC901.N16');
INSERT INTO `subimages` VALUES (1103, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_giuong_ngu_go_hobro__4_bf0a9bcd92ab45e59b74cd78e15de426.jpg', '2024-11-16', 'MFBNCC901.N16');
INSERT INTO `subimages` VALUES (1104, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_giuong_ngu_go_hobro__7_df1aeb1336474c0e9827545745cee395.jpg', '2024-11-16', 'MFBNCC901.N16');
INSERT INTO `subimages` VALUES (1105, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_3_canh_1m5_c638686e30974318a0489748bdb3888e_master.jpg', '2024-11-16', 'MFWRHB301V2.BMS');
INSERT INTO `subimages` VALUES (1106, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_3_canh_1m5_a_5996a9fb3994489e8a08aea1ef8a5a4d_master.jpg', '2024-11-16', 'MFWRHB301V2.BMS');
INSERT INTO `subimages` VALUES (1107, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_3_canh_1m5_27_1f92276318144a3d9ef1fd8d5d3f8244_master.png', '2024-11-16', 'MFWRHB301V2.BMS');
INSERT INTO `subimages` VALUES (1108, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_3_canh_1m5_28_24bec33c133a4ff19f0d93af9259dd69_master.png', '2024-11-16', 'MFWRHB301V2.BMS');
INSERT INTO `subimages` VALUES (1109, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_3_canh_1m5_28_24bec33c133a4ff19f0d93af9259dd69_master.png', '2024-11-16', 'MFWRHB301V2.BMS');
INSERT INTO `subimages` VALUES (1110, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_5_603d608f046f46f582d4ab6262eedca5_master.png', '2024-11-16', 'MFWRHB301V2.BMS');
INSERT INTO `subimages` VALUES (1111, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_3_canh_1m5_8_3219fa946ce34d74ba14e9f30a277c74_master.png', '2024-11-16', 'MFWRHB301V2.BMH');
INSERT INTO `subimages` VALUES (1112, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_3_canh_1m5_8_3219fa946ce34d74ba14e9f30a277c74.png', '2024-11-16', 'MFWRHB301V2.BMH');
INSERT INTO `subimages` VALUES (1113, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_3_canh_1m5_8_013590c358894b6f94dac07106084306_master.png', '2024-11-16', 'MFWRHB301V2.BMH');
INSERT INTO `subimages` VALUES (1114, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_3_canh_1m5_9_18b5663dd9ee4fcc8e9138edf6232f1d_master.png', '2024-11-16', 'MFWRHB301V2.BMH');
INSERT INTO `subimages` VALUES (1115, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_3_canh_1m5_10_c018f1530c6c4a23b67104e855469c6f_master.png', '2024-11-16', 'MFWRHB301V2.BMH');
INSERT INTO `subimages` VALUES (1116, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_3_canh_1m5_10_c018f1530c6c4a23b67104e855469c6f_master.png', '2024-11-16', 'MFWRHB301V2.BMH');
INSERT INTO `subimages` VALUES (1117, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_6_5e3c1bef8417465780997c51e17b0425_master.png', '2024-11-16', 'MFWRHB301V2.BMH');
INSERT INTO `subimages` VALUES (1118, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_4_canh_2m_2_de601cd722564fbcb1c72a4aa85de17f_master.png', '2024-11-16', 'MFWRHB301V2.BSMH');
INSERT INTO `subimages` VALUES (1119, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_4_canh_2m_2_de601cd722564fbcb1c72a4aa85de17f.png', '2024-11-16', 'MFWRHB301V2.BSMH');
INSERT INTO `subimages` VALUES (1120, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_4_canh_2m_3_f602af2bdfe045cb8b07ad9ea10e3fb5_master.png', '2024-11-16', 'MFWRHB301V2.BSMH');
INSERT INTO `subimages` VALUES (1121, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_4_canh_2m_45_6a823cfbe8eb406a98ebc077adf9c1a7_master.png', '2024-11-16', 'MFWRHB301V2.BSMH');
INSERT INTO `subimages` VALUES (1122, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_4_canh_2m_49_97fe689a8a354b7480f0a82d7b5509c5_master.png', '2024-11-16', 'MFWRHB301V2.BSMH');
INSERT INTO `subimages` VALUES (1123, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_4_canh_2m_49_97fe689a8a354b7480f0a82d7b5509c5_master.png', '2024-11-16', 'MFWRHB301V2.BSMH');
INSERT INTO `subimages` VALUES (1124, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_6_b4ddac8a77d54de5bc0727a6e76b8f46_master.png', '2024-11-16', 'MFWRHB301V2.BSMH');
INSERT INTO `subimages` VALUES (1125, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_2_canh_1m_20_2362be8605d8485b95efeffc54e3b447_master.png', '2024-11-16', 'MFWRHB301V2.BSH');
INSERT INTO `subimages` VALUES (1126, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_2_canh_1m_20_2362be8605d8485b95efeffc54e3b447.png', '2024-11-16', 'MFWRHB301V2.BSH');
INSERT INTO `subimages` VALUES (1127, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_2_canh_1m_20_e15ab1ff576d4343a6762c3c4c892f11_master.png', '2024-11-16', 'MFWRHB301V2.BSH');
INSERT INTO `subimages` VALUES (1128, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_2_canh_1m_21_32975d97fd6a4baabaef94c464d6cd3c_master.png', '2024-11-16', 'MFWRHB301V2.BSH');
INSERT INTO `subimages` VALUES (1129, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_2_canh_1m_22_97282ceacf314c4ba7a87d2a3adfb5f0_master.png', '2024-11-16', 'MFWRHB301V2.BSH');
INSERT INTO `subimages` VALUES (1130, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_2_canh_1m_22_97282ceacf314c4ba7a87d2a3adfb5f0_master.png', '2024-11-16', 'MFWRHB301V2.BSH');
INSERT INTO `subimages` VALUES (1131, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_2_canh_1m_61_22b24088b4124a4b98cb4a4704be3c19_master.png', '2024-11-16', 'MFWRHB301V2.BSH');
INSERT INTO `subimages` VALUES (1132, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_don_sofa_vline_xam_dam_6_41a605f93512456ca73ea40ba2036672_master.jpg', '2024-11-16', 'MFSCCC901.B14');
INSERT INTO `subimages` VALUES (1133, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_don_sofa_vline_xam_dam_6_41a605f93512456ca73ea40ba2036672.jpg', '2024-11-16', 'MFSCCC901.B14');
INSERT INTO `subimages` VALUES (1134, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_don_sofa_vline_xam_dam_1_2abf38e39fba48dcb2b67ff7a4b2d391.jpg', '2024-11-16', 'MFSCCC901.B14');
INSERT INTO `subimages` VALUES (1135, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_don_sofa_vline_xam_dam_2_d57df0b343b6437598fc12f7acf0619e.jpg', '2024-11-16', 'MFSCCC901.B14');
INSERT INTO `subimages` VALUES (1136, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_don_sofa_vline_xam_dam_3_8d1d554877a64da0a54b6685ee8f323b.jpg', '2024-11-16', 'MFSCCC901.B14');
INSERT INTO `subimages` VALUES (1137, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_don_sofa_vline_xam_dam_3_8d1d554877a64da0a54b6685ee8f323b.jpg', '2024-11-16', 'MFSCCC901.B14');
INSERT INTO `subimages` VALUES (1138, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_don_sofa_vline_xam_dam_5_49f357ea24914cba9a058f2ac0774513.jpg', '2024-11-16', 'MFSCCC901.B14');
INSERT INTO `subimages` VALUES (1139, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_noi_that_moho_ghe_an_go_cao_su_soro_3_3f906b4a6a10464ab0d060cf0f7f8c44_master.jpg', '2024-11-16', 'MFDCCC104.O05');
INSERT INTO `subimages` VALUES (1140, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_noi_that_moho_ghe_an_go_cao_su_soro_3_3f906b4a6a10464ab0d060cf0f7f8c44.jpg', '2024-11-16', 'MFDCCC104.O05');
INSERT INTO `subimages` VALUES (1141, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_noi_that_moho_ghe_an_go_cao_su_soro_2_18fee1f9450e4ac6b563164e20002b48.jpg', '2024-11-16', 'MFDCCC104.O05');
INSERT INTO `subimages` VALUES (1142, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_noi_that_moho_ghe_an_go_cao_su_soro_3_3f906b4a6a10464ab0d060cf0f7f8c44.jpg', '2024-11-16', 'MFDCCC104.O05');
INSERT INTO `subimages` VALUES (1143, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_noi_that_moho_ghe_an_go_cao_su_soro_4_ab69012023cd427398a3512e81c03faa.jpg', '2024-11-16', 'MFDCCC104.O05');
INSERT INTO `subimages` VALUES (1144, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_noi_that_moho_ghe_an_go_cao_su_soro_4_ab69012023cd427398a3512e81c03faa.jpg', '2024-11-16', 'MFDCCC104.O05');
INSERT INTO `subimages` VALUES (1145, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_noi_that_moho_ghe_an_go_cao_su_soro_6_370c64c84f574a95aef0b3ce6c850470.jpg', '2024-11-16', 'MFDCCC104.O05');
INSERT INTO `subimages` VALUES (1146, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_ghe_an_go_cao_su_tu_nhien_nexo_5_a10820a942574046a91a635e7da4cbdd_master.jpg', '2024-11-16', 'MFDCCC103.O05');
INSERT INTO `subimages` VALUES (1147, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_ghe_an_go_cao_su_tu_nhien_nexo_5_a10820a942574046a91a635e7da4cbdd.jpg', '2024-11-16', 'MFDCCC103.O05');
INSERT INTO `subimages` VALUES (1148, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_ghe_an_go_cao_su_tu_nhien_nexo_1_ba9eee9c0c514b3a93d513dfab7d3f6a.jpg', '2024-11-16', 'MFDCCC103.O05');
INSERT INTO `subimages` VALUES (1149, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_ghe_an_go_cao_su_tu_nhien_nexo_2_bf8298c06833420ab72ad473737d0590.jpg', '2024-11-16', 'MFDCCC103.O05');
INSERT INTO `subimages` VALUES (1150, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_ghe_an_go_cao_su_tu_nhien_nexo_3_1f3e5921b41c4c6fbd5233a3f59828b7.jpg', '2024-11-16', 'MFDCCC103.O05');
INSERT INTO `subimages` VALUES (1151, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_ghe_an_go_cao_su_tu_nhien_nexo_3_1f3e5921b41c4c6fbd5233a3f59828b7.jpg', '2024-11-16', 'MFDCCC103.O05');
INSERT INTO `subimages` VALUES (1152, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_ghe_an_go_cao_su_tu_nhien_nexo_6_5b1bb7f03e2743cebe42b686aa354331.jpg', '2024-11-16', 'MFDCCC103.O05');
INSERT INTO `subimages` VALUES (1153, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_go_dalumd_1m6_a_fd3289aaa60f48cd966c3893154a63f4_master.jpg', '2024-11-16', 'MFBNCC601.A16');
INSERT INTO `subimages` VALUES (1154, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_go_dalumd_1m6_fd6d2e0095f5447ea30724220780837a.jpg', '2024-11-16', 'MFBNCC601.A16');
INSERT INTO `subimages` VALUES (1155, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_go_dalumd_1m6_3_a215052d88424cc8a8b03be635354d21.jpg', '2024-11-16', 'MFBNCC601.A16');
INSERT INTO `subimages` VALUES (1156, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_go_dalumd_1m6_5_08de7909a400431aa5804a3aed7dc427.jpg', '2024-11-16', 'MFBNCC601.A16');
INSERT INTO `subimages` VALUES (1157, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_go_dalumd_1m6_5_08de7909a400431aa5804a3aed7dc427.jpg', '2024-11-16', 'MFBNCC601.A16');
INSERT INTO `subimages` VALUES (1158, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_go_dalumd_1m6_8_6803a8b0a08948f5904f6dada7f20fc9.jpg', '2024-11-16', 'MFBNCC601.A16');
INSERT INTO `subimages` VALUES (1159, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_2_canh_1m_a_99e290973a194592b576364340a288e5_master.jpg', '2024-11-16', 'MFWRCD701.B10');
INSERT INTO `subimages` VALUES (1160, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_2_canh_1m_a4dccb3220af4100a53e393846469f7e_master.jpg', '2024-11-16', 'MFWRCD701.B10');
INSERT INTO `subimages` VALUES (1161, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_2_canh_1m_62_cc2c2c0ccaeb44079acc962cd15e95fe_master.png', '2024-11-16', 'MFWRCD701.B10');
INSERT INTO `subimages` VALUES (1162, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_2_canh_1m_23_7011e8fdefbb48d6aae7612ad30a7454_master.png', '2024-11-16', 'MFWRCD701.B10');
INSERT INTO `subimages` VALUES (1163, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_2_canh_1m_23_7011e8fdefbb48d6aae7612ad30a7454_master.png', '2024-11-16', 'MFWRCD701.B10');
INSERT INTO `subimages` VALUES (1164, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_38_ec029a60bdd04b30b76c30652704d993_master.png', '2024-11-16', 'MFWRCD701.B10');
INSERT INTO `subimages` VALUES (1165, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_thanh_treo_16_112ad0bbab8e4811a2b9abf837d27e72_master.png', '2024-11-16', 'MFWRCD703.B05');
INSERT INTO `subimages` VALUES (1166, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_thanh_treo_16_112ad0bbab8e4811a2b9abf837d27e72.png', '2024-11-16', 'MFWRCD703.B05');
INSERT INTO `subimages` VALUES (1167, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_thanh_treo_14_41b44747afb4424fb69ef81757a680a1_master.png', '2024-11-16', 'MFWRCD703.B05');
INSERT INTO `subimages` VALUES (1168, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_thanh_treo_17_03a20fe46c34497da300722216415f0f_master.png', '2024-11-16', 'MFWRCD703.B05');
INSERT INTO `subimages` VALUES (1169, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_thanh_treo_18_e4fadb3ca7be4a2b9d64748ffd7006d3_master.png', '2024-11-16', 'MFWRCD703.B05');
INSERT INTO `subimages` VALUES (1170, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_thanh_treo_18_e4fadb3ca7be4a2b9d64748ffd7006d3_master.png', '2024-11-16', 'MFWRCD703.B05');
INSERT INTO `subimages` VALUES (1171, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_thanh_treo_58_1109a3947b284469851e397800298c97_master.png', '2024-11-16', 'MFWRCD703.B05');
INSERT INTO `subimages` VALUES (1172, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_ngan_ke_57_c69356d22fd44bbc9cbf71bb95d3ccf4_master.png', '2024-11-16', 'MFWRCD702.B05');
INSERT INTO `subimages` VALUES (1173, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_ngan_ke_57_c69356d22fd44bbc9cbf71bb95d3ccf4.png', '2024-11-16', 'MFWRCD702.B05');
INSERT INTO `subimages` VALUES (1174, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_39_5d7a2d8698c94509abcc99930bc80518_master.png', '2024-11-16', 'MFWRCD702.B05');
INSERT INTO `subimages` VALUES (1175, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_ngan_ke_56_5a5f1a293f90493ea963c2a946391d2c_master.png', '2024-11-16', 'MFWRCD702.B05');
INSERT INTO `subimages` VALUES (1176, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_42_1859a35e5ccb4c24a6ed3b46f863c041_master.png', '2024-11-16', 'MFWRCD702.B05');
INSERT INTO `subimages` VALUES (1177, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_42_1859a35e5ccb4c24a6ed3b46f863c041_master.png', '2024-11-16', 'MFWRCD702.B05');
INSERT INTO `subimages` VALUES (1178, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_quan_ao_hobro_thanh_treo_58_1e264fbc5d384418b7e17a0dae9df9f7_master.png', '2024-11-16', 'MFWRCD702.B05');
INSERT INTO `subimages` VALUES (1179, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ban_an_go_moss_1m6_8_4fff91ec81cc48a4b2a90297534d12d4_master.jpg', '2024-11-16', 'MFDTCC802.N14');
INSERT INTO `subimages` VALUES (1180, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ban_an_go_moss_1m6_8_4fff91ec81cc48a4b2a90297534d12d4.jpg', '2024-11-16', 'MFDTCC802.N14');
INSERT INTO `subimages` VALUES (1181, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_ke_tivi_kolding_1_e504bddf2c8e41799626f1569d7f9a9a_master.jpg', '2024-11-16', 'MFTCCC702.K16');
INSERT INTO `subimages` VALUES (1182, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_ke_tivi_kolding_1_e504bddf2c8e41799626f1569d7f9a9a.jpg', '2024-11-16', 'MFTCCC702.K16');
INSERT INTO `subimages` VALUES (1183, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_ke_tivi_kolding_6_0e75dff18d2a4d2b86e97fced820f44c_master.jpg', '2024-11-16', 'MFTCCC702.K16');
INSERT INTO `subimages` VALUES (1184, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_ke_tivi_kolding_7_c630de7f7cc94125aed09c2a2ad3ec2e_master.jpg', '2024-11-16', 'MFTCCC702.K16');
INSERT INTO `subimages` VALUES (1185, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_ke_tivi_kolding_8_197f93276a4b4cd385f13f83cc0969ef_master.jpg', '2024-11-16', 'MFTCCC702.K16');
INSERT INTO `subimages` VALUES (1186, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_ke_tivi_kolding_8_197f93276a4b4cd385f13f83cc0969ef_master.jpg', '2024-11-16', 'MFTCCC702.K16');
INSERT INTO `subimages` VALUES (1187, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_ke_tivi_kolding_2_0fd3c552534a4b26951b5f9cd82265d8_master.jpg', '2024-11-16', 'MFTCCC702.K16');
INSERT INTO `subimages` VALUES (1188, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_go_hobro_4_0495ddbc14184b4cae586b82d6eb30af_master.jpg', '2024-11-16', 'MFBSCBD01.B06');
INSERT INTO `subimages` VALUES (1189, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_go_hobro_4_0495ddbc14184b4cae586b82d6eb30af.jpg', '2024-11-16', 'MFBSCBD01.B06');
INSERT INTO `subimages` VALUES (1190, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_go_hobro_4_0495ddbc14184b4cae586b82d6eb30af_master.jpg', '2024-11-16', 'MFBSCBD01.B06');
INSERT INTO `subimages` VALUES (1191, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_go_hobro_5_b0b289f0f36a43c5b7a699828d2864c5_master.jpg', '2024-11-16', 'MFBSCBD01.B06');
INSERT INTO `subimages` VALUES (1192, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_go_hobro_7_0546e7c3b5f14f84968d9d8a3cc0812c_master.jpg', '2024-11-16', 'MFBSCBD01.B06');
INSERT INTO `subimages` VALUES (1193, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_go_hobro_7_0546e7c3b5f14f84968d9d8a3cc0812c_master.jpg', '2024-11-16', 'MFBSCBD01.B06');
INSERT INTO `subimages` VALUES (1194, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_go_hobro_11_ba80c956f01b4fce9e31515baa84318a_master.jpg', '2024-11-16', 'MFBNCBD01.B16');
INSERT INTO `subimages` VALUES (1195, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_go_hobro_11_ba80c956f01b4fce9e31515baa84318a.jpg', '2024-11-16', 'MFBNCBD01.B16');
INSERT INTO `subimages` VALUES (1196, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_go_hobro_ef1dcd9b065f4f579919b1f897acbf68.jpg', '2024-11-16', 'MFBNCBD01.B16');
INSERT INTO `subimages` VALUES (1197, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_go_hobro_8_f8ac799a5a054063ad8822d752244b3c.jpg', '2024-11-16', 'MFBNCBD01.B16');
INSERT INTO `subimages` VALUES (1198, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_go_hobro_6_f41aa7540d9648679780e4a89afd229c.jpg', '2024-11-16', 'MFBNCBD01.B16');
INSERT INTO `subimages` VALUES (1199, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_go_hobro_6_f41aa7540d9648679780e4a89afd229c.jpg', '2024-11-16', 'MFBNCBD01.B16');
INSERT INTO `subimages` VALUES (1200, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_go_hobro_13_696cd1ec193d407c8b3856e0538d5d0b.jpg', '2024-11-16', 'MFBNCBD01.B16');
INSERT INTO `subimages` VALUES (1201, 'https://product.hstatic.net/200000065946/product/o_ghe_an_go_cao_su_fyn__4__6f72ede2ef024d89b2643dd0d9b41e1f_master__1__d3dfd4f4f4bb438480e300a1c5146e79_master.jpg', '2024-11-16', 'MFDTSVLFYDC4.N16');
INSERT INTO `subimages` VALUES (1202, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_bo_ban_an_vline_4_ghe_malaga_2_2c32349c158346daab94bf66b1816061.jpg', '2024-11-16', 'MFDTSVLFYDC4.N16');
INSERT INTO `subimages` VALUES (1203, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_bo_ban_an_vline_4_ghe_oslo_2_09ffebe489e94b0ab72ffda00d4cdd09.jpg', '2024-11-16', 'MFDTSVLFYDC4.N16');
INSERT INTO `subimages` VALUES (1204, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_bo_ban_an_vline_4_ghe_verona_be_a33ff88e1c3040c4b3f3d60f92bb6144.jpg', '2024-11-16', 'MFDTSVLFYDC4.N16');
INSERT INTO `subimages` VALUES (1205, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_bo_ban_an_vline_4_ghe_verona_be_a33ff88e1c3040c4b3f3d60f92bb6144.jpg', '2024-11-16', 'MFDTSVLFYDC4.N16');
INSERT INTO `subimages` VALUES (1206, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_bo_ban_an_go_4_ghe_nexo_02992f6cb7a7407089a642002d6e1aa2.jpg', '2024-11-16', 'MFDTSVLFYDC4.N16');
INSERT INTO `subimages` VALUES (1207, 'https://product.hstatic.net/200000065946/product/pro_nau_ghe_don_sofa_vline_7_e059afd3419943ea8baeabeefa35a6e4_master.jpg', '2024-11-16', 'MFSSCB801.B06');
INSERT INTO `subimages` VALUES (1208, 'https://product.hstatic.net/200000065946/product/pro_nau_ghe_don_sofa_vline_7_e059afd3419943ea8baeabeefa35a6e4.jpg', '2024-11-16', 'MFSSCB801.B06');
INSERT INTO `subimages` VALUES (1209, 'https://product.hstatic.net/200000065946/product/pro_nau_ghe_don_sofa_vline_7_e059afd3419943ea8baeabeefa35a6e4.jpg', '2024-11-16', 'MFSSCB801.B06');
INSERT INTO `subimages` VALUES (1210, 'https://product.hstatic.net/200000065946/product/pro_nau_ghe_don_sofa_vline_1_9351e9bfa5cb48f39e6485e639c0bfb9.jpg', '2024-11-16', 'MFSSCB801.B06');
INSERT INTO `subimages` VALUES (1211, 'https://product.hstatic.net/200000065946/product/pro_nau_ghe_don_sofa_vline_2_ad65192f7bbc4cf28d4b376738efeaed.jpg', '2024-11-16', 'MFSSCB801.B06');
INSERT INTO `subimages` VALUES (1212, 'https://product.hstatic.net/200000065946/product/pro_nau_ghe_don_sofa_vline_2_ad65192f7bbc4cf28d4b376738efeaed.jpg', '2024-11-16', 'MFSSCB801.B06');
INSERT INTO `subimages` VALUES (1213, 'https://product.hstatic.net/200000065946/product/pro_nau_ghe_don_sofa_vline_5_81999692610a419f9b577de9bfe0ce70.jpg', '2024-11-16', 'MFSSCB801.B06');
INSERT INTO `subimages` VALUES (1214, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_an_go_vline_1_f5a35e91c4db456d9468f0a64b10115c_master.jpg', '2024-11-16', 'MFDTCC801.B16');
INSERT INTO `subimages` VALUES (1215, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_an_go_vline_2_e25a0e370c144da2a18bb88a9e949d86.jpg', '2024-11-16', 'MFDTCC801.B16');
INSERT INTO `subimages` VALUES (1216, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_an_go_vline_4_3a58061419d042de8de940f448d90dbc.jpg', '2024-11-16', 'MFDTCC801.B16');
INSERT INTO `subimages` VALUES (1217, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_an_go_vline_5_79f9266bc44749c596c57cdfb55eacb5.jpg', '2024-11-16', 'MFDTCC801.B16');
INSERT INTO `subimages` VALUES (1218, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_an_go_vline_5_79f9266bc44749c596c57cdfb55eacb5.jpg', '2024-11-16', 'MFDTCC801.B16');
INSERT INTO `subimages` VALUES (1219, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ban_an_vline_75cm_1_ef06469c20c543f0ad3e767cd5fbcd22.jpg', '2024-11-16', 'MFDTCC801.B16');
INSERT INTO `subimages` VALUES (1220, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_sofa_go_vline_1_4fd0cd2ed09a4e368d6324d884bfce99_master.jpg', '2024-11-16', 'MFSNCC801.N18');
INSERT INTO `subimages` VALUES (1221, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_sofa_go_vline_1_4fd0cd2ed09a4e368d6324d884bfce99.jpg', '2024-11-16', 'MFSNCC801.N18');
INSERT INTO `subimages` VALUES (1222, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_sofa_go_vline_2_d6099abe401c4426a4a23006333a4502_master.jpg', '2024-11-16', 'MFSNCC801.N18');
INSERT INTO `subimages` VALUES (1223, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_sofa_go_vline_3_817dfe1cdb604b489290bd084f8505c9_master.jpg', '2024-11-16', 'MFSNCC801.N18');
INSERT INTO `subimages` VALUES (1224, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_sofa_go_vline_4_cec18e30a70f4697bc43b1d699356dee_master.jpg', '2024-11-16', 'MFSNCC801.N18');
INSERT INTO `subimages` VALUES (1225, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_sofa_go_vline_4_cec18e30a70f4697bc43b1d699356dee_master.jpg', '2024-11-16', 'MFSNCC801.N18');
INSERT INTO `subimages` VALUES (1226, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_sofa_go_vline_6_2fc2d7f51a394483944fdd9ebe3780d5_master.jpg', '2024-11-16', 'MFSNCC801.N18');
INSERT INTO `subimages` VALUES (1227, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_sofa_go_tram_vline_1_07104f24cbc14a3c8450de236374eae4_master.jpg', '2024-11-16', 'MFSNCC801.B18');
INSERT INTO `subimages` VALUES (1228, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_sofa_go_tram_vline_1_07104f24cbc14a3c8450de236374eae4.jpg', '2024-11-16', 'MFSNCC801.B18');
INSERT INTO `subimages` VALUES (1229, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_sofa_go_tram_vline_2_a72ef51be62343d284527cba40d91ec0_master.jpg', '2024-11-16', 'MFSNCC801.B18');
INSERT INTO `subimages` VALUES (1230, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_sofa_go_tram_vline_3_7389fe2f44854683bb1ba2d940731ce1_master.jpg', '2024-11-16', 'MFSNCC801.B18');
INSERT INTO `subimages` VALUES (1231, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_sofa_go_tram_vline_4_c6d699d93f4542f08ff7c21a2004d806_master.jpg', '2024-11-16', 'MFSNCC801.B18');
INSERT INTO `subimages` VALUES (1232, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_sofa_go_tram_vline_4_c6d699d93f4542f08ff7c21a2004d806_master.jpg', '2024-11-16', 'MFSNCC801.B18');
INSERT INTO `subimages` VALUES (1233, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_sofa_go_tram_vline_6_1017d54bf90e4f6a95f65cb945524c9a_master.jpg', '2024-11-16', 'MFSNCC801.B18');
INSERT INTO `subimages` VALUES (1234, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_sofa_go_moss_7_aa9094ddb7cb47738f67a0db521f5c1a_master.jpg', '2024-11-16', 'MFSNCB701.N20');
INSERT INTO `subimages` VALUES (1235, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_sofa_go_moss_1_29e3b905f6914badb8332298088e9ef2_master.jpg', '2024-11-16', 'MFSNCB701.N20');
INSERT INTO `subimages` VALUES (1236, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_sofa_go_moss_2_ddf9f080f5c54fe9a81ad8f203bfc6f7_master.jpg', '2024-11-16', 'MFSNCB701.N20');
INSERT INTO `subimages` VALUES (1237, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_sofa_go_moss_3_fc8e7b1415334bb4bbac567452d1e70c_master.jpg', '2024-11-16', 'MFSNCB701.N20');
INSERT INTO `subimages` VALUES (1238, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_sofa_go_moss_3_fc8e7b1415334bb4bbac567452d1e70c_master.jpg', '2024-11-16', 'MFSNCB701.N20');
INSERT INTO `subimages` VALUES (1239, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_sofa_go_moss_5_08ed033f44954a3fa2ccbbfbc239b946_master.jpg', '2024-11-16', 'MFSNCB701.N20');
INSERT INTO `subimages` VALUES (1240, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_giay_vienna_204_1_e9d38e73e1b546e4b3884366bdc7d35b_master.jpg', '2024-11-16', 'MFSHCBD03.B08');
INSERT INTO `subimages` VALUES (1241, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_giay_vienna_204_1_e9d38e73e1b546e4b3884366bdc7d35b.jpg', '2024-11-16', 'MFSHCBD03.B08');
INSERT INTO `subimages` VALUES (1242, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_giay_vienna_204_3_66a09a64698444f0865a5aaaefbcf06c.jpg', '2024-11-16', 'MFSHCBD03.B08');
INSERT INTO `subimages` VALUES (1243, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_giay_vienna_204_2_f1ccc245523e41e08ebae3f8f3c2d00d.jpg', '2024-11-16', 'MFSHCBD03.B08');
INSERT INTO `subimages` VALUES (1244, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_giay_vienna_204_4_a32fc70c721b4e5581a7006a61e38d09.jpg', '2024-11-16', 'MFSHCBD03.B08');
INSERT INTO `subimages` VALUES (1245, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_giay_vienna_204_4_a32fc70c721b4e5581a7006a61e38d09.jpg', '2024-11-16', 'MFSHCBD03.B08');
INSERT INTO `subimages` VALUES (1246, 'https://product.hstatic.net/200000065946/product/pro_nau_phoi_trang_noi_that_moho_tu_giay_trang_tri_vienna_203_8_184027c233b84428bb37751d18a8d83a_master.jpg', '2024-11-16', 'MFSHCBD02.B08');
INSERT INTO `subimages` VALUES (1247, 'https://product.hstatic.net/200000065946/product/pro_nau_phoi_trang_noi_that_moho_tu_giay_trang_tri_vienna_203_8_184027c233b84428bb37751d18a8d83a.jpg', '2024-11-16', 'MFSHCBD02.B08');
INSERT INTO `subimages` VALUES (1248, 'https://product.hstatic.net/200000065946/product/pro_nau_phoi_trang_noi_that_moho_tu_giay_trang_tri_vienna_203_8_184027c233b84428bb37751d18a8d83a.jpg', '2024-11-16', 'MFSHCBD02.B08');
INSERT INTO `subimages` VALUES (1249, 'https://product.hstatic.net/200000065946/product/pro_nau_phoi_trang_noi_that_moho_tu_giay_trang_tri_vienna_203_9_444044d5e3d446078809274a73519503.jpg', '2024-11-16', 'MFSHCBD02.B08');
INSERT INTO `subimages` VALUES (1250, 'https://product.hstatic.net/200000065946/product/pro_nau_phoi_trang_noi_that_moho_tu_giay_trang_tri_vienna_203_2_15aa60cdb54f4835b7af551e790ef1d7.jpg', '2024-11-16', 'MFSHCBD02.B08');
INSERT INTO `subimages` VALUES (1251, 'https://product.hstatic.net/200000065946/product/pro_nau_phoi_trang_noi_that_moho_tu_giay_trang_tri_vienna_203_2_15aa60cdb54f4835b7af551e790ef1d7.jpg', '2024-11-16', 'MFSHCBD02.B08');
INSERT INTO `subimages` VALUES (1252, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_giay_trang_tri_vienna_202_8_9aa276314d3f40368bd1c0143bef6369_master.jpg', '2024-11-16', 'MFSHCBD01.N18');
INSERT INTO `subimages` VALUES (1253, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_giay_trang_tri_vienna_202_8_9aa276314d3f40368bd1c0143bef6369.jpg', '2024-11-16', 'MFSHCBD01.N18');
INSERT INTO `subimages` VALUES (1254, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_giay_trang_tri_vienna_202_9_42a290fbc1674f0f927180d0686a8683.jpg', '2024-11-16', 'MFSHCBD01.N18');
INSERT INTO `subimages` VALUES (1255, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_giay_trang_tri_vienna_202_10_42e7f15cef5742e5a51aa293ac0e44c4.jpg', '2024-11-16', 'MFSHCBD01.N18');
INSERT INTO `subimages` VALUES (1256, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_giay_trang_tri_vienna_202_1_a4ab1edcf52b4db4adbf6490cf914780.jpg', '2024-11-16', 'MFSHCBD01.N18');
INSERT INTO `subimages` VALUES (1257, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_giay_trang_tri_vienna_202_1_a4ab1edcf52b4db4adbf6490cf914780.jpg', '2024-11-16', 'MFSHCBD01.N18');
INSERT INTO `subimages` VALUES (1258, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_giay_trang_tri_vienna_202_3_400f7653c3fc4e1f95826eecda9503f1.jpg', '2024-11-16', 'MFSHCBD01.N18');
INSERT INTO `subimages` VALUES (1259, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_giay_trang_tri_vienna_8_f7ae2f2d0fac42a2b6a18d54e0705829_master.jpg', '2024-11-16', 'MFSHCBD01.B06');
INSERT INTO `subimages` VALUES (1260, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_giay_trang_tri_vienna_8_f7ae2f2d0fac42a2b6a18d54e0705829.jpg', '2024-11-16', 'MFSHCBD01.B06');
INSERT INTO `subimages` VALUES (1261, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_giay_trang_tri_vienna_9_8d0a4927aadf423f9f1ecc4ec125a62d.jpg', '2024-11-16', 'MFSHCBD01.B06');
INSERT INTO `subimages` VALUES (1262, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_giay_trang_tri_vienna_10_595f429c84f54c1abf3b8b720b2d3bdf.jpg', '2024-11-16', 'MFSHCBD01.B06');
INSERT INTO `subimages` VALUES (1263, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_giay_trang_tri_vienna_201_1_a359d9de399c446c84f696e19265d29a.jpg', '2024-11-16', 'MFSHCBD01.B06');
INSERT INTO `subimages` VALUES (1264, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_giay_trang_tri_vienna_201_1_a359d9de399c446c84f696e19265d29a.jpg', '2024-11-16', 'MFSHCBD01.B06');
INSERT INTO `subimages` VALUES (1265, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_giay_trang_tri_vienna_201_3_d629856447c74b8e886b6b7607119b1e.jpg', '2024-11-16', 'MFSHCBD01.B06');
INSERT INTO `subimages` VALUES (1266, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo_ghe_sofa_nau_kem_don_nem_xam_8d66f8aea67545d0885f3ea8bd53c132_master.png', '2024-11-16', 'MFLVSVLLOTG.B18');
INSERT INTO `subimages` VALUES (1267, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo_ghe_sofa_nau_kem_don_nem_xam_8d66f8aea67545d0885f3ea8bd53c132.png', '2024-11-16', 'MFLVSVLLOTG.B18');
INSERT INTO `subimages` VALUES (1268, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_combo_ghe_sofa_vline_be_2_805e3aec75d4487483494eff55ccbb3b.jpg', '2024-11-16', 'MFLVSVLLOTG.B18');
INSERT INTO `subimages` VALUES (1269, 'https://product.hstatic.net/200000065946/product/dsc02535_d64ac0bacdca49508a05ed62a8a178c2_master.jpg', '2024-11-16', 'MFSNSVLLG14.B18');
INSERT INTO `subimages` VALUES (1270, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_ghe_sofa_vline_sofa_goc_be_4ec65ab4fe1d4440ad9e8cca93c07a5c.jpg', '2024-11-16', 'MFSNSVLLG14.B18');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userID` int NOT NULL,
  `roleID` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `userID`(`userID` ASC, `roleID` ASC) USING BTREE,
  INDEX `roleID`(`roleID` ASC) USING BTREE,
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`roleID`) REFERENCES `roles` (`roleID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 24);
INSERT INTO `user_role` VALUES (8, 1, 88);
INSERT INTO `user_role` VALUES (13, 1, 90);
INSERT INTO `user_role` VALUES (7, 2, 24);
INSERT INTO `user_role` VALUES (10, 4, 24);
INSERT INTO `user_role` VALUES (11, 5, 31);
INSERT INTO `user_role` VALUES (62, 11, 24);
INSERT INTO `user_role` VALUES (63, 11, 88);
INSERT INTO `user_role` VALUES (3, 15, 24);
INSERT INTO `user_role` VALUES (4, 15, 31);
INSERT INTO `user_role` VALUES (5, 15, 88);
INSERT INTO `user_role` VALUES (14, 20, 24);
INSERT INTO `user_role` VALUES (15, 20, 88);
INSERT INTO `user_role` VALUES (64, 30, 24);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `userID` int NOT NULL AUTO_INCREMENT,
  `fullName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phoneNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `createAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `statusID` int NOT NULL,
  `activateCode` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lockUntil` datetime NULL DEFAULT NULL,
  `failPassword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `accountType` int NULL DEFAULT 0,
  `banned` int NULL DEFAULT 0,
  PRIMARY KEY (`userID`) USING BTREE,
  INDEX `fkstauts`(`statusID` ASC) USING BTREE,
  CONSTRAINT `fkstauts` FOREIGN KEY (`statusID`) REFERENCES `status_user` (`statusID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Lâm Tài', 'tai@gmail.com', '123', '2147483647', '2025-04-03 14:05:42', 1, NULL, NULL, '0', 0, 0);
INSERT INTO `users` VALUES (2, 'Văn A B', 'tai123@gmail.com', '$10$QDhYZ0qYLvJgCBP8.yQU/uwz/q55ZZDJnHeE4CQBKmbKo1LswtHFi', '1234567890', '2025-05-28 14:18:56', 4, NULL, NULL, '0', 1, 0);
INSERT INTO `users` VALUES (3, 'Trần Thị B', 'tranthib@gmail.com', '$2a$10$pqUPlyXnqETRM0Y2YBwDueo2l9SzmJiuVAz7HBFISBykPg5ZjpP7W', '2147483647', '2025-04-10 14:21:39', 1, NULL, NULL, '1', 0, 0);
INSERT INTO `users` VALUES (4, 'Lê Văn C', 'levanc@gmail.com', '789', '1122334455', '2025-04-03 14:05:46', 1, NULL, NULL, '0', 0, 0);
INSERT INTO `users` VALUES (5, 'Tai', 'tailam@gmail.com', '25F9E794323B453885F5181F1B624D0B', '1323123211', '2025-04-03 14:05:47', 1, NULL, NULL, '0', 0, 0);
INSERT INTO `users` VALUES (6, 'Tai', 'u@gmail.com', '202CB962AC59075B964B07152D234B70', '0', '2025-04-03 14:05:47', 1, NULL, NULL, '0', 0, 0);
INSERT INTO `users` VALUES (7, 'Tai', 'u@gmail.com', '202CB962AC59075B964B07152D234B70', '0', '2025-04-03 14:05:48', 1, NULL, NULL, '0', 0, 0);
INSERT INTO `users` VALUES (8, 'msadf', 'sf@gmail.com', '202CB962AC59075B964B07152D234B70', '1231231231', '2025-04-03 14:05:49', 1, NULL, NULL, '0', 0, 0);
INSERT INTO `users` VALUES (9, 'phuc', 'p@gmail.com', '202CB962AC59075B964B07152D234B70', '1231231233', '2025-04-03 14:05:49', 1, NULL, NULL, '0', 0, 0);
INSERT INTO `users` VALUES (11, 'tai', 'tai111@gmail.com', '$2a$10$PAOxRJ6.Y5GKv3YXLQkI8OfqeY59DEdPfdoeITa341HY8pkNgvf1u', '1231231233', '2025-06-02 14:14:21', 1, NULL, NULL, '0', 0, 0);
INSERT INTO `users` VALUES (12, '111', 'tai141@gmail.com', '$2a$10$Ugqm4phxfVUJE7PhDIyqoOsSjwzRQebddk8j1h0uaF5QFhMMCMg7G', '1231231231', '2025-04-03 14:05:51', 1, NULL, NULL, '0', 0, 0);
INSERT INTO `users` VALUES (13, 'admin', 'admin@gmail.com', '$2a$10$Ude9OWC3yCTaKxAL.pzxC.RJdaeX8OChVi11q7aNF8xdEPXJXlX4C', '123123321', '2025-04-03 14:05:52', 1, NULL, NULL, '0', 0, 0);
INSERT INTO `users` VALUES (14, 'lam tai', 'tailam164@gmail.com', '$2a$10$cedUpG.VTVbAuvDLQjVde.YvmaLYKgGlzvrwkfF7w0j8X5ks.0PMu', '1231231231', '2025-05-28 13:53:53', 1, NULL, NULL, '0', 1, 0);
INSERT INTO `users` VALUES (15, 'PRO. KSIZ', '22130242111111@st.hcmuaf.edu.vn', '$2a$10$HXSo3imoOQKickXX/IccHulEa28LoWeOISH58vYUAXFG7sa2/tTiy', '0333203022', '2025-05-28 23:35:25', 3, '$2a$10$3.xFxdWXituhCiLtRFY1/.IiimNy2nO2DzlvlDcwPapMZjLvtLNZS', NULL, '0', 0, 0);
INSERT INTO `users` VALUES (18, 'tai pham', 'tai@gmail.com', NULL, '0899788908', '2025-05-29 14:11:54', 3, NULL, NULL, '0', 1, 0);
INSERT INTO `users` VALUES (19, 'tai pham', 'tai@gmail.com', NULL, '0899788908', '2025-05-29 14:12:28', 3, NULL, NULL, '0', 1, 0);
INSERT INTO `users` VALUES (20, 'tai pham', 'tai113@gmail.com', NULL, '0899788908', '2025-05-29 14:14:43', 3, NULL, NULL, '0', 1, 0);
INSERT INTO `users` VALUES (21, 'tai pham', 'tai113@gmail.com', NULL, '0899788908', '2025-05-29 14:18:26', 3, NULL, NULL, '0', 1, 0);
INSERT INTO `users` VALUES (26, 'PRO. KSIZ', 'duck0308200@gmail.com', NULL, '0333203022', '2025-05-29 21:38:00', 3, '$2a$10$9lZJ3FDy0xDZ1DuxVHvs9eafBZiDK/ZLGspGJ59bMO5lyzCv02Use', NULL, '0', 1, 0);
INSERT INTO `users` VALUES (30, 'Phạm Thành Tài', '22130242@st.hcmuaf.edu.vn', '$2a$10$Sy33B0t0QLq1igR65rNWu.vQxV5ejI.wKJc86Kwvv8Mr3GgiDrR0G', '0869380447', '2025-06-01 23:21:14', 1, '$2a$10$TzFn3bSveEo.9WMwWV3Fju1xSPIwhDXwth/fulCw5.NU0tzGxY4Je', NULL, '0', 1, 0);

-- ----------------------------
-- Table structure for voucher
-- ----------------------------
DROP TABLE IF EXISTS `voucher`;
CREATE TABLE `voucher`  (
  `voucherID` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `typeID` int NULL DEFAULT NULL,
  `voucherPercent` int NULL DEFAULT NULL,
  `voucherCash` int NULL DEFAULT NULL,
  `maximumValue` int NULL DEFAULT NULL,
  `startDate` date NULL DEFAULT NULL,
  `endDate` date NULL DEFAULT NULL,
  `minOrderValue` int NULL DEFAULT NULL,
  `category_voucher` enum('discount','delivery') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'discount',
  `quantity` int NULL DEFAULT 100,
  `quantity_used` int NULL DEFAULT 50,
  PRIMARY KEY (`voucherID`) USING BTREE,
  UNIQUE INDEX `Code`(`code` ASC) USING BTREE,
  INDEX `FK_voucher_vouchertype`(`typeID` ASC) USING BTREE,
  CONSTRAINT `voucher_ibfk_1` FOREIGN KEY (`typeID`) REFERENCES `vouchertype` (`typeID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `voucher_chk_1` CHECK (`startDate` <= `endDate`)
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of voucher
-- ----------------------------
INSERT INTO `voucher` VALUES (1, 'DA10', 'DISCOUNT-ALL-10', 'Giảm 10% cho đơn hàng tối đa 1 triệu đồng ', 1, 10, 0, 1000000, '2024-12-01', '2025-06-30', 0, 'discount', 100, 67);
INSERT INTO `voucher` VALUES (2, 'D2TR', 'DISCOUNT500F2T', 'Giảm 500K cho đơn hàng cho đơn hàng trên 2 triệu đồng', 2, 0, 500000, 500000, '2024-12-01', '2025-05-01', 2000000, 'discount', 100, 40);
INSERT INTO `voucher` VALUES (3, 'DP15', 'DISCOUNT-PERCENT-15', 'Giảm 15% tối đa 200.000đ cho đơn từ 1 triệu', 1, 15, 0, 200000, '2024-12-01', '2025-06-30', 1000000, 'discount', 100, 30);
INSERT INTO `voucher` VALUES (4, 'DA20', 'DISCOUNT-ALL-20', 'Giảm 20% cho mọi đơn hàng tối đa 500.000đ', 1, 20, 0, 500000, '2024-12-01', '2025-06-30', 0, 'discount', 100, 40);
INSERT INTO `voucher` VALUES (5, 'DC100', 'DISCOUNT-CASH-100K', 'Giảm ngay 2.000.000đ cho đơn từ 20 triệu', 2, 0, 2000000, 2000000, '2024-12-01', '2025-06-30', 20000000, 'discount', 100, 50);
INSERT INTO `voucher` VALUES (6, '123', 'DE-20K', 'hom nay giam gia', 1, 10, 0, 1000000, '2025-01-15', '2025-05-31', 500000, 'discount', 100, 50);
INSERT INTO `voucher` VALUES (7, 'DA30', 'DISCOUNT-ALL-30', 'Giảm 30% tối đa 800.000đ cho đơn từ 2 triệu', 1, 30, 0, 800000, '2024-12-01', '2025-06-30', 2000000, 'discount', 100, 50);
INSERT INTO `voucher` VALUES (8, 'DC200', 'DISCOUNT-CASH-200K', 'Giảm ngay 200.000đ cho đơn từ 2 triệu', 2, 0, 200000, 200000, '2024-12-01', '2025-06-30', 2000000, 'discount', 100, 50);
INSERT INTO `voucher` VALUES (9, 'DP50', 'DISCOUNT-PERCENT-50', 'Giảm 50% tối đa 1 triệu cho đơn từ 3 triệu', 1, 50, 0, 1000000, '2024-12-01', '2025-06-30', 3000000, 'discount', 100, 54);
INSERT INTO `voucher` VALUES (10, 'DA40', 'DISCOUNT-ALL-40', 'Giảm 40% tối đa 1.5 triệu cho đơn từ 4 triệu', 1, 40, 0, 1500000, '2024-12-01', '2025-06-30', 4000000, 'discount', 100, 23);
INSERT INTO `voucher` VALUES (15, 'DA16', 'DISCOUNT-ALL-10', 'Giảm 10% cho đơn hàng tối đa 1 triệu đồng', 1, 10, 0, 1000000, '2024-12-01', '2025-06-30', 0, 'discount', 100, 45);
INSERT INTO `voucher` VALUES (16, 'DC50', 'DISCOUNT-CASH-50K', 'Giảm ngay 50.000đ cho đơn từ 500.000đ', 2, 0, 50000, 50000, '2024-12-01', '2025-06-30', 500000, 'discount', 100, 43);
INSERT INTO `voucher` VALUES (18, 'DP25', 'DISCOUNT-PERCENT-25', 'Giảm 25% tối đa 300.000đ cho đơn từ 1.5 triệu', 1, 25, 0, 300000, '2024-12-01', '2025-06-30', 1500000, 'discount', 100, 34);
INSERT INTO `voucher` VALUES (19, 'SHIPD03', 'DELIVERY-M3', 'Giảm 30.000đ vận chuyển cho đơn hàng ', 2, 0, 30000, 30000, '2025-05-01', '2025-06-26', 0, 'delivery', 100, 10);
INSERT INTO `voucher` VALUES (20, 'SHIPHY24', 'DELIVERY-FOR-300K', 'Giảm 50% vận chuyển cho đơn hàng trên 300.000đ', 1, 50, 0, 10000000, '2025-05-01', '2025-06-26', 3000000, 'delivery', 100, 50);

-- ----------------------------
-- Table structure for vouchertype
-- ----------------------------
DROP TABLE IF EXISTS `vouchertype`;
CREATE TABLE `vouchertype`  (
  `typeID` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`typeID`) USING BTREE,
  INDEX `typeID`(`typeID` ASC) USING BTREE,
  INDEX `typeID_2`(`typeID` ASC) USING BTREE,
  INDEX `typeID_3`(`typeID` ASC) USING BTREE,
  INDEX `typeID_4`(`typeID` ASC) USING BTREE,
  INDEX `typeID_5`(`typeID` ASC) USING BTREE,
  INDEX `typeID_6`(`typeID` ASC) USING BTREE,
  INDEX `typeID_7`(`typeID` ASC) USING BTREE,
  INDEX `typeID_8`(`typeID` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of vouchertype
-- ----------------------------
INSERT INTO `vouchertype` VALUES (1, 'Phần trăm');
INSERT INTO `vouchertype` VALUES (2, 'Tiền mặt');

SET FOREIGN_KEY_CHECKS = 1;
