//SwitchDemo学习


import 'package:flutter/material.dart';


class SwitchDemo extends StatefulWidget {
  static const String routeName = '/switch';
  final String title = 'Switch选择 控件';


  @override
  _SwitchDemo createState() => new _SwitchDemo();
}


class _SwitchDemo extends State<SwitchDemo> {
  bool isSwitch1;
  bool isSwitch2;


  @override
  void initState() {
    super.initState();
    isSwitch1 = false;
    isSwitch2 = false;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(''),
          primary: true,
        ),
        body: new Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 24.0, 24.0, 16.0),
            child: new Center(
              child: new ListView(
                children: <Widget>[

                  //Switch
                  new Switch(
                    //点击事件
                    onChanged: (bool newValue) {
                      print(newValue);
                      setState(() {
                        isSwitch1 = newValue;
                      });
                    },
                    //是否开启
                    value: isSwitch1,
//                  activeColor: ,//被选中的颜色
                    //当关闭时，滑动头的图片
                    inactiveThumbImage: new AssetImage('packages/flutter_gallery_assets/pesto/image10.jpg'),
                    //当开启时，滑动头的图片
                    activeThumbImage: new ExactAssetImage('packages/flutter_gallery_assets/pesto/image11.jpg'),
                    //开关开启时时候轨道上的颜色
                    activeTrackColor: Colors.grey,
                    //开关关闭时时候轨道上的颜色
                    inactiveTrackColor:Colors.blue[100],
                    //关闭时拇指上的颜色
                    inactiveThumbColor :Colors.red,
                  ),

                  //Switch 和ListTile合并
                  new SwitchListTile(
                    onChanged: (bool newValue) {
                      print(newValue);
                      setState(() {
                        isSwitch2 = newValue;
                      });
                    },
                    value: isSwitch2,
//                    activeColor:,
//                    activeThumbImage:,
//                    inactiveThumbImage:,

                    //文本时候密集型排布
                    dense: false,
                    //第二个其他控件,一搬是一个Icon
                    secondary: new Icon(Icons.map),
                    //当选中的时候是否选软图标和文本(渲染成activeColor的颜色)
                    selected: true,
                    //主标题
                    title: new Text('select SwitchListTile '),
                    isThreeLine: true,//是否显示三行
                    /**
                     * assert(!isThreeLine || subtitle != null),
                     * 当isThreeLine=true的时候subtitle != null
                     */
                    subtitle: new Text(
                        'nihao a '), //第二主题文字,一般在主题下面,,当isThreeLine不为空的时候此处标题必须不为空
                  ),
                ],
              ),
            )
        )
    );
  }
}