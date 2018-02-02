import 'package:flutter/material.dart';
import 'package:flutter_learning_demo/demo/studywidget/template.dart';


class RowDemo extends IWidgetLess {
  static const String routeName = '/row';
  final String title = 'Row 包裹控件';

  @override
  Widget child() {
    return new Demoless(
      title:title,
      children: <Widget>[
        //与Column一样,水平方向
        new Row(
          /**内部控件对空间的分配方式
           * 必须要将 mainAxisSize: MainAxisSize.max--控件可分配到的空间最大化设置才能看到下面的效果
           * MainAxisAlignment.start:将内部控件放在靠左位置
           * MainAxisAlignment.end:将内部控件放在靠右的位置
           * MainAxisAlignment.center :将内部控件紧靠的放在中间位置
           * MainAxisAlignment.spaceBetween:把自由空间均匀的放在控件之前,即(左右两边靠墙,控件之间均匀分配)
           * MainAxisAlignment.spaceAround:每个控件两边都均匀的分配到相同的空间,即(两边的空间会比其他的空间少一半)
           * MainAxisAlignment.spaceEvenly:每个控件空隙均匀分配空间
           */
            mainAxisAlignment: MainAxisAlignment.start,
            //排布方向从左往右还是从右往左 123|321
            textDirection: TextDirection.ltr,
            //控件相对于包裹控件来说的对齐方式,stretch:这个特殊,将控件的垂直方向铺满
            crossAxisAlignment: CrossAxisAlignment.center,
            //在自己的伸缩范围内最大的获取自由空间(可获取到的最大空间分配给子类),min获取最小的控件(空间大小)
            mainAxisSize: MainAxisSize.max,
            //对齐文本的水平线
            textBaseline: TextBaseline.ideographic,
            //只在垂直排布的时候有效,与textDirection相对
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              new RaisedButton(
                //触摸是件
                onPressed: () {
                  print('点击红色按钮事件');
                },
                //控件z轴高度
                elevation:8.0,
                //本控件是用的主题亮度
                colorBrightness :Brightness.dark,
                //禁用此按钮时候的颜色
                disabledColor:Colors.grey,
                //禁用此按钮是后的高度
                disabledElevation:2.0,
                //高亮的时候的颜色
                highlightColor:Colors.red,
                //高亮时候的高度
                highlightElevation:12.0,
                //点击涟漪效果的颜色
                splashColor:Colors.blue,
                //默认状态的颜色
                color: Colors.black,
                child: new Text('红色按钮'),
              ),
              //Flexible这个没效果,用Expanded:表示占用的百分比
              new Flexible(
                flex: 1,
                child: new RaisedButton(
                  onPressed: () {
                    print('点击黄色按钮事件');
                  },
                  color: const Color(0xfff1c232),
                  child: new Text('黄色按钮'),
                ),
              ),
              new RaisedButton(
                onPressed: () {
                  print('点击粉色按钮事件');
                },
                color: const Color(0xffea9999),
                child: new Text('粉色按钮'),
              ),
            ]
        ),
      ],
    );
  }
}