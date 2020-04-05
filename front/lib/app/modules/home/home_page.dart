import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:good_hack/app/modules/home/components/home_details.dart';
import 'package:good_hack/app/modules/home/components/market_list.dart';
import 'package:good_hack/app/shared/widgets/centered_view.dart';
import 'package:good_hack/app/shared/widgets/navigation_bar/components/drawer/nav_drawer.dart';
import 'package:good_hack/app/shared/widgets/navigation_bar/navigation_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, size) => Scaffold(
        key: Modular.get<HomeController>().scaffoldKey,
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
          child: Column(
            children: <Widget>[
              HomeDetails(),
              Markets(),
            ],
          ),
        ),
      ),
    );
  }
}