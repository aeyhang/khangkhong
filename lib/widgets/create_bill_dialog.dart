import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/customer.dart';
import '../models/table_data.dart';
import '../controllers/customer_controller.dart';
import '../widgets/customer_dropdown.dart';

class CreateBillDialog extends StatelessWidget {
  final TableData _table;
  CreateBillDialog(this._table);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        Container(
            height: 300,
            width: 500,
            child: Column(
              children: [
                Text(
                  _table.tableName,
                  style: Theme.of(context).textTheme.headline2,
                ),
                Row(
                  children: [
                    Text('Customer: '),
                    CustomerDropdown(),
                  ],
                ),
                TextButton(
                  child: Text('Close'),
                  onPressed: () => Get.back(),
                ),
              ],
            ))
      ],
    );
  }
}
