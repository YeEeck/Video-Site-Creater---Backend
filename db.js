const sqlite3 = require("sqlite3").verbose();
const dbName = "videoSiteData.db";
const db = new sqlite3.Database(dbName);
const sha1 = require("./hash").sha1;

db.serialize(() => {
  db.run(
    `CREATE TABLE IF NOT EXISTS "users" (
    "uid" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "account" TEXT NOT NULL,
    "password" TEXT
    );`,
    (e) => {
      if (e) console.log(e);
    }
  );
  db.run(
    `CREATE TABLE IF NOT EXISTS "userInfos" (
    "uid" INTEGER NOT NULL,
    "name" TEXT,
    "gender" TEXT,
    "createTime" TEXT,
    PRIMARY KEY ("uid")
    );`,
    (e) => {
      if (e) console.log(e);
    }
  );
  db.run(
    `CREATE TABLE IF NOT EXISTS "videoInfos" (
    "id" text NOT NULL,
    "imgUrl" TEXT,
    "title" TEXT,
    "time" TEXT,
    "playtimes" integer,
    PRIMARY KEY ("id")
    );`,
    (e) => {
      if (e) console.log(e);
    }
  );
});

class users {
  static getUser(account, cb) {
    db.all(`SELECT * FROM users WHERE users.account = ?`, account, cb);
  }

  static createUser(data, cb) {
    db.run(
      `
        INSERT INTO 
        users(account, password, token)
        VALUES(?, ?, ?)
        `,
      data.account,
      data.password,
      sha1(data.account + new Date().toTimeString()),
      cb
    );
  }

  static getUserInfo(uid, cb) {
    db.all(`SELECT * FROM userInfos WHERE userInfos.uid = ?`, uid, cb);
  }

  static createUserInfo(data, cb) {
    const time = new Date();
    db.run(
      `
        INSERT INTO 
        userInfos(uid, name, gender, createTime)
        VALUES(?, ?, ?, ?)
        `,
      data.uid,
      data.name,
      data.gender,
      time.getTime(),
      cb
    );
  }

  static checkToken(data, cb) {
    db.all(
      `SELECT * FROM users WHERE account = ? AND token = ?`,
      data.account,
      data.token,
      cb
    );
  }
}
module.exports.users = users;

class videos {
  static getVideoInfo(id, cb) {
    db.all(`SELECT * FROM videoInfos WHERE videoInfos.id = ?`, id, cb);
  }

  static getAllVideo(cb) {
    db.all(`SELECT * FROM videoInfos`, cb);
  }

  static videoPlayTimesPlus(id, cb) {
    db.run(
      `
    UPDATE videoInfos 
    SET playtimes = playtimes + 1 
    WHERE
	  videoInfos.id = ?;
    `,
      id,
      cb
    );
  }

  static getPlayLog(data, cb) {
    db.all(
      `SELECT * FROM play_log WHERE account = ? AND id = ? ORDER BY time DESC LIMIT 1;`,
      data.account,
      data.id,
      cb
    );
  }

  static addPlayLog(data, cb) {
    const date = new Date();
    db.all(
      `INSERT INTO play_log(account, id, time) VALUES(?,?,?);`,
      data.account,
      data.id,
      date.getTime(),
      cb
    );
  }

  static getMaxPlayVideoList(limit, cb) {
    db.all(
      `
    SELECT
	    * 
    FROM
	    videoInfos 
    ORDER BY
	    playtimes DESC 
	    LIMIT ?;`,
      limit,
      cb
    );
  }

  static addlike(data, cb) {
    const date = new Date();
    db.run(
      `INSERT INTO like_log(id, account, time) VALUES(?, ?, ?);`,
      data.id,
      data.account,
      date.getTime(),
      cb
    );
  }

  static getlike(data, cb) {
    db.all(
      `SELECT * FROM like_log WHERE id = ? AND account = ?;`,
      data.id,
      data.account,
      cb
    );
  }

  static dellike(data, cb) {
    db.all(
      `DELETE FROM like_log WHERE id = ? AND account = ?;`,
      data.id,
      data.account,
      cb
    );
  }

  static videoLikeTimesPlus(id, cb) {
    db.run(
      `
    UPDATE videoInfos 
    SET likes = likes + 1 
    WHERE
	  videoInfos.id = ?;
    `,
      id,
      cb
    );
  }

  static videoLikeTimesMinus(id, cb) {
    db.run(
      `
    UPDATE videoInfos 
    SET likes = likes - 1 
    WHERE
	  videoInfos.id = ?;
    `,
      id,
      cb
    );
  }
}

module.exports.videos = videos;
