import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final Widget iconWidget;
  final Function click;

  const DrawerItem(
      {@required this.title, @required this.iconWidget, this.click});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, top: 50, right: 100),
      child: MaterialButton(
        onPressed: () => click(),
        child: Row(
          children: <Widget>[
            iconWidget,
            SizedBox(
              width: 15.0,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
