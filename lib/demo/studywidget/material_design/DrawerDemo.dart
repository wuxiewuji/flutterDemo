///Drawer抽屉侧滑


import 'package:flutter/material.dart';


class DrawerDemo extends StatelessWidget {
  static const String routeName = '/drawer';
  final String title = 'Drawer 侧滑抽屉';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Text('这是一个侧滑抽屉'),
      //左边的侧滑控件
      drawer: new Drawer(
        child: new Container(
          color: Colors.white,
          width: 200.0,
          child: new ListView(
            children: <Widget>[
              new FlutterLogo(),
              new Text('左边的侧滑控件')
            ],
          ),
        ),
        elevation: 8.0, //阴影高度
      ),
      //右边的侧滑控件
      endDrawer: new Drawer(
        child: new Container(
          color: Colors.white,
          width: 200.0,
          child: new ListView(
            children: <Widget>[
              new FlutterLogo(),
              new Text('左边的侧滑控件'),
              new RaisedButton(
                  child: new Text('关闭右边的Drawer'),
                  onPressed: () {
                    //关闭Drawer
                    Navigator.pop(context);
                  })
            ],
          ),
        ),
        elevation: 8.0, //阴影高度
      ),
    );
  }
}