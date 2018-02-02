import 'package:flutter/material.dart';
import 'package:flutter_learning_demo/demo/internationalization/DemoLocalizations.dart';


class InternalTest extends StatefulWidget{
  static const String routeName = '/internal_test';

  @override
  State<StatefulWidget> createState() => new _InternalTestState();
}

class _InternalTestState extends State<InternalTest> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(DemoLocalizations.of(context).internalTitle),
      ),
    );
  }
}