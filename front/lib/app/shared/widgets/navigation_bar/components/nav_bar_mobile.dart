import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:good_hack/app/modules/home/home_controller.dart';
import 'package:good_hack/app/modules/home/home_page.dart';
import 'package:good_hack/app/shared/widgets/navigation_bar/models/nav_bar_logo.dart';

class NavBarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 35,
            width: 30,
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Color.fromARGB(245, 31, 219, 80),
              borderRadius: BorderRadius.circular(5),
              child: Icon(
                Icons.menu,
                size: 30.0,
              ),
              onTap: () {
                Modular.get<HomeController>().open();
              },
            ),
          ),
          NavBarLogo(),
        ],
      ),
    );
  }
}
