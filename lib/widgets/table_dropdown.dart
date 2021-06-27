import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../models/table_data.dart';
import '../controllers/table_controller.dart';

class TableDropdown extends StatelessWidget {
  final _tableController=Get.find<TableController>();
  List<TableData>_tables=[];
  final int _tableID;
  TableDropdown(this._tableID);
  @override
  Widget build(BuildContext context) {
    _tables=_tableController.tables;
    return _buildDropDownTable(_tableID, context);
  }
  
  Widget _buildDropDownTable(int tableID, BuildContext context) {
    final headline1 = Theme.of(context).textTheme.headline1;
    var _selectedTable = _tables.firstWhere((t) => t.id == tableID);
    _tableController.setTable=_selectedTable;
    return Container(
      padding: const EdgeInsets.all(3.0),
      width: 200,
      height: 65,
      child: Center(
        child: FittedBox(
          child: Obx(
            () => DropdownButton<TableData>(
              value: _tableController.table.value,
              items: _tables.map((t) {
                return DropdownMenuItem<TableData>(
                  child: Text(
                    t.tableName,
                    textAlign: TextAlign.center,
                    style: headline1,
                  ),
                  value: t,
                );
              }).toList(),
              onChanged: (TableData? newValue) {
                _tableController.setTable=newValue!;
              },
            ),
          ),
        ),
      ),
    );
  }
}