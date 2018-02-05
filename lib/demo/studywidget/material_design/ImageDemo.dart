import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutterDemo/demo/studywidget/template.dart';


class ImageDemo extends IWidgetLess {
  static const String routeName = '/image';
  final String title = 'Image 案例';

  @override
  Widget child() {
    // TODO: implement child
    return new Demoless(
      title: title,
      children: <Widget>[
        new Image(
          // 识别图像，并根据环境(例如设备像素比)对精确的图像(获取:文件中获取、Asset中获取、网络中获取)加载以及解析。
          //
          /**
           * AssetBundleImageProvider--Image.asset-asset中获取
           *      实现类:AssetImage ExactAssetImage
           * FileImage--Image.file--文件中获取，访问本地磁盘文件
           * MemoryImage--Image.memory--将Uint8List解码成ImageStream
           * NetworkImage--Image.network--网络中获取
           */
          image: new NetworkImage(
              'http://img.zcool.cn/community/01690955496f930000019ae92f3a4e.jpg'),
          height: 600.0,
          width: 300.0,
          alignment: Alignment.center,
          /**
           *  如何将图像嵌入到布局中分配的空间中
           *  BoxFit.fill:扭曲图片已达到填充满控件的效果
           *  BoxFit.contain尽可能的大，同时仍然包含在源目标框。(尽可能大不超出边框)
           *  ...
           */
          fit: BoxFit.contain,
          color: Colors.blue,
          //颜色在图片上的混合方式太多了自己调配
          /**
           * clear
           */
          colorBlendMode: BlendMode.colorDodge,
          //当图像发生改变的时候是否显示就图像
//          gaplessPlayback:false,
          //是否将图像绘制在文本方向
          matchTextDirection: false,
          //包含文件的包名
//          package:,
          //如何绘制一个没有被图像填满的盒子的其他区域
          /**
           * ImageRepeat.noRepeat:未覆盖的区域透明化
           * ImageRepeat.repeat:xy轴方向都重复绘制图像
           * ImageRepeat.repeatx:x轴方向都重复绘制图像
           * ImageRepeat.repeaty:y轴方向都重复绘制图像
           */
          repeat: ImageRepeat.repeat, //
        ),
        new Image.network(
          'http://4493bz.1985t.com/uploads/allimg/160628/3-16062Q33U6.jpg',
          //Image网络地址的请求头
//          headers:,
          //缩放比例
          scale:1.0,
        ),
        /**
         * name:名字--其实名字和包名都可以不是固定的,可以直接把路径写在name下面,来省略package属性
         * flutter_gallery_assets/shrine/products/backpack.png
         * package:包名
         */
        new Image.asset('products/backpack.png', package: 'flutter_gallery_assets/shrine'),
        //找不到案例
//        new Image.memory(bytes),

//        new Image.file(file)
      ],
    );
  }


}
