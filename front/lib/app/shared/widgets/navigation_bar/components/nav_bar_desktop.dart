import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:good_hack/app/shared/widgets/navigation_bar/models/nav_bar_items.dart';
import 'package:good_hack/app/shared/widgets/navigation_bar/models/nav_bar_logo.dart';

class NavBarDesktop extends StatelessWidget {
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
                  title: 'Início',
                  click: () {
                    print('Rota atual: ${Modular.actualRoute}');

                    Modular.to
                        .popUntil(ModalRoute.withName(Modular.initialRoute));
                  }),
              SizedBox(
                width: 15,
              ),
              NavBarItem(
                  title: 'Sacola',
                  click: () {
                    Modular.to.pushNamed('/loja/ ');
                  }),
              SizedBox(
                width: 15,
              ),
              NavBarItem(title: 'Outro', click: () {}),
            ],
          )
        ],
      ),
    );
  }
}
