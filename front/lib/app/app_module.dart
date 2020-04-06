import 'package:dio/dio.dart';
import 'package:good_hack/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:good_hack/app/app_widget.dart';
import 'package:good_hack/app/modules/home/home_module.dart';
import 'package:good_hack/app/modules/shopping/shop_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => AppController(),
        ),
        // Bind(
        //   (i) => Dio(),
        // )
      ];

  @override
  List<Router> get routers => [
        Router(
          Modular.initialRoute,
          module: HomeModule(),
        ),
        Router(
          '/loja/:id',
          module: ShopModule(),
        )
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
