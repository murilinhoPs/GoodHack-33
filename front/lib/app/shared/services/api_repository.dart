import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:good_hack/app/shared/models/email_model.dart';
import 'package:good_hack/app/shared/models/markets_model.dart';
import 'package:good_hack/app/shared/models/sms_model.dart';

class ApiRepository extends Disposable {
  Dio _dioClient = Dio();

  ApiRepository(this._dioClient);

  String _url = 'http://localhost:3000/';

  Future responseGet() async {
    List<MarketModel> list = [];

    var response = await _dioClient.get(
      'http://localhost:3000/lojas',
    );

    if (response.statusCode == 200) {
      for (var json in response.data) {
        list.add(MarketModel.fromJson(json));
        print('Tamanho: ${list.length}');
      }

      print(response.statusCode);

      return list;
    } else {
      print(response.statusCode);
    }
  }

  Future postMessage(MessageModel body) async {
    Response response = await _dioClient.post('http://localhost:3000/message',
        options: Options(
          headers: {
            'accept': 'application/json',
          },
          contentType: 'application/json',
        ),
        data: body);
    if (response.statusCode == 200) {
      print("httpDebug: $_url \n $body}");

      return response.statusCode;
    } else {
      print(response.statusCode);
    }
  }

  Future postEmail(EmailModel body) async {
    Response response = await _dioClient.post('http://localhost:3000/email',
        options: Options(
          headers: {
            'accept': 'application/json',
          },
          contentType: 'application/json',
        ),
        data: body);
    if (response.statusCode == 200) {
      print("httpDebug: $_url \n $body}");

      return response.statusCode;
    } else {
      print(response.statusCode);
    }
  }

  @override
  void dispose() {}
}

// _messageFocus.unfocus();
// _numberFocus.unfocus();

// finalNumber =
//     '+55' + _numberController.text.replaceAll('-', "");

// Toast.show("Número: $finalNumber'", context,
//     duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

// dynamic content = {
//   "from": "+12135684050",
//   "body": finalMessage,
//   "to": finalNumber
// };

// await apiMethods.sendSms(json.encode(content));
// print('mandouSms');
