import 'package:good_hack/app/shared/models/email_model.dart';
import 'package:good_hack/app/shared/models/sms_model.dart';
import 'package:good_hack/app/shared/services/api_repository.dart';
import 'package:mobx/mobx.dart';
part 'shop_controller.g.dart';

class ShopController = _ShopControllerBase with _$ShopController;

abstract class _ShopControllerBase with Store {
  final ApiRepository _repository;

  _ShopControllerBase(this._repository);

  @observable
  String finalMessage = ' ';

  @action
  postOrder({String msg, String email, String telefone}) async {
    finalMessage = msg;

    //print(finalMessage);

    if (finalMessage != ' ') {
      try {
        await _repository.postMessage(
          MessageModel(
                  from: "+12135684050",
                  to: "+5511954364143",
                  body: 'Confira o novo pedido no seu email!')
              .toJson(),
        );

        await _repository.postEmail(EmailModel(
          to: "murilinhorps@gmail.com",
          from: email,
          subject: "Pedido",
          text: '$finalMessage \nContato: $telefone',
          html: "<t>$finalMessage \nContato: $telefone'</t>",
        ).toJson());

        print(finalMessage);
      } catch (e) {
        print('Error Message: ${e.message}');
      }
    }
  }
}
