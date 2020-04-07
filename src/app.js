require('dotenv/config');
const express = require('express');
const cors = require('cors');
const mongoose = require('mongoose');
const path = require('path');

const router = require('./routes');

const app = express();
app.use(cors());

mongoose.connect(
  'mongodb+srv://takai:omnistack@cluster0-9coiv.mongodb.net/week10?retryWrites=true&w=majority',
  {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  },
);

// app.options('/lojas', cors());
// app.options('/services/email', cors());
// app.options('/services/message', cors());

app.use(express.json());
app.use(express.urlencoded({ extended: true }));


app.use(express.static(path.join(__dirname, "/../web/")));

app.use('/', router);

module.exports = app;
