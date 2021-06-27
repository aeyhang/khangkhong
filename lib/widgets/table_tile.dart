import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/table_controller.dart';

class TableTile extends StatelessWidget {
  final int index;
  TableTile(this.index);
  final tableController = Get.find<TableController>();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Obx(
        () {
          return Row(
            children: [
              Container(
                  padding: EdgeInsets.all(10),
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.teal, width: 2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'ເບີໂຕະ:',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            tableController.tables[index].tableName,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          );
        },
      ),
    );
  }
}
