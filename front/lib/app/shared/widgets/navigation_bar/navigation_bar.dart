import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'components/nav_bar_desktop.dart';
import 'components/nav_bar_mobile.dart';

class NavigationBar extends StatelessWidget {
  final String route;

  NavigationBar(this.route);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavBarMobile(),
      tablet: NavBarDesktop(route),
    );
  }
}
