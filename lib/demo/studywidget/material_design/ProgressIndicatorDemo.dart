import 'package:flutter/material.dart';
import 'package:flutter_learning_demo/demo/studywidget/template.dart';

///进度条指示器学习
class ProgressIndicatorDemo extends IWidgetLess {
  static const String routeName = '/progress';
  final String title = 'ProgressIndicator 进度条指示器';

  @override
  Widget child() {
    // TODO: implement child
    return new Demoless(
        title: "文本控件",
        children: <Widget>[

          const LinearProgressIndicator(),

          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const CircularProgressIndicator(),

              new SizedBox(
                  width: 20.0,
                  height: 20.0,
                  child: new CircularProgressIndicator()
              ),
            ],
          ),
        ]
    );
  }
}
