import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeDetails extends StatelessWidget {
  const HomeDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, size) {
      var textAlignment = size.isDesktop ? TextAlign.left : TextAlign.center;

      double titleSize = size.isMobile ? 50 : 80;

      double descriptionSize = size.isMobile ? 18 : 21;

      return Container(
        width: 800,
        height: MediaQuery.of(context).size.height / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Nome do\nNosso Projeto',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                height: 1.1,
                fontSize: titleSize,
              ),
              textAlign: textAlignment,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Descricao sobre o nosso projeto e para o que ele serve. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              style: TextStyle(
                fontSize: descriptionSize,
                height: 1.7,
              ),
              textAlign: textAlignment,
            ),
          ],
        ),
      );
    });
  }
}
