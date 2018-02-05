import 'package:flutter/material.dart';
import 'package:flutterDemo/demo/studywidget/template.dart';

///RaisedButton、FloatingActionButton、FlatButton、IconButton、ButtonBar学习
class ButtonDemo extends StatefulWidget {
  static const String routeName = '/button';
  final String title = 'ButtonDemo 控件';

  @override
  State<StatefulWidget> createState() => new _ButtonDemo();
}

class _ButtonDemo extends State<ButtonDemo> {
  String dropdown1Value = 'Free'; //这个值必须是item内的值
  String dropdown2Value; //没有值用书写的默认值,会色的
  String dropdown3Value = 'Four'; //这个值必须是item内的值

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
          primary: true,
        ),
        body: new Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 24.0, 24.0, 16.0),
          child: new ListView(
            children: <Widget>[
              //盒子布局
              new Container(
                height: 50.0,
                alignment: Alignment.center,
                child: new Text('FlatButton'),
              ),

              //监听事件不为空的时候就没有禁止FlatButton
              new FlatButton(
                //按钮按下动作时候的主色
                  splashColor: Colors.white,
                  //按钮按下后的颜色
                  highlightColor: Colors.red,
                  //按钮被禁止后使用的颜色
                  disabledColor: Colors.red[400],
                  //默认状态的颜色
                  color: Colors.green,
                  //未禁用时候的文字颜色
                  textColor: Colors.white,
                  //禁用后的文字颜色
                  disabledTextColor: Colors.black26,
                  /**
                   * 高亮时候的文字颜色选项
                   * Brightness.dark--颜色是暗的，需要一个浅色的文本颜色来达到可读性。
                      对比
                   * Brightness.light--颜色是光，并且需要一个黑色的文字颜色来达到可读。
                      对比
                   */
                  colorBrightness: Brightness.light,
                  /**
                   * 按钮的颜色文本方案
                   *   ButtonTextTheme.normal--按钮使用正常颜色
                   *   ButtonTextTheme.accent--按钮使用强调颜色
                   */
                  textTheme: ButtonTextTheme.accent,
                  //点击事件
                  onPressed: () {},
                  //包含的布局
                  child: new Text('可点击的FlatButton')),

              //盒子布局
              new SizedBox(
                height: 20.0,
              ),

              new FlatButton(
                //按钮按下动作时候的主色
                  splashColor: Colors.white,
                  //按钮按下后的颜色
                  highlightColor: Colors.red,
                  //按钮被禁止后使用的颜色
                  disabledColor: Colors.red[400],
                  //默认状态的颜色
                  color: Colors.green,
                  //未禁用时候的文字颜色
                  textColor: Colors.black,
                  //禁用后的文字颜色
                  disabledTextColor: Colors.black26,
                  /**
                   * 高亮时候的文字颜色选项
                   * Brightness.dark--颜色是暗的，需要一个浅色的文本颜色来达到可读性。
                      对比
                   * Brightness.light--颜色是光，并且需要一个黑色的文字颜色来达到可读。
                      对比
                   */
                  colorBrightness: Brightness.light,
                  /**
                   * 按钮的颜色文本方案
                   *   ButtonTextTheme.normal--按钮使用正常颜色
                   *   ButtonTextTheme.accent--按钮使用强调颜色
                   */
                  textTheme: ButtonTextTheme.accent,
                  onPressed: null,
                  child: new Text('禁止的FlatButton!')),

              new Divider(),
              //盒子布局
              new Container(
                height: 50.0,
                alignment: Alignment.center,
                child: new Text('IconButton'),
              ),

              new Card(
                color: Colors.grey,
                elevation: 8.0,
                //需要学习的控件
                child: new IconButton(
                  icon: new Icon(Icons.perm_camera_mic),
                  //点击显示的提示文字
                  tooltip: 'IconButton',
                  onPressed: () {
                    print('点击了 IconButton');
                  },
                  //如果启用图标,图标内使用的颜色
                  color: Colors.blue,
                  //Padding 值
                  padding: const EdgeInsets.all(12.0),
                  //图片放置的位置
                  alignment: Alignment.center,
                  //按钮被禁止后使用的颜色
                  disabledColor: Colors.grey,
                  //摁下后的的颜色
                  highlightColor: Colors.red[400],
                  //按下动作时候的颜色扩散
                  splashColor: Colors.white,
                  //图片大小
                  iconSize: 24.0,
                ),
              ),
              new Card(
                color: Colors.blue,
                elevation: 8.0,
                child: new IconButton(
                  icon: new Icon(Icons.query_builder),
                  //点击显示的提示文字
                  tooltip: 'IconButton',
                  //为空时禁止点击
                  onPressed: null,
                  //如果启用图标,图标内使用的颜色
                  color: Colors.blue,
                  //Padding 值
                  padding: const EdgeInsets.all(12.0),
                  //图片放置的位置
                  alignment: Alignment.center,
                  //按钮被禁止后使用的颜色
                  disabledColor: Colors.grey,
                  //摁下控件的颜色
                  highlightColor: Colors.red[400],
                  //涟漪效果的颜色
                  splashColor: Colors.white,
                  //图片大小
                  iconSize: 24.0,
                ),
              ),

              new Divider(),
              //盒子布局
              new Container(
                height: 50.0,
                alignment: Alignment.center,
                child: new Text('RaisedButton'),
              ),
              new RaisedButton(
                //触摸是件
                onPressed: () {
                  print('点击红色按钮事件');
                },
                //控件z轴高度
                elevation: 8.0,
                //本控件是用的主题亮度
                colorBrightness: Brightness.dark,
                //禁用此按钮时候的颜色
                disabledColor: Colors.grey,
                //禁用此按钮是后的高度
                disabledElevation: 2.0,
                //高亮的时候的颜色
                highlightColor: Colors.red,
                //高亮时候的高度
                highlightElevation: 12.0,
                //点击涟漪效果的颜色
                splashColor: Colors.white,
                //默认状态的颜色
                color: Colors.blue,
                child: new Text('RaisedButton可点击'),
              ),
              new SizedBox(
                height: 20.0,
              ),
              new RaisedButton(
                //触摸是件
                onPressed: null,
                //控件z轴高度
                elevation: 8.0,
                //本控件是用的主题亮度
                colorBrightness: Brightness.dark,
                //禁用此按钮时候的颜色
                disabledColor: Colors.grey,
                //禁用此按钮是后的高度
                disabledElevation: 2.0,
                //高亮的时候的颜色
                highlightColor: Colors.red,
                //高亮时候的高度
                highlightElevation: 12.0,
                //点击涟漪效果的颜色
                splashColor: Colors.white,
                //默认状态的颜色
                color: Colors.blue,
                child: new Text('RaisedButton不可点击'),
              ),
              new Divider(),
              //盒子布局
              new Container(
                height: 50.0,
                alignment: Alignment.center,
                child: new Text('DropdownButton'),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  //创建一个下拉按钮
                  new DropdownButton<String>(
                    //下拉按钮的当前值
                    value: dropdown1Value,
                    //没有当前值时候的显示
                    hint: const Text('Choose'),
                    //点击事件
                    onChanged: (String newValue) {
                      setState(() {
                        dropdown1Value = newValue;
                      });
                    },
                    //下拉列表Widget,,,集合的遍历返回超级写法
                    items: <String>['One', 'Two', 'Free', 'Four'].map((
                        String value) {
                      //下拉列表的Item Widget
                      return new DropdownMenuItem<String>(
                        //当前布局的值
                        value: value,
                        //当前布局
                        child: new Text(value),
                      );
                    }).toList(),

                    elevation: 8,
                    //打开时菜单的阴影z轴高度
                    isDense: true,
                    //紧凑值,true时候z轴高度是大约一半
                    iconSize: 24.0,
                    //用于下拉是的按钮的大小
                    style: Theme
                        .of(context)
                        .textTheme
                        .subhead, //布局的TextStyle,这里是默认值
                  ),
                  //创建一个下拉按钮
                  new DropdownButton<String>(
                    //下拉按钮的当前值
                    value: dropdown2Value,
                    //没有当前值时候的显示
                    hint: const Text('Choose'),
                    //点击事件
                    onChanged: (String newValue) {
                      setState(() {
                        dropdown2Value = newValue;
                      });
                    },
                    //下拉列表Widget,,,集合的遍历返回超级写法
                    items: <String>['One', 'Two', 'Free', 'Four'].map((
                        String value) {
                      //下拉列表的Item Widget
                      return new DropdownMenuItem<String>(
                        //当前布局的值
                        value: value,
                        //当前布局
                        child: new Text(value),
                      );
                    }).toList(),
                  ),
                  //创建一个下拉按钮
                  new DropdownButton<String>(
                    //下拉按钮的当前值
                    value: dropdown3Value,
                    //没有当前值时候的显示
                    hint: const Text('Choose'),
                    //点击事件
                    onChanged: (String newValue) {
                      setState(() {
                        dropdown3Value = newValue;
                      });
                    },
                    //下拉列表Widget,,,集合的遍历返回超级写法
                    items: <String>[
                      'One',
                      'Two',
                      'Free',
                      'Four',
                      'Can',
                      'I',
                      'Have',
                      'A',
                      'Little',
                      'Bit',
                      'More',
                      'Five',
                      'Six',
                      'Seven',
                      'Eight',
                      'Nine',
                      'Ten'
                    ].map((String value) {
                      //下拉列表的Item Widget
                      return new DropdownMenuItem<String>(
                        //当前布局的值
                        value: value,
                        //当前布局
                        child: new Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),

              new Divider(),
              //盒子布局
              new Container(
                height: 50.0,
                alignment: Alignment.center,
                child: new Text('ButtonBar'),
              ),
            //水平排布,一般用于在Dialog底部显示的按钮,内部是Padding 和Row的组合控件,
              new ButtonBar(
                alignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new Center(
                    child: new FloatingActionButton(
                      //当点击按钮的时候显示的提示
                      tooltip: '增加',
                      //floatingActionButton的显示图标
                      child: new Icon(Icons.add),
                      //背景颜色
                      backgroundColor: Colors.blue,
                      //默认的z轴高度
                      elevation: 6.0,
                      //触摸时z轴高度
                      highlightElevation: 12.0,
                      heroTag: null,
                      mini: true,
                      //是否显示迷你形态.这里一般默认是false
                      //点击事件
                      onPressed: () {
                        // Perform some action
                      },
                    ),
                  ),
                  new Center(
                    child: new FloatingActionButton(
                      tooltip: '增加',
                      //当点击按钮的时候显示的提示
                      child: new Icon(Icons.add_a_photo),
                      //按钮的标记
                      heroTag: null,
                      //floatingActionButton的显示图标
                      //点击事件
                      onPressed: (){

                      },
                      backgroundColor: Colors.red, //背景颜色
                    ),
                  ),
                  new Center(
                    child: new FloatingActionButton(
                      tooltip: '增加',
                      //当点击按钮的时候显示的提示
                      child: new Icon(Icons.sentiment_very_satisfied),
                      //floatingActionButton的显示图标
                      //点击事件
                      onPressed: null,
                      backgroundColor: Colors.red, //背景颜色
                    ),
                  )
                ],
              ),

            ],
          ),
        )
    );
  }
}