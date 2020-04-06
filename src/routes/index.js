const router = require('express').Router();

const pages = require('./pageRouter');
const services = require('./servicesRouter');
const lojas = require('./lojasRouter');

router.use('/', pages).use('/services', services).use('/lojas', lojas);

module.exports = router;
