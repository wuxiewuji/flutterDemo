import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_learning_demo/demo/studywidget/template.dart';


class ContainerDemo extends IWidgetLess {
  static const String routeName = '/container';
  final String title = 'Container 包裹控件';

  @override
  Widget child() {
    return new Demoless(
      title: title,
      children: <Widget>[
        new Container(
          child: new Container(
            //控件的宽高
            width: 128.0,
            height: 128.0,
            //控件的描述,Box为盒子描述控件
            decoration: new BoxDecoration(
              //描述颜色
              color: Colors.lightBlueAccent[100],
              //描述控件的边框
              border: new Border.all(
                //边框的颜色
                color: const Color(0xff6d9eeb),
                //边框的宽的
                width: 8.0,
                //描述边界线
                style: BorderStyle.solid,
              ),
              //边界半径,如果为圆的话自动忽略
              borderRadius: new BorderRadius.circular(8.0),
              //描述为矩形,,,,如果为圆形就不能有边界半径
              shape: BoxShape.rectangle,
              //投射的阴影,如果为非矩形那么可以投射费矩形阴影
//                boxShadow:, :
              //填充时候的渐变
              gradient: const LinearGradient(
                begin: const Alignment(0.0, -1.0),
                end: const Alignment(0.0, -1.0),
                colors: const <Color>[
                  const Color(0x60000000), const Color(0x00000000)],
                //向量分数0-1之间的值,与上面的颜色值要保持一直,颜色有几个就要有几个向量分数
                stops: const <double>[0.5, 0.9],
                //渐变梯度
                tileMode: TileMode.mirror,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            margin: const EdgeInsets.symmetric(horizontal: 2.0),
//            foregroundDecoration: ,//在子类之上的涂抹装饰
            //与decoration内部描述的背景颜色是一样的.因此只能有一个定义颜色,多一个或者没有都报错
//            color: Colors.lightBlueAccent[100],
            //居中,//位置信息的描述
            alignment: Alignment.center,
            child: new Text("你好"),
            //Containerde 的边框约束
            constraints: new BoxConstraints(
              maxHeight: 200.0,
              maxWidth: 360.0,
              minHeight: 100.0,
              minWidth: 200.0,
            ),
          ),
        ),

        new Container(
          height: 66.0,
          padding: const EdgeInsets.all(16.0),
          decoration: new BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          //居中,//位置信息的描述
          alignment: Alignment.center,
          child:new  Text('这是一个圆形'),
        )
      ],
    );
  }
}