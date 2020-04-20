import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../app_controller.dart';
import 'drawer_header.dart';
import 'drawer_items.dart';

class NavDrawer extends StatefulWidget {
  final String route;

  NavDrawer(this.route);

  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends ModularState<NavDrawer, AppController> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Container(
        width: 280,
        decoration: BoxDecoration(
          color: controller.color, //Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16)],
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            NavDrawerHeader(),
            DrawerItem(
              title: 'Início',
              iconWidget: Icon(Icons.home, size: 30.0),
              click: () {
                if (widget.route != '/') {
                  Modular.to.popUntil(ModalRoute.withName('/'));
                } else
                  Modular.to.pop();
              },
            ),
            DrawerItem(
              title: 'Sacola',
              iconWidget: Icon(Icons.shopping_basket, size: 30.0),
              click: () {
                // print('NomeDaLoja: ${controller.name}');

                if (widget.route != '/loja') {
                  // print('PushNamed: /loja/:${controller.id}');

                  Modular.to.pushNamed('/loja/${controller.id}');
                } else
                  Modular.to.pop();
              },
            ),
            DrawerItem(
              title: 'Covid-19',
              iconWidget: Icon(Icons.healing, size: 30.0),
              click: () {
                if (widget.route != '/info') {
                  print('pushNamed: /info');

                  if (controller.scaffoldKeyS.currentState != null)
                    //   Modular.to.pushReplacementNamed('/info');
                    // else
                    Modular.to.pushNamed('/info');
                } else
                  Modular.to.pop();
              },
            ),
            // DrawerItem(
            //   title: 'Tema',
            //   iconWidget: Observer(
            //     builder: (_) => Icon(controller.icon),
            //   ),
            //   click: () {
            //     controller.changeTheme();
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
