import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterDemo/demo/studywidget/template.dart';

///Dialog
class DialogDemo extends StatefulWidget {
  static const String routeName = '/dialog';
  final String title = 'Dialog 控件';


  @override
  State<StatefulWidget> createState() {
    return new _DialogDemoState();
  }
}

class _DialogDemoState extends State<DialogDemo> {


  //显示SimpleDialog 的一种简单方式,发送带参数的路由控制Dialog的变换
  Future<Null> _askedToLead() async {
    switch (await showDialog<Department>(
      context: context,
      child: new SimpleDialog(
        title: const Text('Select assignment'),
        children: <Widget>[
          new SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, Department.treasury);
            },
            child: const Text('Treasury department'),
          ),
          new SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, Department.state);
            },
            child: const Text('State department'),
          ),
        ],
      ),
    )) {
      case Department.treasury:
        print('as');
        break;
      case Department.state:
      // ...
        break;
    }
  }

//显示AlertDialog
  Future<Null> _neverSatisfied() async {
    String msg= await showDialog<String>(
      context: context,
      barrierDismissible: false, // user must tap button!
      child: new AlertDialog(
        title: new Text('Rewind and remember'),
        content: new SingleChildScrollView(
          child: new ListBody(
            children: <Widget>[
              new Text('You will never be satisfied.'),
              new Text('You\’re like me. I’m never satisfied.'),
            ],
          ),
        ),
        actions: <Widget>[
          //水平排布的View,可以用于Dialog的底部点击View
          new ButtonBar(
            alignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new FlatButton(
                child: new Text('CANCLE'),
                onPressed: () {
                  Navigator.of(context).pop('CANCLE');
                },
              ),
              new FlatButton(
                child: new Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop('OK');
                },
              ),
            ],
          ),
        ],
      ),
    );
    //点击的Dialog按钮的返回
    if(msg!=null){
      print(msg);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new ListView(
          children: <Widget>[
            new FlatButton(
                onPressed: () {
                  _askedToLead();
                },
                child: new Text('show SimpleDialog!')),
            new SizedBox(
              height: 20.0,
            ),
            new RaisedButton(
              child: new Text('show AlertDialog'),
              onPressed: () {
                _neverSatisfied();
              },),


          ],
        )
    );
  }
}

enum Department {
  treasury,
  state
}