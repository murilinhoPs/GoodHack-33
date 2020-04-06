class MarketModel {
  Endereco endereco;
  String sId;
  String nome;
  String categoria;
  String horarioFuncionamento;
  String formasDePagamento;

  MarketModel(
      {this.endereco,
      this.sId,
      this.nome,
      this.categoria,
      this.horarioFuncionamento,
      this.formasDePagamento});

  MarketModel.fromJson(Map<String, dynamic> json) {
    endereco = json['endereco'] != null
        ? new Endereco.fromJson(json['endereco'])
        : null;
    sId = json['_id'];
    nome = json['nome'];
    categoria = json['categoria'];
    horarioFuncionamento = json['horarioFuncionamento'];
    formasDePagamento = json['formasDePagamento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.endereco != null) {
      data['endereco'] = this.endereco.toJson();
    }
    data['_id'] = this.sId;
    data['nome'] = this.nome;
    data['categoria'] = this.categoria;
    data['horarioFuncionamento'] = this.horarioFuncionamento;
    data['formasDePagamento'] = this.formasDePagamento;
    return data;
  }
}

class Endereco {
  int cep;
  String rua;
  int numero;
  String complemento;

  Endereco({this.cep, this.rua, this.numero, this.complemento});

  Endereco.fromJson(Map<String, dynamic> json) {
    cep = json['cep'];
    rua = json['rua'];
    numero = json['numero'];
    complemento = json['complemento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cep'] = this.cep;
    data['rua'] = this.rua;
    data['numero'] = this.numero;
    data['complemento'] = this.complemento;
    return data;
  }
}
