import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:good_hack/app/modules/home/components/market_item.dart';
import 'package:good_hack/app/shared/models/markets_model.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../home_controller.dart';

class Markets extends StatefulWidget {
  @override
  _MarketsState createState() => _MarketsState();
}

class _MarketsState extends ModularState<Markets, HomeController> {
  @override
  void initState() {
    controller.fetchMarkets();
    super.initState();
  }

  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, size) {
      var textAlignment = size.isDesktop ? TextAlign.left : TextAlign.center;

      double titleSize = size.isMobile ? 32 : 42;

      double subtitleSize = size.isMobile ? 22 : 32;

      double descriptionSize = size.isMobile ? 14 : 20;

      return Container(
        //width: 700,
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
            Observer(
              builder: (_) {
                if (controller.markets.length == 0) {
                  return CircularProgressIndicator();
                }
                if (controller.markets.isNotEmpty) {
                  final list = controller.markets;
                  print(list.length);
                  return ScreenTypeLayout(
                    desktop: _dekstopList(
                        context, descriptionSize, subtitleSize, list),
                    mobile: _mobileList(
                        context, descriptionSize, subtitleSize, list),
                    tablet: _tabletList(
                        context, descriptionSize, subtitleSize, list),
                  );
                } else
                  return Text('Nenhum dado....');
              },
            ),
          ],
        ),
      );
    });
  }

  Widget _mobileList(
      context, descriptionSize, subtitleSize, List<MarketModel> list) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(top: 30.0, bottom: 15.0),
        child: MarketItemMobile(
          descriptionSize,
          subtitleSize,
          title: list[index].nome,
          body: '''
Categoria: ${list[index].categoria}
${list[index].endereco.rua}, número ${list[index].endereco.numero}
Horário: ${list[index].horarioFuncionamento}
Formas de pagamento: 
${list[index].formasDePagamento}''',
          id: list[index].sId,
        ),
      ),
    );
  }

  Widget _tabletList(
      context, descriptionSize, subtitleSize, List<MarketModel> list) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(top: 30.0, bottom: 15.0),
        child: MarketItemMobile(
          descriptionSize,
          subtitleSize,
          title: list[index].nome,
          body: '''
Categoria: ${list[index].categoria}
Endereço: ${list[index].endereco.rua}, número: ${list[index].endereco.numero}
Horário de funcionamento: ${list[index].horarioFuncionamento}
Formas de pagamento: ${list[index].formasDePagamento}''',
          id: list[index].sId,
        ),
      ),
    );
  }

  Widget _dekstopList(
      context, descriptionSize, subtitleSize, List<MarketModel> list) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(top: 30.0, bottom: 15.0),
        child: MarketItemDesktop(
          descriptionSize,
          subtitleSize,
          title: list[index].nome,
          body: '''
Categoria: ${list[index].categoria}
Endereço: ${list[index].endereco.rua}, número: ${list[index].endereco.numero}
Horário de funcionamento: ${list[index].horarioFuncionamento}
Formas de pagamento: ${list[index].formasDePagamento}''',
          id: list[index].sId,
        ),
      ),
    );
  }
}
