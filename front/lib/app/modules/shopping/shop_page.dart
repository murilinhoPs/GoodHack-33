import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:good_hack/app/shared/widgets/centered_view.dart';
import 'package:good_hack/app/shared/widgets/navigation_bar/components/drawer/nav_drawer.dart';
import 'package:good_hack/app/shared/widgets/navigation_bar/navigation_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../app_controller.dart';

class ShopPage extends StatelessWidget {
  final String id;

  const ShopPage({this.id});

  @override
  Widget build(BuildContext context) {
    print('ID: $id');
    return ResponsiveBuilder(
      builder: (context, size) => Scaffold(
        key: Modular.get<AppController>().scaffoldKeyS,
        drawer: size.isMobile ? NavDrawer() : null,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(125.0),
          child: CenteredView(
            newPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: NavigationBar(),
          ),
        ),
        body: CenteredView(
          newPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 1.0),
          child: id == '' ? Text('Escolha uma loja') : Text(id),
        ),
      ),
    );
  }
}
