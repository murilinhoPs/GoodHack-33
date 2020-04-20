import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:front_flutter/app/shared/services/api_repository.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/home/home_module.dart';
import 'modules/info/info_module.dart';
import 'modules/shopping/shop_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => AppController(),
        ),
        Bind(
          (i) => Dio(),
        ),
        Bind(
          (i) => ApiRepository(i.get<Dio>()),
        ),
      ];

  @override
  List<Router> get routers => [
        Router(
          '/',
          module: HomeModule(),
        ),
        Router(
          '/loja',
          module: ShopModule(),
        ),
        Router(
          '/info',
          module: InfoModule(),
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
