import 'dart:math' as math;

import 'package:flutter/material.dart';
import './paginationBox.dart';

import 'json_table_column.dart';
import 'table_column.dart';

typedef TableHeaderBuilder = Widget Function(String header);
typedef TableCellBuilder = Widget Function(dynamic value);
typedef OnRowSelect = void Function(int index, dynamic map);

class JsonTable extends StatefulWidget {
  const JsonTable(
    this.dataList, {
    Key key,
    this.tableHeaderBuilder,
    this.tableCellBuilder,
    this.columns,
    this.showColumnToggle = false,
    this.allowRowHighlight = false,
    this.rowHighlightColor,
    this.paginationRowCount,
    this.onRowSelect,
  }) : super(key: key);

  final List<dynamic> dataList;
  final TableHeaderBuilder tableHeaderBuilder;
  final TableCellBuilder tableCellBuilder;
  final List<JsonTableColumn> columns;
  final bool showColumnToggle;
  final bool allowRowHighlight;
  final Color rowHighlightColor;
  final int paginationRowCount;
  final OnRowSelect onRowSelect;

  @override
  _JsonTableState createState() => _JsonTableState();
}

class _JsonTableState extends State<JsonTable> {
  Set<String> headerList = <String>{};
  Set<String> filterHeaderList = <String>{};
  int highlightedRowIndex;
  int pageIndex = 0;
  int paginationRowCount;
  int pagesCount;
  List<Map<dynamic, dynamic>> data;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    assert(widget.dataList != null && widget.dataList.isNotEmpty);
    data = widget.dataList.cast<Map<dynamic, dynamic>>();
    pageIndex = 0;
    if (_showPagination())
      paginationRowCount =
          math.min<int>(widget.paginationRowCount, data.length);
    if (_showPagination())
      pagesCount = (data.length / paginationRowCount).ceil();
    setHeaderList();
  }

  @override
  void didUpdateWidget(JsonTable oldWidget) {
    if (oldWidget.dataList != widget.dataList) {
      init();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (widget.showColumnToggle)
            Container(
              margin: const EdgeInsets.only(bottom: 4),
              child: ExpansionTile(
                leading: const Icon(Icons.filter_list),
                title: Text(
                  '明细(${filterHeaderList.length})',
                  // style: TextStyle(
                  //   fontSize: 13,
                  //  fontWeight: FontWeight.w500,
                  //),
                ),
                children: <Widget>[
                  Align(
                      alignment: Alignment.topLeft,
                      child: Wrap(
                        //runSpacing: -12,
                        //direction: Axis.horizontal,
                        children: <Widget>[
                          for (String header in headerList)
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Checkbox(
                                      value: filterHeaderList.contains(header),
                                      onChanged: null,
                                    ),
                                    Text(header),
                                    // SizedBox(
                                    // width: 4.0,
                                    // ),
                                  ],
                                ),
                                onTap: () {
                                  setState(() {
                                    if (filterHeaderList.contains(header))
                                      filterHeaderList.remove(header);
                                    else
                                      filterHeaderList.add(header);
                                  });
                                },
                              ),
                            ),
                        ],
                      ))
                ],
              ),
            ),
          Container(
              alignment: Alignment.topLeft,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: (widget.columns != null)
                    ? Row(
                        children: widget.columns
                            .where((JsonTableColumn item) =>
                                filterHeaderList.contains(item.field))
                            .map(
                              (JsonTableColumn item) => TableColumn(
                                item.label,
                                _getPaginatedData(),
                                widget.tableHeaderBuilder,
                                widget.tableCellBuilder,
                                item,
                                onRowTap,
                                highlightedRowIndex,
                                widget.allowRowHighlight,
                                widget.rowHighlightColor,
                              ),
                            )
                            .toList(),
                      )
                    : Row(
                        children: filterHeaderList
                            .map(
                              (String header) => TableColumn(
                                header,
                                _getPaginatedData(),
                                widget.tableHeaderBuilder,
                                widget.tableCellBuilder,
                                null,
                                onRowTap,
                                highlightedRowIndex,
                                widget.allowRowHighlight,
                                widget.rowHighlightColor,
                              ),
                            )
                            .toList(),
                      ),
              )),
          if (_showPagination())
            PaginationBox(
              pageIndex: pageIndex,
              pagesCount: pagesCount,
              onLeftButtonTap: _showLeftButton()
                  ? () {
                      setState(() {
                        pageIndex--;
                      });
                    }
                  : null,
              onRightButtonTap: showRightButton()
                  ? () {
                      setState(() {
                        pageIndex++;
                      });
                    }
                  : null,
            ),
        ],
      ),
    );
  }

  Set<String> extractColumnHeaders() {
    final Set<String> headers = <String>{};
    if (widget.columns != null) {
      for (final JsonTableColumn item in widget.columns) {
        headers.add(item.field);
      }
    } else {
      for (final dynamic map in widget.dataList) {
        map.keys.forEach((String key) {
          headers.add(key);
        });
      }
    }
    return headers;
  }

  void setHeaderList() {
    final Set<String> headerList = extractColumnHeaders();
    assert(headerList != null);
    this.headerList = headerList;
    filterHeaderList.addAll(headerList);
  }

  void onRowTap(int index, dynamic rowMap) {
    setState(() {
      if (highlightedRowIndex == index)
        highlightedRowIndex = null;
      else
        highlightedRowIndex = index;
    });
    if (widget.onRowSelect != null) {
      widget.onRowSelect(index, rowMap);
    }
  }

  List<Map<dynamic, dynamic>> _getPaginatedData() {
    if (paginationRowCount != null) {
      final int startIndex =
          pageIndex == 0 ? 0 : (pageIndex * paginationRowCount);
      final int ind1 = startIndex + paginationRowCount;
      final int ind2 = data.length - 1;
      final int endIndex = math.min<int>(ind1, ind2);
      if (endIndex == data.length - 1)
        return data.sublist(startIndex, endIndex + 1).toList(growable: false);
      else
        return data.sublist(startIndex, endIndex).toList(growable: false);
    } else
      return data;
  }

  bool _showLeftButton() {
    return pageIndex > 0;
  }

  bool showRightButton() {
    return pageIndex < pagesCount - 1;
  }

  bool _showPagination() {
    return widget.paginationRowCount != null;
  }
}
