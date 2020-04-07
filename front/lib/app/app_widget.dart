import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hack for Good',
      theme: ThemeData(
        // primarySwatch: Color.fromARGB(255, 255, 182, 72),
        primaryColor: Color.fromARGB(255, 255, 182, 72),
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
      navigatorKey: Modular.navigatorKey,
    );
  }
}
