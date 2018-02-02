import 'package:flutter/material.dart';

///步进器
class StepperDemo extends StatefulWidget {
  static const String routeName = '/snackbar';
  final String title = 'SnackBar 控件';

  @override
  State<StatefulWidget> createState() => new _StepperDemo();
}

class _StepperDemo extends State<StepperDemo> {
  int step = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Stepper(
        //确定步进器的类型,垂直的还是水平的
          type: StepperType.horizontal,
          //初始步进器的进行到第几步,必须小于计步器的步数
          currentStep: step,
          //调用取消按钮时候调用的回调
          onStepCancel: () {
            print(' 调用了取消');
          },
          //调用继续按钮时候调用的回调
          onStepContinue: () {
            print('继续进行到下一步');
            setState(() {
              if (step < 1)
                step += 1;
            });
          },
          //点击某一步时候的回调
          onStepTapped: (index) {
            print('点击$index步');
            setState((){
              step=index;
            });
          },
          steps: <Step>[
            new Step(
              //当前步是否是被选择的
                isActive: false,
                /**
                 * 圆圈中显示的是StepState.disabled:1.2.3...数字文字不高亮显示
                 * 圆圈中显示的是StepState.complete:勾数字
                 * 圆圈中显示的是StepState.editing:编辑图标
                 * 圆圈中显示的是StepState.error:错误图标,且整个步骤显示错误的红色提示
                 * 圆圈中显示的是StepState.indexed:数字,且文字高亮显示
                 */
                state: StepState.indexed,
                title: new Text('第一步'),
                subtitle: new Text('第一步 副标题'),
                //显示在标题和副标题下面的内容,每一个内容下都有继续和取消的按钮
                content: new Text('第一步内容')
            ),
            new Step(title: new Text('第二步'), content: new Text('第二步内容')),
          ]),
    );
  }
}