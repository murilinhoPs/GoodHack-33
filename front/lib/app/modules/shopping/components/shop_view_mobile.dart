import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:good_hack/app/app_controller.dart';
import 'package:good_hack/app/modules/shopping/shop_controller.dart';
import 'package:good_hack/app/shared/services/controller_validator.dart';
import 'package:multi_masked_formatter/multi_masked_formatter.dart';

class ShopViewMobile extends StatelessWidget {
  final titleSize;
  final subtitleSize;
  final storeName;

  final appController = Modular.get<AppController>();

  ShopViewMobile(this.titleSize, this.subtitleSize, this.storeName);

  final _controller = TextEditingController();
  final _numberController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();

  final _formFocus = FocusNode();
  final _numberFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _nameFocus = FocusNode();

  final _mobxController = Modular.get<ShopController>();

  static final Controller formController = Controller();

  @override
  Widget build(BuildContext context) {
    String finalMessage;
    String finalNumber;
    String finalEmail;
    String finalName;

    return Form(
      key: formController.formKey,
      child: GestureDetector(
        onTap: () {
          _formFocus.unfocus();
          _numberFocus.unfocus();
          _emailFocus.unfocus();
        },
        child: ListView(
          primary: false,
          shrinkWrap: false,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.add_shopping_cart,
                          size: 100.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Observer(
                          builder: (_) => SelectableText(
                            appController.name == ' '
                                ? 'Carrinho da loja:'
                                : '${appController.name}:',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              height: 1.1,
                              fontSize: titleSize,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  width: 350,
                  child: TextFormField(
                    onTap: () {
                      _formFocus.requestFocus();
                    },
                    controller: _controller,
                    enableInteractiveSelection: true,
                    maxLines: null,
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
                Container(
                  width: 350,
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
                Container(
                  width: 350,
                  child: TextFormField(
                    enableInteractiveSelection: true,
                    controller: _numberController,
                    onTap: () {
                      _numberFocus.requestFocus();
                    },
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
                        labelText: 'Seu celular', hintText: '15 91234-5678'),
                    validator: (_) {
                      String patttern = r'(^(?:[+]5)?[0-9]{12,13})';
                      //String patttern8 = r'(^(?:[+]5)?[0-8]{12,13})';

                      RegExp regExp = new RegExp(patttern);
                      //RegExp newRegExp = new RegExp(patttern8);

                      if (!regExp.hasMatch(finalNumber) ||
                          finalNumber.length > 15) {
                        return 'Please enter valid mobile number';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  width: 350,
                  child: TextFormField(
                    enableInteractiveSelection: true,
                    controller: _emailController,
                    onTap: () {
                      _emailFocus.requestFocus();
                    },
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
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      color: Color.fromARGB(255, 255, 182, 72),
                      child: Text(
                        'Enviar pedido',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          height: 1.0,
                          fontSize: subtitleSize,
                        ),
                      ),
                      onPressed: () async {
                        finalNumber =
                            '+55' + _numberController.text.replaceAll('-', "");

                        if (formController.validade()) {
                          _mobxController.postOrder(
                              msg: finalMessage,
                              telefone: finalNumber,
                              email: finalEmail,
                              nome: finalName);

                          _cleanFields();
                        }
                      },
                    ),
                    Icon(Icons.call, size: 50)
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _cleanFields() {
    _numberController.clear();
    _controller.clear();
    _emailController.clear();
    _nameController.clear();
  }

  // _uncofusFields() {
  //   _formFocus.unfocus();
  //   _emailFocus.unfocus();
  //   _numberFocus.unfocus();
  //   _nameFocus.unfocus();
  // }
}
