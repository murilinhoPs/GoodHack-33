const { model, Schema } = require('mongoose');

const LojasSchema = new Schema({
  nome: String,
  categoria: String,
  endereco: {
    cep: Number,
    rua: String,
    numero: Number,
    complemento: String,
  },
  horarioFuncionamento: String,
  formasDePagamento: String,
});

// Colocar o numero da loja e a url da imagem da loja

module.exports = model('Lojas', LojasSchema);
