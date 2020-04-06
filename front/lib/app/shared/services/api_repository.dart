// import 'package:dio/dio.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:good_hack/app/shared/models/markets_model.dart';

// class ApiRepository {
//   final Dio _dioClient = Dio();

//   //ApiRepository(this._dioClient);

//   Future responseGet() async {
//     //List<MarketModel> listMsg = [];

//     try {
//       Response response = await _dioClient.get(
//         'https://jsonplaceholder.typicode.com/posts',
//       );

//       // for (var json in response.data) {
//       //   listMsg.add(MarketModel.fromJson(json));
//       // }
//       return (response.data as List)
//           .map((json) => MarketModel.fromJson(json))
//           .toList();
//     } on DioError catch (e) {
//       throw (e.message);
//     }
//   }

//   String _url = 'https://obscure-brushlands-00458.herokuapp.com/';

//   Future<int> responsePost(Map<String, dynamic> body) async {
//     try {
//       Response response = await _dioClient.post(_url,
//           options: Options(
//             headers: {
//               'accept': 'application/json',
//             },
//             contentType: 'application/json',
//           ),
//           data: body);
//       if (response.statusCode == 200) {
//         print("httpDebug: $_url \n $body}");

//         return response.statusCode;
//       } else {
//         print(response.statusCode);
//       }
//     } on DioError catch (e) {
//       throw (e.message);
//     }
//   }
// }

// // _messageFocus.unfocus();
// // _numberFocus.unfocus();

// // finalNumber =
// //     '+55' + _numberController.text.replaceAll('-', "");

// // Toast.show("Número: $finalNumber'", context,
// //     duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

// // dynamic content = {
// //   "from": "+12135684050",
// //   "body": finalMessage,
// //   "to": finalNumber
// // };

// // await apiMethods.sendSms(json.encode(content));
// // print('mandouSms');
