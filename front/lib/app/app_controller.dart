import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  _AppControllerBase() {
    scaffoldKeyH = GlobalKey<ScaffoldState>();
    scaffoldKeyS = GlobalKey<ScaffoldState>();
  }
  GlobalKey<ScaffoldState> scaffoldKeyH;

  void open() {
    scaffoldKeyH.currentState.openDrawer();
  }

  GlobalKey<ScaffoldState> scaffoldKeyS;

  void openS() {
    scaffoldKeyS.currentState.openDrawer();
  }

  GlobalKey<ScaffoldState> scaffoldKeyI = GlobalKey<ScaffoldState>();

  void openI() {
    scaffoldKeyI.currentState.openDrawer();
  }

  @observable
  String id = ' ';

  @observable
  String name = ' ';

  @action
  updateData(String newId, String newName) {
    id = newId;

    name = newName;

    Modular.to.pushNamed('/loja/$id');
    print(id);
    print(newName);
  }
}
