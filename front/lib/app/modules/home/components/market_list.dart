import 'package:flutter/material.dart';
import 'package:good_hack/app/modules/home/components/market_item.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Markets extends StatelessWidget {
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
                height: 0.9,
                fontSize: titleSize,
              ),
              textAlign: textAlignment,
            ),
            SizedBox(height: 30),
            ScreenTypeLayout(
              desktop: MarketItemDesktop(descriptionSize, subtitleSize),
              mobile: MarketItemMobile(descriptionSize, subtitleSize),
            ),
          ],
        ),
      );
    });
  }
}
