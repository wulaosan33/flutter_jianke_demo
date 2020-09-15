
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/model/post_entity.dart';

class WatchByPagePage extends StatefulWidget {
  @override
  _WatchByPagePageState createState() => _WatchByPagePageState();
}

class _WatchByPagePageState extends State<WatchByPagePage> {

  int _sortColumnIndex = 0;
  bool _sortAscending = false;

  PostDataSource _postDataSource = PostDataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('条目分页查看'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            PaginatedDataTable(
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              header: Text("头部"),
              /// 每页数量
              rowsPerPage: 5,
              /// 全选不用实现,已经实现看
//              onSelectAll: (bool select){
//                debugPrint("onSelectAll = $select");
//              },
              columns: [
                /// 头 列 ,序号,标题
//                DataColumn(
//                  label: Text("序号"),
//                ),
                DataColumn(
                  label: Text("标题"),
                  onSort: (int columnIndex, bool ascending) {
                    setState(
                          () {
                        _sortColumnIndex = columnIndex;
                        _sortAscending = ascending;
                        /// 这里 调动 类的方法,不然不行...
                        _postDataSource.sort(ascending);
                      },
                    );
                  },
                ),
                DataColumn(
                  label: Text("图片"),
                ),
              ],
              /// 内容
              source: _postDataSource,
            ),
          ],
        ),
      ),
    );
  }
}

class PostDataSource extends DataTableSource {
  List<PostEntity> _dataList = List.from(PostEntity.dataList());

  int _selectedRowCount = 0;

  @override
  int get rowCount => _dataList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedRowCount;

  @override
  DataRow getRow(int index) {
    PostEntity entity = _dataList[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(entity.title)),
        DataCell(Image.network(entity.imageUrl)),
      ],
    );
  }

  void sort(bool sortAscending) {
    _dataList.sort((a, b) {
      if (sortAscending) {
        return int.parse(b.index).compareTo (int.parse(a.index));
      } else {
        return int.parse(a.index).compareTo (int.parse(b.index));
      }
    });
    notifyListeners();
  }

/* */ /*ascending 上升 这里排序 没看懂比较的是个啥*/ /*
  void _sort<T> (Comparable<T> getField(PostEntity d),bool ascending){
    _dataList.sort((PostEntity a, PostEntity b) {
      if (!ascending) {
        final PostEntity c = a;
        a = b;
        b = c;
      }
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }*/
}