///Material 学习
///
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_learning_demo/demo/internationalization/DemoLocalizations.dart';
import 'package:flutter_learning_demo/demo/internationalization/DemoLocalizationsDelegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'home/updates.dart';
import 'home/home.dart';
import 'item.dart';

//主题
final ThemeData _kGalleryLightTheme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
);

final ThemeData _kGalleryDarkTheme = new ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
);

class StartApp extends StatefulWidget {

  const StartApp({
    this.updateUrlFetcher, //版本更新检查
    this.enablePerformanceOverlay: true, //能否打开性能覆盖
    this.checkerboardRasterCacheImages: true,//能否打开屏幕上的棋盘删格视图
    this.checkerboardOffscreenLayers: true,//能否打开屏幕上的图位检查
    this.onSendFeedback,//发送Facebook
    Key key}) : super(key: key);

  final UpdateUrlFetcher updateUrlFetcher;

  final bool enablePerformanceOverlay;

  final bool checkerboardRasterCacheImages;

  final bool checkerboardOffscreenLayers;

  final VoidCallback onSendFeedback;

  @override
  StartAppState createState() => new StartAppState();

}

class StartAppState extends State<StartApp> {
  bool _useLightTheme = true; //是否使用某个主题
  bool _showPerformanceOverlay = false; //打开性能覆盖
  bool _checkerboardRasterCacheImages = false; //打开屏幕上的棋盘删格视图
  bool _checkerboardOffscreenLayers = false; //打开屏幕上的图位检查
  TargetPlatform _platform; //android模式还是ios模式运行样式

  // 如果为空使用系统默认值
  double _textScaleFactor; //文本的缩放因子默认1.0

  @override
  void initState() {
    super.initState();
  }

  Widget _applyScaleFactor(Widget child) {
    return new Builder(
      builder: (BuildContext context) =>
      //携带信息的Widget,方便给其子类提供MediaQueryData信息(布局大小位置等信息)
      new MediaQuery(
        data: MediaQuery.of(context).copyWith(//复制父类信息,除了下面的信息之外
          textScaleFactor: _textScaleFactor,//自定义自己的信息
        ),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget home = new StartHome(
      useLightTheme: _useLightTheme,//是否选择某个主题
      onThemeChanged: (bool value) {//主题改变回调
        setState(() {//刷新界面
          _useLightTheme = value;
        });
      },
      //打开性能覆盖
      showPerformanceOverlay: _showPerformanceOverlay,
      onShowPerformanceOverlayChanged: widget.enablePerformanceOverlay ? (
          bool value) {
        setState(() {
          _showPerformanceOverlay = value;
        });
      } : null,
     //打开屏幕上的棋盘删格视图
      checkerboardRasterCacheImages: _checkerboardRasterCacheImages,
      onCheckerboardRasterCacheImagesChanged: widget
          .checkerboardRasterCacheImages ? (bool value) {
        setState(() {
          _checkerboardRasterCacheImages = value;
        });
      } : null,
     //打开屏幕上的图位检查
      checkerboardOffscreenLayers: _checkerboardOffscreenLayers,
      onCheckerboardOffscreenLayersChanged: widget.checkerboardOffscreenLayers
          ? (bool value) {
        setState(() {
          _checkerboardOffscreenLayers = value;
        });
      }: null,
    //android模式还是ios模式运行样式
      onPlatformChanged: (TargetPlatform value) {
        setState(() {
          _platform = value == defaultTargetPlatform ? null : value;
        });
      },

      textScaleFactor: _textScaleFactor,
      onTextScaleFactorChanged: (double value) {
        setState(() {
          _textScaleFactor = value;
        });
      },

      onSendFeedback: widget.onSendFeedback,
    );

    //组装路由器
    final Map<String, WidgetBuilder> _kRoutes =
    new Map<String, WidgetBuilder>.fromIterable(
      // 参考官方文档书写自定义路由配置
      kAllGalleryItems,
      key: (GalleryItem item) => item.routeName,
      value: (GalleryItem item) {
        return (BuildContext context) =>
            _applyScaleFactor(item.buildRoute(context));
      },
    );


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
    //国际化
      //此处
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        //添加自定义的语言适配
        DemoLocalizationsDelegate.delegate,
      ],
      //此处
      supportedLocales: [
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
      //打开屏幕上的图位检查
      checkerboardOffscreenLayers: _checkerboardOffscreenLayers,
      //打开屏幕上的棋盘删格视图
      checkerboardRasterCacheImages: _checkerboardRasterCacheImages,
      //打开性能覆盖
      showPerformanceOverlay: _showPerformanceOverlay,
      //退到后台显示的标题,和title的功能一样,有这个的时候title就没有效果了

      title:"我是退到后台显示的标题,任务栏的标题",
      //使用国际化语言--要用这个,上面的context是从MaterialApp外部传入的,不能正确拿到
      onGenerateTitle: (BuildContext context) {
        return DemoLocalizations.of(context).titleBarTitle;
      },
      color: Colors.grey,
      //主题色
      theme: (_useLightTheme ? _kGalleryLightTheme : _kGalleryDarkTheme)
          //android模式还是ios模式运行样式
          .copyWith(platform: _platform ?? defaultTargetPlatform),
      home: _applyScaleFactor(home),
      //路由的集合
      routes: _kRoutes,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
