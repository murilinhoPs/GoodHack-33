import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:good_hack/app/app_controller.dart';
import 'package:good_hack/app/shared/widgets/navigation_bar/components/drawer/drawer_header.dart';
import 'package:good_hack/app/shared/widgets/navigation_bar/components/drawer/drawer_items.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends ModularState<NavDrawer, AppController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16)],
      ),
      child: Column(
        children: <Widget>[
          NavDrawerHeader(),
          DrawerItem(
            title: 'Início',
            iconWidget: Icon(Icons.home, size: 30.0),
            click: () {
              print('popUntil: initialRoute');
              Modular.to.popUntil(ModalRoute.withName(Modular.initialRoute));
            },
          ),
          DrawerItem(
            title: 'Sacola',
            iconWidget: Icon(Icons.shopping_basket, size: 30.0),
            click: () {
              print('popAndPushNamed: /loja/:id');
              Modular.to.popAndPushNamed('/loja/${controller.id}');
            },
          ),
          // DrawerItem(
          //   title: 'Covid-19',
          //   iconWidget: Icon(Icons.healing, size: 30.0),
          //   click: () {
          //     //print('pushNamed: /info');

          //     //ERROR: Modular.to.pushNamed('/info');
          //   },
          // ),
        ],
      ),
    );
  }
}
