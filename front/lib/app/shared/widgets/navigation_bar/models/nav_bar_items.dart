import 'package:flutter/material.dart';

class NavBarItem extends StatelessWidget {
  final Widget title;
  final Function click;
  const NavBarItem({@required this.title, this.click});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: () => click(), child: title);
  }
}
