import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_pos/widgets/table_action_dropdown.dart';

import '../models/table_data.dart';
import '../models/global_var.dart';
import '../widgets/table_dropdown.dart';
import '../widgets/status_dropdown.dart';

class TableDialog extends StatelessWidget {
  TableData _table;
  TableDialog(this._table);

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
                    Text('Table: '),
                    TableActionDropdown(Status.enable),
                    Text('Table: '),
                    TableDropdown(_table.id),
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
