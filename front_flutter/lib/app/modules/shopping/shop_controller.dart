import 'package:front_flutter/app/shared/models/email_model.dart';
import 'package:front_flutter/app/shared/models/sms_model.dart';
import 'package:front_flutter/app/shared/services/api_repository.dart';
import 'package:mobx/mobx.dart';
part 'shop_controller.g.dart';

class ShopController = _ShopControllerBase with _$ShopController;

abstract class _ShopControllerBase with Store {
  final ApiRepository _repository;

  _ShopControllerBase(this._repository);

  @observable
  String storeName;
  @action
  name(newName) {
    storeName = newName;
  }

  @observable
  String finalMessage = ' ';

  @action
  postOrder(
      {String msg,
      String email,
      String telefone,
      String loja,
      String nome}) async {
    finalMessage = msg;

    print(email);

    if (finalMessage != ' ') {
      try {
        await _repository.postMessage(
          MessageModel(
                  from: "+12135684050",
                  to: "+5511954364143",
                  body:
                      'Confira o novo pedido no seu email! Confira se não está no Spam ou na Lixeira.\n$finalMessage \nNome e contato: $nome, $telefone e $email')
              .toJson(),
        );

        await _repository.postEmail(
          EmailModel(
                  to: "murilinhorps@gmail.com",
                  from: "murilinhops@hotmail.com",
                  subject: "Pedido",
                  text: "$finalMessage \nContato: $nome, $telefone e $email",
                  html:
                      "<t>$finalMessage<br> Contato: $nome, $telefone e $email</t>")
              .toJson(),
        );

        print(finalMessage);

        await _repository.postMessage(
          MessageModel(
                  from: "+12135684050",
                  to: telefone,
                  body: 'Confira seu pedido. \n$finalMessage')
              .toJson(),
        );
      } catch (e) {
        print('Error Message: ${e.message}');
      }
    }
  }
}
