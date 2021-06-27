import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/table_controller.dart';
import '../models/table_data.dart';
import '../widgets/table_dialog.dart';

class SaleScreen extends StatelessWidget {
  final _tableController = Get.find<TableController>();
  static const routeName = '/sale_screen';
  void _showTableDialog(BuildContext context, TableData table) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return TableDialog(table);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Center(
          child: TextButton(
            child: Obx(
              () => Text(
                _tableController.table.value.tableName,
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            onPressed: () => _showTableDialog(context, _tableController.table.value),
          ),
        ),
        actions: [
          Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  TextButton(
                    child: Text(
                      '+ ສ້າງບີນໃໝ່',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
