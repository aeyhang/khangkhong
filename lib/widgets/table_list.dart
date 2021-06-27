import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/table_controller.dart';
import './table_item.dart';

class TableList extends StatefulWidget {
  @override
  _TableListState createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  TableController tableController = Get.find<TableController>();

  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Container(
      height: double.infinity,
      width: sizes.width - 450,
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 0),
      color: Theme.of(context).primaryColor,
      child: Obx(
        () => Scrollbar(
          isAlwaysShown: true,
          controller: _scrollController,
          child: GridView.builder(
            padding:
                const EdgeInsets.only(right: 20, left: 0, top: 0, bottom: 0),
            physics: const ClampingScrollPhysics(),
            controller: _scrollController,
            itemCount: tableController.tables.where((t) =>t.tableFlag==1).length,
            itemBuilder: (context,index){
              return TableItem(tableController.tables.where((t) => t.tableFlag==1).toList()[index]);
            },
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              mainAxisExtent: 120,
            ),
          ),
        ),
      ),
    );
  }
}
