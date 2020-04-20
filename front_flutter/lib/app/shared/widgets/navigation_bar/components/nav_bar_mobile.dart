import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:front_flutter/app/shared/widgets/navigation_bar/models/nav_bar_logo.dart';

import '../../../../app_controller.dart';

class NavBarMobile extends StatefulWidget {
  @override
  _NavBarMobileState createState() => _NavBarMobileState();
}

class _NavBarMobileState extends ModularState<NavBarMobile, AppController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 35,
              width: 30,
              child: InkWell(
                highlightColor: Colors.transparent,
                hoverColor: Color.fromARGB(240, 255, 182, 72),
                splashColor: Color.fromARGB(50, 31, 219, 80),
                borderRadius: BorderRadius.circular(5),
                child: Icon(
                  Icons.menu,
                  size: 30.0,
                  //color: Color.fromARGB(200, 255, 182, 72),
                ),
                onTap: () {
                  print(Modular.actualRoute);

                  print('H: ${controller.scaffoldKeyH.currentState}');
                  print('S: ${controller.scaffoldKeyS.currentState}');
                  print('I: ${controller.scaffoldKeyI.currentState}');

                  if (controller.scaffoldKeyH.currentState != null)
                    controller.open();
                  else if (controller.scaffoldKeyS.currentState != null) {
                    controller.openS();
                  } else if (controller.scaffoldKeyI.currentState != null) {
                    controller.openI();
                  } else
                    return;
                },
              ),
            ),
            NavBarLogo(),
          ],
        ),
      ),
    );
  }
}
