////CheckBoxDemo教程


import 'package:flutter/material.dart';


class ChipDemo extends StatefulWidget {
  static const String routeName = '/chip';
  final String title = 'Chip 控件';

  @override
  State<StatefulWidget> createState() => new _ChipDemo();
}

class _ChipDemo extends State<ChipDemo> {
  bool _showBananas = true;

  void _deleteBananas() {
    setState(() {
      _showBananas = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> chips = <Widget>[
      new Chip(
        //标记之前显示的布局,一般用行包裹比较好看
        avatar: new CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          child: new Text('AB'),
        ),
        //标签文字
        label: new Text('Aaron Burr'),
        //删除按钮的颜色
        deleteIconColor: Colors.red,
        //长按删除按钮的提示
        deleteButtonTooltipMessage: '删除的提示',
        //边框--StadiumBorder这个是默认的边框,两边带圆弧的
        border: const StadiumBorder(),
        backgroundColor: Colors.grey,
//                labelStyle: ,//TextStyle
        //删除标记(点击删除的操作)
        onDeleted: () {
          print('asd');
        },
      ),
      const Chip(
          label: const Text('Apple')
      ),
      const Chip(
        avatar: const CircleAvatar(child: const Text('B')),
        label: const Text('Blueberry'),
      ),

    ];

    if (_showBananas) {
      chips.add(new Chip(
          label: const Text('Bananas'),
          onDeleted: _deleteBananas
      ));
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        primary: true,
      ),
      body: new ListView(
          children: chips.map((Widget chip) {
            return new SizedBox(
                height: 100.0,
                child: new Center(child: chip)
            );
          }).toList()
      ),
    );
  }
}
