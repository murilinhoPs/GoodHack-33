import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:good_hack/app/shared/widgets/centered_view.dart';
import 'package:good_hack/app/shared/widgets/navigation_bar/components/drawer/nav_drawer.dart';
import 'package:good_hack/app/shared/widgets/navigation_bar/navigation_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../app_controller.dart';
import 'shop_controller.dart';

class ShopPage extends StatefulWidget {
  final String id;
  final String title;

  ShopPage({Key key, this.title = "Shop", this.id}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends ModularState<ShopPage, ShopController> {
  @override
  Widget build(BuildContext context) {
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
          child: widget.id == ' ' ? Text('Escolha uma loja') : Text(widget.id),
        ),
      ),
    );
  }
}
