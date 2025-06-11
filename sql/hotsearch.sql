/*
 Navicat Premium Data Transfer

 Source Server         : hotsearch
 Source Server Type    : MySQL
 Source Server Version : 50743
 Source Host           : 117.72.117.19:3306
 Source Schema         : hotsearch

 Target Server Type    : MySQL
 Target Server Version : 50743
 File Encoding         : 65001

 Date: 11/06/2025 11:23:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for feedback_tbl
-- ----------------------------
DROP TABLE IF EXISTS `feedback_tbl`;
CREATE TABLE `feedback_tbl`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '反馈内容',
  `contact` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态：0-未处理，1-已处理',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户反馈表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedback_tbl
-- ----------------------------
INSERT INTO `feedback_tbl` VALUES (1, '知乎热搜榜单又崩了\n', '', '2025-05-29 09:45:24', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '必备功能模块表' ROW_FORMAT = Dynamic;

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
INSERT INTO `must_module_tbl` VALUES (35, 'Process', '免费在线流程图思维导图', 'https://www.processon.com/public_login/favicon.983368c6.ico', 'https://www.processon.com/', 'util', '2025-05-20 10:06:20', '2025-05-20 10:08:20');

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
INSERT INTO `platform_tbl` VALUES (5, 'bilibili', 'https://api.bilibili.com/x/web-interface/popular', NULL, '', '');
INSERT INTO `platform_tbl` VALUES (6, 'tieba', 'https://tieba.baidu.com/hottopic/browse/topicList', NULL, '', '');
INSERT INTO `platform_tbl` VALUES (7, 'tengxunwang', 'https://i.news.qq.com/web_backend/getHotQuestionListForPC', NULL, '', '');
INSERT INTO `platform_tbl` VALUES (8, 'tengxunyule', 'https://i.news.qq.com/web_backend/getHotQuestionListForPC', 'ids_hash=&offset=0&page_size=20&appver=15.5_qqnews_7.1.60&rank_id=ent', '', '');
INSERT INTO `platform_tbl` VALUES (9, 'juejin', 'https://api.juejin.cn/content_api/v1/content/article_rank', 'category_id=1&type=hot', '', '');
INSERT INTO `platform_tbl` VALUES (10, 'csdn', 'https://blog.csdn.net/phoenix/web/blog/hot-rank', 'page=1&pageSize=20', '', '');
INSERT INTO `platform_tbl` VALUES (11, 'weibo', 'https://weibo.com/ajax/side/hotSearch', 'type=hot', '', '');
INSERT INTO `platform_tbl` VALUES (12, 'tianqi', 'https://i.news.qq.com/i/getWeather', 'adcode=510100&from_scene=6', NULL, NULL);
INSERT INTO `platform_tbl` VALUES (13, 'hupu', 'https://bbs.hupu.com/love', NULL, NULL, NULL);
INSERT INTO `platform_tbl` VALUES (14, 'sougou', 'https://go.ie.sogou.com/hot_ranks', NULL, 'https://www.sogou.com/web?ie=utf8&query=', NULL);

SET FOREIGN_KEY_CHECKS = 1;
