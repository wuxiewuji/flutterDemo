//SwitchDemo学习


import 'package:flutter/material.dart';


class SliderDemo extends StatefulWidget {
  static const String routeName = '/slider';
  final String title = 'Slider 进度条 控件';


  @override
  _SliderDemo createState() => new _SliderDemo();
}


class _SliderDemo extends State<SliderDemo> {
  double _value1;
  double _value2;


  @override
  void initState() {
    super.initState();
    _value1 = 0.0;
    _value2 = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(''),
          primary: true,
        ),
        body: new Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 24.0, 24.0, 16.0),
            child: new Center(
              child: new ListView(
                  children: <Widget>[
                    new Slider(
                      //当前的进度值
                      value: _value1,
                      //触摸滑动事件
                      onChanged: (double pro) {
                        print(pro);
                        setState(() {
                          _value1 = pro;
                        });
                      },
                      //离散值,相当于选中的时候把slider分成一段一段的,而且拖动的时候也只能一段一段的动
                      divisions: 10,
//                inactiveColor: ,//没有被选中时候的颜色
//                activeColor: ,//活动时候的颜色
                      //滑块处于活动的时候在滑块上显示活动的标签
                      label: _value1.toInt().toString(),
                      max: 100.0,
                      min: .0,
                      thumbOpenAtMin: true, //当滑块处于最小值的时候,拇指摁下是否是个空心圆
                    ),
                    //当onChanged为空的时候,滑块默认不可滑动,
                    const Slider(value: 0.25, thumbOpenAtMin: true, onChanged: null),

                    new Slider(
                        value: _value2,
                        min: 0.0,
                        max: 100.0,
                        //当滑块处于最小值的时候,拇指摁下是否是个空心圆
                        thumbOpenAtMin: false,
                        onChanged: (double value) {
                          setState(() {
                            _value2 = value;
                          });
                        }
                    ),
                  ]
              ),
            )
        )
    );
  }
}