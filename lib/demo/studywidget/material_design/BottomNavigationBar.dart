///底部导航栏


import 'package:flutter/material.dart';


class BottomNavigationBarDemo extends StatefulWidget {
  static const String routeName = '/navigationbar';
  final String title = 'BottomNavigationBar 菜单控件';

  @override
  State<StatefulWidget> createState() => new _BottomNavigationBarDemo();
}

class _BottomNavigationBarDemo extends State<BottomNavigationBarDemo> {

  // 类成员，存储底部导航栏的当前选择
  int _currentIndex = 2;

  ///BottomNavigationBarType.fixed :底部导航栏不启用相关的动画
  /// BottomNavigationBarType.shifting :启动相关的动画
  ///
  BottomNavigationBarType _type = BottomNavigationBarType.shifting;
  // 类成员，存储NavigationIconView类的列表
  List<BottomNavigationBarItem> _navigationViews;

  //初始化方法,创建布局的时候调用
  @override
  void initState() {
    // 调用父类的内容
    super.initState();
    // 在存储NavigationIconView类的列表里添加内容
    _navigationViews = <BottomNavigationBarItem>[
      /*
       * 创建NavigationIconView类的实例
       *  传递图标参数
       *  传递标题参数
       *  传递颜色参数
       *  传递Ticker对象
       */
      new BottomNavigationBarItem(
        //图标
        icon: new Icon(Icons.access_alarm),
        //名称
        title: new Text('成就'),
        //背景
        backgroundColor: Colors.deepPurple[500],
      ),
      new BottomNavigationBarItem(
        icon: new CustomIcon(),
        title: new Text('行动'),
        backgroundColor: Colors.deepOrange[500],
      ),
      new BottomNavigationBarItem(
        icon: new Icon(Icons.cloud),
        title: new Text('人物'),
        backgroundColor: Colors.teal[500],
      ),
      new BottomNavigationBarItem(
        icon: new Icon(Icons.favorite),
        title: new Text('财产'),
        backgroundColor: Colors.indigo[500],
      ),
      new BottomNavigationBarItem(
        icon: new Icon(Icons.event_available),
        title: new Text('设置'),
        backgroundColor: Colors.pink[500],
      ),
    ];
  }


  @override
  Widget build(BuildContext context) {

    // 局部变量，创建底部导航栏
    final BottomNavigationBar botNavBar = new BottomNavigationBar(
      /*
       *  在底部导航栏中布置的交互项：BottomNavigationBarItem
       */
        items: _navigationViews,
        // 当前活动项的索引：存储底部导航栏的当前选择
        currentIndex: _currentIndex,
        // 底部导航栏的布局和行为：存储底部导航栏的布局和行为
        type: _type,
        // 底部导航栏点击事件
        onTap: (int index) {
          // 通知框架此对象的内部状态已更改
          setState((){
            // 更新存储底部导航栏的当前选择
            _currentIndex = index;
          });
        }
    );


    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
          primary: true,
        ),
        body: new Center(
          // 主要内容：_buildTransitionsStack函数的返回值
            child: _navigationViews[_currentIndex].icon
        ),
      // 底部的导航栏
      bottomNavigationBar: botNavBar,
    );
  }
}
// 创建类，自定义图标，继承StatelessWidget（无状态的控件）
class CustomIcon extends StatelessWidget {
  // 覆盖此函数以构建依赖于动画的当前状态的控件
  @override
  Widget build(BuildContext context) {
    // 获取当前图标主题，创建与此图标主题相同的图标主题
    final IconThemeData iconTheme = IconTheme.of(context);
    // 返回值，创建一个容器控件
    return new Container(
      // 围绕子控件的填充：每个边都偏移4.0
        margin: const EdgeInsets.all(4.0),
        // 容器宽度：图标主题的宽度减8.0
        width: iconTheme.size - 8.0,
        // 容器高度：图标主题的高度减8.0
        height: iconTheme.size - 8.0,
        // 子控件的装饰：创建一个装饰
        decoration: new BoxDecoration(
          // 背景颜色：图标主题的颜色
            color: iconTheme.color
        )
    );
  }
}

