const router = require('express').Router();

const lojasController = require('../controllers/lojasControllers');

router.post('/', lojasController.cadastro).get('/', lojasController.pesquisa);

module.exports = router;
