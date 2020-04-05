import 'package:flutter/material.dart';

class NavDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Color.fromARGB(255, 31, 146, 229),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Nome do produto',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),
          ),
          SizedBox(height: 20),
          Container(
            height: 35,
            width: 50,
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.pink,
              hoverColor: Colors.black,
              onTap: () {},
              child: Text(
                'TESTE',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
