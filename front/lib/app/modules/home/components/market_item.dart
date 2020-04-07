import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:good_hack/app/app_controller.dart';

class MarketItemDesktop extends StatelessWidget {
  final double descriptionSize;
  final double subtitleSize;
  final String title;
  final String body;
  final String id;

  const MarketItemDesktop(this.descriptionSize, this.subtitleSize,
      {this.title, this.body, this.id});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Image.network(
            'https://www.ajactraining.org/wp-content/uploads/2019/09/image-placeholder.jpg',
            alignment: Alignment.center,
            height: 125,
          ),
        ),
        SizedBox(width: 30.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SelectableText(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                height: 1.1,
                fontSize: subtitleSize,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: SelectableText(
                '''$body''',
                maxLines: null,
                style: TextStyle(
                  height: 1.2,
                  fontSize: descriptionSize,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 30.0),
        RaisedButton(
          child: Text(
            'Ir para loja',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              height: 1.2,
              fontSize: descriptionSize,
            ),
          ),
          color: Color.fromARGB(255, 255, 182, 72),
          onPressed: () {
            Modular.get<AppController>().updateData(id, title);
          },
        )
      ],
    );
  }
}

class MarketItemMobile extends StatelessWidget {
  final double descriptionSize;
  final double subtitleSize;
  final String title;
  final String body;
  final String id;

  const MarketItemMobile(this.descriptionSize, this.subtitleSize,
      {this.title, this.body, this.id});

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
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    height: 1.1,
                    fontSize: subtitleSize,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: SelectableText(
                    '''$body''',
                    maxLines: null,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      height: 1.3,
                      fontSize: descriptionSize,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 15),
        RaisedButton(
          color: Color.fromARGB(255, 255, 182, 72),
          child: Text(
            'Ir para loja',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              height: 1.0,
              fontSize: descriptionSize,
            ),
          ),
          onPressed: () {
            Modular.get<AppController>().updateData(id, title);
          },
        )
      ],
    );
  }
}
