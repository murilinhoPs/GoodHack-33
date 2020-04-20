import 'package:flutter/material.dart';

class CenteredView extends StatelessWidget {
  final Widget child;
  final EdgeInsets newPadding;
  const CenteredView({Key key, this.child, this.newPadding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: newPadding,
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1600),
        child: child,
      ),
    );
  }
}
