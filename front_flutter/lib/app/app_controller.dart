import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'shared/custom/dark_theme.dart';
import 'shared/custom/light_theme.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  GlobalKey<ScaffoldState> scaffoldKeyH = GlobalKey<ScaffoldState>();

  void open() {
    scaffoldKeyH.currentState.openDrawer();
  }

  GlobalKey<ScaffoldState> scaffoldKeyS = GlobalKey<ScaffoldState>();

  void openS() {
    scaffoldKeyS.currentState.openDrawer();
  }

  GlobalKey<ScaffoldState> scaffoldKeyI = GlobalKey<ScaffoldState>();

  void openI() {
    scaffoldKeyI.currentState.openDrawer();
  }

  @observable
  String id = '_';

  @observable
  String name = ' ';

  @action
  updateData(String newId, String newName) {
    id = newId;

    name = newName;

    print(id);
    print(name);

    Modular.to.pushNamed('/loja/$id');
  }

  @observable
  IconData icon = Icons.brightness_7; //Icons.brightness_3

  @observable
  ThemeData theme = lightTheme;

  @observable
  Color color = Colors.white;

  //controller.icon == Icons.brightness_7 ? lightTheme : darkTheme

  @action
  changeTheme() {
    print('changeTheme');

    if (icon == Icons.brightness_7) {
      //scaffoldKeyH.currentState.build(context);
      icon = Icons.brightness_3;

      theme = darkTheme;

      color = Colors.black;

      // print(icon);
      // print(theme);
      // print(color);
    } else {
      icon = Icons.brightness_7;

      theme = lightTheme;

      color = Colors.white;

      // print(icon);
      // print(theme);
      // print(color);
    }
  }
}
