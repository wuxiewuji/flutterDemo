import 'package:flutter/material.dart';
import 'package:flutter_learning_demo/demo/studywidget/template.dart';


class CardDemo extends IWidgetLess {
  static const String routeName = '/card';
  final String title = 'Card 包裹容器';

  @override
  Widget child() {
    return new Demoless(
      title:title,
      children: <Widget>[
        //卡片
        new Card(
          //卡片材料的颜色
          color: Colors.blue,
          //阴影高度
          elevation:8.0 ,
          child: new Container(
            height: 200.0,
            child: new Image.asset(
              'top_10_australian_beaches.jpg',
              package: 'flutter_gallery_assets',
              fit: BoxFit.cover,
            ),
          ),
        ),
        //卡片,官方的例子
        new Card(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: const Icon(Icons.album),
                title: const Text('The Enchanted Nightingale'),
                subtitle: const Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
              ),
              new ButtonTheme.bar( // make buttons use the appropriate styles for cards
                child: new ButtonBar(
                  children: <Widget>[
                    new FlatButton(
                      child: const Text('BUY TICKETS'),
                      onPressed: () { /* ... */ },
                    ),
                    new FlatButton(
                      child: const Text('LISTEN'),
                      onPressed: () { /* ... */ },
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}