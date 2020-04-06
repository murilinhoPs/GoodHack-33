import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../app_controller.dart';

class NavBarLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(Modular.get<AppController>().scaffoldKeyH.currentContext);
      },
      child: SizedBox(
        height: 30,
        width: 50,
        child: Text('Logo'),
      ),
    );
  }
}
