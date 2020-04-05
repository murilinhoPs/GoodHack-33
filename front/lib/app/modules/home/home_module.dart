import 'package:good_hack/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:good_hack/app/modules/home/home_page.dart';
import 'package:good_hack/app/modules/shopping/shop_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => HomeController(),
        ),
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
