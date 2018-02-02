//路由管理类

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning_demo/demo/pesto_demo.dart';
import 'package:flutter_learning_demo/demo/all.dart';

typedef Widget GalleryDemoBuilder();

class GalleryItem extends StatelessWidget {
  const GalleryItem({
    @required this.title,
    @required this.subtitle,
    @required this.category,
    @required this.routeName,
    @required this.buildRoute,
  })
      : assert(title != null),
        assert(category != null),
        assert(routeName != null),
        assert(buildRoute != null);

  final String title;
  final String subtitle;
  final String category;
  final String routeName;
  final WidgetBuilder buildRoute;

  @override
  Widget build(BuildContext context) {
    return new ListTile(
        title: new Text(title),
        subtitle: new Text(subtitle),
        onTap: () {
          if (routeName != null) {
            //发出一个即时的事件。
            Timeline.instantSync(
                'Start Transition', arguments: <String, String>{
              'from': '/',
              'to': routeName
            });
            //跳转到路由
            Navigator.pushNamed(context, routeName);
          }
        }
    );
  }
}

List<GalleryItem> _buildGalleryItems() {
  // When editing this list, make sure you keep it in sync with
  // the list in ../../test_driver/transitions_perf_test.dart
  final List<GalleryItem> galleryItems = new List();

  final List<GalleryItem> basics = <GalleryItem>[
    // category --分类.名
    //Basic Widgets
    new GalleryItem(
      title: 'Container',
      subtitle: 'Basic Container study code',
      category: 'Basic Widgets',
      //路由跳转的标记名字
      routeName: ContainerDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new ContainerDemo().child(),
    ),
    new GalleryItem(
      title: 'Row',
      subtitle: 'Basic Row study code',
      category: 'Basic Widgets',
      //路由跳转的标记名字
      routeName: RowDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new RowDemo().child(),
    ),
    new GalleryItem(
      title: 'Column',
      subtitle: 'Basic Column study code',
      category: 'Basic Widgets',
      //路由跳转的标记名字
      routeName: ColumnDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new ColumnDemo(),
    ),

    new GalleryItem(
      title: 'Text',
      subtitle: 'Basic Text study code',
      category: 'Basic Widgets',
      //路由跳转的标记名字
      routeName: TextDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new TextDemo().child(),
    ),
    new GalleryItem(
      title: 'Icon',
      subtitle: 'Basic Icon study code',
      category: 'Basic Widgets',
      //路由跳转的标记名字
      routeName: IconDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new IconDemo().child(),
    ),

    new GalleryItem(
      title: 'Scaffold',
      subtitle: 'Basic Scaffold study code',
      category: 'Basic Widgets',
      //路由跳转的标记名字
      routeName: ScaffoldDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new ScaffoldDemo(),
    ),
    new GalleryItem(
      title: 'Appbar',
      subtitle: 'Basic Appbar study code',
      category: 'Basic Widgets',
      //路由跳转的标记名字
      routeName: AppBarDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new AppBarDemo(),
    ),
    new GalleryItem(
      title: 'FlutterLogo',
      subtitle: 'Basic Text study code',
      category: 'Basic Widgets',
      //路由跳转的标记名字
      routeName: FlutterLogoDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new FlutterLogoDemo().child(),
    ),
    new GalleryItem(
      title: 'Placeholder',
      subtitle: 'Basic Placeholder study code',
      category: 'Basic Widgets',
      //路由跳转的标记名字
      routeName: PlaceholderDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new PlaceholderDemo().child(),
    ),
  ];
  final List<GalleryItem> materials = <GalleryItem>[

    //Material Design
    new GalleryItem(
      title: 'BottomNavigationBar',
      subtitle: 'Basic BottomNavigationBar study code',
      category: 'Material Design',
      //路由跳转的标记名字
      routeName: BottomNavigationBarDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new BottomNavigationBarDemo(),
    ),
    new GalleryItem(
      title: 'TabBarDemo',
      subtitle: 'Basic TabBarDemo study code',
      category: 'Material Design',
      //路由跳转的标记名字
      routeName: TabBarDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new TabBarDemo(),
    ),
    new GalleryItem(
      title: 'PointTabBarViewDemo',
      subtitle: 'Basic PointTabBarViewDemo study code',
      category: 'Material Design',
      //路由跳转的标记名字
      routeName: PointTabBarViewDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new PointTabBarViewDemo(),
    ),
    new GalleryItem(
      title: 'MaterialAppDemo',
      subtitle: 'Basic MaterialApp study code',
      category: 'Material Design',
      //路由跳转的标记名字
      routeName: MaterialAppDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new MaterialAppDemo(),
    ),
    new GalleryItem(
      title: 'DrawerDemo',
      subtitle: 'Basic Drawer study code',
      category: 'Material Design',
      //路由跳转的标记名字
      routeName: DrawerDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new DrawerDemo(),
    ),
    new GalleryItem(
      title: 'Button',
      subtitle: 'Basic Button study code',
      category: 'Material Design',
      //路由跳转的标记名字
      routeName: ButtonDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new ButtonDemo(),
    ),
    new GalleryItem(
      title: 'PopupMenuButton',
      subtitle: 'Basic Button study code',
      category: 'Material Design',
      //路由跳转的标记名字
      routeName: PopupMenuButtonDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new PopupMenuButtonDemo(),
    ),
    new GalleryItem(
      title: 'TextField',
      subtitle: 'Basic TextField study code',
      category: 'Material Design',
      //路由跳转的标记名字
      routeName: TextFieldDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new TextFieldDemo(),
    ),
    new GalleryItem(
      title: 'CheckBox',
      subtitle: 'Basic CheckBox study code',
      category: 'Material Design',
      //路由跳转的标记名字
      routeName: CheckBoxDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new CheckBoxDemo(),
    ),
    new GalleryItem(
      title: 'Radio',
      subtitle: 'Basic Radio study code',
      category: 'Material Design',
      //路由跳转的标记名字
      routeName: RadioDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new RadioDemo(),
    ),
    new GalleryItem(
      title: 'Switch',
      subtitle: 'Basic Switch  study code',
      category: 'Material Design',
      //路由跳转的标记名字
      routeName: SwitchDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new SwitchDemo(),
    ),
    new GalleryItem(
      title: 'Slider',
      subtitle: 'Basic Slider study code',
      category: 'Material Design',
      //路由跳转的标记名字
      routeName: SliderDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new SliderDemo(),
    ),
    new GalleryItem(
      title: 'TimePicker',
      subtitle: 'Basic Date & Time Pickers study code',
      category: 'Material Design',
      //路由跳转的标记名字
      routeName: TimeAndDatePicker.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new TimeAndDatePicker(),
    ),
    new GalleryItem(
      title: 'DialogDemo',
      subtitle: 'Basic Dialog study code',
      category: 'Material Design',
      //路由跳转的标记名字
      routeName: DialogDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new DialogDemo(),
    ),
    new GalleryItem(
      title: 'BottomSheetDemo',
      subtitle: 'Basic BottomSheet study code',
      category: 'Material Design',
      //路由跳转的标记名字
      routeName: BottomSheetDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new BottomSheetDemo(),
    ),
    new GalleryItem(
      title: 'ExpansionPanelDemo',
      subtitle: 'Basic ExpansionPanel study code',
      category: 'Material Design',
      //路由跳转的标记名字
      routeName: ExpansionPanelDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new ExpansionPanelDemo(),
    ),
    new GalleryItem(
      title: 'SnackBarDemo',
      subtitle: 'Basic ExpansionPanel study code',
      category: 'Material Design',
      //路由跳转的标记名字
      routeName: SnackBarDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new SnackBarDemo(),
    ),
    new GalleryItem(
      title: 'ProgressIndicator',
      subtitle: 'Basic ProgressIndicator study code',
      category: 'Material Design',
      //路由跳转的标记名字
      routeName: ProgressIndicatorDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new ProgressIndicatorDemo().child(),
    ),

    new GalleryItem(
      title: 'Chip',
      subtitle: 'Basic Chip study code',
      category: 'Material Design',
      //路由跳转的标记名字
      routeName: ChipDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new ChipDemo(),
    ),

    new GalleryItem(
      title: 'Tooltip',
      subtitle: 'Basic Tooltip study code',
      category: 'Material Design',
      //路由跳转的标记名字
      routeName: TooltipDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new TooltipDemo().child(),
    ),
    new GalleryItem(
      title: 'DataTableDemo',
      subtitle: 'Basic DataTable study code',
      category: 'Material Design',
      //路由跳转的标记名字
      routeName: DataTableDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new DataTableDemo(),
    ),
    new GalleryItem(
      title: 'PaginatedDataTableDemo',
      subtitle: 'Basic PaginatedDataTable study code',
      category: 'Material Design',
      //路由跳转的标记名字
      routeName: PaginatedDataTableDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new PaginatedDataTableDemo(),
    ),
    new GalleryItem(
      title: 'CardDemo',
      subtitle: 'Basic Card study code',
      category: 'Material Design',
      //路由跳转的标记名字
      routeName: CardDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new CardDemo().child(),
    ),
    new GalleryItem(
      title: 'GridView',
      subtitle: 'Basic GridView study code',
      category: 'Material Design',
      //路由跳转的标记名字
      routeName: GridViewDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new GridViewDemo(),
    ),
    new GalleryItem(
      title: 'Image',
      subtitle: 'Basic Image study code',
      category: 'Material Design',
      //路由跳转的标记名字
      routeName: ImageDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new ImageDemo().child(),
    ),
    new GalleryItem(
      title: 'ListTile',
      subtitle: 'Basic ListTile study code',
      category: 'Material Design',
      //路由跳转的标记名字
      routeName: ListTileDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new ListTileDemo().child(),
    ),
    new GalleryItem(
      title: 'Stepper',
      subtitle: 'Basic Stepper study code',
      category: 'Material Design',
      //路由跳转的标记名字
      routeName: StepperDemo.routeName,
      //路由构建的布局
      buildRoute: (BuildContext context) => new StepperDemo(),
    ),
  ];
  //动画
  List<GalleryItem> anims = <GalleryItem>[
    new GalleryItem(
        title: 'AnimatedContainer',
        subtitle: 'AnimatedContainer动画控件学习',
        category: 'Animations',
        routeName: AnimatedContainerDemo.routeName,
        buildRoute: (BuildContext context) => new AnimatedContainerDemo())
  ];
  //路由
  List<GalleryItem> routes = <GalleryItem>[
    new GalleryItem(
        title: 'Route 学习',
        subtitle: '路由学习',
        category: 'route',
        routeName: PageRouteDemo.routeName,
        buildRoute: (BuildContext context) => new PageRouteDemo())
  ];
  //网路
  List<GalleryItem> https = <GalleryItem>[
    new GalleryItem(
        title: 'HttpClient学习',
        subtitle: 'HttpClient学习',
        category: 'http',
        routeName: HttpClientDemo.routeName,
        buildRoute: (BuildContext context) => new HttpClientDemo()),
    new GalleryItem(
        title: 'PubHttp学习',
        subtitle: '网络请求框架Http',
        category: 'http',
        routeName: PubHttpDemo.routeName,
        buildRoute: (BuildContext context) => new PubHttpDemo()),
  ];


  //Basics Widget
  galleryItems.addAll(basics);
  //Materials Widget
  galleryItems.addAll(materials);
  //Animation
  galleryItems.addAll(anims);
  //添加路由解说
  galleryItems.addAll(routes);
  //网络请求
  galleryItems.addAll(https);
  //添加MVP demo
  galleryItems.add(
      new GalleryItem(
          title: 'MVP Demo',
          subtitle: 'MVP 简单的例子',
          category: 'mvp',
          routeName: ContactsPage.routeName,
          buildRoute: (BuildContext context) => new ContactsPage()));

  //添加国际化测试代码
  galleryItems.add(
      new GalleryItem(
          title: 'Internal Demo',
          subtitle: '国际化语言适配',
          category: 'internal',
          routeName: InternalTest.routeName,
          buildRoute: (BuildContext context) => new InternalTest()));


  // 保持Pesto的回归测试值。它不包括在(发布版本)中，性能测试。
  assert(() {
    //将其插入到第一条中
    galleryItems.insert(0,
      new GalleryItem(
        title: 'Pesto',
        subtitle: 'Simple recipe browser',
        category: 'Demos',
        routeName: PestoDemo.routeName,
        buildRoute: (BuildContext context) => const PestoDemo(),
      ),
    );
    return true;
  }());

  return galleryItems;
}

final List<GalleryItem> kAllGalleryItems = _buildGalleryItems();
