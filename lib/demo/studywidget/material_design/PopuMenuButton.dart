////


import 'package:flutter/material.dart';


class PopupMenuButtonDemo extends StatefulWidget {
  static const String routeName = '/popup_menu_btton';
  final String title = 'PopupMenu 菜单控件';

  @override
  State<StatefulWidget> createState() {
    return new _MenusDemoState();
  }
}

class _MenusDemoState extends State<PopupMenuButtonDemo> {
  String _bodyStr = '显示菜单的点击';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(" 菜单演示"),
        actions: <Widget>[
          //右边的菜单图标,
          new PopupMenuButton(
//            initialValue: ,
              tooltip: '你点击了菜单',
              //点击菜单弹出框的提示文字
              elevation: 8.0,
              //z轴高度
              padding: new EdgeInsets.all(8.0),
//              child: new Text('你好'),
              //child与icon只能有一个
//              icon:new Icon(Icons.menu),//菜单的图标,默认不写的话是三个竖点

          /**
           * 选中Item菜单的回调事件
           *  参数类型与下面的菜单item类型值必须一样
           */
              onSelected: (String value) {
                setState(() {
                  _bodyStr = value;
                });
              },
              //弹框控件弹出的内容
              itemBuilder: (BuildContext context) =>
              //类型值必须一样(eg:<String>)
              <PopupMenuItem<String>>[
                new PopupMenuItem(
                  value: '选项一的值',
                  child: new Text('选项一'),
                  enabled: true, //是否允许用户选择此项
                  height: 48.0, //高度默认值为48.0
                ),
                new PopupMenuItem(
                    value: '选项二的值',
                    child: new Text('选项二')),
              ]
          )
        ],
      ),
      body: new Center(
        child: new Text(_bodyStr),
      ),
    );
  }
}