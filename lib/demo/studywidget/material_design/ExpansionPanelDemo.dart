///ExpansionPanel学习


import 'package:flutter/material.dart';


class ExpansionPanelDemo extends StatefulWidget {
  static const String routeName = '/expansionpanel';
  final String title = 'ExpansionPanel 下拉列表';

  @override
  State<StatefulWidget> createState() => new _ExpansionPanelDemo();
}

class _ExpansionPanelDemo extends State<ExpansionPanelDemo> {
  bool isExpanded1 = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;

  Widget headerBuilder1(BuildContext context, bool isExpanded) {
    print("headerBuilder_isExpanded:" + isExpanded.toString());
    return new Center(child: new Text('head1'),);
  }

  Widget headerBuilder2(BuildContext context, bool isExpanded) {
    print("headerBuilder_isExpanded:" + isExpanded.toString());
    return new Center(child: new Text('head2'),);
  }

  Widget headerBuilder3(BuildContext context, bool isExpanded) {
    print("headerBuilder_isExpanded:" + isExpanded.toString());
    return new Center(child: new Text('head3'),);
  }

  @override
  Widget build(BuildContext context) {


    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Container(

        child: new SingleChildScrollView(
          //ExpansionPanelList外部必须有包裹,切必须有在主轴的方向控制的控件内部才能被显示出来
          child: new ExpansionPanelList(
            //点击的回调
            expansionCallback: (int panelIndex, bool isExpanded) {
              print("bibibi_panelIndex :" + panelIndex.toString() + "isExpanded:" +
                  isExpanded.toString());
              setState(() {
                if (panelIndex == 0) {
                  isExpanded1 = !isExpanded;
                }
                if (panelIndex == 1) {
                  isExpanded2 = !isExpanded;
                }
                if (panelIndex == 2) {
                  isExpanded3 = !isExpanded;
                }
              });
            },
            //动画时长
            animationDuration: Duration.zero,
            //子类
            children: <ExpansionPanel>[
              new ExpansionPanel(
                  headerBuilder: headerBuilder1,
                  body: new Text('我要我要我要可见'), //只有当面板展开的时候才可见的布局
                  isExpanded: isExpanded1
              ),
              new ExpansionPanel(
                  headerBuilder: headerBuilder2,
                  body: new Text('我要我要我要可见'), //只有当面板展开的时候才可见的布局
                  isExpanded: isExpanded2
              ),
              new ExpansionPanel(
                  headerBuilder: headerBuilder3,
                  body: new Text('我要我要我要可见'), //只有当面板展开的时候才可见的布局
                  isExpanded: isExpanded3
              ),
            ],
          ),
        )
      )
    );
  }
}