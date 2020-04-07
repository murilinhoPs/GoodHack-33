import 'package:flutter_modular/flutter_modular.dart';
import 'package:good_hack/app/modules/home/home_page.dart';
import 'package:good_hack/app/modules/shopping/shop_controller.dart';
import 'package:good_hack/app/modules/shopping/shop_page.dart';
import 'package:good_hack/app/shared/services/api_repository.dart';

class ShopModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ShopController(i.get<ApiRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(
          '/:id',
          child: (_, args) => ShopPage(id: args.params['id']),
        ),
      ];

  static Inject get to => Inject<ShopModule>.of();
}
