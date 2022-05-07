/*
 Navicat Premium Data Transfer

 Source Server         : sqlite-videoSite
 Source Server Type    : SQLite
 Source Server Version : 3030001
 Source Schema         : main

 Target Server Type    : SQLite
 Target Server Version : 3030001
 File Encoding         : 65001

 Date: 06/05/2022 05:24:26
*/

PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for _comment_old_20220506
-- ----------------------------
DROP TABLE IF EXISTS "_comment_old_20220506";
CREATE TABLE "_comment_old_20220506" (
  "comment_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "user_id" INTEGER NOT NULL,
  "content" TEXT NOT NULL,
  "time" integer NOT NULL,
  "response_id" INTEGER NOT NULL
);

-- ----------------------------
-- Records of _comment_old_20220506
-- ----------------------------

-- ----------------------------
-- Table structure for _videoInfos_old_20220505
-- ----------------------------
DROP TABLE IF EXISTS "_videoInfos_old_20220505";
CREATE TABLE "_videoInfos_old_20220505" (
  "id" text NOT NULL,
  "dataUrl" TEXT,
  "imgUrl" TEXT,
  "title" TEXT,
  "time" integer,
  "playtimes" integer,
  "likes" integer DEFAULT 0,
  "stars" integer DEFAULT 0,
  PRIMARY KEY ("id")
);

-- ----------------------------
-- Records of _videoInfos_old_20220505
-- ----------------------------
INSERT INTO "_videoInfos_old_20220505" VALUES (1, 'E://STORE/Video/PrExport/123.mp4', 'D://Program Files/video-site-creater/resources/page/img/[UHA-WINGS][Sono Bisque Doll wa Koi wo Suru][02][x264 1080p][CHS].mp4.jpg', 13, 1651592751964, 7, 0, 0);
INSERT INTO "_videoInfos_old_20220505" VALUES (2, 'D://Program Files/video-site-creater/resources/page/videos/[UHA-WINGS][Sono Bisque Doll wa Koi wo Suru][04][x264 1080p][CHS].mp4.mp4', 'D://Program Files/video-site-creater/resources/page/img/[UHA-WINGS][Sono Bisque Doll wa Koi wo Suru][02][x264 1080p][CHS].mp4.jpg', '更衣人偶坠入爱河[04]', 1651592751964, 49, 3, 1);
INSERT INTO "_videoInfos_old_20220505" VALUES (4, 4, 'E:\STORE\Pictures\Demo\Demo1.png', 333, 33, 13, 0, 0);
INSERT INTO "_videoInfos_old_20220505" VALUES (6, 4, 'D://Program Files/video-site-creater/resources/page/img/[UHA-WINGS][Sono Bisque Doll wa Koi wo Suru][02][x264 1080p][CHS].mp4.jpg', 334, 33, 9, 0, 0);
INSERT INTO "_videoInfos_old_20220505" VALUES (7, 4, 'D://Program Files/video-site-creater/resources/page/img/[UHA-WINGS][Sono Bisque Doll wa Koi wo Suru][02][x264 1080p][CHS].mp4.jpg', 335, 33, 34, 0, 0);

-- ----------------------------
-- Table structure for _videoInfos_old_20220505_1
-- ----------------------------
DROP TABLE IF EXISTS "_videoInfos_old_20220505_1";
CREATE TABLE "_videoInfos_old_20220505_1" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "dataUrl" TEXT,
  "imgUrl" TEXT,
  "title" TEXT,
  "time" integer,
  "playtimes" integer,
  "likes" integer DEFAULT 0,
  "stars" integer DEFAULT 0
);

-- ----------------------------
-- Records of _videoInfos_old_20220505_1
-- ----------------------------
INSERT INTO "_videoInfos_old_20220505_1" VALUES (1, 'E://STORE/Video/PrExport/123.mp4', 'D://Program Files/video-site-creater/resources/page/img/[UHA-WINGS][Sono Bisque Doll wa Koi wo Suru][02][x264 1080p][CHS].mp4.jpg', 13, 1651592751964, 7, 0, 0);
INSERT INTO "_videoInfos_old_20220505_1" VALUES (2, 'D://Program Files/video-site-creater/resources/page/videos/[UHA-WINGS][Sono Bisque Doll wa Koi wo Suru][04][x264 1080p][CHS].mp4.mp4', 'D://Program Files/video-site-creater/resources/page/img/[UHA-WINGS][Sono Bisque Doll wa Koi wo Suru][02][x264 1080p][CHS].mp4.jpg', '更衣人偶坠入爱河[04]', 1651592751964, 49, 3, 1);
INSERT INTO "_videoInfos_old_20220505_1" VALUES (4, 4, 'E:\STORE\Pictures\Demo\Demo1.png', 333, 33, 13, 0, 0);
INSERT INTO "_videoInfos_old_20220505_1" VALUES (6, 4, 'D://Program Files/video-site-creater/resources/page/img/[UHA-WINGS][Sono Bisque Doll wa Koi wo Suru][02][x264 1080p][CHS].mp4.jpg', 334, 33, 9, 0, 0);
INSERT INTO "_videoInfos_old_20220505_1" VALUES (7, 4, 'D://Program Files/video-site-creater/resources/page/img/[UHA-WINGS][Sono Bisque Doll wa Koi wo Suru][02][x264 1080p][CHS].mp4.jpg', 335, 33, 34, 0, 0);
INSERT INTO "_videoInfos_old_20220505_1" VALUES (8, 1, 1, 1, 1, NULL, 0, 0);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS "comment";
CREATE TABLE "comment" (
  "comment_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "video_id" INTEGER,
  "user_id" INTEGER NOT NULL,
  "content" TEXT NOT NULL,
  "time" integer NOT NULL,
  "response_id" INTEGER NOT NULL
);

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO "comment" VALUES (3, 2, 'Yeckkk', '嘿嘿嘿🥵喜多川🥵嘿嘿嘿🤤海梦🤤', 1651774870992, -1);
INSERT INTO "comment" VALUES (6, 7, 'tttt', '？', 1651778393263, -1);

-- ----------------------------
-- Table structure for like_log
-- ----------------------------
DROP TABLE IF EXISTS "like_log";
CREATE TABLE "like_log" (
  "id" text NOT NULL,
  "account" text NOT NULL,
  "time" TEXT NOT NULL
);

-- ----------------------------
-- Records of like_log
-- ----------------------------
INSERT INTO "like_log" VALUES (2, 'ttt', 1651712433257.0);
INSERT INTO "like_log" VALUES (2, 'Yeck', 1651726727114.0);
INSERT INTO "like_log" VALUES (2, 'Yeckkk', 1651736619398.0);
INSERT INTO "like_log" VALUES (2, 'tttt', 1651767673165.0);

-- ----------------------------
-- Table structure for play_log
-- ----------------------------
DROP TABLE IF EXISTS "play_log";
CREATE TABLE "play_log" (
  "account" text NOT NULL,
  "id" TEXT NOT NULL,
  "time" integer NOT NULL
);

-- ----------------------------
-- Records of play_log
-- ----------------------------
INSERT INTO "play_log" VALUES ('Yeck', 2, 1651605350256);
INSERT INTO "play_log" VALUES ('ttt', 2, 1651708645939);
INSERT INTO "play_log" VALUES ('ttt', 1, 1651709629703);
INSERT INTO "play_log" VALUES ('ttt', 6, 1651709657402);
INSERT INTO "play_log" VALUES ('ttt', 7, 1651711610948);
INSERT INTO "play_log" VALUES ('ttt', 2, 1651712400690);
INSERT INTO "play_log" VALUES ('Yeck', 2, 1651713271883);
INSERT INTO "play_log" VALUES ('Yeck', 2, 1651714300480);
INSERT INTO "play_log" VALUES ('Yeck', 'undefined', 1651721400818);
INSERT INTO "play_log" VALUES ('Yeck', 2, 1651722423247);
INSERT INTO "play_log" VALUES ('Yeck', 4, 1651726661851);
INSERT INTO "play_log" VALUES ('Yeck', 2, 1651726704375);
INSERT INTO "play_log" VALUES ('Yeck', 2, 1651729296130);
INSERT INTO "play_log" VALUES ('Yeck', 2, 1651729977135);
INSERT INTO "play_log" VALUES ('Yeck', 2, 1651730674045);
INSERT INTO "play_log" VALUES ('Yeck', 2, 1651731334740);
INSERT INTO "play_log" VALUES ('tttt', 2, 1651732081343);
INSERT INTO "play_log" VALUES ('tttt', 2, 1651733114109);
INSERT INTO "play_log" VALUES ('tttt', 2, 1651733921480);
INSERT INTO "play_log" VALUES ('tttt', 4, 1651734406576);
INSERT INTO "play_log" VALUES ('tttt', 7, 1651734417279);
INSERT INTO "play_log" VALUES ('tttt', 6, 1651734420185);
INSERT INTO "play_log" VALUES ('tttt', 2, 1651736563078);
INSERT INTO "play_log" VALUES ('Yeckkk', 2, 1651736613533);
INSERT INTO "play_log" VALUES ('Yeckkk', 2, 1651742331126);
INSERT INTO "play_log" VALUES ('Yeckkk', 4, 1651742337393);
INSERT INTO "play_log" VALUES ('tttt', 2, 1651763666064);
INSERT INTO "play_log" VALUES ('tttt', 7, 1651763708797);
INSERT INTO "play_log" VALUES ('tttt', 7, 1651764382258);
INSERT INTO "play_log" VALUES ('tttt', 2, 1651764474509);
INSERT INTO "play_log" VALUES ('tttt', 2, 1651765709886);
INSERT INTO "play_log" VALUES ('tttt', 2, 1651767307536);
INSERT INTO "play_log" VALUES ('tttt', 2, 1651768698706);
INSERT INTO "play_log" VALUES ('tttt', 2, 1651769572046);
INSERT INTO "play_log" VALUES ('tttt', 2, 1651771099531);
INSERT INTO "play_log" VALUES ('tttt', 2, 1651771717291);
INSERT INTO "play_log" VALUES ('tttt', 2, 1651773514321);
INSERT INTO "play_log" VALUES ('tttt', 2, 1651774161847);
INSERT INTO "play_log" VALUES ('tttt', 2, 1651774805031);
INSERT INTO "play_log" VALUES ('tttt', 2, 1651775764046);
INSERT INTO "play_log" VALUES ('tttt', 2, 1651776544682);
INSERT INTO "play_log" VALUES ('tttt', 2, 1651777591202);
INSERT INTO "play_log" VALUES ('tttt', 2, 1651778341725);
INSERT INTO "play_log" VALUES ('tttt', 7, 1651778387666);

-- ----------------------------
-- Table structure for sqlite_sequence
-- ----------------------------
DROP TABLE IF EXISTS "sqlite_sequence";
CREATE TABLE "sqlite_sequence" (
  "name" ,
  "seq" 
);

-- ----------------------------
-- Records of sqlite_sequence
-- ----------------------------
INSERT INTO "sqlite_sequence" VALUES ('users', 14);
INSERT INTO "sqlite_sequence" VALUES ('star_box_info', 10);
INSERT INTO "sqlite_sequence" VALUES ('_videoInfos_old_20220505_1', 8);
INSERT INTO "sqlite_sequence" VALUES ('videoInfos', 11);
INSERT INTO "sqlite_sequence" VALUES ('comment', 7);

-- ----------------------------
-- Table structure for star_box_info
-- ----------------------------
DROP TABLE IF EXISTS "star_box_info";
CREATE TABLE "star_box_info" (
  "star_box_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "star_box_name" TEXT,
  "user_id" INTEGER,
  "permissions" TEXT,
  "description" TEXT,
  "cover_image_id" text,
  "time" integer
);

-- ----------------------------
-- Records of star_box_info
-- ----------------------------
INSERT INTO "star_box_info" VALUES (2, '更衣人偶坠入爱河', 0, 0, 1, 1, 1651721325326);
INSERT INTO "star_box_info" VALUES (3, '更衣人偶坠入爱河2', 0, 0, 1, 1, 1651721325326);
INSERT INTO "star_box_info" VALUES (4, '更衣人偶坠入爱河3', 0, 0, 1, 1, 1651721325326);
INSERT INTO "star_box_info" VALUES (9, '收藏夹', 'tttt', 1, '收藏夹', 0, 1651763667853);
INSERT INTO "star_box_info" VALUES (10, '收藏夹', 'Yeckkk', 1, '收藏夹', 0, 1651736643509);

-- ----------------------------
-- Table structure for star_box_video
-- ----------------------------
DROP TABLE IF EXISTS "star_box_video";
CREATE TABLE "star_box_video" (
  "star_box_id" INTEGER NOT NULL,
  "video_id" INTEGER NOT NULL,
  "time" integer
);

-- ----------------------------
-- Records of star_box_video
-- ----------------------------
INSERT INTO "star_box_video" VALUES (2, 2, 1234312312512352315);
INSERT INTO "star_box_video" VALUES (2, 4, 1234312312512352305);
INSERT INTO "star_box_video" VALUES (2, 7, 1234312312512352315);
INSERT INTO "star_box_video" VALUES (10, 2, 1651736643509);
INSERT INTO "star_box_video" VALUES (9, 2, 1651763667853);

-- ----------------------------
-- Table structure for userInfos
-- ----------------------------
DROP TABLE IF EXISTS "userInfos";
CREATE TABLE "userInfos" (
  "uid" INTEGER NOT NULL,
  "name" TEXT,
  "gender" TEXT,
  "createTime" TEXT,
  PRIMARY KEY ("uid")
);

-- ----------------------------
-- Records of userInfos
-- ----------------------------
INSERT INTO "userInfos" VALUES (11, 'YeEeck', '男', 1651604073737.0);
INSERT INTO "userInfos" VALUES (12, 123, '男', 1651708640029.0);
INSERT INTO "userInfos" VALUES (13, 'Yeck', '男', 1651732069231.0);
INSERT INTO "userInfos" VALUES (14, 'YeEeck', '男', 1651736607988.0);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "users";
CREATE TABLE "users" (
  "uid" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "account" TEXT NOT NULL,
  "password" TEXT,
  "token" TEXT
);

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO "users" VALUES (11, 'Yeck', 'yck63241832', 'eb5accf90885723e4ce6fe523a9029f1bfb65b44');
INSERT INTO "users" VALUES (12, 'ttt', 'ttt', '64e8c348431aa3875e0d084325f0f3ed6b6a52b4');
INSERT INTO "users" VALUES (13, 'tttt', 'tttt', 'ec69de03e42db8ad6fb695e39ac59dbe63154eb9');
INSERT INTO "users" VALUES (14, 'Yeckkk', 'kkk', '04828cc56cf4d3945cee4756892a9f26461848e4');

-- ----------------------------
-- Table structure for videoInfos
-- ----------------------------
DROP TABLE IF EXISTS "videoInfos";
CREATE TABLE "videoInfos" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "dataUrl" TEXT,
  "imgUrl" TEXT,
  "title" TEXT,
  "time" integer,
  "playtimes" integer DEFAULT 0,
  "likes" integer DEFAULT 0,
  "stars" integer DEFAULT 0
);

-- ----------------------------
-- Records of videoInfos
-- ----------------------------
INSERT INTO "videoInfos" VALUES (1, 'E://STORE/Video/PrExport/123.mp4', 'D://Program Files/video-site-creater/resources/page/img/[UHA-WINGS][Sono Bisque Doll wa Koi wo Suru][02][x264 1080p][CHS].mp4.jpg', 13, 1651592751964, 7, 0, 0);
INSERT INTO "videoInfos" VALUES (2, 'D://Program Files/video-site-creater/resources/page/videos/[UHA-WINGS][Sono Bisque Doll wa Koi wo Suru][04][x264 1080p][CHS].mp4.mp4', 'D://Program Files/video-site-creater/resources/page/img/[UHA-WINGS][Sono Bisque Doll wa Koi wo Suru][02][x264 1080p][CHS].mp4.jpg', '更衣人偶坠入爱河[04]', 1651592751964, 67, 5, 2);
INSERT INTO "videoInfos" VALUES (4, 4, 'E:\STORE\Pictures\Demo\Demo1.png', 333, 33, 14, 0, 0);
INSERT INTO "videoInfos" VALUES (6, 4, 'D://Program Files/video-site-creater/resources/page/img/[UHA-WINGS][Sono Bisque Doll wa Koi wo Suru][02][x264 1080p][CHS].mp4.jpg', 334, 33, 9, 0, 0);
INSERT INTO "videoInfos" VALUES (7, 4, 'D://Program Files/video-site-creater/resources/page/img/[UHA-WINGS][Sono Bisque Doll wa Koi wo Suru][02][x264 1080p][CHS].mp4.jpg', 335, 33, 37, 0, 0);

-- ----------------------------
-- Auto increment value for _videoInfos_old_20220505_1
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 8 WHERE name = '_videoInfos_old_20220505_1';

-- ----------------------------
-- Auto increment value for comment
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 7 WHERE name = 'comment';

-- ----------------------------
-- Auto increment value for star_box_info
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 10 WHERE name = 'star_box_info';

-- ----------------------------
-- Auto increment value for users
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 14 WHERE name = 'users';

-- ----------------------------
-- Auto increment value for videoInfos
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 11 WHERE name = 'videoInfos';

PRAGMA foreign_keys = true;
