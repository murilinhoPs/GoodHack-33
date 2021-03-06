import 'package:flutter_modular/flutter_modular.dart';
import 'package:front_flutter/app/modules/info/info_page.dart';

class InfoModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router(
          '/',
          child: (_, args) => InfoPage(),
        ),
      ];

  static Inject get to => Inject<InfoModule>.of();
}
