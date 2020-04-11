import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:good_hack/app/app_controller.dart';
import 'package:good_hack/app/shared/widgets/navigation_bar/models/nav_bar_items.dart';
import 'package:good_hack/app/shared/widgets/navigation_bar/models/nav_bar_logo.dart';

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
      height: 100,
      // decoration: BoxDecoration(
      //     border: Border(
      //   bottom: BorderSide(width: 0.5, color: Colors.black),
      // )),
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
                    print('Rota atual: ${Modular.actualRoute}');

                    print('pushNamed: /loja/:${controller.id}');
                    print('NomeDaLoja: ${controller.name}');

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
                    print('pushNamed: /loja/:${controller.id}');
                    print('NomeDaLoja: ${controller.name}');

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
                  if (widget.route != '/info') {
                    //print('pushNamed: /info');

                    Modular.to.pushNamed('/info');
                  } else
                    Modular.to.pop();
                },
              ),
              // NavBarItem(
              //     title: Observer(builder: (_) => Icon(controller.icon)),
              //     click: () {
              //       controller.changeTheme();
              //     }),
            ],
          )
        ],
      ),
    );
  }
}
