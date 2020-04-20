import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:front_flutter/app/shared/widgets/navigation_bar/models/nav_bar_items.dart';
import 'package:front_flutter/app/shared/widgets/navigation_bar/models/nav_bar_logo.dart';

import '../../../../app_controller.dart';

class NavBarDesktop extends StatefulWidget {
  final String route;

  NavBarDesktop(this.route);

  @override
  _NavBarDesktopState createState() => _NavBarDesktopState();
}

class _NavBarDesktopState extends ModularState<NavBarDesktop, AppController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NavBarLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NavBarItem(
                  title: Text('Início', style: TextStyle(fontSize: 18)),
                  click: () async {
                    // print('Rota atual: ${Modular.actualRoute}');

                    // print('pushNamed: /loja/:${controller.id}');
                    // print('NomeDaLoja: ${controller.name}');

                    if (widget.route != '/') {
                      Modular.to
                          .popUntil(ModalRoute.withName(Modular.initialRoute));
                    }
                  }),
              SizedBox(
                width: 15,
              ),
              NavBarItem(
                title: Text('Sacola', style: TextStyle(fontSize: 18)),
                click: () {
                  if (widget.route != '/loja') {
                    // print('pushNamed: /loja/:${controller.id}');
                    // print('NomeDaLoja: ${controller.name}');

                    Modular.to.pushNamed('/loja/${controller.id}');
                  }
                },
              ),
              SizedBox(
                width: 15,
              ),
              NavBarItem(
                title: Text('Covid-19', style: TextStyle(fontSize: 18)),
                click: () {
                  print('Rota atual/anterior: ${Modular.actualRoute}');
                  if (widget.route != '/info') {
                    //print('pushNamed: /info');

                    Modular.to.pushNamed('/info');
                  }
                },
              ),
              NavBarItem(
                title: Icon(controller.icon),
                click: () {
                  controller.changeTheme();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
