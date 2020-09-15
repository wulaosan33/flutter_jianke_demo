
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/model/post_entity.dart';

class WatchPage extends StatefulWidget {
  @override
  _WatchPageState createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage> {

  int _sortColumnIndex = 0;
  bool _sortAscending = false;

  List<PostEntity> dataList = List.from(PostEntity.dataList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('条目浏览'),
      ),
      body: ListView(
        children: [
          DataTable(
            sortColumnIndex: _sortColumnIndex,
            sortAscending: _sortAscending,
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
                  setState(() {
                    _sortColumnIndex = columnIndex;
                    _sortAscending = ascending;

                    dataList.sort((a, b) {
                      if (_sortAscending) {
                        return int.parse(b.index).compareTo (int.parse(a.index));
                      } else {
                        return int.parse(a.index).compareTo (int.parse(b.index));
                      }
                    });
                  });
                },
              ),
              DataColumn(
                label: Text("图片"),
              ),
              DataColumn(
                label: Text("作者"),
              ),
            ],

            /// 内容
            rows: dataList.asMap().keys.map((index) {
              PostEntity entity = dataList[index];
              return DataRow(
                /// 是否选择
                  selected: entity.selected,
                  /// 点击选择变化
                  onSelectChanged: (bool select) {
                    setState(() {
                      entity.selected = select;
                    });
                  },
                  /// cells
                  cells: [
                    DataCell(Text(entity.title)),
                    DataCell(Image.network(entity.imageUrl)),
                    DataCell(Text(entity.author)),
                  ]);
            }).toList(),
          ),
        ],
      ),
    );
  }
}