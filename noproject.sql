/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80022
Source Host           : localhost:3306
Source Database       : noproject

Target Server Type    : MYSQL
Target Server Version : 80022
File Encoding         : 65001

Date: 2023-03-15 21:40:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '内容',
  `user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '发布人',
  `time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of article
-- ----------------------------

-- ----------------------------
-- Table structure for building
-- ----------------------------
DROP TABLE IF EXISTS `building`;
CREATE TABLE `building` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '楼栋',
  `value` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '单元',
  `pid` int DEFAULT NULL COMMENT '父级id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of building
-- ----------------------------

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程名称',
  `score` int DEFAULT NULL COMMENT '学分',
  `times` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '上课时间',
  `state` tinyint(1) DEFAULT NULL COMMENT '是否开课',
  `teacher_id` int DEFAULT NULL COMMENT '授课老师id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of course
-- ----------------------------

-- ----------------------------
-- Table structure for student_course
-- ----------------------------
DROP TABLE IF EXISTS `student_course`;
CREATE TABLE `student_course` (
  `student_id` int NOT NULL,
  `course_id` int NOT NULL,
  PRIMARY KEY (`student_id`,`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of student_course
-- ----------------------------

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '内容',
  `user_id` int DEFAULT NULL COMMENT '评论人id',
  `time` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '评论时间',
  `pid` int DEFAULT NULL COMMENT '父id',
  `origin_id` int DEFAULT NULL COMMENT '最上级评论id',
  `article_id` int DEFAULT NULL COMMENT '关联文章的id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_comment
-- ----------------------------

-- ----------------------------
-- Table structure for t_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict` (
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `value` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '内容',
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_dict
-- ----------------------------
INSERT INTO `t_dict` VALUES ('user', 'el-icon-user', 'icon');
INSERT INTO `t_dict` VALUES ('house', 'el-icon-house', 'icon');
INSERT INTO `t_dict` VALUES ('menu', 'el-icon-menu', 'icon');
INSERT INTO `t_dict` VALUES ('s-custom', 'el-icon-s-custom', 'icon');
INSERT INTO `t_dict` VALUES ('s-grid', 'el-icon-s-grid', 'icon');
INSERT INTO `t_dict` VALUES ('document', 'el-icon-document', 'icon');
INSERT INTO `t_dict` VALUES ('coffee', 'el-icon-coffee', 'icon');
INSERT INTO `t_dict` VALUES ('s-marketing', 'el-icon-s-marketing', 'icon');

-- ----------------------------
-- Table structure for t_file
-- ----------------------------
DROP TABLE IF EXISTS `t_file`;
CREATE TABLE `t_file` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件类型',
  `size` bigint DEFAULT NULL COMMENT '文件大小(kb)',
  `url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '下载链接',
  `md5` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件md5',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '是否删除',
  `enable` tinyint(1) DEFAULT NULL COMMENT '是否禁用链接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_file
-- ----------------------------

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路径',
  `icon` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图标',
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `pid` int DEFAULT NULL COMMENT '父级id',
  `page_path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '页面路径',
  `sort_num` int DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('2', '数据报表', '/dashbord', 'el-icon-s-marketing', '11', null, 'Dashbord', '100');
INSERT INTO `t_menu` VALUES ('4', '系统管理', null, 'el-icon-s-grid', null, null, null, null);
INSERT INTO `t_menu` VALUES ('5', '用户管理', '/user', 'el-icon-user', null, '4', 'User', '301');
INSERT INTO `t_menu` VALUES ('6', '角色管理', '/role', 'el-icon-s-custom', null, '4', 'Role', '302');
INSERT INTO `t_menu` VALUES ('7', '菜单管理', '/menu', 'el-icon-menu', null, '4', 'Menu', '303');
INSERT INTO `t_menu` VALUES ('8', '文件管理', '/file', 'el-icon-document', null, '4', 'File', '304');
INSERT INTO `t_menu` VALUES ('9', '捐赠', '/donate', 'el-icon-coffee', null, null, 'Donate', '200');
INSERT INTO `t_menu` VALUES ('10', '主页', '/home', 'el-icon-house', null, null, 'Home', '0');
INSERT INTO `t_menu` VALUES ('39', '课程管理', '/course', 'el-icon-menu', null, null, 'Course', '201');
INSERT INTO `t_menu` VALUES ('40', '高德地图', '/map', 'el-icon-house', null, null, 'Map', '999');
INSERT INTO `t_menu` VALUES ('41', '文章管理', '/article', 'el-icon-menu', null, null, 'Article', '999');
INSERT INTO `t_menu` VALUES ('42', '级联查询', '/building', 'el-icon-menu', null, null, 'Building', '999');
INSERT INTO `t_menu` VALUES ('43', '时间范围查询', '/timeSearch', 'el-icon-menu', null, null, 'TimeSearch', '999');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名字',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `flag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '唯一标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '管理员', '管理员', 'ROLE_ADMIN');
INSERT INTO `t_role` VALUES ('2', '学生', '学生', 'ROLE_STUDENT');
INSERT INTO `t_role` VALUES ('3', '老师', '老师', 'ROLE_TEACHER');

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu` (
  `role_id` int NOT NULL COMMENT '角色id',
  `menu_id` int NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES ('1', '2');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '昵称',
  `password` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', '管理员', 'e10adc3949ba59abbe56e057f20f883e', 'xiaopilao@xiaopilao.com', '114514', 'M717', '2023-03-14 19:53:40', null, 'ROLE_ADMIN');
INSERT INTO `t_user` VALUES ('2', 'peter', '出生', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '2023-03-14 21:00:11', null, 'ROLE_TEACHER');
INSERT INTO `t_user` VALUES ('3', 'lois', '祸', 'dfb31660c52fddd964834eef9ed963a4', 'lois@lois.com', '114514', '圆蛤', '2023-03-15 12:08:00', null, 'ROLE_TEACHER');
INSERT INTO `t_user` VALUES ('4', 'chirs', '手艺人冠军', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '2023-03-15 21:31:36', null, 'ROLE_STUDENT');
INSERT INTO `t_user` VALUES ('5', 'meg', '古神', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '2023-03-15 21:32:25', null, 'ROLE_STUDENT');
INSERT INTO `t_user` VALUES ('6', 'stewie', '爱女装小可爱捏', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '2023-03-15 21:32:46', null, 'ROLE_STUDENT');
INSERT INTO `t_user` VALUES ('7', 'brain', '出生的狗', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '2023-03-15 21:33:04', null, 'ROLE_STUDENT');
INSERT INTO `t_user` VALUES ('8', 'joe', '瘸子', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '2023-03-15 21:33:18', null, 'ROLE_TEACHER');
INSERT INTO `t_user` VALUES ('9', 'cleveland', '正常人', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '2023-03-15 21:33:37', null, 'ROLE_TEACHER');
INSERT INTO `t_user` VALUES ('10', 'quagmire', '快哥', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '2023-03-15 21:33:53', null, 'ROLE_TEACHER');
INSERT INTO `t_user` VALUES ('11', 'herbert', '炼铜老头', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '2023-03-15 21:34:08', null, 'ROLE_TEACHER');
INSERT INTO `t_user` VALUES ('12', 'bonnie', '求你快杀了你丈夫吧', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '2023-03-15 21:34:23', null, 'ROLE_TEACHER');
INSERT INTO `t_user` VALUES ('13', 'barbara', '犹大妈', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '2023-03-15 21:34:34', null, 'ROLE_TEACHER');
INSERT INTO `t_user` VALUES ('14', 'carter', '恶臭资本家', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '2023-03-15 21:34:47', null, 'ROLE_TEACHER');
INSERT INTO `t_user` VALUES ('15', 'takanawa', '亚洲女记者', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '2023-03-15 21:35:00', null, 'ROLE_TEACHER');
INSERT INTO `t_user` VALUES ('16', 'TomTrucker', '可悲的新闻人', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '2023-03-15 21:35:30', null, 'ROLE_TEACHER');
INSERT INTO `t_user` VALUES ('19', '1', null, 'admin', null, null, null, '2023-03-14 21:00:45', null, 'ROLE_TEACHER');
INSERT INTO `t_user` VALUES ('20', '2', null, 'peter', null, null, null, '2023-03-08 14:06:40', null, null);
INSERT INTO `t_user` VALUES ('21', '3', null, 'lois', null, null, null, '2023-03-08 14:06:40', null, null);
INSERT INTO `t_user` VALUES ('22', '4', null, 'chirs', null, null, null, '2023-03-08 14:06:40', null, null);
INSERT INTO `t_user` VALUES ('23', '5', null, 'meg', null, null, null, '2023-03-08 14:06:40', null, null);
INSERT INTO `t_user` VALUES ('24', '6', null, 'stewie', null, null, null, '2023-03-08 14:06:40', null, null);
INSERT INTO `t_user` VALUES ('25', '7', null, 'brain', null, null, null, '2023-03-08 14:06:40', null, null);
INSERT INTO `t_user` VALUES ('26', '8', null, 'joe', null, null, null, '2023-03-08 14:06:40', null, null);
INSERT INTO `t_user` VALUES ('27', '9', null, 'cleveland', null, null, null, '2023-03-08 14:06:40', null, null);
INSERT INTO `t_user` VALUES ('28', '10', null, 'quagmire', null, null, null, '2023-03-08 14:06:40', null, null);
INSERT INTO `t_user` VALUES ('29', '11', null, 'herbert', null, null, null, '2023-03-08 14:06:40', null, null);
INSERT INTO `t_user` VALUES ('30', '12', null, 'bonnie', null, null, null, '2023-03-08 14:06:40', null, null);
INSERT INTO `t_user` VALUES ('31', '13', null, 'barbara', null, null, null, '2023-03-08 14:06:40', null, null);
INSERT INTO `t_user` VALUES ('32', '14', null, 'carter', null, null, null, '2023-03-08 14:06:40', null, null);
INSERT INTO `t_user` VALUES ('33', '15', null, 'takanawa', null, null, null, '2023-03-08 14:06:40', null, null);
INSERT INTO `t_user` VALUES ('34', '16', null, 'Tom trucker', null, null, null, '2023-03-08 14:06:40', null, null);
INSERT INTO `t_user` VALUES ('63', 'xiaopilao', 'xiaopilao', 'e10adc3949ba59abbe56e057f20f883e', 'xiaopilao@xiaopilao.com', '114514', 'M717', '2023-03-15 20:52:21', null, 'ROLE_STUDENT');
