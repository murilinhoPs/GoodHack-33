import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:good_hack/app/shared/models/markets_model.dart';

class ApiRepository extends Disposable {
  Dio _dioClient;

  ApiRepository(this._dioClient);

  String _url = 'https://good-hack-33.herokuapp.com';

  Future responseGet() async {
    List<MarketModel> list = [];

    var response =
        await _dioClient.get('https://good-hack-33.herokuapp.com/lojas');

    if (response.statusCode == 200) {
      for (var json in response.data) {
        list.add(MarketModel.fromJson(json));
      }

      // print('Tamanho: ${list.length}');
      print(response.statusCode);

      return list;
    } else {
      print(response.statusCode);
    }
  }

  Future postMessage(Map<String, dynamic> body) async {
    var response = await _dioClient.post(
        'https://good-hack-33.herokuapp.com/services/message',
        options: Options(
          contentType: 'application/json',
        ),
        data: body);
    if (response.statusCode == 200) {
      //print("httpDebug: $_url \n $body}");

      return response.statusCode;
    } else {
      print(response.statusCode);
    }
  }

  Future postEmail(Map<String, dynamic> body) async {
    var response = await _dioClient.post(
        'https://good-hack-33.herokuapp.com/services/email',
        options: Options(
          contentType: 'application/json',
        ),
        data: body);
    if (response.statusCode == 200) {
      //print("httpDebug: $_url \n $body}");

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
