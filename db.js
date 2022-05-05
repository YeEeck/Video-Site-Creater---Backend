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

class star {
  static checkStar(data, cb) {
    db.all(
      `SELECT * FROM star_box_video WHERE star_box_id = ? AND video_id = ?;`,
      data.star_box_id,
      data.id,
      cb
    );
  }

  static getUserStarList(data, cb) {
    db.all(
      `SELECT * FROM star_box_info WHERE user_id = ? ORDER BY time DESC`,
      data.account,
      cb
    );
  }

  static getStarList(data, cb) {
    db.all(
      `SELECT * FROM star_box_info WHERE permissions = 0 ORDER BY time DESC LIMIT ? OFFSET ?;`,
      data.limit,
      data.offset,
      cb
    );
  }

  static getStarListLength(data, cb) {
    db.all(`SELECT COUNT(*) FROM star_box_info WHERE permissions = 0;`, cb);
  }

  static addStar(data, cb) {
    const date = new Date();
    db.run(
      `
    INSERT INTO star_box_info(star_box_name, user_id, permissions, description, cover_image_id, time) VALUES(?,?,?,?,?,?);
    `,
      data.star_box_name,
      data.account,
      data.permissions,
      data.description,
      data.cover_image_id,
      date.getTime(),
      cb
    );
  }

  static delStar(data, cb) {
    db.run(
      `
    DELETE FROM star_box_info WHERE star_box_id = ?;
    DELETE FROM star_box_video WHERE star_box_id = ?;
    `,
      data.star_box_id,
      data.star_box_id,
      cb
    );
  }

  static getStarInfo(data, cb) {
    db.all(
      `
    SELECT * FROM star_box_info WHERE star_box_id = ?;
    `,
      data.star_box_id,
      cb
    );
  }

  static getUserStar(data, cb) {
    db.all(
      `
    SELECT * FROM star_box_info WHERE user_id = ?;
    `,
      data.account,
      cb
    );
  }

  static addStarVideo(data, cb) {
    const date = new Date();
    let data1 = data;
    db.run(
      `
    INSERT INTO star_box_video(star_box_id, video_id, time) VALUES(?,?,?);
    `,
      data.star_box_id,
      data.id,
      date.getTime(),

      (err, data) => {
        db.run(
          `
        UPDATE videoInfos 
        SET stars = stars + 1 
        WHERE
	      videoInfos.id = ?;
        `,
          data1.id,
          (err, data) => {
            db.run(
              `UPDATE star_box_info SET time = ? WHERE star_box_id = ?;`,
              date.getTime(),
              data1.star_box_id,
              cb
            );
          }
        );
      }
    );
  }

  static delStarVideo(data, cb) {
    let data1 = data;
    db.run(
      `DELETE FROM star_box_video WHERE star_box_id = ? AND video_id = ?;`,
      data.star_box_id,
      data.id,
      (err, data) => {
        db.run(
          `UPDATE videoInfos 
          SET stars = stars - 1 
          WHERE
	        videoInfos.id = ?;`,
          data1.id,
          cb
        );
      }
    );
  }

  static getStarVideo(data, cb) {
    db.all(
      `
    SELECT
	    * 
    FROM
	    star_box_video
	    JOIN videoInfos ON star_box_video.video_id = videoInfos.id 
    WHERE
	    star_box_id = ? 
    ORDER BY
	    star_box_video.time DESC,
	    videoInfos.title ASC 
	    LIMIT ? OFFSET ?;
    `,
      data.star_box_id,
      data.limit,
      data.offset,
      cb
    );
  }

  static getStarVideoLength(data, cb) {
    db.all(
      `SELECT COUNT(*) FROM star_box_video WHERE star_box_id = ?;`,
      data.star_box_id,
      cb
    );
  }
}

module.exports.star = star;
