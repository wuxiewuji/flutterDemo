//Icon教程


import 'package:flutter/material.dart';
import 'package:flutter_learning_demo/demo/studywidget/template.dart';


class IconDemo extends IWidgetLess {
  static const String routeName = '/icon';
  final String title = 'IconDemo 控件';

  @override
  Widget child() {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
          primary: true,
        ),
        body: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Icon(
              Icons.face,
              color: Colors.blue,
              size: 24.0,
              textDirection: TextDirection.ltr,
              semanticLabel: '这是一张小脸', //当前图标的语意,在UI中不显示
            ),
            const Icon(
              Icons.keyboard_backspace,
              color: Colors.green,
              size: 24.0,
              textDirection: TextDirection.ltr,
              semanticLabel: '这是一张中脸', //当前图标的语意,在UI中不显示
            ),
            const Icon(
              //自带的图标字体库中的文件
              Icons.keyboard_backspace,
              //图标的颜色
              color: Colors.red,
              //图标的大小
              size: 36.0,
              //图标字体库的方向,如返回箭头可以颠倒哦,但是不是所有都可以颠倒
              textDirection: TextDirection.rtl,
              //图标的标签说明
              semanticLabel: '这是一张大脸', //当前图标的语意,在UI中不显示
            ),
            const Icon(
              //自带的图标字体库中的文件
              Icons.landscape,
              //图标的颜色
              color: Colors.red,
              //图标的大小
              size: 36.0,
              //图标字体库的方向,如返回箭头可以颠倒哦
              textDirection: TextDirection.rtl,
              //图标的标签说明
              semanticLabel: '这是一张大脸', //当前图标的语意,在UI中不显示
            ),
            const Icon(
              //自带的图标字体库中的文件
              Icons.landscape,
              //图标的颜色
              color: Colors.red,
              //图标的大小
              size: 36.0,
              //图标字体库的方向,如返回箭头可以颠倒哦,其他的不能颠倒
              textDirection: TextDirection.ltr,
              //图标的标签说明
              semanticLabel: '这是一张大脸', //当前图标的语意,在UI中不显示
            ),
            const Icon(
              //自带的图标字体库中的文件
              Icons.label_outline,
              //图标的颜色
              color: Colors.red,
              //图标的大小
              size: 36.0,
              //图标字体库的方向,如返回箭头可以颠倒哦
              textDirection: TextDirection.rtl,
              //图标的标签说明
              semanticLabel: '这是一张大脸', //当前图标的语意,在UI中不显示
            ),
            const Icon(
              //自带的图标字体库中的文件
              Icons.label_outline,
              //图标的颜色
              color: Colors.red,
              //图标的大小
              size: 36.0,
              //图标字体库的方向,如返回箭头可以颠倒哦,其他的不能颠倒
              textDirection: TextDirection.ltr,
              //图标的标签说明
              semanticLabel: '这是一张大脸', //当前图标的语意,在UI中不显示
            ),
          ],
        )
    );
  }
}