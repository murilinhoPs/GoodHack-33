import 'package:flutter/material.dart';

class MarketItemDesktop extends StatelessWidget {
  final double descriptionSize;
  final double subtitleSize;

  const MarketItemDesktop(this.descriptionSize, this.subtitleSize);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: Image.network(
            'https://www.ajactraining.org/wp-content/uploads/2019/09/image-placeholder.jpg',
            alignment: Alignment.center,
            height: 125,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SelectableText(
              'Nome da Loja',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                height: 0.9,
                fontSize: subtitleSize,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SelectableText(
              'Categoria: ',
              style: TextStyle(
                height: 1.5,
                fontSize: descriptionSize,
              ),
            ),
            SelectableText(
              'Endereço: ',
              style: TextStyle(
                // height: 1.0,
                fontSize: descriptionSize,
              ),
            ),
            SelectableText(
              'Horário de funcionamento: ',
              style: TextStyle(
                height: 1.5,
                fontSize: descriptionSize,
              ),
            ),
            SelectableText(
              'Formas de pagamento: ',
              style: TextStyle(
                height: 1.5,
                fontSize: descriptionSize,
              ),
            ),
          ],
        ),
        RaisedButton(
          child: Text(
            'Ir para loja',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              height: 1.0,
              fontSize: descriptionSize,
            ),
          ),
          onPressed: () {},
        )
      ],
    );
  }
}

class MarketItemMobile extends StatelessWidget {
  final double descriptionSize;
  final double subtitleSize;

  const MarketItemMobile(this.descriptionSize, this.subtitleSize);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Image.network(
                'https://www.ajactraining.org/wp-content/uploads/2019/09/image-placeholder.jpg',
                alignment: Alignment.center,
                height: 125,
              ),
            ),
            Column(
              children: <Widget>[
                SelectableText(
                  'Nome da Loja',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    height: 0.9,
                    fontSize: subtitleSize,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SelectableText(
                  'Categoria: ',
                  style: TextStyle(
                    height: 1.0,
                    fontSize: descriptionSize,
                  ),
                ),
                SelectableText(
                  'Endereço: ',
                  style: TextStyle(
                    height: 1.0,
                    fontSize: descriptionSize,
                  ),
                ),
                SelectableText(
                  'Horário de funcionamento: ',
                  style: TextStyle(
                    height: 1.0,
                    fontSize: descriptionSize,
                  ),
                ),
                SelectableText(
                  'Formas de pagamento: ',
                  style: TextStyle(
                    height: 1.2,
                    fontSize: descriptionSize,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 15),
        RaisedButton(
          child: Text(
            'Ir para loja',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              height: 1.0,
              fontSize: descriptionSize,
            ),
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
