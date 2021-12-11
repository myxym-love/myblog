/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 11/12/2021 12:59:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户名id',
  `article_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章标题',
  `article_context` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章内容',
  `article_date` date NULL DEFAULT NULL COMMENT '创作日期',
  `article_ind` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文章简介',
  PRIMARY KEY (`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, 1, 'Redis', 'redis is good aaaaaa\r\n#include<stdio.h>\r\nint main(){\r\n	printf(\"Hello world);\r\n}', '2021-12-09', 'c语言yyds');
INSERT INTO `article` VALUES (2, 1, 'Git使用教程', '## 1.如何把本地的项目上传到GitHub上\r\n\r\n1.打开Git Bash进入到要上传的项目的目录下\r\n\r\n2.配置用户名和邮箱\r\n\r\n```bas\r\ngit config --global user.name \"Your username\"\r\ngit config --global user.email \"Your email\"\r\n```\r\n\r\n3.在GitHub上设置本地的ssh公钥\r\n\r\n（1）在本地生成ssh公钥私钥\r\n\r\n```bas\r\nssh-keygen\r\n```\r\n\r\n生成的.ssh文件默认在C:\\Users\\ASUS\\\\.ssh (ASUS是我电脑的名字)\r\n\r\n在.ssh文件下有id_rsa.pub文件,把里面的内容添加到你的GigHub的设置里\r\n\r\n4.在你的GitHub上新建一个仓库,复制仓库的ssh地址\r\n\r\n5.把你创建好的仓库克隆到你的项目文件夹下\r\n\r\n```bas\r\ngit clone git@github.com:myxym-love/javaweb.git\r\n```\r\n\r\n (git@github.com:myxym-love/javaweb.git)换成你自己仓库地址\r\n\r\n6.把你项目的下的所有文件以及文件夹(除了你拉取的仓库文件夹)复制到你拉取的仓库文件夹里\r\n\r\n7.进去到你拉取的仓库文件夹里\r\n\r\n```bas\r\ngit add . (.表示所有文件)\r\ngit commit -m \"描述\"\r\ngit push -u origin master (第一次psuh要加-u)\r\n```\r\n\r\n', '2021-12-09', '如何使用git');
INSERT INTO `article` VALUES (3, 2, 'Redis学习笔记', '## Linux下安装Redis6.X\r\n\r\n注意：安装Redis6.X版本需要gcc9.X以上版本\r\n\r\n1.安装gcc安装包的镜像源\r\n\r\n```bash\r\nyum install centos-release-scl\r\n```\r\n\r\n\r\n\r\n2.安装gcc9和g++9\r\n\r\n```bash\r\nyum install devtoolset-9\r\n```\r\n\r\n\r\n\r\n3.上传redis6.x到Centos7服务器上，使用RailDrive连接服务器进行上传\r\n\r\ncd /usr/local目录下新建一个software文件夹,之后把所有得软件上传到software文件夹下，方便管理\r\n\r\n4.解压redis\r\n\r\ntar -zxvf redis-6.2.5.tar.gz\r\n\r\n5.进入redis-6.2.5目录下，执行以下命令\r\n\r\n```shell\r\nmake\r\n```\r\n\r\n6.redis的默认安装路径 /usr/local/bin\r\n\r\n7.在/usr/local/bin目录下新建一个mconfig目录,把redis配置文件redis.conf拷贝一份到此目录下，以后就使用mconfig下的配置文件启动\r\n\r\n8.redis默认不是后台启动的\r\n\r\n9.vim redis.conf进行编辑，修改配置 \r\n\r\ndamonize no no改为yes\r\n\r\n10.启动redis服务，通过指定的配置文件启动，在/usr/local/bin目录下执行\r\n\r\n```\r\nredis-server mconfig/redis.conf\r\n```\r\n\r\n```\r\nreids-cli -p 6379\r\n```\r\n\r\n11.关闭redis服务shutdown\r\n\r\n\r\n\r\n\r\n\r\n## Redis基础知识\r\n\r\n```bash\r\n127.0.0.1:6379> select 1 #切换数据库\r\nOK\r\n127.0.0.1:6379[1]> DBSIZE #查看数据库的大小\r\n(integer) 0\r\n127.0.0.1:6379[1]> set name myxym\r\nOK\r\n127.0.0.1:6379[1]> DBSIZE\r\n(integer) 1\r\n127.0.0.1:6379[1]> \r\n```\r\n\r\n\r\n\r\n```bash\r\n127.0.0.1:6379> select 1\r\nOK\r\n127.0.0.1:6379[1]> DBSIZE\r\n(integer) 0\r\n127.0.0.1:6379[1]> set name myxym\r\nOK\r\n127.0.0.1:6379[1]> DBSIZE\r\n(integer) 1\r\n127.0.0.1:6379[1]> FLUSHDB  #清除当前数据库\r\nOK\r\n127.0.0.1:6379[1]> DBSIZE\r\n(integer) 0\r\n127.0.0.1:6379[1]> \r\n```\r\n\r\nFLUSHALL 清楚所有数据库数据\r\n\r\n\r\n\r\n## 五大数据类型\r\n\r\n### 1.Redis-key\r\n\r\n​	\r\n\r\n```bash\r\n127.0.0.1:6379> set name myxym\r\nOK\r\n127.0.0.1:6379> get name\r\n\"myxym\"\r\n127.0.0.1:6379> EXPIRE name 60 #设置过期时间\r\n(integer) 1\r\n127.0.0.1:6379> ttl name  #查看过期倒计时\r\n(integer) 58\r\n127.0.0.1:6379> ttl name\r\n(integer) 57\r\n127.0.0.1:6379> ttl name\r\n(integer) 54\r\n127.0.0.1:6379> ttl anem\r\n(integer) -2\r\n127.0.0.1:6379> ttl name\r\n(integer) 35\r\n127.0.0.1:6379> get name\r\n\"myxym\"\r\n127.0.0.1:6379> move name 1 #从当前数据库移除key\r\n(integer) 0\r\n127.0.0.1:6379> get name\r\n\"myxym\"\r\n127.0.0.1:6379> keys *\r\n1) \"name\"\r\n127.0.0.1:6379> tt lname\r\n(error) ERR unknown command `tt`, with args beginning with: `lname`, \r\n127.0.0.1:6379> ttl name\r\n(integer) 2\r\n127.0.0.1:6379> ttl name\r\n(integer) -2\r\n127.0.0.1:6379> get name\r\n(nil)\r\n127.0.0.1:6379> set name myxym\r\nOK\r\n127.0.0.1:6379> ttl name\r\n(integer) -1\r\n127.0.0.1:6379> ttl name\r\n(integer) -1\r\n127.0.0.1:6379> get name\r\n\"myxym\"\r\n127.0.0.1:6379> move name 1\r\n(integer) 0\r\n127.0.0.1:6379> type name #查看当前key的类型\r\nstring\r\n127.0.0.1:6379> \r\n\r\n\r\n```\r\n\r\n\r\n\r\n\r\n\r\n### 2.String', '2021-12-10', '如何安装使用redis');
INSERT INTO `article` VALUES (4, 1, '云服务器之间实现免密登录', '#### 1. 安装ssh\r\n\r\n```bash\r\nyum install -y ssh\r\n```\r\n\r\n注：每台服务器都要安装ssh\r\n\r\n#### 2.在每台服务器上生成公钥\r\n\r\n```bash\r\nssh-keygen\r\n```\r\n\r\n#### 3.服务器ip映射\r\n\r\n使用命令\r\n\r\n```ba\r\nvim /etc/hosts\r\n```\r\n\r\n添加ip映射,例如47.100.227.19 master 有几台服务器要实现互相免密就添加几个映射\r\n\r\n#### 4.公钥互相拷贝到其他服务器\r\n\r\n1.在master服务器上执行\r\n\r\n```bas\r\nssh-copy-id master\r\nssh-copy-id slave1\r\nssh-copy-id slave2\r\n```\r\n\r\n2.在slave1上执行\r\n\r\n```ba\r\nssh-copy-id master\r\nssh-copy-id slave1\r\nssh-copy-id slave2\r\n```\r\n\r\n23.在slave上执行\r\n\r\n```bas\r\nssh-copy-id master\r\nssh-copy-id slave1\r\nssh-copy-id slave2\r\n```\r\n\r\n注：拷贝的时候是需要输入密码,这也是最后一次输入密码,之后就可以实现免密登录了\r\n\r\n# 2.Windows与云服务器之间实现免密登录\r\n\r\n#### 1.在Windows主机安装openSSH\r\n\r\n![](C:\\Users\\ASUS\\Desktop\\笔记\\1.png)\r\n\r\n出现如图所以表示安装成功\r\n\r\n#### 2.生成公钥\r\n\r\n```ba\r\nssh-keygen\r\n```\r\n\r\n生成的默认文件路径是C:\\Users\\ASUS\\.ssh\r\n\r\n把Windows中的id.rsa.pub的内容追加到云服务器下.ssh/authorized_keys中\r\n\r\n至此就可以实现免密登录了', '2021-12-10', '配置免密登录');

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `article_id` int(11) NULL DEFAULT NULL COMMENT '文章id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `review_context` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '评论内容',
  `review_date` date NULL DEFAULT NULL COMMENT '评论日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES (1, 1, 1, 'good', '2021-12-09');
INSERT INTO `review` VALUES (2, 2, 1, '一句话v几乎不会看博客', '2021-12-10');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名称',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `user_email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `user_realname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `user_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `user_sex` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `user_bir` date NULL DEFAULT NULL COMMENT '生日',
  `admin` tinyint(4) NULL DEFAULT NULL COMMENT '是否是管理员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'myxym', 'as147962', '1602271854@qq.com', '毛宇', '15370226707', 'male', '2000-11-01', 1);
INSERT INTO `user` VALUES (2, 'jackaaaa', 'ds147943', 'codermy160@gmail.com', '张三', '13057017830', 'male', '2021-12-02', 0);
INSERT INTO `user` VALUES (4, 'admin1111', '123456', 'codermy160@gmail.com', '毛宇1', '13057017830', 'female', '2021-12-02', 0);
INSERT INTO `user` VALUES (5, 'jackabaa', '12345678', '1602271854@qq.com', '张三', '18051580207', 'male', '2021-12-03', 0);
INSERT INTO `user` VALUES (6, 'mmyxymmm', 'as142923', '1602271854@qq.com', '毛宇', '15370226707', 'male', '2000-11-01', 0);
INSERT INTO `user` VALUES (7, 'rootroot', '12345678', 'codermy160@gmail.com', '张三', '15370226707', 'female', '2021-12-04', 0);

SET FOREIGN_KEY_CHECKS = 1;
