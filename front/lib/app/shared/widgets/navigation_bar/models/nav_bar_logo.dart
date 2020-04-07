import 'package:flutter/material.dart';

class NavBarLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      alignment: Alignment.center,
      height: 600,
      image: AssetImage('assets/logo.png'),
    );
  }
}
