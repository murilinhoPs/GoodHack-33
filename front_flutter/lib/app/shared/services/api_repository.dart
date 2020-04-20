import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:front_flutter/app/shared/models/markets_model.dart';

class ApiRepository extends Disposable {
  Dio _dioClient;

  ApiRepository(this._dioClient);

  Future responseGet() async {
    List<MarketModel> list = [];

    var response =
        await _dioClient.get('https://good-hack-33.herokuapp.com/lojas');

    if (response.statusCode == 200) {
      for (var json in response.data) {
        list.add(MarketModel.fromJson(json));
      }
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

      print('Message ${response.statusCode}');

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
      print("httpDebug: $body}");

      print('Email ${response.statusCode}');

      return response.statusCode;
    } else {
      print(response.statusCode);
    }
  }

  @override
  void dispose() {}
}
