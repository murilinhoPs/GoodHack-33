const Lojas = require('../models/Lojas');

const cadastro = async (req, res) => {
  try {
    const data = await Lojas.create(req.body);

    return res.status(200).json(data);
  } catch (err) {
    throw new Error(err);
  }
};

const pesquisa = async (req, res) => {
  try {
    const data = await Lojas.find(req.query);

    return res.status(200).json(data);
  } catch (err) {
    throw new Error(err);
  }
};

module.exports = { cadastro, pesquisa };
