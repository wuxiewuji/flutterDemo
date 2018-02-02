import 'dart:async';

///时间显示选着器


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeAndDatePicker extends StatefulWidget {
  static const String routeName = '/time_and_date_picker';
  final String title = '时间日期选择控件';

  @override
  State<StatefulWidget> createState() => new _TimeAndDatePicker();
}

class _TimeAndDatePicker extends State<TimeAndDatePicker> {
   DateTime selectedDate =new DateTime.now();
   TimeOfDay selectedTime = const TimeOfDay(hour: 7, minute: 28);

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: new DateTime(2015, 8),
        lastDate: new DateTime(2101)
    );
    if (picked != null && picked != selectedDate){
      setState((){
        selectedDate=picked;
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: selectedTime
    );
    if (picked != null && picked != selectedTime)
      setState((){
        selectedTime=picked;
      });
  }
  @override
  Widget build(BuildContext context) {
    final TextStyle valueStyle = Theme.of(context).textTheme.title;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          new Expanded(
            flex: 4,
            child: new _InputDropdown(
              labelText: 'Date',
              valueText: new DateFormat.yMMMd().format(selectedDate),
              valueStyle: valueStyle,
              onPressed: () { _selectDate(context); },
            ),
          ),
          const SizedBox(width: 12.0),
          new Expanded(
            flex: 3,
            child: new _InputDropdown(
              labelText: 'time',
              valueText: selectedTime.format(context),
              valueStyle: valueStyle,
              onPressed: () { _selectTime(context); },
            ),
          ),
        ],
      ),
    );
  }
}

class _InputDropdown extends StatelessWidget {
  const _InputDropdown({
    Key key,
    this.child,
    this.labelText,
    this.valueText,
    this.valueStyle,
    this.onPressed }) : super(key: key);

  final String labelText;
  final String valueText;
  final TextStyle valueStyle;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    /**
     * 能够回应区域触摸事件的控件(区域:因此可以内部添加很多很对布局)
     */
    return new InkWell(
      onTap: onPressed,
      child: new InputDecorator(
        decoration: new InputDecoration(
          labelText: labelText,
        ),
        baseStyle: valueStyle,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Text(valueText, style: valueStyle),
            new Icon(Icons.arrow_drop_down,
                color: Theme.of(context).brightness == Brightness.light ? Colors.grey.shade700 : Colors.white70
            ),
          ],
        ),
      ),
    );
  }
}