import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:good_hack/app/app_controller.dart';
import 'package:good_hack/app/modules/shopping/shop_controller.dart';
import 'package:good_hack/app/shared/services/controller_validator.dart';

class ShopViewMobile extends StatelessWidget {
  final titleSize;
  final subtitleSize;

  ShopViewMobile(this.titleSize, this.subtitleSize);

  final _controller = TextEditingController();

  final _formFocus = FocusNode();

  final _mobxController = Modular.get<ShopController>();

  String finalMessage;

  final Controller formController = Controller();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formController.formKey,
      child: Column(
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
                  child: SelectableText(
                    Modular.get<AppController>().name == ' '
                        ? 'Carrinho da loja:'
                        : '${Modular.get<AppController>().name}:',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      height: 1.1,
                      fontSize: titleSize,
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
                  if (formController.validade())
                    _mobxController.postOrder(msg: finalMessage);
                },
              ),
              Icon(Icons.call, size: 50)
            ],
          )
        ],
      ),
    );
  }
}