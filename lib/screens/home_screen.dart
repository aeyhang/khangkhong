import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../widgets/menu_bar.dart';
import '../controllers/table_controller.dart';
import '../controllers/category_controller.dart';
import '../widgets/table_list.dart';

class HomeScreen extends StatelessWidget {
  final TableController tableController = Get.put(TableController());
    final CategoryController catController= Get.put(CategoryController()) ;
  static const routeNmae='/';

  @override
  Widget build(BuildContext context) {
    print('home screen');
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('hi'),
      // ),
      body: Column(
        children: [
          Container(
            // decoration: BoxDecoration(
            //   border: Border.all(color: Theme.of(context).accentColor),
            // ),
              color: Theme.of(context).accentColor,
            padding: EdgeInsets.all(0),
            height: 100,
            width: double.infinity,
            // child: Card(
            //   margin: EdgeInsets.all(0),
            //   elevation: 10,
            //   color: Theme.of(context).primaryColor,
            // ),
          ),
          Expanded(
              child: Row(
            children: [
              MenuBar(),
              Container(color: Colors.white, child: TableList()),
              // AddTableScreen(),
            ],
          ))
        ],
      ),
    );
  }
}
