const express = require("express");
const app = express();
var bodyParser = require("body-parser");
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
const port = 8880;
const usersDB = require("./db").users;
const videoDB = require("./db").videos;
const starDB = require("./db").star;
const commentDB = require("./db").comment;

const config = require("./SiteConfig.json");
const req = require("express/lib/request");
const res = require("express/lib/response");
const siteName = config.siteName;

// app.use("/video/415t46", express.static("E://STORE/Video/PrExport/123.mp4"));

// app.use("/", express.static("page"));

app.all("*", function (req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Content-Type");
  res.header("Access-Control-Allow-Methods", "*");
  // res.header("Content-Type", "application/json;charset=utf-8");
  next();
});

//initStaticResource
app.use("/image/0", express.static("img/default.png"));
videoDB.getAllVideo((err, data) => {
  data.forEach((element) => {
    app.use("/video/" + element.id, express.static(element.dataUrl));
    app.use("/image/" + element.id, express.static(element.imgUrl));
  });
});

//Router
app.post("/addComment", (req, res) => {
  commentDB.addComment(req.body, (err, data) => {
    if (err) console.log(err);
    res.send({ status: 1, data: data });
  });
});

app.post("/delComment", (req, res) => {
  commentDB.delComment(req.body, (err, data) => {
    res.send({ status: 1 });
  });
});

app.post("/getCommentFromVideo", (req, res) => {
  commentDB.getCommentFromVideo(req.body, (err, data) => {
    res.send(data);
  });
});

app.post("/getUserStar", (req, res) => {
  starDB.getUserStar(req.body, (err, data) => {
    res.send(data[0]);
  });
});

app.post("/checkUserStar", (req, res) => {
  if (req.body.account == undefined) {
    res.send({ status: 444 });
    return;
  }
  starDB.getUserStarList(req.body, (err, data) => {
    starDB.checkStar(
      { star_box_id: data[0].star_box_id, id: req.body.id },
      (err, data) => {
        if (data.length == 0) {
          res.send({ status: 0 });
        } else {
          res.send({ status: 1 });
        }
      }
    );
  });
});

app.post("/delUserStarVideo", (req, res) => {
  starDB.getUserStarList(req.body, (err, data) => {
    starDB.delStarVideo(
      { star_box_id: data[0].star_box_id, id: req.body.id },
      (err, data) => {
        res.send({ status: 1 });
      }
    );
  });
});

app.post("/addUserStarVideo", (req, res) => {
  starDB.getUserStarList(req.body, (err, data) => {
    starDB.addStarVideo(
      {
        star_box_id: data[0].star_box_id,
        id: req.body.id,
      },
      (err, data) => {
        if (err) console.log(err);
        res.send({ status: 1 });
      }
    );
  });
});

app.post("/getStarVideoLength", (req, res) => {
  starDB.getStarVideoLength(req.body, (err, data) => {
    res.send({ length: data[0]["COUNT(*)"] });
  });
});

app.post("/getStarListLength", (req, res) => {
  starDB.getStarListLength(req.body, (err, data) => {
    res.send({ length: data[0]["COUNT(*)"] });
  });
});

app.post("/getStarList", (req, res) => {
  starDB.getStarList(req.body, (err, data) => {
    res.send(data);
  });
});

app.post("/delStarVideo", (req, res) => {
  starDB.delStarVideo(req.body, (err, data) => {
    res.send(data);
  });
});

app.post("/addStarVideo", (req, res) => {
  starDB.addStarVideo(req.body, (err, data) => {
    res.send(data);
  });
});

app.post("/getStarVideo", (req, res) => {
  starDB.getStarVideo(req.body, (err, data) => {
    res.send(data);
  });
});

app.post("/getStar", (req, res) => {
  starDB.getStarInfo(req.body, (err, data) => {
    res.send(data[0]);
  });
});

app.post("/delLike", (req, res) => {
  videoDB.getlike(req.body, (err, data) => {
    if (data.length == 0) {
      res.send({ status: 0 });
    } else {
      videoDB.dellike(req.body, (err, data) => {
        videoDB.videoLikeTimesMinus(req.body.id, (err, data) => {
          res.send(data);
        });
      });
    }
  });
});

app.post("/addLike", (req, res) => {
  videoDB.getlike(req.body, (err, data) => {
    if (data.length == 0) {
      videoDB.addlike(req.body, (err, data) => {
        videoDB.videoLikeTimesPlus(req.body.id, (err, data) => {
          res.send(data);
        });
      });
    } else {
      res.send({ status: 0 });
    }
  });
});

app.post("/getLike", (req, res) => {
  videoDB.getlike(req.body, (err, data) => {
    if (data.length == 0) {
      res.send({ status: 0 });
    } else {
      res.send({ status: 1 });
    }
  });
});

app.post("/playVideo", (req, res) => {
  usersDB.checkToken(req.body, (err, data) => {
    if (data.length == 0) {
      res.send({ status: 444 });
    } else {
      let date = new Date();
      videoDB.getPlayLog(req.body, (err, data) => {
        if (
          data.length == 0 ||
          date.getTime() - data[0].time > config.playTimeCoolingTime
        ) {
          videoDB.videoPlayTimesPlus(req.body.id, (err, data) => {
            videoDB.addPlayLog(req.body, (err, data) => {
              res.send({
                status: 1,
              });
            });
          });
        } else {
          res.send({ status: 0 });
        }
      });
    }
  });
});

app.get("/getHotVideos", (req, res) => {
  videoDB.getMaxPlayVideoList(config.homePageHotVideoNumber, (err, data) => {
    if (!err) {
      res.send(data);
    }
  });
});

app.post("/getVideoInfo", (req, res) => {
  videoDB.getVideoInfo(req.body.id, (err, data) => {
    res.send(data[0]);
  });
});

app.get("/getSiteName", (req, res) => {
  res.send(siteName);
});

app.post("/getUserInfo", (req, res) => {
  usersDB.getUser(req.body.account, (err, data) => {
    if (!err) {
      usersDB.getUserInfo(data[0].uid, (err, data) => {
        if (!err) {
          res.send(data[0]);
        }
      });
    }
  });
});

app.post("/login", (req, res) => {
  usersDB.getUser(req.body.account, (err, data) => {
    if (!err) {
      if (data.length == 0) {
        res.send({ status: 0 });
      } else {
        if (req.body.password == data[0].password) {
          res.send({ status: 1, token: data[0].token });
        } else {
          res.send({ status: 0 });
        }
      }
    } else {
      console.log(err);
      res.send(err);
    }
  });
});

app.post("/reg", (req, res) => {
  usersDB.getUser(req.body.account, (err, data) => {
    if (!err) {
      if (data.length == 0) {
        usersDB.createUser(
          {
            account: req.body.account,
            password: req.body.password,
          },
          (err, data) => {
            if (!err) {
              usersDB.getUser(req.body.account, (err, data) => {
                let userData = data[0];
                userData.status = 1;
                usersDB.createUserInfo(
                  {
                    uid: data[0].uid,
                    name: req.body.name,
                    gender: req.body.gender,
                  },
                  (err, data) => {
                    starDB.addStar(
                      {
                        star_box_name: "收藏夹",
                        account: req.body.account,
                        permissions: 1,
                        description: "收藏夹",
                        cover_image_id: 0,
                      },
                      (err, data) => {
                        if (!err) {
                          res.send(userData);
                        }
                      }
                    );
                  }
                );
              });
            }
          }
        );
      } else {
        res.send({ status: 0 });
      }
    } else {
      console.log(err);
      res.send(err);
    }
  });
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
