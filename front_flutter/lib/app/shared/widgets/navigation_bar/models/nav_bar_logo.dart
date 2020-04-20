import 'package:flutter/material.dart';

class NavBarLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.06,
      image: AssetImage('assets/logo.png'),
    );
  }
}
