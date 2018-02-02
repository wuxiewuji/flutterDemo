///顶部导航栏,TabBar,Appbar底部的导航栏
/// TabBar:AppBar中封装的导航栏,内部默认实现了控制器DefaultTabController.of(context)
/// TabBarView 与TabBar联动布局,不传默认为    DefaultTabController.of(context)
/// 两个布局的控制器默认要一样才能联动
/// 使用的布局有:AppBar, DefaultTabController, TabBar, Scaffold, TabBarView.


import 'package:flutter/material.dart';


class Choice {
  const Choice({ this.title, this.icon });

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'CAR', icon: Icons.directions_car),
  const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
  const Choice(title: 'BOAT', icon: Icons.directions_boat),
  const Choice(title: 'BUS', icon: Icons.directions_bus),
  const Choice(title: 'TRAIN', icon: Icons.directions_railway),
  const Choice(title: 'WALK', icon: Icons.directions_walk),
];


class TabBarDemo extends StatelessWidget {
  static const String routeName = '/tabbar';
  final String title = 'TabBar 菜单控件';


  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .display4;
    return new MaterialApp(
      theme: Theme.of(context),
      home: new DefaultTabController(
          length: choices.length,
          child: new Scaffold(
            appBar: new AppBar(
              title: new Text(title),
              bottom:
              //Android模式的Tab滑动导航器
              new TabBar(
                //是否可以滑动
                  isScrollable: true,
                  //滑动控制器,不传、默认为DefaultTabController.of(context)
                  controller: DefaultTabController.of(context),
                  //底部指示器颜色
                  indicatorColor: Colors.red,
                  //底部指示器pading值,距离两边的值
                  indicatorPadding: const EdgeInsets.all(2.0),
                  //底部指示器的粗细
                  indicatorWeight: 2.0,
                  //选中的标签的颜色,默认为白色
                  labelColor: Colors.red,
                  //选中的文本样式
//                  labelStyle: textStyle,
                  //未选中的标签的颜色
                  unselectedLabelColor: Colors.grey,
                  //未选中的文本样式
//                  unselectedLabelStyle: textStyle,//
                  tabs: choices.map((Choice choice) {
                    return new Tab( //选项卡
                      text: choice.title,
                      icon: new Icon(choice.icon),
//                      child: new Text(choice.title),// assert(!(text != null && null != child))
                    );
                  }).toList()
              ),
            ),
            //TabBar联动装置
            body: new TabBarView(
              //TabBar滑动布局子类
                children: choices.map((Choice choice) {
                  return new Padding(padding: const EdgeInsets.all(20.0),
                    child: new Card(
                      color: Colors.grey,
                      child: new Center(
                        child: new Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Icon(
                                choice.icon, size: 128.0,
                                color: textStyle.color),
                            new Text(choice.title, style: textStyle),
                          ],
                        ),
                      ),
                      elevation: 8.0,
                    ),);
                }).toList()
            ),
          )),
    );
  }

}