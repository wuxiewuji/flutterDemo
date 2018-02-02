///AppBar底部导航点和TabBarView联动
///使用的布局:AppBar, PreferredSize,TabPageSelector, TabBarView, TabController

import 'package:flutter/material.dart';

//圆点指示器联动
class PointTabBarViewDemo extends StatefulWidget {
  static const String routeName = '/point_and_tabbarview';
  final String title = 'TabPageSelector 圆点指示器,View联动';

  @override
  State<StatefulWidget> createState() => new _PointTabBarViewDemo();
}

class _PointTabBarViewDemo extends State<PointTabBarViewDemo>  with SingleTickerProviderStateMixin {
  TabController _tabController;

  //对象插入树的时候调用
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: cards.length, vsync: this);
  }

  //当这个对象永久的重复树中移除的时候调用
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        primary: true,
        leading: new IconButton(icon: const Icon(Icons.arrow_back),
            onPressed: () {
              _nextPage(-1);
            },
            tooltip: 'Previous choice'),
        actions: <Widget>[
          new IconButton(
            icon: const Icon(Icons.arrow_forward),
            tooltip: 'Next choice',
            onPressed: () {
              _nextPage(1);
            },
          )
        ],
        //渲染自己尺寸的不影响子类大小,一般用于Appbar的bottom,防止高度不够无法显示问题
        bottom: new PreferredSize(
          //尺寸大小,创建一个高度为48宽度无限的布局
          preferredSize: const Size.fromHeight(48.0),
          child: new Container(
            height: 48.0,
            alignment: Alignment.center,
            //圆点指示器控件
            child: new TabPageSelector(
              //TabController控制器
              controller: _tabController,
              //圆点指示器默认的颜色
              color: Colors.grey,
              //当前选中的的指示器的颜色
              selectedColor: Colors.red,
              //指示器圆新的大小,默认为12.0
              indicatorSize: 12.0,
            ),
          ),
        ),
      ),
      body: new TabBarView(
        controller: _tabController, //控制器
        physics: const PageScrollPhysics(), //滚动的参数
        children: cards.map((CardData choice) { //滑动的布局
          return new Padding(
            padding: const EdgeInsets.all(16.0),
            child: new ChoiceCard(choice: choice),);
        }).toList(),
      ),
    );
  }

  _nextPage(int delta) {
    final int newIndex = _tabController.index + delta;
    if (newIndex < 0 || newIndex >= _tabController.length)
      return;
    _tabController.animateTo(newIndex);
  }
}

class ChoiceCard extends StatelessWidget {
  final CardData choice;


  ChoiceCard({ Key key, this.choice }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(choice.icon, size: 128.0, color: textStyle.color),
            new Text(choice.title, style: textStyle)
          ],
        ),
      ),
    );
  }
}


class CardData {
  const CardData({ this.title, this.icon });

  final String title;
  final IconData icon;
}

const List<CardData> cards = const <CardData>[
  const CardData(title: 'CAR', icon: Icons.directions_car),
  const CardData(title: 'BICYCLE', icon: Icons.directions_bike),
  const CardData(title: 'BOAT', icon: Icons.directions_boat),
  const CardData(title: 'BUS', icon: Icons.directions_bus),
  const CardData(title: 'TRAIN', icon: Icons.directions_railway),
  const CardData(title: 'WALK', icon: Icons.directions_walk),
];