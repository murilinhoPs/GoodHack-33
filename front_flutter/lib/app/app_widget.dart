import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends ModularState<AppWidget, AppController> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        title: 'Hack for Good',
        theme: controller.theme,
        color: Colors.white,
        initialRoute: '/',
        onGenerateRoute: Modular.generateRoute,
        navigatorKey: Modular.navigatorKey,
      ),
    );
  }
}
