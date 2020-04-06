require("dotenv/config");
const express = require("express");
const cors = require("cors");
const mongoose = require("mongoose");

const router = require("./routes");

const app = express();

mongoose.connect(
  "mongodb+srv://takai:omnistack@cluster0-9coiv.mongodb.net/week10?retryWrites=true&w=majority",
  {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  }
);

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.engine("html", require("ejs").renderFile);

app.set("views", `${__dirname}/../front/web`);

app.use("/", router);

module.exports = app;
