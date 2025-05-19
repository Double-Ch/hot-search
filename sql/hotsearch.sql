/*
 Navicat Premium Data Transfer

 Source Server         : 117.72.117.19_3306
 Source Server Type    : MySQL
 Source Server Version : 50743
 Source Host           : 117.72.117.19:3306
 Source Schema         : hotsearch

 Target Server Type    : MySQL
 Target Server Version : 50743
 File Encoding         : 65001

 Date: 19/05/2025 17:01:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for hot_search_item_tbl
-- ----------------------------
DROP TABLE IF EXISTS `hot_search_item_tbl`;
CREATE TABLE `hot_search_item_tbl`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `platform_id` int(11) NOT NULL COMMENT '所属平台id',
  `hot_rank` int(11) NOT NULL COMMENT '热搜排名',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '热搜标题',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '热搜链接',
  `hot_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '热度值',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 451 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hot_search_item_tbl
-- ----------------------------
INSERT INTO `hot_search_item_tbl` VALUES (1, 4, 1, 'EDG击败T1晋级胜决', NULL, '12194180', '2025-02-27 21:50:20');
INSERT INTO `hot_search_item_tbl` VALUES (2, 4, 2, '那些你不知道的北京地儿', NULL, '11820384', '2025-02-27 21:50:20');
INSERT INTO `hot_search_item_tbl` VALUES (3, 4, 3, '大科学装置是建设科技强国的利器', NULL, '11743571', '2025-02-27 21:50:20');
INSERT INTO `hot_search_item_tbl` VALUES (4, 4, 4, '雷军称今年研发预算达300亿', NULL, '11319369', '2025-02-27 21:50:20');
INSERT INTO `hot_search_item_tbl` VALUES (5, 4, 5, 'bangbangbang闯入美食圈了', NULL, '10608808', '2025-02-27 21:50:20');
INSERT INTO `hot_search_item_tbl` VALUES (6, 4, 6, '醋门永存', NULL, '10594184', '2025-02-27 21:50:21');
INSERT INTO `hot_search_item_tbl` VALUES (7, 4, 7, '哪吒2票房已超140亿', NULL, '9465139', '2025-02-27 21:50:21');
INSERT INTO `hot_search_item_tbl` VALUES (8, 4, 8, '米兰时装周这把是熟人局', NULL, '9399401', '2025-02-27 21:50:21');
INSERT INTO `hot_search_item_tbl` VALUES (9, 4, 9, '小米双Ultra发布会', NULL, '9374145', '2025-02-27 21:50:21');
INSERT INTO `hot_search_item_tbl` VALUES (10, 4, 10, '国防部正告台当局：早晚收了你们', NULL, '9318479', '2025-02-27 21:50:21');
INSERT INTO `hot_search_item_tbl` VALUES (11, 4, 11, '青春是无法回放的电影', NULL, '9216318', '2025-02-27 21:50:21');
INSERT INTO `hot_search_item_tbl` VALUES (12, 4, 12, '学会与孤独和解', NULL, '9201435', '2025-02-27 21:50:22');
INSERT INTO `hot_search_item_tbl` VALUES (13, 4, 13, '淡彩穿搭让人眼前一亮又一亮', NULL, '9164436', '2025-02-27 21:50:22');
INSERT INTO `hot_search_item_tbl` VALUES (14, 4, 14, '编造重庆最牛拆迁户网民被查处', NULL, '9092360', '2025-02-27 21:50:22');
INSERT INTO `hot_search_item_tbl` VALUES (15, 4, 15, '桑延温以凡追妻变追夫', NULL, '8984867', '2025-02-27 21:50:22');
INSERT INTO `hot_search_item_tbl` VALUES (16, 4, 16, '知情人回应：赵露思没有解约', NULL, '8954504', '2025-02-27 21:50:22');
INSERT INTO `hot_search_item_tbl` VALUES (17, 4, 17, '戚薇网购方便面忘记切号', NULL, '8558539', '2025-02-27 21:50:22');
INSERT INTO `hot_search_item_tbl` VALUES (18, 4, 18, '罗大美妹妹称不接受道歉', NULL, '8555000', '2025-02-27 21:50:23');
INSERT INTO `hot_search_item_tbl` VALUES (19, 4, 19, '湖人未来补强思路浮出水面', NULL, '8532470', '2025-02-27 21:50:23');
INSERT INTO `hot_search_item_tbl` VALUES (20, 4, 20, '人生没有白走的路', NULL, '8415043', '2025-02-27 21:50:23');
INSERT INTO `hot_search_item_tbl` VALUES (21, 4, 21, '校园版李羲承进行曲', NULL, '8312830', '2025-02-27 21:50:23');
INSERT INTO `hot_search_item_tbl` VALUES (22, 4, 22, '警方回应中传学生拍戏失联', NULL, '8011900', '2025-02-27 21:50:23');
INSERT INTO `hot_search_item_tbl` VALUES (23, 4, 23, '小米15 Ultra价格6499元起', NULL, '7779406', '2025-02-27 21:50:23');
INSERT INTO `hot_search_item_tbl` VALUES (24, 4, 24, '演员请就位3推迟上线', NULL, '7769957', '2025-02-27 21:50:23');
INSERT INTO `hot_search_item_tbl` VALUES (25, 4, 25, '雷军的伯乐是谁', NULL, '7759238', '2025-02-27 21:50:24');
INSERT INTO `hot_search_item_tbl` VALUES (26, 4, 26, '哪吒2将在泰国上映', NULL, '7758647', '2025-02-27 21:50:24');
INSERT INTO `hot_search_item_tbl` VALUES (27, 4, 27, '罗大美遇害现场曝光', NULL, '7734677', '2025-02-27 21:50:24');
INSERT INTO `hot_search_item_tbl` VALUES (28, 4, 28, '全抖音的学霸为高考100天加油', NULL, '7729700', '2025-02-27 21:50:24');
INSERT INTO `hot_search_item_tbl` VALUES (29, 4, 29, '疑凶曾伪装罗大美欺骗其母亲', NULL, '7729596', '2025-02-27 21:50:24');
INSERT INTO `hot_search_item_tbl` VALUES (30, 4, 30, '王心凌画质到底有多高清', NULL, '7726370', '2025-02-27 21:50:24');
INSERT INTO `hot_search_item_tbl` VALUES (31, 4, 31, '低配版雄鹰一样的女人', NULL, '7706911', '2025-02-27 21:50:24');
INSERT INTO `hot_search_item_tbl` VALUES (32, 4, 32, '祝你永远Hakuna Matata', NULL, '7706559', '2025-02-27 21:50:25');
INSERT INTO `hot_search_item_tbl` VALUES (33, 4, 33, '黄明昊lightdreamer慢摇舞', NULL, '7704699', '2025-02-27 21:50:25');
INSERT INTO `hot_search_item_tbl` VALUES (34, 4, 34, '加拿大华人打卡王祖贤艾灸馆', NULL, '7698720', '2025-02-27 21:50:25');
INSERT INTO `hot_search_item_tbl` VALUES (35, 4, 35, 'Bass舞蹈逐渐离谱', NULL, '7689639', '2025-02-27 21:50:25');
INSERT INTO `hot_search_item_tbl` VALUES (36, 4, 36, '当年轻人来到"就业餐厅"门前', NULL, '7678860', '2025-02-27 21:50:25');
INSERT INTO `hot_search_item_tbl` VALUES (37, 4, 37, '感谢你曾经来过满满回忆杀', NULL, '7674714', '2025-02-27 21:50:25');
INSERT INTO `hot_search_item_tbl` VALUES (38, 4, 38, '温以凡约桑延一起吃饭', NULL, '7670082', '2025-02-27 21:50:26');
INSERT INTO `hot_search_item_tbl` VALUES (39, 4, 39, '当秀场穿搭照进现实', NULL, '7664183', '2025-02-27 21:50:26');
INSERT INTO `hot_search_item_tbl` VALUES (40, 4, 40, '好想出去散散心', NULL, '7661640', '2025-02-27 21:50:26');
INSERT INTO `hot_search_item_tbl` VALUES (41, 4, 41, '我老爸得了MVP是什么梗', NULL, '7660808', '2025-02-27 21:50:26');
INSERT INTO `hot_search_item_tbl` VALUES (42, 4, 42, '迪丽热巴双丸子头造型', NULL, '7650863', '2025-02-27 21:50:26');
INSERT INTO `hot_search_item_tbl` VALUES (43, 4, 43, '机器人：就说快不快吧', NULL, '7649450', '2025-02-27 21:50:26');
INSERT INTO `hot_search_item_tbl` VALUES (44, 4, 44, '春天的第一场钓鱼', NULL, '7647165', '2025-02-27 21:50:26');
INSERT INTO `hot_search_item_tbl` VALUES (45, 4, 45, '奚梦瑶重返T台走秀', NULL, '7645143', '2025-02-27 21:50:27');
INSERT INTO `hot_search_item_tbl` VALUES (46, 4, 46, '萌娃铁血丹心二重唱', NULL, '7637491', '2025-02-27 21:50:27');
INSERT INTO `hot_search_item_tbl` VALUES (47, 4, 47, '恋爱宝典之馕言文版', NULL, '7636447', '2025-02-27 21:50:27');
INSERT INTO `hot_search_item_tbl` VALUES (48, 4, 48, '广东人永远不知道穿什么', NULL, '7630911', '2025-02-27 21:50:27');
INSERT INTO `hot_search_item_tbl` VALUES (49, 4, 49, 'take me真的仙品', NULL, '7628026', '2025-02-27 21:50:27');
INSERT INTO `hot_search_item_tbl` VALUES (50, 4, 50, '于潼版我们的爱又杀回来了', NULL, '7625740', '2025-02-27 21:50:28');
INSERT INTO `hot_search_item_tbl` VALUES (51, 4, 1, 'EDG击败T1晋级胜决', NULL, '12208276', '2025-02-27 22:03:00');
INSERT INTO `hot_search_item_tbl` VALUES (52, 4, 2, '雷军称今年研发预算达300亿', NULL, '11777488', '2025-02-27 22:03:00');
INSERT INTO `hot_search_item_tbl` VALUES (53, 4, 3, '那些你不知道的北京地儿', NULL, '11581880', '2025-02-27 22:03:01');
INSERT INTO `hot_search_item_tbl` VALUES (54, 4, 4, 'bangbangbang闯入美食圈了', NULL, '11478071', '2025-02-27 22:03:01');
INSERT INTO `hot_search_item_tbl` VALUES (55, 4, 5, '醋门永存', NULL, '10664181', '2025-02-27 22:03:01');
INSERT INTO `hot_search_item_tbl` VALUES (56, 4, 6, '米兰时装周这把是熟人局', NULL, '10527908', '2025-02-27 22:03:01');
INSERT INTO `hot_search_item_tbl` VALUES (57, 4, 7, '青春是无法回放的电影', NULL, '9378314', '2025-02-27 22:03:01');
INSERT INTO `hot_search_item_tbl` VALUES (58, 4, 8, '国防部正告台当局：早晚收了你们', NULL, '9270933', '2025-02-27 22:03:01');
INSERT INTO `hot_search_item_tbl` VALUES (59, 4, 9, '哪吒2票房已超140亿', NULL, '9262422', '2025-02-27 22:03:01');
INSERT INTO `hot_search_item_tbl` VALUES (60, 4, 10, '小米双Ultra发布会', NULL, '9247843', '2025-02-27 22:03:02');
INSERT INTO `hot_search_item_tbl` VALUES (61, 4, 11, '学会与孤独和解', NULL, '9215272', '2025-02-27 22:03:02');
INSERT INTO `hot_search_item_tbl` VALUES (62, 4, 12, '淡彩穿搭让人眼前一亮又一亮', NULL, '9195192', '2025-02-27 22:03:02');
INSERT INTO `hot_search_item_tbl` VALUES (63, 4, 13, '知情人回应：赵露思没有解约', NULL, '9115462', '2025-02-27 22:03:02');
INSERT INTO `hot_search_item_tbl` VALUES (64, 4, 14, '编造重庆最牛拆迁户网民被查处', NULL, '9099753', '2025-02-27 22:03:02');
INSERT INTO `hot_search_item_tbl` VALUES (65, 4, 15, '桑延温以凡追妻变追夫', NULL, '9019824', '2025-02-27 22:03:02');
INSERT INTO `hot_search_item_tbl` VALUES (66, 4, 16, '全抖音的学霸为高考100天加油', NULL, '8641914', '2025-02-27 22:03:03');
INSERT INTO `hot_search_item_tbl` VALUES (67, 4, 17, '戚薇网购方便面忘记切号', NULL, '8620268', '2025-02-27 22:03:03');
INSERT INTO `hot_search_item_tbl` VALUES (68, 4, 18, '人生没有白走的路', NULL, '8501810', '2025-02-27 22:03:03');
INSERT INTO `hot_search_item_tbl` VALUES (69, 4, 19, '湖人未来补强思路浮出水面', NULL, '8481660', '2025-02-27 22:03:03');
INSERT INTO `hot_search_item_tbl` VALUES (70, 4, 20, '校园版李羲承进行曲', NULL, '8412109', '2025-02-27 22:03:03');
INSERT INTO `hot_search_item_tbl` VALUES (71, 4, 21, '演员请就位3推迟上线', NULL, '8156587', '2025-02-27 22:03:03');
INSERT INTO `hot_search_item_tbl` VALUES (72, 4, 22, '警方回应中传学生拍戏失联', NULL, '7780784', '2025-02-27 22:03:04');
INSERT INTO `hot_search_item_tbl` VALUES (73, 4, 23, '小米15 Ultra价格6499元起', NULL, '7773023', '2025-02-27 22:03:04');
INSERT INTO `hot_search_item_tbl` VALUES (74, 4, 24, '雷军的伯乐是谁', NULL, '7758124', '2025-02-27 22:03:04');
INSERT INTO `hot_search_item_tbl` VALUES (75, 4, 25, '王心凌画质到底有多高清', NULL, '7734325', '2025-02-27 22:03:04');
INSERT INTO `hot_search_item_tbl` VALUES (76, 4, 26, '当秀场穿搭照进现实', NULL, '7730659', '2025-02-27 22:03:04');
INSERT INTO `hot_search_item_tbl` VALUES (77, 4, 27, '广东人永远不知道穿什么', NULL, '7725524', '2025-02-27 22:03:04');
INSERT INTO `hot_search_item_tbl` VALUES (78, 4, 28, '恋爱宝典之馕言文版', NULL, '7721622', '2025-02-27 22:03:04');
INSERT INTO `hot_search_item_tbl` VALUES (79, 4, 29, '祝你永远Hakuna Matata', NULL, '7709994', '2025-02-27 22:03:05');
INSERT INTO `hot_search_item_tbl` VALUES (80, 4, 30, '加拿大华人打卡王祖贤艾灸馆', NULL, '7708955', '2025-02-27 22:03:05');
INSERT INTO `hot_search_item_tbl` VALUES (81, 4, 31, 'Bass舞蹈逐渐离谱', NULL, '7704215', '2025-02-27 22:03:05');
INSERT INTO `hot_search_item_tbl` VALUES (82, 4, 32, '感谢你曾经来过满满回忆杀', NULL, '7701997', '2025-02-27 22:03:05');
INSERT INTO `hot_search_item_tbl` VALUES (83, 4, 33, '黄明昊lightdreamer慢摇舞', NULL, '7684944', '2025-02-27 22:03:05');
INSERT INTO `hot_search_item_tbl` VALUES (84, 4, 34, '当年轻人来到"就业餐厅"门前', NULL, '7684054', '2025-02-27 22:03:05');
INSERT INTO `hot_search_item_tbl` VALUES (85, 4, 35, '温以凡约桑延一起吃饭', NULL, '7679389', '2025-02-27 22:03:06');
INSERT INTO `hot_search_item_tbl` VALUES (86, 4, 36, '低配版雄鹰一样的女人', NULL, '7673268', '2025-02-27 22:03:06');
INSERT INTO `hot_search_item_tbl` VALUES (87, 4, 37, '辣椒炒辣椒更适合江西宝宝', NULL, '7669235', '2025-02-27 22:03:06');
INSERT INTO `hot_search_item_tbl` VALUES (88, 4, 38, '我老爸得了MVP是什么梗', NULL, '7662656', '2025-02-27 22:03:06');
INSERT INTO `hot_search_item_tbl` VALUES (89, 4, 39, '好想出去散散心', NULL, '7661316', '2025-02-27 22:03:06');
INSERT INTO `hot_search_item_tbl` VALUES (90, 4, 40, '迪丽热巴双丸子头造型', NULL, '7660147', '2025-02-27 22:03:06');
INSERT INTO `hot_search_item_tbl` VALUES (91, 4, 41, '春天的第一场钓鱼', NULL, '7655157', '2025-02-27 22:03:06');
INSERT INTO `hot_search_item_tbl` VALUES (92, 4, 42, '奚梦瑶重返T台走秀', NULL, '7648534', '2025-02-27 22:03:07');
INSERT INTO `hot_search_item_tbl` VALUES (93, 4, 43, '机器人：就说快不快吧', NULL, '7645237', '2025-02-27 22:03:07');
INSERT INTO `hot_search_item_tbl` VALUES (94, 4, 44, '萌娃铁血丹心二重唱', NULL, '7641385', '2025-02-27 22:03:07');
INSERT INTO `hot_search_item_tbl` VALUES (95, 4, 45, '狗子洗着洗着就睡着了', NULL, '7639656', '2025-02-27 22:03:07');
INSERT INTO `hot_search_item_tbl` VALUES (96, 4, 46, '与诡异的蝙蝠寄生虫零距离接触', NULL, '7637589', '2025-02-27 22:03:07');
INSERT INTO `hot_search_item_tbl` VALUES (97, 4, 47, '沉浸式第一视角化妆', NULL, '7635513', '2025-02-27 22:03:07');
INSERT INTO `hot_search_item_tbl` VALUES (98, 4, 48, '来一次野炊开启春日美味盛宴', NULL, '7635220', '2025-02-27 22:03:08');
INSERT INTO `hot_search_item_tbl` VALUES (99, 4, 49, '于潼版我们的爱又杀回来了', NULL, '7629460', '2025-02-27 22:03:08');
INSERT INTO `hot_search_item_tbl` VALUES (100, 4, 50, '爱你雨中撑伞氛围', NULL, '7628917', '2025-02-27 22:03:08');
INSERT INTO `hot_search_item_tbl` VALUES (101, 4, 1, 'EDG击败T1晋级胜决', 'https://www.douyin.com/search/EDG击败T1晋级胜决?type=general', '12210468', '2025-02-27 22:05:23');
INSERT INTO `hot_search_item_tbl` VALUES (102, 4, 2, '雷军称今年研发预算达300亿', 'https://www.douyin.com/search/雷军称今年研发预算达300亿?type=general', '11779625', '2025-02-27 22:05:23');
INSERT INTO `hot_search_item_tbl` VALUES (103, 4, 3, '那些你不知道的北京地儿', 'https://www.douyin.com/search/那些你不知道的北京地儿?type=general', '11489599', '2025-02-27 22:05:23');
INSERT INTO `hot_search_item_tbl` VALUES (104, 4, 4, 'bangbangbang闯入美食圈了', 'https://www.douyin.com/search/bangbangbang闯入美食圈了?type=general', '11382927', '2025-02-27 22:05:23');
INSERT INTO `hot_search_item_tbl` VALUES (105, 4, 5, '醋门永存', 'https://www.douyin.com/search/醋门永存?type=general', '10664108', '2025-02-27 22:05:23');
INSERT INTO `hot_search_item_tbl` VALUES (106, 4, 6, '米兰时装周这把是熟人局', 'https://www.douyin.com/search/米兰时装周这把是熟人局?type=general', '10529291', '2025-02-27 22:05:23');
INSERT INTO `hot_search_item_tbl` VALUES (107, 4, 7, '青春是无法回放的电影', 'https://www.douyin.com/search/青春是无法回放的电影?type=general', '9355268', '2025-02-27 22:05:24');
INSERT INTO `hot_search_item_tbl` VALUES (108, 4, 8, '哪吒2票房已超140亿', 'https://www.douyin.com/search/哪吒2票房已超140亿?type=general', '9251528', '2025-02-27 22:05:24');
INSERT INTO `hot_search_item_tbl` VALUES (109, 4, 9, '小米双Ultra发布会', 'https://www.douyin.com/search/小米双Ultra发布会?type=general', '9248167', '2025-02-27 22:05:24');
INSERT INTO `hot_search_item_tbl` VALUES (110, 4, 10, '国防部正告台当局：早晚收了你们', 'https://www.douyin.com/search/国防部正告台当局：早晚收了你们?type=general', '9217704', '2025-02-27 22:05:24');
INSERT INTO `hot_search_item_tbl` VALUES (111, 4, 11, '学会与孤独和解', 'https://www.douyin.com/search/学会与孤独和解?type=general', '9215084', '2025-02-27 22:05:24');
INSERT INTO `hot_search_item_tbl` VALUES (112, 4, 12, '淡彩穿搭让人眼前一亮又一亮', 'https://www.douyin.com/search/淡彩穿搭让人眼前一亮又一亮?type=general', '9196838', '2025-02-27 22:05:24');
INSERT INTO `hot_search_item_tbl` VALUES (113, 4, 13, '知情人回应：赵露思没有解约', 'https://www.douyin.com/search/知情人回应：赵露思没有解约?type=general', '9115768', '2025-02-27 22:05:24');
INSERT INTO `hot_search_item_tbl` VALUES (114, 4, 14, '编造重庆最牛拆迁户网民被查处', 'https://www.douyin.com/search/编造重庆最牛拆迁户网民被查处?type=general', '9102477', '2025-02-27 22:05:25');
INSERT INTO `hot_search_item_tbl` VALUES (115, 4, 15, '桑延温以凡追妻变追夫', 'https://www.douyin.com/search/桑延温以凡追妻变追夫?type=general', '9021347', '2025-02-27 22:05:25');
INSERT INTO `hot_search_item_tbl` VALUES (116, 4, 16, '人生没有白走的路', 'https://www.douyin.com/search/人生没有白走的路?type=general', '8640984', '2025-02-27 22:05:25');
INSERT INTO `hot_search_item_tbl` VALUES (117, 4, 17, '戚薇网购方便面忘记切号', 'https://www.douyin.com/search/戚薇网购方便面忘记切号?type=general', '8618141', '2025-02-27 22:05:25');
INSERT INTO `hot_search_item_tbl` VALUES (118, 4, 18, '湖人未来补强思路浮出水面', 'https://www.douyin.com/search/湖人未来补强思路浮出水面?type=general', '8500495', '2025-02-27 22:05:25');
INSERT INTO `hot_search_item_tbl` VALUES (119, 4, 19, '演员请就位3推迟上线', 'https://www.douyin.com/search/演员请就位3推迟上线?type=general', '8462202', '2025-02-27 22:05:25');
INSERT INTO `hot_search_item_tbl` VALUES (120, 4, 20, '校园版李羲承进行曲', 'https://www.douyin.com/search/校园版李羲承进行曲?type=general', '8414794', '2025-02-27 22:05:25');
INSERT INTO `hot_search_item_tbl` VALUES (121, 4, 21, '全抖音的学霸为高考100天加油', 'https://www.douyin.com/search/全抖音的学霸为高考100天加油?type=general', '8166159', '2025-02-27 22:05:26');
INSERT INTO `hot_search_item_tbl` VALUES (122, 4, 22, '警方回应中传学生拍戏失联', 'https://www.douyin.com/search/警方回应中传学生拍戏失联?type=general', '7780548', '2025-02-27 22:05:26');
INSERT INTO `hot_search_item_tbl` VALUES (123, 4, 23, '小米15 Ultra价格6499元起', 'https://www.douyin.com/search/小米15 Ultra价格6499元起?type=general', '7773420', '2025-02-27 22:05:26');
INSERT INTO `hot_search_item_tbl` VALUES (124, 4, 24, '雷军的伯乐是谁', 'https://www.douyin.com/search/雷军的伯乐是谁?type=general', '7757446', '2025-02-27 22:05:26');
INSERT INTO `hot_search_item_tbl` VALUES (125, 4, 25, '王心凌画质到底有多高清', 'https://www.douyin.com/search/王心凌画质到底有多高清?type=general', '7733831', '2025-02-27 22:05:26');
INSERT INTO `hot_search_item_tbl` VALUES (126, 4, 26, '当秀场穿搭照进现实', 'https://www.douyin.com/search/当秀场穿搭照进现实?type=general', '7730674', '2025-02-27 22:05:26');
INSERT INTO `hot_search_item_tbl` VALUES (127, 4, 27, '广东人永远不知道穿什么', 'https://www.douyin.com/search/广东人永远不知道穿什么?type=general', '7724316', '2025-02-27 22:05:26');
INSERT INTO `hot_search_item_tbl` VALUES (128, 4, 28, '恋爱宝典之馕言文版', 'https://www.douyin.com/search/恋爱宝典之馕言文版?type=general', '7724036', '2025-02-27 22:05:27');
INSERT INTO `hot_search_item_tbl` VALUES (129, 4, 29, '祝你永远Hakuna Matata', 'https://www.douyin.com/search/祝你永远Hakuna Matata?type=general', '7721429', '2025-02-27 22:05:27');
INSERT INTO `hot_search_item_tbl` VALUES (130, 4, 30, '加拿大华人打卡王祖贤艾灸馆', 'https://www.douyin.com/search/加拿大华人打卡王祖贤艾灸馆?type=general', '7711139', '2025-02-27 22:05:27');
INSERT INTO `hot_search_item_tbl` VALUES (131, 4, 31, 'Bass舞蹈逐渐离谱', 'https://www.douyin.com/search/Bass舞蹈逐渐离谱?type=general', '7707095', '2025-02-27 22:05:27');
INSERT INTO `hot_search_item_tbl` VALUES (132, 4, 32, '温以凡约桑延一起吃饭', 'https://www.douyin.com/search/温以凡约桑延一起吃饭?type=general', '7704434', '2025-02-27 22:05:27');
INSERT INTO `hot_search_item_tbl` VALUES (133, 4, 33, '感谢你曾经来过满满回忆杀', 'https://www.douyin.com/search/感谢你曾经来过满满回忆杀?type=general', '7699965', '2025-02-27 22:05:27');
INSERT INTO `hot_search_item_tbl` VALUES (134, 4, 34, '黄明昊lightdreamer慢摇舞', 'https://www.douyin.com/search/黄明昊lightdreamer慢摇舞?type=general', '7686079', '2025-02-27 22:05:27');
INSERT INTO `hot_search_item_tbl` VALUES (135, 4, 35, '当年轻人来到"就业餐厅"门前', 'https://www.douyin.com/search/当年轻人来到"就业餐厅"门前?type=general', '7683390', '2025-02-27 22:05:28');
INSERT INTO `hot_search_item_tbl` VALUES (136, 4, 36, '低配版雄鹰一样的女人', 'https://www.douyin.com/search/低配版雄鹰一样的女人?type=general', '7679494', '2025-02-27 22:05:28');
INSERT INTO `hot_search_item_tbl` VALUES (137, 4, 37, '与诡异的蝙蝠寄生虫零距离接触', 'https://www.douyin.com/search/与诡异的蝙蝠寄生虫零距离接触?type=general', '7677200', '2025-02-27 22:05:28');
INSERT INTO `hot_search_item_tbl` VALUES (138, 4, 38, '辣椒炒辣椒更适合江西宝宝', 'https://www.douyin.com/search/辣椒炒辣椒更适合江西宝宝?type=general', '7668719', '2025-02-27 22:05:28');
INSERT INTO `hot_search_item_tbl` VALUES (139, 4, 39, '来一次野炊开启春日美味盛宴', 'https://www.douyin.com/search/来一次野炊开启春日美味盛宴?type=general', '7665224', '2025-02-27 22:05:28');
INSERT INTO `hot_search_item_tbl` VALUES (140, 4, 40, '好想出去散散心', 'https://www.douyin.com/search/好想出去散散心?type=general', '7662864', '2025-02-27 22:05:28');
INSERT INTO `hot_search_item_tbl` VALUES (141, 4, 41, '我老爸得了MVP是什么梗', 'https://www.douyin.com/search/我老爸得了MVP是什么梗?type=general', '7659833', '2025-02-27 22:05:29');
INSERT INTO `hot_search_item_tbl` VALUES (142, 4, 42, '迪丽热巴双丸子头造型', 'https://www.douyin.com/search/迪丽热巴双丸子头造型?type=general', '7655105', '2025-02-27 22:05:29');
INSERT INTO `hot_search_item_tbl` VALUES (143, 4, 43, '机器人：就说快不快吧', 'https://www.douyin.com/search/机器人：就说快不快吧?type=general', '7645237', '2025-02-27 22:05:29');
INSERT INTO `hot_search_item_tbl` VALUES (144, 4, 44, '春天的第一场钓鱼', 'https://www.douyin.com/search/春天的第一场钓鱼?type=general', '7642119', '2025-02-27 22:05:29');
INSERT INTO `hot_search_item_tbl` VALUES (145, 4, 45, '奚梦瑶重返T台走秀', 'https://www.douyin.com/search/奚梦瑶重返T台走秀?type=general', '7639688', '2025-02-27 22:05:29');
INSERT INTO `hot_search_item_tbl` VALUES (146, 4, 46, '萌娃铁血丹心二重唱', 'https://www.douyin.com/search/萌娃铁血丹心二重唱?type=general', '7639054', '2025-02-27 22:05:29');
INSERT INTO `hot_search_item_tbl` VALUES (147, 4, 47, '沉浸式第一视角化妆', 'https://www.douyin.com/search/沉浸式第一视角化妆?type=general', '7635133', '2025-02-27 22:05:29');
INSERT INTO `hot_search_item_tbl` VALUES (148, 4, 48, '于潼版我们的爱又杀回来了', 'https://www.douyin.com/search/于潼版我们的爱又杀回来了?type=general', '7632785', '2025-02-27 22:05:30');
INSERT INTO `hot_search_item_tbl` VALUES (149, 4, 49, '狗子洗着洗着就睡着了', 'https://www.douyin.com/search/狗子洗着洗着就睡着了?type=general', '7630890', '2025-02-27 22:05:30');
INSERT INTO `hot_search_item_tbl` VALUES (150, 4, 50, 'take me真的仙品', 'https://www.douyin.com/search/take me真的仙品?type=general', '7629135', '2025-02-27 22:05:30');
INSERT INTO `hot_search_item_tbl` VALUES (151, 4, 1, 'EDG击败T1晋级胜决', 'https://www.douyin.com/search/EDG击败T1晋级胜决?type=general', '12213705', '2025-02-27 22:07:43');
INSERT INTO `hot_search_item_tbl` VALUES (152, 4, 2, '雷军称今年研发预算达300亿', 'https://www.douyin.com/search/雷军称今年研发预算达300亿?type=general', '11783085', '2025-02-27 22:07:43');
INSERT INTO `hot_search_item_tbl` VALUES (153, 4, 3, '那些你不知道的北京地儿', 'https://www.douyin.com/search/那些你不知道的北京地儿?type=general', '11496111', '2025-02-27 22:07:43');
INSERT INTO `hot_search_item_tbl` VALUES (154, 4, 4, 'bangbangbang闯入美食圈了', 'https://www.douyin.com/search/bangbangbang闯入美食圈了?type=general', '11379109', '2025-02-27 22:07:43');
INSERT INTO `hot_search_item_tbl` VALUES (155, 4, 5, '醋门永存', 'https://www.douyin.com/search/醋门永存?type=general', '10680081', '2025-02-27 22:07:44');
INSERT INTO `hot_search_item_tbl` VALUES (156, 4, 6, '米兰时装周这把是熟人局', 'https://www.douyin.com/search/米兰时装周这把是熟人局?type=general', '10530203', '2025-02-27 22:07:44');
INSERT INTO `hot_search_item_tbl` VALUES (157, 4, 7, '青春是无法回放的电影', 'https://www.douyin.com/search/青春是无法回放的电影?type=general', '9369072', '2025-02-27 22:07:44');
INSERT INTO `hot_search_item_tbl` VALUES (158, 4, 8, '哪吒2票房已超140亿', 'https://www.douyin.com/search/哪吒2票房已超140亿?type=general', '9257508', '2025-02-27 22:07:44');
INSERT INTO `hot_search_item_tbl` VALUES (159, 4, 9, '小米双Ultra发布会', 'https://www.douyin.com/search/小米双Ultra发布会?type=general', '9224555', '2025-02-27 22:07:44');
INSERT INTO `hot_search_item_tbl` VALUES (160, 4, 10, '国防部正告台当局：早晚收了你们', 'https://www.douyin.com/search/国防部正告台当局：早晚收了你们?type=general', '9222516', '2025-02-27 22:07:44');
INSERT INTO `hot_search_item_tbl` VALUES (161, 4, 11, '学会与孤独和解', 'https://www.douyin.com/search/学会与孤独和解?type=general', '9214166', '2025-02-27 22:07:44');
INSERT INTO `hot_search_item_tbl` VALUES (162, 4, 12, '淡彩穿搭让人眼前一亮又一亮', 'https://www.douyin.com/search/淡彩穿搭让人眼前一亮又一亮?type=general', '9198041', '2025-02-27 22:07:45');
INSERT INTO `hot_search_item_tbl` VALUES (163, 4, 13, '人生没有白走的路', 'https://www.douyin.com/search/人生没有白走的路?type=general', '9120446', '2025-02-27 22:07:45');
INSERT INTO `hot_search_item_tbl` VALUES (164, 4, 14, '编造重庆最牛拆迁户网民被查处', 'https://www.douyin.com/search/编造重庆最牛拆迁户网民被查处?type=general', '9117485', '2025-02-27 22:07:45');
INSERT INTO `hot_search_item_tbl` VALUES (165, 4, 15, '桑延温以凡追妻变追夫', 'https://www.douyin.com/search/桑延温以凡追妻变追夫?type=general', '9024859', '2025-02-27 22:07:45');
INSERT INTO `hot_search_item_tbl` VALUES (166, 4, 16, '知情人回应：赵露思没有解约', 'https://www.douyin.com/search/知情人回应：赵露思没有解约?type=general', '8662440', '2025-02-27 22:07:45');
INSERT INTO `hot_search_item_tbl` VALUES (167, 4, 17, '戚薇网购方便面忘记切号', 'https://www.douyin.com/search/戚薇网购方便面忘记切号?type=general', '8619671', '2025-02-27 22:07:45');
INSERT INTO `hot_search_item_tbl` VALUES (168, 4, 18, '湖人未来补强思路浮出水面', 'https://www.douyin.com/search/湖人未来补强思路浮出水面?type=general', '8506313', '2025-02-27 22:07:45');
INSERT INTO `hot_search_item_tbl` VALUES (169, 4, 19, '演员请就位3推迟上线', 'https://www.douyin.com/search/演员请就位3推迟上线?type=general', '8449181', '2025-02-27 22:07:46');
INSERT INTO `hot_search_item_tbl` VALUES (170, 4, 20, '校园版李羲承进行曲', 'https://www.douyin.com/search/校园版李羲承进行曲?type=general', '8419119', '2025-02-27 22:07:46');
INSERT INTO `hot_search_item_tbl` VALUES (171, 4, 21, '全抖音的学霸为高考100天加油', 'https://www.douyin.com/search/全抖音的学霸为高考100天加油?type=general', '8185898', '2025-02-27 22:07:46');
INSERT INTO `hot_search_item_tbl` VALUES (172, 4, 22, '警方回应中传学生拍戏失联', 'https://www.douyin.com/search/警方回应中传学生拍戏失联?type=general', '7803412', '2025-02-27 22:07:46');
INSERT INTO `hot_search_item_tbl` VALUES (173, 4, 23, '小米15 Ultra价格6499元起', 'https://www.douyin.com/search/小米15 Ultra价格6499元起?type=general', '7780979', '2025-02-27 22:07:46');
INSERT INTO `hot_search_item_tbl` VALUES (174, 4, 24, '雷军的伯乐是谁', 'https://www.douyin.com/search/雷军的伯乐是谁?type=general', '7772808', '2025-02-27 22:07:46');
INSERT INTO `hot_search_item_tbl` VALUES (175, 4, 25, '王心凌画质到底有多高清', 'https://www.douyin.com/search/王心凌画质到底有多高清?type=general', '7756792', '2025-02-27 22:07:47');
INSERT INTO `hot_search_item_tbl` VALUES (176, 4, 26, '当秀场穿搭照进现实', 'https://www.douyin.com/search/当秀场穿搭照进现实?type=general', '7732582', '2025-02-27 22:07:47');
INSERT INTO `hot_search_item_tbl` VALUES (177, 4, 27, '广东人永远不知道穿什么', 'https://www.douyin.com/search/广东人永远不知道穿什么?type=general', '7730959', '2025-02-27 22:07:47');
INSERT INTO `hot_search_item_tbl` VALUES (178, 4, 28, '恋爱宝典之馕言文版', 'https://www.douyin.com/search/恋爱宝典之馕言文版?type=general', '7724549', '2025-02-27 22:07:47');
INSERT INTO `hot_search_item_tbl` VALUES (179, 4, 29, '与诡异的蝙蝠寄生虫零距离接触', 'https://www.douyin.com/search/与诡异的蝙蝠寄生虫零距离接触?type=general', '7722483', '2025-02-27 22:07:47');
INSERT INTO `hot_search_item_tbl` VALUES (180, 4, 30, '祝你永远Hakuna Matata', 'https://www.douyin.com/search/祝你永远Hakuna Matata?type=general', '7711358', '2025-02-27 22:07:47');
INSERT INTO `hot_search_item_tbl` VALUES (181, 4, 31, '加拿大华人打卡王祖贤艾灸馆', 'https://www.douyin.com/search/加拿大华人打卡王祖贤艾灸馆?type=general', '7706672', '2025-02-27 22:07:47');
INSERT INTO `hot_search_item_tbl` VALUES (182, 4, 32, 'Bass舞蹈逐渐离谱', 'https://www.douyin.com/search/Bass舞蹈逐渐离谱?type=general', '7704535', '2025-02-27 22:07:48');
INSERT INTO `hot_search_item_tbl` VALUES (183, 4, 33, '感谢你曾经来过满满回忆杀', 'https://www.douyin.com/search/感谢你曾经来过满满回忆杀?type=general', '7698736', '2025-02-27 22:07:48');
INSERT INTO `hot_search_item_tbl` VALUES (184, 4, 34, '黄明昊lightdreamer慢摇舞', 'https://www.douyin.com/search/黄明昊lightdreamer慢摇舞?type=general', '7688176', '2025-02-27 22:07:48');
INSERT INTO `hot_search_item_tbl` VALUES (185, 4, 35, '当年轻人来到"就业餐厅"门前', 'https://www.douyin.com/search/当年轻人来到"就业餐厅"门前?type=general', '7684255', '2025-02-27 22:07:48');
INSERT INTO `hot_search_item_tbl` VALUES (186, 4, 36, '温以凡约桑延一起吃饭', 'https://www.douyin.com/search/温以凡约桑延一起吃饭?type=general', '7678608', '2025-02-27 22:07:48');
INSERT INTO `hot_search_item_tbl` VALUES (187, 4, 37, '低配版雄鹰一样的女人', 'https://www.douyin.com/search/低配版雄鹰一样的女人?type=general', '7677401', '2025-02-27 22:07:48');
INSERT INTO `hot_search_item_tbl` VALUES (188, 4, 38, '来一次野炊开启春日美味盛宴', 'https://www.douyin.com/search/来一次野炊开启春日美味盛宴?type=general', '7669833', '2025-02-27 22:07:48');
INSERT INTO `hot_search_item_tbl` VALUES (189, 4, 39, '沉浸式第一视角化妆', 'https://www.douyin.com/search/沉浸式第一视角化妆?type=general', '7666124', '2025-02-27 22:07:49');
INSERT INTO `hot_search_item_tbl` VALUES (190, 4, 40, '好想出去散散心', 'https://www.douyin.com/search/好想出去散散心?type=general', '7660590', '2025-02-27 22:07:49');
INSERT INTO `hot_search_item_tbl` VALUES (191, 4, 41, '我老爸得了MVP是什么梗', 'https://www.douyin.com/search/我老爸得了MVP是什么梗?type=general', '7659021', '2025-02-27 22:07:49');
INSERT INTO `hot_search_item_tbl` VALUES (192, 4, 42, '奚梦瑶重返T台走秀', 'https://www.douyin.com/search/奚梦瑶重返T台走秀?type=general', '7654585', '2025-02-27 22:07:49');
INSERT INTO `hot_search_item_tbl` VALUES (193, 4, 43, '迪丽热巴双丸子头造型', 'https://www.douyin.com/search/迪丽热巴双丸子头造型?type=general', '7647807', '2025-02-27 22:07:49');
INSERT INTO `hot_search_item_tbl` VALUES (194, 4, 44, '机器人：就说快不快吧', 'https://www.douyin.com/search/机器人：就说快不快吧?type=general', '7645256', '2025-02-27 22:07:49');
INSERT INTO `hot_search_item_tbl` VALUES (195, 4, 45, '春天的第一场钓鱼', 'https://www.douyin.com/search/春天的第一场钓鱼?type=general', '7644713', '2025-02-27 22:07:49');
INSERT INTO `hot_search_item_tbl` VALUES (196, 4, 46, '萌娃铁血丹心二重唱', 'https://www.douyin.com/search/萌娃铁血丹心二重唱?type=general', '7642243', '2025-02-27 22:07:50');
INSERT INTO `hot_search_item_tbl` VALUES (197, 4, 47, '辣椒炒辣椒更适合江西宝宝', 'https://www.douyin.com/search/辣椒炒辣椒更适合江西宝宝?type=general', '7640094', '2025-02-27 22:07:50');
INSERT INTO `hot_search_item_tbl` VALUES (198, 4, 48, '于潼版我们的爱又杀回来了', 'https://www.douyin.com/search/于潼版我们的爱又杀回来了?type=general', '7638443', '2025-02-27 22:07:50');
INSERT INTO `hot_search_item_tbl` VALUES (199, 4, 49, '狗子洗着洗着就睡着了', 'https://www.douyin.com/search/狗子洗着洗着就睡着了?type=general', '7635300', '2025-02-27 22:07:50');
INSERT INTO `hot_search_item_tbl` VALUES (200, 4, 50, '爱你雨中撑伞氛围', 'https://www.douyin.com/search/爱你雨中撑伞氛围?type=general', '7629465', '2025-02-27 22:07:50');
INSERT INTO `hot_search_item_tbl` VALUES (201, 4, 1, '余华英被执行死刑', 'https://www.douyin.com/search/余华英被执行死刑?type=general', '12274117', '2025-02-28 13:36:25');
INSERT INTO `hot_search_item_tbl` VALUES (202, 4, 2, '库里12记三分砍56分', 'https://www.douyin.com/search/库里12记三分砍56分?type=general', '12101147', '2025-02-28 13:36:25');
INSERT INTO `hot_search_item_tbl` VALUES (203, 4, 3, '赏春还得是中式美学', 'https://www.douyin.com/search/赏春还得是中式美学?type=general', '11662279', '2025-02-28 13:36:25');
INSERT INTO `hot_search_item_tbl` VALUES (204, 4, 4, '泽连斯基抵达美国', 'https://www.douyin.com/search/泽连斯基抵达美国?type=general', '11623443', '2025-02-28 13:36:25');
INSERT INTO `hot_search_item_tbl` VALUES (205, 4, 5, '曾孙女找太爷爷告爷爷状', 'https://www.douyin.com/search/曾孙女找太爷爷告爷爷状?type=general', '10708683', '2025-02-28 13:36:25');
INSERT INTO `hot_search_item_tbl` VALUES (206, 4, 6, '直到上了大学才发现', 'https://www.douyin.com/search/直到上了大学才发现?type=general', '10542751', '2025-02-28 13:36:25');
INSERT INTO `hot_search_item_tbl` VALUES (207, 4, 7, '青春是无法回放的电影', 'https://www.douyin.com/search/青春是无法回放的电影?type=general', '9357059', '2025-02-28 13:36:25');
INSERT INTO `hot_search_item_tbl` VALUES (208, 4, 8, '梅毅走天下海南行：寻迹苏东坡', 'https://www.douyin.com/search/梅毅走天下海南行：寻迹苏东坡?type=general', '9317813', '2025-02-28 13:36:25');
INSERT INTO `hot_search_item_tbl` VALUES (209, 4, 9, '美司法部公布爱泼斯坦案首批文件', 'https://www.douyin.com/search/美司法部公布爱泼斯坦案首批文件?type=general', '9300133', '2025-02-28 13:36:25');
INSERT INTO `hot_search_item_tbl` VALUES (210, 4, 10, '小米SU7 Ultra正式上市', 'https://www.douyin.com/search/小米SU7 Ultra正式上市?type=general', '9289948', '2025-02-28 13:36:25');
INSERT INTO `hot_search_item_tbl` VALUES (211, 4, 11, '二月的最后一天', 'https://www.douyin.com/search/二月的最后一天?type=general', '9253438', '2025-02-28 13:36:25');
INSERT INTO `hot_search_item_tbl` VALUES (212, 4, 12, '辣椒炒辣椒更适合江西宝宝', 'https://www.douyin.com/search/辣椒炒辣椒更适合江西宝宝?type=general', '9074203', '2025-02-28 13:36:25');
INSERT INTO `hot_search_item_tbl` VALUES (213, 4, 13, '实测小米SU7 Ultra', 'https://www.douyin.com/search/实测小米SU7 Ultra?type=general', '8886044', '2025-02-28 13:36:25');
INSERT INTO `hot_search_item_tbl` VALUES (214, 4, 14, '无忧传媒回应与刘畊宏结束合作', 'https://www.douyin.com/search/无忧传媒回应与刘畊宏结束合作?type=general', '8808810', '2025-02-28 13:36:25');
INSERT INTO `hot_search_item_tbl` VALUES (215, 4, 15, '官方辟谣大熊猫宝力背上有洞', 'https://www.douyin.com/search/官方辟谣大熊猫宝力背上有洞?type=general', '8644565', '2025-02-28 13:36:25');
INSERT INTO `hot_search_item_tbl` VALUES (216, 4, 16, '小米双Ultra发布会', 'https://www.douyin.com/search/小米双Ultra发布会?type=general', '8574859', '2025-02-28 13:36:25');
INSERT INTO `hot_search_item_tbl` VALUES (217, 4, 17, '我老爸得了MVP是什么梗', 'https://www.douyin.com/search/我老爸得了MVP是什么梗?type=general', '8521207', '2025-02-28 13:36:25');
INSERT INTO `hot_search_item_tbl` VALUES (218, 4, 18, 'SU7 Ultra10分钟大定破6900台', 'https://www.douyin.com/search/SU7 Ultra10分钟大定破6900台?type=general', '8406154', '2025-02-28 13:36:25');
INSERT INTO `hot_search_item_tbl` VALUES (219, 4, 19, '哪吒2票房已超140亿', 'https://www.douyin.com/search/哪吒2票房已超140亿?type=general', '8391457', '2025-02-28 13:36:25');
INSERT INTO `hot_search_item_tbl` VALUES (220, 4, 20, 'EDG击败T1晋级胜决', 'https://www.douyin.com/search/EDG击败T1晋级胜决?type=general', '8257326', '2025-02-28 13:36:25');
INSERT INTO `hot_search_item_tbl` VALUES (221, 4, 21, '校园版李羲承进行曲', 'https://www.douyin.com/search/校园版李羲承进行曲?type=general', '7882820', '2025-02-28 13:36:25');
INSERT INTO `hot_search_item_tbl` VALUES (222, 4, 22, '难哄白敬亭红眼眶破碎感', 'https://www.douyin.com/search/难哄白敬亭红眼眶破碎感?type=general', '7835504', '2025-02-28 13:36:25');
INSERT INTO `hot_search_item_tbl` VALUES (223, 4, 23, '恋爱宝典之馕言文版', 'https://www.douyin.com/search/恋爱宝典之馕言文版?type=general', '7763703', '2025-02-28 13:36:25');
INSERT INTO `hot_search_item_tbl` VALUES (224, 4, 24, '薛之谦发抖音告别火星情报局', 'https://www.douyin.com/search/薛之谦发抖音告别火星情报局?type=general', '7744288', '2025-02-28 13:36:25');
INSERT INTO `hot_search_item_tbl` VALUES (225, 4, 25, '杨紫成毅最新路透', 'https://www.douyin.com/search/杨紫成毅最新路透?type=general', '7725241', '2025-02-28 13:36:26');
INSERT INTO `hot_search_item_tbl` VALUES (226, 4, 26, '百忙之中抽空谈个恋爱', 'https://www.douyin.com/search/百忙之中抽空谈个恋爱?type=general', '7719617', '2025-02-28 13:36:26');
INSERT INTO `hot_search_item_tbl` VALUES (227, 4, 27, '好想出去散散心', 'https://www.douyin.com/search/好想出去散散心?type=general', '7714209', '2025-02-28 13:36:26');
INSERT INTO `hot_search_item_tbl` VALUES (228, 4, 28, '雷军说SU7 Ultra预订量超乎想象', 'https://www.douyin.com/search/雷军说SU7 Ultra预订量超乎想象?type=general', '7713144', '2025-02-28 13:36:26');
INSERT INTO `hot_search_item_tbl` VALUES (229, 4, 29, '当秀场穿搭照进现实', 'https://www.douyin.com/search/当秀场穿搭照进现实?type=general', '7713007', '2025-02-28 13:36:26');
INSERT INTO `hot_search_item_tbl` VALUES (230, 4, 30, '全抖音都在蹲的精选内容', 'https://www.douyin.com/search/全抖音都在蹲的精选内容?type=general', '7703867', '2025-02-28 13:36:26');
INSERT INTO `hot_search_item_tbl` VALUES (231, 4, 31, '这届达人又在云南整活儿', 'https://www.douyin.com/search/这届达人又在云南整活儿?type=general', '7694510', '2025-02-28 13:36:26');
INSERT INTO `hot_search_item_tbl` VALUES (232, 4, 32, '迪丽热巴双丸子头造型', 'https://www.douyin.com/search/迪丽热巴双丸子头造型?type=general', '7691077', '2025-02-28 13:36:26');
INSERT INTO `hot_search_item_tbl` VALUES (233, 4, 33, '何苏叶得知沈惜凡分手暗爽', 'https://www.douyin.com/search/何苏叶得知沈惜凡分手暗爽?type=general', '7686205', '2025-02-28 13:36:26');
INSERT INTO `hot_search_item_tbl` VALUES (234, 4, 34, '方媛遭抢劫后报平安', 'https://www.douyin.com/search/方媛遭抢劫后报平安?type=general', '7679403', '2025-02-28 13:36:26');
INSERT INTO `hot_search_item_tbl` VALUES (235, 4, 35, '低配版雄鹰一样的女人', 'https://www.douyin.com/search/低配版雄鹰一样的女人?type=general', '7667774', '2025-02-28 13:36:26');
INSERT INTO `hot_search_item_tbl` VALUES (236, 4, 36, '张凌赫翻牌了爱你官抖吻戏花絮', 'https://www.douyin.com/search/张凌赫翻牌了爱你官抖吻戏花絮?type=general', '7665578', '2025-02-28 13:36:26');
INSERT INTO `hot_search_item_tbl` VALUES (237, 4, 37, '当年轻人来到"就业餐厅"门前', 'https://www.douyin.com/search/当年轻人来到"就业餐厅"门前?type=general', '7660488', '2025-02-28 13:36:26');
INSERT INTO `hot_search_item_tbl` VALUES (238, 4, 38, '桑延温以凡追妻变追夫', 'https://www.douyin.com/search/桑延温以凡追妻变追夫?type=general', '7660384', '2025-02-28 13:36:26');
INSERT INTO `hot_search_item_tbl` VALUES (239, 4, 39, '王心凌画质到底有多高清', 'https://www.douyin.com/search/王心凌画质到底有多高清?type=general', '7659587', '2025-02-28 13:36:26');
INSERT INTO `hot_search_item_tbl` VALUES (240, 4, 40, '感谢你曾经来过满满回忆杀', 'https://www.douyin.com/search/感谢你曾经来过满满回忆杀?type=general', '7655356', '2025-02-28 13:36:26');
INSERT INTO `hot_search_item_tbl` VALUES (241, 4, 41, '知情人回应：赵露思没有解约', 'https://www.douyin.com/search/知情人回应：赵露思没有解约?type=general', '7651399', '2025-02-28 13:36:26');
INSERT INTO `hot_search_item_tbl` VALUES (242, 4, 42, '国防部回应"卢旺达军队战斗力强"', 'https://www.douyin.com/search/国防部回应"卢旺达军队战斗力强"?type=general', '7647079', '2025-02-28 13:36:26');
INSERT INTO `hot_search_item_tbl` VALUES (243, 4, 43, '祝你永远Hakuna Matata', 'https://www.douyin.com/search/祝你永远Hakuna Matata?type=general', '7644562', '2025-02-28 13:36:26');
INSERT INTO `hot_search_item_tbl` VALUES (244, 4, 44, '淡彩穿搭让人眼前一亮又一亮', 'https://www.douyin.com/search/淡彩穿搭让人眼前一亮又一亮?type=general', '7644426', '2025-02-28 13:36:26');
INSERT INTO `hot_search_item_tbl` VALUES (245, 4, 45, '加拿大华人打卡王祖贤艾灸馆', 'https://www.douyin.com/search/加拿大华人打卡王祖贤艾灸馆?type=general', '7641544', '2025-02-28 13:36:26');
INSERT INTO `hot_search_item_tbl` VALUES (246, 4, 46, 'Bass舞蹈逐渐离谱', 'https://www.douyin.com/search/Bass舞蹈逐渐离谱?type=general', '7641279', '2025-02-28 13:36:26');
INSERT INTO `hot_search_item_tbl` VALUES (247, 4, 47, '机器人：就说快不快吧', 'https://www.douyin.com/search/机器人：就说快不快吧?type=general', '7638559', '2025-02-28 13:36:26');
INSERT INTO `hot_search_item_tbl` VALUES (248, 4, 48, 'LISA新专', 'https://www.douyin.com/search/LISA新专?type=general', '7637040', '2025-02-28 13:36:26');
INSERT INTO `hot_search_item_tbl` VALUES (249, 4, 49, '醋门永存', 'https://www.douyin.com/search/醋门永存?type=general', '7635596', '2025-02-28 13:36:26');
INSERT INTO `hot_search_item_tbl` VALUES (250, 4, 50, 'bangbangbang闯入美食圈了', 'https://www.douyin.com/search/bangbangbang闯入美食圈了?type=general', '7633911', '2025-02-28 13:36:26');
INSERT INTO `hot_search_item_tbl` VALUES (251, 4, 1, '余华英被执行死刑', 'https://www.douyin.com/search/余华英被执行死刑?type=general', '12266020', '2025-02-28 13:37:28');
INSERT INTO `hot_search_item_tbl` VALUES (252, 4, 2, '库里12记三分砍56分', 'https://www.douyin.com/search/库里12记三分砍56分?type=general', '12100760', '2025-02-28 13:37:28');
INSERT INTO `hot_search_item_tbl` VALUES (253, 4, 3, '赏春还得是中式美学', 'https://www.douyin.com/search/赏春还得是中式美学?type=general', '11649757', '2025-02-28 13:37:28');
INSERT INTO `hot_search_item_tbl` VALUES (254, 4, 4, '泽连斯基抵达美国', 'https://www.douyin.com/search/泽连斯基抵达美国?type=general', '11623531', '2025-02-28 13:37:28');
INSERT INTO `hot_search_item_tbl` VALUES (255, 4, 5, '曾孙女找太爷爷告爷爷状', 'https://www.douyin.com/search/曾孙女找太爷爷告爷爷状?type=general', '10702320', '2025-02-28 13:37:28');
INSERT INTO `hot_search_item_tbl` VALUES (256, 4, 6, '直到上了大学才发现', 'https://www.douyin.com/search/直到上了大学才发现?type=general', '10537698', '2025-02-28 13:37:28');
INSERT INTO `hot_search_item_tbl` VALUES (257, 4, 7, '青春是无法回放的电影', 'https://www.douyin.com/search/青春是无法回放的电影?type=general', '9357342', '2025-02-28 13:37:28');
INSERT INTO `hot_search_item_tbl` VALUES (258, 4, 8, '梅毅走天下海南行：寻迹苏东坡', 'https://www.douyin.com/search/梅毅走天下海南行：寻迹苏东坡?type=general', '9298473', '2025-02-28 13:37:28');
INSERT INTO `hot_search_item_tbl` VALUES (259, 4, 9, '美司法部公布爱泼斯坦案首批文件', 'https://www.douyin.com/search/美司法部公布爱泼斯坦案首批文件?type=general', '9292093', '2025-02-28 13:37:28');
INSERT INTO `hot_search_item_tbl` VALUES (260, 4, 10, '小米SU7 Ultra正式上市', 'https://www.douyin.com/search/小米SU7 Ultra正式上市?type=general', '9284112', '2025-02-28 13:37:28');
INSERT INTO `hot_search_item_tbl` VALUES (261, 4, 11, '二月的最后一天', 'https://www.douyin.com/search/二月的最后一天?type=general', '9275575', '2025-02-28 13:37:28');
INSERT INTO `hot_search_item_tbl` VALUES (262, 4, 12, '辣椒炒辣椒更适合江西宝宝', 'https://www.douyin.com/search/辣椒炒辣椒更适合江西宝宝?type=general', '9074506', '2025-02-28 13:37:28');
INSERT INTO `hot_search_item_tbl` VALUES (263, 4, 13, '实测小米SU7 Ultra', 'https://www.douyin.com/search/实测小米SU7 Ultra?type=general', '8870812', '2025-02-28 13:37:28');
INSERT INTO `hot_search_item_tbl` VALUES (264, 4, 14, '无忧传媒回应与刘畊宏结束合作', 'https://www.douyin.com/search/无忧传媒回应与刘畊宏结束合作?type=general', '8805044', '2025-02-28 13:37:28');
INSERT INTO `hot_search_item_tbl` VALUES (265, 4, 15, '官方辟谣大熊猫宝力背上有洞', 'https://www.douyin.com/search/官方辟谣大熊猫宝力背上有洞?type=general', '8642143', '2025-02-28 13:37:28');
INSERT INTO `hot_search_item_tbl` VALUES (266, 4, 16, '小米双Ultra发布会', 'https://www.douyin.com/search/小米双Ultra发布会?type=general', '8563300', '2025-02-28 13:37:28');
INSERT INTO `hot_search_item_tbl` VALUES (267, 4, 17, '我老爸得了MVP是什么梗', 'https://www.douyin.com/search/我老爸得了MVP是什么梗?type=general', '8509669', '2025-02-28 13:37:28');
INSERT INTO `hot_search_item_tbl` VALUES (268, 4, 18, 'SU7 Ultra10分钟大定破6900台', 'https://www.douyin.com/search/SU7 Ultra10分钟大定破6900台?type=general', '8391625', '2025-02-28 13:37:29');
INSERT INTO `hot_search_item_tbl` VALUES (269, 4, 19, '哪吒2票房已超140亿', 'https://www.douyin.com/search/哪吒2票房已超140亿?type=general', '8382955', '2025-02-28 13:37:29');
INSERT INTO `hot_search_item_tbl` VALUES (270, 4, 20, 'EDG击败T1晋级胜决', 'https://www.douyin.com/search/EDG击败T1晋级胜决?type=general', '8236205', '2025-02-28 13:37:29');
INSERT INTO `hot_search_item_tbl` VALUES (271, 4, 21, '校园版李羲承进行曲', 'https://www.douyin.com/search/校园版李羲承进行曲?type=general', '7875533', '2025-02-28 13:37:29');
INSERT INTO `hot_search_item_tbl` VALUES (272, 4, 22, '难哄白敬亭红眼眶破碎感', 'https://www.douyin.com/search/难哄白敬亭红眼眶破碎感?type=general', '7834950', '2025-02-28 13:37:29');
INSERT INTO `hot_search_item_tbl` VALUES (273, 4, 23, '恋爱宝典之馕言文版', 'https://www.douyin.com/search/恋爱宝典之馕言文版?type=general', '7762211', '2025-02-28 13:37:29');
INSERT INTO `hot_search_item_tbl` VALUES (274, 4, 24, '薛之谦发抖音告别火星情报局', 'https://www.douyin.com/search/薛之谦发抖音告别火星情报局?type=general', '7743167', '2025-02-28 13:37:29');
INSERT INTO `hot_search_item_tbl` VALUES (275, 4, 25, '杨紫成毅最新路透', 'https://www.douyin.com/search/杨紫成毅最新路透?type=general', '7724991', '2025-02-28 13:37:29');
INSERT INTO `hot_search_item_tbl` VALUES (276, 4, 26, '百忙之中抽空谈个恋爱', 'https://www.douyin.com/search/百忙之中抽空谈个恋爱?type=general', '7719626', '2025-02-28 13:37:29');
INSERT INTO `hot_search_item_tbl` VALUES (277, 4, 27, '好想出去散散心', 'https://www.douyin.com/search/好想出去散散心?type=general', '7716934', '2025-02-28 13:37:29');
INSERT INTO `hot_search_item_tbl` VALUES (278, 4, 28, '雷军说SU7 Ultra预订量超乎想象', 'https://www.douyin.com/search/雷军说SU7 Ultra预订量超乎想象?type=general', '7713172', '2025-02-28 13:37:29');
INSERT INTO `hot_search_item_tbl` VALUES (279, 4, 29, '当秀场穿搭照进现实', 'https://www.douyin.com/search/当秀场穿搭照进现实?type=general', '7712496', '2025-02-28 13:37:29');
INSERT INTO `hot_search_item_tbl` VALUES (280, 4, 30, '全抖音都在蹲的精选内容', 'https://www.douyin.com/search/全抖音都在蹲的精选内容?type=general', '7698581', '2025-02-28 13:37:29');
INSERT INTO `hot_search_item_tbl` VALUES (281, 4, 31, '这届达人又在云南整活儿', 'https://www.douyin.com/search/这届达人又在云南整活儿?type=general', '7694677', '2025-02-28 13:37:29');
INSERT INTO `hot_search_item_tbl` VALUES (282, 4, 32, '迪丽热巴双丸子头造型', 'https://www.douyin.com/search/迪丽热巴双丸子头造型?type=general', '7690798', '2025-02-28 13:37:29');
INSERT INTO `hot_search_item_tbl` VALUES (283, 4, 33, '何苏叶得知沈惜凡分手暗爽', 'https://www.douyin.com/search/何苏叶得知沈惜凡分手暗爽?type=general', '7685272', '2025-02-28 13:37:29');
INSERT INTO `hot_search_item_tbl` VALUES (284, 4, 34, '方媛遭抢劫后报平安', 'https://www.douyin.com/search/方媛遭抢劫后报平安?type=general', '7679785', '2025-02-28 13:37:29');
INSERT INTO `hot_search_item_tbl` VALUES (285, 4, 35, '低配版雄鹰一样的女人', 'https://www.douyin.com/search/低配版雄鹰一样的女人?type=general', '7666494', '2025-02-28 13:37:29');
INSERT INTO `hot_search_item_tbl` VALUES (286, 4, 36, '张凌赫翻牌了爱你官抖吻戏花絮', 'https://www.douyin.com/search/张凌赫翻牌了爱你官抖吻戏花絮?type=general', '7665174', '2025-02-28 13:37:29');
INSERT INTO `hot_search_item_tbl` VALUES (287, 4, 37, '当年轻人来到"就业餐厅"门前', 'https://www.douyin.com/search/当年轻人来到"就业餐厅"门前?type=general', '7660156', '2025-02-28 13:37:29');
INSERT INTO `hot_search_item_tbl` VALUES (288, 4, 38, '桑延温以凡追妻变追夫', 'https://www.douyin.com/search/桑延温以凡追妻变追夫?type=general', '7659796', '2025-02-28 13:37:29');
INSERT INTO `hot_search_item_tbl` VALUES (289, 4, 39, '王心凌画质到底有多高清', 'https://www.douyin.com/search/王心凌画质到底有多高清?type=general', '7659606', '2025-02-28 13:37:29');
INSERT INTO `hot_search_item_tbl` VALUES (290, 4, 40, '感谢你曾经来过满满回忆杀', 'https://www.douyin.com/search/感谢你曾经来过满满回忆杀?type=general', '7651903', '2025-02-28 13:37:29');
INSERT INTO `hot_search_item_tbl` VALUES (291, 4, 41, '知情人回应：赵露思没有解约', 'https://www.douyin.com/search/知情人回应：赵露思没有解约?type=general', '7651131', '2025-02-28 13:37:29');
INSERT INTO `hot_search_item_tbl` VALUES (292, 4, 42, '国防部回应"卢旺达军队战斗力强"', 'https://www.douyin.com/search/国防部回应"卢旺达军队战斗力强"?type=general', '7646498', '2025-02-28 13:37:29');
INSERT INTO `hot_search_item_tbl` VALUES (293, 4, 43, '祝你永远Hakuna Matata', 'https://www.douyin.com/search/祝你永远Hakuna Matata?type=general', '7644744', '2025-02-28 13:37:29');
INSERT INTO `hot_search_item_tbl` VALUES (294, 4, 44, '淡彩穿搭让人眼前一亮又一亮', 'https://www.douyin.com/search/淡彩穿搭让人眼前一亮又一亮?type=general', '7644215', '2025-02-28 13:37:29');
INSERT INTO `hot_search_item_tbl` VALUES (295, 4, 45, '加拿大华人打卡王祖贤艾灸馆', 'https://www.douyin.com/search/加拿大华人打卡王祖贤艾灸馆?type=general', '7639885', '2025-02-28 13:37:30');
INSERT INTO `hot_search_item_tbl` VALUES (296, 4, 46, 'Bass舞蹈逐渐离谱', 'https://www.douyin.com/search/Bass舞蹈逐渐离谱?type=general', '7639737', '2025-02-28 13:37:30');
INSERT INTO `hot_search_item_tbl` VALUES (297, 4, 47, '机器人：就说快不快吧', 'https://www.douyin.com/search/机器人：就说快不快吧?type=general', '7638821', '2025-02-28 13:37:30');
INSERT INTO `hot_search_item_tbl` VALUES (298, 4, 48, 'LISA新专', 'https://www.douyin.com/search/LISA新专?type=general', '7636439', '2025-02-28 13:37:30');
INSERT INTO `hot_search_item_tbl` VALUES (299, 4, 49, '醋门永存', 'https://www.douyin.com/search/醋门永存?type=general', '7635349', '2025-02-28 13:37:30');
INSERT INTO `hot_search_item_tbl` VALUES (300, 4, 50, 'bangbangbang闯入美食圈了', 'https://www.douyin.com/search/bangbangbang闯入美食圈了?type=general', '7633793', '2025-02-28 13:37:30');
INSERT INTO `hot_search_item_tbl` VALUES (301, 4, 1, '余华英被执行死刑', 'https://www.douyin.com/search/余华英被执行死刑?type=general', '12172997', '2025-02-28 13:47:10');
INSERT INTO `hot_search_item_tbl` VALUES (302, 4, 2, '库里12记三分砍56分', 'https://www.douyin.com/search/库里12记三分砍56分?type=general', '12098605', '2025-02-28 13:47:10');
INSERT INTO `hot_search_item_tbl` VALUES (303, 4, 3, '赏春还得是中式美学', 'https://www.douyin.com/search/赏春还得是中式美学?type=general', '11579581', '2025-02-28 13:47:10');
INSERT INTO `hot_search_item_tbl` VALUES (304, 4, 4, '泽连斯基抵达美国', 'https://www.douyin.com/search/泽连斯基抵达美国?type=general', '11505693', '2025-02-28 13:47:10');
INSERT INTO `hot_search_item_tbl` VALUES (305, 4, 5, '曾孙女找太爷爷告爷爷状', 'https://www.douyin.com/search/曾孙女找太爷爷告爷爷状?type=general', '10672957', '2025-02-28 13:47:10');
INSERT INTO `hot_search_item_tbl` VALUES (306, 4, 6, '直到上了大学才发现', 'https://www.douyin.com/search/直到上了大学才发现?type=general', '10469450', '2025-02-28 13:47:10');
INSERT INTO `hot_search_item_tbl` VALUES (307, 4, 7, '青春是无法回放的电影', 'https://www.douyin.com/search/青春是无法回放的电影?type=general', '9324943', '2025-02-28 13:47:10');
INSERT INTO `hot_search_item_tbl` VALUES (308, 4, 8, '梅毅走天下海南行：寻迹苏东坡', 'https://www.douyin.com/search/梅毅走天下海南行：寻迹苏东坡?type=general', '9285874', '2025-02-28 13:47:10');
INSERT INTO `hot_search_item_tbl` VALUES (309, 4, 9, '美司法部公布爱泼斯坦案首批文件', 'https://www.douyin.com/search/美司法部公布爱泼斯坦案首批文件?type=general', '9233043', '2025-02-28 13:47:10');
INSERT INTO `hot_search_item_tbl` VALUES (310, 4, 10, '小米SU7 Ultra正式上市', 'https://www.douyin.com/search/小米SU7 Ultra正式上市?type=general', '9227658', '2025-02-28 13:47:10');
INSERT INTO `hot_search_item_tbl` VALUES (311, 4, 11, '无忧传媒回应与刘畊宏结束合作', 'https://www.douyin.com/search/无忧传媒回应与刘畊宏结束合作?type=general', '9081288', '2025-02-28 13:47:10');
INSERT INTO `hot_search_item_tbl` VALUES (312, 4, 12, '二月的最后一天', 'https://www.douyin.com/search/二月的最后一天?type=general', '9047136', '2025-02-28 13:47:10');
INSERT INTO `hot_search_item_tbl` VALUES (313, 4, 13, '实测小米SU7 Ultra', 'https://www.douyin.com/search/实测小米SU7 Ultra?type=general', '8744499', '2025-02-28 13:47:10');
INSERT INTO `hot_search_item_tbl` VALUES (314, 4, 14, '小米双Ultra发布会', 'https://www.douyin.com/search/小米双Ultra发布会?type=general', '8669699', '2025-02-28 13:47:10');
INSERT INTO `hot_search_item_tbl` VALUES (315, 4, 15, '官方辟谣大熊猫宝力背上有洞', 'https://www.douyin.com/search/官方辟谣大熊猫宝力背上有洞?type=general', '8513384', '2025-02-28 13:47:10');
INSERT INTO `hot_search_item_tbl` VALUES (316, 4, 16, '我老爸得了MVP是什么梗', 'https://www.douyin.com/search/我老爸得了MVP是什么梗?type=general', '8448711', '2025-02-28 13:47:10');
INSERT INTO `hot_search_item_tbl` VALUES (317, 4, 17, '这些照片不能晒', 'https://www.douyin.com/search/这些照片不能晒?type=general', '8421823', '2025-02-28 13:47:10');
INSERT INTO `hot_search_item_tbl` VALUES (318, 4, 18, 'SU7 Ultra10分钟大定破6900台', 'https://www.douyin.com/search/SU7 Ultra10分钟大定破6900台?type=general', '8413322', '2025-02-28 13:47:10');
INSERT INTO `hot_search_item_tbl` VALUES (319, 4, 19, '哪吒2票房已超140亿', 'https://www.douyin.com/search/哪吒2票房已超140亿?type=general', '8296369', '2025-02-28 13:47:10');
INSERT INTO `hot_search_item_tbl` VALUES (320, 4, 20, '难哄白敬亭红眼眶破碎感', 'https://www.douyin.com/search/难哄白敬亭红眼眶破碎感?type=general', '8286837', '2025-02-28 13:47:10');
INSERT INTO `hot_search_item_tbl` VALUES (321, 4, 21, 'EDG击败T1晋级胜决', 'https://www.douyin.com/search/EDG击败T1晋级胜决?type=general', '8054378', '2025-02-28 13:47:10');
INSERT INTO `hot_search_item_tbl` VALUES (322, 4, 22, '辣椒炒辣椒更适合江西宝宝', 'https://www.douyin.com/search/辣椒炒辣椒更适合江西宝宝?type=general', '7828034', '2025-02-28 13:47:10');
INSERT INTO `hot_search_item_tbl` VALUES (323, 4, 23, '当秀场穿搭照进现实', 'https://www.douyin.com/search/当秀场穿搭照进现实?type=general', '7752381', '2025-02-28 13:47:10');
INSERT INTO `hot_search_item_tbl` VALUES (324, 4, 24, '薛之谦发抖音告别火星情报局', 'https://www.douyin.com/search/薛之谦发抖音告别火星情报局?type=general', '7736806', '2025-02-28 13:47:10');
INSERT INTO `hot_search_item_tbl` VALUES (325, 4, 25, '恋爱宝典之馕言文版', 'https://www.douyin.com/search/恋爱宝典之馕言文版?type=general', '7713699', '2025-02-28 13:47:10');
INSERT INTO `hot_search_item_tbl` VALUES (326, 4, 26, '百忙之中抽空谈个恋爱', 'https://www.douyin.com/search/百忙之中抽空谈个恋爱?type=general', '7712663', '2025-02-28 13:47:10');
INSERT INTO `hot_search_item_tbl` VALUES (327, 4, 27, '好想出去散散心', 'https://www.douyin.com/search/好想出去散散心?type=general', '7709395', '2025-02-28 13:47:10');
INSERT INTO `hot_search_item_tbl` VALUES (328, 4, 28, '迪丽热巴双丸子头造型', 'https://www.douyin.com/search/迪丽热巴双丸子头造型?type=general', '7697276', '2025-02-28 13:47:10');
INSERT INTO `hot_search_item_tbl` VALUES (329, 4, 29, '全抖音都在蹲的精选内容', 'https://www.douyin.com/search/全抖音都在蹲的精选内容?type=general', '7694710', '2025-02-28 13:47:10');
INSERT INTO `hot_search_item_tbl` VALUES (330, 4, 30, '不要放过这个超可爱的田曦薇', 'https://www.douyin.com/search/不要放过这个超可爱的田曦薇?type=general', '7693377', '2025-02-28 13:47:10');
INSERT INTO `hot_search_item_tbl` VALUES (331, 4, 31, '杨紫成毅最新路透', 'https://www.douyin.com/search/杨紫成毅最新路透?type=general', '7692154', '2025-02-28 13:47:10');
INSERT INTO `hot_search_item_tbl` VALUES (332, 4, 32, '低配版雄鹰一样的女人', 'https://www.douyin.com/search/低配版雄鹰一样的女人?type=general', '7690347', '2025-02-28 13:47:11');
INSERT INTO `hot_search_item_tbl` VALUES (333, 4, 33, '这届达人又在云南整活儿', 'https://www.douyin.com/search/这届达人又在云南整活儿?type=general', '7680650', '2025-02-28 13:47:11');
INSERT INTO `hot_search_item_tbl` VALUES (334, 4, 34, '方媛遭抢劫后报平安', 'https://www.douyin.com/search/方媛遭抢劫后报平安?type=general', '7679119', '2025-02-28 13:47:11');
INSERT INTO `hot_search_item_tbl` VALUES (335, 4, 35, '张凌赫翻牌了爱你官抖吻戏花絮', 'https://www.douyin.com/search/张凌赫翻牌了爱你官抖吻戏花絮?type=general', '7677888', '2025-02-28 13:47:11');
INSERT INTO `hot_search_item_tbl` VALUES (336, 4, 36, '何苏叶得知沈惜凡分手暗爽', 'https://www.douyin.com/search/何苏叶得知沈惜凡分手暗爽?type=general', '7662802', '2025-02-28 13:47:11');
INSERT INTO `hot_search_item_tbl` VALUES (337, 4, 37, '当年轻人来到"就业餐厅"门前', 'https://www.douyin.com/search/当年轻人来到"就业餐厅"门前?type=general', '7661333', '2025-02-28 13:47:11');
INSERT INTO `hot_search_item_tbl` VALUES (338, 4, 38, '桑延温以凡追妻变追夫', 'https://www.douyin.com/search/桑延温以凡追妻变追夫?type=general', '7659817', '2025-02-28 13:47:11');
INSERT INTO `hot_search_item_tbl` VALUES (339, 4, 39, '王心凌画质到底有多高清', 'https://www.douyin.com/search/王心凌画质到底有多高清?type=general', '7656312', '2025-02-28 13:47:11');
INSERT INTO `hot_search_item_tbl` VALUES (340, 4, 40, '恋爱宝典之馕言文版', 'https://www.douyin.com/search/恋爱宝典之馕言文版?type=general', '7654503', '2025-02-28 13:47:11');
INSERT INTO `hot_search_item_tbl` VALUES (341, 4, 41, '知情人回应：赵露思没有解约', 'https://www.douyin.com/search/知情人回应：赵露思没有解约?type=general', '7654026', '2025-02-28 13:47:11');
INSERT INTO `hot_search_item_tbl` VALUES (342, 4, 42, '感谢你曾经来过满满回忆杀', 'https://www.douyin.com/search/感谢你曾经来过满满回忆杀?type=general', '7645218', '2025-02-28 13:47:11');
INSERT INTO `hot_search_item_tbl` VALUES (343, 4, 43, '淡彩穿搭让人眼前一亮又一亮', 'https://www.douyin.com/search/淡彩穿搭让人眼前一亮又一亮?type=general', '7640733', '2025-02-28 13:47:11');
INSERT INTO `hot_search_item_tbl` VALUES (344, 4, 44, '祝你永远Hakuna Matata', 'https://www.douyin.com/search/祝你永远Hakuna Matata?type=general', '7639560', '2025-02-28 13:47:11');
INSERT INTO `hot_search_item_tbl` VALUES (345, 4, 45, '加拿大华人打卡王祖贤艾灸馆', 'https://www.douyin.com/search/加拿大华人打卡王祖贤艾灸馆?type=general', '7639534', '2025-02-28 13:47:11');
INSERT INTO `hot_search_item_tbl` VALUES (346, 4, 46, '雷军说SU7 Ultra预订量超乎想象', 'https://www.douyin.com/search/雷军说SU7 Ultra预订量超乎想象?type=general', '7638105', '2025-02-28 13:47:11');
INSERT INTO `hot_search_item_tbl` VALUES (347, 4, 47, '雷军喊话大家别抠车标了', 'https://www.douyin.com/search/雷军喊话大家别抠车标了?type=general', '7634837', '2025-02-28 13:47:11');
INSERT INTO `hot_search_item_tbl` VALUES (348, 4, 48, '机器人：就说快不快吧', 'https://www.douyin.com/search/机器人：就说快不快吧?type=general', '7634046', '2025-02-28 13:47:11');
INSERT INTO `hot_search_item_tbl` VALUES (349, 4, 49, '详解哪吒2的票房分账规则', 'https://www.douyin.com/search/详解哪吒2的票房分账规则?type=general', '7632797', '2025-02-28 13:47:11');
INSERT INTO `hot_search_item_tbl` VALUES (350, 4, 50, 'Bass舞蹈逐渐离谱', 'https://www.douyin.com/search/Bass舞蹈逐渐离谱?type=general', '7632516', '2025-02-28 13:47:11');
INSERT INTO `hot_search_item_tbl` VALUES (351, 4, 1, '余华英被执行死刑', 'https://www.douyin.com/search/余华英被执行死刑?type=general', '11936658', '2025-02-28 15:07:37');
INSERT INTO `hot_search_item_tbl` VALUES (352, 4, 2, '库里12记三分砍56分', 'https://www.douyin.com/search/库里12记三分砍56分?type=general', '11386969', '2025-02-28 15:07:37');
INSERT INTO `hot_search_item_tbl` VALUES (353, 4, 3, '赏春还得是中式美学', 'https://www.douyin.com/search/赏春还得是中式美学?type=general', '11240709', '2025-02-28 15:07:37');
INSERT INTO `hot_search_item_tbl` VALUES (354, 4, 4, '绍伊古抵达北京', 'https://www.douyin.com/search/绍伊古抵达北京?type=general', '11164449', '2025-02-28 15:07:37');
INSERT INTO `hot_search_item_tbl` VALUES (355, 4, 5, '萌娃：你能不能成熟点', 'https://www.douyin.com/search/萌娃：你能不能成熟点?type=general', '10464343', '2025-02-28 15:07:37');
INSERT INTO `hot_search_item_tbl` VALUES (356, 4, 6, '曾孙女找太爷爷告爷爷状', 'https://www.douyin.com/search/曾孙女找太爷爷告爷爷状?type=general', '10370201', '2025-02-28 15:07:37');
INSERT INTO `hot_search_item_tbl` VALUES (357, 4, 7, '无忧传媒回应与刘畊宏结束合作', 'https://www.douyin.com/search/无忧传媒回应与刘畊宏结束合作?type=general', '9263264', '2025-02-28 15:07:38');
INSERT INTO `hot_search_item_tbl` VALUES (358, 4, 8, '直到上了大学才发现', 'https://www.douyin.com/search/直到上了大学才发现?type=general', '9180894', '2025-02-28 15:07:38');
INSERT INTO `hot_search_item_tbl` VALUES (359, 4, 9, '青春是无法回放的电影', 'https://www.douyin.com/search/青春是无法回放的电影?type=general', '9164489', '2025-02-28 15:07:38');
INSERT INTO `hot_search_item_tbl` VALUES (360, 4, 10, '大显身手正当其时', 'https://www.douyin.com/search/大显身手正当其时?type=general', '9157444', '2025-02-28 15:07:38');
INSERT INTO `hot_search_item_tbl` VALUES (361, 4, 11, 'A股', 'https://www.douyin.com/search/A股?type=general', '9130434', '2025-02-28 15:07:38');
INSERT INTO `hot_search_item_tbl` VALUES (362, 4, 12, '实测小米SU7 Ultra', 'https://www.douyin.com/search/实测小米SU7 Ultra?type=general', '9078587', '2025-02-28 15:07:38');
INSERT INTO `hot_search_item_tbl` VALUES (363, 4, 13, '小米SU7 Ultra正式上市', 'https://www.douyin.com/search/小米SU7 Ultra正式上市?type=general', '8965571', '2025-02-28 15:07:38');
INSERT INTO `hot_search_item_tbl` VALUES (364, 4, 14, '这些照片不能晒', 'https://www.douyin.com/search/这些照片不能晒?type=general', '8787906', '2025-02-28 15:07:38');
INSERT INTO `hot_search_item_tbl` VALUES (365, 4, 15, '天津否认"生二胎发钱"', 'https://www.douyin.com/search/天津否认"生二胎发钱"?type=general', '8745684', '2025-02-28 15:07:38');
INSERT INTO `hot_search_item_tbl` VALUES (366, 4, 16, '小米双Ultra发布会', 'https://www.douyin.com/search/小米双Ultra发布会?type=general', '8526449', '2025-02-28 15:07:38');
INSERT INTO `hot_search_item_tbl` VALUES (367, 4, 17, '桑延身体里的白敬亭觉醒了', 'https://www.douyin.com/search/桑延身体里的白敬亭觉醒了?type=general', '8420457', '2025-02-28 15:07:38');
INSERT INTO `hot_search_item_tbl` VALUES (368, 4, 18, '哪吒2票房已超140亿', 'https://www.douyin.com/search/哪吒2票房已超140亿?type=general', '8279007', '2025-02-28 15:07:38');
INSERT INTO `hot_search_item_tbl` VALUES (369, 4, 19, '我老爸得了MVP是什么梗', 'https://www.douyin.com/search/我老爸得了MVP是什么梗?type=general', '8110045', '2025-02-28 15:07:38');
INSERT INTO `hot_search_item_tbl` VALUES (370, 4, 20, '二月的最后一天', 'https://www.douyin.com/search/二月的最后一天?type=general', '8048441', '2025-02-28 15:07:38');
INSERT INTO `hot_search_item_tbl` VALUES (371, 4, 21, '早春省心穿搭', 'https://www.douyin.com/search/早春省心穿搭?type=general', '7792345', '2025-02-28 15:07:38');
INSERT INTO `hot_search_item_tbl` VALUES (372, 4, 22, '张凌赫翻牌了爱你官抖吻戏花絮', 'https://www.douyin.com/search/张凌赫翻牌了爱你官抖吻戏花絮?type=general', '7765330', '2025-02-28 15:07:38');
INSERT INTO `hot_search_item_tbl` VALUES (373, 4, 23, '女生的早春打工人穿搭', 'https://www.douyin.com/search/女生的早春打工人穿搭?type=general', '7743774', '2025-02-28 15:07:38');
INSERT INTO `hot_search_item_tbl` VALUES (374, 4, 24, '薛之谦发抖音告别火星情报局', 'https://www.douyin.com/search/薛之谦发抖音告别火星情报局?type=general', '7728141', '2025-02-28 15:07:38');
INSERT INTO `hot_search_item_tbl` VALUES (375, 4, 25, '恋爱宝典之馕言文版', 'https://www.douyin.com/search/恋爱宝典之馕言文版?type=general', '7713699', '2025-02-28 15:07:38');
INSERT INTO `hot_search_item_tbl` VALUES (376, 4, 26, '百忙之中抽空谈个恋爱', 'https://www.douyin.com/search/百忙之中抽空谈个恋爱?type=general', '7712663', '2025-02-28 15:07:38');
INSERT INTO `hot_search_item_tbl` VALUES (377, 4, 27, '辣椒炒辣椒更适合江西宝宝', 'https://www.douyin.com/search/辣椒炒辣椒更适合江西宝宝?type=general', '7711518', '2025-02-28 15:07:38');
INSERT INTO `hot_search_item_tbl` VALUES (378, 4, 28, '好想出去散散心', 'https://www.douyin.com/search/好想出去散散心?type=general', '7709395', '2025-02-28 15:07:38');
INSERT INTO `hot_search_item_tbl` VALUES (379, 4, 29, '迪丽热巴双丸子头造型', 'https://www.douyin.com/search/迪丽热巴双丸子头造型?type=general', '7697276', '2025-02-28 15:07:38');
INSERT INTO `hot_search_item_tbl` VALUES (380, 4, 30, '全抖音都在蹲的精选内容', 'https://www.douyin.com/search/全抖音都在蹲的精选内容?type=general', '7694710', '2025-02-28 15:07:38');
INSERT INTO `hot_search_item_tbl` VALUES (381, 4, 31, '不要放过这个超可爱的田曦薇', 'https://www.douyin.com/search/不要放过这个超可爱的田曦薇?type=general', '7693377', '2025-02-28 15:07:38');
INSERT INTO `hot_search_item_tbl` VALUES (382, 4, 32, '杨紫成毅最新路透', 'https://www.douyin.com/search/杨紫成毅最新路透?type=general', '7692154', '2025-02-28 15:07:38');
INSERT INTO `hot_search_item_tbl` VALUES (383, 4, 33, '校园版李羲承进行曲', 'https://www.douyin.com/search/校园版李羲承进行曲?type=general', '7690044', '2025-02-28 15:07:38');
INSERT INTO `hot_search_item_tbl` VALUES (384, 4, 34, '方媛遭抢劫后报平安', 'https://www.douyin.com/search/方媛遭抢劫后报平安?type=general', '7687706', '2025-02-28 15:07:39');
INSERT INTO `hot_search_item_tbl` VALUES (385, 4, 35, '这届达人又在云南整活儿', 'https://www.douyin.com/search/这届达人又在云南整活儿?type=general', '7681040', '2025-02-28 15:07:39');
INSERT INTO `hot_search_item_tbl` VALUES (386, 4, 36, '低配版雄鹰一样的女人', 'https://www.douyin.com/search/低配版雄鹰一样的女人?type=general', '7680642', '2025-02-28 15:07:39');
INSERT INTO `hot_search_item_tbl` VALUES (387, 4, 37, '当秀场穿搭照进现实', 'https://www.douyin.com/search/当秀场穿搭照进现实?type=general', '7664659', '2025-02-28 15:07:39');
INSERT INTO `hot_search_item_tbl` VALUES (388, 4, 38, '请来看周柯宇自己发的粉发', 'https://www.douyin.com/search/请来看周柯宇自己发的粉发?type=general', '7660639', '2025-02-28 15:07:39');
INSERT INTO `hot_search_item_tbl` VALUES (389, 4, 39, '桑延温以凡追妻变追夫', 'https://www.douyin.com/search/桑延温以凡追妻变追夫?type=general', '7654727', '2025-02-28 15:07:39');
INSERT INTO `hot_search_item_tbl` VALUES (390, 4, 40, '王心凌画质到底有多高清', 'https://www.douyin.com/search/王心凌画质到底有多高清?type=general', '7654536', '2025-02-28 15:07:39');
INSERT INTO `hot_search_item_tbl` VALUES (391, 4, 41, '何苏叶得知沈惜凡分手暗爽', 'https://www.douyin.com/search/何苏叶得知沈惜凡分手暗爽?type=general', '7653247', '2025-02-28 15:07:39');
INSERT INTO `hot_search_item_tbl` VALUES (392, 4, 42, '特朗普多次打断英首相讲话', 'https://www.douyin.com/search/特朗普多次打断英首相讲话?type=general', '7652060', '2025-02-28 15:07:39');
INSERT INTO `hot_search_item_tbl` VALUES (393, 4, 43, '雷军说SU7 Ultra预订量超乎想象', 'https://www.douyin.com/search/雷军说SU7 Ultra预订量超乎想象?type=general', '7650916', '2025-02-28 15:07:39');
INSERT INTO `hot_search_item_tbl` VALUES (394, 4, 44, '小狗会用行动表达爱', 'https://www.douyin.com/search/小狗会用行动表达爱?type=general', '7648740', '2025-02-28 15:07:39');
INSERT INTO `hot_search_item_tbl` VALUES (395, 4, 45, '详解哪吒2的票房分账规则', 'https://www.douyin.com/search/详解哪吒2的票房分账规则?type=general', '7644600', '2025-02-28 15:07:39');
INSERT INTO `hot_search_item_tbl` VALUES (396, 4, 46, '何浩楠在二号房独自发呆', 'https://www.douyin.com/search/何浩楠在二号房独自发呆?type=general', '7643432', '2025-02-28 15:07:39');
INSERT INTO `hot_search_item_tbl` VALUES (397, 4, 47, '淡彩穿搭让人眼前一亮又一亮', 'https://www.douyin.com/search/淡彩穿搭让人眼前一亮又一亮?type=general', '7642780', '2025-02-28 15:07:39');
INSERT INTO `hot_search_item_tbl` VALUES (398, 4, 48, '当年轻人来到"就业餐厅"门前', 'https://www.douyin.com/search/当年轻人来到"就业餐厅"门前?type=general', '7638576', '2025-02-28 15:07:39');
INSERT INTO `hot_search_item_tbl` VALUES (399, 4, 49, '感谢你曾经来过满满回忆杀', 'https://www.douyin.com/search/感谢你曾经来过满满回忆杀?type=general', '7636963', '2025-02-28 15:07:39');
INSERT INTO `hot_search_item_tbl` VALUES (400, 4, 50, '醋门永存', 'https://www.douyin.com/search/醋门永存?type=general', '7633926', '2025-02-28 15:07:39');
INSERT INTO `hot_search_item_tbl` VALUES (401, 4, 1, '余华英被执行死刑', 'https://www.douyin.com/search/余华英被执行死刑?type=general', '11940750', '2025-02-28 15:08:53');
INSERT INTO `hot_search_item_tbl` VALUES (402, 4, 2, '库里12记三分砍56分', 'https://www.douyin.com/search/库里12记三分砍56分?type=general', '11382100', '2025-02-28 15:08:53');
INSERT INTO `hot_search_item_tbl` VALUES (403, 4, 3, '赏春还得是中式美学', 'https://www.douyin.com/search/赏春还得是中式美学?type=general', '11239692', '2025-02-28 15:08:53');
INSERT INTO `hot_search_item_tbl` VALUES (404, 4, 4, '绍伊古抵达北京', 'https://www.douyin.com/search/绍伊古抵达北京?type=general', '11161789', '2025-02-28 15:08:53');
INSERT INTO `hot_search_item_tbl` VALUES (405, 4, 5, '萌娃：你能不能成熟点', 'https://www.douyin.com/search/萌娃：你能不能成熟点?type=general', '10399819', '2025-02-28 15:08:53');
INSERT INTO `hot_search_item_tbl` VALUES (406, 4, 6, '曾孙女找太爷爷告爷爷状', 'https://www.douyin.com/search/曾孙女找太爷爷告爷爷状?type=general', '10383542', '2025-02-28 15:08:53');
INSERT INTO `hot_search_item_tbl` VALUES (407, 4, 7, '无忧传媒回应与刘畊宏结束合作', 'https://www.douyin.com/search/无忧传媒回应与刘畊宏结束合作?type=general', '9263130', '2025-02-28 15:08:53');
INSERT INTO `hot_search_item_tbl` VALUES (408, 4, 8, 'A股', 'https://www.douyin.com/search/A股?type=general', '9207274', '2025-02-28 15:08:53');
INSERT INTO `hot_search_item_tbl` VALUES (409, 4, 9, '直到上了大学才发现', 'https://www.douyin.com/search/直到上了大学才发现?type=general', '9186791', '2025-02-28 15:08:53');
INSERT INTO `hot_search_item_tbl` VALUES (410, 4, 10, '大显身手正当其时', 'https://www.douyin.com/search/大显身手正当其时?type=general', '9166419', '2025-02-28 15:08:53');
INSERT INTO `hot_search_item_tbl` VALUES (411, 4, 11, '小米SU7 Ultra正式上市', 'https://www.douyin.com/search/小米SU7 Ultra正式上市?type=general', '9158529', '2025-02-28 15:08:53');
INSERT INTO `hot_search_item_tbl` VALUES (412, 4, 12, '实测小米SU7 Ultra', 'https://www.douyin.com/search/实测小米SU7 Ultra?type=general', '9079766', '2025-02-28 15:08:54');
INSERT INTO `hot_search_item_tbl` VALUES (413, 4, 13, '青春是无法回放的电影', 'https://www.douyin.com/search/青春是无法回放的电影?type=general', '8966262', '2025-02-28 15:08:54');
INSERT INTO `hot_search_item_tbl` VALUES (414, 4, 14, '这些照片不能晒', 'https://www.douyin.com/search/这些照片不能晒?type=general', '8792301', '2025-02-28 15:08:54');
INSERT INTO `hot_search_item_tbl` VALUES (415, 4, 15, '天津否认"生二胎发钱"', 'https://www.douyin.com/search/天津否认"生二胎发钱"?type=general', '8735592', '2025-02-28 15:08:54');
INSERT INTO `hot_search_item_tbl` VALUES (416, 4, 16, '小米双Ultra发布会', 'https://www.douyin.com/search/小米双Ultra发布会?type=general', '8524353', '2025-02-28 15:08:54');
INSERT INTO `hot_search_item_tbl` VALUES (417, 4, 17, '桑延身体里的白敬亭觉醒了', 'https://www.douyin.com/search/桑延身体里的白敬亭觉醒了?type=general', '8420457', '2025-02-28 15:08:54');
INSERT INTO `hot_search_item_tbl` VALUES (418, 4, 18, '哪吒2票房已超140亿', 'https://www.douyin.com/search/哪吒2票房已超140亿?type=general', '8253363', '2025-02-28 15:08:54');
INSERT INTO `hot_search_item_tbl` VALUES (419, 4, 19, '我老爸得了MVP是什么梗', 'https://www.douyin.com/search/我老爸得了MVP是什么梗?type=general', '8105762', '2025-02-28 15:08:54');
INSERT INTO `hot_search_item_tbl` VALUES (420, 4, 20, '二月的最后一天', 'https://www.douyin.com/search/二月的最后一天?type=general', '8048082', '2025-02-28 15:08:54');
INSERT INTO `hot_search_item_tbl` VALUES (421, 4, 21, '早春省心穿搭', 'https://www.douyin.com/search/早春省心穿搭?type=general', '7791571', '2025-02-28 15:08:54');
INSERT INTO `hot_search_item_tbl` VALUES (422, 4, 22, '张凌赫翻牌了爱你官抖吻戏花絮', 'https://www.douyin.com/search/张凌赫翻牌了爱你官抖吻戏花絮?type=general', '7760588', '2025-02-28 15:08:54');
INSERT INTO `hot_search_item_tbl` VALUES (423, 4, 23, '女生的早春打工人穿搭', 'https://www.douyin.com/search/女生的早春打工人穿搭?type=general', '7743736', '2025-02-28 15:08:54');
INSERT INTO `hot_search_item_tbl` VALUES (424, 4, 24, '薛之谦发抖音告别火星情报局', 'https://www.douyin.com/search/薛之谦发抖音告别火星情报局?type=general', '7732671', '2025-02-28 15:08:54');
INSERT INTO `hot_search_item_tbl` VALUES (425, 4, 25, '恋爱宝典之馕言文版', 'https://www.douyin.com/search/恋爱宝典之馕言文版?type=general', '7713843', '2025-02-28 15:08:54');
INSERT INTO `hot_search_item_tbl` VALUES (426, 4, 26, '百忙之中抽空谈个恋爱', 'https://www.douyin.com/search/百忙之中抽空谈个恋爱?type=general', '7713345', '2025-02-28 15:08:54');
INSERT INTO `hot_search_item_tbl` VALUES (427, 4, 27, '当秀场穿搭照进现实', 'https://www.douyin.com/search/当秀场穿搭照进现实?type=general', '7710689', '2025-02-28 15:08:54');
INSERT INTO `hot_search_item_tbl` VALUES (428, 4, 28, '好想出去散散心', 'https://www.douyin.com/search/好想出去散散心?type=general', '7702841', '2025-02-28 15:08:54');
INSERT INTO `hot_search_item_tbl` VALUES (429, 4, 29, '迪丽热巴双丸子头造型', 'https://www.douyin.com/search/迪丽热巴双丸子头造型?type=general', '7695093', '2025-02-28 15:08:54');
INSERT INTO `hot_search_item_tbl` VALUES (430, 4, 30, '全抖音都在蹲的精选内容', 'https://www.douyin.com/search/全抖音都在蹲的精选内容?type=general', '7694998', '2025-02-28 15:08:54');
INSERT INTO `hot_search_item_tbl` VALUES (431, 4, 31, '不要放过这个超可爱的田曦薇', 'https://www.douyin.com/search/不要放过这个超可爱的田曦薇?type=general', '7692767', '2025-02-28 15:08:54');
INSERT INTO `hot_search_item_tbl` VALUES (432, 4, 32, '杨紫成毅最新路透', 'https://www.douyin.com/search/杨紫成毅最新路透?type=general', '7688735', '2025-02-28 15:08:54');
INSERT INTO `hot_search_item_tbl` VALUES (433, 4, 33, '校园版李羲承进行曲', 'https://www.douyin.com/search/校园版李羲承进行曲?type=general', '7686414', '2025-02-28 15:08:54');
INSERT INTO `hot_search_item_tbl` VALUES (434, 4, 34, '方媛遭抢劫后报平安', 'https://www.douyin.com/search/方媛遭抢劫后报平安?type=general', '7681654', '2025-02-28 15:08:54');
INSERT INTO `hot_search_item_tbl` VALUES (435, 4, 35, '这届达人又在云南整活儿', 'https://www.douyin.com/search/这届达人又在云南整活儿?type=general', '7680583', '2025-02-28 15:08:54');
INSERT INTO `hot_search_item_tbl` VALUES (436, 4, 36, '低配版雄鹰一样的女人', 'https://www.douyin.com/search/低配版雄鹰一样的女人?type=general', '7679483', '2025-02-28 15:08:54');
INSERT INTO `hot_search_item_tbl` VALUES (437, 4, 37, '辣椒炒辣椒更适合江西宝宝', 'https://www.douyin.com/search/辣椒炒辣椒更适合江西宝宝?type=general', '7663708', '2025-02-28 15:08:55');
INSERT INTO `hot_search_item_tbl` VALUES (438, 4, 38, '请来看周柯宇自己发的粉发', 'https://www.douyin.com/search/请来看周柯宇自己发的粉发?type=general', '7660647', '2025-02-28 15:08:55');
INSERT INTO `hot_search_item_tbl` VALUES (439, 4, 39, '桑延温以凡追妻变追夫', 'https://www.douyin.com/search/桑延温以凡追妻变追夫?type=general', '7658296', '2025-02-28 15:08:55');
INSERT INTO `hot_search_item_tbl` VALUES (440, 4, 40, '王心凌画质到底有多高清', 'https://www.douyin.com/search/王心凌画质到底有多高清?type=general', '7654643', '2025-02-28 15:08:55');
INSERT INTO `hot_search_item_tbl` VALUES (441, 4, 41, '何苏叶得知沈惜凡分手暗爽', 'https://www.douyin.com/search/何苏叶得知沈惜凡分手暗爽?type=general', '7654425', '2025-02-28 15:08:55');
INSERT INTO `hot_search_item_tbl` VALUES (442, 4, 42, '小狗会用行动表达爱', 'https://www.douyin.com/search/小狗会用行动表达爱?type=general', '7651530', '2025-02-28 15:08:55');
INSERT INTO `hot_search_item_tbl` VALUES (443, 4, 43, '特朗普多次打断英首相讲话', 'https://www.douyin.com/search/特朗普多次打断英首相讲话?type=general', '7651269', '2025-02-28 15:08:55');
INSERT INTO `hot_search_item_tbl` VALUES (444, 4, 44, '详解哪吒2的票房分账规则', 'https://www.douyin.com/search/详解哪吒2的票房分账规则?type=general', '7649463', '2025-02-28 15:08:55');
INSERT INTO `hot_search_item_tbl` VALUES (445, 4, 45, '雷军说SU7 Ultra预订量超乎想象', 'https://www.douyin.com/search/雷军说SU7 Ultra预订量超乎想象?type=general', '7648192', '2025-02-28 15:08:55');
INSERT INTO `hot_search_item_tbl` VALUES (446, 4, 46, '当年轻人来到"就业餐厅"门前', 'https://www.douyin.com/search/当年轻人来到"就业餐厅"门前?type=general', '7645600', '2025-02-28 15:08:55');
INSERT INTO `hot_search_item_tbl` VALUES (447, 4, 47, '何浩楠在二号房独自发呆', 'https://www.douyin.com/search/何浩楠在二号房独自发呆?type=general', '7642487', '2025-02-28 15:08:55');
INSERT INTO `hot_search_item_tbl` VALUES (448, 4, 48, '祝你永远Hakuna Matata', 'https://www.douyin.com/search/祝你永远Hakuna Matata?type=general', '7642193', '2025-02-28 15:08:55');
INSERT INTO `hot_search_item_tbl` VALUES (449, 4, 49, '淡彩穿搭让人眼前一亮又一亮', 'https://www.douyin.com/search/淡彩穿搭让人眼前一亮又一亮?type=general', '7638379', '2025-02-28 15:08:55');
INSERT INTO `hot_search_item_tbl` VALUES (450, 4, 50, '感谢你曾经来过满满回忆杀', 'https://www.douyin.com/search/感谢你曾经来过满满回忆杀?type=general', '7637180', '2025-02-28 15:08:55');

-- ----------------------------
-- Table structure for must_module_tbl
-- ----------------------------
DROP TABLE IF EXISTS `must_module_tbl`;
CREATE TABLE `must_module_tbl`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网站icon',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '跳转地址',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '必备功能模块表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of must_module_tbl
-- ----------------------------
INSERT INTO `must_module_tbl` VALUES (1, '下厨房', '家常菜谱分享', 'https://www.xiachufang.com/favicon.ico', 'https://www.xiachufang.com/', 'life', '2025-03-27 17:48:23', '2025-03-27 18:20:33');
INSERT INTO `must_module_tbl` VALUES (2, '豆果美食', '美食菜谱社区', 'https://www.douguo.com/favicon.ico', 'https://www.douguo.com/', 'life', '2025-03-27 17:48:23', '2025-03-27 18:20:33');
INSERT INTO `must_module_tbl` VALUES (3, '好好住', '家居装修社区', 'https://www.helloimg.com/i/2025/03/27/67e50dfcd3d9a.ico', 'https://www.haohaozhu.cn/community/discover/keting', 'life', '2025-03-27 17:48:23', '2025-03-27 18:20:33');
INSERT INTO `must_module_tbl` VALUES (4, '一兜糖', '家居生活社区', 'https://www.yidoutang.com/favicon.ico', 'https://www.yidoutang.com/case/', 'life', '2025-03-27 17:48:23', '2025-03-27 18:20:33');
INSERT INTO `must_module_tbl` VALUES (5, '丁香医生', '健康生活平台', 'https://dxy.com/favicon.ico', 'https://dxy.com/', 'life', '2025-03-27 17:48:23', '2025-03-27 18:20:33');
INSERT INTO `must_module_tbl` VALUES (6, '宝宝树', '育儿交流社区', 'https://www.babytree.com/favicon.ico', 'https://www.babytree.com/index.php', 'life', '2025-03-27 17:48:23', '2025-03-27 18:20:34');
INSERT INTO `must_module_tbl` VALUES (7, '马蜂窝', '旅游攻略社区', 'https://www.mafengwo.cn/favicon.ico', 'https://www.mafengwo.cn/', 'life', '2025-03-27 17:48:23', '2025-03-27 18:20:34');
INSERT INTO `must_module_tbl` VALUES (8, '游侠客', '旅行分享平台', 'https://www.youxiake.com/favicon.ico', 'https://www.youxiake.com/', 'life', '2025-03-27 17:48:23', '2025-03-27 18:20:34');
INSERT INTO `must_module_tbl` VALUES (9, '豆瓣', '兴趣社区', 'https://www.douban.com/favicon.ico', 'https://www.douban.com/', 'relax', '2025-03-27 18:20:12', '2025-03-27 18:20:43');
INSERT INTO `must_module_tbl` VALUES (10, '花瓣网', '设计灵感随心找', 'https://huaban.com/favicon.ico', 'https://huaban.com/', 'relax', '2025-03-27 18:20:12', '2025-03-28 10:37:43');
INSERT INTO `must_module_tbl` VALUES (11, '简书', '创作阅读好去处', 'https://www.jianshu.com/favicon.ico', 'https://www.jianshu.com/', 'relax', '2025-03-27 18:20:12', '2025-03-28 10:37:53');
INSERT INTO `must_module_tbl` VALUES (12, '微博', '实时资讯', 'https://www.weibo.com/favicon.ico', 'https://weibo.com/', 'relax', '2025-03-27 18:20:12', '2025-03-27 18:20:43');
INSERT INTO `must_module_tbl` VALUES (13, '小霸王', '经典游戏回忆杀', 'https://www.helloimg.com/i/2025/03/27/67e520f36e266.png', 'https://www.yikm.net/', 'relax', '2025-03-27 18:20:12', '2025-03-28 10:37:22');
INSERT INTO `must_module_tbl` VALUES (14, 'B站', '趣味视频乐无边', 'https://www.bilibili.com/favicon.ico', 'https://www.bilibili.com/', 'relax', '2025-03-27 18:20:12', '2025-03-28 10:40:18');
INSERT INTO `must_module_tbl` VALUES (15, '全历史', '历史知识大宝藏', 'https://www.allhistory.com/favicon.ico', 'https://www.allhistory.com/', 'relax', '2025-03-27 18:20:12', '2025-03-28 10:37:16');
INSERT INTO `must_module_tbl` VALUES (16, '小红书', '你的生活指南', 'https://www.xiaohongshu.com/favicon.ico', 'https://www.xiaohongshu.com/explore', 'relax', '2025-03-27 18:20:12', '2025-03-28 09:21:14');
INSERT INTO `must_module_tbl` VALUES (17, '有言AI', 'AI创作好帮手', 'https://www.youyan3d.com/favicon.ico', 'https://www.youyan3d.com/platform', 'util', '2025-03-28 09:42:29', '2025-03-28 10:37:00');
INSERT INTO `must_module_tbl` VALUES (18, '绘蛙', 'AI绘画新体验', 'https://www.ihuiwa.com/favicon.ico', 'https://www.ihuiwa.com/workspace/ai-video/from-image?huiwaInviteCode=EUPJSL', 'util', '2025-03-28 09:44:25', '2025-03-28 10:36:58');
INSERT INTO `must_module_tbl` VALUES (19, '草料二维码', '二维码制作轻松做', 'https://cli.im/favicon.ico', 'https://cli.im/', 'util', '2025-03-28 09:46:52', '2025-03-28 10:36:51');
INSERT INTO `must_module_tbl` VALUES (20, '配色导航', '配色设计好帮手', 'https://www.uisdc.com/favicon.ico', 'https://hao.uisdc.com/color/', 'util', '2025-03-28 09:47:23', '2025-03-28 10:36:46');
INSERT INTO `must_module_tbl` VALUES (21, '零代码', '开发神器', 'https://www.lingdaima.com/favicon.ico', 'https://www.lingdaima.com/', 'util', '2025-03-28 09:48:10', '2025-03-28 10:36:37');
INSERT INTO `must_module_tbl` VALUES (22, '白日梦AI', '创意激发好帮手', 'https://cdn.brmgo.cn/static/images/logo-icon.png', 'https://aibrm.com/?code=fx_cdo', 'util', '2025-03-28 09:49:35', '2025-03-28 10:36:33');
INSERT INTO `must_module_tbl` VALUES (23, '爱激活', '软件激活全掌握', 'https://www.ajihuo.com/favicon.ico', 'https://www.ajihuo.com/', 'util', '2025-03-28 09:57:11', '2025-03-28 10:39:42');
INSERT INTO `must_module_tbl` VALUES (24, '量子位', '聚焦人工智能前沿', 'https://www.qbitai.com/wp-content/themes/liangziwei/imgnew/favicon.ico', 'https://www.qbitai.com/', 'science', '2025-03-28 10:02:07', '2025-03-28 10:38:10');
INSERT INTO `must_module_tbl` VALUES (25, '虎嗅网', '创新资讯一网打尽', 'https://www.huxiu.com/favicon.ico', 'https://www.huxiu.com/', 'science', '2025-03-28 10:02:18', '2025-03-28 10:38:15');
INSERT INTO `must_module_tbl` VALUES (26, '钛媒体', '科技动态早知道', 'https://www.tmtpost.com/favicon.ico', 'https://www.tmtpost.com/', 'science', '2025-03-28 10:02:32', '2025-03-28 10:38:21');
INSERT INTO `must_module_tbl` VALUES (27, '36氪', '创业投资风向标', 'https://36kr.com/favicon.ico', 'https://36kr.com/', 'science', '2025-03-28 10:02:47', '2025-03-28 10:38:26');
INSERT INTO `must_module_tbl` VALUES (28, '创业邦', '创业创新好帮手', 'https://www.cyzone.cn/img/favicon.ico', 'https://www.cyzone.cn/', 'science', '2025-03-28 10:02:57', '2025-03-28 10:38:33');
INSERT INTO `must_module_tbl` VALUES (29, '差评', '科技趣闻全知晓', NULL, NULL, NULL, '2025-03-28 10:03:02', '2025-03-28 18:21:36');
INSERT INTO `must_module_tbl` VALUES (30, '极客公园', '极客精神创未来', 'https://imgslim.geekpark.net/geekpark-icon-196-black.png', 'https://www.geekpark.net/', 'science', '2025-03-28 10:03:13', '2025-03-28 10:38:48');
INSERT INTO `must_module_tbl` VALUES (31, 'IT桔子', '科技行业动态全掌握', 'https://www.itjuzi.com/favicon.ico', 'https://www.itjuzi.com/', 'science', '2025-03-28 10:03:23', '2025-03-28 10:38:45');
INSERT INTO `must_module_tbl` VALUES (34, '少数派', '高效工作，品质生活', 'https://cdn-static.sspai.com/favicon/sspai.ico', 'https://sspai.com/', 'science', '2025-03-28 18:06:59', '2025-03-28 18:21:30');

-- ----------------------------
-- Table structure for platform_tbl
-- ----------------------------
DROP TABLE IF EXISTS `platform_tbl`;
CREATE TABLE `platform_tbl`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '平台名称',
  `api_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '热搜数据的API地址',
  `api_params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '携带参数',
  `visit_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问的API地址',
  `visit_params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '携带参数',
  PRIMARY KEY (`id`, `name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of platform_tbl
-- ----------------------------
INSERT INTO `platform_tbl` VALUES (1, 'baidu', 'https://top.baidu.com/api/board', 'platform=wise&tab=realtime', NULL, NULL);
INSERT INTO `platform_tbl` VALUES (2, 'zhihu', 'https://www.zhihu.com/api/v3/feed/topstory/hot-lists/total', NULL, NULL, NULL);
INSERT INTO `platform_tbl` VALUES (3, 'toutiao', 'https://www.toutiao.com/hot-event/hot-board/', 'origin=toutiao_pc', NULL, NULL);
INSERT INTO `platform_tbl` VALUES (4, 'douyin', 'https://www.iesdouyin.com/web/api/v2/hotsearch/billboard/word/', NULL, 'https://www.douyin.com/search/', 'type=general');
INSERT INTO `platform_tbl` VALUES (5, 'bilibili', 'https://api.bilibili.com/x/web-interface/ranking/v2', NULL, '', '');
INSERT INTO `platform_tbl` VALUES (6, 'tieba', 'https://tieba.baidu.com/hottopic/browse/topicList', NULL, '', '');
INSERT INTO `platform_tbl` VALUES (7, 'tengxunwang', 'https://i.news.qq.com/web_backend/getHotQuestionListForPC', NULL, '', '');
INSERT INTO `platform_tbl` VALUES (8, 'tengxunyule', 'https://i.news.qq.com/web_backend/getHotQuestionListForPC', 'ids_hash=&offset=0&page_size=20&appver=15.5_qqnews_7.1.60&rank_id=ent', '', '');
INSERT INTO `platform_tbl` VALUES (9, 'juejin', 'https://api.juejin.cn/content_api/v1/content/article_rank', 'category_id=1&type=hot', '', '');
INSERT INTO `platform_tbl` VALUES (10, 'csdn', 'https://blog.csdn.net/phoenix/web/blog/hot-rank', 'page=1&pageSize=20', '', '');
INSERT INTO `platform_tbl` VALUES (11, 'weibo', 'https://weibo.com/ajax/side/hotSearch', 'type=hot', '', '');
INSERT INTO `platform_tbl` VALUES (12, 'tianqi', 'https://i.news.qq.com/i/getWeather', 'adcode=510100&from_scene=6', NULL, NULL);
INSERT INTO `platform_tbl` VALUES (13, 'hupu', 'https://bbs.hupu.com/love', NULL, NULL, NULL);
INSERT INTO `platform_tbl` VALUES (14, 'sougou', 'https://go.ie.sogou.com/hot_ranks', NULL, 'https://www.sogou.com/web?ie=utf8&query=', NULL);

-- ----------------------------
-- Table structure for feedback_tbl
-- ----------------------------
DROP TABLE IF EXISTS `feedback_tbl`;
CREATE TABLE `feedback_tbl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `content` text NOT NULL COMMENT '反馈内容',
  `contact` varchar(100) DEFAULT NULL COMMENT '联系方式',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0-未处理，1-已处理',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户反馈表';

SET FOREIGN_KEY_CHECKS = 1;
