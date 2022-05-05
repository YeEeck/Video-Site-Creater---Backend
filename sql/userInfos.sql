/*
 Navicat Premium Data Transfer

 Source Server         : sqlite
 Source Server Type    : SQLite
 Source Server Version : 3030001
 Source Schema         : main

 Target Server Type    : SQLite
 Target Server Version : 3030001
 File Encoding         : 65001

 Date: 03/05/2022 01:27:45
*/

PRAGMA foreign_keys = false;

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

PRAGMA foreign_keys = true;
