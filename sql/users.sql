/*
 Navicat Premium Data Transfer

 Source Server         : sqlite
 Source Server Type    : SQLite
 Source Server Version : 3030001
 Source Schema         : main

 Target Server Type    : SQLite
 Target Server Version : 3030001
 File Encoding         : 65001

 Date: 03/05/2022 01:27:33
*/

PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "users";
CREATE TABLE "users" (
  "uid" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "account" TEXT NOT NULL,
  "password" TEXT
);

PRAGMA foreign_keys = true;
