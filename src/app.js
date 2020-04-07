require('dotenv/config');
const express = require('express');
const cors = require('cors');
const mongoose = require('mongoose');
const path = require('path');

const router = require('./routes');

const app = express();

mongoose.connect(
  'mongodb+srv://takai:omnistack@cluster0-9coiv.mongodb.net/week10?retryWrites=true&w=majority',
  {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  },
);

app.use(cors());
app.use(express.json());


app.use(express.static(path.join(__dirname, "/../web/")));

app.use('/', router);

module.exports = app;
