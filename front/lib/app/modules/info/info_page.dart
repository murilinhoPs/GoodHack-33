import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:good_hack/app/app_controller.dart';
import 'package:good_hack/app/modules/info/info_controller.dart';
import 'package:good_hack/app/shared/widgets/centered_view.dart';
import 'package:good_hack/app/shared/widgets/navigation_bar/components/drawer/nav_drawer.dart';
import 'package:good_hack/app/shared/widgets/navigation_bar/navigation_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';

class InfoPage extends StatefulWidget {
  final appController = Modular.get<AppController>();

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends ModularState<InfoPage, InfoController> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, size) {
        double fontSize = size.isMobile ? 24 : 32;

        return Scaffold(
          backgroundColor: Modular.get<AppController>().color,
          key: widget.appController.scaffoldKeyI,
          drawer: size.isMobile ? NavDrawer('/info') : null,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(size.screenSize.height * 0.07),
            child: CenteredView(
              newPadding: const EdgeInsets.only(
                  right: 15, left: 15.0, top: 8.0, bottom: 0),
              child: NavigationBar('/info'),
            ),
          ),
          body: CenteredView(
            newPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 15.0),
                Text(
                  'Algumas recomendações para se proteger do Covid-19',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    height: 1.1,
                    fontSize: fontSize,
                  ),
                ),
                SizedBox(height: 30.0),
                Container(
                  child: Image.asset(
                    'assets/info.png',
                    width: 1600,
                    height: size.screenSize.height * 0.5,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
