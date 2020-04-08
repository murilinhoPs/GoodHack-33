import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:good_hack/app/app_controller.dart';
import 'package:good_hack/app/shared/widgets/navigation_bar/models/nav_bar_items.dart';
import 'package:good_hack/app/shared/widgets/navigation_bar/models/nav_bar_logo.dart';

class NavBarDesktop extends StatefulWidget {
  @override
  _NavBarDesktopState createState() => _NavBarDesktopState();
}

class _NavBarDesktopState extends ModularState<NavBarDesktop, AppController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
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

                    Modular.to
                        .popUntil(ModalRoute.withName(Modular.initialRoute));
                  }),
              SizedBox(
                width: 15,
              ),
              NavBarItem(
                  title: Text('Sacola', style: TextStyle(fontSize: 18)),
                  click: () {
                    Modular.to.pushNamed('/loja/${controller.id}');
                  }),
              SizedBox(
                width: 15,
              ),
              // NavBarItem(
              //   title: Text('Covid-19', style: TextStyle(fontSize: 18)),
              //   click: () {
              //     Modular.to.pushNamed('/info');
              //   },
              // ),
            ],
          )
        ],
      ),
    );
  }
}
