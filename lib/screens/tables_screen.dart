import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/table_controller.dart';
import '../widgets/table_detail_list.dart';
import '../models/table_data.dart';

class TablesScreen extends StatelessWidget {
  final TableController tableController = Get.put(TableController());
  static const routeName = '/tables_screen';

  final _tableNameController = TextEditingController();
  final _seatsController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _tableFlagController = TextEditingController();

  Widget _buildTableHeader(BuildContext context, String text, double width) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      width: width,
      child: Row(
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.headline1,
          ),
        ],
      ),
    );
  }

  Widget _buildTableOnDialog(BuildContext context, String title,
      TextEditingController controller, double width) {
    final style = Theme.of(context).textTheme.headline1;

    return Container(
      width: width,
      child: Column(
        children: [
          Text(title, style: style),
          Container(
            child: TextField(
              textAlign: TextAlign.center,
              controller: controller,
              enabled: true,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  void _buildTableDialog(BuildContext context) {
    final style = Theme.of(context).textTheme.headline1;
    Get.defaultDialog(
      barrierDismissible: false,
      title: 'ເພີ່ມໂຕະໃຫມ່',
      titleStyle: style,
    textConfirm: 'OK',
    onConfirm: addTableData,
      content: Container(
        padding: EdgeInsets.all(20),
        height: 200,
        width: MediaQuery.of(context).size.width - 500,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTableOnDialog(
                    context, 'ເບີໂຕະ: ', _tableNameController, 250),
                _buildTableOnDialog(
                    context, 'ຈຳນວນບ່ອນນັ່ງ: ', _seatsController, 200),
                _buildTableOnDialog(
                    context, 'ຫມາຍເຫດ: ', _descriptionController, 500),
                _buildTableOnDialog(
                    context, 'ສະຖານະ: ', _tableFlagController, 200),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () => Get.back(),
                    child: Text(
                      'ຍົກເລີກ',
                      style: TextStyle(fontSize: 20),
                    )),
                SizedBox(
                  width: 50,
                ),
                TextButton(
                    onPressed:(){ 
                      addTableData();
                      Get.back();
                      },
                    child: Text(
                      'ບັນທຶກ',
                      style: TextStyle(fontSize: 20),
                    )),
                SizedBox(
                  width: 50,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void addTableData() {   
    final id=tableController.tables[tableController.tables.length-1].id+1; 
    var addResult = tableController.addTable(
      TableData(
          id: id,
          tableName: _tableNameController.text,
          seats: int.parse(_seatsController.text),
          description: _descriptionController.text,
          tableFlag: int.parse(_tableFlagController.text)),
    ).then((result) {
      if(result=='success'){
      }
    });
    print(addResult);
  }
  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              // IconButton(
              //   icon: Icon(Icons.arrow_back),
              //   onPressed: () => Get.back(),
              // ),
            ],
          ),
          actions: [
            Row(
              children: [
                TextButton(
                  child: Text(
                    'ເພີ່ມໂຕະໃຫມ່',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onPressed: () => _buildTableDialog(context),
                ),
                SizedBox(
                  width: 20,
                ),
                IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 25,
                  ),
                  onPressed:() => _buildTableDialog(context) ,
                ),
                SizedBox(
                  width: 20,
                )
              ],
            )
          ],
        ),
        body: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    width: sizes.width - 500,
                    height: 100,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildTableHeader(context, 'ລະຫັດໂຕະ', 120),
                        _buildTableHeader(context, 'ເບີໂຕະ', 220),
                        _buildTableHeader(context, 'ຈຳນວນບ່ອນນັ່ງ', 150),
                        _buildTableHeader(context, 'ຫມາຍເຫດ', 300),
                        _buildTableHeader(context, 'ສະຖານະ', 100),
                        _buildTableHeader(context, 'ແກ້ໄຂ / ລຶບ', 350),
                      ],
                    ),
                  ),
                  TableDetailList(),
                ],
              ),
            ],
          ),
        ));
  }
}
