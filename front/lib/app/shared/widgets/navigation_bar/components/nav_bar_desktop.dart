import 'package:flutter/material.dart';
import 'package:good_hack/app/shared/widgets/navigation_bar/models/nav_bar_items.dart';
import 'package:good_hack/app/shared/widgets/navigation_bar/models/nav_bar_logo.dart';

class NavBarDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NavBarLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NavBarItem('Início'),
              SizedBox(
                width: 15,
              ),
              NavBarItem('Sacola'),
              SizedBox(
                width: 15,
              ),
              NavBarItem('Outro'),
            ],
          )
        ],
      ),
    );
  }
}
