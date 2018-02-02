//CheckBox学习


import 'package:flutter/material.dart';
import 'package:flutter_learning_demo/demo/studywidget/template.dart';


class CheckBoxDemo extends StatefulWidget {
  static const String routeName = '/checkbox';
  final String title = 'CheckBox 控件';

  @override
  State<StatefulWidget> createState() => new _CheckBoxDemo();
}

class _CheckBoxDemo extends State<CheckBoxDemo> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  bool b;


  @override
  void initState() {
    super.initState();
    b = false;
  }

  void _isChecked(bool c) {
    b = c;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _formKey,
        appBar: new AppBar(
          title: new Text(widget.title),
          primary: true,
        ),
        body: new Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 24.0, 24.0, 16.0),
            child: new ListView(
              children:
              <Widget>[
                //Checkbox
                new Checkbox(
                  value: b,
                  //点击事件
                  onChanged: (bool c) {
                    _isChecked(c);
                  },
                  activeColor: Colors.grey, //被选中框的颜色
                ),
                //这是系统封装好的Checkbox和平面控件ListTile的集合
                new CheckboxListTile(
                  //主标题
                  title: new Text('nihao a '),
                  value: b,
                  //点击事件
                  onChanged: (bool c) {
                    _isChecked(c);
                  },
                  //相对于平铺控件,checkbox和secondary控件的位置,左边还是右边
                  //该空间相对于文本放置在何处
                  controlAffinity: ListTileControlAffinity.leading,

                  //文本时候密集型排布
                  dense: false,

                  //第二个其他控件,一搬是一个Icon
                  secondary: new Icon(Icons.map),
                  //当选中的时候是否选软图标和文本(渲染成activeColor的颜色)
                  selected: true,

                  activeColor: Colors.red,

                  isThreeLine: true,
                  /**
                   * assert(!isThreeLine || subtitle != null),
                   * 当isThreeLine=true的时候subtitle != null
                   */
                  subtitle: new Text(
                      'nihao a '), //第二主题文字,一般在主题下面,,当isThreeLine不为空的时候此处标题必须不为空
                ),
              ],
            ))
    );
  }
}