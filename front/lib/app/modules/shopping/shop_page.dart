import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:good_hack/app/modules/shopping/components/shop_view_desktop.dart';
import 'package:good_hack/app/modules/shopping/components/shop_view_mobile.dart';
import 'package:good_hack/app/shared/widgets/centered_view.dart';
import 'package:good_hack/app/shared/widgets/navigation_bar/components/drawer/nav_drawer.dart';
import 'package:good_hack/app/shared/widgets/navigation_bar/navigation_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../app_controller.dart';
import 'shop_controller.dart';

class ShopPage extends StatefulWidget {
  final String id;

  final appController = Modular.get<AppController>();

  ShopPage({Key key, this.id}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends ModularState<ShopPage, ShopController> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, size) {
        double titleSize = size.isMobile ? 22 : 32;

        double subtitleSize = size.isMobile ? 18 : 26;

        return Scaffold(
          key: controller.scaffoldKeyS,
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
            child: widget.appController.name == null
                ? Text('Escolha uma loja')
                : ScreenTypeLayout(
                    mobile: ShopViewMobile(titleSize, subtitleSize),
                    desktop: ShopViewDesktop(titleSize, subtitleSize),
                  ),
          ),
        );
      },
    );
  }
}
