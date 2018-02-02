import 'package:flutter/material.dart';


class AnimatedContainerDemo extends StatefulWidget {
  static const String routeName = '/anim_container';
  final String title = 'AnimatedContainer 动画包裹';

  @override
  State<StatefulWidget> createState() => new _AnimatedContainerState();
}

class _AnimatedContainerState extends State<AnimatedContainerDemo> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new AnimatedContainer(
        //同Container一样的属性
//          height: ,
//          width: ,
//          color: ,
//          alignment: Alignment.center,
//          padding: ,
//          decoration: ,
//          transform: ,
//          margin: ,
//          foregroundDecoration: ,

        //动画时长
        duration: const Duration(seconds: 3000),
        //动画的曲线
        curve: Curves.linear,
        //创建约束框
        constraints: new BoxConstraints.expand(width: 300.0, height: 200.0),

        child: new ListView(
          children: <Widget>[
            new RaisedButton(
              onPressed: () {
                setState(() {
                  index += 1;
                  if (index >= 13) {
                    index = 1;
                  }
                });
              },
              child: new Text('点击改变'),
            ),
            new Image.asset(
              'image$index.jpg', package: 'flutter_gallery_assets/pesto',)
          ],
        ),
      ),
    );
  }
}