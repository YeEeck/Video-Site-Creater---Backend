/*
 Navicat Premium Data Transfer

 Source Server         : sqlite-videoSite
 Source Server Type    : SQLite
 Source Server Version : 3030001
 Source Schema         : main

 Target Server Type    : SQLite
 Target Server Version : 3030001
 File Encoding         : 65001

 Date: 06/05/2022 05:24:39
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
-- Table structure for like_log
-- ----------------------------
DROP TABLE IF EXISTS "like_log";
CREATE TABLE "like_log" (
  "id" text NOT NULL,
  "account" text NOT NULL,
  "time" TEXT NOT NULL
);

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
-- Table structure for sqlite_sequence
-- ----------------------------
DROP TABLE IF EXISTS "sqlite_sequence";
CREATE TABLE "sqlite_sequence" (
  "name" ,
  "seq" 
);

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
-- Table structure for star_box_video
-- ----------------------------
DROP TABLE IF EXISTS "star_box_video";
CREATE TABLE "star_box_video" (
  "star_box_id" INTEGER NOT NULL,
  "video_id" INTEGER NOT NULL,
  "time" integer
);

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
