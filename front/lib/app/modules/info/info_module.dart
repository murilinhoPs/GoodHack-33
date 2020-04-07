import 'package:flutter_modular/flutter_modular.dart';
import 'package:good_hack/app/modules/info/info_controller.dart';
import 'package:good_hack/app/modules/info/info_page.dart';

class InfoModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => InfoController())];

  @override
  List<Router> get routers => [
        Router(
          '/',
          child: (_, args) => InfoPage(),
        ),
      ];

  static Inject get to => Inject<InfoModule>.of();
}
