import 'package:flutter/material.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final Function click;
  const NavBarItem({@required this.title, this.click});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => click(),
      child: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
