import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:good_hack/app/modules/home/components/market_item.dart';
import 'package:good_hack/app/modules/home/home_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Markets extends StatelessWidget {
  //final controller = Modular.get<HomeController>();

  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, size) {
      var textAlignment = size.isDesktop ? TextAlign.left : TextAlign.center;

      double titleSize = size.isMobile ? 32 : 52;

      double subtitleSize = size.isMobile ? 22 : 32;

      double descriptionSize = size.isMobile ? 16 : 20;

      return Container(
        width: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Lojas: ',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                height: 1.2,
                fontSize: titleSize,
              ),
              textAlign: textAlignment,
            ),
            SizedBox(height: 30),
            // Observer(
            //   builder: (_) {
            //     if (controller.markets == null) {
            //       return CircularProgressIndicator();
            //     }
            //     if (controller.markets.isNotEmpty) {
            //       final list = controller.markets;
            //       return ScreenTypeLayout(
            //         desktop: ListView.builder(
            //           shrinkWrap: true,
            //           itemBuilder: (context, index) => MarketItemDesktop(
            //             descriptionSize,
            //             subtitleSize,
            //             title: list[index].title,
            //             body: list[index].body,
            //           ),
            //         ),
            //         mobile: ListView.builder(
            //           shrinkWrap: true,
            //           itemBuilder: (context, index) => MarketItemMobile(
            //             descriptionSize,
            //             subtitleSize,
            //             title: list[index].title,
            //             body: list[index].body,
            //           ),
            //         ),
            //       );
            //     } else
            //       return Text('Nenhum dado....');
            //   },
            // ),
          ],
        ),
      );
    });
  }
}
