import 'package:flutter/material.dart';
import 'package:good_hack/app/shared/widgets/navigation_bar/models/nav_bar_items.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const DrawerItem(this.title, this.icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, top: 50, right: 100),
      child: MaterialButton(
        onPressed: () {},
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              size: 30.0,
            ),
            SizedBox(
              width: 15.0,
            ),
            NavBarItem(title)
          ],
        ),
      ),
    );
  }
}