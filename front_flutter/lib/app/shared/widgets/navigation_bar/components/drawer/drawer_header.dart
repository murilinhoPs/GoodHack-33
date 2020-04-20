import 'package:flutter/material.dart';
import 'package:front_flutter/app/shared/widgets/navigation_bar/models/nav_bar_logo.dart';

class NavDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Color.fromARGB(200, 255, 182, 72),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Retire Fácil',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w800, color: Colors.black),
          ),
          SizedBox(height: 20),
          Container(
            height: 50,
            child: NavBarLogo(),
          )
        ],
      ),
    );
  }
}
