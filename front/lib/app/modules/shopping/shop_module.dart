import 'package:flutter_modular/flutter_modular.dart';
import 'package:good_hack/app/modules/shopping/shop_controller.dart';
import 'package:good_hack/app/modules/shopping/shop_page.dart';

class ShopModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => ShopController(),
        ),
      ];

  @override
  List<Router> get routers => [
        // Router(
        //   Modular.initialRoute,
        //   child: (_, args) => HomePage(),
        // ),
        Router(
          '/loja/:id',
          child: (_, args) => ShopPage(id: args.params['id']),
        ),
      ];

  static Inject get to => Inject<ShopModule>.of();
}
