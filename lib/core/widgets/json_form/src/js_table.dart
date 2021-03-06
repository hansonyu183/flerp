import 'dart:convert';

import 'package:flutter/material.dart';

import 'json_table/json_table.dart';

class JsTable extends StatefulWidget {
  const JsTable({Key key, this.jsonData}) : super(key: key);
  final String jsonData;
  @override
  _JsTableState createState() => _JsTableState();
}

class _JsTableState extends State<JsTable> {
  bool toggle = true;
  List<JsonTableColumn> columns;

  @override
  Widget build(BuildContext context) {
    /*List<JsonTableColumn> columns = [];
    json[0].forEach((k, v) {
      columns.add(JsonTableColumn(k, label: v.toString));
    });*/

    return JsonTable(
      <dynamic> [...jsonDecode(widget.jsonData)],
      //columns: columns,
 tableHeaderBuilder: (String header) {
     return Container(
       padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
       decoration: BoxDecoration(border: Border.all(width: 0.5),color: Colors.grey[400]),
       child: Text(
         header,
         textAlign: TextAlign.center,
         //style: Theme.of(context).textTheme.display1.copyWith(fontWeight: FontWeight.w700, fontSize: 14.0,color: Colors.black87),
       ),
     );
   },
   tableCellBuilder: (dynamic value) {
     return Container(
       padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
       //decoration: BoxDecoration(border: Border.all(width: 0.1, color: Colors.black)),
       child: TextFormField(
         initialValue: value.toString(),
         textAlign: TextAlign.left,
         //style: Theme.of(context).textTheme.display1.copyWith(fontSize: 14.0, color: Colors.grey[900]),
       ),
     );
   },
      showColumnToggle: true,
      //allowRowHighlight: true,
    );
  }
}
