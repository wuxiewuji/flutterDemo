//AppBar 学习


import 'package:flutter/material.dart';

class AppBarDemo extends StatelessWidget {
  static const String routeName = '/appbar';
  final String title = 'Scaffold 包裹控件';


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        //标题
        title: new Text("Flutter 实例"),
        //标题title1前显示的小部件
        leading: new Icon(Icons.menu),
        //具体什么用还有待测试
        automaticallyImplyLeading: true,
        //显示在右边的小部件集合,类似于Android里面的menu控件集合
        actions: <Widget>[
          new PopupMenuButton(
              itemBuilder: (BuildContext context) =><PopupMenuItem<String>>[
                new PopupMenuItem(
                    value: '选项一的值',
                    child: new Text('选项一')),
                new PopupMenuItem(
                    value: '选项二的值',
                    child: new Text('选项二')),
              ]
          ),

          new IconButton(
            icon: new Icon(Icons.shopping_cart),
            tooltip: 'Open shopping cart',//点击时后的提示字符串
            onPressed: () {
              print("点击了IconButton");
            },
          ),
          new IconButton(
            icon: new Icon(Icons.shopping_cart),
            tooltip: 'Open shopping cart',//点击时后的提示字符串
            onPressed: () {
              print("点击了IconButton");
            },
          ),

        ],
        //此控件堆叠在 toolbar and the tabbar之后的控件,高度与应用程序栏的整体高度相同
        flexibleSpace:
        new IconButton(
          icon: new Icon(Icons.print),
          //点击显示的提示文字
          tooltip: 'Open shopping cart',
          onPressed: () {
            print("点击了IconButton");
          },
        ),
//        bottom:,//状态栏底部显示的控件 必须实现了PreferredSizeWidget控件的控件
//        iconTheme:,//主题,直接默认就好
//        textTheme:,//主题,直接默认就好
        //z轴高度,
        elevation: 8.0,
        //背景颜色
        backgroundColor: Colors.blue[500],
        //亮度
        brightness: Brightness.dark,
        //状态栏沉浸式是否会被遮挡
        primary: true,
        //标题显示的为置
        centerTitle: true,
        //title显示在中心么
        titleSpacing: NavigationToolbar.kMiddleSpacing,
        //标题所占控件多少
        toolbarOpacity: 1.0,
        //状态栏的透明度,通常为1,只有在有滚动的时候才去修改
        bottomOpacity: 1.0, //navbar的透明度....
        /**Appbar底部的布局
         * 这个小部件不会对它的孩子施加任何约束，它不会。
         * 以任何方式影响孩子的布局。它只是宣传自己喜欢的尺寸。
         */
        bottom:  new PreferredSize(
          child:new Text('我是AppBar底部的布局,一般用于放置小圆点指示器等'),
          preferredSize: const Size.fromHeight(48.0),),
        //默认的Text主题
//        textTheme: ,
        //默认的Icon主题
//        iconTheme: ,
      ),
      body: new Text('AppBar Demo'),
    );
  }
}

