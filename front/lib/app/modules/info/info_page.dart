import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:good_hack/app/app_controller.dart';
import 'package:good_hack/app/shared/widgets/centered_view.dart';
import 'package:good_hack/app/shared/widgets/navigation_bar/components/drawer/nav_drawer.dart';
import 'package:good_hack/app/shared/widgets/navigation_bar/navigation_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';

class InfoPage extends StatelessWidget {
  final _appController = Modular.get<AppController>();

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, size) {
        double titleSize = size.isMobile ? 50 : 80;

        return Scaffold(
          key: _appController.scaffoldKeyH,
          drawer: size.isMobile ? NavDrawer() : null,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: CenteredView(
              newPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              child: NavigationBar(),
            ),
          ),
          body: CenteredView(
            newPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 1.0),
            child: ListView(
              primary: true,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Text(
                  'Nome do\nNosso Projeto',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    height: 1.1,
                    fontSize: titleSize,
                  ),
                ),
                Container(
                  child: Image.asset('assets/info.png'),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
