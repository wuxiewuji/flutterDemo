import 'package:flutter/material.dart';


///网络访问框架 http


class PubHttpDemo extends StatefulWidget {

  static final String routeName = '/http_pub';
  final String title = 'http 网络请框架';

  @override
  State<StatefulWidget> createState() => new _PubHttpState();
}

class _PubHttpState extends State<PubHttpDemo> {
  String content = '内容';


  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme
        .of(context)
        .textTheme
        .body1
        .copyWith(
        color: Colors.blue
    );
    return new Scaffold(
      appBar: new AppBar(title: new Text(widget.title, style: style,),),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Your current IP content is:'),
            new Text('$content.'),
            new RaisedButton(
              onPressed: _getContent,
              child: new Text('Get IP content'),
            ),
          ],
        ),
      ),
    );
  }

  void _getContent() {

  }
}