import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//MaterialPageRoute---Material design 风格页面跳转书写
class PageRouteDemo extends StatelessWidget {
  static const String routeName = '/material_page_route';


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        appBar: new AppBar(
          title: new Text('PageRoute'),
        ),
        body: new Container(
          padding: const EdgeInsets.all(16.0),
          child: new ListView(
            children: <Widget>[
              new RaisedButton(
                  child: new Text('MaterialPageRoute--Android'),
                  onPressed: () {
                    //MaterialPageRoute--方式跳转到新页面
                    materialRoute(context);
                  }
              ),
              new SizedBox(
                height: 20.0,
              ),
              new RaisedButton(
                  child: new Text('CupertinoPageRoute--IOS'),
                  onPressed: () {
                    cupertinoRoute(context);
                  }),
              new SizedBox(
                height: 20.0,
              ),
              new RaisedButton(
                  child: new Text('PageRouteBuilder--自定义样式'),
                  onPressed: () {
                    routeBuilder(context);
                  }),
            ],
          ),
        ),
    );
  }

  //Android Material design 页面跳转样式
  void materialRoute(BuildContext context) {
    //MaterialPageRoute--方式跳转到新页面
    Navigator.of(context).push(
        new MaterialPageRoute(
            builder: (build) {
              return newWidget(context);
            }
        )
    );
  }

  //IOS Cupertino design 页面跳转样式
  void cupertinoRoute(BuildContext context) {

    CupertinoPageRoute route= new CupertinoPageRoute(
        builder: (build) {
          return newWidget(context);
        }
    );
    //CupertinoPageRoute--方式跳转到新页面
    Navigator.of(context).push(route);
  }

  //自定义页面跳转样式
  void routeBuilder(BuildContext context) {
    //CupertinoPageRoute--方式跳转到新页面
    Navigator.of(context).push(
        new PageRouteBuilder(
          //当它处于非活动状态时，路由是否应该留在内存中,如果不是,那么当非激活状态就会被回收
          maintainState: false,
          //使用这种颜色模糊背后的页面
          barrierColor: Colors.blue,
          //新页面是否模糊新页面背后的页面(通常用于弹出Dialog的时候对背面的操作),通常和上面的颜色配合使用
          barrierDismissible: false,
          //新路由页面是否在完成之后不透明整个页面(覆盖不透明)
          opaque: true,
          //路由之间过度转换的时间,来自于父类中的TransitionRoute<T> ,
          transitionDuration: const Duration(milliseconds: 1000),
          //构建路由的数据信息,这个是父类必须要的,这里没什么用
          settings:  const RouteSettings(),


          //下面的都是关键

          //新路由页面布局
          pageBuilder: (BuildContext context, _, __) {
            return newWidget(context);
          },

          //用于构建路由的转换装置,可创建动画等,这里传入的child是上面已经构建好的
            //可以用_代替自己不想写的参数,相当于没有写参数类型的字符串仅此而已
          transitionsBuilder: (_, Animation<double> animation, __,Widget child){
              return new FadeTransition(
                opacity: animation,
                //动画旋转的小部件--RotationTransition
                child: new RotationTransition(
                  turns: new Tween<double>(begin: 0.6, end: 1.0).animate(animation),
                  child: child,
                ),
              );
          },

        )
    );
  }

  //新页面的布局
  Scaffold newWidget(BuildContext context) {
    return new Scaffold(
      //新页面中appbar会自动在标题的左边添加一个返回按钮,
      // 点击返回和点击物理返回按钮都可以退回到上一个页面
      appBar: new AppBar(
          title: new Text('新的页面')
      ),
      body: new Center(
        child: new Text(
          '点击浮动按钮返回首页',
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          //返回上一个页面
          Navigator.of(context).pop();
        },
        child: new Icon(Icons.replay),
      ),
    );
  }
}