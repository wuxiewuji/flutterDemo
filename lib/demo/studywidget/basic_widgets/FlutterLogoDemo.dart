//Flutter Logo 演示


import 'package:flutter/material.dart';
import 'package:flutterDemo/demo/studywidget/template.dart';

class FlutterLogoDemo extends IWidgetLess {
  static const String routeName = '/flutterlogo';
  final String title = 'FlutterLogo 包裹控件';

  @override
  Widget child() {
    return new Demoless(
      title: title,
      children: <Widget>[
        new IconButton(
          icon:
          //Flutter 图标,不可单独使用,只能为其他图标视图提供图标Widget视图用
          new FlutterLogo(
            //动画的时长,如果属性被更改这个有用
            duration: const Duration(seconds: 2000),
            //图标的大小
            size: 54.0,
            /**
             * 显示方式
             * markOnly:默认显示
             * horizontal:图标和文字水平显示
             * stacked:重叠文字显示在图标的下方
             */
            style: FlutterLogoStyle.stacked,
            //Flutter绘制文本的颜色
            textColor: const Color(0xFF333333),
            //绘制Log的颜色
            colors: Colors.blue,
            //动画曲线风格
            curve: Curves.fastOutSlowIn,
          ),
          //点击显示的提示文字
          tooltip: 'Open FlutterLogo ',
          onPressed: () {
            print("点击了IconButton");
          },
        ),

      ],
    );
  }
}