
import 'package:flutter/material.dart';


//BottomSheet学习
class BottomSheetDemo extends StatefulWidget {
  static const String routeName = '/bottomsheet';
  final String title = 'BottomSheet 底部弹出控件学习';

  @override
  State<StatefulWidget> createState() => new _BottomSheetDemo();
}

class _BottomSheetDemo extends State<BottomSheetDemo> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
            title: new Text(widget.title)
        ),
        body: new ListView(
          children: <Widget>[
            new Center(
                child: new RaisedButton(
                    child: new Text('持久显示底部控件'),
                    onPressed: _showBottomSheetCallback
                )
            ),
            /**
             * Scaffold.of(context)--不能直接在Scaffold内部其他子类里使用,必须要重新构建Builder
             */
            new Builder(builder: (BuildContext context) {
             return _showBottomSheet(context);
            }),
            new Center(
                child: new RaisedButton(
                    child: new Text('创建模态底部控件'),
                    onPressed: _showModalBottomSheet
                )
            ),
          ],
        )
    );
  }

  //直接showBottomSheet方式
  Widget _showBottomSheet(BuildContext context){
    return new RaisedButton(
        child: new Text('Scaffold.of(context)形式创建'),
        onPressed: () {
          showBottomSheet(context: context, builder: (BuildContext context) {
            return new Container(
                child: new Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: new Text(
                        '''
                        PersistentBottomSheetController<T> showBottomSheet<T>({
                           @required BuildContext context,
                           @required WidgetBuilder builder,
                            }) {
                          assert(context != null);
                          assert(builder != null);
                         return Scaffold.of(context).showBottomSheet<T>(builder);}
                        ''',
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            color: Theme
                                .of(context)
                                .accentColor,
                            fontSize: 16.0
                        )
                    )
                )
            );
          });
        });
  }

  //showModalBottomSheet方式--创建的是模态,遮挡的有阴影,点击会消失的底部品布局
  void _showModalBottomSheet() {
    showModalBottomSheet<String>(
        context: context, builder: (BuildContext context) {
      return new Container(
          child: new Padding(
              padding: const EdgeInsets.all(32.0),
              child: new Text(
                  '这是模态底部面板，点击任意位置即可关闭阿达萨达啊实打实大师大师大所萨达萨达撒大所多萨达所大所',
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      color: Theme
                          .of(context)
                          .accentColor,
                      fontSize: 24.0
                  )
              )
          )
      );
    });
  }

  //_scaffoldKey.currentState.showBottomSheet方式创建底部
  void _showBottomSheetCallback() {
    /**
     * 持久显示底部控件,不遮挡不出现阴影不点击其他区域消失
     *  _scaffoldKey.currentState.showBottomSheet---
     *  Scaffold中不能直接使用Scaffold.of()--需要在Scaffold中使用build构建
     */
    _scaffoldKey.currentState
        .showBottomSheet<String>((BuildContext context) {
      final ThemeData themeData = Theme.of(context);
      return new Container(
          decoration: new BoxDecoration(
              border: new Border(
                  top: new BorderSide(color: themeData.disabledColor))
          ),
          child: new Padding(
              padding: const EdgeInsets.all(32.0),
              child: new RaisedButton(
                  child: new Text('这是一个持久性的底部面板，向下拖动即可将其关闭'),
                  onPressed: () {
                    Navigator.pop(context, '点击关闭了');
                  })
          )
      );
    });
  }
}