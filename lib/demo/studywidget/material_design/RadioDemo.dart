//RadioDemo学习


import 'package:flutter/material.dart';


class RadioDemo extends StatefulWidget {
  static const String routeName = '/radio';
  final String title = 'Radio选中 控件';


  @override
  _RadioDemo createState() => new _RadioDemo();
}


class _RadioDemo extends State<RadioDemo> {
  String _character1 = "";
  String _character2 = "";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(''),
          primary: true,
        ),
        body: new Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 24.0, 24.0, 16.0),
          child: new ListView(
            children: <Widget>[
              new Radio<String>(
                //点击事件
                onChanged: (String a) {
                  print(a);
                  setState(() {
                    _character1 = a;
                  });
                },
                  //这个单选按钮表示的值
                value: "啊打发",
                //这组单选按钮的值,如果这个值跟value值一样者这个按钮控件被选中,备选中就不能取消了
                groupValue: _character1,
                activeColor: Colors.red,//被选中的颜色
              ),
              //与上面的几乎一样Radio和ListTile合并的控件单选和扁平化控件合并
              new RadioListTile(

                groupValue: _character2,
                value: "啊打发",
                onChanged: (String a) {
                  print(a);
                  setState(() {
                    _character2 = a;
                  });
                },
                activeColor: Colors.red,//被选中的颜色


                //相对于平铺控件,checkbox和secondary控件的位置,左边还是右边
                //该空间相对于文本放置在何处
                controlAffinity: ListTileControlAffinity.leading,

                //文本时候密集型排布
                dense: false,

                //第二个其他控件,一搬是一个Icon
                secondary: new Icon(Icons.map),
                //当选中的时候是否选软图标和文本(渲染成activeColor的颜色)
                selected: true,

                //主标题
                title: new Text('select Radio '),
                isThreeLine: true,//是否显示三行
                /**
                 * assert(!isThreeLine || subtitle != null),
                 * 当isThreeLine=true的时候subtitle != null
                 */
                subtitle: new Text(
                    'nihao a '), //第二主题文字,一般在主题下面,,当isThreeLine不为空的时候此处标题必须不为空
              )
            ],
          ),
        )
    );
  }
}