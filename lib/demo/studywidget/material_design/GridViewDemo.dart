import 'package:flutter/material.dart';


class GridViewDemo extends StatefulWidget {
  static const String routeName = '/gridview';
  final String title = 'GridView 列表';

  @override
  State<StatefulWidget> createState() => new _GridViewDemo();
}

const double _kMinFlingVelocity = 800.0;
//图片的包名
const String _kGalleryAssetsPackage = 'flutter_gallery_assets';
//官方列子中的实体类
class Photo {
  Photo({
    this.assetName,
    this.assetPackage,
    this.title,
    this.caption,
    this.isFavorite: false,
  });

  final String assetName;
  final String assetPackage;
  final String title;
  final String caption;

  bool isFavorite;

  String get tag => assetName; // Assuming that all asset names are unique.

  bool get isValid =>
      assetName != null && title != null && caption != null &&
          isFavorite != null;
}

List<Photo> photos = <Photo>[
  new Photo(
    assetName: 'landscape_0.jpg',
    assetPackage: _kGalleryAssetsPackage,
    title: 'Philippines',
    caption: 'Batad rice terraces',
  ),
  new Photo(
    assetName: 'landscape_1.jpg',
    assetPackage: _kGalleryAssetsPackage,
    title: 'Italy',
    caption: 'Ceresole Reale',
  ),
  new Photo(
    assetName: 'landscape_2.jpg',
    assetPackage: _kGalleryAssetsPackage,
    title: 'Somewhere',
    caption: 'Beautiful mountains',
  ),
  new Photo(
    assetName: 'landscape_3.jpg',
    assetPackage: _kGalleryAssetsPackage,
    title: 'A place',
    caption: 'Beautiful hills',
  ),
  new Photo(
    assetName: 'landscape_4.jpg',
    assetPackage: _kGalleryAssetsPackage,
    title: 'New Zealand',
    caption: 'View from the van',
  ),
  new Photo(
    assetName: 'landscape_5.jpg',
    assetPackage: _kGalleryAssetsPackage,
    title: 'Autumn',
    caption: 'The golden season',
  ),
  new Photo(
    assetName: 'landscape_6.jpg',
    assetPackage: _kGalleryAssetsPackage,
    title: 'Germany',
    caption: 'Englischer Garten',
  ),
  new Photo(
    assetName: 'landscape_7.jpg',
    assetPackage: _kGalleryAssetsPackage,
    title: 'A country',
    caption: 'Grass fields',
  ),
  new Photo(
    assetName: 'landscape_8.jpg',
    assetPackage: _kGalleryAssetsPackage,
    title: 'Mountain country',
    caption: 'River forest',
  ),
  new Photo(
    assetName: 'landscape_9.jpg',
    assetPackage: _kGalleryAssetsPackage,
    title: 'Alpine place',
    caption: 'Green hills',
  ),
  new Photo(
    assetName: 'landscape_10.jpg',
    assetPackage: _kGalleryAssetsPackage,
    title: 'Desert land',
    caption: 'Blue skies',
  ),
  new Photo(
    assetName: 'landscape_11.jpg',
    assetPackage: _kGalleryAssetsPackage,
    title: 'Narnia',
    caption: 'Rocks and rivers',
  ),

];

class _GridViewDemo extends State<GridViewDemo> {
  Axis scrollDirection = Axis.vertical;
  int countType = 2; //默认--GridView.count

  //跳转到新页面
  void showPhoto(BuildContext context, Photo photo) {
    Navigator.push(context, new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new Scaffold(
            appBar: new AppBar(
                title: new Text(photo.title)
            ),
            body: new SizedBox.expand(
              child: new Hero(
                tag: photo.tag,
                child: new Image.asset(
                  photo.assetName,
                  package: photo.assetPackage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        }
    ));
  }

  @override
  Widget build(BuildContext context) {
    //获取媒体是否处于横屏或者竖屏模式
    final Orientation orientation = MediaQuery
        .of(context)
        .orientation;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        actions: <Widget>[
          new PopupMenuButton(
            itemBuilder: (BuildContext context) =>
            <PopupMenuItem<int>>[
              new PopupMenuItem(
                value: 0,
                child: new Text('竖向排布'),
                enabled: true, //是否允许用户选择此项
                height: 48.0, //高度默认值为48.0
              ),
              new PopupMenuItem(
                  value: 1,
                  child: new Text('横向排布')),
              new PopupMenuItem(
                  value: 2,
                  child: new Text('GridView.count')),
              new PopupMenuItem(
                  value: 3,
                  child: new Text('GridView.extent')),
            ],
            onSelected: (s) {
              setState(() {
                //方向控制
                if (s == 0)
                  scrollDirection = Axis.vertical;
                if (s == 1) {
                  scrollDirection = Axis.horizontal;
                }
                if (s == 2) {
                  countType = 2;
                }
                if (s == 3) {
                  countType = 3;
                }
              });
            },
          )
        ],
      ),

      /**
       *    委托(控件中控制子元素布局的委托):SliverGridDelegate:的子类官方文档只有
       *    SliverGridDelegateWithFixedCrossAxisCount:滚动垂直方向上固定数量
       *    --GridView.count
       *    SliverGridDelegateWithMaxCrossAxisExtent:滚动垂直方向上最大孩子数量
       *    -- GridView.extent
       *    内置GridView实现方式:
       *    --GridView.count
       *    --GridView.extent
       *    --GridView.builder
       *    --GridView.custom
       *    --GridView()
       */
      body: _gridView(orientation, context),
    );
  }

  //活不不同样式的GrideView
  GridView _gridView(Orientation orientation, BuildContext context) {
    //GridView.count
    if (countType == 2) {
      return new GridView.count(
        scrollDirection: scrollDirection,
        //滚动垂直方向上孩子的数量
        crossAxisCount: 3,
        //沿着滚动方向每个子节点之间的逻辑像素个数(间距)
        mainAxisSpacing: 4.0,
        //垂直滚动方向每个子节点之间的逻辑像素个数(间距)。
        crossAxisSpacing: 4.0,
        //每个孩子的横轴与主轴的比例。宽高比
        childAspectRatio: (orientation == Orientation.portrait) ? 1.0 : 1.3,
        children: _photoViews(context),
      );
    }
    //GridView.extent
    if (countType == 3) {
      return new GridView.extent(
        //间距
        padding: const EdgeInsets.all(8.0),
        //滚动视图滚动方向
        scrollDirection: scrollDirection,
        //每个孩子的横轴与主轴的比例。宽高比
        childAspectRatio: (orientation == Orientation.portrait) ? 1.0 : 1.3,
        //横轴上每个子节点之间的逻辑像素个数(间距)。
        crossAxisSpacing: 4.0,
        //沿着主轴的每个子节点之间的逻辑像素个数(间距)
        mainAxisSpacing: 4.0,
        //十字轴上的瓦片的最大范围
        maxCrossAxisExtent: 300.0,
        //需要显示的布局集合
        children: _photoViews(context),
      );
    }
    return null;
  }

  //获取布局
  List<GestureDetector> _photoViews(BuildContext context) =>
      photos.map((photo) {
        return new GestureDetector(
          onTap: () {
            showPhoto(context, photo);
          },
          child: new Image.asset(
            photo.assetName,
            package: photo.assetPackage,
            fit: BoxFit.cover,
          ),
        );
      }).toList();
}