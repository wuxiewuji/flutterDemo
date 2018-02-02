//Scaffold包裹布局,内部自带AppBar,NavigationBar,抽屉布局,背景颜色.


import 'package:flutter/material.dart';


class ScaffoldDemo extends StatelessWidget {
  static const String routeName = '/scaffold';
  final String title = 'Scaffold 包裹控件';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
        primary: true,
      ),
      backgroundColor: Colors.white,
      //左边的抽屉
      drawer: new Text('我是左边的抽屉,我现在只是一个简单的Text布局'),
      //右边的抽屉
      endDrawer: new Text('我是右边的边的抽屉,我现在只是一个简单的Text布局'),

      body: new Text('包裹的子类布局'),
      //悬浮FloatingActionBar
      floatingActionButton:
      new FloatingActionButton(onPressed: null, child: new Icon(Icons.add),),
      //布局是否显示在屏幕的顶部,默认为true(状态栏)
      primary: true,
      bottomNavigationBar: new Text('我是底部NavigationBar'),
      //底部的一组导航栏,在bottomNavigationBar上面,在body向下面
      persistentFooterButtons: <Widget>[
        new FlatButton(
          onPressed: null,
          child: new Text('1234'),
          color: Colors.red,
        ),
        new FlatButton(
          onPressed: null,
          child: new Text('5678'),
        ),
      ],
      // 防止弹起的键盘遮挡小部件,及小部件键盘挤压重叠 默认为true
      resizeToAvoidBottomPadding: true,
    );
  }
}