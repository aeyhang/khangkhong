import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/table_data.dart';
import '../screens/sale_screen.dart';
import '../controllers/table_controller.dart';
import '../widgets/create_bill_dialog.dart';

class TableItem extends StatelessWidget {
  final _tableController=Get.find<TableController>();
  TableData _table;
  TableItem(this._table);
  Widget _buildTableText(String text, Color color) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: 20),
    );
  }
void _showTableDialog(BuildContext context, TableData table) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return CreateBillDialog(table);
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    Color lightColor = Theme.of(context).accentColor;
    Color darkColor = Theme.of(context).primaryColor;
    return Card(
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTableText(
                  'ເບີໂຕະ: ',
                  lightColor,
                ),
                _buildTableText(_table.tableName, darkColor),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTableText('ສະຖານະ: ', lightColor),
                _buildTableText('ວ່າງ', darkColor),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.teal),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'ສັ່ງອາຫານ',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    _tableController.setTable=_table;
                   _showTableDialog(context, _table);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
