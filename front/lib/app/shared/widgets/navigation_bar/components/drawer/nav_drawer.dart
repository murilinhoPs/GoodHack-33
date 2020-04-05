import 'package:flutter/material.dart';
import 'package:good_hack/app/shared/widgets/navigation_bar/components/drawer/drawer_header.dart';
import 'package:good_hack/app/shared/widgets/navigation_bar/components/drawer/drawer_items.dart';

class NavDrawer extends StatelessWidget {
  final String sla = 'Padaria';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16)],
      ),
      child: Column(
        children: <Widget>[
          NavDrawerHeader(),
          DrawerItem(title: 'Início', icon: Icons.home, click: () {}),
          DrawerItem(
            title: 'Sacola',
            icon: Icons.shopping_basket,
            click: () {
              Navigator.pushNamed(context, '/loja/Padaria');
            },
          ),
          DrawerItem(title: 'Outro', icon: Icons.android, click: () {})
        ],
      ),
    );
  }
}
