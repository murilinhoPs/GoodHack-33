import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:good_hack/app/app_controller.dart';
import 'package:good_hack/app/modules/info/info_controller.dart';
import 'package:good_hack/app/shared/widgets/centered_view.dart';
import 'package:good_hack/app/shared/widgets/navigation_bar/components/drawer/nav_drawer.dart';
import 'package:good_hack/app/shared/widgets/navigation_bar/navigation_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends ModularState<InfoPage, InfoController> {
  final _appController = Modular.get<AppController>();

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, size) {
        double titleSize = size.isMobile ? 40 : 60;

        double descriptionSize = size.isMobile ? 14 : 18;

        return Scaffold(
          backgroundColor: Colors.white,
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
                  'Retire Fácil',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    height: 1.1,
                    fontSize: titleSize,
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  'Algumas recomendações para se proteger do Covid-19',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    height: 1.1,
                    fontSize: descriptionSize,
                  ),
                ),
                SizedBox(height: 20.0),
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
