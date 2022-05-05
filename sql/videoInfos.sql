/*
 Navicat Premium Data Transfer

 Source Server         : sqlite
 Source Server Type    : SQLite
 Source Server Version : 3030001
 Source Schema         : main

 Target Server Type    : SQLite
 Target Server Version : 3030001
 File Encoding         : 65001

 Date: 03/05/2022 20:03:15
*/

PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for videoInfos
-- ----------------------------
DROP TABLE IF EXISTS "videoInfos";
CREATE TABLE "videoInfos" (
  "id" text NOT NULL,
  "imgUrl" TEXT,
  "title" TEXT,
  "time" TEXT,
  "playtimes" integer,
  PRIMARY KEY ("id")
);

PRAGMA foreign_keys = true;
