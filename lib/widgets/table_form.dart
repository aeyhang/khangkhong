import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_pos/controllers/table_controller.dart';

import '../models/table_data.dart';

class TableForm extends StatelessWidget {
  TableController tableController = Get.find<TableController>();
  var _idController = TextEditingController();
  final _tableNameController = TextEditingController();
  final _seatsController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _tableFlagController = TextEditingController();


  void _setTableData() {
    var table = tableController.getTable();
    if (table.id != 0) {
      _idController.text = table.id.toString();
      _tableNameController.text = table.tableName;
      _seatsController.text = table.seats.toString();
      _descriptionController.text = table.description;
      _tableFlagController.text = table.tableFlag.toString();
      tableController.setSavable = true;
    } else {
      _idController.text = '';
      _tableNameController.text = '';
      _seatsController.text = '';
      _descriptionController.text = '';
      _tableFlagController.text = '';
      tableController.setSavable = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 50),
      // width: double.infinity,
      width: 300,
      child: Column(
        children: [
          Container(child: Obx(() {
            _setTableData();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'ID'),
                  controller: _idController,
                  textAlign: TextAlign.center,
                  enabled: false,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'ເບີໂຕະ'),
                  controller: _tableNameController,
                  textAlign: TextAlign.center,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'ຈຳນວນບ່ອນນັ່ງ'),
                  controller: _seatsController,
                  textAlign: TextAlign.center,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'ຫມາຍເຫດ'),
                  controller: _descriptionController,
                  textAlign: TextAlign.center,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'ສະຖານະ'),
                  controller: _tableFlagController,
                  textAlign: TextAlign.center,
                ),
              ],
            );
          })),
          SizedBox(
            height: 30,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Obx(()=> TextButton(
                  child: Text('Cancel'),
                  onPressed: tableController.getSavable()
                      ? () {
                          tableController.setTable = TableData(
                              id: 0,
                              tableName: 'none',
                              seats: 0,
                              description: 'none',
                              tableFlag: 0);
                              tableController.setSavable=false;
                        }
                      : null,
                ),
              ),
              TextButton(
                child: Text('Save'),
                onPressed: () {},
              ),
            ]),
          
        ],
      ),
    );
  }
}
