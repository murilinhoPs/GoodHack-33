import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:front_flutter/app/shared/widgets/centered_view.dart';
import 'package:front_flutter/app/shared/widgets/navigation_bar/components/drawer/nav_drawer.dart';
import 'package:front_flutter/app/shared/widgets/navigation_bar/navigation_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../app_controller.dart';
import 'components/home_details.dart';
import 'components/market_list.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final appController = Modular.get<AppController>();

  @override
  Widget build(BuildContext context) {
    print('ActualRoute: ${Modular.actualRoute}');

    return ResponsiveBuilder(
      builder: (context, size) => Scaffold(
        // key: appController.scaffoldKeyH,
        drawer: size.isMobile ? NavDrawer('/') : null,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.screenSize.height * 0.07),
          child: CenteredView(
            newPadding: const EdgeInsets.only(
                right: 20, left: 20.0, top: 8.0, bottom: 0),
            child: NavigationBar('/'),
          ),
        ),
        body: CenteredView(
          newPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 30.0),
          child: ListView(
            primary: true,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
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
