/*
 Navicat Premium Data Transfer

 Source Server         : sqlite-videoSite
 Source Server Type    : SQLite
 Source Server Version : 3030001
 Source Schema         : main

 Target Server Type    : SQLite
 Target Server Version : 3030001
 File Encoding         : 65001

 Date: 04/05/2022 03:20:19
*/

PRAGMA foreign_keys = false;

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
-- Table structure for star_box
-- ----------------------------
DROP TABLE IF EXISTS "star_box";
CREATE TABLE "star_box" (
  "star_box_id" text NOT NULL,
  "id" text,
  PRIMARY KEY ("star_box_id")
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
-- Table structure for user_star_box
-- ----------------------------
DROP TABLE IF EXISTS "user_star_box";
CREATE TABLE "user_star_box" (
  "uid" text NOT NULL,
  "star_box_id" text,
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
-- Auto increment value for users
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 11 WHERE name = 'users';

PRAGMA foreign_keys = true;
