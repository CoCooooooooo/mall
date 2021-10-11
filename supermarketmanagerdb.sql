SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sm_goods
-- ----------------------------
DROP TABLE IF EXISTS `sm_goods`;
CREATE TABLE `sm_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_quantity` int(11) NOT NULL COMMENT '库存总量',
  `last_purchasing_price` float NOT NULL COMMENT '出售价',
  `min_num` int(11) NOT NULL COMMENT '库存下限',
  `model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品型号规格',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名字',
  `producer` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生产商家',
  `purchasing_price` float NOT NULL COMMENT '采购价',
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `selling_price` float NOT NULL COMMENT '出售价',
  `state` int(11) NOT NULL COMMENT '在售状态',
  `unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '商品分类',
  `number` int(11) NULL DEFAULT NULL COMMENT '库存量',
  `salenumber` int(11) NULL DEFAULT NULL COMMENT '卖出数量',
  `returnnumber` int(11) NULL DEFAULT NULL COMMENT '退货数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sm_goods
-- ----------------------------
INSERT INTO `sm_goods` VALUES (1, 171, 8.5, 1000, '红色装', '陶华碧老干妈香辣脆油辣椒', '贵州省贵阳南明老干妈风味食品有限公司', 6.34, '好卖', 8.5, 2, '瓶', 10, 3, 20, 1);
INSERT INTO `sm_goods` VALUES (2, 140, 2220, 400, 'Note8', '华为荣耀Note8', '华为计算机系统有限公司', 1955.68, '热销', 2200, 2, '台', 16, 28, 2, 20);
INSERT INTO `sm_goods` VALUES (11, 2735, 22, 400, '500g装', '野生东北黑木耳', '辉南县博康土特产有限公司', 23, '够黑2', 38, 2, '袋', 11, 50, 100, 50);
INSERT INTO `sm_goods` VALUES (12, 315, 13, 300, '2斤装', '新疆红枣', '沧州铭鑫食品有限公司', 13, '好吃', 25, 2, '袋', 10, 200, NULL, NULL);
INSERT INTO `sm_goods` VALUES (13, 53, 8, 1000, '散装500克', '麦片燕麦巧克力', '福建省麦德好食品工业有限公司', 8, 'Goods', 15, 2, '袋', 11, 200, NULL, NULL);
INSERT INTO `sm_goods` VALUES (14, 17, 4, 1999, '300g装', '冰糖金桔干', '揭西县同心食品有限公司', 4.95, '', 13, 2, '盒', 11, 200, NULL, NULL);
INSERT INTO `sm_goods` VALUES (15, 100650, 4.5, 400, '500g装', '吉利人家牛肉味蛋糕', '合肥吉利人家食品有限公司', 4.5, 'good', 10, 2, '袋', 11, 200, NULL, NULL);
INSERT INTO `sm_goods` VALUES (16, 197, 2, 500, '128g装', '奕森奶油桃肉蜜饯果脯果干桃肉干休闲零食品', '潮州市潮安区正大食品有限公司', 2.99, '', 10, 2, '盒', 11, 200, NULL, NULL);
INSERT INTO `sm_goods` VALUES (17, 371, 20, 1000, '240g装', '休闲零食坚果特产精品干果无漂白大个开心果', '石家庄博群食品有限公司', 20, '', 33, 2, '袋', 11, 200, NULL, NULL);
INSERT INTO `sm_goods` VALUES (18, 9, 12, 300, '250g装', '劲仔小鱼干', '湖南省华文食品有限公司', 12, '', 20, 2, '袋', 11, 200, NULL, NULL);
INSERT INTO `sm_goods` VALUES (19, 12, 3.2, 300, '198g装', '山楂条', '临朐县七贤升利食品厂', 3.2, '', 10, 2, '袋', 11, 200, NULL, NULL);
INSERT INTO `sm_goods` VALUES (20, 23, 20, 200, '500g装', '大乌梅干', '长春市鼎丰真食品有限责任公司', 20, '', 25, 2, '袋', 11, 200, NULL, NULL);
INSERT INTO `sm_goods` VALUES (21, 400, 3, 100, '250g装', '手工制作芝麻香酥麻通', '桂林兰雨食品有限公司', 3, '', 8, 2, '袋', 11, 200, NULL, NULL);
INSERT INTO `sm_goods` VALUES (22, 12, 5, 200, '250g装', '美国青豆原味 蒜香', '菲律宾', 5, '', 8, 2, '袋', 11, 200, NULL, NULL);
INSERT INTO `sm_goods` VALUES (24, 47, 8000, 100, 'X', ' iPhone X', 'xx2', 8000, 'xxx2', 9500, 2, '台', 16, 200, NULL, NULL);
INSERT INTO `sm_goods` VALUES (25, 0, 103, 12, 'X', '21', '32', 103, '21', 120, 2, '盒', 3, 200, NULL, NULL);
INSERT INTO `sm_goods` VALUES (26, -1, 3000, 100, 'ILCE-A6000L', 'Sony/索尼 ILCE-A6000L WIFI微单数码相机高清单电', 'xxx', 3000, 'xxx', 3650, 2, '台', 15, 200, NULL, NULL);
INSERT INTO `sm_goods` VALUES (27, -1, 800, 400, 'IXUS 285 HS', 'Canon/佳能 IXUS 285 HS 数码相机 2020万像素高清拍摄', 'xx', 800, 'xxx', 1299, 2, '台', 15, 200, NULL, NULL);
INSERT INTO `sm_goods` VALUES (28, 0, 60, 300, 'Q8', 'Golden Field/金河田 Q8电脑音响台式多媒体家用音箱低音炮重低音', 'xxxx', 60, '', 129, 2, '台', 17, 200, NULL, NULL);
INSERT INTO `sm_goods` VALUES (29, 0, 1000, 50, '190WDPT', 'Haier/海尔冰箱BCD-190WDPT双门电冰箱大两门冷藏冷冻', 'cc', 1000, '', 1699, 2, '台', 14, 200, NULL, NULL);
INSERT INTO `sm_goods` VALUES (30, 1000, 721, 320, '4A ', 'Xiaomi/小米 小米电视4A 32英寸 智能液晶平板电视机', 'cc', 721, '', 1199, 2, '台', 12, 200, NULL, NULL);
INSERT INTO `sm_goods` VALUES (31, 0, 400, 40, 'XQB55-36SP', 'TCL XQB55-36SP 5.5公斤全自动波轮迷你小型洗衣机家用单脱抗菌', 'cc', 400, '', 729, 2, '台', 13, 200, NULL, NULL);
INSERT INTO `sm_goods` VALUES (32, 8, 5, 1000, '80g*2', '台湾进口膨化零食品张君雅小妹妹日式串烧丸子80g*2', 'cc', 4.25, '', 15, 2, '袋', 9, 200, NULL, NULL);
INSERT INTO `sm_goods` VALUES (33, 140, 180, 10, 'A字裙', '卓图女装立领针织格子印花拼接高腰A字裙2017秋冬新款碎花连衣裙', 'cc', 172, '', 298, 2, '件', 6, 200, NULL, NULL);
INSERT INTO `sm_goods` VALUES (34, 0, 189, 10, '三件套秋', '西服套装男三件套秋季新款商务修身职业正装男士西装新郎结婚礼服', 'cc', 189, '', 299, 2, '件', 7, 200, NULL, NULL);
INSERT INTO `sm_goods` VALUES (35, -1, 60, 10, 'AFS JEEP', '加绒加厚正品AFS JEEP/战地吉普男大码长裤植绒保暖男士牛仔裤子', 'c', 60, '', 89, 2, '条', 8, 200, NULL, NULL);
INSERT INTO `sm_goods` VALUES (44, 0, 0, 31224, '32124', '32124', '31224', 31224, '32124', 32124, 0, '个', 4, 200, NULL, NULL);
INSERT INTO `sm_goods` VALUES (45, 0, 150, 100, '测试', '测试', '上好', 100, '', 0, 0, '个', 12, 200, NULL, NULL);
INSERT INTO `sm_goods` VALUES (46, 0, 1641, 1001, '测试2222', '测试222', '1111', 1201, 'asd1', 0, 0, '台1', 10, 200, NULL, NULL);
INSERT INTO `sm_goods` VALUES (47, 0, 120, 100, '00001', '测试11', '上海', 100, 'aaa', 0, 0, '个', 10, 200, NULL, NULL);
INSERT INTO `sm_goods` VALUES (48, 0, 120, 100, '0002', 'ces1111', '上海', 100, '', 0, 0, '个', 11, 200, NULL, NULL);
INSERT INTO `sm_goods` VALUES (49, 0, 299, 199, '个', '再来一个', '199', 199, '', 0, 0, '个', 7, 200, NULL, NULL);
INSERT INTO `sm_goods` VALUES (50, 0, 120, 199, '个', '再来', 's', 100, '', 0, 0, '个', 7, 200, NULL, NULL);
INSERT INTO `sm_goods` VALUES (51, 0, 120, 100, '001', '来一个', '1', 100, '', 0, 0, '个', 12, 100, NULL, NULL);

-- ----------------------------
-- Table structure for sm_goodstype
-- ----------------------------
DROP TABLE IF EXISTS `sm_goodstype`;
CREATE TABLE `sm_goodstype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `p_id` int(11) NULL DEFAULT NULL COMMENT '子节点',
  `state` int(11) NULL DEFAULT NULL COMMENT '显示状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sm_goodstype
-- ----------------------------
INSERT INTO `sm_goodstype` VALUES (1, 'icon-folderOpen', '所有类别', -1, 1);
INSERT INTO `sm_goodstype` VALUES (2, 'icon-folder', '服饰', 1, 1);
INSERT INTO `sm_goodstype` VALUES (3, 'icon-folder', '食品', 1, 1);
INSERT INTO `sm_goodstype` VALUES (4, 'icon-folder', '家电', 1, 1);
INSERT INTO `sm_goodstype` VALUES (5, 'icon-folder', '数码', 1, 1);
INSERT INTO `sm_goodstype` VALUES (6, 'icon-folder', '连衣裙', 2, 1);
INSERT INTO `sm_goodstype` VALUES (7, 'icon-folder', '男士西装', 2, 0);
INSERT INTO `sm_goodstype` VALUES (8, 'icon-folder', '牛仔裤', 2, 0);
INSERT INTO `sm_goodstype` VALUES (9, 'icon-folder', '进口食品', 3, 0);
INSERT INTO `sm_goodstype` VALUES (10, 'icon-folder', '地方特产', 3, 0);
INSERT INTO `sm_goodstype` VALUES (11, 'icon-folder', '休闲食品', 3, 0);
INSERT INTO `sm_goodstype` VALUES (12, 'icon-folder', '电视机', 4, 1);
INSERT INTO `sm_goodstype` VALUES (13, 'icon-folder', '洗衣机', 4, 0);
INSERT INTO `sm_goodstype` VALUES (14, 'icon-folder', '冰箱', 4, 0);
INSERT INTO `sm_goodstype` VALUES (15, 'icon-folder', '相机', 5, 0);
INSERT INTO `sm_goodstype` VALUES (16, 'icon-folder', '手机', 5, 0);
INSERT INTO `sm_goodstype` VALUES (17, 'icon-folder', '音箱', 5, 0);

-- ----------------------------
-- Table structure for sm_menu
-- ----------------------------
DROP TABLE IF EXISTS `sm_menu`;
CREATE TABLE `sm_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `p_id` int(11) NULL DEFAULT NULL COMMENT '父节点',
  `menuId` int(11) NULL DEFAULT NULL COMMENT '菜单-子菜单id',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跳转路径',
  `d_id` int(11) NULL DEFAULT NULL COMMENT '子节点',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sm_menu
-- ----------------------------
INSERT INTO `sm_menu` VALUES (1, '&#xe65d;', '商品管理', 10, 0, '', 1);
INSERT INTO `sm_menu` VALUES (2, '&#xe61c;', '添加商品', 1010, 1, '/goods/goodAdd.jsp', 10);
INSERT INTO `sm_menu` VALUES (3, '&#xe61c;', '库存查询', 1010, 1, '/goods/goodStock.jsp', 10);
INSERT INTO `sm_menu` VALUES (5, '&#xe602;', '订单管理', 1010, 1, '/goods/goodOrder.jsp', 10);
INSERT INTO `sm_menu` VALUES (6, '&#xe62c;', '商品删除查询', 1010, 1, '/goods/goodDel.jsp', 10);
INSERT INTO `sm_menu` VALUES (7, '&#xe669;', '销售管理', 20, 0, NULL, 1);
INSERT INTO `sm_menu` VALUES (8, '&#xe669;', '退货管理', 2020, 1, '/sale/return.jsp', 20);
INSERT INTO `sm_menu` VALUES (9, '&#xe626;', '销售统计', 2020, 1, '/sale/saleList.jsp', 20);
INSERT INTO `sm_menu` VALUES (13, '&#xe625;', '基础资料管理', 40, 0, '', 1);
INSERT INTO `sm_menu` VALUES (14, '&#xe607;', '供应商管理', 4040, 1, '/basic/supplier.jsp', 40);
INSERT INTO `sm_menu` VALUES (15, '&#xe671;', '用户管理', 4040, 1, '/basic/userInfo.jsp', 40);
INSERT INTO `sm_menu` VALUES (16, '&#xe640;', '角色管理', 4040, 1, '/basic/roleInfo.jsp', 40);

-- ----------------------------
-- Table structure for sm_order
-- ----------------------------
DROP TABLE IF EXISTS `sm_order`;
CREATE TABLE `sm_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplier_id` int(11) NOT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `createdate` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `paydate` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `paymoney` float NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sm_order
-- ----------------------------
INSERT INTO `sm_order` VALUES (1, 'JH201807040001', 1, 1, '2020-07-04 19:32:36', '2020-07-04 19:32:36', 'xxxx', 200);
INSERT INTO `sm_order` VALUES (2, 'JH201807040002', 2, 1, '2020-07-04 19:32:40', '2020-07-04 19:32:40', '', 100);
INSERT INTO `sm_order` VALUES (3, 'JH201807040003', 2, 1, '2021-07-04 19:32:55', '2021-07-04 00:00:00', '', 100);
INSERT INTO `sm_order` VALUES (4, 'JH201902120001', 5, 1, '2021-09-12 17:54:27', '2021-09-12 00:00:00', '支付', 500);
INSERT INTO `sm_order` VALUES (5, 'JH201902270001', 3, 1, '2021-10-09 22:11:33', '2021-10-09 00:00:00', '', 88);

-- ----------------------------
-- Table structure for sm_role
-- ----------------------------
DROP TABLE IF EXISTS `sm_role`;
CREATE TABLE `sm_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roleRemark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sm_role
-- ----------------------------
INSERT INTO `sm_role` VALUES (1, '超级管理员', NULL);
INSERT INTO `sm_role` VALUES (2, '总经理', NULL);
INSERT INTO `sm_role` VALUES (3, '店长', NULL);
INSERT INTO `sm_role` VALUES (4, '财务', NULL);
INSERT INTO `sm_role` VALUES (5, '采购', NULL);
INSERT INTO `sm_role` VALUES (6, '员工', NULL);

-- ----------------------------
-- Table structure for sm_rolemenu
-- ----------------------------
DROP TABLE IF EXISTS `sm_rolemenu`;
CREATE TABLE `sm_rolemenu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NULL DEFAULT NULL COMMENT '对应的管理员权限id',
  `menuId` int(11) NULL DEFAULT NULL COMMENT '对应管理员权限显示几个菜单的id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sm_rolemenu
-- ----------------------------
INSERT INTO `sm_rolemenu` VALUES (1, 1, 1);
INSERT INTO `sm_rolemenu` VALUES (2, 1, 2);
INSERT INTO `sm_rolemenu` VALUES (3, 1, 3);
INSERT INTO `sm_rolemenu` VALUES (4, 1, 4);
INSERT INTO `sm_rolemenu` VALUES (5, 1, 5);
INSERT INTO `sm_rolemenu` VALUES (6, 1, 6);
INSERT INTO `sm_rolemenu` VALUES (7, 1, 7);
INSERT INTO `sm_rolemenu` VALUES (8, 1, 8);
INSERT INTO `sm_rolemenu` VALUES (9, 1, 9);
INSERT INTO `sm_rolemenu` VALUES (10, 1, 10);
INSERT INTO `sm_rolemenu` VALUES (11, 1, 11);
INSERT INTO `sm_rolemenu` VALUES (12, 1, 12);
INSERT INTO `sm_rolemenu` VALUES (13, 1, 13);
INSERT INTO `sm_rolemenu` VALUES (14, 1, 14);
INSERT INTO `sm_rolemenu` VALUES (15, 1, 15);
INSERT INTO `sm_rolemenu` VALUES (16, 1, 16);
INSERT INTO `sm_rolemenu` VALUES (31, 3, 1);
INSERT INTO `sm_rolemenu` VALUES (32, 3, 2);
INSERT INTO `sm_rolemenu` VALUES (33, 3, 3);
INSERT INTO `sm_rolemenu` VALUES (34, 3, 4);
INSERT INTO `sm_rolemenu` VALUES (35, 3, 5);
INSERT INTO `sm_rolemenu` VALUES (36, 3, 6);
INSERT INTO `sm_rolemenu` VALUES (37, 3, 7);
INSERT INTO `sm_rolemenu` VALUES (38, 3, 8);
INSERT INTO `sm_rolemenu` VALUES (39, 3, 9);
INSERT INTO `sm_rolemenu` VALUES (40, 3, 10);
INSERT INTO `sm_rolemenu` VALUES (41, 3, 11);
INSERT INTO `sm_rolemenu` VALUES (44, 6, 1);
INSERT INTO `sm_rolemenu` VALUES (45, 6, 2);
INSERT INTO `sm_rolemenu` VALUES (46, 6, 3);
INSERT INTO `sm_rolemenu` VALUES (47, 2, 1);
INSERT INTO `sm_rolemenu` VALUES (48, 2, 4);
INSERT INTO `sm_rolemenu` VALUES (49, 2, 5);
INSERT INTO `sm_rolemenu` VALUES (50, 2, 6);
INSERT INTO `sm_rolemenu` VALUES (51, 2, 7);
INSERT INTO `sm_rolemenu` VALUES (52, 2, 8);
INSERT INTO `sm_rolemenu` VALUES (53, 2, 9);
INSERT INTO `sm_rolemenu` VALUES (54, 2, 10);
INSERT INTO `sm_rolemenu` VALUES (55, 2, 11);
INSERT INTO `sm_rolemenu` VALUES (56, 2, 12);
INSERT INTO `sm_rolemenu` VALUES (57, 2, 13);
INSERT INTO `sm_rolemenu` VALUES (58, 2, 14);
INSERT INTO `sm_rolemenu` VALUES (59, 8, 1);
INSERT INTO `sm_rolemenu` VALUES (60, 8, 3);

-- ----------------------------
-- Table structure for sm_roleuser
-- ----------------------------
DROP TABLE IF EXISTS `sm_roleuser`;
CREATE TABLE `sm_roleuser`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NULL DEFAULT NULL COMMENT 'id对应的管理员id',
  `userId` int(11) NULL DEFAULT NULL COMMENT 'id对应的用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sm_roleuser
-- ----------------------------
INSERT INTO `sm_roleuser` VALUES (1, 1, 1);
INSERT INTO `sm_roleuser` VALUES (21, 3, 23);
INSERT INTO `sm_roleuser` VALUES (22, 6, 24);
INSERT INTO `sm_roleuser` VALUES (24, 2, 21);
INSERT INTO `sm_roleuser` VALUES (25, 4, 25);

-- ----------------------------
-- Table structure for sm_supplier
-- ----------------------------
DROP TABLE IF EXISTS `sm_supplier`;
CREATE TABLE `sm_supplier`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `contact` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商联系人',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名字',
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sm_supplier
-- ----------------------------
INSERT INTO `sm_supplier` VALUES (1, '上海市金山区张堰镇松金公路2072号6607室', '小张', '上海福桂食品有限公司', '0773-7217175', '失信供应商');
INSERT INTO `sm_supplier` VALUES (2, '安徽省合肥市肥西县桃花工业园合派路', '小王', '安徽麦堡食品工业有限公司', '0773-7217275', NULL);
INSERT INTO `sm_supplier` VALUES (3, '晋江市罗山后林西区41号', '小李', '福建省晋江市罗山惠康食品有限公司', '1273-1217175', '优质供应商');
INSERT INTO `sm_supplier` VALUES (4, '南京市江宁区科学园竹山路565号1幢', '小丽', '南京含羞草食品有限公司', '2121-7217175', NULL);
INSERT INTO `sm_supplier` VALUES (5, '南京市高淳县阳江镇新桥村下桥278号', '王大狗', '南京禾乃美工贸有限公司', '2133-7217125', NULL);
INSERT INTO `sm_supplier` VALUES (6, '开平市水口镇东埠路６号', '小七', '开平广合腐乳有限公司', '3332-7217175', '2');
INSERT INTO `sm_supplier` VALUES (7, '汕头市跃进路２３号利鸿基中心大厦写字楼２座', '刘钩子', '汕头市金茂食品有限公司', '0723-7232175', NULL);
INSERT INTO `sm_supplier` VALUES (8, '南京市溧水区经济开发区', '七枷社', '南京喜之郎食品有限公司', '1773-7217175', NULL);
INSERT INTO `sm_supplier` VALUES (9, '深圳市罗湖区翠竹北路中深石化区厂房B栋6楼', '小蔡', '深圳昌信实业有限公司', '1773-7217175', NULL);
INSERT INTO `sm_supplier` VALUES (10, '南京市下关区金陵小区6村27-2-203室', '小路', '南京市下关区红鹰调味品商行', '2132-7217175', NULL);
INSERT INTO `sm_supplier` VALUES (11, '荔浦县荔塔路１６－３６号', '亲亲', '桂林阜康食品工业有限公司', '2123-7217175', NULL);
INSERT INTO `sm_supplier` VALUES (12, '南京鼓楼区世纪大楼123号', '小二', '南京大王科技', '0112-1426789', '123');
INSERT INTO `sm_supplier` VALUES (13, '南京将军路800号', '小吴', '南京大陆食品公司', '1243-2135487', 'cc');
INSERT INTO `sm_supplier` VALUES (16, 'aa1', 'aa1', 'aa1', 'aaa1', '1');

-- ----------------------------
-- Table structure for sm_user
-- ----------------------------
DROP TABLE IF EXISTS `sm_user`;
CREATE TABLE `sm_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `trueName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sm_user
-- ----------------------------
INSERT INTO `sm_user` VALUES (1, 'admin', '123', '贾轩', '15830376117', '张家口');
INSERT INTO `sm_user` VALUES (21, '测试123·', '123', '总经理', '123', '123');
INSERT INTO `sm_user` VALUES (23, 'ss', 'ss', '店长', '试试', '试试');
INSERT INTO `sm_user` VALUES (24, 'jiaxuan', 'jiaxuan', 'jiaxuan', 'ss', 'ss');
INSERT INTO `sm_user` VALUES (25, '财务主管', '123', '杨舒妍', '1111111', '1111111');

SET FOREIGN_KEY_CHECKS = 1;
