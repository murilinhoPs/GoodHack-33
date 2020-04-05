import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> scaffoldKeyS = GlobalKey<ScaffoldState>();

  @action
  void open() {
    scaffoldKey.currentState.openDrawer();
  }

  @action
  void openS() {
    scaffoldKeyS.currentState.openDrawer();
  }
}
