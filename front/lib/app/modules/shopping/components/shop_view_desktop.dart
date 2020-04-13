import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:good_hack/app/app_controller.dart';
import 'package:good_hack/app/shared/services/controller_validator.dart';
import 'package:multi_masked_formatter/multi_masked_formatter.dart';

import '../shop_controller.dart';

class ShopViewDesktop extends StatefulWidget {
  final titleSize;
  final subtitleSize;
  final storeName;

  ShopViewDesktop(this.titleSize, this.subtitleSize, this.storeName);

  @override
  _ShopViewDesktopState createState() => _ShopViewDesktopState();
}

class _ShopViewDesktopState extends State<ShopViewDesktop> {
  final appController = Modular.get<AppController>();

  final _controller = TextEditingController();
  final _numberController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();

  final _formFocus = FocusNode();
  final _numberFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _nameFocus = FocusNode();

  final _mobxController = Modular.get<ShopController>();

  final Controller formController = Controller();

  @override
  Widget build(BuildContext context) {
    String finalMessage;
    String finalNumber;
    String finalEmail;
    String finalName;

    return Form(
      key: formController.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.add_shopping_cart,
                    size: 90.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Observer(
                    builder: (_) => SelectableText(
                      widget.storeName == ' '
                          ? 'Carrinho da loja: ${appController.name}'
                          : '${widget.storeName}:',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        height: 1.1,
                        fontSize: widget.titleSize,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30),
                Container(
                  width: 280,
                  child: TextFormField(
                    controller: _controller,
                    enableInteractiveSelection: true,
                    maxLines: null,
                    autovalidate: false,
                    autofocus: false,
                    cursorColor: Color.fromARGB(255, 255, 182, 72),
                    focusNode: _formFocus,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        labelText: 'Escreva seu pedido',
                        hintText: '1 pão de batata\n2 bolacha salgada'),
                    validator: (value) {
                      if (value.isEmpty) return 'Escreva algo';
                      return null;
                    },
                    onChanged: (value) {
                      finalMessage = value;
                    },
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 150,
                child: TextFormField(
                  enableInteractiveSelection: true,
                  controller: _nameController,
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  focusNode: _nameFocus,
                  decoration: InputDecoration(
                      labelText: 'Nome', hintText: 'Primeiro Nome'),
                  validator: (_) {
                    if (_.isEmpty) return 'Escreva seu nome';
                    return null;
                  },
                  onChanged: (value) {
                    finalName = value;
                  },
                ),
              ),
              SizedBox(width: 20.0),
              Container(
                width: 200,
                child: TextFormField(
                  enableInteractiveSelection: true,
                  controller: _numberController,
                  inputFormatters: [
                    MultiMaskedTextInputFormatter(
                        masks: ['xx-xxxxx-xxxx'], separator: '-')
                  ],
                  //autovalidate: true,
                  autofocus: false,
                  //autovalidate: true,
                  keyboardType: TextInputType.number,
                  focusNode: _numberFocus,
                  decoration: InputDecoration(
                      labelText: 'Seu celular',
                      hintText: '15 1234-5678 ou 11 91234-5678'),
                  validator: (value) {
                    String patttern = r'(^(?:[+]5)?[0-9]{12,13})';

                    RegExp regExp = new RegExp(patttern);

                    if (!regExp.hasMatch(finalNumber) ||
                        finalNumber.length > 15 ||
                        value.isEmpty) {
                      return 'Please enter valid mobile number';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(width: 20.0),
              Container(
                width: 200,
                child: TextFormField(
                  enableInteractiveSelection: true,
                  controller: _emailController,
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  focusNode: _emailFocus,
                  decoration: InputDecoration(
                      labelText: 'email', hintText: 'meuEmail@gmail.com'),
                  validator: (_) {
                    if (!_.contains('@')) return 'Digite um email válido';
                    return null;
                  },
                  onChanged: (value) {
                    finalEmail = value;
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Color.fromARGB(255, 255, 182, 72),
                child: Text(
                  'Enviar pedido',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    height: 1.0,
                    fontSize: widget.subtitleSize,
                  ),
                ),
                onPressed: () async {
                  //_uncofusFields();

                  finalNumber =
                      '+55' + _numberController.text.replaceAll('-', "");

                  if (formController.validade()) {
                    _mobxController.postOrder(
                      msg: finalMessage,
                      telefone: finalNumber,
                      email: finalEmail,
                      nome: finalName,
                    );

                    _cleanFields();
                  }
                },
              ),
              Icon(Icons.call, size: 50)
            ],
          )
        ],
      ),
    );
  }

  _cleanFields() {
    _numberController.clear();
    _controller.clear();
    _emailController.clear();
    _nameController.clear();
  }
}
