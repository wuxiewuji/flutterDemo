import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class MaterialAppDemo extends StatefulWidget {
  static const String routeName = '/material_app';
  final String title = 'Material风格学习';

  @override
  State<StatefulWidget> createState() => new _MaterialAppDemo();
}

class _MaterialAppDemo extends State<MaterialAppDemo> {
  bool _useLightTheme = true; //是否使用某个主题
  bool _showPerformanceOverlay = false; //打开性能覆盖
  bool _checkerboardRasterCacheImages = false; //打开屏幕上的棋盘删格视图
  bool _checkerboardOffscreenLayers = false; //打开屏幕上的图位检查
  TargetPlatform _platform; //android模式还是ios模式运行样式


  @override
  Widget build(BuildContext context) {
    //现在只学下面的
    return new MaterialApp(
//     //打开检查模式下“慢模式”横幅
//     debugShowCheckedModeBanner:false,
//      //为程序创建一个导航器观察者,用系统就好
//      navigatorObservers: const <NavigatorObserver>[],
//      //路由器的回调,用系统就好
//      onGenerateRoute:,
//      //当点击这个路由出错未找到页面的时候调用,用系统就好
//      onUnknownRoute :,
//      //需要展示的第一条路由
//      initialRoute: Navigator.defaultRouteName,
//      //打开显示可访问性信息的覆盖层。报告的框架。
//      showSemanticsDebugger: false,
//      //本应用已经本地化的区域列表
//      supportedLocales: const <Locale>[const Locale('en', 'US')]
//       //初始化的语言环境
//       locale: const Locale('en', 'US'),
//       //应用程序的区域设置
//       localeResolutionCallback: (Locale locale,
//           Iterable<Locale> supportedLocales) {
//             return locale;
//       },
//        // 打开绘制基线网格的[GridPaper]覆盖。bug模式可用
//        debugShowMaterialGrid: false,
      //打开屏幕上的图位检查
        checkerboardOffscreenLayers: _checkerboardOffscreenLayers,
        //打开屏幕上的棋盘删格视图
        checkerboardRasterCacheImages: _checkerboardRasterCacheImages,
        //打开性能覆盖
        showPerformanceOverlay: _showPerformanceOverlay,
        //退到后台显示的标题,和title的功能一样,有这个的时候title就没有效果了
        title: "我是退到后台显示的标题,任务栏的标题",
        onGenerateTitle: (BuildContext context) {
          return "我是退到后台显示的标题,任务栏的标题";
        },
        color: Colors.grey,
        //主题色
        theme: (_useLightTheme ? _kGalleryLightTheme : _kGalleryDarkTheme)
        //android模式还是ios模式运行样式
            .copyWith(platform: _platform ?? defaultTargetPlatform),
        //路由的集合
//        routes:,//路由详见路由章节
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text(widget.title),
          ),
          body: new ListView(
            children: <Widget>[
              new RaisedButton(
                  child: new Text('是否打开屏幕上的图位检查'),
                  onPressed: () {
                    setState(() {
                      _checkerboardOffscreenLayers =
                      !_checkerboardOffscreenLayers;
                    });
                  }),
              new RaisedButton(
                  child: new Text('打开屏幕上的棋盘删格视图'),
                  onPressed: () {
                    setState(() {
                      _checkerboardRasterCacheImages =
                      !_checkerboardRasterCacheImages;
                    });
                  }),
              new RaisedButton(
                  child: new Text('打开性能覆盖'),
                  onPressed: () {
                    setState(() {
                      _showPerformanceOverlay = !_showPerformanceOverlay;
                    });
                  }),
              new RaisedButton(
                  child: new Text('选中亮色还是黑色主题'),
                  onPressed: () {
                    setState(() {
                      _useLightTheme = !_useLightTheme;
                    });
                  }),
              new RaisedButton(
                child: new Text('详见路由章节'),
                onPressed: () {
//                  Navigator.push(context, new MaterialPageRoute<Null>(
//                    settings: const RouteSettings(name: '/pesto/favorites'),
//                    builder: (BuildContext context) => new PestoFavorites(),
//                  ));
                },
              )
            ],
          ),
        )
    );
  }
}
//主题
final ThemeData _kGalleryLightTheme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
);

final ThemeData _kGalleryDarkTheme = new ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
);

class MyPage extends StatelessWidget {
  MyPage({Key key, this.title}) : super(key: key);
  final String title;

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text(title)
      ),
    );
  }
}