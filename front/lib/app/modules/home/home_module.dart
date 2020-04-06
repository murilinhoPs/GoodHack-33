import 'package:dio/dio.dart';
import 'package:good_hack/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:good_hack/app/modules/home/home_page.dart';
import 'package:good_hack/app/modules/shopping/shop_page.dart';
import 'package:good_hack/app/shared/services/api_repository.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
// injetar o home repository aqui
        Bind((i) => HomeController()),
        //Bind((i) => ApiRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(
          Modular.initialRoute,
          child: (_, args) => HomePage(),
        ),
        Router(
          '/loja/:id',
          child: (_, args) => ShopPage(id: args.params['id']),
        ),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
