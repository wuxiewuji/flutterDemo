import 'package:flutter/material.dart';


class SnackBarDemo extends StatefulWidget {
  static const String routeName = '/snackbar';
  final String title = 'SnackBar 控件';

  @override
  State<StatefulWidget> createState() => new _SnackBarDemo();
}

class _SnackBarDemo extends State<SnackBarDemo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView(
        children: <Widget>[
          new Center(
            //Scaffold中要用Scaffold.of(context)--必须要重新Builder
            child: new Builder(builder: (BuildContext context) {
              return new RaisedButton(
                  child: new Text('SnackBar 第一种显示方式'),
                  onPressed: () {
                    //Scaffold.of(context)
                    Scaffold.of(context).showSnackBar(
                        new SnackBar(
                          //SnackBar文本
                            content: new Text('This is snackbar'),
                            //SnackBar控件背景颜色
                            backgroundColor: Colors.grey,
//                        animation: ,//动画看动画一讲
                            duration: const Duration(milliseconds: 2000),
                            //SnackBar显示时间
                            //设计点击的按钮
                            action: new SnackBarAction(
                              //按钮显示的名字
                                label: 'OK',
                                //按钮点击事件
                                onPressed: () {
                                  //显示SnackBar
                                  Scaffold.of(context).showSnackBar(
                                      new SnackBar(
                                          content: new Text(
                                              'You pressed snackbars action.')
                                      ));
                                }
                            ))
                    );
//                  SnackBar
                  });
            }),
          ),
          new Center(
            child: new RaisedButton(
                child: new Text('SnackBar 第二种显示方式'),
                onPressed: () {
                  //ScaffoldState.showSnackBar
                  _scaffoldKey.currentState.showSnackBar(
                      new SnackBar(
                          content: new Text('This is snackbar'),
                          action: new SnackBarAction(
                              label: 'UNDO',
                              onPressed: () {
                                //显示SnackBar
                                _scaffoldKey.currentState.showSnackBar(
                                    new SnackBar(
                                        content: new Text(
                                            'You pressed snackbars action.')
                                    ));
                              }
                          )
                      )
                  );
                }),
          ),

        ],
      ),
    );
  }
}