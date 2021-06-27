import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../models/table_data.dart';
import '../controllers/table_controller.dart';

class TableDetailList extends StatelessWidget {
  final TableController tableController = Get.find<TableController>();
  final List<TextEditingController> _idControllers = [];
  final List<TextEditingController> _tableNameControllers = [];
  final List<TextEditingController> _seatsControllers = [];
  final List<TextEditingController> _descriptionControllers = [];
  final List<TextEditingController> _tableFlagControllers = [];
  TableDetailList();

  void _buildTableDialog(BuildContext context, String title, int index) {
    final style = Theme.of(context).textTheme.headline1;
    Get.defaultDialog(
      barrierDismissible: false,
        title: title,
        titleStyle: style,
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
                      context, 'ລະຫັດ: ', _idControllers[index], 100),
                  _buildTableOnDialog(
                      context, 'ເບີໂຕະ: ', _tableNameControllers[index], 250),
                  _buildTableOnDialog(context, 'ຈຳນວນບ່ອນນັ່ງ: ',
                      _seatsControllers[index], 200),
                  _buildTableOnDialog(context, 'ຫມາຍເຫດ: ',
                      _descriptionControllers[index], 500),
                  _buildTableOnDialog(
                      context, 'ສະຖານະ: ', _tableFlagControllers[index], 200),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () =>Get.back(),
                      child: Text(
                        'ຍົກເລີກ',
                        style: TextStyle(fontSize: 20),
                      )),
                  SizedBox(
                    width: 50,
                  ),
                  TextButton(
                      onPressed: () {
                        updateTableData(index);
                        Get.back();
                      },
                      child: Text(
                        'ບັນທຶກ',
                        style: TextStyle(fontSize: 20),
                      )),
                ],
              )
            ],
          ),
        ));
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
        ));
  }

  void updateTableData(int index) {   
    final id=tableController.tables[tableController.tables.length-1].id+1; 
    var addResult = tableController.updateTable(
      TableData(
          id: int.parse(_idControllers[index].text),
          tableName: _tableNameControllers[index].text,
          seats: int.parse(_seatsControllers[index].text),
          description: _descriptionControllers[index].text,
          tableFlag: int.parse(_tableFlagControllers[index].text)),
    index).then((result) {
      if(result=='success'){
      }
    });
    print(addResult);
  }
  Widget _buildTableTextField(
    BuildContext context,
    TextEditingController controller,
    double width,
  ) {
    return Container(
      width: width,
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        controller: controller,
        enabled: false,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  void _initControllers() {
    _idControllers.add(TextEditingController());
    _tableNameControllers.add(TextEditingController());
    _seatsControllers.add(TextEditingController());
    _descriptionControllers.add(TextEditingController());
    _tableFlagControllers.add(TextEditingController());
  }

  void _setControllersData(TableData table, int index) {
    _idControllers[index].text = table.id.toString();
    _tableNameControllers[index].text = table.tableName;
    _seatsControllers[index].text = table.seats.toString();
    _descriptionControllers[index].text = table.description;
    _tableFlagControllers[index].text = table.tableFlag.toString();
  }

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Scrollbar(
      isAlwaysShown: true,
      child: Column(
        children: [
          Container(
            width: sizes.width - 500,
            height: sizes.height - 200,
            padding: EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 20),
            color: Theme.of(context).primaryColor,
            child:
                  Obx(
                    () => ListView.builder(
                      itemCount: tableController.tables.length,
                      itemBuilder: (context, index) {
                        final table = tableController.tables[index];
                        _initControllers();
                        _setControllersData(table, index);
                        return Card(
                            child: Container(
                          height: 70,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    _buildTableTextField(
                                        context, _idControllers[index], 100),
                                    _buildTableTextField(
                                        context, _tableNameControllers[index], 250),
                                    _buildTableTextField(
                                        context, _seatsControllers[index], 100),
                                    _buildTableTextField(
                                        context, _descriptionControllers[index], 300),
                                    _buildTableTextField(
                                        context, _tableFlagControllers[index], 200),
                                    Container(
                                      height: 70,
                                      width: 300,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                              icon: Icon(
                                                Icons.edit,
                                                color: Theme.of(context).primaryColor,
                                                size: 30,
                                              ),
                                              onPressed: () {
                                                tableController.setTable =
                                                    tableController.tables[index];
                                                _buildTableDialog(
                                                    context, 'Edit Table', index);
                                              }),
                                          SizedBox(width: 100),
                                          IconButton(
                                              icon: Icon(
                                                Icons.delete_forever,
                                                color: Colors.red,
                                                size: 30,
                                              ),
                                              onPressed: () {}),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ));
                      },
                    ),             
            ),
          ),
        ],
      ),
    );
  }
}
