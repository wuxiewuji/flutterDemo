import 'package:flutter/material.dart';
import 'package:flutterDemo/demo/studywidget/template.dart';



class PlaceholderDemo extends IWidgetLess {
  static const String routeName = '/placeholder';
  final String title = 'placeholder 包裹控件';

  @override
  Widget child() {
    return new Demoless(

      title: title,
      children: <Widget>[
    /**
     * 本控件为替代的空白控件意义为,告知我们以这里还没有做完,等以后继续来做这里,(其他的控件的百合子替代产品)
     */
        new Placeholder(
          //绘制边界线的颜色
          color: Colors.red,
          //当占位符处于无边界状态时使用的高度。
          fallbackHeight: 300.0,
          //当占位符处于无边界状态时使用的宽度
          fallbackWidth: 10.0,
          //边界线的宽度
          strokeWidth: 10.0,
        ),

      ],
    );
  }
}