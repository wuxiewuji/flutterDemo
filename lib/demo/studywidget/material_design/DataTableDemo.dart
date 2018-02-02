import 'package:flutter/material.dart';

///DataTable基础应用,这个列表的缺点是创建列表时候布局会重复刷新两次
///如果你又很多数据推荐使用PaginatedDataTable
class DataTableDemo extends StatefulWidget {
  static const String routeName = '/data_table';
  final String title = 'DataTable 控件';

  @override
  State<StatefulWidget> createState() => new _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  bool sNameAscending=false;
  bool sLanguagesAscending=false;
  bool sMathematicalAscending=false;
  bool sEnglishAscending=false;
  bool sScienceAscending=false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView(

        children: <Widget>[
          new Container(
            height: 30.0,
            alignment: Alignment.center,
            child: new Text('DataTab 案例一'),
          ),
          //简单的表格,
          new DataTable(
            //列数据
            columns: <DataColumn>[
              new DataColumn(
                  tooltip: '长按的标签提示',
                  numeric: false,
                  //排序的要求
                  //columnIndex第几列
                  //ascending是否升序
                  onSort: (int columnIndex, bool ascending) {
                    print('对学生姓名按列数据进行${ascending ? '升序' : '降序'}排列');
                  },
                  //当前表格的内容
                  label: new Text('学生姓名')),
              new DataColumn(
                  tooltip: '长按的标签提示',
                  numeric: false,
                  //排序的要求
                  //columnIndex第几列
                  //ascending是否升序
                  onSort: (int columnIndex, bool ascending) {
                    print('对语文绩按列数据进行${ascending ? '升序' : '降序'}排列');
                  },
                  //当前表格的内容
                  label: new Text('语文')),
              new DataColumn(
                  tooltip: '长按的标签提示',
                  numeric: false,
                  //排序的要求
                  //columnIndex第几列
                  //ascending是否升序
                  onSort: (int columnIndex, bool ascending) {
                    print('对数学绩按列数据进行${ascending ? '升序' : '降序'}排列');
                  },
                  //当前表格的内容
                  label: new Text('数学')),
              new DataColumn(
                  tooltip: '长按的标签提示',
                  numeric: false,
                  //排序的要求
                  //columnIndex第几列
                  //ascending是否升序
                  onSort: (int columnIndex, bool ascending) {
                    print('对英语绩按列数据进行${ascending ? '升序' : '降序'}排列');
                  },
                  //当前表格的内容
                  label: new Text('英语')),
              new DataColumn(
                  tooltip: '长按的标签提示',
                  numeric: false,
                  //排序的要求
                  //columnIndex第几列
                  //ascending是否升序
                  onSort: (int columnIndex, bool ascending) {
                    print('对理综绩按列数据进行${ascending ? '升序' : '降序'}排列');
                  },
                  //当前表格的内容
                  label: new Text('理综')),

            ],
            //行数据
            rows: _desserts.map((Student s) {
              return new DataRow(
                //是否选择行
                  selected: s.selected,
                  //点击更改当前行是否被选中的状态
                  onSelectChanged: (bool b) {
                    print(b);
                    setState(() {
                      s.selected = b;
                    });
                  },
                  cells: <DataCell>[
                    new DataCell(
                      new Text(s.name),
                      //这里可以设计成点击变成输入文本,修改内容
                      onTap: () {
                        print(s.name);
                      },
                      //是否是占位符,如果是占位符,标记成灰色
                      placeholder: false,
                      //是否在单元格的末尾行显示一个编译符
                      showEditIcon: true,
                    ),
                    new DataCell(
                      new Text(s.languages.toString()),
                      onTap: () {
                        print('${s.languages}分');
                      },
                    ),
                    new DataCell(new Text('${s.mathematical}')),
                    new DataCell(new Text('${s.english}')),
                    new DataCell(new Text('${s.science}')),
                  ]);
            }).toList(),
            //点击是否全选或者全部不选
            onSelectAll: (bool b) {
              setState(() {
                _desserts.map((s) {
                  return s.selected = b;
                }).toList();
              });
            },
            //当前提到的主升级列为第0列
            sortColumnIndex: 1,
            //是否对上面提到的主升级列进行排序或者降序排序
            sortAscending: true,
          )
        ],
      ),
    );
  }
}


final List<Student> _desserts = <Student>[
  new Student('小红', 110, 135, 90, 230,),
  new Student('小明', 135, 101, 143, 194,),
  new Student('小哎', 120, 127, 101, 226,),
  new Student('小新', 107, 139, 111, 190,),
];
//创建模拟的实体数据
class Student {
  Student(this.name, this.languages, this.mathematical, this.english,
      this.science, {this.selected: false});

  String name;
  final int languages; //语文
  final int mathematical; //数学
  final int english; //英语
  final int science; //理综
  bool selected;
}