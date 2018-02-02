///主页

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';
import '../item.dart';

const double _kFlexibleSpaceMaxHeight = 256.0;
const String _kGalleryAssetsPackage = 'flutter_gallery_assets';

class _BackgroundLayer {
  _BackgroundLayer({ int level, double parallax })
      : assetName = 'appbar/appbar_background_layer$level.png',
        assetPackage = _kGalleryAssetsPackage,
        parallaxTween = new Tween<double>(begin: 0.0, end: parallax);
  final String assetName;
  final String assetPackage;
  final Tween<double> parallaxTween;
}

final List<_BackgroundLayer> _kBackgroundLayers = <_BackgroundLayer>[
  new _BackgroundLayer(level: 0, parallax: _kFlexibleSpaceMaxHeight),
  new _BackgroundLayer(level: 1, parallax: _kFlexibleSpaceMaxHeight),
  new _BackgroundLayer(level: 2, parallax: _kFlexibleSpaceMaxHeight / 2.0),
  new _BackgroundLayer(level: 3, parallax: _kFlexibleSpaceMaxHeight / 4.0),
  new _BackgroundLayer(level: 4, parallax: _kFlexibleSpaceMaxHeight / 2.0),
  new _BackgroundLayer(level: 5, parallax: _kFlexibleSpaceMaxHeight)
];

class _AppBarBackground extends StatelessWidget {
  const _AppBarBackground({ Key key, this.animation }) : super(key: key);

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    //创建一个动画建设者布局
    return new AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget child) {
          //堆叠布局,方向大小自己控制
          return new Stack(
              children: _kBackgroundLayers.map((_BackgroundLayer layer) {
                //位置控件,控制Stack的位置
                return new Positioned(
                    top: -layer.parallaxTween.evaluate(animation),
                    left: 0.0,
                    right: 0.0,
                    bottom: 0.0,
                    child: new Image.asset(
                        layer.assetName,
                        package: layer.assetPackage,
                        fit: BoxFit.cover,
                        height: _kFlexibleSpaceMaxHeight
                    )
                );
              }).toList()
          );
        }
    );
  }
}

class StartHome extends StatefulWidget {
  const StartHome({
    Key key,
    this.useLightTheme,
    @required this.onThemeChanged,
    this.textScaleFactor,
    this.onTextScaleFactorChanged,
    this.showPerformanceOverlay,
    this.onShowPerformanceOverlayChanged,
    this.checkerboardRasterCacheImages,
    this.onCheckerboardRasterCacheImagesChanged,
    this.checkerboardOffscreenLayers,
    this.onCheckerboardOffscreenLayersChanged,
    this.onPlatformChanged,
    this.onSendFeedback,
  })
      : assert(onThemeChanged != null),
        super(key: key);

  //主题设置等相关设置参数,详见app.dart
  final bool useLightTheme;
  final ValueChanged<bool> onThemeChanged;

  final double textScaleFactor;
  final ValueChanged<double> onTextScaleFactorChanged;

  final bool showPerformanceOverlay;
  final ValueChanged<bool> onShowPerformanceOverlayChanged;

  final bool checkerboardRasterCacheImages;
  final ValueChanged<bool> onCheckerboardRasterCacheImagesChanged;

  final bool checkerboardOffscreenLayers;
  final ValueChanged<bool> onCheckerboardOffscreenLayersChanged;

  final ValueChanged<TargetPlatform> onPlatformChanged;

  final VoidCallback onSendFeedback;

  @override
  StartHomeState createState() => new StartHomeState();
}

class StartHomeState extends State<StartHome>
    with SingleTickerProviderStateMixin {
  static final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<
      ScaffoldState>();

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 600),
      debugLabel: 'preview banner',
      vsync: this,
    )
      ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> _galleryListItems() {
    final List<Widget> listItems = <Widget>[];
    final ThemeData themeData = Theme.of(context);
    final TextStyle headerStyle = themeData.textTheme.body2.copyWith(
        color: themeData.accentColor);
    String category;
    for (GalleryItem galleryItem in kAllGalleryItems) {
      //创建不同类别的Text标签文本,当有不同类别的时候才创建
      if (category != galleryItem.category) {
        if (category != null)
          listItems.add(const Divider());
        listItems.add(
          //合并子类语意的控件,eg:一个文本框和一个复选按钮,不合并只有点击复选按钮有效果,合并了点击整个都有效果
            new MergeSemantics(
              child: new Container(
                  height: 48.0,
                  padding: const EdgeInsetsDirectional.only(start: 16.0),
                  alignment: AlignmentDirectional.centerStart,
                  child: new Text(galleryItem.category, style: headerStyle)
              ),
            )
        );
        category = galleryItem.category;
      }
      listItems.add(galleryItem);
    }
    return listItems;
  }

  @override
  Widget build(BuildContext context) {
    Widget home = new Scaffold(
        key: _scaffoldKey,
        //主题的侧滑控件
        drawer: new HomeDrawer(
          useLightTheme: widget.useLightTheme,
          onThemeChanged: widget.onThemeChanged,
          textScaleFactor: widget.textScaleFactor,
          onTextScaleFactorChanged: widget.onTextScaleFactorChanged,
          showPerformanceOverlay: widget.showPerformanceOverlay,
          onShowPerformanceOverlayChanged: widget
              .onShowPerformanceOverlayChanged,
          checkerboardRasterCacheImages: widget.checkerboardRasterCacheImages,
          onCheckerboardRasterCacheImagesChanged: widget
              .onCheckerboardRasterCacheImagesChanged,
          checkerboardOffscreenLayers: widget.checkerboardOffscreenLayers,
          onCheckerboardOffscreenLayersChanged: widget
              .onCheckerboardOffscreenLayersChanged,
          onPlatformChanged: widget.onPlatformChanged,
          onSendFeedback: widget.onSendFeedback,
        ),
        //滑动控件,与SliverAppBar CustomScrollView的滚动而变化高度
        body: new CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              pinned: true,
              expandedHeight: _kFlexibleSpaceMaxHeight,
              //柔性可变的布局,可跟随滚动变换大小的控件
              flexibleSpace: const FlexibleSpaceBar(
                title: const Text('Flutter 教程主页'),
                //是否居中标题默认适应当前的TargetPlatform:android io系统
                centerTitle: false,
                //kAlwaysDismissedAnimation比构建一个AnimationController开销要小得多
                //可伸缩的Bar背景
                background: const _AppBarBackground(
                    animation: kAlwaysDismissedAnimation),
              ),
            ),
            //默认一个一个将多个盒子的儿童放置在沿主的线性阵列的条子轴
            //SliverFixedExtentList（孩子在轴上呈现的程度,所占用的比重）、
            // SliverPrototypeExtentList(与上面类似)、
            // SliverGrid（孩子任意位置）
            new SliverList(
              //SliverChildBuilderDelegate、SliverChildListDelegate两种不同的模式
                delegate: new SliverChildListDelegate(_galleryListItems())),
          ],
        )
    );

    bool showPreviewBanner = true;
    assert(() {
      showPreviewBanner = false;
      return true;
    }());

    if (showPreviewBanner) {
      home = new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            home,
            new FadeTransition(
                opacity: new CurvedAnimation(
                    parent: _controller, curve: Curves.easeInOut),
                child: const Banner(
                  message: 'PREVIEW',
                  location: BannerLocation.topEnd,
                )
            ),
          ]
      );
    }

    return home;
  }
}
