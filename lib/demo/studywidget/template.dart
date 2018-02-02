//模板 类


import 'package:flutter/material.dart';
import 'package:meta/meta.dart';


class Demoless extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const Demoless({ this.title,
    this.children,
    Key key })
      : assert(children != null && title != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => _buildWidget(title,children);
}

Widget _buildWidget(String title, List<Widget> children) {
  return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
        primary: true,
      ),
      body: new Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 24.0, 24.0, 16.0),
        child: new ListView(
          children: children,
        ),
      )
  );
}

class Demoful extends StatefulWidget {
  static const String routeName = '/text_field';
  final String title;
  final List<Widget> children;
  const Demoful({ this.title,
    this.children,
    Key key })
      : assert(children != null && title != null),
        super(key: key);

  @override
  _Demoful createState() => new _Demoful();

}


class _Demoful extends State<Demoful> {

  @override
  Widget build(BuildContext context) =>_buildWidget(widget.title,widget.children);
}


abstract class IWidgetLess {
  Widget child();
}