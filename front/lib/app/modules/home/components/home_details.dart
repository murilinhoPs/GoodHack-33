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
              'Retire Fácil',
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
              '''Plataforma onde o cliente conseguirá criar uma lista de compras, e esta será enviada para o comerciante, que fará a separação e reserva dos produtos.
Assim, o cliente apenas precisará ir ao estabelecimento para retirar suas compras, evitando filas, diminuindo seu tempo de exposição e evitando aglomerações''',
              style: TextStyle(
                fontSize: descriptionSize,
                height: 1.7,
              ),
              textAlign: textAlignment,
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      );
    });
  }
}
