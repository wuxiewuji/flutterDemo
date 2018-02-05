import 'package:flutter/material.dart';
import 'package:flutterDemo/demo/studywidget/template.dart';


///长按文本标签提示符,仅用于在文本中显示,长按后由提示标签的布局


class TooltipDemo extends IWidgetLess {
  static const String routeName = '/tooltip';
  final String title = '文本提示标签';

  @override
  Widget child() {
    return new Demoless(
      title: title,
      children: <Widget>[
        new Row(
            children: <Widget>[
              new Text('长按'),
              //案例一
              new Tooltip(
                  message: 'call icon',
                  child: new Icon(
                    Icons.call,
                    size: 18.0,
                    color: Colors.blue,
                    semanticLabel: '这是个语意标签在UI中没有显示',
                    //显示方向
                    textDirection: TextDirection.ltr,
                  )
              ),
              new Text('图标,会显示提示文本,',),
              //案例二,全解
              new Tooltip(
                  child: new Text('点击我,我给你提示',style: new TextStyle(
                      color: Colors.red
                  )),
                  height: 24.0,
                  padding: const EdgeInsets.all(2.0),
                  //提示问本默认显示在问本的下方
                  preferBelow: true,
                  //小部件与显示的工具提示之间的垂直距离
                  verticalOffset: 2.0,
                  message: '我就是提示语')
            ]),

      ],
    );
  }
}