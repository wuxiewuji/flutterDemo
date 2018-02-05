import 'package:flutter/material.dart';
import 'package:flutterDemo/demo/studywidget/template.dart';

///ListTile --平铺控件学习
///封装结合了ListTile的控件有:CheckboxListTile, RadioListTile, and SwitchListTile

class ListTileDemo extends IWidgetLess {
  static const String routeName = '/listtile';
  final String title = 'ListTile 平铺控件';

  @override
  Widget child() {
    return new Demoless(
      title: title,
      children: <Widget>[

        new ListTile(
          //点击事件
          onTap: () {
            print('ListTile 被点击');
          },
          //长按事件
          onLongPress: () {
            print('ListTile 被长按');
          },
          //在标题之前显示的小部件
          leading: const Icon(Icons.star),
          //这个列表是否具有交互性
          enabled: true,
          //在标题后显示的小部件。通常一个(图标)小部件
          trailing: const Icon(Icons.title),
          //文本时候密集型排布
          dense: false,
          //图标和文字是否以相同颜色呈现
          selected: true,
          //主标题
          title: new Text('select Radio '),
          isThreeLine: true,
          //是否显示三行,三行就必须要有副标题
          /**
           * assert(!isThreeLine || subtitle != null),
           * 当isThreeLine=true的时候subtitle != null
           */
          subtitle: new Text(
              'nihao a '), //第二主题文字,一般在主题下面,,当isThreeLine不为空的时候此处标题必须不为空
        ),
        new Divider(),
        //这是系统封装好的Checkbox和平面控件ListTile的集合
        new CheckboxListTile(
          title: new Text('nihao a '),
          //是否被选中
          value: false,
          onChanged: (bool c) {
            print('$c');
          },
          //相对于平铺控件,控制平铺前面的和最后面的图标位置那个在前那个在最后面
          controlAffinity: ListTileControlAffinity.leading,
          //文本时候密集型排布
          dense: false,
          //第二个其他控件,一般是一个Icon
          secondary: new Icon(Icons.map),
          //当选中的时候是否选软图标和文本(渲染成activeColor的颜色)
          selected: true,
//                  activeColor: ,

          isThreeLine: true,
          /**
           * assert(!isThreeLine || subtitle != null),
           * 当isThreeLine=true的时候subtitle != null
           */
          subtitle: new Text(
              'nihao a '), //第二主题文字,一般在主题下面,,当isThreeLine不为空的时候此处标题必须不为空
        ),
        new Divider(),
        new RadioListTile(
          value: 'abc',
          groupValue: 'abc',
          onChanged: (String value) {},
          title: new Text('RadioListTile  --title'),
          isThreeLine: true,
          subtitle: new Text('Radio  subtitle'),

        ),
        new Divider(),
        new SwitchListTile(
          value: true,
          onChanged: (bool c) {print('$c');},
          title: new Text('SwitchListTile'),
          secondary: new Icon(Icons.map),

        ),

      ],
    );
  }
}