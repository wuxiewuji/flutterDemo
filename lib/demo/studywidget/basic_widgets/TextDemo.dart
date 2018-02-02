//文本案例


import 'package:flutter/material.dart';
import 'package:flutter_learning_demo/demo/studywidget/template.dart';

///后期补充控件DefaultTextStyle-为子类树创建一个默认的文本样式子类就沿用他的样式

class TextDemo extends IWidgetLess  {
  static const String routeName = '/text';
  @override
  Widget child() {
    // TODO: implement child
    return new Demoless(
      title: "文本控件",
      children: <Widget>[
        //    * textDirection,:文字的方向
        /**属性介绍
         * textDirection:文字的方向
         *      TextDirection.ltr,:left to right
         *      TextDirection.rtl,:right to left
         * textAlign, ：水平对齐样式
         * softWrap,:如果false则文默认有无限的水平控件,不换行,如果为true则文本到达末尾换行
         * overflow,:溢出控件的文本显示颜色   menu类
         * textScaleFactor :像素字体的大小
         * maxLines,:最大显示行数
         * textDirection :text控件方向的描述 是一个枚举类enum
         * style,:显示的风格--文字颜色、大小、字体样式。。。。。。。
         */
        new Text(
          '红色+黑色删除线+25号',
          textAlign: TextAlign.right,
          /**TextStyle
           * inherit: ,//默认值为假
           * color,文字的颜色
           * fontSize,:daxiao
           * fontWeight,:字体的粗细
           *    FontWeight.bold
           *    FontWeight.w100
           *    ......
           * fontStyle,
           *    FontStyle.italic,斜体
           *    FontStyle.normal,正常字体
           * letterSpacing: 2.0,//字间距 字间隔空
           * wordSpacing,//
           * textBaseline,//对齐文本的水平线
           * height,:Text的行高,跟字体的大小有关
           * decoration,:文本的装饰.中间,上方,下方...划线--划线的位置
           * decorationColor,//装饰线的颜色
           * decorationStyle,:装饰线的样式
           *    TextDecorationStyle.dashed
           * debugLabel,:在调试版本中使用的标签
           */
          style: new TextStyle(
              color: const Color(0xffff0000),
              //划线的位置,在每行文本中画一条线
              decoration: TextDecoration.lineThrough,

              decorationColor: const Color(0xff000000),
              //划线的颜色
              fontSize: 25.0,
              inherit: false,
              textBaseline: TextBaseline.ideographic,
              height: 1.0
          ),
        ),
        new Text(
          '橙色+下划线+24号',
          style: new TextStyle(
            color: const Color(0xffff9900),
            decoration: TextDecoration.underline, //下方
            fontSize: 24.0,
          ),
        ),
        new Text(
          '虚线上划线+23号+倾斜',
          style: new TextStyle(
            decoration: TextDecoration.overline, //上方
            decorationStyle: TextDecorationStyle.dashed, //划线的样式,此处为虚线
            fontSize: 23.0,
            fontStyle: FontStyle.italic, //字体的样式,斜体
          ),
        ),
        new Text(
          'serif字体+24号',
          style: new TextStyle(
            fontFamily: '号',
            fontSize: 26.0, //字体的大小
          ),
        ),
        new Text(
          'monospace字体+24号+加粗',
          style: new TextStyle(
            fontFamily: 'monospace',
            fontSize: 24.0,
            fontWeight: FontWeight.bold, //字体的粗细
          ),
        ),
        new Text(
          '天蓝色+25号+2行跨度',
          style: new TextStyle(
            color: const Color(0xff4a86e8),
            fontSize: 25.0,
            height: 2.0, //跨度
          ),
        ),
        new Text(
          '24号+2个字母间隔',
          style: new TextStyle(
            fontSize: 24.0,
            letterSpacing: 2.0, //间距
          ),
        ),
      ],
    );
  }
}