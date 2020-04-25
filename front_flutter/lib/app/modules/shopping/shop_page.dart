import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:front_flutter/app/modules/shopping/components/shop_view_desktop.dart';
import 'package:front_flutter/app/modules/shopping/components/shop_view_mobile.dart';
import 'package:front_flutter/app/shared/widgets/centered_view.dart';
import 'package:front_flutter/app/shared/widgets/navigation_bar/components/drawer/nav_drawer.dart';
import 'package:front_flutter/app/shared/widgets/navigation_bar/navigation_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../app_controller.dart';
import 'shop_controller.dart';

class ShopPage extends StatefulWidget {
  final String id;

  ShopPage({Key key, this.id}) {
    print('ShopId: ${this.id}');
  }

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends ModularState<ShopPage, ShopController> {
  final appController = Modular.get<AppController>();

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, size) {
        double titleSize = size.isMobile ? 22 : 32;

        double subtitleSize = size.isMobile ? 18 : 26;

        return Scaffold(
          drawer: size.isMobile ? NavDrawer('/loja') : null,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(size.screenSize.height * 0.07),
            child: CenteredView(
              newPadding: const EdgeInsets.only(
                  right: 15, left: 15.0, top: 8.0, bottom: 0),
              child: NavigationBar('/loja'),
            ),
          ),
          body: CenteredView(
            newPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
            child: widget.id == null
                ? Text('Id: ${widget.id}')
                : ScreenTypeLayout(
                    mobile: ShopViewMobile(
                        titleSize, subtitleSize, appController.name),
                    desktop: ShopViewDesktop(
                        titleSize, subtitleSize, appController.name),
                  ),
          ),
        );
      },
    );
  }
}
