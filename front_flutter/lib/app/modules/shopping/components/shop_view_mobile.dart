import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:front_flutter/app/app_controller.dart';
import 'package:front_flutter/app/modules/shopping/shop_controller.dart';
import 'package:front_flutter/app/shared/services/controller_validator.dart';
import 'package:multi_masked_formatter/multi_masked_formatter.dart';

class ShopViewMobile extends StatefulWidget {
  final titleSize;
  final subtitleSize;
  final storeName;

  ShopViewMobile(this.titleSize, this.subtitleSize, this.storeName);

  static final Controller formController = Controller();

  @override
  _ShopViewMobileState createState() => _ShopViewMobileState();
}

class _ShopViewMobileState extends State<ShopViewMobile> {
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

  @override
  Widget build(BuildContext context) {
    String finalMessage;
    String finalNumber;
    String finalEmail;
    String finalName;

    return Form(
      key: ShopViewMobile.formController.formKey,
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
                            widget.storeName == ' '
                                ? 'Carrinho da loja: ${appController.name}'
                                : '${appController.name}:',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              height: 1.1,
                              fontSize: widget.titleSize,
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
                    onTap: () {
                      _nameFocus.requestFocus();
                    },
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
                    autofocus: false,
                    controller: _numberController,
                    inputFormatters: [
                      MultiMaskedTextInputFormatter(
                          masks: ['xx-xxxxx-xxxx'], separator: '-'),
                    ],
                    decoration: InputDecoration(
                        labelText: 'Seu número', hintText: '99-99999-9999'),
                    focusNode: _numberFocus,
                    onTap: () {
                      _numberFocus.requestFocus();
                    },
                    validator: (value) {
                      String pattern = r'(^(?:[+]5)?[0-9]{12,13})';

                      RegExp regExp = RegExp(pattern);

                      if (!regExp.hasMatch(finalNumber) ||
                          finalNumber.length > 15 ||
                          value.isEmpty) {
                        return 'Coloque um número válido.';
                      }
                      return null;
                    },
                  ),
                ),
                // Container(
                //   width: 350,
                //   child: TextFormField(
                //     enableInteractiveSelection: true,
                //     controller: _numberController,
                //     onTap: () {
                //       _numberFocus.requestFocus();
                //     },
                //     inputFormatters: [
                //       MultiMaskedTextInputFormatter(
                //           masks: ['xx-xxxxx-xxxx'], separator: '-')
                //     ],
                //     autofocus: false,
                //     keyboardType: TextInputType.number,
                //     focusNode: _numberFocus,
                //     decoration: InputDecoration(
                //         labelText: 'Seu celular', hintText: '15 91234-5678'),
                //     validator: (value) {
                //       String patttern = r'(^(?:[+]5)?[0-9]{12,13})';

                //       RegExp regExp = new RegExp(patttern);

                //       if (!regExp.hasMatch(finalNumber) ||
                //           finalNumber.length > 15 ||
                //           value.isEmpty) {
                //         return 'Coloque um número válido.';
                //       }
                //       return null;
                //     },
                //   ),
                // ),
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
                          fontSize: widget.subtitleSize,
                        ),
                      ),
                      onPressed: () async {
                        finalNumber =
                            '+55' + _numberController.text.replaceAll('-', "");

                        if (ShopViewMobile.formController.validade()) {
                          _mobxController.postOrder(
                              msg: finalMessage,
                              telefone: finalNumber,
                              email: finalEmail,
                              nome: finalName);

                          _cleanFields();

                          _uncofusFields();
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

  _uncofusFields() {
    _formFocus.unfocus();
    _emailFocus.unfocus();
    _numberFocus.unfocus();
    _nameFocus.unfocus();
  }
}
