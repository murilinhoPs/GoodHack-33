const { model, Schema } = require("mongoose");

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

module.exports = model("Lojas", LojasSchema);
