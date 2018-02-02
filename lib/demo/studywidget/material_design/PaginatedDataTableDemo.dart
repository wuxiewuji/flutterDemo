import 'package:flutter/material.dart';


//多数据的表结构推荐使用PaginatedDataTable
class PaginatedDataTableDemo extends StatefulWidget {
  static const String routeName = '/paginated_data_table';
  final String title = 'PaginatedDataTable';

  @override
  State<StatefulWidget> createState() => new _PaginatedDataTableDemo();

}

class _PaginatedDataTableDemo extends State<PaginatedDataTableDemo> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;
  final DessertDataSource _dessertsDataSource = new DessertDataSource();

  void _sort<T>(Comparable<T> getField(Dessert d), int columnIndex,
      bool ascending) {
    _dessertsDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView(
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          new PaginatedDataTable(
              header: const Text('Nutrition'),
              //用户选择或取消某一行时候的调用
              onSelectAll: _dessertsDataSource._selectAll,
              //选择升序或者降序的列
              sortColumnIndex: _sortColumnIndex,
              //是否对sortColumnIndex列进行升降序
              sortAscending: _sortAscending,
              actions: <Widget>[],
              //每一页显示的行数
              rowsPerPage: _rowsPerPage,
              //每页可显示的行数发生改变
              onRowsPerPageChanged: (int value) {setState(() { _rowsPerPage = value;});},
              //为每页显示的行数rowsPerPage提供下拉列表选项,选择这里面的值进行每页可以显示多少行进行修改
              //不写有默认值可以进行操作
//              availableRowsPerPage: <int>[10, 20, 30, 40],
              //首次创建部件时候显示第几页
              initialFirstRowIndex: 5,
              //切换页数时候调用.index为切换页数后第一行的索引
              onPageChanged: (index) {

              },
              columns:
              <DataColumn>[
                new DataColumn(
                    label: const Text('Dessert (100g serving)'),
                    onSort: (int columnIndex, bool ascending) =>
                        _sort<String>((Dessert d) => d.name, columnIndex,
                            ascending)
                ),
                new DataColumn(
                    label: const Text('Calories'),
                    tooltip: 'The total amount of food energy in the given serving size.',
                    numeric: true,
                    onSort: (int columnIndex, bool ascending) =>
                        _sort<num>((Dessert d) => d.calories, columnIndex,
                            ascending)
                ),
                new DataColumn(
                    label: const Text('Fat (g)'),
                    numeric: true,
                    onSort: (int columnIndex, bool ascending) =>
                        _sort<num>((Dessert d) => d.fat, columnIndex, ascending)
                ),
                new DataColumn(
                    label: const Text('Carbs (g)'),
                    numeric: true,
                    onSort: (int columnIndex, bool ascending) =>
                        _sort<num>((Dessert d) => d.carbs, columnIndex,
                            ascending)
                ),
                new DataColumn(
                    label: const Text('Protein (g)'),
                    numeric: true,
                    onSort: (int columnIndex, bool ascending) =>
                        _sort<num>((Dessert d) => d.protein, columnIndex,
                            ascending)
                ),
                new DataColumn(
                    label: const Text('Sodium (mg)'),
                    numeric: true,
                    onSort: (int columnIndex, bool ascending) =>
                        _sort<num>((Dessert d) => d.sodium, columnIndex,
                            ascending)
                ),
                new DataColumn(
                    label: const Text('Calcium (%)'),
                    tooltip: 'The amount of calcium as a percentage of the recommended daily amount.',
                    numeric: true,
                    onSort: (int columnIndex, bool ascending) =>
                        _sort<num>((Dessert d) => d.calcium, columnIndex,
                            ascending)
                ),
                new DataColumn(
                    label: const Text('Iron (%)'),
                    numeric: true,
                    onSort: (int columnIndex, bool ascending) =>
                        _sort<num>((Dessert d) => d.iron, columnIndex,
                            ascending)
                ),
              ],
              source: _dessertsDataSource),
        ],
      ),
    );
  }
}


//创建实体类数据
class Dessert {
  Dessert(this.name, this.calories, this.fat, this.carbs, this.protein, this.sodium, this.calcium, this.iron);
  final String name;
  final int calories;
  final double fat;
  final int carbs;
  final double protein;
  final int sodium;
  final int calcium;
  final int iron;

  bool selected = false;
}
class DessertDataSource extends DataTableSource {
  final List<Dessert> _desserts = <Dessert>[
    new Dessert('Frozen yogurt',                        159,  6.0,  24,  4.0,  87, 14,  1),
    new Dessert('Ice cream sandwich',                   237,  9.0,  37,  4.3, 129,  8,  1),
    new Dessert('Eclair',                               262, 16.0,  24,  6.0, 337,  6,  7),
    new Dessert('Cupcake',                              305,  3.7,  67,  4.3, 413,  3,  8),
    new Dessert('Gingerbread',                          356, 16.0,  49,  3.9, 327,  7, 16),
    new Dessert('Jelly bean',                           375,  0.0,  94,  0.0,  50,  0,  0),
    new Dessert('Lollipop',                             392,  0.2,  98,  0.0,  38,  0,  2),
    new Dessert('Honeycomb',                            408,  3.2,  87,  6.5, 562,  0, 45),
    new Dessert('Donut',                                452, 25.0,  51,  4.9, 326,  2, 22),
    new Dessert('KitKat',                               518, 26.0,  65,  7.0,  54, 12,  6),

    new Dessert('Frozen yogurt with sugar',             168,  6.0,  26,  4.0,  87, 14,  1),
    new Dessert('Ice cream sandwich with sugar',        246,  9.0,  39,  4.3, 129,  8,  1),
    new Dessert('Eclair with sugar',                    271, 16.0,  26,  6.0, 337,  6,  7),
    new Dessert('Cupcake with sugar',                   314,  3.7,  69,  4.3, 413,  3,  8),
    new Dessert('Gingerbread with sugar',               345, 16.0,  51,  3.9, 327,  7, 16),
    new Dessert('Jelly bean with sugar',                364,  0.0,  96,  0.0,  50,  0,  0),
    new Dessert('Lollipop with sugar',                  401,  0.2, 100,  0.0,  38,  0,  2),
    new Dessert('Honeycomb with sugar',                 417,  3.2,  89,  6.5, 562,  0, 45),
    new Dessert('Donut with sugar',                     461, 25.0,  53,  4.9, 326,  2, 22),
    new Dessert('KitKat with sugar',                    527, 26.0,  67,  7.0,  54, 12,  6),

    new Dessert('Frozen yogurt with honey',             223,  6.0,  36,  4.0,  87, 14,  1),
    new Dessert('Ice cream sandwich with honey',        301,  9.0,  49,  4.3, 129,  8,  1),
    new Dessert('Eclair with honey',                    326, 16.0,  36,  6.0, 337,  6,  7),
    new Dessert('Cupcake with honey',                   369,  3.7,  79,  4.3, 413,  3,  8),
    new Dessert('Gingerbread with honey',               420, 16.0,  61,  3.9, 327,  7, 16),
    new Dessert('Jelly bean with honey',                439,  0.0, 106,  0.0,  50,  0,  0),
    new Dessert('Lollipop with honey',                  456,  0.2, 110,  0.0,  38,  0,  2),
    new Dessert('Honeycomb with honey',                 472,  3.2,  99,  6.5, 562,  0, 45),
    new Dessert('Donut with honey',                     516, 25.0,  63,  4.9, 326,  2, 22),
    new Dessert('KitKat with honey',                    582, 26.0,  77,  7.0,  54, 12,  6),

    new Dessert('Frozen yogurt with milk',              262,  8.4,  36, 12.0, 194, 44,  1),
    new Dessert('Ice cream sandwich with milk',         339, 11.4,  49, 12.3, 236, 38,  1),
    new Dessert('Eclair with milk',                     365, 18.4,  36, 14.0, 444, 36,  7),
    new Dessert('Cupcake with milk',                    408,  6.1,  79, 12.3, 520, 33,  8),
    new Dessert('Gingerbread with milk',                459, 18.4,  61, 11.9, 434, 37, 16),
    new Dessert('Jelly bean with milk',                 478,  2.4, 106,  8.0, 157, 30,  0),
    new Dessert('Lollipop with milk',                   495,  2.6, 110,  8.0, 145, 30,  2),
    new Dessert('Honeycomb with milk',                  511,  5.6,  99, 14.5, 669, 30, 45),
    new Dessert('Donut with milk',                      555, 27.4,  63, 12.9, 433, 32, 22),
    new Dessert('KitKat with milk',                     621, 28.4,  77, 15.0, 161, 42,  6),

    new Dessert('Coconut slice and frozen yogurt',      318, 21.0,  31,  5.5,  96, 14,  7),
    new Dessert('Coconut slice and ice cream sandwich', 396, 24.0,  44,  5.8, 138,  8,  7),
    new Dessert('Coconut slice and eclair',             421, 31.0,  31,  7.5, 346,  6, 13),
    new Dessert('Coconut slice and cupcake',            464, 18.7,  74,  5.8, 422,  3, 14),
    new Dessert('Coconut slice and gingerbread',        515, 31.0,  56,  5.4, 316,  7, 22),
    new Dessert('Coconut slice and jelly bean',         534, 15.0, 101,  1.5,  59,  0,  6),
    new Dessert('Coconut slice and lollipop',           551, 15.2, 105,  1.5,  47,  0,  8),
    new Dessert('Coconut slice and honeycomb',          567, 18.2,  94,  8.0, 571,  0, 51),
    new Dessert('Coconut slice and donut',              611, 40.0,  58,  6.4, 335,  2, 28),
    new Dessert('Coconut slice and KitKat',             677, 41.0,  72,  8.5,  63, 12, 12),
  ];

  //排序
  void _sort<T>(Comparable<T> getField(Dessert d), bool ascending) {
    _desserts.sort((Dessert a, Dessert b) {
      if (!ascending) {
        final Dessert c = a;
        a = b;
        b = c;
      }
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }

  int _selectedCount = 0;

  //获取某一行
  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _desserts.length)
      return null;
    final Dessert dessert = _desserts[index];
    //带索引的创建DataRow --相当于通知系统创建某一行(索引带指某一行)
    return new DataRow.byIndex(
      //创建索引
        index: index,
        //当前行是否被选中
        selected: dessert.selected,
        //点击改变是否选中状态
        onSelectChanged: (bool value) {
          if (dessert.selected != value) {
            _selectedCount += value ? 1 : -1;
            assert(_selectedCount >= 0);
            dessert.selected = value;
            notifyListeners();
          }
        },
        //创建一行的各个元素值
        cells: <DataCell>[
          new DataCell(new Text('${dessert.name}')),
          new DataCell(new Text('${dessert.calories}')),
          new DataCell(new Text('${dessert.fat.toStringAsFixed(1)}')),
          new DataCell(new Text('${dessert.carbs}')),
          new DataCell(new Text('${dessert.protein.toStringAsFixed(1)}')),
          new DataCell(new Text('${dessert.sodium}')),
          new DataCell(new Text('${dessert.calcium}%')),
          new DataCell(new Text('${dessert.iron}%')),
        ]
    );
  }

  @override
  int get rowCount => _desserts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
    for (Dessert dessert in _desserts)
      dessert.selected = checked;
    _selectedCount = checked ? _desserts.length : 0;
    notifyListeners();
  }
}